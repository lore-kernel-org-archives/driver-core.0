Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB5D2F3C1F
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389065; cv=none; b=NCYOB7ie5o0hB0wQRRM3PbkKPimNfR5tx486G/+4HIGZBeK2jTQd4zb1M7Etk2JQ9qC8wFlSmuKXYoCHmuoyAl3GO38Eeu2fdjsMJoq9W3j2n5t7qZKduykY0FrHy/M3XtSVUikq7M+TmiaR7rhahLon02MHJTyVfHC6BW3/iFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389065; c=relaxed/simple;
	bh=i3Coe7mHx/1q/bt1lktQ43Lv+RICmHSAbEawJT6BFLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEaB8WcBhNRqg4SDJ3a2fd3eos7tlC17Z2sOmzZAQulRk0cNLsu5Fj25QBPPieuqrIUblpgFq4ugsLoL1Mh1T9UUsb0qRG/N3/+0j7PM3/MAsmdkhWgVS7Jyog27L3eK6WR422Hc2o6+LgXxAoj+3vpqnMO2UU7/LBEPBPvgbPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GMhGZd2k; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GMhGZd2k"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9358dd7f79so563867666b.1
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 10:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772389062; x=1772993862; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5qhGyGsXJ9/tAFMFzwHRznymGmjUNcVZ9ynpOMQhLUU=;
        b=GMhGZd2kHPkepYr/poRMcJMf3tbsWgIMGYNzhdrxTEj3lBMIwMAQlXP9jv0X1osuA1
         b8z0rZh20xQ0mxRnJkaVBR0GzhEACAb7hnEJj99rxkuChX2jaXe/qaeKmjyQQ5p+OT1L
         iyq/xZOLlPSRSPmj217rBQOHob7J40xhYVnq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772389062; x=1772993862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qhGyGsXJ9/tAFMFzwHRznymGmjUNcVZ9ynpOMQhLUU=;
        b=PL+jYJHyURu7cOlMGoRKVMhliNM7EiAI+G2pyYZGty/kIpsZ0HMCiJWxOLh84WD41o
         cQkDr+toPPz+3jfp2ptuAsQSawOnLA3NTvXd8WnYIypFBEg+65iFhKpcTTFaJz6j+Fgv
         jQzaKsmITFGbLmTk5X9Ylv6JQDiDmQt1Oox919o42kA3mmCABsWT74LGXv90OHLfp3S2
         yk+F8rHCAmnestaqtF9dtbwPG73qvhGcwqUFG1lqurMOrvO9iZIZG7TfexmDhtSoSfed
         eDaoIRZhjSm5PD81qcropqrNffiDTIIvG7xVVuchwz9BbSps6q+I9nZ9BYu5nu/ZPKBG
         5R5w==
X-Forwarded-Encrypted: i=1; AJvYcCVB9FhhdPrPRJRzgQ9qQCswQhWD906yV8UvxSBKcgdilQkrvg+D99Ge5uXYgbNRKnxXgOJY+Kn7YET/bg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvm1H1DRL60ynnNlF+3SUEjvsjBNhkTjEIKBjscJnd9X85rAJF
	XXQfYENAdcNH9vYSzQCz1JTPnsS6ntzITTE4jCsGOvcln4Dl+m6QfXnQH2rnP2d+OEe4BZlfChC
	W8Xqy7ao=
X-Gm-Gg: ATEYQzzP/oMz9iTsnaGDeMqhQsxnWPnl1P6yhXhcNJnYitmMHvX3Vf+nicby5citZXJ
	dYBFwikCHZAfvDzxlCUwlrnH/3ti/92ky+2MN7D9x9I0EsZkJ9gGdmFQNWPWPc5rm8uuPZPWk/M
	R8fgMAsw8XyqLNCeeBAX1GnsgcojE0nsnleMw8z9de/E3iCXf1imJoTDm3LqrifUQ2eWvOeKOI+
	9dhFUdFx36AKz7tHgXGUBzO25PFns2i23+OoSN4cH9K8/MaHwjTjThOOlkKE+rchKGV0kVWZ/AS
	03Tjxxy6cjG0HonvNyleEJhP6YnSDp3IblgEoiABne+GZgVZNPvbjJ+NSQtJIqm+Gz+vqGfV0fR
	YYSapt90YynniNMuXJDN/vGOLN4S438X9FXKNPh7gO/p5sGBlWmusGl5xSXBoT+i1BfvH17+rf9
	pxHbrmn+hqBUDppoLCZiJZxSlIZuNvOl/9cn1ruy/ctIgvH2AOD0FJDbPghWct1w77IAt1Wfxlt
	Zrb5TABJE4=
X-Received: by 2002:a17:906:dc89:b0:b93:9cfc:100d with SMTP id a640c23a62f3a-b939cfc2027mr271462666b.49.1772389061738;
        Sun, 01 Mar 2026 10:17:41 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13d57sm382469566b.12.2026.03.01.10.17.41
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 10:17:41 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9382e59c0eso326179466b.0
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 10:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbgOH5CU8ZHT+GxlYnCQGf9MWZ4kZweC6q/dc7A026gYTP+vq5BHfMuwYb556FE9zsJogV1xWAAUL+Fg==@lists.linux.dev
X-Received: by 2002:a17:907:6d11:b0:b87:7485:b4bf with SMTP id
 a640c23a62f3a-b9376180f60mr604929966b.0.1772389060956; Sun, 01 Mar 2026
 10:17:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org> <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
In-Reply-To: <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Mar 2026 10:17:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
X-Gm-Features: AaiRm52NQg0Dq8eSC_WI0O8y8HVmFVEoA2whrGx34VJgXkMjnIUoMhKJPi6tm48
Message-ID: <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Mar 2026 at 05:04, Danilo Krummrich <dakr@kernel.org> wrote:
>
> It happens that quite a few busses rely on this, and there is a possible race
> condition that can lead to UAF bugs in the context of driver_override.
>
> I think it is rather unlikely to happen though, as it would require a user to
> change a device's driver_override field through sysfs while the device is
> matched with a driver.
>
> In any case, this can easily be solved with a separate lock.

Yes, if it's literally just about driver_override, please just fix the locking.

Use some really simple local spinlock lock to just copy the string
into a local copy when accessing it - it's not like it's even some
arbitrarily long string afaik (how long can driver names be?)

Don't use a huge sleeping lock that has other semantics for something
trivial like this.

(Or is there some other driver_override thing I'm not aware of?)

             Linus
