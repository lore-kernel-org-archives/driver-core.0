Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051A518E02A
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 18:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549090; cv=pass; b=MvSDJd6Ojqi3vbhXdV8ZibvyygHpuJbNNudsSKxYvsp1tKVKauGXr56EFCxrtvAh2Fa9u5F70lC0gXGoxsdbq4iv2JDTxSIi6U+0xR/PcKHtYutWVukjyouRfLgmOLuDC86yH8mVNKpp52s27Q3yx6dg9SePXpQq7KyouZDftZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549090; c=relaxed/simple;
	bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvysTRfnk1PBmgc/oKxkH4lSvtgyOjsmwMsAYSp3S2CX/D+n0vFy83k6eGjLVZdblKlpYAbaTlXQH9tgP/1LpvoeqNWAEDC47mFktAKrzjPsP60NI6yLYv7K2U0nwPhX6z/9PLVF1ziQxJ+5CIHpk6ojWLFhcktvQMoDK+KdCoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmGuTSdJ; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmGuTSdJ"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12714f01940so100750c88.0
        for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 11:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774549083; cv=none;
        d=google.com; s=arc-20240605;
        b=LNLpN6mLrbjVyFa8jTeAWW/5dgNaiD6SpxoQUxSRL/aOs1Z1mLWPyE5ulG9TL/OT8n
         yf9Db1J0c+fFKKojn1i8xHfaIHWNaLSZ7ip3FFd1aZon8b1TPjK5m1/wDZFM3XPV4GDd
         tqI33jTe+VFPGrKNi/H5fydq28NcmlOFd6Jsnr5Z1H2aipkrrgmUauyxGqTAGw0ritdG
         eXq9xGXnL76BLN8cWDiQhgpFEKeHixWrmTHlD/Xc1hU/jGX5qpsbKW1YQiU1s+SlrglO
         Sb5I/1ALyvEfOQfcWLNxy/RA9pJMvBLEC+rGAUbWevLoEVLVeLI71F8AyAXS1GyvGnBP
         kwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        fh=QuCpTIzakMkrf7cXPdzSA5N/3SOQPRY2hD4hCtIloJo=;
        b=fg4Tmk01RiVz7fYkyp+z8UA033BoOrPerZ+9O5u25sqeV5pC+iVtq9AlBD0aE+pPcH
         CnwuLtDzVR6NR9UH4o4r5Ue3s8A+RZI4os/u6BObAAKaTFB+jEI3G7cab4fr+XPpP6Z+
         z8HDTEf+p396Hf1/GWr5zupHQyByIylRtnedXu6Bz/N/lpZLOhTSfH/B1bhwz8Vp6D9E
         tMLwnHqmOASgV+UDxsFKe0wPBapSB0KGeqbu31woN7XPhRqrC1PWSKWPwmdpgDHYxa0+
         EZmSGMKo3mg8NjbL7P9Mrv2E7vgEU0oJvHi2yKIOdHOA83n/U3fKVrrjYxFNq3DJ+fU2
         jgXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774549083; x=1775153883; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        b=LmGuTSdJYv92DHKj1wug/9LIikWZTbIoyFZ4dMNN/CxvocKACGFqn73JJLbtPTy5NT
         b0bE+jrtK1B/6noKvIPRjxb5qufIwEVOEdwCHDluxtpR8YlHYAbsIcAL9mkCTu4DhTou
         nUvCl51f/s0lJ6AnGdhlGG5FsstugMOK6N2K31R83LyFYRlf0jmHfshX/cd92Nuw34vr
         VBt8vWvRmsEEyiRD6i6AYvoPz79o2kcR/tdxDYWAMCc8at0V8Fr8SAesfdzVj/+jJ8v1
         Vi1h6w61GTqpq06TIwy+oqmcGgSJxlkAoRjMFA3TuSXaPdpeGCPIuokzvvPCHV1bi2vR
         n/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774549083; x=1775153883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7sccmkGDehtyJvcq1YZcs4by1igPiabHUGseQHtgqo=;
        b=YyJmCYi0lXgH0N+/yd/aIZXwr0xEJ9iUiteJYiKI7LoihEcKyYl24fal679pzvFyin
         pwkvPHfF0mpmtfLKFFUqK/6FRfCHTwmeCLdcSxfRU29Fzen+1lg/l3TpEQa841nNCp0x
         3A8lkW1RDA7rklNq9/TSimLaSulHMC6tF/oa2D5eWgA/6EQ2GljKWsWISwrrYYYmhdN+
         T2DsepQKolau9Qm6ZM/Ej3PzjhOumDCOyRull+lF7wo9wV8eqz/5hjzb2kim+mSb2SJn
         iT6Ec97A1qJe4qByQpewMBYmuPyQj8uOXchSKqWWnjYRRDHVB25og6v7PESd2u+dFUpi
         C4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVS00HfRWuCweBOkuVBy9zi0+D4yH41x1YLB7nuQsiQw9EYTZOtS2SaOF1EgtN1dnk6edtpGsnQpoW2EA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMVocDjABol/w/dSvQiFjznGvGhXLMeaYJQsB8ZGuqm7XFSymT
	fC6pONaW4n/Z4L4hETXkZkLBzD3GL/thcrQeDTOyPUba9XGpy1Pv1FOT9JCk7HiRut/0cXNsIwO
	y7k4OoVjJk9nDsPR6Mc59fPOwOk337Bg=
X-Gm-Gg: ATEYQzxa5ZK61OLGLl/Nqhu1iJ4uLpjSX1Vsjf4P59/Yx/p5wiGGgO2OQpI4ODjQByh
	eiz1nugRNl5teS7eZpFKLz9Y7sQphgmFy1/W13BiVHvDcCW5FxVNIbu5jijXWRUIsZ114raufOT
	rz+jcHGRDBwAQlVsl7+3sJj6DwgW6w6fOGqPLsVaumoxRq+mALxfLho+I0JbQRbboh0jjVY9VT7
	hkNbRMWWFqVaSdbTPeTj5sfPy8W8yLZWbGZunU7o1czJq7FE8hAhMLionUWHR19z9z/ki1CS7G1
	KA9rebChpadyaZa/A8CrAN8t8l7wp012RuxCBpCUMncxKdRkzKpFlTkAcUTtLBtQLd5Ip2uW2ew
	ocmDAXIbwTYEG/f8wOhUhloQ=
X-Received: by 2002:a05:7301:7214:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c15d3e42cbmr2323302eec.6.1774549083220; Thu, 26 Mar 2026
 11:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325003921.3420-1-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 19:17:51 +0100
X-Gm-Features: AQROBzDHC8l4cxhgXpM9E7qHhcmsh6Eh0VloN_3mY91VrE0Eq-6JGd81wVQv04g
Message-ID: <CANiq72kqKGA7sqB6WnJxMiTLcRx5t=0xDJhzyq0LmSQVT+9WLw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any Coherent<T>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, aliceryhl@google.com, abdiel.janulgue@gmail.com, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	ttabi@nvidia.com, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:39=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
