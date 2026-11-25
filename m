Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599615;
	b=ekFa017vq9Sztl86rm6Vs4oIkYxqWb+8x2aq9VTHBtle/J0iwbV7jd2bv/3msv2UAdqv
	 FkiCcSkr1jbk0lR5Y7kb1EisgyTTOsFOtZjlWT5j5uUrPAAk5c9x12iN/1mWpePlP6Hn4
	 6TAjTS5Js40VUjDUxb/8QQgJKAcpfX9ou2qMOwKxy3BLYTh2fjYWYAIdZT9PkrNYec+G8
	 OjINxsL2bx38JVXFxS823a8CpLS/aV+8gMUhf3NWkjr8mOq9Nbz74Lf0oq1mdzw1MltT2
	 SmQuMCvWjWkRwb8eslv1J8Vkky0DMhE5ndKEoblC3X0JwtvWuRfOTu2GpeDMfJt7mgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
	b=2FebEXrr/KoEEhq8C4cFT4DJycD3hx4CQ2jI6dHsU9b3nLSnTPaifnevUU5FTWWJ2Thb
	 liIhHTG1LzNTWaPBbNmaiYR5QbVd3hubl2S2DniPeJtV0AwszbiLM/82Qmph+wDKqYIrZ
	 3XCR5NbOWQdK7wXanG0L2kx8t/YGe8FSUJu3IzfUKY95lebaaCqxgwwR4BsgZIcoY1Zee
	 tTcByNfYuz4LYeK18IJQQ70hQZVIJlVG6PcaqpMcYs4FwScxvwpO3cnDJlM8izyPYpQuP
	 9sIyAe1IGP5A2iip9izG+2RQTIpWe6EWgiyKIJSshZ7MGVrSDBICyyEI4ewpn4wWoew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIKesa8W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D8E606A321
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 09:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D8E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIKesa8W
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53644ab1f7bso49883981cf.3
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 01:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795599614; cv=none;
        d=google.com; s=arc-20260327;
        b=bqdMQaQhz53gKgWL8ew42GxV+Wm8RcRGqOW/SZFl4uPyfK+Q9HTWBEFMu+OuIP2Z97
         ZOPXoCtj4yt5Ryb2BHklwox0wyneCnezqd2iI51AfKzXO537F9vr85UKbKftIg6KIp2i
         ODN31MkxSpWC80Snq/I1hUNkUko9QWIHc2VzNnskt/GiS6Tdf/klxC3+fvTBpWVlASzG
         rYBGiHYg1IJwUowXGwV1PZzFp/GvkCZwvvAUc6FpcBa300VGbtn/IRzkbJGZWkHtVj0q
         O3vaw5/zPxmm+zvpo79qVcfvrKLSYkBqyB7CFTwnrKYMDKxEyeHatrWFqk16DyQp9xB9
         4Kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
        fh=i0VwY8qjP24mU6sQOzEiIJXIPyFoque7H33Nnm610As=;
        b=KJmylwcCD6EZYumh0hqKdqLGvce9N8X3vZWEB0+qTbFlUsfjWOJ4MDotLhAHEVMr0W
         uN/SYEqjudhK7o2613JpZGRX2UI9v8SGogapvtEqZLSWA+tNPacQJi6WHuNWvSJzhdcl
         iw2XBphLjrIV5wJWfo1RE3HSSkQy+Zw7fIhbumGAUiI9iyD+yRJjWEQSV/NV2dFtG5fh
         QRJPfcDifdXOGFSzjy6DsNgWVBp3SXUwE7FCDaFwu/ILpcV7EftI2gbdWGOFH/p+dTQT
         chzr2h95KKSTbsN/3mhYfCCebjbNeU7azo4BuiT0VUG/bbdnxhH+wYbn4cg49CLgq2Se
         eNaw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795599614; x=1796204414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
        b=nIKesa8WQFaovoMC+nsZ7OyHe0SpQvEgjw47ebH58qCigRZv15Hk0/PWsggRxBGRTK
         wxxBxB1Ed3QnLseb7CHLJ0I4+qjPhoWd2vedGdevUCtpw0TYQa0UONs0wHMXqOff3iT/
         daucs1NWdWjght+Ep08oyD4dpT8Teuqpirxmm8T992kOypSBNbaJlt31K10A4CinWFYG
         DUuVXR4Naj30oCRSKjA5NT7nExs3Oc9FYqjpsaf24xDvrIwXlDFjXWYLprwMdCHyG8xK
         MsIkZc2xyKd7se3mOF4w0tq94i2IwVoTsapirod79P+hJccCpFaEPfc4iXpopbDe5HfU
         GxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599614; x=1796204414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTcvvyhBNUNsS1chSuihlFbUFx9qH8hVZt/8I3gImw8=;
        b=Gmjpzz+hWxzhP3/RG8eJwXFzWXn+VQaecrWDp3yhQlphpl2fNQG8J08BEkbQsInYzh
         vdN9+KW4Y07rWkVnYCGNH6oQL8URTxbdcTx1HU9jAd3FUyUGQnfJV3NBh2IMu/uhn+KU
         zPs6ujs3VyjBK0XJQx8xP5nKffxyIrVPBiPPYi2k2KK0quFd8fBIoxvMlJpTvLstCdnh
         jqdr7yu7xv06Ybs4VRsPPc7CZTgGqbW2Q3919+dpxJmwd2+9uwlmCZ2zz1cKb4MDa2ES
         gGm8nLXrXqqAxWOFJ/izPZ85JzTku+HhSRi9ReZ21+2InoC8nZjN0xjtm9jfUe1BVPhi
         +ntA==
