Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AEB375F9E
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121076; cv=none; b=MuTApfp6AjWIoi84vf0Jiv77T/kLgFkXH7MK6AifjLnCOFUM4qxKICZwblhnmAIH4VXpB2G8Mve3qai9PHOka7+Ag9o6kPSs+teMEX+TKFWRt7YO7RhvgBSxl7MZStn/4ttEGI4rOoY+VlpYx2LaYd7rbz8hnK5KE+XCn380FUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121076; c=relaxed/simple;
	bh=w3GK4uKMgHFJ5aVRNK83XMifEzU88hdUfRmG7ieR8NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYeK+9BAEjJxZS/7kLt/UbhmgWaDgTv6dv90sksUfMqalX9eClM4oyK8tCvlp9qul8AQp6gwQr7SwQY8CXNSkWUhq/LLBZ2ysTnQZ+4pvXHx4w9Gpbv5w0ELQavoYzwPx1xRb+INq0/cS2/n2oxXUY7gWXVc8JHlxuFl9AI2TpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P20BPTO2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P20BPTO2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 540EC2008;
	Wed, 10 Jun 2026 12:51:06 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFC403FB90;
	Wed, 10 Jun 2026 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781121071; bh=w3GK4uKMgHFJ5aVRNK83XMifEzU88hdUfRmG7ieR8NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P20BPTO2jX0ZjU3qx3jiRfDQaRRqkOek0PKAow3sBqXF5YA0z44Jf8ltzACggiQIB
	 4uIKEtzAys78pdX1rXeLg0jFzXyKvxXsw9K7kCs9EHXBtnP3sBEM7ivvDnAKPxZW8l
	 tE5rLeHjo7KRX0wjsNGgm2UNuFhW5sbdPO8Yy344=
Date: Wed, 10 Jun 2026 21:50:58 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] rust: Add runtime PM support
Message-ID: <ainAIkc0fnTiSJa8@arm.com>
References: <20260514150957.3501924-1-beata.michalska@arm.com>
 <20260514150957.3501924-2-beata.michalska@arm.com>
 <ah2qp7CZqtAofMHQ@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2qp7CZqtAofMHQ@google.com>

Hi Alice,

Sincere apologies for not replying.
Apparently my mailbox filters picked it up moved it to completely unrelated
lands. Again, apologies.

