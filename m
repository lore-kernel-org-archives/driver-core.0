Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380683438A2
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769571; cv=pass; b=CJ96rm+hYNiQxMvpQXgXybAlmAK2Gi4akfZPenVPg2GQ5HDZMScgUSxOi9dQlJfpCrLKlkge1ziaoB21uNI6ZA/Qu2M3ngiKxFapn5l+M65QUWaM2BdkD1Ybu1HA1eDrTdgf98viCt/NOJVGJwIIHEli2uvZUGK4rK2Sz3rEI/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769571; c=relaxed/simple;
	bh=vJQ85GMhPd27rokuLxPgrmhCOeWEsn68yRurzB2w63U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxSea19V6LpFW181NhQECfakEKS5FefwSRRC8XDuJXmRqEa23zJd7yki0Mq9zRuUuzfH7vNWo30PGs4c/F0SQ5fUbAwaO5T9WDTdFqoJWx+3LKH7YNk8SOqn2CmH2NKY+/0eGuAhtff/5gGt7Job9ieQ1HlHoIG6mo4iK2SjHRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lxPt3tpI; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lxPt3tpI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f703a9d05so2117374f8f.0
        for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785769568; cv=none;
        d=google.com; s=arc-20260327;
        b=ctr0JgbtD4EQaG94RmEYtrW+UT1Tj14iYnMbhO2cpLVm8uI3jX1mJxwYByC5BNqEur
         02NA9SlfawPaTxMfrZQAAiGyhxnT/i2Am2vvDMTA1bAmYybaW0ddwQUF3KrpTfeqN8Ww
         RdWvhbw27uqT1hMInXi7tWImK6hRfTdDAFSpQ6ZA4RZw0dXYkBnXmjz/caTS38ZRO/2+
         UvXUYuO3BF1serzmfSxaxRGXit7ep4eOHgTD/RcTwy8Ec4G07kCpZwUKHzeqJN6rWwt6
         dK5iuPIN6aJAR/VV3n0rKXhWaEU9jaZABaJRtaM4W/JfqHpz/htMPSJjpqSXYMoumwdQ
         MlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Q8NiBv1owB+m2z5E0qzw1M2JQ8N4hGqbVT+Vkq10LI=;
        fh=gasdwBxVaEZucH1d7ICKnZ8dDnjZVWDnATFIl/1HCfc=;
        b=hYTLGmyNh+BehRUjmFC6BZnTnnfq9nUmoZrfZ8tUgIcOTBfpFVfFt2H1zloiPXi9AE
         3lEw+0tKu47pJPy2/0QN6PEAu+BPPSAX1tRPFtOEZFvFjwURm7Sn9qcDJq/McwffFhR1
         D3SmpQx2P4FXhfTDJalxGKoYtib9B6LmYP+EwmBJqEFktpzamDPF06VzgvLUArb36rK+
         VGFZo29yuEISvQm9qgB6XpzqH5+4Zg3eCCDj7eyq8/gQETKo024CXO8GaOWHyNTbJGt/
         Rp0Ovh8jDjReSzQ7mNrsEm5jXgTbEaMMN9Lm6kzW0DjisVs3Ls3bATJHEGsCeBF1LmNt
         88sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785769568; x=1786374368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Q8NiBv1owB+m2z5E0qzw1M2JQ8N4hGqbVT+Vkq10LI=;
        b=lxPt3tpI8UHKIsQ97+jdOtZuqE35p/PXJyr+CLA0CSz6Y7r3fxI82CeQuKYgco5p3q
         6wC808u3rfWNF6+WgiHOC4rzzl7xoJYs6hoj38dlEecV2ebNUwUFWKzjaTSKHNcZpHKa
         iUTtdJTlUrepeQ3GvlLFChidAfr2o8J62QFqx08kqhTOzSELthm4AE+4rn2+x84NkAJc
         2hcAGrNV43FCBbij9p/FnAFX70C33FOezqfb35pTha/Z5oZvq/NOqS02TCrjx77ha+Sw
         OMtmC5oW8TRX7Xs3Y8g4PKxS8zeGEWpzNMzQqRhPksFmBZzOSX1f1JCEo/FBsS9s7QD9
         oIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785769568; x=1786374368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Q8NiBv1owB+m2z5E0qzw1M2JQ8N4hGqbVT+Vkq10LI=;
        b=aLhfQT/pkD4/371xPVHh3cwKSZ+a7QLpGq+SzLF1dHHvI4fqTt6NfPIFPfWmV6sZoH
         AcXvWAikEq8iTfGgcA+3AobTpe1V4zTa6n7vl+FPR4QKHoYkuxuspcePd75VDXgk0sxv
         KtfVz6inBJ5OYC1P6iejYWcqxytBsx6UUnKQkUzGGC6h8TlM3AddNGAVC35t6IBJMW6C
         wm1ZdWTGwzCy7C+whsFP0G8AC7ztuQ35wWp+CQe6gWAbpAA8LrKhm97HAv8kovIxr+yP
         uxxqR9CmnNiRUnZNEXX+bH9upgn9drmwVkSj+7G4GgCBq7xwgZLCfnAo/GJ5TtZNPu72
         DOOA==