X-Forwarded-Encrypted: i=1; AL+hErGJ0VjfHAahMZsWuyU9kyv8QTxm0f0LODhyLtzsKEsqnmE7xL4wDN4C1/0Jvy1AVG+RIQkpS5pWfEzVgw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9wVf80W/5czeWeNTuDuQ3y0uBFWFFxMNipvYzpMH0bt19grb+P
	YX6wJiNZmrJmc8Yxpqoedk1iSvAmtLdNGCdPtjFRrc+vqk0M4WJlnVROhaSyRJbYURZAssBb768
	PElXMkKw3pJNFJWo3DCjvelJgtDM7j2y9Di/zV+yP0Pgs
X-Gm-Gg: AZFdTZc9UlAeiGh0CrJGquQ1WkYWeq6TUeyi7T1TMATrqJf9dwYVuaKWF2lHXe/MjuF
	wLdSJJ7bM1hf++PApeisSts/p4b5kPMm2LoKSguoGVYagi4KAJbCS4evffs3YlVdYDcv8lzOoV8
	tCVPVzGo6XOAmXjDf3I20LybZN1HSH4ZNz4YZK335e1DFRX2smTKo8bA435FzrkBs52N0C7UvX6
	24dneF4MidmqQgQJXDoCoqEzQkpy5g3FtT2sf5qnH1BIhiVyyjr4wGdt+Whomhci2xc10muuLpB
	Wtv5VAg0PH/pf1r9+fJPyzA5nBBq0zI7kYKHzi8jdrGWdKS6RqsvagUy7TBFB89oyyNxJjMMuTs
	HOjJ5eBZX/MsjOwVvnod1chDiv2XYMFZNj1SnH2g=
X-Received: by 2002:ac8:5d49:0:b0:55d:13c7:c231 with SMTP id
 d75a77b69052e-55d76a9b7bfmr318118231cf.58.1795599614000; Wed, 25 Nov 2026
 01:40:14 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>
 <2026112516-germicide-viewing-3a9f@gregkh>
In-Reply-To: <2026112516-germicide-viewing-3a9f@gregkh>
From: Ruide Cao <caoruide123@gmail.com>
Date: Wed, 25 Nov 2026 17:40:04 +0800
X-Gm-Features: Aa3M54paJFPTDXCE5Miu03up-m6akxgB5vbSJVh8_ZPgYo3CgB1pJ7CDMM4GuWk
Message-ID: <CACveakRWUr73N5WZ4a=07QQdiK3+=Ct=BSB89TS3wnx6Yen+kg@mail.gmail.com>
Subject: Re: [PATCH driver-core v2] kobject: terminate the uevent helper environment
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ren Wei <weir@nebusec.ai>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, dakr@kernel.org, 
	johan@kernel.org, akpm@linux-foundation.org, kay.sievers@vrfy.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Sorry. We took your comments seriously and did not mean to skip the discuss=
ion.

I wanted the reply to include a lore link to the new patch, so that
you could look at the change and the explanation together.

Going forward, I will always reply on the thread first and only then
send any follow-up patch.

Please find our reply to your previous questions here:
https://lore.kernel.org/all/CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nM=
SxYQ@mail.gmail.com/

Thanks,
Ruide

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=B8=89 17:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Nov 25, 2026 at 04:51:00PM +0800, Ren Wei wrote:
> > From: Ruide Cao <caoruide123@gmail.com>
> >
> > struct kobj_uevent_env has room for UEVENT_NUM_ENVP (64) environment
> > pointers and add_uevent_var() lets all of them be used. Once the last
> > slot is filled there is no room left for a NULL terminator.
> >
> > The usermode helper path passes env->envp straight to
> > call_usermodehelper_setup(), and kernel_execve() expects a NULL
> > terminated array. A synthetic uevent written to a sysfs uevent file can
> > supply enough variables to fill all 64 slots. With CONFIG_UEVENT_HELPER
> > enabled and a helper configured, kernel_execve() then walks past the
> > array into envp_idx and buf, and dereferences that data as string
> > pointers.
> >
> > Lowering the limit to 63 would avoid the overrun, but it would also
> > reduce the capacity available to every uevent, including the netlink
> > path that does not need a terminator, and could make existing callers
> > with many variables start failing.
> >
> > Add a dedicated sentinel slot instead, keep the limit at
> > UEVENT_NUM_ENVP, and keep the array NULL terminated after a variable is
> > added and after zap_modalias_env() removes one.
> >
> > Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struc=
t")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> > Signed-off-by: Ren Wei <weir@nebusec.ai>
> > ---
> > Changes in v2:
> > - Keep the capacity at 64 variables by adding a sentinel slot instead o=
f
> >   lowering the add_uevent_var() limit, which would regress callers that
> >   emit many variables.
> > - Compare against UEVENT_NUM_ENVP explicitly.
> > - Keep envp[] NULL terminated after zap_modalias_env() removes MODALIAS=
.
> >
> > v1: https://lore.kernel.org/all/cover.1795426787.git.caoruide123@gmail.=
com/
>
> Why did you not actually reply to my previous email?
>
> Why did your previous patch not work?  What testing was done differently
> between the previous patch and this one to require this patch?
>
> Without an actual discussion, just throwing random patches at us does
> nothing to make us want to accept the change at all, for obvious reasons
> (i.e. what would you want to see if you were in my position here?)
>
> thanks,
>
> greg k-h
