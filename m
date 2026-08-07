Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645BE339B3D;
	Fri,  7 Aug 2026 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127723; cv=none; b=iE3mITlYLAmt2eSa7WZhexOKREXkVYz4a0HEIeTvR4Ro41z7wUSMiyl/a2zHAIZJ1jtXgmi/33dN7mh6Nuod90qFoYkB+dkcF7QBzDdeuvSRA1I4HwEZnMhsn8bJkC2cX0QD3nsLUwR14OAErb0Y7w9fNo72Yubz6zArcvNaE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127723; c=relaxed/simple;
	bh=QSERNNd62lhKT68oqWG6jjteymLiUFg/TjNfnRSbhh8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hpWc1hVb3t9/fVltAcOrTDSPbC7mAyZ2M3c8nW78saVsv314oCz8/0cgWi7+lGEE36Rcc17ON1NidCrBAHaTuCsPivOefkfJNqhNXzMgBClfD737p/PdtUa+cVluSObr7vvNFDltj+sXkZk1ZZEwXQcne6Q8JAsV3h++fE7z4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BhyyGikY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BhyyGikY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866031F00A3A;
	Fri,  7 Aug 2026 18:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786127722;
	bh=vCNgfMN32KTg3vZXHCq9fkDSRPOTiciFR5mps/f3QSs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=BhyyGikYMJf3r3lxz8ut1bGWyX3JgUcNLloxYe/CM/JhPa+UEm2WyRkjvWkjRTGGK
	 hS11shqGm2ltrkJhhEzSp4cv/5S/GgdzTi+AnHy65O5C1Ulal9/t0d5Em2hRYGYkjS
	 3z6NH5AmuNpp+DdYNh000Sp+d5bPPNJfUXIiSuIDENpfZnL77JyEuXV1JWXkd6oenW
	 FC/VFgEdxk50V/lSXUSM94mDXGOTRIY1+lUHqPP/m5QcQAtHnpPyXvWlhGdtVMALIr
	 T0X+lCNB5WV4ler2ST3IhqCy5YlSnz3fHoxrjAWnYGhqAj4Kuq5D3ySuuADZatOF5l
	 KYBerTp8PNJbA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 20:35:15 +0200
Message-Id: <DKIXFKSP5V1U.12MPGENL0S0N1@kernel.org>
Subject: Re: [PATCH v2 6/6] rust: workqueue: add ScopedWork for non-'static
 work items
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: <tj@kernel.org>, <jiangshanlai@gmail.com>, <aliceryhl@google.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <daniel.almeida@collabora.com>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>, <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-7-dakr@kernel.org>
In-Reply-To: <20260807165252.3849875-7-dakr@kernel.org>

On Fri Aug 7, 2026 at 6:52 PM CEST, Danilo Krummrich wrote:
> +#[pinned_drop]
> +impl<T: ScopedWorkItem> PinnedDrop for ScopedWork<T> {
> +    #[inline]
> +    fn drop(self: Pin<&mut Self>) {
> +        let inner =3D self.inner.get();
> +
> +        // SAFETY: `inner` points to a valid `ScopedWorkRef`. After `can=
cel_work_sync()` returns,
> +        // the work function is guaranteed to not be running.
> +        unsafe { bindings::cancel_work_sync(Work::raw_get(&raw const (*i=
nner).work)) };

	// SAFETY: `inner` is valid and no longer accessed by the work function.
	unsafe { core::ptr::drop_in_place(inner) };

> +    }
> +}
