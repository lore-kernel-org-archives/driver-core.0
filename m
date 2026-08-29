Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921641FE47B
	for <driver-core@lists.linux.dev>; Sat, 29 Aug 2026 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963848; cv=none; b=WCGfdalPC18D7LIFjzExFoSCwKInDQ8c1ohXqz0ao8rfUak3ZlrimkxwE7DfsZGI95jVLcSWE06ClinJi+UIJoyCiCGW+lJDUj8XOy+pF+fO58hkS9VqaBvm11pD5mOaeO1zWFFFPuo1QHXV5CbBQKrF1ZO4uLj5H1/LOVWGE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963848; c=relaxed/simple;
	bh=OtxXdRbEIGEUvC22NlhP7/3e6oEXzFZ8KbdBRC4HXds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuDbLBSeVqh2alVp2GUT2PaFJZ4f6BmP4y5ESGDGIdN+pUNXvLn25TMcOssy2Hc/+Y9TxiLCslCKBenkzotl+JOvGi3hzKaRagvlbaAlv6IWnd1+0mEhSu+7BkawPbfNv7gNaHPHlAIQ8IQg8gcp8sIqp4y4hhnjk6muoZt2yA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LsgTQY9Y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LsgTQY9Y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdf36f63dso39585ad.0
        for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787963846; x=1788568646; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9wbpSofY68EGnEexQqy0QFzqyttXM3qSmfFpYwxrkcA=;
        b=LsgTQY9YYfvD0d2+EkyCsRLUmIBhh1ABNxwO/kya3xg2WGvImhtFC8rDIlDxDKV3OW
         pfH4RFZIVxBml32MaDaF1krf3NQ6Z1DsvgA4ZzOjSkojFCBNVPbMax5+wBMZhXifmTyd
         EMJ7onukh0LJ5j/MmJbevFgMsEh/GVILkGCsaB0uZEA8kxqAk8sEqTWWCpaaYLML+wc6
         bFX8h1XMiH1zWKDkY35EAY6tQvOdHFJJfpCwDbbPRCCuyYrDuBxpg+BsYWmhSnRoMrjK
         S7c6TN7BLHag5s86n3B1wYi8G0wEno8+zDUjg0CZ+TLlPqCfq1h/X+oZEep8GgYHhD03
         W1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787963846; x=1788568646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wbpSofY68EGnEexQqy0QFzqyttXM3qSmfFpYwxrkcA=;
        b=Iko4Z6I9yJeWGKEQOirboy+6oScb6JriIKA64VGpBqq2/BsIrsDWlvx2SEsZIT19mm
         dyYlHS08+7xQEnoddi2T+mIsM4R3+xS178ztMxIjnkvGRPFwaASNNf7sadFotUAJe1N3
         LYaGxZ1oh3HvADEY/zs916mgGc/L4ubqdBMlyuGdxlSTIszoJh6Vq9/fSTQ4ztPQkqA9
         hB2/CbIS/Cu9cr0MXevsPjh1D3Ls1cKkHql3kg0tXB0GXxPh2Q/P6qGq4R8xH+eJdrTa
         4cvcDuIxGXpoyqWG+oJMPxbYl+cAAL/qXql01mbfC6U3R4CNa/sHwCqDplMZFsF5nsHR
         olJQ==
X-Forwarded-Encrypted: i=1; AKwUvByVGj1bxPK8+mR5huQTFZTxBMhrmmREHyVXMj85AjSzGwQvUww2EXGtIP522MDv4+tfEJeVu3o0E6Y9Kw==@lists.linux.dev
X-Gm-Message-State: AFuF++mPRTntBIHEKqBv7rSlzRVPXppNEPcqzdzztsIe5Rt7Gskp5vQl
	bPOCrdCzXuOn/J64IhVLy0O/fkpgBG7TPXGggHuKiTeprsd8IamMeq+BYyxPq+yAow==
