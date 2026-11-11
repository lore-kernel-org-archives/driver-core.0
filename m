Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794429935;
	b=zstQipOZxaPfg2FQ4qyQEhVrLW0IV7WIzVnoj2sdrVgsTx3E1hbqiFaeujdlZl4jYSwF
	 DtexRFNqzmhEObs9qPw0Vb2ofT4E+78UAVANYNtzzbTRlvUwRG0ZwZYTqVJX8ihRX2hm5
	 5o2jL9r7lt7V3zchcMf7/+TDQ8G1JF/9L4u2MzMp9l6fmxUpEHw5d6U/95E2/rowADMdw
	 1z8jUs07aylUfe10v+/hjt/USx3WhFNBwOJThWfIozy7yR/7Xx0c3aMO0c606lVbhwi9s
	 B8hGkgDVovINRFHN0nNTmv+XSnqAN4ythc4lKbWOHgINldNSUSyZzAHB6lix1oaA5BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429935;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yVeXYht7akFSY/gai/1Qv7DeakG1hQuPn+nM3CDxqEA=;
	b=ZZ4oW74Z/zk/qSY/Rh3T5yvkoQOyNse6l3hbmfdy9l7Cm5mcI9+Jsyc77GYZItI1kR0E
	 b/7twCdfZAgpvmsGp/+5upIOOkXBvgqIFJ7u1kiqtskAQsyROSHhhKbSud8slB4S8KqR5
	 XBP409y/Er93TuOUqvSrGn/ksY5nw0gxcozwGf7ibmg+3qpl1qETZQf5WKy0quo8q0MsL
	 Gt1okaA8GiqDQ70otH5PY/gthD5eWScaTWh3wdQhT905USGNRQjRRZJC/RyZ1duI70kIF
	 faovuojFKq3PO6eyBhUnEensjSh8ECeHSCA+yvYzXoYkZOMAY9GwdZJN9tIlwOV8lfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gCGULcr3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CCD606A321
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 20:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60CCD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=gCGULcr3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 677F9153B;
	Wed, 11 Nov 2026 12:45:30 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30373F85F;
	Wed, 11 Nov 2026 12:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794429933; bh=4ZrLT8DNHk4yKklrJI+ERSH8q+MA2T/2YvUo3b0tsZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCGULcr330vGNwdoUpKcc4HVf4e4fgoEmxaE5hlC0E5kphTVGycXKjofZotPTa2H8
	 d77g+CVxBrethlQJByqeKuPvYheYaWHVsmXS5/jqlrFn7ZwfzIfbT64d7UDKYJ/qsv
	 tXMWvfGCB7/YokTgiHk1+NC+Nj+foSaTCzfTEKtM=
Date: Wed, 11 Nov 2026 21:45:25 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
	aliceryhl@google.com, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, daniel.almeida@collabora.com,
	boris.brezillon@collabora.com, work@onurozkan.dev,
	samitolvanen@google.com, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/3] rust: add runtime PM support
Message-ID: <avTT5VuspuFKbnBv@arm.com>
References: <20261026120523.526942-1-beata.michalska@arm.com>
 <20261026120523.526942-2-beata.michalska@arm.com>
 <DMNFI31C8X12.3L2J0GKKNJN81@kernel.org>
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
In-Reply-To: <DMNFI31C8X12.3L2J0GKKNJN81@kernel.org>

Hi Danilo,

Thank you for the review!
I've applied fixes for most of them, apart from one. See below.

