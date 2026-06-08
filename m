Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDE83D4132
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 17:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938631; cv=none; b=qCfpJMKrVyZVcEvMoXM6hujo2Jc05Vgiicfyz2lJw8AtvNwv/b5edqWTm2/VrSM+Eg7rJqpU+w2fZ2JATl41ZlpdSSvgvYl1fETk6r1h4iLhLdB/fml0pVIpM2WMRJ7Bfo2ZkXgU6BY5c4HcmclCQ/DEW8tC+oa75c05hKlI4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938631; c=relaxed/simple;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiFsyYYxuR7xhMafEa0fHnzcNdonmSFgwsbP23rOc4vgBhI3d2GDaAGhG945rj7emCY8i3n7mg4OWZsH3SPsa4oGQ9UCJz9wOrVuwKXU4Nrkux0CfTDwtrEAwkYCaRGz+zOoTRaGirPaGJ72vvB1nofqJb5EoaU8vZM//u0e3zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjDSnYJ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjDSnYJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780938629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
	b=DjDSnYJ7HWxlEz7T7gW4TnleXiL2S7diO3rRzNESSzOR+FL9sNeYl9ikYzmqICYBvu7Y+i
	J3FtoaEyFY5r52E0n8ZuglHQuPiBWBVITzdc6wQvBwd9adrPtnvAPnTPjYQOZK2AxHGwsG
	StMADEm88HVrC1M3FEFj0ptOa38n+to=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-U-RSwUUsPJmFlmU2Vu4yBw-1; Mon, 08 Jun 2026 13:10:22 -0400
X-MC-Unique: U-RSwUUsPJmFlmU2Vu4yBw-1
X-Mimecast-MFC-AGG-ID: U-RSwUUsPJmFlmU2Vu4yBw_1780938621
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91598ab3a1aso687154985a.3
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 10:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938621; x=1781543421;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jvziielmBQRhjbGDR1LkdWpDfix4f9jfDw9HyW1EWo=;
        b=pjNDknmzwSgxpTJRaiHB9HgQ6lHtv2oESQutmLEG8j7yDO0yzLkDHZwawwi1E6pL2F
         2bS/FH5EsLh0rteWChG7EzMCcEGuL0t1k9EPu6xiNaS4EYzgbTBoeFXlMJDayUmFyaHe
         MFUHgIYVhwfNlc5quF0ILUoUu1kQYvndFKn0NU1S01+PFXwLCq6SZGbfJu6lCxsBdAIN
         5YZ3WFAYhVnKmFcC4isGNCKjdj5aEHDFhgEMui8RoaSFqXxoqoC7HrGk2lO5vBvusSvQ
         sBp8Wtq0JkEMiyqv41sIQ83CvoXTLnIhKi9lP3ZX0HY6iPgsB2ckvBscoN3h4FmBhCAD
         wo3A==
X-Forwarded-Encrypted: i=1; AFNElJ9DqlI/7i2lHfbAQoM+oDwqs3+jgrLlY9wpBFN6F6aF/YcC4+LZceNysf3kAYoOYpGjyxct+Hy9rD4CWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnYhWyfw9QZlfHir4xmNAQh1Fx51OYnyoOtkA6dM5xyQD+7+jD
	V/1isRmrKhiLiGgHmoyWH1Xaioky1PwpSubtQBAs4yLu9UbWJ3Z+cNrc9XtPBgBJ2NHuvpynj01
	hRrerDKWAYtIyT65xTFZQsNpS57rkKTEpMhBofAcfjm01T2UQcLs0wcbf3VfiG5Sl
X-Gm-Gg: Acq92OFBuHIlhReXcbb9JtgMVXKInE1Pmrgw4TFkD+d5vpi25PwRk1HLTYSDZvVlK8S
	qfggvzhtldXlVq290aqUsydiaga5/DCflD/c1tUJYY+D6jBFCDyiNsAi4HeNkcFF/lUvIJ26Aod
	O66GarnLjk8HWebaVelAgPi/3aId6fBHeKTwzYHuoM+zEVVlxE4gQA1hwF657uC2byVTApFmiCJ
	LSctqyZr8bFtk3us08IvNA+GezJNq2nI/5FK7M0tUnSSZW79n4ufadkWGJkaZaxxBNY3VdbVZtw
	jm8MWvF3E0cAacCbPWlADzGWHbvBcUc7YVvj7hfJeVq+6HFrOqc02obmyTk+kksO/4SdhKpgdT4
	eBPxZJ/myspm9TWKT/ydIDWUrpAya
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id af79cd13be357-915a9db892dmr2520124485a.43.1780938621245;
        Mon, 08 Jun 2026 10:10:21 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:915:9943:d760 with SMTP id af79cd13be357-915a9db892dmr2520115285a.43.1780938620617;
        Mon, 08 Jun 2026 10:10:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3bf5f9sm1822479085a.35.2026.06.08.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:10:19 -0700 (PDT)
Message-ID: <00c7a09eac169e9da541b50396ceaa69ae978c10.camel@redhat.com>
Subject: Re: [PATCH v18 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda	 <ojeda@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Alice Ryhl
 <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Danilo Krummrich
 <dakr@kernel.org>,  Mukesh Kumar Chaurasiya	 <mkchauras@gmail.com>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Mon, 08 Jun 2026 13:10:18 -0400
In-Reply-To: <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
References: <20260604192740.659240-1-lyude@redhat.com>
	 <20260604192740.659240-2-lyude@redhat.com>
	 <DJ2TB5AX540T.311A690IK8F9B@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C3ouNoe6euZF_GdT-h7MZf5CRSs-XQ-TU5HrT1nOACE_1780938621
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think I have just been defaulting to always for anything that seems
like it should be unquestionably inlined - should I be defaulting to
#[inline] instead?

On Sun, 2026-06-07 at 13:22 +0100, Gary Guo wrote:
> > +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C>
> > {
> > +=C2=A0=C2=A0=C2=A0 #[inline(always)]
>=20
> Why `always` here?
>=20
> Best,
> Gary