X-Gm-Gg: AYBFou1ZFRQ7xZ0wEaNuDAr2GRkJ7St/bkYCW4Vv2+dTrtMznF1RGQnBgwyym4a+036
	5fB7uLTY4ngLHhqLf/yxF9yL6Em61dHxeEFlgWzpj07g6aYHVzY9Yu1vlzo/m5ZmyRKW5mQCvSV
	lXVzRJeh9q1A5DajmbesB0BlbbjXBw1GsVwmGzAhywRDE10y8cxUdOQMefacsxs7JVw6NQlT0Oy
	Wbn/8ZN0yas6o26dXENmpPIPa9/pgNlerEpM8OQOmxhaI45WeN/6v8LnK07KKHLD0t8jy9eDgjX
	qM0gFhFBC1366/9evGV8KQ8JkYFsFje9AiuFUCiCGO/yHmrgpht5pUYgs1wXktsKdvxz8Z0abts
	3KJLangYEueg8s20q1F/bQ11k/55LSFADZ1KSiTEGmNvOhLXQKGF/XYylLVevCmOZ9Z3jB7CZpB
	S8GBeGLDYs35mrRjAZYpNJS5tJZWpRzRDvWIoejVbZNU5lfTKBHqBxOHANFPHw0RZZnDmx3R5WW
	qbU81bDYDyNEAasMWLdieQzS0dlFss=
X-Received: by 2002:a17:902:f642:b0:2d5:db38:800f with SMTP id d9443c01a7336-2d8df554483mr2980505ad.14.1787963845250;
        Fri, 28 Aug 2026 17:37:25 -0700 (PDT)
