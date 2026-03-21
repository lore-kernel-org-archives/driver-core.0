Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F51B2D5925
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774135335; cv=none; b=XZmQ3w6A8gM+djBeyPfM+gJxNOrHIRHC17XQ/s87xW97tJhatG0iVMT8Bsqdn/SOfBkLptsxV4PLXpBWJ9PMGP87DVwh6Fnadiwghr5S2IpuOqRpHeye1QXElaTxswPB9onbul+rrj9/4qj1seIbcC+DV9fZ4I8DLPkofz4oKVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774135335; c=relaxed/simple;
	bh=qNeJkCdabtlCm7cDTMYLL0emh9Mqvxu3XdKIuu1nM1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=OdeXN6Sz+Esd4whRKrJo+fVKSTnGECCjeEqAyXLpjw1xDwPha9F9NwwuYaa8Y7bzFMmFTmlvZ02HXoHQM4nrcaHb6vmL6HWxWnos2httdEWl166nTut39yWkxA2Lr/wtPN4h6OTdMbmSmM7hyarJnXOBQxIwZHI+JucVE9980xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ec1AUzXY; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ec1AUzXY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2096395eec.1
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774135334; x=1774740134; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
        b=Ec1AUzXYJkFyqDZwuwHt7MBVXmK90ZOvg/O9YDOh/1FtlmOAfxuoUMNiNCvDb0RcWQ
         bxI5un1r0xk+JfzWgHXcRwUvsyKFmG2klhb9o9U22c6GvEYO/KVMHVVgD+x++atpRHaT
         c0VwinQsA5XlWTUV0+BNArg8gVfcBmRVCISD9XW7SP3D4yAfZu2ZGQ6ckTeWVCinfPZb
         ucW3U/qApwW4RMYI2p80cYdcGnS2SJSQc4Q13kRhV3WfEra4JgLry+9wtCQJqmsuOO1j
         8gdgXzrrGbocrtUWhPZOFefII9NKcnAgKgd7z/lKC5KVAXqdcoRM7W84IkKefw58smDa
         4vRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774135334; x=1774740134;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmSlASJxZ4qJNq9Ag8r4ipXI8Q0Axl649+ut2f+sZl0=;
        b=c8tJ3TgnuiB7ho9ndWlfdILCebd6blZQEQxWN34JHtf+euvsyW+34y8X3RIoMc+GbC
         NvY8MbtGpa2NRah97pA4woR4bY5w/4xnN8Jn/WBPmJRFwtO0N+436wJlkpCbwIAQkOVm
         0kJ65UuMXm1AZ+ZY+CiRZxCsf5lxbuy/vqemivh9ohP7sL2H2ZncP8NexkCxJqxzNkqI
         ZP/d8/GwfhhmaYNQ9WSS7F/zRkeIRCFQfiluAfqK79nM40KkNW9xeqQl99PlK5pg6qpt
         xr2AiiqZ40XMEr8p0TPrU9r+CHGt/fbsc4LRwDC5nfRJIlgfPTXxQAYa7xSgYcJVbc2K
         BqRg==
X-Gm-Message-State: AOJu0YxShac9pFQ1yIQ0w0227bHKmqonTrJ5fH+3+PO8G4i0TEhSV9sC
	TaJj7taeHo2GcEDIfQhCcMD9krq/FBrDjTfZtBi/9mfn9aAsHvuz0EcC
X-Gm-Gg: ATEYQzwtra2nRK4NAPhaRhXNVEyP7ubox+0tb6ZsLRbADEC8eAy42b1aWmevVx2mDH8
	URwTzsmKcD5PJiV4DMC8qud6XFR1XS6KhrR60naFhG5CuiUyW/WLjJXeMzCfajm4HOeUxkX/1tH
	aV2EXf2BaZjxfiTSQJkZBHVIKkJ6g5Yv12BoaDPnGwr/TCyW0GCTv+GYt52sc9wdzkSpbXt1o/V
	Stc7PUKfH93LF/OB9Ju2TJYYBS1okHeDg3+obu+1kd93JtMWMkCcEApc0XftfLnw9SC2zWcGAcb
	rplPif7camX1IMxLXTcrG7Dybsn9nH0dXDx/VeATl6nu+jHg7ikKLC2bzccWQ4GZK1ekG1fHpjV
	uqSdJK2Zrnhz1MYj5CUORqfhCk9DxeQlLwCep01J/t1i7NjghWOr9XHXLtRnXIwbQgDSyJc4s39
	uwEYZbo3y106WR3Jk2QySf//5zG4m7a/g9f/CyIxubLoo2
X-Received: by 2002:a05:7300:3c05:b0:2be:140c:bc4a with SMTP id 5a478bee46e88-2c1095d7855mr4154948eec.3.1774135333601;
        Sat, 21 Mar 2026 16:22:13 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f::18f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm10927970eec.4.2026.03.21.16.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 16:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 16:22:09 -0700
Message-Id: <DH8UHISTLOA4.934370PUTLB4@gmail.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260320194626.36263-1-dakr@kernel.org>
 <20260320194626.36263-3-dakr@kernel.org>
In-Reply-To: <20260320194626.36263-3-dakr@kernel.org>

On Fri Mar 20, 2026 at 12:45 PM PDT, Danilo Krummrich wrote:
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 2eea7e2f8f04..ff3e147f1a23 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> +impl<T> Coherent<[T]> {
>      /// Returns the number of elements `T` in this allocation.
>      ///
>      /// Note that this is not the size of the allocation in bytes, which=
 is provided by
>      /// [`Self::size`].
> -    pub fn count(&self) -> usize {
> -        self.count
There is still a mention of `self.count` in the safety comments; perhaps th=
at should be changed to `self.len()` ?
For example, see the safety comments in the following functions: `as_slice`=
, `as_slice_mut`, and `write` in same file.
