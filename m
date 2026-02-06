Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD58430BB81;
	Fri,  6 Feb 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389570; cv=none; b=VwDdtXllSaysJtUNmBzgKYLRQGNQdJy0XBJHA/gfSB7Yn5sqoFBDtIJTSWQ2fIp5PJCeNj2M18UPSt2cEL66AkIk7QpJ5J5NT//pZKuEURkpoZ2nsPrLVLH3C46fuk8NIS4gcJNCAAAEUwDCsJ74E6K2nPo2jqmsED6HFx/TkKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389570; c=relaxed/simple;
	bh=V7zEXtwShAVZCWYoLoOLgKCQqH7cTcxMdqYnBhX9nlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSDKdzQ1YFlTZT504NRJKyzXegMxSeQuzi7wwHmzK0gpSfn3hlC8eqVuuZH0huaLqRdn2qy2IMZCpmC9Mc0FksDyoGei3cZrhCFtdkggmTcBdHSz/yKXHJL57DLPGUAT+/oyHPE3Vx1Pk9f+rbLahszQKVkd+ke8E2zG0/zXDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QtC+rRJV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QtC+rRJV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC22DC116C6;
	Fri,  6 Feb 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770389570;
	bh=V7zEXtwShAVZCWYoLoOLgKCQqH7cTcxMdqYnBhX9nlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtC+rRJVCysQ+wepka65+a6cVz4XY8XFnlaONL2rkkl1UdeNx8Hjqta75j7PJmV4Q
	 iuX2rVBkEIOIAgO/sBbSLvPASKkmOc1cKsRrFQdKBZz/9jYbmJzHCCkMNQvjbXkVAw
	 oPqOfWbPVC/ctdBlZ9PXVa/H+VCGDpPkQtX2hCOs=
Date: Fri, 6 Feb 2026 15:52:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Markus Probst <markus.probst@posteo.de>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
Message-ID: <2026020624-fantasy-dwelling-0f7c@gregkh>
References: <20260205222529.91465-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205222529.91465-1-dakr@kernel.org>

On Thu, Feb 05, 2026 at 11:25:15PM +0100, Danilo Krummrich wrote:
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
> 	task:rmmod           state:D stack:0     pid:1331  tgid:1331  ppid:1330   task_flags:0x400100 flags:0x00000010
> 	Call trace:
> 	 __switch_to+0x190/0x294 (T)
> 	 __schedule+0x878/0xf10
> 	 schedule+0x4c/0xcc
> 	 schedule_timeout+0x44/0x118
> 	 wait_for_common+0xc0/0x18c
> 	 wait_for_completion+0x18/0x24
> 	 _RINvNtCs4gKlGRWyJ5S_4core3ptr13drop_in_placeINtNtNtCsgzhNYVB7wSz_6kernel4sync3arc3ArcINtNtBN_6devres6DevresmEEECsRdyc7Hyps3_15rust_driver_pci+0x68/0xe8 [rust_driver_pci]
> 	 _RINvNvNtCsgzhNYVB7wSz_6kernel6devres16register_foreign8callbackINtNtCs4gKlGRWyJ5S_4core3pin3PinINtNtNtB6_5alloc4kbox3BoxINtNtNtB6_4sync3arc3ArcINtB4_6DevresmEENtNtB1A_9allocator7KmallocEEECsRdyc7Hyps3_15rust_driver_pci+0x34/0xc8 [rust_driver_pci]
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
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.E2.9C.94.20Deadlock.20caused.20by.20nested.20Devres/with/571242651
> Reported-by: Markus Probst <markus.probst@posteo.de>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/.E2.9C.94.20Devres.20inside.20Devres.20stuck.20on.20cleanup/with/571239721
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Closes: https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/56#note_3282757
> Fixes: f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs | 148 +++++++++++-------------------------------
>  1 file changed, 39 insertions(+), 109 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
