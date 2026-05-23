Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470EF282F10
	for <driver-core@lists.linux.dev>; Sat, 23 May 2026 18:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779562126; cv=none; b=TDsCqt5Rsx4kMtIgs05GzlSXJRMRuyGc5Bza6poKfADqwn7IlUekbe6b0W6/Ho2DSVTW0Pw++aQxrNr9fRwRFdISdUtNN4nC2dBXmLitAzhCB/YgYFRWPq2EXwVi7hBUNEMEmJftosb3dJbNvOImCgTnv/5GPOnVeT6z5zVzxB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779562126; c=relaxed/simple;
	bh=rZNyZ3kiXuupDdTjZzuD3eWudcjJ/093qkGrlwLIkOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAR11sqrTfdurJPu2nA36lP6Au7FAMlODsOIESlotgwoDtIs2yynWOZz80rxcHGxsZBPyscO8MF8v7ZZABYUAc0M05CAMeLH2422cGkLsHhoCba231DR4ybAO+dY3Wya9KiWECQKBKHI6KsCPbl7WL8h/UDrH3OtjYYn6HFtlIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fX7hnSX+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fX7hnSX+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A2971D15;
	Sat, 23 May 2026 11:48:38 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E68603F632;
	Sat, 23 May 2026 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779562123; bh=rZNyZ3kiXuupDdTjZzuD3eWudcjJ/093qkGrlwLIkOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fX7hnSX+dnA+ZsXke5KEZV+e/e2/0+0KS02zzd65nOUGCwaTs0aSJOeIUAt4wIVCJ
	 gaSzzu1GeFLpOWw/YlwabkwY+AfB1JKQFMX7jNacINjJlPRw+FJa+QqX+GoJZhj8h1
	 uPJP9/0bB1FrdiKtg2r6xNRtPdu6Xrjyq7/T0QbM=
Date: Sat, 23 May 2026 20:48:29 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] rust: Add runtime PM support
Message-ID: <ahH2SVDvfshuXejy@arm.com>
References: <20260514150957.3501924-1-beata.michalska@arm.com>
 <20260514150957.3501924-2-beata.michalska@arm.com>
 <DIKIJ81CV55B.3TA7PV8N4BN0E@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIKIJ81CV55B.3TA7PV8N4BN0E@kernel.org>

Hi,

First of all apologies for such a late response.
I'm currently on leave and other things have kept me busy enough.

On Sun, May 17, 2026 at 02:08:07AM +0200, Danilo Krummrich wrote:
> (By far not a full review; but please find a few comments below.)
> 
> On Thu May 14, 2026 at 5:09 PM CEST, Beata Michalska wrote:
> > +#[cfg(CONFIG_PM)]
> > +impl Request {
> > +    #[inline(always)]
> > +    fn resume(dev: &ARef<device::Device>, mode: Mode) -> Result {
> 
> Those functions all require a bound device, so this has to be &Device<Bound>.
> 
> Also, there is usually no advantage to write &ARef<T> instead of &T.
>
For the latter, indeed that makes little sens, agreed.
For the first one, PM core already makes sure that no PM transition request
is being carried out for devices without active binding.
This is being achieved via the disable_depth which is updated on
__pm_runtime_disable.
Now I do understand you would like to enforce the contact on the Rust side as
well.
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
> 
> This doesn't justify the CoreInternal type state; in fact, we can't justify it
> here as those callbacks are not called with the device lock held.
> 
Point taken. 
> It is guaranteed that the device remains bound during the callbacks though, so
> the Bound type state is valid.
> 
> > +                    unsafe { device::Device::from_raw(dev) };
> > +
> > +                // SAFETY: PM callbacks are only invoked while the device is bound
> > +                // See [`pm_runtime_remove`](srctree/drivers/base/power/runtime.c)
> > +                let bound_dev = unsafe { dev.as_bound() };
> > +
> > +                bound_dev.drvdata::<T::DriverDataType>()
> 
> This function does not exist anymore, please use drvdata_borrow() instead. I
> understand you want the type check this accessor does for you, but it shouldn't
> be necessary. It should be possible to design the trait in a way that the type
> system ensures that a driver cannot pass in the wrong type at compile time.
> 
> In order to call drvdata_borrow() we currently need the CoreInternal type state
> (which we can't justify).
> 
> To support this, we should add a BoundInternal type state, make CoreInternal
> deref to BoundInternal and implement drvdata_borrow() for BoundInternal.
> 
> > +                    .and_then(|data| {
> > +                        let pm_ctx = T::get_pmcontext(data.get_ref())?;
> > +                        let pm_dev = match <T as PMOps>::DeviceType::try_from(dev) {
> 
> Please don't use a fallible conversion here, take advantage of the type system
> instead, e.g. with the AsBusDevice trait, see [1] for reference.
> 
> However, as mentioned above, I think it should be possible to tie bus specific
> driver traits and this together so we can check types at compile time. So, maybe
> AsBusDevice isn't even necessary.
 I appreciate your comments.
 Will try to amend the current version and add along necessary changes,
 though there were no comments on the overall idea yet.

---
BR
Beata
> 
> [1] https://lore.kernel.org/driver-core/20260506221027.858481-2-dakr@kernel.org/