X-Forwarded-Encrypted: i=1; AHgh+RpqsmdARQDKo+K3n5H/fnFKMvOUrg69wTVF/3PA0YgS7fH6jP2HGEXE/wQg2Rm3J3N33/Da7RWAa+3Syw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbauOomkNx4NCORjwhWTaLgp5Vn/Z/+JVtfTfkdE4sn4tJZpdA
	7AU45vLl/YcLoglU1amcAT7PrwLsCE9DrnUpWrAPt4uNGRcc2X1Nv1E/iQXmH4T5eCntR63r81J
	bxwmY3NeyNHmm/Z2k7gNTu2DDk+7xjSenovARwaii
X-Gm-Gg: AR+sD12STXbYM/FFumD6mItdie8R5gct8f3XTYgHCo7uumSyMC6NaaeZd1Nb8fO0Xnv
	K8FKkETqEb4phC7SFtYU6nXegsvwikrpdNUtZBFRVr8tkdb2Xqs0+p6fOsxiiPkVGjmWk5CG/1y
	MD+ml+/0hjUerDiFXmhgzUs+nm69NyjuDIYIrrLKvo+3XfH7r8fSHgfzKGsFZd1x/o0lHUfF1LR
	xyrA+BaDk6cNtyVBoQiu8YkdyIHcX8wP/78edOc2twYpWoJ4cn/Tt47hLxQpW4NVG3Vom3lyLaj
	/gmal6yIS8j5YLekzeq/xIQpIvJVjRo3JbEunqTQ5eTPcyJokLNbTC3P2sHzCqZYOmvse2L1x3U
	=
X-Received: by 2002:a05:6000:4615:b0:47f:8887:3b07 with SMTP id
 ffacd0b85a97d-47fd72d320amr27491657f8f.13.1785769567433; Mon, 03 Aug 2026
 08:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-2-aea19eccb996@linux.dev> <amyeMmmfEBpuVclw@google.com>
 <d42d6ce2-7160-457f-be04-ff84551e9b9a@linux.dev>
In-Reply-To: <d42d6ce2-7160-457f-be04-ff84551e9b9a@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Aug 2026 17:05:55 +0200
X-Gm-Features: AUfX_mwlQH6Z-tduzlfCZ86MznBGj1HOcIQs7EHUIsZkQr1iKQzeu-QfbRXr-F4
Message-ID: <CAH5fLgh9oZ9jRATbLM+s+tNR_KjJvdYuJ4w_vxXKwCmRd28E5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] rust: debugfs: add SeqShow trait and seq_file file operations
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>, 
	Eric Anholt <eric@anholt.net>, Ben Gamari <bgamari@gmail.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 6:52=E2=80=AFPM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
