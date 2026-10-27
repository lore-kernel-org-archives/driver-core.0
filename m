Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793116902;
	b=nTZNG0nyrV9d+eVdKO6tHelusTovg5TpxIDEXHYarP9XVL83ppyrKZww5KSR5zCZWCHa
	 U74NhMzwWpo122KXLcNDbLwb/QQE4XxOLdvPIYJ+TOtfnYM+LAKptKLzIqI5x9bobvlQr
	 W8+vWIgPBODzZ25k1udw9DmjDlyVS9hbuPwuC92EzN86S//D4pgjcG0AvtaNmLb+oxMaG
	 cHCcTJzXTVOHqoZCr7OKImacb19WdM+an71PtFdIddh5Xzr7G8Ra0zZSJpo+M4iNAnJ7r
	 86oCYB+padDo9W0wron9VLNIqvBbgvF5svTY9qEP5ZogyY9BloEKApkR4tZJHBd92gQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bdT3D+5oUO/jp2H0mchjeHCyIHynK+r7g48DQ7wQVYI=;
	b=lj9tvnOZONDSU9Q6gwziUJ0Y9ZGL56UHbdpY7XfSAz+ZpCVSaVX0XSguOHP93nVrWsYo
	 +lluKJhclLsA+RNMd9p07eS+RkOUEOKrSKs2apYzXA1OI7YRufUK1/m+X/EUgWwKgZD6X
	 EO0gV+HrbyQJeH2B3EP1xnoNbhdBEdXnHuElPOZMaOFWb5jwN5l3zIN7md4tMuBrZabAU
	 QJc/zwSSDMWraWSuMYQmD+KHECMqYQ8pkPTAFErZFdIk+m1z5h/JLKAiaGZ49yXe3Fqcz
	 rBirqoUVsOVV9Jq5o4+Eqi6qQGJPHB5tsz7HakmL2J+Wn7TzbxqF/p2+4rg9vD7H7tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+IgODLU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EF606A31B
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 16:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 875EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+IgODLU
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a98f260f85so39438081fa.0
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 09:01:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793116900; cv=none;
        d=google.com; s=arc-20260327;
        b=gJeN+PCl8Qcj/ej9SCE5rkJBxhoeFyhwgpCc+I1MLtBpUeQE6EzpcQodWceIok3mij
         T28Bn6JfLd+kkWOnlKpxNYUuNAf5ECISC/WEbnHFBkBBvUSjFLWa/E24dnCmuiKBge6p
         kw2LVEAyuzZAQovOhQKAwY0q45iORFsWbBySz3aXjrtLC0HCBw30vq41J2vr5g1kMUYu
         lUz1TDvqkijKON0NGEofvwdwona4N4ABXwYbocFokKM/IMgjotNGjBoGtCTcoTP6re1K
         uYDnINmUTTAjYGQyTTtX9o6kAqSN6qjNdv1xrJu6e1CyUhianrFmTFdG8GoPbbyW2+45
         caqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bdT3D+5oUO/jp2H0mchjeHCyIHynK+r7g48DQ7wQVYI=;
        fh=bmY1ES+MifBuq6wRAZCDRkBoVcq0bb8Q4FMng4C6i2A=;
        b=gGtZryeCHE3tmOCqh6fV4u7vOT2yDrQZYQ0vucqYrorXgLnPdBZDWRVAS7WAugFWNy
         HbNNG+rDuxAQvt7Zi0PUtOA8Tp+Ggfv87O8HiZtYdhu/J03JFmJGp9qCxdsrVMlKEz+F
         axi8IlYsEY/ZYxLhFvwH2ABduuZhXyTi6X7yI3wiTdjx18+XKgDENmpjtPkKGCEZ7LtQ
         RQmtW5TnKcuVRWf/Z6ZwMZxNiOrQAt02QO3xIWy7M6MHf7FoiCEPmniiwqoCq0QZ7prv
         uYl9wfMma+ENxbllFL3qoZmngfhDbZ89ih1ywFdv+cSYp3Ud81DPE1DTbORpCj8b5X6d
         yhgQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116900; x=1793721700; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdT3D+5oUO/jp2H0mchjeHCyIHynK+r7g48DQ7wQVYI=;
        b=g+IgODLUW7aI9tcbRvHnbLOhlpBUwLvMloTfgkoOhmqoON7o71+GwRKh3tk/uZb/oP
         d/1VQ3+3517ijupmFj44U9C2sArPcHTxx/LIO+i36BpF+CbHbF/gqZlhhkcZ13D6oq+5
         8+bVDdXJdBncUJHQlYWydCIQad0Dp+c85HQwbpkXMjN9sW8GQLL31yNQMijx+AnITp0b
         9el32QAgdLJMtZqI5Pg/x4w572yJCUUvy8q38ZHC5rZ54lmUDLk7JHLoc76cr+6lCvmh
         W6aqO2Y8nXvQVU9pIfjSPs/EODufJCylvFCrqgxzKiVFkzsUMSrdUW5JbgoZgdsCdXfo
         hW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116900; x=1793721700;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bdT3D+5oUO/jp2H0mchjeHCyIHynK+r7g48DQ7wQVYI=;
        b=qjsUDF2pKzTSeCY5rnR+61sbBMJud0pGqyaqaTEURb0xrKAyxQTAonTNzke6SM92hq
         WkRzM5XBgJqtF8F5YtbuH6KKM0ZeqQeo6+XbBMkTxN2aa8to/77j/EquE1uPSPRmvr8T
         BB44k2aR/g7gGg97K+Iesa0+3S9fLYCNKVIKMaJmS0gYPz42CWg4TGeyy/d28fotZ8JD
         GrVuCgPZMHC/vmwSwqCuu685fnBKqRidEtGaF4nwCdOUcAH70ngywushIa5tjGBgXnxC
         kf3kr+nA8R1IJ6cZkVMDewRfr60N65oVsZvcwvSjbsIzGX7bLZNbhQqvYNXmYaJHnAV2
         3Hkw==
