Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D9C3C2D
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367520; cv=pass; b=kAs8i+A85q69g0wlN3aDk/s5Y7OnJis/xqH3HXrnXek75SYXQldceZBT/bTrGal8W8F8j6UYvMK+BV4T3dN3wyNbvat1Ev/Ba6Md/I7CmHd1ygtT1mAWvbK5i8sfxB0tzeOKuLCQ7VLMj7fSy88XE7nYV1acA2FveuQ1vF8VW7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367520; c=relaxed/simple;
	bh=l4l2ZTYEhFnUBtKvMK7zgB7k5l0shVjy0AbmvfG+3Ns=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UToavS3UuU1WnlKFNV5Nn1jem4nb0JXa6Y5CdYcDDAQEEKH+YEMmt+uOYh8ojGyI9EzoqwwiZed6zXgHxpt9hwjfS9jMHfjeI7nHU6Eg6neSqxGHVLSAr8Zqy1ilsncYcZBB4fseNTCYkqNoBQPzhJJqa4Sw92Z5vvBmF5m/m2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=NdwbtTzR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NdwbtTzR"
ARC-Seal: i=1; a=rsa-sha256; t=1771367517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m68OOjXlS/I74lhfDmKIwzpmFLiRklASHy1Uts6KjPiatCRF9zHeTm087rlomaFLIPk1v5B718eHtNy/aEIw5VBoEjo97aUFAJ2Zmj8bpD9g5P/LknZeNMF3kyTcgLPTpGdmOBCTyywOrQ+xyK0Snu4W+l3dIOovFNI10VWlXEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771367517; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=b7IaeaTNyaYc2vd9UzNhhxbmYHGwAA/m4XhnT/MIBsQ=; 
	b=M4AGfPbX6u6pFZR0XLXsamZ8y/d2AI22JnBjvxq/MSz5xu2Ushu+pNUp0pjy4pY9rlblRu3Q0p07VOEbgG8tRd3MS0THKrsXzTDZiukrhSz3TJ6jWKs8BDYXX81LgcuWcIa5HPDC11AN5aaf9oqiMD+jbwXZASu6xNOG/OkYsN4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771367517;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=b7IaeaTNyaYc2vd9UzNhhxbmYHGwAA/m4XhnT/MIBsQ=;
	b=NdwbtTzR3PWT5M0YG2tvL29k0Oe5xVCSJ60DK9wch24/a6TggCQWlAOswM8VtuEo
	R1mCckbjyBj0D2j54irBlp77BLACh9O+MtDuOelmHTsKSN7uSS7LIMPTXvlFEEgiDbk
	mwuYY+DSfqNRyB1HNL8L4+f8DCi4FmOlE16UD7hQ=
Received: by mx.zohomail.com with SMTPS id 1771367516439708.0108364960485;
	Tue, 17 Feb 2026 14:31:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: irq: add missing 'static bound to IRQ callback
 functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260217222425.8755-1-cole@unwrap.rs>
Date: Tue, 17 Feb 2026 19:31:39 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <B729CCCB-F2C8-47FF-9A79-E2D7F9E82029@collabora.com>
References: <20260217222425.8755-1-cole@unwrap.rs>
To: Cole Leavitt <cole@unwrap.rs>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Cole,

> On 17 Feb 2026, at 19:24, Cole Leavitt <cole@unwrap.rs> wrote:
>=20
> The Registration<T> and ThreadedRegistration<T> structs require
> T: Handler + 'static and T: ThreadedHandler + 'static respectively.
> However, the callback functions that are used with these registrations
> were missing the corresponding 'static bound:
>=20
>  - handle_irq_callback<T: Handler>
>  - handle_threaded_irq_callback<T: ThreadedHandler>
>  - thread_fn_callback<T: ThreadedHandler>
>=20
> This bound inconsistency was previously accepted by rustc, but recent
> compiler versions (1.93+) enforce E0310 more strictly when casting
> raw pointers to references in generic contexts. The callbacks cast a
> *mut c_void to a reference of the registration type, which requires
> T to be valid for 'static when the registration struct requires it.
>=20
> Add the missing 'static bound to all three callback functions to match
> their registration struct requirements and fix compilation with recent
> rustc versions.
>=20
> Fixes: 135d40523244 ("rust: irq: add threaded handler support")
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
> rust/kernel/irq/request.rs | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> index 67769800117c..7a36f790593e 100644
> --- a/rust/kernel/irq/request.rs
> +++ b/rust/kernel/irq/request.rs
> @@ -260,7 +260,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> =
Result {
> /// # Safety
> ///
> /// This function should be only used as the callback in =
`request_irq`.
> -unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: =
*mut c_void) -> c_uint {
> +unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
> +    _irq: i32,
> +    ptr: *mut c_void,
> +) -> c_uint {
>     // SAFETY: `ptr` is a pointer to `Registration<T>` set in =
`Registration::new`
>     let registration =3D unsafe { &*(ptr as *const Registration<T>) };
>     // SAFETY: The irq callback is removed before the device is =
unbound, so the fact that the irq
> @@ -478,7 +481,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> =
Result {
> /// # Safety
> ///
> /// This function should be only used as the callback in =
`request_threaded_irq`.
> -unsafe extern "C" fn handle_threaded_irq_callback<T: =
ThreadedHandler>(
> +unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler =
+ 'static>(
>     _irq: i32,
>     ptr: *mut c_void,
> ) -> c_uint {
> @@ -494,7 +497,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> =
Result {
> /// # Safety
> ///
> /// This function should be only used as the callback in =
`request_threaded_irq`.
> -unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: =
i32, ptr: *mut c_void) -> c_uint {
> +unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + =
'static>(
> +    _irq: i32,
> +    ptr: *mut c_void,
> +) -> c_uint {
>     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in =
`ThreadedRegistration::new`
>     let registration =3D unsafe { &*(ptr as *const =
ThreadedRegistration<T>) };
>     // SAFETY: The irq callback is removed before the device is =
unbound, so the fact that the irq
> --=20
> 2.52.0
>=20
>=20

This looks fine to me. Sorry for the oversight and thanks for the fix.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

