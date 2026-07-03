Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D0B38D;
	Fri,  3 Jul 2026 00:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037366; cv=pass; b=gf3FZ95U5DGETI1hcMl+5ZAEOdSKv07bgJvwvpPIwB4r3S4ipgk2QShprwxAY6Kg9QiGNppQ8hp51ws6QjoaUqLi49BTHLvwRBnuauWHz+ZUxKCIMvl0ZCG9+0v9iK/gmudfL325ThQVBDCwK3QbRh5kj3znaga3FFQIp8STRAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037366; c=relaxed/simple;
	bh=9+B4MmT8SD6ErYA7ljhnrlK72zyGONcNT+2o0/mqAI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZXNwdgU6B9/aGxYl5RVs2kZO1hh2jSvqfId36eB64Hd3nLyZpMd/0/9OBMo6Dy+1TCOjYcDYwb5wVjK9akMpFfMhDBy6iLY3RDzhgRatkqYOcyUrQBHqDldcrT7dE5SOmEEqsVHUl2MwWw0n4f7oAE3z4cO5Tru9ILPExkOxHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=XlW4menU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="XlW4menU"
ARC-Seal: i=1; a=rsa-sha256; t=1783037355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mr/FbwXnfg+YWqlfi3uJDECfJxRoLnMauBpHUCmEABn/f9+Wv7eDP+sBQenR4DMQIojpVbAH2GFX1U2JayPkp+QuBOJ/M4uPRnXchBSzWwQCzyVcTAG0vXSN1n2d9Yw/3lQBzb7N3hfsjJ7FNWn2Ob3Bh+aWcylPKbhGueTdwMY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783037355; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wVwlz7KY4OjwKxXVf+jclndJnHMIuujVv9yJeczv1/Y=; 
	b=OvNsPWzlQ/2w30bBYCyp2ETR23Qj7xsaBaMGvmpdFrlCSkbFMoHYtDcqnP5hCzXKHjhXKWyNKXWcyZOTsiZFD4MaBpIrxeoA4QW6GJeXEk4Hsd15if/AhWfLyIXckl9sP8SJuiS4/vVOZTNjOcWN1mPSSNja0EBqyr8eGgjsWoE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783037355;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=wVwlz7KY4OjwKxXVf+jclndJnHMIuujVv9yJeczv1/Y=;
	b=XlW4menUhVcCijMsn/8NtaOrAUR0LeftsuVNWdOcr2ycbEunCaaD7/59037HbLPK
	L6oiTtwqqivp9igqDZ3n2ZvoYQ15BXRUz20OG+Sne5Gbd45B+ivjRg3ua/gdfkG9vk+
	4AfD4DsSgov5QJYL5JPycJWJUUD6UNtPoyqy4m6U=
Received: by mx.zohomail.com with SMTPS id 1783037354883620.9266575194131;
	Thu, 2 Jul 2026 17:09:14 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:09:14 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com, acourbot@nvidia.com,
	ecourtney@nvidia.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu,
	boris.brezillon@collabora.com, lyude@redhat.com,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 00/19] rust: drm: Higher-Ranked Lifetime private data
Message-ID: <akb9qlNBlslAQSK1@um790>
References: <20260628145406.2107056-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628145406.2107056-1-dakr@kernel.org>

On Sun, Jun 28, 2026 at 04:53:20PM +0200, Danilo Krummrich wrote:
> DRM ioctls run in process context without any guarantee that the parent
> bus device is still bound. This series solves the problem by introducing
> RegistrationGuard -- a guard representing a drm_dev_enter/exit SRCU
> critical section that proves the parent bus device is bound for the
> lifetime of the guard.
> 
> As initial plumbing for this, the DRM DeviceContext typestates are
> reworked: Uninit is renamed to Normal, defaults are adjusted,
> AlwaysRefCounted is restricted to Normal, and a Deref chain from
> Device<T, Registered> to Device<T, Normal> is established. This gives
> Device<T, Registered> the semantic that the device is currently
> registered and the parent bus device is bound, which makes the
> RegistrationGuard and ioctl dispatch much cleaner. An Ioctl context
> restricts registration_guard() to ioctl dispatch, where the DRM core
> guarantees prior registration.
> 
> On top of that, add RegistrationData as a GAT (Generic Associated Type)
> on drm::Driver, allowing drivers to store data whose lifetime is tied to
> the parent bus device binding scope. The data is allocated in
> Registration::new(), lifetime-erased to 'static for storage, and made
> accessible through Device<T, Registered>::registration_data_with(). The
> closure's HRTB ties the lifetime to the closure scope; internally the
> 'static pointer is cast back to the closure-scoped lifetime. The
> reference is valid for the duration of the drm_dev_enter/exit critical
> section held by RegistrationGuard.
> 
> Also update the ioctl dispatch macro to wrap every handler in a
> RegistrationGuard, returning ENODEV if the device has been unplugged,
> and pass the registration data to handlers.
> 
> A branch with all patches can be found in [1].
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=drm-lifetime