X-Forwarded-Encrypted: i=1; AKwUvBxUDSUOPQHNg1KcVcL29RdaIol841VOyX0VGCRkFJQQipXczJxRQpivJAeARHL0ffxtqV/bSZTRpZ2jwQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIZz6KeLDMEhrvFAEzQmpKFupfN9QCreQxKj5/CVsqS+bbO8yDs
	DtXwCW2L5xEDJtjyIonXpvqPQJtkWbgpZNL7dVuBy8peK+TeML3kaWNeehE6ojJELos2+RV+QKr
	+TVkmtPlrcbkQlxaKa8cHirhRXy3L+kY=
X-Gm-Gg: AYBFou1k3ztx8xZUFjspJYPNooDiUOKnjAx8aNS7nFYD3yPXfjHpFt7Rrx1LXIUaJB5
	6ItC0LK3uYeBkUC9cqB5KAlS/MSSYbr2hTy85iR1aLkLAlsWlpbaKkBYi0k96RRrMdiVnDxfl5g
	0by06Dieqm5qq+T6aFdUZjNefdSgPEDt74TFzZ2g51JP4VmY/JMtek8FZsyd/Pb2Lz0u3pYmAoC
	+m9m04aQGKWJzaGfL9ttr1j2PE9eKlgIntkWZQ8f3Mf20Y1NrLR/JhVqO+DUarTUngLI7ALb+lx
	fZsQifHNN1tDlmBVXJckZewBwLj0upXEA/B+dvpnTQvz72kO3Aw9o81zpXd0T+IXyyT6QnlcHWP
	7YXBpWGg/GKfvnaa6ywUoC6DJnLbq4KbXWbwk7s8tvsLzfMLgzsgOFJU24zw=
X-Received: by 2002:a2e:b88a:0:b0:3a9:707e:ad88 with SMTP id
 38308e7fff4ca-3ac6fb00e5fmr31194041fa.2.1793116899535; Tue, 27 Oct 2026
 09:01:39 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <179260197668.3127.18219777718091081046@linux.dev> <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
 <179286358623.55649.5397316745104390556@linux.dev>
