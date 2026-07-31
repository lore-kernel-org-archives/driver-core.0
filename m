Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A95414A1E
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503287; cv=none; b=LWiPjBTswP0NWg4XKSN8AuS/mp5mJDvbyMGEk24t2J3ynrIT8PuCWY+9tvsJiqgESKEaMTor54dr+0GwMwPIU/GvRB3OBQgPWM4pzYxmXphm9HcfdgOl71gMvrhQroZpiTMs68YfNh2ngScxu0PZM7lToQXXKkvpicGAoJud9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503287; c=relaxed/simple;
	bh=ViuDCFjmw/dzx0vsIBMgcReYNsdp4Yi1k2soTurBsFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K3uwvAZ959JIC1r0dJ/RpltArHJ1W6I9ZlWKFkETyVoddp0Edr5W+OZSInEIp3YHOrOvQsniFMbUgUiQg/bN5mtaoVwnzd0QLfevyv5Prsn20VUBJPVkzbaEKvAHTMFOaQI45n91yDMuj0DA3cdjKL5b5O06m2JD8l9gxd2stgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KWTYxuaw; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KWTYxuaw"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47407691804so863981f8f.1
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785503284; x=1786108084; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKUpFb/0BO0No/UvKwO/5M2fcWH3/wzCNVF4fPxlP2k=;
        b=KWTYxuaw2pgXtTdVENP/aSh4ZiNHWr0yOBZJyjXFX5S3jpZ2Wll2l0zwYQg40l7717
         lYnY8mIYsc/2f+I1ispw5OOODuogo5HxdP3gL1HBhUDMsh7kxqQq7lgNaM2rHdWRu5k+
         O5BtIZ8QNLvPkfmCE4rF//LQql3hn5YNNsafAyVyMfHQ5pBJ6gjt8KfGgXbBZVnHvoyu
         v1Y9PRLJaU7m9Anl7Jju3s1GW1kS5LFpCQDp1wClZpgOI25NaJzH4aix5yFCz2W6mpgg
         Grk3gzR0FwDbDLrnI2/Muo3GjHk7XClprur+S+Y+zYiS7VMZC3lIcwzyceTFwy3s2cuF
         rZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785503284; x=1786108084;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKUpFb/0BO0No/UvKwO/5M2fcWH3/wzCNVF4fPxlP2k=;
        b=j1zxJzdoQ6FdYVzMQgY/6V3P0ytipAYxZIjvJezb8Jtc8PBsG5LH5K6b7ho4Dy3xbW
         qjeGpRxIDJdctOzJPqt/OrBQTzALcpVI39sS45xdnwIhMzdOyqBkGG1ybJ/OZcS0vkrI
         pYJGhX557x7ZxOBrM7zTPJeMrgnMDpqTP52ywJwTn8p4B6n0N/CXTCs3ZO8GOhz47CwN
         IPHkwwITsEkShQGEYsP9dourbJHJZmz8kxiJpaPXKi3Jf7bnWWMqrWCrJV5LNyOGVG7o
         vuZ5YVMGwCcQi0lO7PN80FqujfF9i/jLTO7caalAiC+AIXP+23aH5yUdXMd9g9drX+Zi
         zNYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcDxEaYfkj4PY5NHys5/8CSHwTH2Uis4Pbt2U+tRn1Hou6ikK1kV4LKDIfVIZmW8aJxT5CRGl7y5PQIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpolkbTlBkqize4PBmD4rFddezIIt7Ppr6ozf0Tdjl2TbkjJXx
	bkueBBw4+CAjniEIS6+FbxxwREVPUEG8JdCMLKfkrblksDNN9oOjc1uVj3Umv5b42m3FZpjOpZi
	xMcuttcsuTovYeQMv6w==
X-Received: from wrui12.prod.google.com ([2002:a5d:630c:0:b0:47f:4f56:2046])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2882:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fd2ab92c4mr4245682f8f.4.1785503283539;
 Fri, 31 Jul 2026 06:08:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:08:02 +0000
In-Reply-To: <20260731-tyr-debugfs-v2-v2-2-aea19eccb996@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev> <20260731-tyr-debugfs-v2-v2-2-aea19eccb996@linux.dev>
Message-ID: <amyeMmmfEBpuVclw@google.com>
Subject: Re: [PATCH v2 2/9] rust: debugfs: add SeqShow trait and seq_file file operations
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	"=?utf-8?B?TWHDrXJh?= Canal" <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, 
	Wambui Karuga <wambui.karugax@gmail.com>, Eric Anholt <eric@anholt.net>, 
	Ben Gamari <bgamari@gmail.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 31, 2026 at 01:05:40AM +0800, Alvin Sun wrote:
> +/// Show callback for `SeqShow` types.
> +///
> +/// # Safety
> +///
> +/// The seq_file core guarantees that `seq` points to a live `seq_file` and that
> +/// `seq->private` is a valid pointer to a `T` with no outstanding mutable
> +/// references.
> +unsafe extern "C" fn seq_file_show<S: SeqShow<T>, T: Sync>(
> +    seq: *mut bindings::seq_file,
> +    _: *mut crate::ffi::c_void,
> +) -> crate::ffi::c_int {
> +    // SAFETY: `seq->private` is a valid `T` pointer with no outstanding
> +    // mutable references.
> +    let data = unsafe { &*((*seq).private.cast::<T>()) };
> +    // SAFETY: `seq` points to a live `seq_file`.
> +    let m = unsafe { SeqFile::from_raw(seq) };
> +    from_result(|| S::show(data, m).map(|()| 0))
> +}
> +

> +/// Renders `data` into a seq_file.
> +///
> +/// `data` is the value stashed as the debugfs file's `i_private` at creation
> +/// time. `show` is invoked on each read to produce the file's contents.
> +///
> +/// `open` and `release` are optional lifecycle hooks called during file open
> +/// and release. They can be used to manage the lifetime of `data` (e.g.,
> +/// reference counting). Default implementations are no-ops.
> +pub trait SeqShow<T> {
> +    /// Writes debugfs output for the file.
> +    fn show(data: &T, m: &SeqFile) -> Result;
> +
> +    /// Called during file open, before `single_open`.
> +    fn open(_data: &T) -> Result {
> +        Ok(())
> +    }
> +
> +    /// Called during file release, before `single_release`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `data` must point to valid memory, kept alive by actions taken in
> +    /// [`Self::open`] (e.g., incrementing a reference count).
> +    unsafe fn release(_data: NonNull<T>) {}
> +}

Hmm. So in a later patch you implement SeqShow in the following manner:

    fn open(dev: &drm::Device<T, drm::Normal>) -> Result {
        // Hold a device reference so the device is not freed while the file is open.
        dev.inc_ref();
        Ok(())
    }

    unsafe fn release(dev: NonNull<drm::Device<T, drm::Normal>>) {
        // Drop the reference taken in `open`.
        // SAFETY: `dev` is valid per this function's safety contract.
        unsafe { drm::Device::<T>::dec_ref(dev) };
    }

I don't understand why this increment/decrement pair is necessary.
Just based on the code, it *looks* like you have them because otherwise
`show()` might get called with a dangling pointer to the drm device, but
the inc_ref() in open() ensures it stays alive.

However, earlier in this patch you said:

> The seq_file core guarantees that `seq` points to a live `seq_file` and
> that `seq->private` is a valid pointer to a `T` with no outstanding
> mutable references.

So based on this, you are saying that open()/release() do not need to do
anything special for the value to stay alive.

These seem contradictory. Could you clarify the situation?

Alice
