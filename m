Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0C3E025C
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194174; cv=none; b=kTs5w8jwAStlRIm5AK69LAgdo81TcFFqOxzoim7HAFLITZqI5EurymICep0IFdNc04ETKGXrZVojVj/ORv4JMO3MnKYDArEbwe1ekObwi8idCfY7Cn4mbKDvBFgnsYbzh1cTGMNgb4El9dzEKrEqrNhPCXx8h0nfW70sisIvFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194174; c=relaxed/simple;
	bh=tRwwPm2D5nIepSceJM0pkeSnO5SawAC6kECKvO0Ldeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piakJv+TCyeKH/9FAU4Jls/d7fwa6ji7puAOT7OrtONTYa5NbA0G98wR7uMp0zUf7+a3LyjnV1X+7yG4oos3SZMp47A92rTzgdM/86uCfiE5xvtBvsJk/fKH9LmCFCKoo9m/NNl02SOs79fh8Ue1rwrJymtSh4AmpEKVjcP/1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cJA5tyAq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cJA5tyAq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso3712418f8f.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784194170; x=1784798970; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZYVbeeOVEVKgZdjL3khzF/3dYs9Pmz8kpqs0eSImZY=;
        b=cJA5tyAqPEPN3S7QRZFXZkvhcYLHy8jFq8bsNFkgaCuaLXXiAxQdVAQJhC88AppoIc
         BsF23yt4V860yK/S/tBqtnxbpvN1UGjl40P2EFx1ou8FLE4CsPwJw16IaNbVUMuVN9fl
         q6+2xf/Aj+mYjlbA1UDjZZOYN7P2XaKOb2rR+9agqqMiJWXWla3YtR5nuMQRnJk+16xR
         1roz3w8T7a/LK7Vy3qvhMgOKW2JekaKrKfb7D5hP6WGYDoULqJaStLm9vt+s6sz0YFfG
         uyx5GdIRkMkhYXjUaCK/wEsoUTY48klNAlK6JSj5OJpAGUeAPY/hZAJ4kxxgHSN4CGqi
         1bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194170; x=1784798970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GZYVbeeOVEVKgZdjL3khzF/3dYs9Pmz8kpqs0eSImZY=;
        b=LM/ZEF6WUHtb3PFQfHb9CFfasflFNUiU+8oHRBu6kTQlvi4PrDUpdtt8zI7jBblPx7
         0YoYz4LUZ/SgkDoySF8gRkQtTB4BcXxI4V0TbQgZRFdKhPLUBuln8KkTOXmHT6QRrLDL
         CnKdPDj7dUeRgktH7pe8nbDDtL2kfje1MLBmTwr+zIyeyaVg3smLuFpTocost2WW56cC
         2cVssc3/OzJ6CtK28MIV9NIUShpkP/ZQb3oJUo3p8zU8/5QUlAzqAU1/D6heN+w+KS1f
         Ta7uV07N9EPBoGpJrn6N38QQxQCs/Ml5skbzr7YHraFOT1jZQwOdjSDvaCISpr6Dslmi
         /3/g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/MWJatx/EPuNmF9oW+zmMGF7/49xHyFKGi/gFgmccOvul8TmXO5oQrSRrawxcYccg5jV5/JdyUZ6b/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/ef4NJ/OUcV0HoxtElWXIjadtUUXQwr4LgleVtqGYfZREQlRu
	tohqt/fL4bmyB/TD3MGWMs/ppHomYU5if+0DMKGPqlaKmkfEcFkfjQuQnuItPJ7QOp4=
X-Gm-Gg: AfdE7cl3JeHOdsjJWA2d2FHAqBUQBYWFrK8cPNETXvKxkwJEhCwDjbl33Hb5dK9eODT
	GPvESSjR6zKjDXHCIcgQqpczeDMPJUH6bsGapNOjiwWz1PmUmyxjCrXGzPluDouqH0H8IYl3uV4
	9tpdNW+I0aIaoqmsBoPobqdKO7GrVGj123y2Dj2csw49UMbBoxZ9sqLL8g0fSh1KpNT2lOCqc7d
	HWU1nA+wKLCemVzS75HCW/hN+6kROiHSqQsU5doNRTOKcB8QyBvfazGYM36e/O97yi1wotQ04Ip
	u4UKnBKrcP958G0VRK79zrg6t7Og7CHfbw47Pr/OP+NYEVOV5aNfbQZuTxMRqDjn3/wd7+50Ko3
	Yr8nqkFXuvD5RRNmWZlvlEg8+uqTk2vhpp69/ji6xuEs8RnlhP0IcYEqAYGCOeGR6iW2SuQ==
X-Received: by 2002:a05:6000:250c:b0:475:a4ae:e630 with SMTP id ffacd0b85a97d-47f48891d9dmr13072461f8f.37.1784194170478;
        Thu, 16 Jul 2026 02:29:30 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4635082csm22966721f8f.7.2026.07.16.02.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:29:30 -0700 (PDT)
Date: Thu, 16 Jul 2026 11:29:28 +0200
From: Corentin LABBE <clabbe@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, mcgrof@kernel.org, rafael@kernel.org,
	russ.weight@linux.dev, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] firmware: maintain a firmware list
Message-ID: <alikeGzFw4XTIDpJ@Red>
References: <20260715131325.26099-1-clabbe@baylibre.com>
 <DJZBI1NIB539.2WG8TLYV4ZXDV@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DJZBI1NIB539.2WG8TLYV4ZXDV@kernel.org>

Le Wed, Jul 15, 2026 at 07:23:25PM +0200, Danilo Krummrich a écrit :
> (Cc: driver-core; please make sure to Cc all relevant mailing lists)
> 
> On Wed Jul 15, 2026 at 3:13 PM CEST, Corentin Labbe wrote:
> > From: Corentin LABBE <clabbe@baylibre.com>
> >
> > Checking if some firmware is missing need to check dmesg for error message,
> > and on some machine this information could be lost since dmesg uses a ring buffer.
> > Having the list of all firmware requests is useful in many situations,
> > like selecting the minimal list when doing some buildroot config
> > or reducing the size of linux-firmware on gentoo via saveconfig.
> 
> The proposed implementation aside, I don't see why this needs a new kernel
> interface.

Hello

You miss the point that I propose an easy way to know.
All your proposals imply scripting, grepping in difference place.
I propose a unique easy way to know the list, without any requirement

> 
>   - Why can't you use 'modinfo -F firmware' for all compiled modules?

Because it display all possible firmware for each module, I want only required/tried module for the host system

>   - Don't you have a journal persisting the dmesg logs?
> 

I propose something that work with embeded devices without storage and/or without syslog/journald.

>   - Why can't you use kprobe_event on the kernel command line if you really need
>     a runtime trace?
> 
> Untested, but something like
> 
> 	kprobe_event=p:fw_req,_request_firmware,name=+0(%si):string
> 
> should work I think.
This imply command line hacking, something I prefer to avoid, it is better when it just works without change.

Thanks
Regards
