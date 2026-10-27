Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111806;
	b=mm9aSPLrOm3yF+nhRjVf8Nik3vm6Tu0Fc0WdajKCelPSk0ek3CjB3OynR7quJbQsejT+
	 S4clAc1vQCxOlEhDYWcgSpFCcfL4SOrB8b7KIhaJis2pSlMuR041LO0umDblNUvmhNl+Y
	 tC/5PhiPxtHw6N+AaVwa+XpZlL3uQ+c6POn9cP594v3AebiyECc7cK6ASg3ZjAsLpRzeB
	 ILJeRHGuDwulkGHPxZ6HNnUfNBjhzrCvPGNAjYqJ9fstMd+rZkcmNg/3RAPO8wk0yHNdX
	 YG8JmSE46Q2vHVMCYXg3377lP7M2HrFl9YCIVmD9yJ/D+ehta//HCRKBwHH+/SGJPxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111806;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GuBxfQiQ66SgBIv1gyaI0DasM6bhvhiFiAS058Y/l1o=;
	b=wT7vnyf7pgr0qMfFAOc9797j5YO/8VTuxedn3WUfwXCH3d+r1Lq4XfU24yNhJkU5lra+
	 o8+JCgFBXqMLP1jFN1K1HOka/DcrplAXPjMzjDV7v6cK8E+wywZ5Ulihtt1toF0rYzkDg
	 giTneXRMgUghQN34dGn1+NP9H/AybGyRF0Ixf+PO05S3h2dPnjIWM9AxBUmUEYud86xwo
	 /Rhqu7akg31kiAi+dJdWK79YXljoHJi/Bln4UVVhZiWxHpwY2A9HqoIt6vEXgqfBKW801
	 7cxLSOrMfKg1UF60BAoFoxr935skC+cDqMEMS/ad6qmfulzzehWd+nSbRnob0G5fm4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljQ+UH33;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB637606A31A;
	Tue, 27 Oct 2026 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljQ+UH33
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426C61F01825;
	Tue, 27 Oct 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793111805;
	bh=GuBxfQiQ66SgBIv1gyaI0DasM6bhvhiFiAS058Y/l1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ljQ+UH33kk6WoZr/5fRlBhs74tugQyrxlJaTYQCHaZuU8aJd4x4MwFjyIfHnFKuMs
	 fxG9izq0U4ypyqQZlM5JEIRm5KzcwpFgULIsW/vG+ie7hKa5CeC6n7KrWw4G8PSr3J
	 CSkzzt0VM4273Thmp6GfEVd7bqgpO7+rZER2FuW6SlWDroxPr5Uilk7xney4kaF88O
	 EMwlvyKZgIoOfXlaXmq1CY6OSfDEsMdTOITAriuOGiv7s9ypgqlCnlpdiABg312UiZ
	 DjimjqtAB6SFOKAo+L37bPSvoKAomdU1m5R4XPhBtTir9dXGooAHmp/R4u1hmqZFc+
	 93Y+7mav+mfNA==
Date: Tue, 27 Oct 2026 04:36:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Meta kernel team <kernel-team@meta.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] kernfs: avoid READ_ONCE() on a kgid_t in
 kernfs_new_node()
Message-ID: <auC2_Phxf55Py5km@slm.duckdns.org>
References: <20261027143247.3537239-1-shakeel.butt@linux.dev>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027143247.3537239-1-shakeel.butt@linux.dev>

On Tue, Oct 27, 2026 at 07:32:47AM -0700, Shakeel Butt wrote:
> kernfs_new_node() reads the parent's gid with READ_ONCE(attrs->ia_gid).
> That gid is a kgid_t, which is a struct.
> 
> On SMP alpha, READ_ONCE() ends by casting the value it loaded back to
> the type of its argument. Here that is a cast from a struct to the same
> struct. GCC accepts that as an extension, but ISO C does not allow a
> cast to or from a struct type, so sparse warns:
> 
>   fs/kernfs/dir.c:751:31: sparse: sparse: cast to non-scalar
>   fs/kernfs/dir.c:751:31: sparse: sparse: cast from non-scalar
> 
> Read the gid_t inside the kgid_t instead, and wrap it back up with
> KGIDT_INIT(). This is still a single marked load of the same four bytes.
> 
> There is no functional change. With GCC 12 for alpha (the config from
> the report) and GCC 14 for x86-64 (with and without KCSAN),
> fs/kernfs/dir.o has the same object code before and after this change.
> 
> Fixes: 81bdc85b4c08 ("kernfs: fix up the unlocked attribute reads on the creation paths")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610261608.vItiXCGW-lkp@intel.com/
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
