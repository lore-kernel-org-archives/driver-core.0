Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586CA2D8DB0
	for <driver-core@lists.linux.dev>; Sun, 19 Apr 2026 20:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776630550; cv=none; b=HD/g/zqTiDeed15mHHQy+QqUdyrB0wAoNThDGKqcLwJrho1b11Reyyaqf+zmIGmmyFJAcWQN5DoxxuKMJ6dTz/fuGCjsK0qsqZe0JsACUX8uYA3jH4Z/u7FPEar8fBEd552VxkgPsksabhyivJ3XQC7ozpfuH8YA2RVENYJSoqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776630550; c=relaxed/simple;
	bh=NHxTbjLzAV+jXxLmO1ljglGuO8T3B4fE9pddRX2dXlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P40FVtL6GbgxRmOUVEp7g47dx1t3fIdDOxnTxZkHlg9j3PvqFrt5FrT4SQ143t24EFT2jnjpCykYwdY6XoXnF8n0g3HEaatdOvuaAs44RgWk66BGdYpsvj0jV6T1Aum8MT2ecnJgA9nnSPEhwJYIoVCRFHeNFBBW+Quja2Z2gX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h7PAqLSH; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h7PAqLSH"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so3587507a12.3
        for <driver-core@lists.linux.dev>; Sun, 19 Apr 2026 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776630547; x=1777235347; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YfBvEkGp1ZXxq2q3Fd6gpVof2zS0Z1YzZU38Om2E6YA=;
        b=h7PAqLSHjMHCj9lDyTpMpRQTxPyv1JlLHo/og8ffGXX7U3MO2jiT4YVDFQ+SP/Efc3
         TGfIrtJcFlAKuJOHQdDh1HO50qgmuyfPj5uQ/rAhn7JvTfsVNRd1goK4fb6ACxSRIYzf
         ncuGwlPerJ4VcAK+gAaNxy1vXB4jkXQzURAjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776630547; x=1777235347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfBvEkGp1ZXxq2q3Fd6gpVof2zS0Z1YzZU38Om2E6YA=;
        b=WW9ahP9zkpl7dOdKhtM10wcHHS+i8YbCNSFEjjNK5avgPVrKEcUjr89naNs7DfGGHK
         D2qxpqKdK1tC/CmBo2Ofe35ew1s5UO+SUIAzazgtlnK2kl1CR+kIWOW4GDrlT0BKa3m2
         sdt7t6EcIiJKDbQKNrjgjANw7ICHgRYN/Ug82cvmSdRFfJ3ofuMNTjvNcgl+BK5SJ9O9
         TbguH1JqBfCoOZ4k8bTRUZjTIGJ/Foc/JFmelF35OMsIY+rO1N7RUqltqmllqqh0mf4r
         /iMKphv1fT+7aaIq4b6D9B+chDs8MhdiUs0xrPQoabqALm8eBZS6ooz2OuskZ9eV61/u
         HKJA==
X-Forwarded-Encrypted: i=1; AFNElJ+5L4VKIow6W33n3BMyXR+1XnDSIXdhvnJa587y82GQ2d1vQaIZCnf4SR5XKigu3TXq58Y5LDDEFoclHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmM3w/O8EJz/6dM5RWzRJpsDNYLGimcA/lvwplIqX9xJcGjLb5
	JQUrwbXkCtafWZnxEY4ncrv7Hvb4ClA7u2wfkPWPUXW2ikFek/U5lntYDHgjGxu3x868jDnXSgO
	iEEyhZNQ=
X-Gm-Gg: AeBDiev+38TR3nCxzX6d/PlLI6Kuex8RN4WdwT8l3P/nQtrTxtK9FBA9NsNDt7PY8PF
	Ghm9W3yUQsQgVE0BVxnnsUdwgK9FPCQPataurf1AuGUNjryaNAteLznVWR29mp+4hUgHKV28mLg
	XZDRyyTvTNvDqhwqQ/jOI/1XVM968x6eUiz6vAh46ZeLd15PuGt+xawDBBMdRNeS5NetQnxi3B5
	nYDE948mTxcqGQ1gJM0Xl0F4Lt1jiuWEULBr3q7PpzbFBttr5FTFY+nPt7oY11G3wtHy81SzVYW
	Jf3EDGs6A3FJwy9+OGAUEdomCcBleWTMx2aHZUnCjZNg1DkkPkvJQB2L31d6wnpYLtaX3fnstaH
	9TBu5QIS+bSRgnO/UEPhedSeuEA2o3+D0Ixn47D9f1vjflYuHt7aMlvVKvSjWUQ/fj1GZEOdgLQ
	8pvRaEnP7TtO50FODpwx+0XQwn+VdCFXbPVk0AyuCYkv9B8jevHppQ117FA4iIAV3hZBGnmu1Sc
	MUsoBiKHxY=
X-Received: by 2002:a17:907:7205:b0:ba6:cfb2:c048 with SMTP id a640c23a62f3a-ba6cfb2c1edmr163053466b.43.1776630547445;
        Sun, 19 Apr 2026 13:29:07 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b379sm271881366b.39.2026.04.19.13.29.06
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 13:29:06 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-672c23aa064so4319345a12.2
        for <driver-core@lists.linux.dev>; Sun, 19 Apr 2026 13:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9daXzcDEZ/einEgX0mRi/lmkDRkxdO6X+UQkgzemtPEqO6nRYBBL6xnAMigIbdC+yC38XPMXKQgOSmFQ==@lists.linux.dev
X-Received: by 2002:a05:6402:4308:b0:670:8bc0:8555 with SMTP id
 4fb4d7f45d1cf-672bfc15a86mr5320531a12.0.1776630545844; Sun, 19 Apr 2026
 13:29:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
In-Reply-To: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 19 Apr 2026 13:28:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgKsB6SqFbOgPVpBLh5vz1T+h4MxTX1qDEYH=KH9=bXAA@mail.gmail.com>
X-Gm-Features: AQROBzBTCmoFqYL2edLPKge_3mVXjlg_PG0g0a6Ao4cQWP6jmU76wSttvPbjbVQ
Message-ID: <CAHk-=wgKsB6SqFbOgPVpBLh5vz1T+h4MxTX1qDEYH=KH9=bXAA@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core fixes for 7.1-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Apr 2026 at 08:43, Danilo Krummrich <dakr@kernel.org> wrote:
>
> - Prevent a device from being probed before device_add() has finished
>   initializing it; gate probe with a "ready_to_probe" device flag to
>   avoid races with concurrent driver_register() calls

Ugh. This just looks disgusting:

        device_lock(dev);
        dev_set_ready_to_probe(dev);
        device_unlock(dev);

when all it does is to just set a single bit.

Sadly, I think despite being disgusting, our bitop memory ordering
models are incomplete.

But I think dev_set_ready_to_probe() could/should use
'test_and_set_bit()', which turns the bit setting into strongly
ordered (it only needs "release" consistency, but we don't have that).

And the dev_ready_to_probe() should use "test_bit_acquire()".

Then it wouldn't rely on the lock just to give memory ordering guarantees.

And yes, we should have better memory ordering for bit setting and
clearing, but sadly we don't. This has come up before, but it is what
it is.

             Linus