On Thu, Nov 05, 2026 at 05:47:28PM +0100, Danilo Krummrich wrote:
> On Mon Oct 26, 2026 at 1:05 PM CET, Beata Michalska wrote:
> >  drivers/base/base.h             |    4 +
> >  rust/bindings/bindings_helper.h |    1 +
> >  rust/helpers/helpers.c          |    1 +
> >  rust/helpers/pm_runtime.c       |   89 +++
> >  rust/kernel/lib.rs              |    1 +
> >  rust/kernel/pm.rs               | 1106 +++++++++++++++++++++++++++++++
> 
> I think this fits better under rust/kernel/device/pm.rs. This would also avoid
> naming like DevPMOps, which can then just be device::PMOps.
> 
> We should also add the file to POWER MANAGEMENT CORE in MAINTAINERS.
> 
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index a5b7abc10ff0..e79108bc754a 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -103,6 +103,7 @@ struct driver_private {
> >   *			   dev_err_probe() for later retrieval via debugfs
> >   * @device: pointer back to the struct device that this structure is
> >   *	    associated with.
> > + * @rust_private: private data used exclusively by the Rust driver core
> >   * @dead: This device is currently either in the process of or has been
> >   *	  removed from the system. Any asynchronous events scheduled for this
> >   *	  device should exit without taking any action.
> > @@ -119,6 +120,9 @@ struct device_private {
> >  	const struct device_driver *async_driver;
> >  	char *deferred_probe_reason;
> >  	struct device *device;
> > +#ifdef CONFIG_RUST
> > +	void *rust_private;
> 
> Let's call this pointer pm_registration_data_rust. Or even just add
> 
> 	struct {
> 		void *pm_registration_data;
> 	} rust;
> 	
> > +use core::{cell::UnsafeCell, marker::PhantomData, mem::ManuallyDrop};
> 
> NIT: Formatting.
> 
> > +impl From<Mode> for core::ffi::c_int {
> > +    #[inline]
> > +    fn from(mode: Mode) -> core::ffi::c_int {
> > +        mode.0 as core::ffi::c_int
> > +    }
> > +}
> 
> You can just use c_int, as it comes from the prelude. Also note that the prelude
> takes it from ::ffi, rather than ::core.
> 
> > +    /// Explicitly release the scope
> > +    /// This should be used in favor of regular drop
> > +    /// when error handling is required.
> 
> NIT:
> 
> 	// Explicitly release the scope.
> 	//
> 	// This should be used in favor of regular drop when error handling is
> 	// required.
> 
> > +    pub fn release(self) -> Result {
> > +        self.release_inner();
> > +        core::mem::forget(self);
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl<'a> Drop for RetainScope<'a> {
> > +    fn drop(&mut self) {
> > +        self.release_inner();
> > +    }
> > +}
> > +
> > +/// Runtime PM helpers - wrappers around C runtime PM interface.
> > +/// All methods require a reference to a bound device.
> 
> I'd rather say a few words about what those helpers are. The fact they require a
> &Device<Bound> is rather obvious from the signature; if at all I'd rather
> mention why that is.
> 
> > +struct Request;
> > +
> > +impl Request {
> > +    #[inline]
> > +    fn active(dev: &device::Device<device::Bound>) -> bool {
> > +        // SAFETY: `dev.as_raw()` must provide a valid pointer to
> > +        // `struct device` for the duration of the call.
> 
> This reads like a requirement, but it rather is the justifiation for this
> requirement coming from pm_runtime_active().
> 
> > +        // The `Device<Bound>` reference provides that guarantee.
> 
> Plus that we are in a scope where the device is guaranteed that the device
> remains bound to the driver, which is a requirement as well.
> 
> > +/// Common runtime PM callback entry point
> > +///
> > +/// The generated extern "C" callbacks call into this helper with the raw
> > +/// `struct device *` provided by the PM core. It rebuilds the Rust device
> > +/// reference, retrieves the device's PM registration data and performs
> > +/// handoff to corresponding driver callback.
> > +#[cfg(CONFIG_PM)]
> > +fn runtime_pm_callback<T, F>(dev: *mut bindings::device, cb: F) -> Result
> 
> This function has to be unsafe, given that it takes a raw pointer.
> 
> > +where
> > +    T: PMOps,
> > +    F: FnOnce(
> > +        &<T as PMOps>::DeviceType,
> > +        <T as PMOps>::RuntimePayloadType,
> > +    ) -> PMCallbackResult<<T as PMOps>::RuntimePayloadType>,
> > +{
> > +    let dev: &device::Device<device::Bound>  =
> > +             // SAFETY: `dev` is provided by the PM core and remains
> > +             // valid for the duration of the callback.
> > +            unsafe { device::Device::from_raw(dev) };
> 
> Please prefer Device::from_raw() plus Device::as_bound().
> 
> > +
> > +    // SAFETY: `dev` is provided by the PM core and remains
> > +    // valid for the duration of the callback.
> > +    let ptr = unsafe { (*(*dev.as_raw()).p).rust_private };
> > +
> > +    if ptr.is_null() {
> > +        return Err(ENODEV);
> > +    }
> 
> How can we ever reach this?
> 
> > +/// Typed reference to a driver's runtime PM ops.
> > +///
> > +/// Instances of this type are generated from static [`DevPMOps`]
> > +/// and are used by bus registration code to install the matching
> > +/// C `dev_pm_ops` pointer into the driver object.
> > +/// The `A` parameter identifies the bus adapter that is allowed
> > +/// to install the table.
> > +pub struct DevPMOpsRef<'a, A> {
> > +    #[cfg_attr(not(CONFIG_PM), allow(unused))]
> > +    ops: &'a bindings::dev_pm_ops,
> > +    _p: PhantomData<fn() -> *const A>,
> > +}
> 
> I'd probably rename this to pm::AdapterOpsRef<'a, A> and add a type alias:
> 
> 	pub type OpsRef<T> = AdapterOpsRef<'static, <T as PMOps>::Adapter>;
> 
> so it looks cleaner in drivers:
> 
> 	 const DEV_PM_OPS: Option<device::pm::OpsRef<Self>> = Some(TYR_PM_OPS.pm_ops());
> 
> (I'd probably also rename DevPMOps to device::pm::Ops, as I think that reads
> cleaner.)
> 
> > +/// Runtime PM callbacks implemented by a driver.
> > +///
> > +/// Defines the [`PMOps`] trait and its corresponding [`bindings::dev_pm_ops`].
> > +///
> > +/// The Adapter associated type identifies the bus adapter that installs
> > +/// the generated PM ops.
> > +/// Implementations should normally be enabled through a
> > +/// bus-specific constructor for [`DevPMOps`], which constrains
> > +/// [`Self::DeviceType`] to the correct bound device type for that bus.
> > +///
> > +/// Each C callback recovers the Rust bus device from the raw
> > +/// `struct device *`, borrows the registered runtime PM payload, and delegates
> > +/// to the matching [`PMOps`] trait method.
> 
> This kind of implementation detail doesn't belong in this doc-comment.
> 
> > +#[vtable]
> > +pub trait PMOps: Sized {
> > +    /// The bus adapter that installs the generated PM ops.
> > +    type Adapter: driver::DriverLayout + 'static;
> > +
> > +    /// Type of the bound bus device passed to runtime PM callbacks.
> > +    type DeviceType: AsBusDevice<device::Bound>;
> > +
> > +    /// Type of the payload moved through runtime PM transitions.
> > +    type RuntimePayloadType: Send + 'static;
> 
> I got back to this type after writing the below, because at first I thought this
> is purely the data type that is cycled through suspend() and resume().
> 
> However, reading further this is currently the Registration's private data. This
> won't work. The Registration's private data must not require 'static as we need
> device resources in this data.
> 
> So, there should be at least two separate types:
> 
>   (1) The private data of pm::Registration.
> 
>   (2) An object that is created and returned by suspend() and passed by value to
>       resume(), so it can store e.g. reverse guard types (see below).
> 
> This should also get us rid of the PMPayload magic.
> 
The `'static' lifetime is definitely a shortsighted idea on my side.
Splitting the data does seem reasonable, though I'm not sure how that would allow
us to get rid of moving around the `PMPayload`, as this is what I assume you
are referring to by 'magic'. The pm framework still needs to keep the callback
data between the transitions. Also I am not convinced the pm should distinguish
between suspend and resume data - my thinking was it should be handled by the
driver. We just need 'an' object to move back and forth.

---
BR
Beata

> > +
> > +    /// Runtime resume callback.
> 
> It would be good to expand this doc-comment explaining the semantics of
> RuntimePayloadType.
> 
> > +    fn runtime_resume<'a>(
> > +        _dev: &'a Self::DeviceType,
> > +        _payload: Self::RuntimePayloadType,
> > +    ) -> PMCallbackResult<Self::RuntimePayloadType> {
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
> > +
> > +    /// Runtime suspend callback.
> > +    fn runtime_suspend<'a>(
> > +        _dev: &'a Self::DeviceType,
> > +        _payload: Self::RuntimePayloadType,
> > +    ) -> PMCallbackResult<Self::RuntimePayloadType> {
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
> 
> I think for Tyr it so far is sufficient to have a single RuntimePayloadType that
> keeps cycling through the callbacks, but there will be use-cases where the types
> differ.
> 
> For instance, for a PCI driver you will have DeviceDisableGuard stored in
> suspend() and then you'll want to drop it in resume() so the device gets enabled
> again.
> 
> We should also avoid requiring 'static, as reverse guards will borrow the
> regular guard, e.g. pci::DeviceDisableGuard will borrow from
> pci::DeviceEnableGuard.
> 
> For runtime_resume() I think of something like:
> 
> 	fn runtime_resume<'a>(
> 	    dev: &Self::DeviceType,
> 	    suspended: Self::SuspendData<'a>,
> 	) -> Result<(), (Self::SuspendData<'a>, Error)>;
> 
> 
> > +/// Runtime PM context tied to a device.
> > +pub struct PMContext<'a, T: PMOps> {
> > +    // Preferably, PMContext could be shared via borrowed reference over
> > +    // a pm Registration's lifetime but that bears complications on its own
> > +    // when the context needs to be shared across different Registration types.
> > +    inner: Arc<PMContextInner<'a, T>>,
> 
> Since we now have self-referencial pin-init, can we please avoid this Arc?
> 
> > +impl<'a, T: PMOps> Registration<'a, T> {
> > +    /// Creates a runtime PM registration for `dev`.
> > +    ///
> > +    /// The provided profiles and configuration are stored in the associated
> > +    /// [`PMContext`]. The `payload` is stored as a Registration data
> > +    /// and is used to service PM transitions.
> > +    ///
> > +    /// The device must use the callback represented by `ops`, generated
> > +    /// for the same bus adapter and driver pair `(D, T)`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The returned [`Registration`] object cannot be mem::forgotten,
> > +    /// or it's [`Drop`] implementation cannot be skipped in any way.
> > +    ///
> > +    pub unsafe fn new(
> > +        dev: &'a device::Device<device::Core<'_>>,
> > +        ops: &'static DevPMOps<T>,
> > +        profiles: Option<KVec<PMProfile>>,
> > +        configs: Option<KVec<PMConfig>>,
> > +        payload: T::RuntimePayloadType,
> 
> This should be impl PinInit<T::PMRegistrationData<'a>, E> + 'a.
> 
> > +    ) -> Result<Self> {
> 
> This should be impl PinInit<Self, Error> + 'a.
> 
> > +        // SAFETY: For the duration of this call, `dev` is a valid `Device<Core>`,
> > +        // and so is its raw `struct device` pointer.
> > +        unsafe {
> 
> Please use separate unsafe blocks per unsafe operation.
> 
> > +            let drv = (*dev.as_raw()).driver;
> > +            if drv.is_null() || (*drv).pm != ops.as_raw() {
> 
> drv.is_null() can't happen as we require Device<Core>.
> 
> > +                return Err(EINVAL);
> > +            }
> > +        }
> > +
> > +        let payload = KBox::new(
> > +            RegistrationData::<T> {
> > +                data: PMPayload {
> > +                    in_flight: AtomicFlag::new(false),
> > +                    inner: UnsafeCell::new(ManuallyDrop::new(payload)),
> > +                },
> > +                _marker: PhantomData,
> > +            },
> > +            GFP_KERNEL,
> > +        )?;
> > +
> > +        let inner_ctx = Arc::new(
> > +            PMContextInner {
> > +                dev,
> > +                state: Atomic::new(PMContextState::Disabled),
> > +                profiles: profiles.unwrap_or_default(),
> > +                configs: configs.unwrap_or_default(),
> > +                _marker: PhantomData,
> > +            },
> > +            GFP_KERNEL,
> > +        )?;
> > +
> > +        // SAFETY: For the duration of this call, `dev` is a valid `Device<Core>`,
> > +        // and so is its raw `struct device` pointer.
> > +        // The payload allocation is converted into a foreign pointer
> > +        // and owned by this `Registration` until `Drop` clears
> > +        // `rust_private` and reconstructs the `KBox`.
> > +        unsafe {
> 
> Same as above.
> 
> > +            let ptr = (*(*dev.as_raw()).p).rust_private;
> 
> This is accessed a couple of time, let's add a helper for this.
> 
> > +            if !ptr.is_null() {
> > +                return Err(EBUSY);
> > +            }
> > +            (*(*dev.as_raw()).p).rust_private = payload.into_foreign();
> > +        }
> > +
> > +        Ok(Self {
> > +            ctx: PMContext { inner: inner_ctx },
> > +        })
> > +    }
