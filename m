Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795697003;
	b=Bjc+/JpYb79OejomUAbsRR1icRPDfimKTLaRESzAsVRfxds4DqDYkpG2fQLpDPA4HXjS
	 Vh5EOiYRfOdrg+5vVu+kDwTw6lKc/pqauX27HPSJbWeXQ9fknQks0O5r691f9pRl7DOSH
	 w3YB9Fim5B5iE+YUwdYXtDIsFd0biPU14gyvUA3KsRJkFWIklu04cBWyhhbrsq2GjsUrz
	 sQG635o8FEuWJ6a91icqHlnzMIHrjd14BDqGnD9vN/PsnI9iA8zDXoPwptkhJj8oM+l6y
	 tGZUPcVKbnY5Hk8LAAcaJrxnPzlgavIGGPzUnjvUiTnaa54hW1rrZxAJQKNDe8Jnn7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
	b=eypFtDoJ7Mbdj5fmAVqBnJQuD1n99oYeGcxh0H8gOaQRAicptGkQ7ntt/ya/3QOIENGp
	 CtaamYnGOQZIIHHw/LWGiuw872xJ5ZtDrbTojUmyH274tKNJWqG29xpwxKyts6fgNTmYN
	 MFCndPWWfbzpLh90/5wk53Ua/T7TUowZpQjzMEzfkDwCllnpwX1atVgmwcOnoUWyRXRyO
	 lbZ1EistRHf1HE3lv3DcBFtdTerawGb8yu6HEtMkeGqZEPhnAalRRLZwKqRXdS0uT63p/
	 sHQuNAlLMgFtggkqFuzrDi43EP5jvwPRhai33HvWf16q5TRSEwQJ3RxA1Q2LMFadsJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gnt8U5XE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC54606A326
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 12:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC54606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gnt8U5XE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491846221ffso6061234f8f.3
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 04:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795697001; cv=none;
        d=google.com; s=arc-20260327;
        b=Pqr78FvZMMh0c1jPyvUMixMT24c3YXEur93Ez94ooB5wJ6RvwDW0lpzPoABYoCENFp
         xnOCBFeYq5SMd8svvhJ3psYbWBn+/ZMOWv+t2q+wk1Hhy3Grm3kUIFZL2aCrKm8IQbSN
         CmWhs9T8q7WuH8yPgFFVwH4SsZHXxnkIVsszXqf4LQT2AbHJONRoGsSvUm7AZfYjq/bo
         EI1bYN54f9OupLnfuzGUDY2mhldSqfg5r9l/ptsMRw2HRdldMyGvzWf4+8Zr5PTFqTQ0
         JCFksutmWNjnP8e7HWeVrODKpwBl2cpk0fgGRcLzHAzaL1H0XFShUk4kkNCW+zvQR2zW
         zNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        fh=nPR6yZnSo5CVx1zwFQ0iAvC0iTL3uozZEhuB/64UVI0=;
        b=ZmynTQmhxSIa489NaA8JDN5fjXAMFbs3FVbSLcA0Wz9WEnvikzGh1mNK4BByt7b+5B
         h6U49FJViN8BrFiHsjo59gVe6S1CYilZZfHwLDuUqe8M9FU3XDsWHQexhfNt+RBgjbjP
         mfjZIAWVNmUYU6f8mZtftRZxq+hLqVQroFkcdNzbzWTRIDcxn04vyjdE1EaPEbujKi8j
         oFNSnAQ9oE400Hi36tIixCAZsCUEv4hHoGq3DZKl3fKty2YZLerOA3MslV9NiQfGFDyc
         POjKdD3619EM0aMAWS7sK6sbsgphlQlZZlJE7WkST9VMf+O3IX9zYvLYBsZENMvp3/Zb
         DVHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795697001; x=1796301801; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        b=Gnt8U5XE21LaPwTdM52KBMkpbig2VZ35D8t7fBqDl+FoDhej1t5gTBVFYC6XW+ID9a
         j70Jx3GWid1RzAGwrnNnA6HK8ewC4bVz1TlcCLnlh67D2J8Oeiw85MQOzNozcDnEibs7
         FFrTYndpImit/ZA3xfQ+ZOZ8yxAb8lssMUPF2ohiUauoxt+Sb0ba3fX0noOdYtPvK3Kr
         fdtYcadRw1E01GBoCu0L1RlKALsQucQv98LGqwPCsP7pFJu1UATgCbKB6FJ5rq+DVvHY
         vDf01uiVQSAMVL69v65OqjuVcGcfUmyJb2oW58EeB6PyQcRqvikS06d82eofnRjRS6XL
         CReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697001; x=1796301801;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9Abx8wExLURdMx+3brBY5biSd8oqBfJ6pvMSMTyXjw=;
        b=Vv/u8bWW/hFyZYUxT5d0riVi6f7Y2y6PrEnN4t8M/qnDsprc5ca/R/KVavPXEMm6hB
         fHYfUgVyrukvTtPaeNIW/jp7qhlDXI2uZ9njJ2l56UyGaRyyemJGWwdbdJ8mtozTSRQp
         tghBCp2LeS85leABSlSxIMj8t/RS2KzxT0Axbb9YQUB3pMhTR88OSPBvioOs6TK+bXRX
         7TF1WlrU10ji34+nLOa4STfdvdr4dgyCQDEpbk07MmwKX3/lhB+PFCpaQunR0EF1IoGu
         S0lGQq0phdcp6mYJdoi9ZBC/Q94WxJGDSAwhsFceWaBwkAC+QfrM/MuRA/z90CFHQuBF
         jXCw==
