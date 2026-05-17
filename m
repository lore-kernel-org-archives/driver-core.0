Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65982DB7AE
	for <driver-core@lists.linux.dev>; Sun, 17 May 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779002679; cv=none; b=CXfNuMwUhqXWEsVVc7oY3D5zHsA8FjrKA5pMScPG2bxhmdQixp683HSZEkPtdzOPz5y6tY50AV7UL9kEEMyR10CUKTcsuH/gZKju/gbtdUsv659GFiBnPPcJvDM/eHvQZMRCdIZV9xNMuh7fzEIC5bXHZkcp3y7YQLMh2ZW2WG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779002679; c=relaxed/simple;
	bh=XrIr6VHk7phlvFdc49i2YnNxBeY/SPeA6umrecDqdlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AndCOCA1gEJmusChqLs0DIdw/IIXLH8obi+8daioma84RW2dqpNLI7OlS/Iggx+cl+eM5Qxjj1ILXJRihdWMQQPwBHcRg+nYXLdyq3IUxBIl61a2VL4ydWqqbMIdl4mHYyndYK02JVmrEybBPpHU3lY+dyIhxO+/4PxGe2o7qVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Ko4RcN79; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Ko4RcN79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779002666; x=1779261866;
	bh=vozz4x5ACzzJuWT+etveser6pVZyWa0D3mu3Rpizcqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ko4RcN79703Kn2n6rks2hQN6aaKrSPCigRfRWJLyxyO8O3ggnGtXzJTCmTA9ocjZb
	 oHBhF7vJOCjRFd59+GI1RnDvTssN5Itxm+TxYBSL7TQvPfafx2sLTiRrp5cl379lgq
	 +bq5w1EFQIYdKgiP0fiPV99VMpCirt28dt2yePmOrq3QojB3/+MK8wdwdhYRo/OWtB
	 hloq14uoC1WqMEqkH/qiiZ2jIqhR/MJqkKIukTQQxyXBwiuNX4mWlarN0MaQMubL54
	 0z24EnnqNbO6dhq3hRyAJtbxaSfyk5WWVvtkhYWxJ0TReF2lkKyL7y5mClGBdypwS2
	 L8a47vf5yyh9A==
