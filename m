Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3533AD88
	for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781339662; cv=pass; b=giXCMZyP+60IpqJcDdACcgQBS17RETfgsdEKA6wX0V+i/dd1BIFeIjjrtfbknlW8MPXwcAA9MrGTYDjHQFSXwkxqCHYnTDJ5Gx43efRhgcsoLXXpH2S9HDwBCPDl0zPWaTGxTd432aXwIkDSPOgl2c84c1bUcvTFVtWLxSG28m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781339662; c=relaxed/simple;
	bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FacjsqWHEKZRe4NoudumfhsrYQQh7nTh7OqL3zbruABQja+pi/a8wTpAxKWnrXq3v4oE7NgkvZUUiENoPMPjL3MBuSZHads/m2J+VLCcQDE6qdQcmgi/3XJ1ZCKaIYicyaRCaVL+w+GQaVCoAaxtnGGqTFXl8uJqKdEFH1aueJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U914Wjsa; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U914Wjsa"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so222139eec.2
        for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 01:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781339660; cv=none;
        d=google.com; s=arc-20240605;
        b=BCTGtwqLiG91L2ytbQyme4RSZsIfmSf7Fipmp14BdUHerf8S7HbMlplZ5a8Ba17aoW
         4ArOkD0EwyalLVb1NtGgCo0zqfflv51OnNS2fSK2dXsAsJ5KLEJya/dDzdtTsQpaTWRY
         OLjq4mIqtn6PtuUmAVYOGa8KaqScQ60HEkekoJBAJM9eN53B+4bhhG1s2SnFH2PIr5Is
         wKJSSSjGv0N32vK+lFHzi/WF0FwPKKndc/hsEbfRyknwFx7ehLMXqcvElOZ0bHCS7Ylc
         F+ymUCizFSesaQUW2cgePClE2NX61etijGmWDpTpwtXxtCIcN71I9hf5S0I5sjyo7aFp
         NJrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        fh=pHsDYO0DJDQP9xVjWBZJ+Wjp75FeoEiEBsNLkMnkLpY=;
        b=hvPwnrrCt6iDqe+ozXre5yTXtGK4Me+gqKyEIP+AhE7gUI+Hc6c7Pj2/oxPsutEGDR
         TyCYM0/pJkFvpOYQBTVa7SpGLICGscRVoVFTyel9rt4wEG6KLmnLnIwlwdCyja1P5xcS
         HYlnqTi644u1VFbRElxUgLXL5GsJ0WwapFPtKOSAOy04XHlxDGVjQ4hXF0mX1wn4hVTN
         fVGjXeR2hdCugfohbePucY1fmsBciTsY/+h+DvuUtPIERVP8r1o6lzjfsjWq3lSL+S3s
         8cXIZkvk6CHY//BAALLdUjqhTilMCasbnZ7CMffGLGzGsYi139WqExQwWf/LrN48ab1+
         q5Nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781339660; x=1781944460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=U914WjsaOJpj0gGn9sjs4JS/4NdEvemtLcSQp2Ce6OOFiC+BntjAl5g/mno71Vf4bO
         VZ2++F+Y+ZEdgq6GhPvDHyIh9ZHJsOxF+/nd6RGFGLG7BuWVSugFvLwWWBYIOzPL6yMR
         fxq/M0sjDR3VLwlIosQcttApsSW69PfT/TeoRLrNKUxT6sNd/Hc3baTcSjKzt1cS6oE9
         3kJMeQDkVXLhk43mj0daif2FH8Z69R9K5Or9UwEz9rswFZn5mTxGWq3dEu4KKimppLgk
         2qz6iHQPoVLYtptqBmPBAZqeuXYhzrWITXqxcOiN+KjaOvotBGbp16ajMO7ktiKh8j/o
         t6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781339660; x=1781944460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mdkmbCRR16qygUgXiWj3N8vn0Fbus0tyv8Tld/tFXHY=;
        b=qVdkzjpk38dgMHx+qIXQpanqulkK4xNrEgicefI7hxpFsic9ZO1coc3Xmgjtj8HrZE
         cY5l1niGFamaXdB+9i1boPN7o8ZWX2wiqtlTAsMl/ZRMGPQ2U3p4YGmUhETpQ8vLw2xo
         ri+kIaaOI6i+T24KRUZd6rrNFY4xh0rEFY2trW/zleiI+gcbbmpNBZQKyzZrN1LpOd5n
         Eh1XOGQUVnIaVlOFtFBBhalJXJ/7kGUCOUkeXM06tpYCpUprPrBNFJ3RiPlEVW8Mtt/c
         tm5kCd9ohu8um+IKvtXJ4Sx7/v2gheJHXNLTuQGr0iyNuIIcbTWmP2tGEqIhLU7F/JK/
         NCWQ==
X-Forwarded-Encrypted: i=1; AFNElJ91dSmHInmZoC5qhTbIWIjKKaM2nDK04INatpYUm9WUKMfoiC+U8SwmZHvcLfo3vBW+bpeJqv0Rs6/KHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0veiyKmOtthd7V2hXNpvZZWgw8oCh7/TOkVflOSKwk/KSewu5
	8DvOuSI+L4CD9M2JDvm9c7LaE26WIS8co7fuRVRUHRUKWLeePj6/kfPloEXH7vfc9Fu2wDmKPd/
	TauxdZ6oaVcg/kCbtdAbm6IDlwqf/8dY=
X-Gm-Gg: Acq92OGd60KMhPW76BgwVJrF41r0L7LJaqpVbXlpX+xK1Fw2r4orxikSzNidG0DyghK
	UkkCvJrBw7kOg4Jv4oFcufSicLojY74aCsn/4YWP0cs2gXCRMCrxQUJheAVYRKKT67Ybr7BGDRd
	hMYecxZ3cvmmgxNH3bXMy42JzJtLQim86Oenwzoa5saHSM56Sb9A/AAnCScQfP8FIGeP/t0itlA
	2PEpyvYcL4HWw7dR3WhsAthoMP66AHQcIQ3+XaiwJk7+8tZ8fMBbE6T2m2l8om/XenQzQ+UJLYl
	UmKlTS9l1x7udniRclwcBCDERj6hESV4RiIPfjT6mPMma+XKs02on8WtHNuQLaw+BSf0Xu7TY5R
	QO70RmsEi1vn24R8rDwEKApM=
X-Received: by 2002:a05:7300:641a:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3081ff5f11fmr1542136eec.2.1781339660064; Sat, 13 Jun 2026
 01:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-4-lyude@redhat.com>
 <DJ7AXOH0W92V.1L1869KO4C1H9@garyguo.net> <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
In-Reply-To: <DJ7CJCZRHT1R.3LZDILZ7HTXQ3@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 10:34:06 +0200
X-Gm-Features: AVVi8Cc-0p_Glp23G0kVyr_DFh7-Z-_yXR6xtOVae_M3Gc4DHlyl43G8aBfq8YI
Message-ID: <CANiq72mffbi2BV9epfZtN1qmjM28B6qUp-5tNGj=VBTimL-nYA@mail.gmail.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 10:17=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> As far as I'm concerned there's no need to do that for things that are no=
t
> rendered anyway. But also feel free to do it anyway of course.

It is not a huge deal if there are gaps here or there, but we use
Markdown in comments too for consistency.

What we don't do is intra-doc links there -- it would have been nice
if `rustdoc` could use those in comments for the source view, but it
doesn't, and while I talked with upstream about it, it isn't likely it
will happen soon if at all...

Cheers,
Miguel