Received: from google.com (89.163.16.34.bc.googleusercontent.com. [34.16.163.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2f5187fsm545730a91.1.2026.08.28.17.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:37:24 -0700 (PDT)
Date: Sat, 29 Aug 2026 00:37:19 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu,
	daniel.almeida@collabora.com, boris.brezillon@collabora.com,
	work@onurozkan.dev, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add runtime PM support
Message-ID: <20260829003719.GA552219@google.com>
References: <20260826131213.1820408-1-beata.michalska@arm.com>
 <20260826131213.1820408-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826131213.1820408-2-beata.michalska@arm.com>

Hi Beata,

On Wed, Aug 26, 2026 at 03:10:55PM +0200, Beata Michalska wrote:
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index a56ba6309594..43bbf4bce993 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -67,6 +67,7 @@ macro_rules! declare_err {
>      declare_err!(EOVERFLOW, "Value too large for defined data type.");
>      declare_err!(EMSGSIZE, "Message too long.");
>      declare_err!(ETIMEDOUT, "Connection timed out.");
> +    declare_err!(EINPROGRESS, "Operation now in progress.");

Looks like this is already upstream since commit b93fb6e76ec1.

> +/// Device's runtime power management status
> +#[repr(i32)]
> +pub enum RuntimePMState {
> +    /// Runtime PM has not been initialized for this device yet.
> +    UNKNOWN = bindings::rpm_status_RPM_INVALID,
> +    /// The device is expected to be runtime active and in it's normal operating state

Nit: it's -> its.

> +    RESUMED = bindings::rpm_status_RPM_ACTIVE,
> +    /// The device is expected to be suspended, unavailable for normal operations
> +    SUSPENDED = bindings::rpm_status_RPM_SUSPENDED,

Should the enum variant names use CamelCase?

> +impl<'a> ResumeScope<'a> {
> +    fn new(dev: &'a device::Device<device::Bound>, mode: Mode) -> Result<Self> {
> +        if mode.contains(ModeFlag::Acquire) {
> +            // ModeFlag::Acquire is intended to be used with Awake scope
> +            // Avoid mixing the modes.
> +            return Err(EINVAL);
> +        }
> +
> +        // ModeFlag::Idle is internal so strip it of before passing further

Nit: of -> off. Also in the identical comment below.

> +impl<'a> AwakeScope<'a> {
> +    fn new(dev: &'a device::Device<device::Bound>, mode: Mode) -> Result<Self> {
> +        if !mode.contains(ModeFlag::Acquire) {
> +            return Err(EINVAL);
> +        }
> +        // ModeFlag::Idle is internal so strip it of before passing further
> +        match Request::resume(dev, mode & !ModeFlag::Idle) {
> +            Ok(()) => {}
> +            // For async/nowait requests, `EINPROGRESS` means the resume is in
> +            // flight and the usage reference already keeps the device active.
> +            Err(e) if e == EINPROGRESS && mode.contains_any(ModeFlag::Async | ModeFlag::Nowait) => {
> +            }
> +            Err(e) => {
> +                Request::put_noidle(dev);
> +                return Err(e);
> +            }
> +        }
> +
> +        Ok(Self(Scope::<Awake> {
> +            dev,
> +            mode,
> +            _tag: PhantomData,
> +        }))
> +    }
> +
> +    fn release_inner(&self) -> Result {
> +        let scope_mode = self.0.mode & !ModeFlag::Idle;
> +        match self.0.mode {
> +            mode if mode.contains(ModeFlag::Idle) => Request::idle(self.0.dev, scope_mode),
> +            mode if mode.contains(ModeFlag::Auto) => {
> +                Request::mark_last_busy(self.0.dev);
> +                Request::suspend(self.0.dev, scope_mode)
> +            }
> +            _ => Request::suspend(self.0.dev, scope_mode),

In v2 you had Request::idle in the default arm. I didn't see a note
about this in the changelog. Was the change in behavior intentional?

> +impl<'a> RetainScope<'a> {
> +    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
> +        Request::get_noresume(dev);
> +        Ok(Self(Scope::<Retain> {
> +            dev,
> +            mode: Mode(ModeFlag::Sync as u32),
> +            _tag: PhantomData,
> +        }))
> +    }
> +
> +    fn try_new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
> +        Request::get_if_active(dev)?;
> +        Ok(Self(Scope::<Retain> {
> +            dev,
> +            mode: Mode(ModeFlag::Sync as u32),
> +            _tag: PhantomData,
> +        }))
> +    }
> +
> +    fn release_inner(&self) {
> +        Request::put_noidle(self.0.dev);

What's the reason for using put_noidle here? It doesn't queue
autosuspend, so wouldn't the try_hold_active pattern (i.e. grab if
active, do something, drop) leave the device active until something
else triggers a suspend?

> +/// SAFETY:
> +/// bindings::dev_pm_ops is #[repr(C)], implements Default
> +/// and the struct itself is all nullable function pointers.
> +/// There is no padding and all zero bit-pattern is valid
> +///
> +pub const PMOPS_NONE: bindings::dev_pm_ops =
> +    unsafe { core::mem::MaybeUninit::<bindings::dev_pm_ops>::zeroed().assume_init() };

The safety comment shouldn't be a doc comment.

> +/// Runtime PM context tied to a device.
> +pub struct PMContext<'a, D: driver::DriverLayout, T: PMOps<D>> {
> +    // Preferably, PMContext could be shared via borrowed reference over
> +    // a pm Registration's lifetime but that bares complications on its own
> +    // when the context needs to be shared across different Registration types.

Nit: bares -> bears. Also in the identical comment below.

> +impl<'a, D: driver::DriverLayout, T: PMOps<D>> PMContext<'a, D, T> {
> +    /// Driver-provided runtime PM operations.
> +    ///
> +    /// A driver implements this trait to handle runtime PM
> +    /// transitions for its device type.
> +    ///
> +    /// Each callback receives the device and the current payload.
> +    /// On success, it returns the payload to keep for the next
> +    /// transition. On failure, it returns the payload together
> +    /// with the error so the previous, or otherwise sane state
> +    /// can be preserved.
> +    pub const PM_OPS: bindings::dev_pm_ops = bindings::dev_pm_ops {
> +        runtime_resume: if T::HAS_RUNTIME_RESUME {
> +            Some(runtime_resume_callback::<D, T>)
> +        } else {
> +            None
> +        },
> +        runtime_suspend: if T::HAS_RUNTIME_SUSPEND {
> +            Some(runtime_suspend_callback::<D, T>)
> +        } else {
> +            None
> +        },
> +        ..PMOPS_NONE
> +    };
> +
> +    /// Enable runtime PM
> +    pub fn enable(&self, state: RuntimePMState) -> Result {
> +        if self.inner.enabled.cmpxchg(false, true, ordering::Full).is_err() {
> +            return Err(EBUSY);
> +        }
> +        Self::apply_config(self.inner.dev, &self.inner.configs);
> +        match state {
> +            RuntimePMState::RESUMED => Request::mark_active(self.inner.dev),
> +            RuntimePMState::SUSPENDED => Request::mark_suspended(self.inner.dev),
> +            _ => Err(EINVAL),
> +        }.inspect_err(|_| self.inner.enabled.store(false, ordering::Release))?;

This always applies the config even if state is invalid. Should we
validate the state before making changes?

> +    /// Runs a closure while holding an `AwakeScope`.
> +    pub fn with_get<R>(&self, profile: PMProfile, f: impl FnOnce() -> Result<R>) -> Result<R> {
> +        if profile.0.contains(ModeFlag::Async) {
> +            return Err(EINVAL);
> +        }
> +        let _scope = self.get(profile)?;
> +        f()
> +    }

Shouldn't this reject NoWait too to make sure the device will actually
be powered when the closure is executed?

Sami