On Mon, Jun 01, 2026 at 03:52:07PM +0000, Alice Ryhl wrote:
> On Thu, May 14, 2026 at 05:09:03PM +0200, Beata Michalska wrote:
> > Introduce a Rust abstraction for Linux runtime PM, centered around a
> > `PMContext` ownign a device reference and modeling the runtime PM
> > lifecycle. The context is initialised inactive and transitions into
> > active once the runtime PM gets enabled. The drivers might opt in to
> > initialize the devices power state prior to enabling the context, which
> > is advised at probe, when the actual PM callbacks cannot be fully served.
> > Once active, the context provides access to runtime PM operations and
> > request modes used to manage device power state transitions.
> > 
> > Runtime PM callbacks are provided via a PMOps trait. The generated
> > dev_pm_ops callbacks retrieve the driver's PMContext from drvdata,
> > validate the expected transition, and transfer ownership of the
> > driver-defined runtime PM payload to the relevant callback. Once
> > the callback completes, ownership of the returned payload is
> > transferred back to the PMContext and stored for the next transition.
> > The payload returned by the callback is expected to reflect the
> > current runtime PM state of the device. On a successful transition,
> > the returned payload should represent the new state reached by
> > the device. If the transition fails, it is the responsibility of
> > the driver to return a payload either rolled back to the previous
> > state or left in a state that remains valid for subsequent runtime PM
> > transitions. At present, only runtime_suspend and runtime_resume
> > callbacks are supported.
> > 
> > Profile and scoped runtime PM helpers are provided for common usage
> > patterns. ResumeScope resumes the device for the lifetime of the scope,
> > AwakeScope resumes the device while holding a runtime PM usage reference,
> > and RetainScope only increments the runtime PM usage count. References
> > are released on drop, and request behaviour is controlled through
> > driver-defined Profile values covering the common runtime PM request
> > modes.
> > 
> > Additionally, PMConfig provides common runtime PM configuration options.
> > 
> > Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> > ---
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/helpers/helpers.c          |   1 +
> >  rust/helpers/pm_runtime.c       |  38 ++
> >  rust/kernel/lib.rs              |   1 +
> >  rust/kernel/pm.rs               | 924 ++++++++++++++++++++++++++++++++
> >  5 files changed, 965 insertions(+)
> >  create mode 100644 rust/helpers/pm_runtime.c
> >  create mode 100644 rust/kernel/pm.rs
> > 
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index 446dbeaf0866..3a38db22681f 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -76,6 +76,7 @@
> >  #include <linux/pid_namespace.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_opp.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/poll.h>
> >  #include <linux/property.h>
> >  #include <linux/pwm.h>
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 625921e27dfb..d67c69ebd33e 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -75,6 +75,7 @@
> >  #include "pci.c"
> >  #include "pid_namespace.c"
> >  #include "platform.c"
> > +#include "pm_runtime.c"
> >  #include "poll.c"
> >  #include "processor.c"
> >  #include "property.c"
> > diff --git a/rust/helpers/pm_runtime.c b/rust/helpers/pm_runtime.c
> > new file mode 100644
> > index 000000000000..9b2056110199
> > --- /dev/null
> > +++ b/rust/helpers/pm_runtime.c
> > @@ -0,0 +1,38 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/pm_runtime.h>
> > +
> > +void rust_helper_pm_runtime_get_noresume(struct device *dev)
> > +{
> > +	pm_runtime_get_noresume(dev);
> > +}
> > +
> > +void rust_helper_pm_runtime_put_noidle(struct device *dev)
> > +{
> > +	pm_runtime_put_noidle(dev);
> > +}
> > +
> > +void rust_helper_pm_runtime_mark_last_busy(struct device *dev)
> > +{
> > +	pm_runtime_mark_last_busy(dev) ;
> > +}
> > +
> > +bool rust_helper_pm_runtime_active(struct device *dev)
> > +{
> > +	return pm_runtime_active(dev);
> > +}
> > +
> > +void rust_helper_pm_suspend_ignore_children(struct device *dev, bool enable)
> > +{
> > +	pm_suspend_ignore_children(dev, enable);
> > +}
> > +
> > +int rust_helper_pm_runtime_set_active(struct device *dev)
> > +{
> > +	return pm_runtime_set_active(dev);
> > +}
> > +
> > +int rust_helper_pm_runtime_set_suspended(struct device *dev)
> > +{
> > +	return pm_runtime_set_suspended(dev);
> > +}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index b72b2fbe046d..7e51e497e2f0 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -105,6 +105,7 @@
> >  pub mod pci;
> >  pub mod pid_namespace;
> >  pub mod platform;
> > +pub mod pm;
> >  pub mod prelude;
> >  pub mod print;
> >  pub mod processor;
> > diff --git a/rust/kernel/pm.rs b/rust/kernel/pm.rs
> > new file mode 100644
> > index 000000000000..7bdffa727c71
> > --- /dev/null
> > +++ b/rust/kernel/pm.rs
> > @@ -0,0 +1,924 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rust Runtime Power Management abstraction.
> > +//!
> > +//! C header: [`include/linux/pm_runtime.h`](srctree/include/linux/pm_runtime.h)
> > +
> > +use crate::{
> > +    bindings, device,
> > +    error::{to_result, VTABLE_DEFAULT_ERROR},
> > +    macros::paste,
> > +    prelude::*,
> > +    sync::aref::ARef,
> > +    sync::atomic::{
> > +        ordering::{Acquire, Full, Release},
> > +        Atomic,
> > +    },
> > +    sync::Arc,
> > +    sync::{new_mutex, Mutex},
> > +};
> > +
> > +use core::marker::PhantomData;
> > +
> > +/// Runtime Power Management modes that determine how a particular PM
> > +/// transition is to be carried out.
> > +/// Corresponds to C Runtime PM flag argument bits:
> > +/// - `RPM_ASYNC`
> > +/// - `RPM_NOWAIT`
> > +/// - `RPM_GET_PUT`
> > +/// - `RPM_AUTO`
> > +#[derive(Clone, Copy, PartialEq, Eq, Debug)]
> > +struct Mode(u32);
> > +
> > +impl Mode {
> > +    /// Synchronous PM operations - default.
> > +    #[allow(unused)]
> > +    const SYNC: Mode = Mode(0);
> > +    /// Allow asynchronous PM operations.
> > +    const ASYNC: Mode = Mode(bindings::RPM_ASYNC);
> > +    /// Do not wait for any pending rquests to finish.
> > +    const NOWAIT: Mode = Mode(bindings::RPM_NOWAIT);
> > +    /// Acquire a runtime-PM usage reference.
> > +    const ACQUIRE: Mode = Mode(bindings::RPM_GET_PUT);
> > +    /// Use autosuspend.
> > +    const AUTO: Mode = Mode(bindings::RPM_AUTO);
> > +    /// Additional mode for devices supporting idle states.
> > +    const IDLE: Mode = Mode(1 << 16);
> > +
> > +    const fn join(self, other: Self) -> Self {
> > +        Self(self.0 | other.0)
> > +    }
> > +
> > +    fn contains(self, other: Self) -> bool {
> > +        (self.0 & other.0) != 0
> > +    }
> > +}
> > +
> > +impl core::ops::BitOr for Mode {
> > +    type Output = Self;
> > +    fn bitor(self, rhs: Self) -> Self::Output {
> > +        Self(self.0 | rhs.0)
> > +    }
> > +}
> > +
> > +impl core::ops::BitAnd for Mode {
> > +    type Output = Self;
> > +    fn bitand(self, rhs: Self) -> Self::Output {
> > +        Self(self.0 & rhs.0)
> > +    }
> > +}
> > +
> > +impl core::ops::Not for Mode {
> > +    type Output = Self;
> > +    fn not(self) -> Self::Output {
> > +        Self(!self.0)
> > +    }
> > +}
> > +
> > +impl From<Mode> for core::ffi::c_int {
> > +    #[inline]
> > +    fn from(mode: Mode) -> core::ffi::c_int {
> > +        mode.0 as core::ffi::c_int
> > +    }
> > +}
> > +
> > +/// Utility macro for combining multiple request modes
> > +macro_rules! mode {
> > +    ($mode:expr $(, $args:expr)+ $(,)?) => {{
> > +        let mut new_mode = $mode;
> > +        $( new_mode = new_mode.join($args); )+
> > +        new_mode
> > +    }};
> > +}
> > +
> > +/// Runtime power transition scope.
> > +pub struct Scope<Tag> {
> > +    dev: ARef<device::Device>,
> > +    mode: Mode,
> > +    _tag: PhantomData<Tag>,
> > +}
> > +
> > +/// Device resumed without incrementing the device's usage count
> > +pub struct Resume;
> > +/// Device resumed with the devices'a usage count being incremented
> > +pub struct Awake;
> > +/// Device with increased usage reference
> > +pub struct Retain;
> > +
> > +/// Resumes the device without acquiring the usage reference.
> > +/// Note: This does not guarantee the device will be kept active
> > +/// for the lifetime of the scope due to potentil pending suspend
> > +/// requests.
> > +///
> > +/// On drop:
> > +/// - If `Mode::IDLE`, calls `__pm_runtime_idle()`:
> > +///   triggers idle notification before attempting to suspend
> > +/// - If `Mode::AUTO`, marks last busy then calls `__pm_runtime_suspend()`.
> > +/// - Otherwise calls `__pm_runtime_suspend()`.
> > +///
> > +/// The guard must be dropped from a context matching the requested transition
> > +/// mode: sync vs async.
> > +#[must_use = "dropping this guard issues the matching runtime PM release request"]
> > +pub struct ResumeScope(Scope<Resume>);
> > +
> > +/// Acquires a runtime-PM usage reference and keeps the device powered.
> > +///
> > +/// Requires `Mode::ACQUIRE`. Drop behavior matches `ResumeScope`.
> > +/// The guard must be dropped from a context matching the requested transition
> > +/// mode: sync vs async.
> > +#[must_use = "dropping this guard releases its runtime PM hold"]
> > +pub struct AwakeScope(Scope<Awake>);
> > +
> > +/// Prevents the device from getting suspended by holding the usage reference
> > +/// count.
> > +///
> > +/// On drop, calls `pm_runtime_put_noidle()`.
> > +#[must_use = "dropping this guard releases its runtime PM hold"]
> > +pub struct RetainScope(Scope<Retain>);
> > +
> > +impl ResumeScope {
> > +    fn new(dev: ARef<device::Device>, mode: Mode) -> Result<Self> {
> > +        if mode.contains(Mode::ACQUIRE) {
> > +            // Mode::ACQUIRE is intended to be used with Awake scope
> > +            // Avoid mixing the modes.
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        // Mode::IDLE is internal so strip it of before passing further
> > +        Request::resume(&dev, mode & !Mode::IDLE).map(|()| {
> > +            Self(Scope::<Resume> {
> > +                dev: dev.clone(),
> > +                mode,
> > +                _tag: PhantomData,
> > +            })
> > +        })
> > +    }
> > +}
> > +
> > +impl Drop for ResumeScope {
> > +    fn drop(&mut self) {
> > +        let scope_mode = self.0.mode & !Mode::IDLE;
> > +
> > +        match self.0.mode {
> > +            mode if mode.contains(Mode::IDLE) => {
> > +                Request::idle(&self.0.dev, scope_mode & Mode::ASYNC);
> > +            }
> > +            mode if mode.contains(Mode::AUTO) => {
> > +                Request::mark_last_busy(&self.0.dev);
> > +                let _ = Request::suspend(&self.0.dev, scope_mode).inspect_err(|_| {
> > +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend device\n");
> > +                });
> > +            }
> > +            _ => {
> > +                let _ = Request::suspend(&self.0.dev, scope_mode).inspect_err(|_| {
> > +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend device\n");
> > +                });
> > +            }
> > +        }
> > +    }
> > +}
> > +
> > +impl AwakeScope {
> > +    fn new(dev: ARef<device::Device>, mode: Mode) -> Result<Self> {
> > +        if !mode.contains(Mode::ACQUIRE) {
> > +            return Err(EINVAL);
> > +        }
> > +        // Mode::IDLE is internal so strip it of before passing further
> > +        Request::resume(&dev, mode & !Mode::IDLE)
> > +            .inspect_err(|_| Request::put_noidle(&dev))
> > +            .map(|()| {
> > +                Self(Scope::<Awake> {
> > +                    dev: dev.clone(),
> > +                    mode,
> > +                    _tag: PhantomData,
> > +                })
> > +            })
> > +    }
> > +}
> > +
> > +impl Drop for AwakeScope {
> > +    fn drop(&mut self) {
> > +        let scope_mode = self.0.mode & !Mode::IDLE;
> > +        match self.0.mode {
> > +            mode if mode.contains(Mode::IDLE) => {
> > +                Request::idle(&self.0.dev, scope_mode);
> > +            }
> > +            mode if mode.contains(Mode::AUTO) => {
> > +                Request::mark_last_busy(&self.0.dev);
> > +                let _ = Request::suspend(&self.0.dev, scope_mode).inspect_err(|_| {
> > +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend device\n");
> > +                });
> > +            }
> > +            _ => {
> > +                let _ = Request::suspend(&self.0.dev, scope_mode).inspect_err(|_| {
> > +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend device\n");
> > +                });
> > +            }
> > +        }
> > +    }
> > +}
> > +
> > +impl RetainScope {
> > +    fn new(dev: ARef<device::Device>) -> Result<Self> {
> > +        Request::get_noresume(&dev);
> > +        Ok(Self(Scope::<Retain> {
> > +            dev,
> > +            mode: Mode(0),
> > +            _tag: PhantomData,
> > +        }))
> > +    }
> > +}
> > +
> > +impl Drop for RetainScope {
> > +    fn drop(&mut self) {
> > +        Request::put_noidle(&self.0.dev);
> > +    }
> > +}
> > +
> > +struct Request;
> > +
> > +#[cfg(CONFIG_PM)]
> > +impl Request {
> > +    #[inline(always)]
> > +    fn resume(dev: &ARef<device::Device>, mode: Mode) -> Result {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +        to_result(unsafe { bindings::__pm_runtime_resume(dev.as_raw(), mode.into()) })
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn idle(dev: &ARef<device::Device>, mode: Mode) {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +            unsafe {
> > +            bindings::__pm_runtime_idle(dev.as_raw(), mode.into());
> > +        }
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn mark_last_busy(dev: &ARef<device::Device>) {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +        unsafe {
> > +            bindings::pm_runtime_mark_last_busy(dev.as_raw());
> > +        }
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn suspend(dev: &ARef<device::Device>, mode: Mode) -> Result {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +        to_result(unsafe { bindings::__pm_runtime_suspend(dev.as_raw(), mode.into()) })
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn runtime_enable(dev: &ARef<device::Device>) -> Result {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +        to_result(unsafe { bindings::devm_pm_runtime_enable(dev.as_raw()) })
> > +    }
> > +}
> > +
> > +#[cfg(not(CONFIG_PM))]
> > +impl Request {
> > +    #[inline(always)]
> > +    fn resume(_dev: &ARef<device::Device>, _mode: Mode) -> Result {
> > +        Err(Error::from_errno(-(bindings::ENOSYS as i32)))
> 
> This can just be Err(ENOSYS).
Right, though this actually got changed.
> 
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn idle(_dev: &ARef<device::Device>, _mode: Mode) {}
> > +
> > +    #[inline(always)]
> > +    fn mark_last_busy(_dev: &ARef<device::Device>) {}
> > +
> > +    #[inline(always)]
> > +    fn suspend(_dev: &ARef<device::Device>, _mode: Mode) -> Result {
> > +        Err(Error::from_errno(-(bindings::ENOSYS as i32)))
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn runtime_enable(_dev: &ARef<device::Device>) -> Result {
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl Request {
> > +    #[inline(always)]
> > +    fn get_noresume(dev: &ARef<device::Device>) {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +        unsafe { bindings::pm_runtime_get_noresume(dev.as_raw()) };
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn put_noidle(dev: &ARef<device::Device>) {
> > +        // SAFETY: `dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +        // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +        // duration of this call.
> > +        unsafe { bindings::pm_runtime_put_noidle(dev.as_raw()) };
> > +    }
> > +}
> > +
> > +macro_rules! runtime_state {
> > +    (
> > +        $(#[$enum_meta:meta])*
> > +        $name:ident : $repr:ty {
> > +            $(
> > +                $(#[$variant_meta:meta])*
> > +                $v:ident
> > +            ),+$(,)?
> > +        }
> > +    ) => {
> > +        #[repr($repr)]
> > +        #[derive(Copy, Clone, Debug, Eq, PartialEq)]
> > +        $(#[$enum_meta])*
> > +        pub enum $name {
> > +            $(
> > +                $(#[$variant_meta])*
> > +                $v
> > +            ),+
> > +        }
> > +
> > +        impl From<$name> for $repr {
> > +            fn from(v: $name) -> Self { v as $repr }
> > +        }
> > +
> > +        impl TryFrom<$repr> for $name {
> > +            type Error = crate::error::Error;
> > +
> > +            fn try_from(v: $repr) -> Result<Self> {
> > +                match v {
> > +                    $(x if x == $name::$v as $repr => Ok($name::$v), )+
> > +                    _ => Err(EINVAL),
> > +                }
> > +            }
> > +        }
> > +    }
> > +}
> > +
> > +runtime_state!(
> > +    ///  Runtime PM state tracked by [`PMContext`].
> > +    ///
> > +    /// This state mirrors the transitions expected by the runtime PM
> > +    /// callbacks and is used to validate those independently
> > +    /// from the PM core's internal `RPM_*` state.
> > +    RuntimePMState: u32 {
> > +        /// Device has entered the runtime idle notification path.
> > +        Idle,
> > +        /// Device is runtime active.
> > +        Active,
> > +        /// Runtime suspend callback is in progress.
> > +        Suspending,
> > +        /// Device is runtime suspended.
> > +        Suspended,
> > +        /// Runtime resume callback is in progress.
> > +        Resuming,
> > +        /// Runtime PM state has not been initialized.
> > +        Unknown,
> > +    }
> > +);
> > +
> > +/// Generated callbacks require the device to be bound and driver data to be
> > +/// installed.
> > +macro_rules! define_pm_callback {
> > +    // Bare callback with no associate transition nor fallible descriptor
> > +    (@parse_desc $name:ident) => { define_pm_callback!(@default $name); };
> > +    // Callback with associated state transition
> > +    (@parse_desc $name:ident ($from:ident, $pre:ident, $post:ident)) => {
> > +        define_pm_callback!(@default $name, $from, $pre, $post);
> > +    };
> > +
> > +    (@default $name:ident $(, $from:ident, $pre:ident, $post:ident)? ) => {
> > +        paste!(
> > +            /// # Safety
> > +            ///
> > +            /// `dev` must be a valid `struct device *` provided by the PM core.
> > +            unsafe extern "C" fn [<$name _callback>]<T:PMOps>(
> > +                dev: *mut bindings::device
> > +            ) -> core::ffi::c_int {
> > +
> > +                let dev: &device::Device<device::CoreInternal> =
> > +                     // SAFETY: `dev` is provided by the PM core to a runtime PM callback and
> > +                     // is valid for the duration of the callback.
> > +                    unsafe { device::Device::from_raw(dev) };
> > +
> > +                // SAFETY: PM callbacks are only invoked while the device is bound
> > +                // See [`pm_runtime_remove`](srctree/drivers/base/power/runtime.c)
> > +                let bound_dev = unsafe { dev.as_bound() };
> > +
> > +                bound_dev.drvdata::<T::DriverDataType>()
> > +                    .and_then(|data| {
> > +                        let pm_ctx = T::get_pmcontext(data.get_ref())?;
> > +                        let pm_dev = match <T as PMOps>::DeviceType::try_from(dev) {
> > +                            Ok(pm_dev) => Ok(pm_dev),
> > +                            Err(_)  => Err(ENODEV),
> > +                        }?;
> > +
> > +                        define_pm_callback!(@transition verify, pm_ctx $(, $from, $pre)?)?;
> > +                        match T::$name(pm_dev, pm_ctx.current_payload()) {
> > +                            Ok(new_state) => {
> > +                                pm_ctx.update_payload(new_state);
> > +                                // This should not really fail
> > +                                let _ =
> > +                                    define_pm_callback!(@transition unchecked, pm_ctx $(,$pre, $post)?);
> > +                                Ok(0)
> > +                            },
> > +                            Err((old_state, e)) => {
> > +                                pm_ctx.update_payload(old_state);
> > +                                let _ = define_pm_callback!(@transition unchecked, pm_ctx $(,$pre, $from)?);
> > +                                Err(e)
> > +                            }
> > +                        }
> > +                    }).map_err(|e| e.to_errno()).err().unwrap_or(0)
> > +            }
> > +        );
> > +
> > +    };
> > +
> > +   (@transition verify, $ctx:ident, $prev:ident, $new:ident) => {
> > +        // Mark the transition to requested state - if viable
> > +        $ctx.record_transition(
> > +            RuntimePMState::$prev,
> > +            RuntimePMState::$new,
> > +        ).map_err(|_| EINVAL)
> > +    };
> > +
> > +    (@transition unchecked, $ctx:ident, $prev:ident, $new:ident) => {
> > +        {
> > +            $ctx.set_state(RuntimePMState::$new);
> > +            Result::<(), crate::error::Error>::Ok(())
> > +        }
> > +    };
> > +
> > +    (@transition verify, $ctx:ident) => {
> > +        Result::<(), crate::error::Error>::Ok(())
> > +    };
> > +
> > +    (@transition unchecked, $ctx:ident) => {
> > +        Result::<(), crate::error::Error>::Ok(())
> > +    };
> > +}
> > +
> > +/// SAFETY:
> > +/// bindings::dev_pm_ops is #[repr(C)], implements Default
> > +/// and the struct itself is all nullable function pointers.
> > +/// There is no padding and all zero bit-pattern is valid
> > +///
> > +const PMOPS_NONE: bindings::dev_pm_ops =
> > +    unsafe { core::mem::MaybeUninit::<bindings::dev_pm_ops>::zeroed().assume_init() };
> > +
> > +/// Runtime PM callbacks implemented by a driver.
> > +///
> > +/// The generated `dev_pm_ops` callbacks obtain the driver's private data,
> > +/// retrieve the associated `PMContext`, validate the expected PM
> > +/// transition, and then call the corresponding trait method.
> > +macro_rules! define_pm_ops {
> 
> I think it would be ideal if we could avoid this macro. Generally if you
> have a trait that the driver should implement, then it's preferable to
> define said trait without a macro so that it's easier for driver authors
> to see what methods they must provide.
> 
I do understand your point but there are few reasons I chose to go that way:
- All pm callbacks have the same boilerplate: all need to recover Device, get
  drvdata, get PMContext and do the rest of the dance related to the transition.
  The only changing factor here is the name of the callback: both on C side, and
  for the driver ones (with few(1) exceptions)
  Having this in macro makes sure nothing is missed, an if I had miss smth,
  there is only one place where it needs to be fixed.
  Additionally this will ease adding support for remaining PM callbacks.
- The macro makes the expected transition explicit: each callback can specify
  its own sequence of state transitions and the macro handles that without the
  need to copy-paste code all over the place.
- Unified error handling.
- Optional callback wiring: the generated PM_OPS uses the #[vtable]
  HAS_RUNTIME_* constants to install only callbacks actually implemented
  by the driver: guess I am lazy but macro solves again copy-pasting , thus
  eliminating potential mistakes

I do appreciate that some of it can be wrapped in helpers so that the
boilerplate code does not have to be repeated. If you believe it should
still be opencoded, can make the changes.

> Could you expand this macro?
> 
I could but that will be over 150 lines (?)
Do let me know if you want me to share this.


Thank you for your comments.

---
BR
Beata
> Similar comment applies to define_pm_callback.
> 
> > +    ($($name:ident $( : $desc:tt )? ),+ $(,)?) => {
> > +        $( define_pm_callback!( @parse_desc $name $( $desc )?); )+
> > +        define_pm_ops!(@common $( $name ), +);
> > +    };
> > +
> > +    (@common $( $name:ident),+ ) => {
> > +        /// Runtime PM callbacks implemented by a driver
> > +        ///
> > +        /// The PM core will call into the generated C tcallbacks, which in
> > +        /// turn invoke these methods.
> > +        /// Runtime payload ownership is transferred to the callback.
> > +        /// On success, the callback returns the payload to store
> > +        /// for the new PM state. On failure, it returns the payload to restore
> > +        /// together with the error reported to the PM core.
> > +        #[vtable]
> > +        pub trait PMOps: Sized
> > +        {
> > +            /// Type of a bus device
> > +            type DeviceType<'a>:
> > +                TryFrom<&'a device::Device<device::CoreInternal>>
> > +                + AsRef<device::Device>
> > +                where
> > +                    Self: 'a;
> > +            /// Type of data associated with the `DeviceType' drvier.
> > +            type DriverDataType: 'static;
> > +            /// Type allowing access to associated PMContext
> > +            type PMContextRef<'a>:
> > +                core::ops::Deref<Target = PMContext<Self, Active>>
> > +                + 'a
> > +                where
> > +                    Self: 'a;
> > +
> > +            /// Type of the data associated with a PM transitions:
> > +            /// owned by the PMContext, though the transition is managed
> > +            /// by the driver.
> > +            type RuntimePayloadType;
> > +
> > +            /// Function that needs to be implemented by the driver
> > +            fn get_pmcontext(_: &Self::DriverDataType) -> Result<Self::PMContextRef<'_>>;
> > +
> > +            $(
> > +                #[allow(missing_docs)]
> > +                // Callback-specific docs are provided by the generated `dev_pm_ops`
> > +                // contract on `PMOps`.
> > +
> > +                fn $name(
> > +                    _dev:  Self::DeviceType<'_>,
> > +                    _data: Option<Arc<Self::RuntimePayloadType>>
> > +                ) -> Result<
> > +                    Option<Arc<Self::RuntimePayloadType>>,
> > +                    (Option<Arc<Self::RuntimePayloadType>>, $crate::error::Error)
> > +                > {
> > +                    build_error!(VTABLE_DEFAULT_ERROR)
> > +                }
> > +            )+
> > +        }
> > +        paste!(
> > +            impl<T:PMOps> PMContext<T> {
> > +                #[allow(missing_docs)]
> > +                pub const PM_OPS: bindings::dev_pm_ops = bindings::dev_pm_ops {
> > +                    $( [<$name>]: if T::[<HAS_ $name:upper>] {
> > +                        Some([<$name _callback>]::<T>)
> > +                    } else {
> > +                        None
> > +                    }, )+
> > +                    ..PMOPS_NONE
> > +                };
> > +            }
> > +        );
> > +    }
> > +}
> > +
> > +/// Marker type for a PM context that is not yet enabled.
> > +pub struct Dormant;
> > +/// Marker type for a PM context that is enabled (runtime PM enabled).
> > +/// It does not by itself mean that the device is currently runtime-active;
> > +/// use `active()` or `suspended()` to query the runtime state.
> > +pub struct Active;
> > +
> > +#[pin_data]
> > +struct PMRuntimeState<T: PMOps> {
> > +    current_state: Atomic<u32>,
> > +    #[pin]
> > +    data: Mutex<Option<Arc<T::RuntimePayloadType>>>,
> > +}
> > +
> > +impl<T: PMOps> PMRuntimeState<T> {
> > +    fn new() -> impl PinInit<Self> {
> > +        pin_init!(Self {
> > +            current_state: Atomic::new(RuntimePMState::Unknown.into()),
> > +            data <- new_mutex!(None)
> > +        })
> > +    }
> > +}
> > +
> > +/// Runtime PM context tied to a device.
> > +pub struct PMContext<T: PMOps, State = Dormant> {
> > +    dev: ARef<device::Device>,
> > +    /// Optional driver-selected runtime PM request profiles.
> > +    ///
> > +    /// Set of runtime PM predefined profiles that can be used by the driver
> > +    /// when requesting a PM transition. This might be useful when a driver
> > +    /// has several different PM usage patterns.
> > +    /// See [crate::module::Profile] for more details.
> > +    pub profiles: Option<KVec<Profile>>,
> > +    state: Pin<KBox<PMRuntimeState<T>>>,
> > +
> > +    _marker: PhantomData<State>,
> > +}
> > +
> > +define_pm_ops!(
> > +        // PM state change : (expected current state, tranition state, final expected state)
> > +        runtime_suspend : (Active, Suspending, Suspended),
> > +        runtime_resume  : (Suspended, Resuming, Active),
> > +);
> > +
> > +impl<T: PMOps, State> PMContext<T, State> {
> > +    /// Takes ownership of the stored runtime PM payload.
> > +    #[inline]
> > +    fn current_payload(&self) -> Option<Arc<<T as PMOps>::RuntimePayloadType>> {
> > +        self.state.data.lock().take()
> > +    }
> > +
> > +    /// Stores the runtime PM payload for the next transition.
> > +    #[inline]
> > +    fn update_payload(&self, data: Option<Arc<<T as PMOps>::RuntimePayloadType>>) {
> > +        *self.state.data.lock() = data;
> > +    }
> > +
> > +    /// Calls `f` with a reference to the currently stored runtime PM payload.
> > +    ///
> > +    /// The payload is driver-defined and represents the data associated with
> > +    /// the current runtime PM state.
> > +    ///
> > +    pub fn with_payload(
> > +        &self,
> > +        f: impl FnOnce(&Option<Arc<<T as PMOps>::RuntimePayloadType>>) -> Result,
> > +    ) -> Result {
> > +        let state = self.state.data.lock().clone();
> > +        f(&state)
> > +    }
> > +}
> > +
> > +impl<T: PMOps> PMContext<T, Dormant> {
> > +    /// Creates a dormant PM context for a device.
> > +    ///
> > +    /// `profiles` is an optional driver-defined [`Profile`] preset that are later
> > +    /// selected by the driver when requesting runtime PM transitions.
> > +    #[inline]
> > +    pub fn new(
> > +        dev: &device::Device,
> > +        profiles: Option<KVec<Profile>>,
> > +    ) -> Result<Self> {
> > +        Ok(Self {
> > +            dev: dev.into(),
> > +            profiles,
> > +            state: KBox::pin_init(PMRuntimeState::new(), GFP_KERNEL)?,
> > +            _marker: PhantomData,
> > +        })
> > +    }
> > +
> > +    /// Initialize the RPM state.
> > +    /// The caller is responsible for configuring the runtime payload
> > +    /// approprietaly for chosen state.
> > +    /// Intendend to be called prior to enabling full pm runtime,
> > +    /// i.e. during probe when the device's private data is not yet set.
> > +    pub fn init_state(
> > +        &self,
> > +        runtime_state: RuntimePMState,
> > +        data: Option<Arc<T::RuntimePayloadType>>,
> > +    ) -> Result {
> > +        match runtime_state {
> > +            RuntimePMState::Active => {
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                to_result(unsafe { bindings::pm_runtime_set_active(self.dev.as_raw()) })
> > +            }
> > +            RuntimePMState::Suspended => {
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                to_result(unsafe { bindings::pm_runtime_set_suspended(self.dev.as_raw()) })
> > +            }
> > +            _ => return Err(EINVAL),
> > +        }?;
> > +
> > +        self.update_payload(data);
> > +        self.state
> > +            .current_state
> > +            .store(runtime_state.into(), Release);
> > +        Ok(())
> > +    }
> > +
> > +    /// Enables runtime PM and returns an active PMContext.
> > +    #[inline]
> > +    pub fn enable(self) -> Result<PMContext<T, Active>> {
> > +        Request::runtime_enable(&self.dev)?;
> > +
> > +        let PMContext {
> > +            dev,
> > +            profiles,
> > +            state,
> > +            ..
> > +        } = self;
> > +
> > +        // In case the PM state has not been initialized upfront
> > +        let _ = state.current_state.cmpxchg(
> > +            RuntimePMState::Unknown.into(),
> > +            RuntimePMState::Suspended.into(),
> > +            Release,
> > +        );
> > +        Ok(PMContext {
> > +            dev,
> > +            profiles,
> > +            state,
> > +            _marker: PhantomData,
> > +        })
> > +    }
> > +}
> > +
> > +/// Runtime PM request profile.
> > +///
> > +/// `PMContext` can store a driver-provided set of profiles in
> > +/// [`PMContext::profiles`].
> > +///
> > +/// # Example:
> > +///
> > +/// ```ignore
> > +/// enum PMProfile {
> > +///     RegisterAccess = 0,
> > +///     SubmitJob = 1,
> > +/// }
> > +///
> > +/// let profiles = KVec::from_iter([
> > +///     // Synchronous resume/suspend. Useful for short register accesses where
> > +///     // the caller needs the device powered before continuing.
> > +///     Profile::new(),
> > +///
> > +///     // Resume synchronously, then allow autosuspend when the scope is
> > +///     // dropped.
> > +///     Profile::new().auto(),
> > +///
> > +/// ], GFP_KERNEL)?;
> > +///
> > +/// let pm = PMContext::new(dev, Some(profiles))?;
> > +/// pm.apply_config(
> > +///     &[PMConfig::AutoSuspend(true),PMConfig::AutoSuspendDelay(300)]
> > +/// )?;
> > +///
> > +/// let pm = pm.enable()?;
> > +///
> > +/// let profile = pm.profiles
> > +///     .as_ref()
> > +///     .ok_or(EINVAL)?[PMProfile::SubmitJob as usize];
> > +///
> > +/// pm.with_get(profile, || {
> > +///     submit_job_to_device()?;
> > +///     Ok(())
> > +/// })?;
> > +///
> > +/// ```
> > +pub struct Profile(Mode);
> > +
> > +impl Profile {
> > +    /// Creates a profile with default SYNC mode set.
> > +    pub const fn new() -> Self {
> > +        Self(Mode::SYNC)
> > +    }
> > +    /// /Enables async PM operations for this profile.
> > +    pub const fn r#async(self) -> Self {
> > +        Self(mode!(self.0, Mode::ASYNC))
> > +    }
> > +    /// Use autosuspend
> > +    pub const fn auto(self) -> Self {
> > +        Self(mode!(self.0, Mode::AUTO))
> > +    }
> > +    /// Requests idle handling for this profile.
> > +    pub const fn idle(self) -> Self {
> > +        Self(mode!(self.0, Mode::IDLE))
> > +    }
> > +    /// Do not wait for concurrent requests to finish.
> > +    pub const fn nowait(self) -> Self {
> > +        Self(mode!(self.0, Mode::NOWAIT))
> > +    }
> > +}
> > +
> > +impl Default for Profile {
> > +     fn default() -> Self {
> > +         Self::new()
> > +     }
> > +}
> > +
> > +impl<T: PMOps> PMContext<T, Active> {
> > +    #[inline(always)]
> > +    fn record_transition(
> > +        &self,
> > +        expected_state: RuntimePMState,
> > +        new_state: RuntimePMState,
> > +    ) -> Result {
> > +        self.state
> > +            .current_state
> > +            .cmpxchg(expected_state.into(), new_state.into(), Full)
> > +            .map(|_| ())
> > +            .map_err(|_| EINVAL)
> > +    }
> > +
> > +    #[inline(always)]
> > +    fn set_state(&self, new_state: RuntimePMState) {
> > +        self.state.current_state.store(new_state.into(), Release);
> > +    }
> > +
> > +    /// Returns whether the runtime PM state is active.
> > +    ///
> > +    /// This reflects the state tracked by [`PMContext`], not a direct query of
> > +    /// the PM core's internal `RPM_*` state.
> > +    #[inline(always)]
> > +    pub fn active(&self) -> bool {
> > +        self.state
> > +            .current_state
> > +            .load(Acquire)
> > +            .try_into()
> > +            .unwrap_or(RuntimePMState::Unknown)
> > +            == RuntimePMState::Active
> > +    }
> > +
> > +    /// Returns whether the runtime PM state is suspended.
> > +    ///
> > +    /// This reflects the state tracked by [`PMContext`], not a direct query of
> > +    /// the PM core's internal `RPM_*` state.
> > +    #[inline(always)]
> > +    pub fn suspended(&self) -> bool {
> > +        self.state
> > +            .current_state
> > +            .load(Acquire)
> > +            .try_into()
> > +            .unwrap_or(RuntimePMState::Unknown)
> > +            == RuntimePMState::Suspended
> > +    }
> > +
> > +    /// Creates a `ResumeScope` for the given profile.
> > +    #[inline]
> > +    pub fn resume(&self, profile: Profile) -> Result<ResumeScope> {
> > +        ResumeScope::new(self.dev.clone(), profile.0)
> > +    }
> > +
> > +    /// Creates an `AwakeScope` for the given profile.
> > +    #[inline]
> > +    pub fn get(&self, profile: Profile) -> Result<AwakeScope> {
> > +        AwakeScope::new(self.dev.clone(), profile.0 | Mode::ACQUIRE)
> > +    }
> > +
> > +    /// Creates a `RetainScope` for this device.
> > +    pub fn hold(&self) -> Result<RetainScope> {
> > +        RetainScope::new(self.dev.clone())
> > +    }
> > +    /// Runs a closure while holding a `ResumeScope`.
> > +    pub fn with_resume<R>(&self, profile: Profile, f: impl FnOnce() -> Result<R>) -> Result<R> {
> > +        if profile.0.contains(Mode::ASYNC) {
> > +            return Err(EINVAL);
> > +        }
> > +        let _scope = self.resume(profile)?;
> > +        f()
> > +    }
> > +    /// Runs a closure while holding an `AwakeScope`.
> > +    pub fn with_get<R>(&self, profile: Profile, f: impl FnOnce() -> Result<R>) -> Result<R> {
> > +        if profile.0.contains(Mode::ASYNC) {
> > +            return Err(EINVAL);
> > +        }
> > +        let _scope = self.get(profile)?;
> > +        f()
> > +    }
> > +
> > +    /// Runs a closure while holding a `RetainScope`.
> > +    pub fn with_hold<R>(&self, f: impl FnOnce() -> Result<R>) -> Result<R> {
> > +        let _scope = self.hold()?;
> > +        f()
> > +    }
> > +}
> > +
> > +/// Configuration knobs for runtime PM.
> > +pub enum PMConfig {
> > +    /// Ignore child devices when suspending.
> > +    IgnoreChildren(bool),
> > +    /// Disable runtime PM callbacks.
> > +    NoCallbacks,
> > +    /// Mark device as IRQ-safe for runtime PM.
> > +    IrqSafe,
> > +    /// Enable or disable autosuspend.
> > +    AutoSuspend(bool),
> > +    /// Set autosuspend delay (milliseconds).
> > +    AutoSuspendDelay(u32),
> > +}
> > +
> > +impl<T: PMOps, State> PMContext<T, State> {
> > +    /// Applies runtime PM configuration options.
> > +    ///
> > +    /// Options are applied in the order provided. The currently supported
> > +    /// options do not report per-option failures.
> > +    ///
> > +    /// This may be called before or after runtime PM is enabled, depending on
> > +    /// the option and the driver's setup sequence.
> > +    pub fn apply_config(&self, opts: &[PMConfig]) -> Result {
> > +        #[cfg(not(CONFIG_PM))]
> > +        let _ = opts;
> > +        #[cfg(CONFIG_PM)]
> > +        for opt in opts {
> > +            match opt {
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                PMConfig::IgnoreChildren(v) => unsafe {
> > +                    bindings::pm_suspend_ignore_children(self.dev.as_raw(), *v)
> > +                },
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                PMConfig::NoCallbacks => unsafe {
> > +                    bindings::pm_runtime_no_callbacks(self.dev.as_raw())
> > +                },
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                PMConfig::IrqSafe => unsafe { bindings::pm_runtime_irq_safe(self.dev.as_raw()) },
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                PMConfig::AutoSuspend(v) => unsafe {
> > +                    bindings::__pm_runtime_use_autosuspend(self.dev.as_raw(), *v);
> > +                },
> > +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the underlying `Device` is
> > +                // guaranteed to be alive and `as_raw()` yields a valid pointer for the
> > +                // duration of this call.
> > +                PMConfig::AutoSuspendDelay(v) => unsafe {
> > +                    bindings::pm_runtime_set_autosuspend_delay(self.dev.as_raw(), *v as i32);
> > +                    bindings::__pm_runtime_use_autosuspend(self.dev.as_raw(), true);
> > +                },
> > +            }
> > +        }
> > +        Ok(())
> > +    }
> > +}
> > -- 
> > 2.43.0
> > 