In-Reply-To: <179286358623.55649.5397316745104390556@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Tue, 27 Oct 2026 23:01:27 +0700
X-Gm-Features: AclHuK9XyZS4JOmzYbfgvE22vBOI3uerZPKafh4gT7tPY74tjD-uKeEtjig8Twc
Message-ID: <CAO26r3Qk3bEUwL1=MyHP6hu_YQNSN-uD_2-ceA0KtK=ejxLf2g@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Oct 2026 at 00:39, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Hi Coirul,
>
> Here's the full diff, applied on top of your v6 patches 3 and 4.
>
> diff --git a/drivers/iio/position/as5600.rs b/drivers/iio/position/as5600.rs
> index b72775241e81..f2897fbf8aa2 100644
> --- a/drivers/iio/position/as5600.rs
> +++ b/drivers/iio/position/as5600.rs
> @@ -36,7 +36,8 @@
>          Device,
>          IioChanInfo,
>          IioDriver,
> -        IioVal, //
> +        IioVal,
> +        Registered, //
>      },
>      io::Io,
>      module_i2c_driver,
> @@ -65,14 +66,12 @@
>
>  i2c_device_table!(
>      I2C_TABLE,
> -    MODULE_I2C_TABLE,
>      <As5600 as Driver>::IdInfo,
>      [(DeviceId::new(c"as5600"), ())]
>  );
>
>  of_device_table!(
>      OF_TABLE,
> -    MODULE_OF_TABLE,
>      <As5600 as Driver>::IdInfo,
>      [(of::DeviceId::new(c"ams,as5600"), ())]
>  );
> @@ -97,25 +96,29 @@ unsafe impl Sync for As5600Channels {}
>  });
>
>  #[pin_data]
> -struct As5600Priv {
> +struct As5600Priv<'a> {
> +    client: &'a I2cClient<Bound>,
>      #[pin]
>      io_lock: Mutex<()>,
>  }
>
> +// SAFETY: `I2cClient<Bound>` methods go through kernel I2C core functions
> +// that provide their own synchronization (bus locking); no `&self` method
> +// exposes interior mutability. The borrowed `client` field can therefore be
> +// safely accessed and shared across threads like the rest of `As5600Priv`.
> +unsafe impl Send for As5600Priv<'_> {}
> +// SAFETY: See above.
> +unsafe impl Sync for As5600Priv<'_> {}
> +
>  // SAFETY: AS5600_CHANNELS contains one valid, immutable IIO_ANGL channel
>  // exposing only RAW and SCALE. It has no event or extension callbacks,
>  // and all optional pointer fields are null.
> -unsafe impl IioDriver for As5600Priv {
> -    fn read_raw(
> -        &self,
> -        parent: &kernel::device::Device<Bound>,
> -        _chan: *const iio_chan_spec,
> -        info: IioChanInfo,
> -    ) -> Result<IioVal> {
> +unsafe impl IioDriver for As5600Priv<'_> {
> +    fn read_raw(&self, _chan: *const iio_chan_spec, info: IioChanInfo) -> Result<IioVal> {
>          match info {
>              IioChanInfo::Raw => {
>                  let _guard = self.io_lock.lock();
> -                let client: &I2cClient<Bound> = parent.try_into()?;
> +                let client = self.client;
>
>                  let io = client.smbus_io();
>                  // Read status register to verify magnet presence before
> @@ -142,14 +145,17 @@ fn channels(&self) -> &'static [iio_chan_spec] {
>      }
>  }
>
> +struct As5600;
> +
>  #[pin_data]
> -struct As5600 {
> -    _registration: (),
> +struct As5600Data<'bound> {
> +    #[pin]
> +    _iio_dev: Device<As5600Priv<'bound>, Registered>,
>  }
>
>  impl Driver for As5600 {
>      type IdInfo = ();
> -    type Data<'bound> = As5600;
> +    type Data<'bound> = As5600Data<'bound>;
>
>      const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
>      const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
> @@ -162,15 +168,22 @@ fn probe<'bound>(
>          dev: &'bound I2cClient<Core<'_>>,
>          _id_info: Option<&'bound Self::IdInfo>,
>      ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
> -        try_pin_init!(As5600 {
> -            _registration: {
> +        try_pin_init!(As5600Data {
> +            _iio_dev: {
> +                // Deref coercion: I2cClient<Core<'_>> -> I2cClient<Bound>.
> +                let client: &'bound I2cClient<Bound> = dev;
> +
>                  let priv_init = pin_init!(As5600Priv {
> +                    client,
>                      io_lock <- new_mutex!(()),
>                  });
>
> -                Device::build_device(dev.as_ref(), c"as5600", INDIO_DIRECT_MODE, priv_init)?
> -                    .register(&crate::THIS_MODULE)?;
> +                let unregistered =
> +                    Device::build_device(dev.as_ref(), c"as5600", INDIO_DIRECT_MODE, priv_init)?;
> +                let registered =
> +                    unregistered.register(kernel::module::this_module::<crate::LocalModule>())?;
>                  dev_dbg!(dev.as_ref(), "AS5600 magnetic position sensor ready\n");
> +                registered
>              }
>          })
>      }
> diff --git a/rust/kernel/iio.rs b/rust/kernel/iio.rs
> index 9ad2f50948de..4648424c7600 100644
> --- a/rust/kernel/iio.rs
> +++ b/rust/kernel/iio.rs
> @@ -21,7 +21,6 @@
>          self,
>          Bound, //
>      },
> -    devres,
>      error::{
>          code::*,
>          to_result,
> @@ -159,15 +158,12 @@ pub enum IioVal {
>  pub unsafe trait IioDriver: Send + Sync {
>      /// Called by the IIO core to read channel information.
>      ///
> -    /// `parent` is the parent device supplied to [`Device::build_device`].
>      /// `chan` identifies the channel, and `info` selects the requested
> -    /// information, such as its raw value or scale.
> -    fn read_raw(
> -        &self,
> -        parent: &device::Device<Bound>,
> -        chan: *const iio_chan_spec,
> -        info: IioChanInfo,
> -    ) -> Result<IioVal>;
> +    /// information, such as its raw value or scale. Implementors must
> +    /// capture whatever bus-specific resources they need at registration
> +    /// time (see [`Device::build_device`]) rather than re-deriving them
> +    /// from a generic parent reference here.
> +    fn read_raw(&self, chan: *const iio_chan_spec, info: IioChanInfo) -> Result<IioVal>;
>
>      /// Returns the channel specifications for this driver.
>      ///
> @@ -204,16 +200,6 @@ fn channels(&self) -> &'static [iio_chan_spec] {
>      // initialized `T` that remains valid for the duration of this callback.
>      let driver = unsafe { &*priv_ptr };
>
> -    // SAFETY: `indio_dev` is valid by the callback contract. Its parent
> -    // was supplied as a bound device to `build_device`.
> -    //
> -    // During registration, the builder holds that bound parent borrow.
> -    // After ownership is transferred, parent devres runs the registered
> -    // device's destructor, which unregisters the IIO device and drains
> -    // the supported read_raw paths before destroying the private data.
> -    // The parent therefore remains bound throughout this callback.
> -    let parent = unsafe { device::Device::<Bound>::from_raw((*indio_dev).dev.parent) };
> -
>      // `info` is `long` from C. Negative values and values > u32::MAX
>      // are unsupported iio_chan_info variants; both map to EINVAL.
>      let info_enum = match u32::try_from(info)
> @@ -224,7 +210,7 @@ fn channels(&self) -> &'static [iio_chan_spec] {
>          None => return EINVAL.to_errno(),
>      };
>
> -    match driver.read_raw(parent, chan, info_enum) {
> +    match driver.read_raw(chan, info_enum) {
>          Ok(IioVal::Int(v)) => {
>              // SAFETY: `val` is valid per the function's Safety contract above.
>              // `val2` is not written; `IIO_VAL_INT` signals to the IIO core
> @@ -271,11 +257,8 @@ fn channels(&self) -> &'static [iio_chan_spec] {
>  pub struct Registered;
>
>  /// An initialized IIO device awaiting registration.
> -///
> -/// The parent remains bound until this builder is consumed or dropped.
> -pub struct UnregisteredDevice<'a, T: IioDriver> {
> +pub struct UnregisteredDevice<T: IioDriver> {
>      device: Device<T>,
> -    parent: &'a device::Device<Bound>,
>  }
>
>  /// An owned IIO device with in-place initialized driver data.
> @@ -363,12 +346,12 @@ impl<T: IioDriver> Device<T> {
>      /// Allocation and initialization errors are propagated.
>      ///
>      /// Call [`UnregisteredDevice::register`] to register the device.
> -    pub fn build_device<'a, E>(
> -        parent: &'a device::Device<Bound>,
> +    pub fn build_device<E>(
> +        parent: &device::Device<Bound>,
>          name: &'static CStr,
>          modes: u32,
>          init: impl PinInit<T, E>,
> -    ) -> Result<UnregisteredDevice<'a, T>>
> +    ) -> Result<UnregisteredDevice<T>>
>      where
>          Error: From<E>,
>      {
> @@ -406,7 +389,7 @@ pub fn build_device<'a, E>(
>          // large enough for `T`. The private data remains at a fixed address in
>          // the separate IIO allocation until it is dropped. On initialization
>          // failure, the error path only frees the allocation.
> -        let init_result = unsafe { init.__pinned_init(priv_ptr) };
> +        let init_result = unsafe { pin_init::raw_try_init(priv_ptr, init) };
>          if let Err(e) = init_result {
>              // SAFETY: `pin_init` guarantees partial-init rollback internally.
>              // `priv_` memory was not fully initialized, so we only free the
> @@ -446,21 +429,23 @@ pub fn build_device<'a, E>(
>              (*indio_dev).modes = modes;
>          }
>
> -        Ok(UnregisteredDevice { device, parent })
> +        Ok(UnregisteredDevice { device })
>      }
>  }
>
> -impl<T: IioDriver + 'static> UnregisteredDevice<'_, T> {
> -    /// Registers the IIO device and transfers ownership to parent devres.
> +impl<T: IioDriver> UnregisteredDevice<T> {
> +    /// Registers the IIO device.
>      ///
> -    /// Parent resource teardown unregisters the device and completes its
> -    /// supported `read_raw` callbacks before destroying the private data.
> +    /// The caller owns the returned, pinned [`Device<T, Registered>`] and is
> +    /// responsible for keeping it alive for as long as the registration
> +    /// should remain visible to userspace; dropping it unregisters the
> +    /// device and tears down the private data.
>      ///
>      /// On failure, the device is released and any successful registration is
>      /// undone.
>      #[inline]
> -    pub fn register(self, module: &'static ThisModule) -> Result {
> -        let Self { device, parent } = self;
> +    pub fn register(self, module: &'static ThisModule) -> Result<Device<T, Registered>> {
> +        let Self { device } = self;
>
>          // SAFETY: `device.indio_dev` is a valid, fully-initialized `iio_dev`
>          // allocated by `iio_device_alloc` with its name, info vtable, channels,
> @@ -475,6 +460,6 @@ pub fn register(self, module: &'static ThisModule) -> Result {
>          };
>          forget(device);
>
> -        devres::register(parent, registered, GFP_KERNEL)
> +        Ok(registered)
>      }
>  }


Hi Igor,

Thank you for your help. I really appreciate it. I've applied your
changes locally, and the build succeeds.

I hadn't realized that pin-init had changed upstream and that your
patch also adapted the AS5600 and IIO code to those changes. My version
appears to have fallen quite far behind upstream. Catching up on my own
might have taken me weeks, perhaps even longer if I had run into other
issues along the way.

This also seems to address the earlier discussion around the IIO design
and the TryFrom implementation. I plan to test it on my hardware this
weekend.

Thank you so much,
Coirul


> Cheers
> Igor
