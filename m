Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED6314A8E
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323227; cv=none; b=p6Gto59Pr2bQPGhsB/ppys5VOLhjEvw198H43Eeg6YrUmzFCMoW/x5m6aoiUPptvC0E+1P/DSFWAWrkXEhGVt44ZcbFqJyepOWTCsO+o4+aYJlmLol9wNYI84azHQm7uGWP78SmV3uVIGkCc/vxrdhtob6/4v1/X+7RaMTEwwo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323227; c=relaxed/simple;
	bh=OFKYA+JNgXOn7DhraYS8W9WPTVKqKs/zcXenzO+nNpA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Zm4m/c9p+itcb/S0kWJ7XxTUP8aNIFlq1OvTAOeiIz3a8hCGI8s5bTr7FI0J7CLcEhCn/keUwOFcmHeQTnpsx5JjctjYj/TgK+AExq6/MXnvkhSqspN2C7Sm0rDJRXWkjtskQWyHcuoU0jsOW/OWX2JD7i+wOtTzHI5Rav78nj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TwDsypAz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TwDsypAz"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43ea728e38cso2439266f8f.2
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323224; x=1776928024; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LaOBwnvL+3ZiQiKDgJF56Y+WbgUuOyAOdvpqNZ0KUjw=;
        b=TwDsypAzb1bW9DhMTuUnkVEUfJd6b8IcR67W9YCtAOmJJdZuCs9Qa6HgFLfUCTxlfF
         /mLHDKxbtaxA6sOvwxXHBDXAndiV/7XqVPchDOUfNtYBxGkHhQYGhyDyK3Rhi/rxgmQh
         LwVJMyDQxmIE9ym3IqvVEE6V64Z8EJaQA3wgSfWTyiFKRQdJwKiORj2Jf1HTqL49j1ti
         q4UjmJ7+MvkHKt1Mm+n+55+TkBJ6IFYuRKWQRKFhbwgh4QNIoSwJ4YJaWxdPp5ld44LZ
         Kh4UVX4pxDWSmPMyIciHLfA5SbqgQSUTuxyAk8SB37tVyxjfzWh5rMlPdr1/nN1umuE+
         ehiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323224; x=1776928024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LaOBwnvL+3ZiQiKDgJF56Y+WbgUuOyAOdvpqNZ0KUjw=;
        b=BH48LiB0z/MVL9aTVf2ArOpwCwKs8ScItiB4ul2ziDFcOR/O5sM1TBXS6Uw0kLIQJL
         UcXrEih1+VBMkuhXNAtGkuGrgjn4tbZDu4d32Wa/auhC4vdHrcQNqP+N4OpGN/N0iSwb
         QP9MA6NgDdMOdWfaOcGjjIZKLBI4Dl1+8g9pUjxXpJl5i9eqUN5k43paYnZaTEHOqkRU
         vu4esSWJsukVFyPQC199bvuy3/T84D7okvsFV0PSonkX40pccuNhfEWqmCxLH+y+ms/5
         7e34jISW5gN7AE9deGu2VicyayGTC24w0Mu7zWNHeq98CtTsUxydbqepOINGaMsaJkwf
         moOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MdhS5qu2tuS5YEoLXsl0vcTUM4+Dn4QhChIbIWU+gLYx3eI2Tv+jHRtJF3P+PLqBYrnOXdQ3hGHU4iQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/hgD/BzezLVkEMwVOjZrf+93zLo6y5r2xpz74bubi4lRHqV40
	a6CJHkU751pc3/OIStywiECdG3XonizkR4Llf36mwzydvrcQD7fAXPkuh2wksAixxvkMwinr3QL
	stEsdmEXzUwQC/NVLZA==
X-Received: from wrbdl17.prod.google.com ([2002:a05:6000:b91:b0:43d:505:35b0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2888:b0:43d:73d4:b27 with SMTP id ffacd0b85a97d-43d73d40fb6mr24546466f8f.32.1776323223526;
 Thu, 16 Apr 2026 00:07:03 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:07:02 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-1-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-1-450723cb3727@garyguo.net>
Message-ID: <aeCKlut-88SbNsyW@google.com>
Subject: Re: [PATCH 1/5] rust: ptr: add panicking index projection variant
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 08:57:12PM +0100, Gary Guo wrote:
> There have been a few cases where the programmer knows that the indices are
> in bounds but compiler cannot deduce that. This is also
> compiler-version-dependent, so using build indexing here can be
> problematic. On the other hand, it is also not ideal to use the fallible
> variant, as it adds error handling path that is never hit.
> 
> Add a new panicking index projection for this scenario. Like all panicking
> operations, this should be used carefully only in cases where the user
> knows the index is going to be in bounds, and panicking would indicate
> something is catastrophically wrong.
> 
> To signify this, require users to explicitly denote the type of index being
> used. The existing two types of index projections also gain the keyworded
> version, which will be the recommended way going forward.
> 
> The keyworded syntax also paves the way of perhaps adding more flavors in
> the future, e.g. `unsafe` index projection. However, unless the code is
> extremely performance sensitive and bounds checking cannot be tolerated,
> panicking variant is safer and should be preferred, so it will be left to
> future when demand arises.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

>      /// Returns an index-projected pointer; fail the build if it cannot be proved to be in bounds.
>      #[inline(always)]
> -    fn index(self, slice: *mut T) -> *mut Self::Output {
> +    fn build_index(self, slice: *mut T) -> *mut Self::Output {
>          Self::get(self, slice).unwrap_or_else(|| build_error!())
>      }

This is pre-existing issue but IMO this should use match instead of
unwrap_or_else() to avoid potential inlining issues.

> @@ -208,9 +251,12 @@ unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
>  /// `kernel::ptr::project!(mut ptr, projection)`. By default, a const pointer is created.
>  ///
>  /// `ptr::project!` macro can perform both fallible indexing and build-time checked indexing.
> -/// `[index]` form performs build-time bounds checking; if compiler fails to prove `[index]` is in
> -/// bounds, compilation will fail. `[index]?` can be used to perform runtime bounds checking;
> -/// `OutOfBound` error is raised via `?` if the index is out of bounds.
> +/// The syntax is of form `[<flavor> index]` where `flavor` indicates the way of handling index
> +/// out-of-bound errors.

Missing colon.

Alice