>
> On 7/31/26 21:08, Alice Ryhl wrote:
> > On Fri, Jul 31, 2026 at 01:05:40AM +0800, Alvin Sun wrote:
> >> +/// Show callback for `SeqShow` types.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// The seq_file core guarantees that `seq` points to a live `seq_fil=
e` and that
> >> +/// `seq->private` is a valid pointer to a `T` with no outstanding mu=
table
> >> +/// references.
> >> +unsafe extern "C" fn seq_file_show<S: SeqShow<T>, T: Sync>(
> >> +    seq: *mut bindings::seq_file,
> >> +    _: *mut crate::ffi::c_void,
> >> +) -> crate::ffi::c_int {
> >> +    // SAFETY: `seq->private` is a valid `T` pointer with no outstand=
ing
> >> +    // mutable references.
> >> +    let data =3D unsafe { &*((*seq).private.cast::<T>()) };
> >> +    // SAFETY: `seq` points to a live `seq_file`.
> >> +    let m =3D unsafe { SeqFile::from_raw(seq) };
> >> +    from_result(|| S::show(data, m).map(|()| 0))
> >> +}
> >> +
> >> +/// Renders `data` into a seq_file.
> >> +///
> >> +/// `data` is the value stashed as the debugfs file's `i_private` at =
creation
> >> +/// time. `show` is invoked on each read to produce the file's conten=
ts.
> >> +///
> >> +/// `open` and `release` are optional lifecycle hooks called during f=
ile open
> >> +/// and release. They can be used to manage the lifetime of `data` (e=
.g.,
> >> +/// reference counting). Default implementations are no-ops.
> >> +pub trait SeqShow<T> {
> >> +    /// Writes debugfs output for the file.
> >> +    fn show(data: &T, m: &SeqFile) -> Result;
> >> +
> >> +    /// Called during file open, before `single_open`.
> >> +    fn open(_data: &T) -> Result {
> >> +        Ok(())
> >> +    }
> >> +
> >> +    /// Called during file release, before `single_release`.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// `data` must point to valid memory, kept alive by actions take=
n in
> >> +    /// [`Self::open`] (e.g., incrementing a reference count).
> >> +    unsafe fn release(_data: NonNull<T>) {}
> >> +}
> > Hmm. So in a later patch you implement SeqShow in the following manner:
> >
> >      fn open(dev: &drm::Device<T, drm::Normal>) -> Result {
> >          // Hold a device reference so the device is not freed while th=
e file is open.
> >          dev.inc_ref();
> >          Ok(())
> >      }
> >
> >      unsafe fn release(dev: NonNull<drm::Device<T, drm::Normal>>) {
> >          // Drop the reference taken in `open`.
> >          // SAFETY: `dev` is valid per this function's safety contract.
> >          unsafe { drm::Device::<T>::dec_ref(dev) };
> >      }
> >
> > I don't understand why this increment/decrement pair is necessary.
> > Just based on the code, it *looks* like you have them because otherwise
> > `show()` might get called with a dangling pointer to the drm device, bu=
t
> > the inc_ref() in open() ensures it stays alive.
> >
> > However, earlier in this patch you said:
> >
> >> The seq_file core guarantees that `seq` points to a live `seq_file` an=
d
> >> that `seq->private` is a valid pointer to a `T` with no outstanding
> >> mutable references.
> > So based on this, you are saying that open()/release() do not need to d=
o
> > anything special for the value to stay alive.
> >
> > These seem contradictory. Could you clarify the situation?
>
> You're right. The `SeqShow` trait documentation was inaccurate -- the
> framework does not manage the lifetime of `data`, so `inc_ref`/`dec_ref`
> in `DrmSeqShow` is necessary to prevent `show()` from accessing a freed
> device.
>
> Will fix the doc in the next revision.

I'm not convinced that works soundness-wise. If I just leave
open/release empty, then I will be able to access a &T inside of
show(), but there's nothing keeping it alive, so I could dereference a
freed &T in safe code that way.

I think we need the seq file to instead own some sort of value. Then,
show() can be passed the a reference to value it has ownership of, and
release() can be said type's destructor.

Alice
