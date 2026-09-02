Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B584A4409
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 14:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360598; cv=none; b=MIHDMXlPkJ5JTrTdNNB14xonWeeGqXdu3R1ZT/8I5YjdSJ13xjfIW6sea9T1kGXhxenMLe7cAl6dJWl9j712Kqbsa3a0rgYMkFBdrj7Gg3gykWqxhO+rnJPjSbHSphKqupJ5mJc1grHRglJjuoEUvevCjlcFSI6C6NBabbGZNI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360598; c=relaxed/simple;
	bh=AKJP9o2dHUhJIrovPfM+erLc6AbBK9foEGrUmY75Ojs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U1mQQ2Uh4ZQlArRzgjsQfFLQ4JPecYgkjxUFzuH2xqg8qVIIVJaYXqebxZnyDGPRehxdJUcwDqymgOdzuoElLd+auxJyNNz6LckFTN91GS41EZ6t6hU1EmRiMwJJAefjNSWWb4M3u0tEyJYX4WqXyEwxo5W/OfJ2AmDbZETk1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gAkRx9ms; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gAkRx9ms"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a125f5b317so1310349a12.1
        for <driver-core@lists.linux.dev>; Wed, 02 Sep 2026 07:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788360591; x=1788965391; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+udHrInuy2YjJn6lgG+NPppj9DlZvX6hfolV6vDDE4=;
        b=gAkRx9msd4hqAVp9CyxZJGkixtVBnfxn5+zWeWFDmFQWmhY65b6dI9aca0d785hyly
         fQxMITCJVLPH8fDszy7bph65CDgxDPhv1Kco3abgDxb+H+1OT2BkxSgSNYgyEImdvs2x
         cECO/LViGOEmLIOGXs8uyQns6yHx3usylOyt2qyiolEQOeBkhw4116qdUl9KhwGUD1fu
         EhMil9BhtL+8e7CBN9sDjFNCWa4PUoMQ26ZI3TiVGvzzsXYRyswYTulTqvIdEwEy8TNL
         c2snhbVKIFtID50KXoYZF4KbU+74RO6LB/GPgky8lGoT5R+w+7jsGD+P16AXMUYmzXOm
         iNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360591; x=1788965391;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+udHrInuy2YjJn6lgG+NPppj9DlZvX6hfolV6vDDE4=;
        b=k+CVcSeaoljn7qTtF2TOTShzFRQzcbsWYwZqeka11OKax5ybQlLKHnjen0AAKNzNB7
         LO1KnD/OQn8a6xYb3BsCd6sKwJ73Olt2iWDTyndsxB3pkSuyrVKNpDlv9dJZap0Am5DN
         DgYF/ciV5c5KPP8ThXZdC/JJ4WfDFgp/MbCdU4efedccXbLu6iOJwnz6yyZGZa/P9HGe
         nLF/wc5arsCpJcQYzkO7zdpdlnXs4o3qW+asJoFvB9QsAUHEhk3XvgtHj6c0sEu36d/T
         V+73LW01n3+vy85/evi8whgoJGVEM+gOteZqqIgcwYIY/4HOUeagxuBcIxfN7NcQh+SE
         B7jw==
X-Forwarded-Encrypted: i=1; AKwUvBz1KKPTMsLhDo4EHBRZNPy4q7KF24XwEja5sHL4BM8CEkO1j6mIceefN5GXCgraYdlaWW5ISBNua9vm7w==@lists.linux.dev
X-Gm-Message-State: AFuF++nGDIMEFm4EF7+Jq4eQOxuJHUR0/lldEvDfPxRIbs/HohfrhXLU
	HDgBGU/y90HE4vXAby2b0KMWrGrUnTuGmOMyy14Jxq8U29MAUdCE+5i6njsSzmbFlCrKCi5geLw
	8BBQNfdLpjL5b1P7tkA==
X-Received: from edcpm25.prod.google.com ([2002:a05:6402:c199:b0:6a6:7314:9cf6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2349:b0:6a5:fac9:8326 with SMTP id 4fb4d7f45d1cf-6a682ac0032mr3646661a12.15.1788360590677;
 Wed, 02 Sep 2026 07:49:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 14:49:49 +0000
In-Reply-To: <20260807165252.3849875-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260807165252.3849875-1-dakr@kernel.org> <20260807165252.3849875-7-dakr@kernel.org>
Message-ID: <apg3jcchnlwTeiTN@google.com>
Subject: Re: [PATCH v2 6/6] rust: workqueue: add ScopedWork for non-'static
 work items
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: tj@kernel.org, jiangshanlai@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 07, 2026 at 06:52:49PM +0200, Danilo Krummrich wrote:
> Add ScopedWork<T>, a work item wrapper whose destructor calls
> cancel_work_sync(), allowing T to carry non-'static lifetimes. Ownership
> of the data is not transferred to the workqueue; instead, the
> synchronous cancellation on drop guarantees the work function is not
> running when the data is freed.
> 
> ScopedWork uses the existing Work/HasWork/WorkItem infrastructure with
> NonNull<ScopedWorkRef<T>> as WorkItem::Pointer for the callback path,
> and implements RawWorkItem for &ScopedWork<T> and &ScopedWorkRef<T> for
> the enqueue path (requiring T: Sync for cross-thread shared access
> safety).
> 
> Two enqueue paths are provided:
>   - Queue::enqueue_scoped() (unsafe): the caller must ensure the work
>     item is not forgotten.
>   - ScopedQueue::enqueue() (safe): when the work item's lifetime
>     satisfies the queue's 'scope bound.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>      pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
>      where
>          W: RawWorkItem<ID> + Send + 'static,
> [...]
> +    pub unsafe fn enqueue_scoped<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
> +    where
> +        W: RawWorkItem<ID> + Send,

I'm not convinced that enqueue_scoped() should be the unsafe operation.
Rather, I think that should be the constructor of ScopedWork. If we
promise to not forget it in ::new(), we can make this safe.

> +impl Deref for ScopedQueue<'_> {
> +    type Target = Queue;
> +
> +    #[inline]
> +    fn deref(&self) -> &Queue {
> +        &self.inner
> +    }
> +}

Should be part of previous patch.

> +/// The work function's view of a [`ScopedWork`] item.
> +///
> +/// The work function callback receives `&ScopedWorkRef<T>`, which [`Deref`]s to `&T` and can be
> +/// passed to queue enqueue methods for re-enqueueing from within the work function.
> +#[pin_data]
> +pub struct ScopedWorkRef<T: ScopedWorkItem> {

Structs with 'Ref' in their name sound like they are a
reference/pointer, but this struct has no indirection.

> +impl<T: ScopedWorkItem> WorkItem for ScopedWorkRef<T> {
> +    type Pointer = NonNull<Self>;
> +
> +    #[inline]
> +    fn run(this: NonNull<Self>) {
> +        // SAFETY: `this` points to a valid, pinned `ScopedWorkRef`. `cancel_work_sync()` in
> +        // `ScopedWork`'s `PinnedDrop` prevents use-after-drop.
> +        let work = unsafe { &*this.as_ptr() };
> +
> +        T::run(work);
> +    }
> +}

This is unsound because its a safe function that dereferences a raw
pointer.

I think you can avoid all of this logic by just not implementing
WorkItem. You can skip all of that and just implement RawWorkItem for
&ScopedWorkRef<T> and remove all the other implementations. You do not
need the WorkItem impl.

Alice
