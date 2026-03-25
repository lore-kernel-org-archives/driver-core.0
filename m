Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C5277029
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403903; cv=pass; b=lCFjk2rFUnDB7fCH55kwQzU9dTCAl9e2JScjNQ0mb/ptKivdoytTupE/jAhYARZAhsKT3FplSElmpLRLJfYjNC6x4fwzGnlZmPWaHSK2hB7OoUdr4eYfyeLa+9ROb+2Ye+WT9ZQhc4mSezgH23ql1mtvoGxjCkaPorGyvugZcfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403903; c=relaxed/simple;
	bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rp219wbbfM75yZGJ5SUKH+HycZqwb+2eeWhf8hg8g0ldomxITMEgcLS8VBvSBeiBjAUrFX4eWnp0vQzY1+v2oi/7Z0VQtbc3lrjVQUZiAkfwi6OotLApuNRaBMDnBWp88Q4CCmfh++knNZRZ2+8a6RsSIvMKRLsjRkIvPEWqkEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF8tK2KY; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF8tK2KY"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso226054eec.2
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 18:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774403901; cv=none;
        d=google.com; s=arc-20240605;
        b=AfPD4NAOKzEUBPEtUkY2xpW9uUb2h+2j1soNVMsXjM1zK3BGPcnksxgUYHLJyptg/4
         hRoAG3luSgcv2a+ZI2UX692R14Kciw5fF0uSuTsQ2ydXACHBaqgzxTR7eO9fa+TPbQzB
         Umgwo4EdzbNEEid5IulB5zdKrk3igDoeD7zpEKgvur97St99KQABVl3V6ptw9/z2vNsX
         XFjhkPrcJNwaod9Ln/cjO/PChOgj7waj9KMk2BTGeGgnweERDM3ZnFz57G8f3oveh4jm
         XnAhG3MpGJHJNLcChKT1ziiiqUwK9Ln1vBZRH5OjWamZbfWMV4zaGul02e2BwkLKJgJM
         BDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        fh=wyKMKCvJMhyLg3zZYx59wDKyRbd9AxI+V5pjn0ZCRaM=;
        b=RwjQYijZbiH9RuMTnryA2XUkUJGZdcxy0Trr9qRKYx6SgRlPDKWPKjsCg0XOf+n1CN
         ZRoE7LdwDD+4UGtJJISrMgHKEqPUxUljWWDXlNl6Ja6WfhFc0hXsZsubdJasLvzHUpxX
         ggAAOcFRviC/qFy0G1FE9oJ2Hzpb0gYRskfrurx/1NOQMrTE3fVFUOMJSYMZo6fRcxF8
         Rrtpaobt1brmFJijOTwhYqnvpxM1nK0Fzh2LhPtqsuSuV80BKeu0nkGwNkeaSKUshsvp
         BIEIXs+PASwI9rljsq2wtJ1u5b1ku8kQ6C9KOZHGnDVHv4MvXy6nWPJZW6NwlJAkqiMY
         xQqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774403901; x=1775008701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=fF8tK2KYGacWiRa+AOAUFchvbJIoDiewC5Xtqr75uGO/Jpx5GUuPo9R2nE0PeJYKWg
         xDpwuLB0nq1aUKgRCOe7D0/1P3XA4NOWsqDkq9jFV896BTYd1y9FYilv4veHwKt9ICKd
         VI+LkXFlPDnm1dpxm9Y/sah4DcDcI7R0itqIwBetgtHeLInZEB2joxfe6TF21foB0hUa
         iNJqe0Rw887y4mx/hdaywPvFhXEappGPHD55eXVv99yAZgbpVNPs6xs1z/1OwJceZuC/
         dqSnZxJx9/Z7QEjyojUzzvgeP6lC0gFbrEg4m40mePbGOk7hL108oZIKlyTxuQ4TX3Qp
         H/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403901; x=1775008701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uATiCdJVNXsXbqp7wQweEzFd+VzHCHpWD2sO0E9ZBl0=;
        b=InT+UV6XaBq5UCSX9DME7Fg+aM8zHlF11y+KK4ZVy325nFocHA6RzcLF9sZ5u/3GY1
         OJKiSo7c0NpH4NRadVXsT8gvP0xXskTqgMEgJbNzV+oAy0bRAIxi5rkGD8SEuotacF7c
         5u7bxAtjMoyyb16oAjDczbOMIRVhC8oOcyEpkdIt/EsXWHItxDpYdLjr7wPcP2zo9TeF
         5ms2CmZ+fA8HNzr6BlFfBZipD7Z85i+cRhptVZwg/oqCF+gUTkg2qMoa6XzPKyxdZfx6
         pOORASA4mgbu6zC5rf0gtWD/bVuL4g/7GxYartg+iYkWOP1luTMst0wtETLqPiML/vgw
         eOJA==
X-Forwarded-Encrypted: i=1; AJvYcCW4ydLNNSMU9NX5CTr7sytQLqFiVG4n88HPCQxG62K0VxJweAx44oU53hZm7+V2uBg1sFoRxqNblXAEPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyX+LyK5SD3sL4hflmmRIJg4NX6SFcwzjMeBsjw3Q4XDODKJPlK
	utxTpqZQo++ciHQ5C8vJYtdr3aiXWt8nbK6Ua3KFvxvN4ZNnZhrmhuJcDpFweECqh+Ow5pVx6PW
	ENDXthGSGSZjsjgmht1pIkOaQws+FDnY=
X-Gm-Gg: ATEYQzw3dfYLaQrA+gwPqusA+pEvVYyFRqtbupCNrRShL/RIzAHP+RTx+I900fh54TN
	nGko/5WoElD/J7kZgv2u9nbhTTLsYQla4RzJT5OaATkYPlA0gVbIC7oDKdaQSt3P8X4SeIWK010
	9L+bPHDYdc5D8foQC7i/+sLbLwE5axseaw5S+kLwEhLWXbhZDjqXOtTO9B6e/cGgXVqEb7GOe/w
	C89T3vdZxl6iH0Emtmz4m8M4fZy98M5Oq1uDOB6jlvnDl/9CHEXKmviRRBsj7l8JA8xxtJcShd2
	C7AzHq1+zjbRb1aVgiqAHu5HYHxC5ent6ZIz28l790iDYp+JNaP9AXIOgilUT1VCuYpKHH+hKZW
	2+SHHLexNdkrcr4fZgE7N3Jw=
X-Received: by 2002:a05:7300:dc10:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c15d3a8a70mr394983eec.3.1774403900918; Tue, 24 Mar 2026
 18:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <CGME20260322194701eucas1p1f72625f53e50806fa4f430550f291e76@eucas1p1.samsung.com>
 <20260322194616.89847-1-ojeda@kernel.org> <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
In-Reply-To: <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:58:08 +0100
X-Gm-Features: AQROBzAYV4sPQIbCVLLNfW-UqAw-p0H5kvr5leqfcWwqgBKVIhpQi6sU039YVRU
Message-ID: <CANiq72=UPiXc7JLracLeC6k45ToByJWZedp3B3j5=5mAnyKZmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	acourbot@nvidia.com, akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 9:49=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Yes please, this looks like an oversight.

https://lore.kernel.org/rust-for-linux/20260325015548.70912-1-ojeda@kernel.=
org/

I hope that helps!

Cheers,
Miguel
