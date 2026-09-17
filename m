Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563EA4ABBD4
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661119; cv=none; b=Z+yGNAo86PPKv+Qzzu19Awns+uGJS61synwNQ/Udzokm5ehUgFTbUH0CfbjtdXO0x6FCYpfih9ugz6AfzVxTRk1AWWuuaU2/1G+gimL5wg1M/7D/ZKgCcB1f8+wwr1M9fuywe2TCYeVjeJ2fJYkUOJ2aXMFvNawy6njtZNfHhHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661119; c=relaxed/simple;
	bh=WZ/X1J+FgtaaLh8+x4jOo5vLn+ulOLLCnMUuIfGdG9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QO02FSd/Pc9N4VNRBqBqpl5z8OYiprPyqgsmQmJVR7fOK81b5bhYb7j1i5N4vPX5rbvInyUWo6xwYT88oSWIn9PU3j9cF8PC35Lf3NEP6PiDPBBRmrfrBuhCeyK9/UTNfCHFHLoqRExODYKH80RLJ2RtZHsksTMupG0LClD82Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMOx3u5j; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMOx3u5j"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so7947455e9.0
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789661115; x=1790265915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gla01MaALvns0Dwp2tgzeez6/2m4FJ1qC2kzsmKt4Ew=;
        b=sMOx3u5jyQsGKjMUAbLIp5K/pA7n7lTOFaZR6cBLe+yUUhXrMj2jnqHeZho33CyqiH
         BffdGQ8rToL1n5bmcFF3UiaTglqpgfLfSeMJTsQygT2Bsv/KiQEpdpeE+PR/bO392xwo
         065N5BrqKrb9jUyzQSckIqSXtfC/umVfLu7sZ+5iO5YcLRca9VVorAZGK5WeUxHM2CMB
         X1Vnmho2n+iwHGOCyAkOrlGbmcXa1Qc3Vs7NM98mPOn0K35QZ26RI08c7FS5ZuBz6EjH
         mw9GknePfCUPoO+twHzlFlRurSymd9kn38yyU6Rzg6u2Wtp+de6MBLvCo1KbY7JyR9Ci
         FXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661115; x=1790265915;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gla01MaALvns0Dwp2tgzeez6/2m4FJ1qC2kzsmKt4Ew=;
        b=Yk9GtrgPbQLz5YdOgwiKARYChIdnNmaCsPThUWecVbG3BgfBuH9uk4K/fHM3pf5wYo
         AKZRnFtcxPiTFmaz/ivlc4W2TF4h6WwaXxRTWsjRSZHx1pB9mrG1B+b4h/jUvhOf/5cA
         I7xG8w+mIYT99mdBElgJBjomlccLkEp898dZt8Bkr4yYSvFbzpOYbn42HZ92MpmJld3o
         B+KxJ8OwQS9sXlAI+zRbbtqki9FpxIBdlwqWV7TMHRA7pKoLCHBInsHBD0Lr/XTw5nLd
         VB0Hc2NrrIeElIFC8h7EAdEhstBlm5GpqHWfE8U+tre8aiN0HBUjC+umHz7embTK4xX7
         uINg==
X-Forwarded-Encrypted: i=1; AKwUvBwRSW7X7D+TmuGSw2O/NaAIi/8ccIDqAONhM7LCfXy7z8MiX4AOABUOcPIfNY0aKF+2Ize2CS5XhA3Iyg==@lists.linux.dev
X-Gm-Message-State: AFuF++n6ynFatHc9BkmaB0yMf4yX+logJ7K4KgEg1//ygOwJK5yijlzB
	9N1yXzl6NdhpSWFkotasRbJjgAM/5wFiuGoKCWZwnCpSydeU4tzDYEfL
X-Gm-Gg: AYBFou013WuuenSlrqSBiP6VuRXabjwEDzuIYPz594FsD73NZ4lobn8eFwkaVpix1hw
	o3K0vMvVFm11dESdeFkb97cDYC9OnUisz6p37H4zzIBg0NFwCmIKm2WMQ/ugDqQI2GZBFj3/74I
	98HfCZH2hvdv/tu0+bnm+yyDVtuuTKEVZbmvunO94AmkF3tC5Jzpz7VJKOxj3Fpt8jPfbpcJE3g
	GIHSXIPiwjcO6eNvnVZ4mV4e58htR1YD5Ekltn+PbhzxGosEocXWI+lxmX+tucaGVZo6NiXenlH
	mfS72derDlqxmaFr3QAFDF7776xk/8wh7I1yQig9VwSE+aJ09ogkttXVpR/KaJVudulgxpdaL6n
	lmYDDPQdHt3On7x+VhiDpHy4ui/2owou+vulcqJBSKsOVsrB6iHMsPKAPcMB9JObgJJW2/qxjDJ
	vHjrxGrvh3PrbbTsj4ssquJmGx84gTvRrKF8aS+D2gqqZ7aZnHUZR/WmnHTNUHzYmGiHIs/DpCv
	nPan45lpg==
X-Received: by 2002:a05:600c:8b8a:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49eac463921mr112202255e9.7.1789661115499;
        Thu, 17 Sep 2026 09:05:15 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf3494dsm15649963f8f.28.2026.09.17.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:05:15 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sched/cpufreq: fix schedutil's boost frequency handling
Date: Thu, 17 Sep 2026 18:05:06 +0200
Message-ID: <178966110618.2386.17602156528185920946@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ananthu,

Tested both patches on a Lenovo Yoga Slim 7x Gen 11 (Glymur,
scmi-cpufreq) on top of next-20260915.

1/2: with boost off at boot the little cores get cpu_capacity=553,
which matches the 4723200 boost maximum as the reference (4032000
would give 647). A workload pinned to cpu6 runs at 4032000 with boost
off and 4723200 with boost on, 3.14 s against 2.50 s.

2/2:

  # cat policy6/scaling_max_freq
  4032000
  # echo 1 > boost
  # cat policy6/scaling_max_freq
  4723200
  # echo 0 > boost
  # cat policy6/scaling_max_freq
  4032000

One observation: policy6/cpuinfo_max_freq still reads 4723200 after
boost is switched off again.

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11