X-Pm-Submission-Id: 4gJC9f6YvPz1DFG2
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] rust: Add runtime PM support
Date: Sun, 17 May 2026 10:20:54 +0300
Message-ID: <20260517072420.38902-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260514150957.3501924-2-beata.michalska@arm.com>
References: <20260514150957.3501924-1-beata.michalska@arm.com> <20260514150957.3501924-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Beata,=0D
=0D
Thank you for working on this. This will eventually be needed for the=0D
tyr GPU reset implementation.=0D
=0D
On Thu, 14 May 2026 17:09:03 +0200=0D
Beata Michalska <beata.michalska@arm.com> wrote:=0D
=0D
> Introduce a Rust abstraction for Linux runtime PM, centered around a=0D
> `PMContext` ownign a device reference and modeling the runtime PM=0D
> lifecycle. The context is initialised inactive and transitions into=0D
> active once the runtime PM gets enabled. The drivers might opt in to=0D
> initialize the devices power state prior to enabling the context, which=0D
> is advised at probe, when the actual PM callbacks cannot be fully served.=
=0D
> Once active, the context provides access to runtime PM operations and=0D
> request modes used to manage device power state transitions.=0D
> =0D
> Runtime PM callbacks are provided via a PMOps trait. The generated=0D
> dev_pm_ops callbacks retrieve the driver's PMContext from drvdata,=0D
> validate the expected transition, and transfer ownership of the=0D
> driver-defined runtime PM payload to the relevant callback. Once=0D
> the callback completes, ownership of the returned payload is=0D
> transferred back to the PMContext and stored for the next transition.=0D
> The payload returned by the callback is expected to reflect the=0D
> current runtime PM state of the device. On a successful transition,=0D
> the returned payload should represent the new state reached by=0D
> the device. If the transition fails, it is the responsibility of=0D
> the driver to return a payload either rolled back to the previous=0D
> state or left in a state that remains valid for subsequent runtime PM=0D
> transitions. At present, only runtime_suspend and runtime_resume=0D
> callbacks are supported.=0D
> =0D
> Profile and scoped runtime PM helpers are provided for common usage=0D
> patterns. ResumeScope resumes the device for the lifetime of the scope,=0D
> AwakeScope resumes the device while holding a runtime PM usage reference,=
=0D
> and RetainScope only increments the runtime PM usage count. References=0D
> are released on drop, and request behaviour is controlled through=0D
> driver-defined Profile values covering the common runtime PM request=0D
> modes.=0D
> =0D
> Additionally, PMConfig provides common runtime PM configuration options.=
=0D
> =0D
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>=0D
> ---=0D
>  rust/bindings/bindings_helper.h |   1 +=0D
>  rust/helpers/helpers.c          |   1 +=0D
>  rust/helpers/pm_runtime.c       |  38 ++=0D
>  rust/kernel/lib.rs              |   1 +=0D
>  rust/kernel/pm.rs               | 924 ++++++++++++++++++++++++++++++++=0D
>  5 files changed, 965 insertions(+)=0D
>  create mode 100644 rust/helpers/pm_runtime.c=0D
>  create mode 100644 rust/kernel/pm.rs=0D
> =0D
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h=0D
> index 446dbeaf0866..3a38db22681f 100644=0D
> --- a/rust/bindings/bindings_helper.h=0D
> +++ b/rust/bindings/bindings_helper.h=0D
> @@ -76,6 +76,7 @@=0D
>  #include <linux/pid_namespace.h>=0D
>  #include <linux/platform_device.h>=0D
>  #include <linux/pm_opp.h>=0D
> +#include <linux/pm_runtime.h>=0D
>  #include <linux/poll.h>=0D
>  #include <linux/property.h>=0D
>  #include <linux/pwm.h>=0D
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c=0D
> index 625921e27dfb..d67c69ebd33e 100644=0D
> --- a/rust/helpers/helpers.c=0D
> +++ b/rust/helpers/helpers.c=0D
> @@ -75,6 +75,7 @@=0D
>  #include "pci.c"=0D
>  #include "pid_namespace.c"=0D
>  #include "platform.c"=0D
> +#include "pm_runtime.c"=0D
>  #include "poll.c"=0D
>  #include "processor.c"=0D
>  #include "property.c"=0D
> diff --git a/rust/helpers/pm_runtime.c b/rust/helpers/pm_runtime.c=0D
> new file mode 100644=0D
> index 000000000000..9b2056110199=0D
> --- /dev/null=0D
> +++ b/rust/helpers/pm_runtime.c=0D
> @@ -0,0 +1,38 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +#include <linux/pm_runtime.h>=0D
> +=0D
> +void rust_helper_pm_runtime_get_noresume(struct device *dev)=0D
> +{=0D
> +	pm_runtime_get_noresume(dev);=0D
> +}=0D
> +=0D
> +void rust_helper_pm_runtime_put_noidle(struct device *dev)=0D
> +{=0D
> +	pm_runtime_put_noidle(dev);=0D
> +}=0D
> +=0D
> +void rust_helper_pm_runtime_mark_last_busy(struct device *dev)=0D
> +{=0D
> +	pm_runtime_mark_last_busy(dev) ;=0D
> +}=0D
> +=0D
> +bool rust_helper_pm_runtime_active(struct device *dev)=0D
> +{=0D
> +	return pm_runtime_active(dev);=0D
> +}=0D
> +=0D
> +void rust_helper_pm_suspend_ignore_children(struct device *dev, bool ena=
ble)=0D
> +{=0D
> +	pm_suspend_ignore_children(dev, enable);=0D
> +}=0D
> +=0D
> +int rust_helper_pm_runtime_set_active(struct device *dev)=0D
> +{=0D
> +	return pm_runtime_set_active(dev);=0D
> +}=0D
> +=0D
> +int rust_helper_pm_runtime_set_suspended(struct device *dev)=0D
> +{=0D
> +	return pm_runtime_set_suspended(dev);=0D
> +}=0D
=0D
You should add __rust_helper prefixes to helper functions.=0D
=0D
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs=0D
> index b72b2fbe046d..7e51e497e2f0 100644=0D
> --- a/rust/kernel/lib.rs=0D
> +++ b/rust/kernel/lib.rs=0D
> @@ -105,6 +105,7 @@=0D
>  pub mod pci;=0D
>  pub mod pid_namespace;=0D
>  pub mod platform;=0D
> +pub mod pm;=0D
>  pub mod prelude;=0D
>  pub mod print;=0D
>  pub mod processor;=0D
> diff --git a/rust/kernel/pm.rs b/rust/kernel/pm.rs=0D
> new file mode 100644=0D
> index 000000000000..7bdffa727c71=0D
> --- /dev/null=0D
> +++ b/rust/kernel/pm.rs=0D
> @@ -0,0 +1,924 @@=0D
> +// SPDX-License-Identifier: GPL-2.0=0D
> +=0D
> +//! Rust Runtime Power Management abstraction.=0D
> +//!=0D
> +//! C header: [`include/linux/pm_runtime.h`](srctree/include/linux/pm_ru=
ntime.h)=0D
> +=0D
> +use crate::{=0D
> +    bindings, device,=0D
> +    error::{to_result, VTABLE_DEFAULT_ERROR},=0D
> +    macros::paste,=0D
> +    prelude::*,=0D
> +    sync::aref::ARef,=0D
> +    sync::atomic::{=0D
> +        ordering::{Acquire, Full, Release},=0D
> +        Atomic,=0D
> +    },=0D
> +    sync::Arc,=0D
> +    sync::{new_mutex, Mutex},=0D
> +};=0D
=0D
We started using vertical format on imports like:=0D
=0D
	use crate::{=0D
		bindings,=0D
		device,=0D
		error::{=0D
			to_result,=0D
			VTABLE_DEFAULT_ERROR,=0D
			//=0D
		},=0D
		...=0D
=0D
to avoid conflict issues.=0D
=0D
> +=0D
> +use core::marker::PhantomData;=0D
> +=0D
> +/// Runtime Power Management modes that determine how a particular PM=0D
> +/// transition is to be carried out.=0D
> +/// Corresponds to C Runtime PM flag argument bits:=0D
> +/// - `RPM_ASYNC`=0D
> +/// - `RPM_NOWAIT`=0D
> +/// - `RPM_GET_PUT`=0D
> +/// - `RPM_AUTO`=0D
> +#[derive(Clone, Copy, PartialEq, Eq, Debug)]=0D
> +struct Mode(u32);=0D
> +=0D
> +impl Mode {=0D
> +    /// Synchronous PM operations - default.=0D
> +    #[allow(unused)]=0D
> +    const SYNC: Mode =3D Mode(0);=0D
=0D
This seems to be used in Profile::new, why do we need `#[allow(unused)]` he=
re?=0D
=0D
> +    /// Allow asynchronous PM operations.=0D
> +    const ASYNC: Mode =3D Mode(bindings::RPM_ASYNC);=0D
> +    /// Do not wait for any pending rquests to finish.=0D
> +    const NOWAIT: Mode =3D Mode(bindings::RPM_NOWAIT);=0D
> +    /// Acquire a runtime-PM usage reference.=0D
> +    const ACQUIRE: Mode =3D Mode(bindings::RPM_GET_PUT);=0D
> +    /// Use autosuspend.=0D
> +    const AUTO: Mode =3D Mode(bindings::RPM_AUTO);=0D
> +    /// Additional mode for devices supporting idle states.=0D
> +    const IDLE: Mode =3D Mode(1 << 16);=0D
> +=0D
> +    const fn join(self, other: Self) -> Self {=0D
> +        Self(self.0 | other.0)=0D
> +    }=0D
> +=0D
> +    fn contains(self, other: Self) -> bool {=0D
> +        (self.0 & other.0) !=3D 0=0D
> +    }=0D
> +}=0D
> +=0D
> +impl core::ops::BitOr for Mode {=0D
> +    type Output =3D Self;=0D
> +    fn bitor(self, rhs: Self) -> Self::Output {=0D
> +        Self(self.0 | rhs.0)=0D
> +    }=0D
> +}=0D
> +=0D
> +impl core::ops::BitAnd for Mode {=0D
> +    type Output =3D Self;=0D
> +    fn bitand(self, rhs: Self) -> Self::Output {=0D
> +        Self(self.0 & rhs.0)=0D
> +    }=0D
> +}=0D
> +=0D
> +impl core::ops::Not for Mode {=0D
> +    type Output =3D Self;=0D
> +    fn not(self) -> Self::Output {=0D
> +        Self(!self.0)=0D
> +    }=0D
> +}=0D
> +=0D
> +impl From<Mode> for core::ffi::c_int {=0D
> +    #[inline]=0D
> +    fn from(mode: Mode) -> core::ffi::c_int {=0D
> +        mode.0 as core::ffi::c_int=0D
> +    }=0D
> +}=0D
> +=0D
> +/// Utility macro for combining multiple request modes=0D
> +macro_rules! mode {=0D
> +    ($mode:expr $(, $args:expr)+ $(,)?) =3D> {{=0D
> +        let mut new_mode =3D $mode;=0D
> +        $( new_mode =3D new_mode.join($args); )+=0D
> +        new_mode=0D
> +    }};=0D
> +}=0D
> +=0D
> +/// Runtime power transition scope.=0D
> +pub struct Scope<Tag> {=0D
> +    dev: ARef<device::Device>,=0D
> +    mode: Mode,=0D
> +    _tag: PhantomData<Tag>,=0D
> +}=0D
> +=0D
> +/// Device resumed without incrementing the device's usage count=0D
> +pub struct Resume;=0D
> +/// Device resumed with the devices'a usage count being incremented=0D
> +pub struct Awake;=0D
> +/// Device with increased usage reference=0D
> +pub struct Retain;=0D
> +=0D
> +/// Resumes the device without acquiring the usage reference.=0D
> +/// Note: This does not guarantee the device will be kept active=0D
> +/// for the lifetime of the scope due to potentil pending suspend=0D
> +/// requests.=0D
> +///=0D
> +/// On drop:=0D
> +/// - If `Mode::IDLE`, calls `__pm_runtime_idle()`:=0D
> +///   triggers idle notification before attempting to suspend=0D
> +/// - If `Mode::AUTO`, marks last busy then calls `__pm_runtime_suspend(=
)`.=0D
> +/// - Otherwise calls `__pm_runtime_suspend()`.=0D
> +///=0D
> +/// The guard must be dropped from a context matching the requested tran=
sition=0D
> +/// mode: sync vs async.=0D
> +#[must_use =3D "dropping this guard issues the matching runtime PM relea=
se request"]=0D
> +pub struct ResumeScope(Scope<Resume>);=0D
> +=0D
> +/// Acquires a runtime-PM usage reference and keeps the device powered.=
=0D
> +///=0D
> +/// Requires `Mode::ACQUIRE`. Drop behavior matches `ResumeScope`.=0D
> +/// The guard must be dropped from a context matching the requested tran=
sition=0D
> +/// mode: sync vs async.=0D
> +#[must_use =3D "dropping this guard releases its runtime PM hold"]=0D
> +pub struct AwakeScope(Scope<Awake>);=0D
> +=0D
> +/// Prevents the device from getting suspended by holding the usage refe=
rence=0D
> +/// count.=0D
> +///=0D
> +/// On drop, calls `pm_runtime_put_noidle()`.=0D
> +#[must_use =3D "dropping this guard releases its runtime PM hold"]=0D
> +pub struct RetainScope(Scope<Retain>);=0D
> +=0D
> +impl ResumeScope {=0D
> +    fn new(dev: ARef<device::Device>, mode: Mode) -> Result<Self> {=0D
> +        if mode.contains(Mode::ACQUIRE) {=0D
> +            // Mode::ACQUIRE is intended to be used with Awake scope=0D
> +            // Avoid mixing the modes.=0D
> +            return Err(EINVAL);=0D
> +        }=0D
> +=0D
> +        // Mode::IDLE is internal so strip it of before passing further=
=0D
> +        Request::resume(&dev, mode & !Mode::IDLE).map(|()| {=0D
> +            Self(Scope::<Resume> {=0D
> +                dev: dev.clone(),=0D
> +                mode,=0D
> +                _tag: PhantomData,=0D
> +            })=0D
> +        })=0D
> +    }=0D
> +}=0D
> +=0D
> +impl Drop for ResumeScope {=0D
> +    fn drop(&mut self) {=0D
> +        let scope_mode =3D self.0.mode & !Mode::IDLE;=0D
> +=0D
> +        match self.0.mode {=0D
> +            mode if mode.contains(Mode::IDLE) =3D> {=0D
> +                Request::idle(&self.0.dev, scope_mode & Mode::ASYNC);=0D
> +            }=0D
> +            mode if mode.contains(Mode::AUTO) =3D> {=0D
> +                Request::mark_last_busy(&self.0.dev);=0D
> +                let _ =3D Request::suspend(&self.0.dev, scope_mode).insp=
ect_err(|_| {=0D
> +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend dev=
ice\n");=0D
> +                });=0D
> +            }=0D
> +            _ =3D> {=0D
> +                let _ =3D Request::suspend(&self.0.dev, scope_mode).insp=
ect_err(|_| {=0D
> +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend dev=
ice\n");=0D
> +                });=0D
> +            }=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +impl AwakeScope {=0D
> +    fn new(dev: ARef<device::Device>, mode: Mode) -> Result<Self> {=0D
> +        if !mode.contains(Mode::ACQUIRE) {=0D
> +            return Err(EINVAL);=0D
> +        }=0D
> +        // Mode::IDLE is internal so strip it of before passing further=
=0D
> +        Request::resume(&dev, mode & !Mode::IDLE)=0D
> +            .inspect_err(|_| Request::put_noidle(&dev))=0D
> +            .map(|()| {=0D
> +                Self(Scope::<Awake> {=0D
> +                    dev: dev.clone(),=0D
> +                    mode,=0D
> +                    _tag: PhantomData,=0D
> +                })=0D
> +            })=0D
> +    }=0D
> +}=0D
> +=0D
> +impl Drop for AwakeScope {=0D
> +    fn drop(&mut self) {=0D
> +        let scope_mode =3D self.0.mode & !Mode::IDLE;=0D
> +        match self.0.mode {=0D
> +            mode if mode.contains(Mode::IDLE) =3D> {=0D
> +                Request::idle(&self.0.dev, scope_mode);=0D
> +            }=0D
> +            mode if mode.contains(Mode::AUTO) =3D> {=0D
> +                Request::mark_last_busy(&self.0.dev);=0D
> +                let _ =3D Request::suspend(&self.0.dev, scope_mode).insp=
ect_err(|_| {=0D
> +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend dev=
ice\n");=0D
> +                });=0D
> +            }=0D
> +            _ =3D> {=0D
> +                let _ =3D Request::suspend(&self.0.dev, scope_mode).insp=
ect_err(|_| {=0D
> +                    dev_err!(self.0.dev.as_ref(), "Failed to suspend dev=
ice\n");=0D
> +                });=0D
> +            }=0D
> +        }=0D
> +    }=0D
> +}=0D
> +=0D
> +impl RetainScope {=0D
> +    fn new(dev: ARef<device::Device>) -> Result<Self> {=0D
> +        Request::get_noresume(&dev);=0D
> +        Ok(Self(Scope::<Retain> {=0D
> +            dev,=0D
> +            mode: Mode(0),=0D
=0D
This is Mode::SYNC.=0D
=0D
Regards,=0D
Onur=0D
=0D
[...]=0D
=0D
> +=0D
> +impl<T: PMOps, State> PMContext<T, State> {=0D
> +    /// Applies runtime PM configuration options.=0D
> +    ///=0D
> +    /// Options are applied in the order provided. The currently support=
ed=0D
> +    /// options do not report per-option failures.=0D
> +    ///=0D
> +    /// This may be called before or after runtime PM is enabled, depend=
ing on=0D
> +    /// the option and the driver's setup sequence.=0D
> +    pub fn apply_config(&self, opts: &[PMConfig]) -> Result {=0D
> +        #[cfg(not(CONFIG_PM))]=0D
> +        let _ =3D opts;=0D
> +        #[cfg(CONFIG_PM)]=0D
> +        for opt in opts {=0D
> +            match opt {=0D
> +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the=
 underlying `Device` is=0D
> +                // guaranteed to be alive and `as_raw()` yields a valid =
pointer for the=0D
> +                // duration of this call.=0D
> +                PMConfig::IgnoreChildren(v) =3D> unsafe {=0D
> +                    bindings::pm_suspend_ignore_children(self.dev.as_raw=
(), *v)=0D
> +                },=0D
> +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the=
 underlying `Device` is=0D
> +                // guaranteed to be alive and `as_raw()` yields a valid =
pointer for the=0D
> +                // duration of this call.=0D
> +                PMConfig::NoCallbacks =3D> unsafe {=0D
> +                    bindings::pm_runtime_no_callbacks(self.dev.as_raw())=
=0D
> +                },=0D
> +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the=
 underlying `Device` is=0D
> +                // guaranteed to be alive and `as_raw()` yields a valid =
pointer for the=0D
> +                // duration of this call.=0D
> +                PMConfig::IrqSafe =3D> unsafe { bindings::pm_runtime_irq=
_safe(self.dev.as_raw()) },=0D
> +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the=
 underlying `Device` is=0D
> +                // guaranteed to be alive and `as_raw()` yields a valid =
pointer for the=0D
> +                // duration of this call.=0D
> +                PMConfig::AutoSuspend(v) =3D> unsafe {=0D
> +                    bindings::__pm_runtime_use_autosuspend(self.dev.as_r=
aw(), *v);=0D
> +                },=0D
> +                // SAFETY: `self.dev` is a valid `&ARef<Device>`, so the=
 underlying `Device` is=0D
> +                // guaranteed to be alive and `as_raw()` yields a valid =
pointer for the=0D
> +                // duration of this call.=0D
> +                PMConfig::AutoSuspendDelay(v) =3D> unsafe {=0D
> +                    bindings::pm_runtime_set_autosuspend_delay(self.dev.=
as_raw(), *v as i32);=0D
> +                    bindings::__pm_runtime_use_autosuspend(self.dev.as_r=
aw(), true);=0D
> +                },=0D
> +            }=0D
> +        }=0D
> +        Ok(())=0D
> +    }=0D
> +}=0D
> -- =0D
> 2.43.0=0D
> =0D
