Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DE479CD;
	Sat,  7 Feb 2026 00:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770423360; cv=none; b=A10YDsIkGTXqDPrQ7W1TN8zwjfjk9vlhc/SPls7gKD/LUmfENHqj/NPKXUDAWUq5tI8veifT/XO5EPN/2dXXxKRKwG27KQ2ogeuKeXukm7tVW26vk5ypkr9CiYZMKuKkAkwDGElaK9urhLbmjTHVmw3tYsoTgD8fKsxaVdjBF2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770423360; c=relaxed/simple;
	bh=VrELGtfH2BxYGz8ThJZ8UMieyFKHZi/4AFgZxemJBWU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=NyWlb+AIioiK/dcVIcDuTGc5IeYXI/ohxrpJZSHD9n/2GVkS3XgNoe3p0u7uCr4qqibK3iByEWvmZG6xCcEyM2VUwA24xf4nHvb1BvKcBVebqppCO5QXugONW5Gc+eGzVxRnzalshjcDXGAe7LqfZFPYZU6RrZfgo07A5NB7Zww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsPvCGXG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsPvCGXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD3C116C6;
	Sat,  7 Feb 2026 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770423360;
	bh=VrELGtfH2BxYGz8ThJZ8UMieyFKHZi/4AFgZxemJBWU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=CsPvCGXGoviPh1XqazgylZQJfnj3PzGFynrFCi9q7mzsEGFn1sgX5lpcLQHuguz4F
	 nTLLB6fa3990uFN/Dr7Ox0XKQzWUAaDFqsL7XsAZNnycDLTG0llIlOnvsjJ5IAN1RQ
	 gQjZJufMpXW9Cejecp66tVy39guX4AOB8i56LdNf1qyWypcSh5QPHsSgB00ErnuPVZ
	 iUoBq1zN7TQDDSyrNN8LI/JaPfcddzBWFKhz2lOpP0joxUq7+esACGpFa6AS22UhOe
	 UjVd+iuZ/f9+QbpntsMd/3UT3Rcf1dMykE/EOyRNv1V2qoKHX8NQglw550ezui3dgb
	 pMh7vXIOTND7g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Feb 2026 01:15:55 +0100
Message-Id: <DG8AP9IH4BW7.ZIQWZKXNNH0U@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Markus Probst" <markus.probst@posteo.de>
References: <20260205222529.91465-1-dakr@kernel.org>
In-Reply-To: <20260205222529.91465-1-dakr@kernel.org>

On Thu Feb 5, 2026 at 11:25 PM CET, Danilo Krummrich wrote:
> Commit f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc") did
> attempt to optimize away the internal reference count of Devres.
>
> However, without an internal reference count, we can't support cases
> where Devres is indirectly nested, resulting into a deadlock.
>
> Such indirect nesting easily happens in the following way:
>
> A registration object (which is guarded by devres) hold a reference
> count of an object that holds a device resource guarded by devres
> itself.
>
> For instance a drm::Registration holds a reference of a drm::Device. The
> drm::Device itself holds a device resource in its private data.
>
> When the drm::Registration is dropped by devres, and it happens that it
> did hold the last reference count of the drm::Device, it also drops the
> device resource, which is guarded by devres itself.
>
> Thus, resulting into a deadlock in the Devres destructor of the device
> resource, as in the following backtrace.
>
> 	sysrq: Show Blocked State
> 	task:rmmod           state:D stack:0     pid:1331  tgid:1331  ppid:1330 =
  task_flags:0x400100 flags:0x00000010
> 	Call trace:
> 	 __switch_to+0x190/0x294 (T)
> 	 __schedule+0x878/0xf10
> 	 schedule+0x4c/0xcc
> 	 schedule_timeout+0x44/0x118
> 	 wait_for_common+0xc0/0x18c
> 	 wait_for_completion+0x18/0x24
> 	 _RINvNtCs4gKlGRWyJ5S_4core3ptr13drop_in_placeINtNtNtCsgzhNYVB7wSz_6kern=
el4sync3arc3ArcINtNtBN_6devres6DevresmEEECsRdyc7Hyps3_15rust_driver_pci+0x6=
8/0xe8 [rust_driver_pci]
> 	 _RINvNvNtCsgzhNYVB7wSz_6kernel6devres16register_foreign8callbackINtNtCs=
4gKlGRWyJ5S_4core3pin3PinINtNtNtB6_5alloc4kbox3BoxINtNtNtB6_4sync3arc3ArcIN=
tB4_6DevresmEENtNtB1A_9allocator7KmallocEEECsRdyc7Hyps3_15rust_driver_pci+0=
x34/0xc8 [rust_driver_pci]
> 	 devm_action_release+0x14/0x20
> 	 devres_release_all+0xb8/0x118
> 	 device_release_driver_internal+0x1c4/0x28c
> 	 driver_detach+0x94/0xd4
> 	 bus_remove_driver+0xdc/0x11c
> 	 driver_unregister+0x34/0x58
> 	 pci_unregister_driver+0x20/0x80
> 	 __arm64_sys_delete_module+0x1d8/0x254
> 	 invoke_syscall+0x40/0xcc
> 	 el0_svc_common+0x8c/0xd8
> 	 do_el0_svc+0x1c/0x28
> 	 el0_svc+0x54/0x1d4
> 	 el0t_64_sync_handler+0x84/0x12c
> 	 el0t_64_sync+0x198/0x19c
>
> In order to fix this, re-introduce the internal reference count.
>
> Reported-by: Boris Brezillon <boris.brezillon@collabora.com>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/.E2.9C.94.20Deadlock.20caused.20by.20nested.20Devres/with/57124265=
1
> Reported-by: Markus Probst <markus.probst@posteo.de>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/.E2.9C.94.20Devres.20inside.20Devres.20stuck.20on.20cleanup/with/5=
71239721
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/56=
#note_3282757
> Fixes: f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!

    [ Call clone() prior to devm_add_action(). - Danilo ]
