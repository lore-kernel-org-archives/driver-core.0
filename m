Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778E53C109C
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789495088; cv=none; b=fqFVJqhScFozD7Tr9lsOLSkQ755OkKe8dCKceXn+PZ4VUQYuPKagRdTvfev/eCOjAoJGHfefmQ9XOX3iTSQQZRaxALcU9DshUy0nHhGJn+wwdiOkYl93Zg+0kRKQuugU4yA3f/aEIxk1fPFAAK9GazP8LPn/R7mzOodFJnJPehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789495088; c=relaxed/simple;
	bh=FpcB0kpub2fAPepSq3HX3yXszymBy81A3aqkeOms5sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqPy+SJ2Bsyx2KMDdYgw4q5qoBk9Y8wWKG6BVvboNvBUIuAfJX2yEnITh90+09vZatRr+gxPy7Ed9qQkCgMV593DUczDBr2CGrcJNJsTWzKWWi0AmgNsh9Wd6Nz8xU0JRFq1e0/FloRkaRfThjdIJCNMQ/E9kdz5+vzatZ0C49g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp7XK5um; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp7XK5um"
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c963a787c9so10080e0c.2
        for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789495086; x=1790099886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FpcB0kpub2fAPepSq3HX3yXszymBy81A3aqkeOms5sc=;
        b=Gp7XK5umKYovzHLbMl9vVijPJFVdooHqA43I8Yi4/M5T2T4VzqiiAJJsLzHPA0vLSR
         z+bmRn0IGuiYfqASOfRDg3pSAfph/VLMNGRY8zPohbeYzYGtNaPTRqiDkKTstmETJCHR
         4aU8133xkmVSYO9RCjnE2V8FQ2L3PihTcWPS4exOloJ6J884G1UVxH9F103yDzHWf2fY
         J2Ixj/p9WyPOowz+191zRD36miGTzcZjLDDtxAEz9kp6HcA1aKBGCWpeHDm/AAr+3rio
         Qvv3Iea9xdeeR8cTyCXpuBcvy+5yqx48xL8Xf28Cd/Lf0YCf9JgOo2vEGqgQNixIovlZ
         HqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789495086; x=1790099886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FpcB0kpub2fAPepSq3HX3yXszymBy81A3aqkeOms5sc=;
        b=ELpiFTleehoJRtH4OwMhgZlTMl5oVLfPIOSb5fcfRa033KG8niW3NxV0LfMhSU8UF7
         DGsOn4hSRF9FnfpDgYjBAD3JN7fadhaiaVp5zpc8vPvxXdAAH3rBMSbGuRnI1t7u7cyi
         bYRueWVqUCqND6RJ5gQNvVNU/rZP03DxDCbymsWetILQWWoURpZJOPW8O5rz6yD8+M5Y
         VccFjeSlza0xevkoGgm0MWwC7YOMgXEQ7DAiw2cxrW/g9SqNjG+aWN4osPht8opLW9Nl
         jxEicyIDE6ypfe9kfZEPH9rk4QSkNkVgxF+AIxu2OnA2n1lLDnd6src1qalhfA/+lJGv
         cFRw==
X-Forwarded-Encrypted: i=1; AKwUvBzWkA53ECoOUIrCVhfqCyuofJXtk4BRAlcldO6Ldw9wvKyX+X27hBmQLxaNOqPtp+oO0dBXnKCIyXdn0g==@lists.linux.dev
X-Gm-Message-State: AFuF++nm/xSPIOuP7ss8W1t3BqI+KIMaBWICsV4FSdFw9pfmNVazA1rY
	RkS9VYqOOQ1lO9kZ4aqcf1SKGMiKa45kmsDBfmG/v27fZ6aK8qMyf0pN
X-Gm-Gg: AYBFou2zjr6uuZcuFVA+PkNcyE5P0BLguuwXt2AR+fxztVZXEMPZPmFB2Yq/RMxrfRh
	KGJyBdz1hJDEbCY6CqZzctU2kNu8q6WqZNPpWATHIL3B/Fswcq5lIkustbh+LtIv/cqmbCEh+Dy
	0j6DG+v/0pcmO6MDQOCdJNY+a4kOSPS33kExF2wBphevA81AKxnBhrLLotRub7hTzPjIxkgUdPo
	Q2FsyO+4hUUOrRwuk+pEX796uzhO9eBGYI/eMBM0x5zeUsbgeM9rtXjNpiSq7zx2KbDZXHYQO1S
	0dvht4wkOqWjKNx5Pws5U11Y2PmP3Sz37VmwaoUwpWENw3uu6PfiHpL4fuWC7RFaMD52mY2PgYo
	39JQMPrGvwCZb7DyAcsTi80URAzcVCyFPr0jcPVtcNmvrC66TwmR4AN2lNFyYH8A3CBtt7NWO91
	3Qeo9x0I1KMdk33vN2tYuuyhd8lORx/2hEruQCuLmcPLr5pR/LRlx/pz7ftoFMJl3TmxVbsWKFD
	3zYyd8VVu58E+rs0R6jsQ6vzgs=
X-Received: by 2002:a05:6122:d86:b0:5c9:54c6:b4c6 with SMTP id 71dfb90a1353d-5c981a92cbfmr11794778e0c.2.1789495086269;
        Tue, 15 Sep 2026 10:58:06 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9831522ab39sm159391241.7.2026.09.15.10.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:58:05 -0700 (PDT)
From: Davi Chaves Azevedo <davichazbh@gmail.com>
To: kprateek.nayak@amd.com
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	chen.yu@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Tue, 15 Sep 2026 14:57:14 -0300
Message-ID: <20260915175714.2015751-1-davichazbh@gmail.com>
In-Reply-To: <20260911220229.1368887-1-davichazbh@gmail.com>
References: <20260911220229.1368887-1-davichazbh@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Prateek,=0D
=0D
Thanks for the review and testing. I've added both tags to my local patch,=
=0D
with no code changes.=0D
=0D
Tim, may I include your Reviewed-by? Chenyu, may I include your Tested-by=0D
for the Ryzen and Xeon checks you reported too?=0D
=0D
Thanks,=0D
Davi=0D
