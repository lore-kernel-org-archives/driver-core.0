Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED683B8948
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981516; cv=none; b=oHhhEK8bsWh0cbvPxOyVGo8S4/noBdCaDRrpoIsoixeRHNkGvyG4JMQnp2xHce70E7jLh5ztzLlMO9tzVt9x/S8Yt5A1OoWz4SUrrxT3bhRYMdJVLHeGFquy7Q8G9M+raT+vL6pwkkLWYaFRNNXoPVlyj9J+OKJYeC8gLV4yjI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981516; c=relaxed/simple;
	bh=ZBF06lf9l3jjaPsie+l2gDKg30y0nMjdFIJaDuIFA3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjdDb4ndvFbDI05iSEr7opetpEgLFTOr4Jj8MgaJwXUi6Fxl/bVGXNoE9A529T+qEGtWTRQYQ/1T4sZyY3Q/LCj7zj8w65CHxbsLsJtM3z2ZJLfxusHpDLBwbFDCazWQqvWthgVPBf6QZTJ8v589DzeKotnxWWxfuCk98KQivbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtf/qACy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtf/qACy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso59486335e9.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981512; x=1789586312; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=mtf/qACyESSZ3qzSBcfsq3QskSWNn+w5FfrjZzUba9vjTGZpWCUGX3NMmOBWB5dAOC
         jDarD9DOb4c7BGB+3V5IDfzDcr5ij7p2cbZDvbS9wVViWRHzcW++a74VdTnGPhjvVLRs
         jEBXHT3Ohk4GLNK0kcG9lesCWDj3uGWK1KxvSCxxA5x1uqjOw+QG7K98cBid6Xut0k2U
         pjeHFw7Swv6XeUkH5Wpf5rFGrz7aHABPntBRdSaUGExTsJ64MLLAd93mO0t3Fhh/80oS
         5FV+qSTUu1HEYtIOpB9eWkx9NW10NClEIrhfur5qT+GTtn0IF4lGc9qoSC2z5+oe+GW5
         2Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981512; x=1789586312;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQp1h+Nea1dCnGwxCQ5G9ZglVlG59gCPu/u14By/urM=;
        b=XJIORJpGOPO5KOefp0WQwmge+DBuYZnGRpylA1MpzJfpkQOMwfFXkFlSN0xTXBizx7
         VtBKNez5oQW+mP4AQLrfqhP6jBfsPbtqGzblKSRNx7tJZ5wtGU3jTQ9RwEKB4WtUuvcX
         ukUzsQ5WF2WbdCiBjBPAlw/pja/QWNI5e8raM88QMAa8q+Q+io4JX+PF/jpoJLErv+tQ
         nPjaxspPqMnEmC2N1LYLsWQzq8wCUqnGq+MJO2AwNtXPVOE1a2RuvSFzUBVheGhgGxhU
         3JBx5qGntQnxEarEyCqSrtTgd0Uy9jhe3Li17n3MHJ2PiC4UY2pEqOKXI+fRPmWvrg9m
         WyTw==
X-Forwarded-Encrypted: i=1; AKwUvBwUEffHZ9OQZ6bTK3J328SSfva6aB768KjFYKhrbNZKx4rALq/XfQOyH/LIvcxXx2ZOXo1HlUufg/wGmw==@lists.linux.dev
X-Gm-Message-State: AFuF++n2A5CKrjg49rsaoEPvqLXF0I/me0KQlQCgblI3yco/hSjfYsTv
	sEMdQ8hojUfeYcgNZxaIJVg2shNVQhx2duiqis7YEcRWQ/X1NlRiR3OF
X-Gm-Gg: AYBFou2sYpDC9OcoYQx1rZpcxKUlCEcBpi3SM9/h9iWohSfEGN29TQTD1MPqpsoeXyS
	dyRfFGKptQGz6Tywj2spNAb9zyItfGloj35mToCOLgWyCGkPrsq6B3aKd7bBTu8xNufU3+CGOHW
	diiXd/YM6FeXNXxY6a8wUIt+1Ye07hg5B3QA/AF5UYB1HhH2nM4m3OzkzjfdhTG5QaJtfn06zea
	TfKaMJ2HqIsFgNafUJFZrlrnKN/6iRvW7rW+pDeuB7pGhNgzTu03wwOfQ6WvWiA08Vwe4W1r0Yy
	GVSCs4E+JKcAFwFLbAhbMmE0ye70mrIPDLtFZFLhGExn2byzCCvo5pE18RrqUw79nHya0f9Pk4R
	24dVkN/rWsP7+iCbXwXVbwW5W5Bpo5Pg6Nra9zX+hemGHo1viTel83+n6lTMzGkwyDILy/z1Wxc
	8xz9lBEn/mg5MONxtWPL0DHu22+7mHC6rYt/zs+loetwpHIuVpe2Al/s+FoAyO04XWwmBGb6eiD
	HpufOCAtwPCTNDoqqZcAGQ7004zNGwyiheEcQaGzfM=
X-Received: by 2002:a05:600c:628c:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49d17a8745bmr144560705e9.12.1788981511672;
        Wed, 09 Sep 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm164538455e9.4.2026.09.09.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:18:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:18:16 +0200
Message-ID: <178898149654.33757.7826789084252321894@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909113625.000063be@oss.qualcomm.com>
References: <20260909113625.000063be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Good point - that reads much better than reusing scale as scratch.  Taken
for v2:

	scale = arch_scale_freq_capacity(cpu);
	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

Same semantics, and it makes it obvious that both the multiply and the
shift stay in 64 bits and only the final value is narrowed - which is the
whole point of the fix.

Agreed on leaving arch_scale_freq_capacity() out of the expression too.
This file is arm64 only, so unsigned long is 64 bits and it would be safe
here, but it stops being self-evident to the reader and the cast that
would make it evident is worse than keeping the temporary.

Thanks for the review.