X-Forwarded-Encrypted: i=1; AL+hErEOBAFgRuINNHjVfvakfmXri1Ze8L9jQ/DO2q4tMtmjyC/Ro/yaQsUCYvhVVI6/oKk/CqWkeKhwKNtADQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9N7FlnNYfMXTuHzYLFH4JfeF8xrPP5NlssxHmg9tQ6i9WYFpcA
	Ck0GE5flSlvSsDxIBOvuWoqlFS0bt9AiQ7s7Ns8CooKyRMRHhaiVK74+8YgmQNZYLQp188c/2DX
	BEbFBQGptYyEyEkrPCJvMUer6YvOeQcFOtDUytOet
X-Gm-Gg: AZFdTZelKlR+Q1KhhLIy5SxeUtUvoHTxL4RpoQLnIojBFv7hCG61dTsrIyXNsQ/AzSX
	LeBxwAuQ7FR4ZApfyHE7Qn8WMx4OVXo/O2PDVt4nQSqYFCnMMh0PWtLA5rrJbVL59QsbxQ3yT9u
	MUfYslsXd2Kzew/xaajPT2ShvKQ5Dio+WPX56PKshHFAxE/tpz1YtyIIstoUP4b7KzvSz3ANDyX
	V1kilYAPFfdv6HhrpmNpD90aCwUWcksPtGrXoaSOBiTQycKhqTPztOqribJTxaCjT15RMFUylQR
	KiLD6m1a3kmohUg/WglGsv2HNzQmzgq66K2vi9a+dBk2783XtrJ+U6d/0NKukMnA57Brg4VXWS0
	lWR7h2gN4hLeSgJ/6Pks4DdItYfNew27mJJSHHJB4S/UUb57bNNCibEPIp+YeRLEP0HOGOmur+9
	9isvuQhF7RIP+DlgdxuKGcLMeypYsoZCe+cRbg26HIAex8
X-Received: by 2002:adf:e00f:0:10b0:491:d224:aa78 with SMTP id
 ffacd0b85a97d-4abb27275e7mr29748444f8f.26.1795697000100; Thu, 26 Nov 2026
 04:43:20 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
 <20261125181752.2027207-1-aliceryhl@google.com> <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
In-Reply-To: <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 12:43:07 +0000
X-Gm-Features: Aa3M54p00DMhUzh_tewZfWZ2hi0LG_ZMSKy1ua0nr0PKeO0HqjITQRZNecEPYTM
Message-ID: <CAH5fLgjvFXX6oZRkH9OFCun4eNGWKkmoeCfVK3_16Yc75dfRkw@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 12:22=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 25, 2026 at 06:17:52PM +0000, Alice Ryhl wrote:
> > What I'd say is that this isn't the only way to spawn work on the
> > workqueue. This utility is intended for use-cases where it's convenient
> > to do it like that (e.g. because the queue is defined before the work
> > item in the same struct). We already have another way of spawning work
> > that uses different ownership rules (e.g. self-freeing work) and that
> > mechanism would not go through ScopedWork.
>
> This is your design and you know this area far better than I do, so pleas=
e
> take this with a grain of salt. That said, I wonder whether the interface
> is more tortured and twisted than it needs to be.

Always happy to discuss! Thanks for the question.

> Workqueue lifetime seems to add a layer of ugliness, at least going by th=
e
> restrictions on ScopedWork. Wouldn't that be relatively easy to solve by
> adding a percpu refcnt to the Rust wrapper of workqueue and tying work an=
d
> delayed work items to it? Dropping the workqueue would wait until nothing
> is pending, and cancelling delayed work items before that would be up to
> the user. Work and delayed work items would then behave the same way and
> be usable on any workqueue.

I'll take a step back for one moment. The previous version of this
patchset did not have the lifetime in question. Adding a percpu
refcount doesn't resolve the issue that made me add it, unfortunately.

The problem is: if we drop a ScopedWork early, then once
cancel_work_sync() returns, we may free resources used by that work
item. Obviously if the work item is still executing on some workqueue
after cancel_work_sync() returns, that would be bad, as it would use
resources now freed.

Originally I did not think this was an issue. I assumed that if
cancel_work_sync() returns, and there was no concurrent resubmission,
then it would no longer be running. However, this is not true:
https://lore.kernel.org/all/20261118-ordered-wq-cancel-v1-2-916e01f9affe@go=
ogle.com/

My fix for this issue was to add a &Workqueue field to ScopedWork and
enforce that the scoped work item can only ever be scheduled to that
one workqueue. By only ever using it with one workqueue, I know the
non-reentrance conditions hold, and so I know that when
cancel_work_sync() returns, the work item is not running anywhere, and
hence it's safe to perform cleanup.

Of course, there may be other ways to enforce the non-reentrance
conditions hold, which could let me get rid of the lifetime. But the
lifetime is there to handle the cleanup before destroy_workqueue() is
called case, so a percpu refcount does not come into play.


Alice