Thanks Danilo, I tested this whole series with Tyr today and it is
working for me without any issues. It's included in latest branch
https://gitlab.freedesktop.org/panfrost/linux/-/commits/tyr-for-upstream

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> 
> Changes in v5:
> - Replace __call_ioctl() helper with a simple for<'a> fn(...) coercion
> - Rebase onto latest drm-rust-next, which requires a faux::Device type with
>   AsBusDevice impl and motivates the removal of the DeviceContext generic from
>   shmem::Object entirely
> - Replace ForLt with a GAT type RegistrationData<'a>
> - Fix drm_dev_register() error path race on the C side
> - Add a few missing #[inline] annotations
> 
> Changes in v4:
> - Fix pre-existing unbounded lifetimes in ioctl handler arguments.
> - Fix registration_guard() being callable on unregistered devices by
>   introducing an Ioctl device context typestate; registration_guard() is
>   now only available on Device<T, Ioctl>, which is exclusively
>   constructed in ioctl dispatch context where the DRM core guarantees
>   prior registration.
> - Fix type inference allowing handlers to obtain Device<Registered>
>   before RegistrationGuard is acquired.
> - Make RegistrationGuard !Send via NotThreadSafe to prevent potential
>   lockdep splats from cross-thread SRCU unlock.
> - Store &Device<T, Registered> directly in RegistrationGuard instead of
>   calling assume_ctx() in Deref.
> 
> Changes in v3:
> - Rename UnbindGuard to RegistrationGuard
> - RegistrationGuard no longer dereferences to &Device<Bound>; it
>   dereferences to &drm::Device<T, Registered> instead
> - Drop Registration::new() and rename Registration::new_with_lt() to
>   Registration::new()
> - Rework DeviceContext typestates: rename Uninit to Normal, restrict
>   AlwaysRefCounted to Normal, establish Deref chain from Registered
>   to Normal
> - Add AsRef<ParentDevice<Bound>> on Device<T, Registered> for parent
>   device access
> - Move registration_data_with() from RegistrationGuard to
>   drm::Device<T, Registered>
> - Ioctl handlers no longer receive &Device<Bound>, only registration
>   data and drm::Device<T, Registered>
> - Use Device<Registered>::as_ref() to access parent device in nova-drm
> 
> Changes in v2:
> - Replace unsafe direct registration data access in ioctl dispatch with
>   safe UnbindGuard::registration_data_with() closure
> - Eliminate unbind_guard() free function; use type-inference anchor to
>   enable direct dev.unbind_guard() method call in the ioctl macro
> - UnbindGuard::registration_data_with() provides both parent device and
>   registration data to the closure
> - Add nova-drm conversion patch demonstrating lifetime-aware registration
>   data with &'bound auxiliary::Device<Bound>
> - Various safety comment and documentation improvements
> 
> Danilo Krummrich (19):
>   rust: drm: ioctl: fix unbounded lifetimes in ioctl handler arguments
>   rust: drm: rename Uninit DeviceContext to Normal
>   rust: faux: add Device type with AsBusDevice support
>   rust: drm: Add Driver::ParentDevice associated type
>   rust: drm: change default DeviceContext to Normal
>   rust: drm: restrict AlwaysRefCounted to Normal Device context
>   rust: drm: restrict AlwaysRefCounted to Normal GEM Object context
>   rust: drm/gem: remove DeviceContext from shmem::Object
>   rust: drm: split Deref for Device context typestates
>   rust: drm: pin ioctl Device reference to Normal context
>   rust: drm: add Ioctl device context typestate
>   rust: drm: Add RegistrationGuard for drm_dev_enter/exit critical
>     sections
>   rust: drm: Wrap ioctl dispatch in RegistrationGuard
>   rust: drm: return ParentDevice from Device AsRef
>   rust: drm: add AsRef<ParentDevice<Bound>> for Device<Registered>
>   drm: fix race between partial drm_dev_register() failure and ioctl
>   rust: drm: Add RegistrationData to drm::Driver
>   rust: drm: Pass registration data to ioctl handlers
>   drm: nova: Use drm::Device<Registered> to access the parent bus device
> 
>  drivers/gpu/drm/drm_drv.c        |  34 +++-
>  drivers/gpu/drm/nova/driver.rs   |  38 ++--
>  drivers/gpu/drm/nova/file.rs     |  22 ++-
>  drivers/gpu/drm/nova/gem.rs      |  18 +-
>  drivers/gpu/drm/tyr/driver.rs    |  25 ++-
>  drivers/gpu/drm/tyr/file.rs      |   8 +-
>  drivers/gpu/drm/tyr/gem.rs       |  11 +-
>  rust/kernel/drm/device.rs        | 293 +++++++++++++++++++++++--------
>  rust/kernel/drm/driver.rs        | 111 +++++++-----
>  rust/kernel/drm/gem/mod.rs       |  98 +++++------
>  rust/kernel/drm/gem/shmem.rs     | 257 +++++++++++++--------------
>  rust/kernel/drm/ioctl.rs         |  56 +++++-
>  rust/kernel/drm/mod.rs           |   4 +-
>  rust/kernel/faux.rs              |  69 ++++++--
>  samples/rust/rust_driver_faux.rs |   3 +-
>  15 files changed, 660 insertions(+), 387 deletions(-)
> 
> 
> base-commit: fa8cc4e3067f958ea2057f37a8a6f9c6b10a9c03
> -- 
> 2.54.0
> 
