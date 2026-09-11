Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEAE4BEE48
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 22:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164636; cv=none; b=VE6u9SZKHM0bkro1Z0JdKsGiqilBqGlmBawI90fcpF/wFADlnPc2u6mGk5BwbKHcSX6w4CkKyDh6etQL7bnUeYPiOBnJP1VeqjAGrei41xu6nQj+DVaKsSuiLU9Ya1LlSQZ+LxM14+CVZw8CMgTIiKgKeD8WTqR5BW7ftymUZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164636; c=relaxed/simple;
	bh=UGysDTrnyTAo5ChTgSWtkbAJJAteuC+sMgl/HdEfmPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BK/wHeanpgE4rZHZ/3tQUHu25GpYZB/fASNT/l2cRRu9OmTulaZV4G4vd5+j1LItuAktifaHD2/ueUXAD3v9UkXCKMrUCww0smMail2jYPlfTh9lqk3ZcURaqR7KnzpgPJoftDKpB6aRI973sJtS0k2IjdI8mxRgoLHEtFyoHo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikTZ42wC; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikTZ42wC"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78565a41a19so31862137.1
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789164634; x=1789769434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGysDTrnyTAo5ChTgSWtkbAJJAteuC+sMgl/HdEfmPk=;
        b=ikTZ42wCrctZelVEtaP2MLRxf+adlCRj1oGbv9xJfhSYNsoufXrOPQv/hfjn9s4tGg
         8Jx26b8MC1AwwgxLbSR95Zo2KJgOpDIv7vAK7UukgCg2XGNtCzqOdc1VO0FWBlIsjumb
         pD3UuhBfGyHIYAw81zWljDul0n9Z0BD5PNUWm7AsgOBE+1JS4AmNuQnoZwmcmuceV3ls
         HNno8zqDq9Vqe//CYtx8V6K52ShZRXCviTZD4zpZr48C5l5gfR4zDYKInw+yZAjYiw21
         qFTpWGrSz/OoMfCyYTNsMA+mMpb2VwrM0f5N651Krs60YBkF/oLUUQDXeTyiQbtuTGOy
         rA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164634; x=1789769434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGysDTrnyTAo5ChTgSWtkbAJJAteuC+sMgl/HdEfmPk=;
        b=jfkleeZHjDigHEaal3890R2StsOHuIeb3bFuICEAvXB34ytA4X+5jA8rLUiBV/jHpp
         9+Q88v6cVKpQEwsQfxVGe4E3yRZhez1im2zZ394JSqj5vOM0frpfFcU55FunIjtBwI7g
         KIdl5pU+WtEN3PBR9zvcURbmMl9qTef9Wp88RIHhj3b4/USJKAcSvgQfCVmm10ybOJiI
         5OBuNW4yrakRCsRIRxfKvhne9m86TwS47WxR3BPn+aNjXt9x2uGndS7Jp+MuFhvYh0na
         dEsvE25mg5VHndBADBMgXogYv/ZE5H1YqicxZLBLsrwoEu1RF6BUg3wB8efJtyDcM0Hq
         mLoA==
X-Forwarded-Encrypted: i=1; AKwUvBzADeLJXB/ZsRX16KCPiPGhw/P3P5OWwG2ojSFRRTAT1RzE30zSWckg0xuPEd5EQzSoZp8dGdmig1G7bA==@lists.linux.dev
X-Gm-Message-State: AFuF++nWs1IjOVyM76CtjfsjYGpY1asI1/skRhxUnOd2ApslMEaCe6g6
	Pk+LEZeHtZpSk0+lUS2vVBR7IEqfEMJ8dmfaMZUTFW4zb88jLu1SGqPk
X-Gm-Gg: AYBFou0idRyxpJFhjLIHjurlPD5K3RDZZJkPsoL2I5R3XMCZaITZiyz4bujh14dIUyj
	lCRlsTigjKdMuh79tORR7ZDATGFgl6oAbgzHavreZWI4Kuw74tfmuTKfamkcCHuNv/4tHBZrx5I
	FCTJkPEwQaL1EKu78kvA2/e5jTvNUuBprEzSnnjV6QzHaVXNq3GDxvjPHX+e4cV6ZuXzR1LuQp/
	peGcDsxNXjKInhL+lHTfOtprR9hpvLLyiDxRIgKwhjG0V/E/3yD0kJl00JHhYzScOpRIocvCqLu
	dHb9Sl7rCAQR0YpIsWWaAwuIW2HW8kOOfewqdPVMV7NP6x37EnXE7NDfUOda4yVV1E4jjdhctgU
	qZdYEi2TJz9vWgCVH2QhZgnpn1lY9XX2NQSRd/0R6cwp21kdoLzWFbZoBpVbNkGMbdJ1Va7PCb4
	mwtUkHAhX6J4uPHPk/EpulHzaLXSz5iXw1rCRoSuPih3e8SaM98CmEbjkDUabltqstAzJTiW4t0
	cXdp04z0bRMjKiQ42sDi2ZW3aGU
X-Received: by 2002:a67:e703:0:b0:785:3211:f5e4 with SMTP id ada2fe7eead31-795a707296cmr539109137.4.1789164634294;
        Fri, 11 Sep 2026 15:10:34 -0700 (PDT)
Received: from localhost ([200.151.1.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7927cbdf149sm3926638137.4.2026.09.11.15.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:10:33 -0700 (PDT)
From: Davi Chaves Azevedo <davichazbh@gmail.com>
To: yu.c.chen@intel.com
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	chen.yu@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cache: Refresh LLC capacity across CPU hotplug
Date: Fri, 11 Sep 2026 19:10:14 -0300
Message-ID: <20260911221014.1384294-1-davichazbh@gmail.com>
In-Reply-To: <a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com>
References: <20260911134825.420748-1-davichazbh@gmail.com> <a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chenyu,

Agreed. I've restored the original boot-time shared_cpu_map explanation
and kept the CPU-offline and cpuset-partition rationale alongside it.

Thanks for the review and for testing the fix on both the Ryzen 8945HX
and Xeon systems. I've included your Reviewed-by tag and noted those
results in v2. There are no functional changes from v1.

Thanks,
Davi
