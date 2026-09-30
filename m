Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75DA3115BD
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759437; cv=none; b=sihHBX69yj65Q0fb+R1A+euVsQ9RgQsscTd6/EwVh41IEM037wRFDWEBkKq1JJwPh2B19gccmR6G0wSceBU+TkMHPbOdNiT1p97cgPYBuJMPVF+xhqI/gfv6GrLCK0S7xCJr+TUQiDsZgORZ0Xft+UAIA1vMTI6pdJRTyvwf1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759437; c=relaxed/simple;
	bh=y1dRcM1u4ia4jyoRkwNbhGlt1395IprSJeY5SdwYuVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+UOeexrTYJAl4eZFCWCAkCYsPUJCnphdTeF8HpgtxeQzmllSF7BxBKB+DsEEhXz50vAziG8Qhzjv8SWLCzuvGxg+dEsPkhETxes0X1AnBXaHDbSusGox+VlZGXyqXakO81ZLYlA6JuC7hRlamkb2y0W3+YK54l0XLXD2edPkbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lm49Ypzt; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm49Ypzt"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b042e00f7so23186f8f.0
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759435; x=1791364235; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y1dRcM1u4ia4jyoRkwNbhGlt1395IprSJeY5SdwYuVk=;
        b=Lm49YpztZJfTMMZNF7cSLp5O1QwEYVuTGrz75/JsTRAMoQ8Prr6VvQtM/1j2LLhXst
         PZdXD8gHWJPWE6+tqgy7mITsDavfNlWD+2jKURZKPPRaRQYm+mnczg9FsGRN8Ac+B444
         LB+y0R6zQPyTg9HKKwQMJaITJp5HmynmTKU/DmrhitTiFNSZpL7nxpVWjibJAp8i+Wdd
         IN+bb0MG7i2ubmGr/PKzjZooWNVTEtXosr4JQZKjl/77Qrr3l11Xi0Fg1bQJTTGvaWIO
         xef3wQddvARyP87tl8MOneXcb2FsDcrPIpEdsxg9k722IKAsYpv6ljTIaEr6E/F2whuI
         Fi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759435; x=1791364235;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1dRcM1u4ia4jyoRkwNbhGlt1395IprSJeY5SdwYuVk=;
        b=mAEYvfxlP8lEtrrjwRuCypmf4jfJ5iCyPVm8p5LizYpGVDqZzXpheN+DCXAtXhzy3s
         cp2/rngeom3HTPWcQtkIOlWMJbWVvtSDjzTuvr4dhOYBcvihBuzMx9gHqR9F1mO9wbIL
         T/V1Wu4MDlQAoCXZ0v7toJhHfy6lEwZQ2nWOHBs8TWsTOaic/PAFYCcSSaRxStuN1WVu
         rkbMTZHosJcG1+HHWe99lDww5LIxjJ4trOLsy6fFDUaszmYN2APsQfS5BM/FSeDVvVSq
         +By5ZFtuWTwtgO+9dfpqmzKxHMzj3zn6PeB+tCUTygv2Fn3EWCXTkqKp+H7RcJiokN0i
         h2Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwBHyeUogbGdH7ACeaMtw840kR7o/PYfRMQ/BuVvMH+k3rPe0hYxBtKWNBMz0jWNSSer0BrMZ1ZE/7Qfg==@lists.linux.dev
X-Gm-Message-State: AFuF++m1faa7/FMChWfuAtZmlvlKxShjxcyYz3o7M6irFq4QljIA5cDF
	JpnVkrAZGIUzvANRZ+CWDF9rrMl2PeIKni280qJI8bkyH6TLKMTuXEFB
X-Gm-Gg: AYBFou1I5HL5cF3MmahXGWoXtWmN5h+bWIgXs7iYblCraAWd3rwuStZj9JeXivfSPs1
	5+tRfhzNhG77+st3Ok3vjSOwPkbpMJrinjVrB1NRdOtL7UToMuWHlL/4LYh7Dxy2dFMw5EGBCNi
	n1trlN49Bu/uamiXuyORKYcyu/qfwbNqW5UxkinXah4uvOXju1dSUPm01mW63JeeRR3hiFkLm/6
	ZezxPKKTLsE/eVHHcqEC3ZT5yFYVrxuEDVBTgXIn54fvyViRY9ZCAvGB3S4sOTjM2rjDh5MzJTo
	r4LEQ0r0YA62shV/TaglFmGainqJNSFMeBqvv7mvRHjn88Ati7SPBPfE2ABEt/adT6RYCOT4VRi
	dd56+E505jKSOsGLTW6SgAXtIuFilYytiMYYgSficPfBiZGGANqEDIdklH3aqBDoCoPLntyaU5O
	PyoOqOarv91jYcnU0CMcZYvhfAUrJhJPiaoKx9fbNUtSg/BhXWt9sCI0c9bCIoiF1o4iNVsjDV3
	TLB6aOKgGXc7WDR247h
X-Received: by 2002:a05:600c:840d:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a01b128472mr12394495e9.32.1790759434607;
        Wed, 30 Sep 2026 02:10:34 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0175161c2sm45458125e9.4.2026.09.30.02.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:10:33 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 0/2] sched/cpufreq: fix schedutil's boost frequency handling
Date: Wed, 30 Sep 2026 11:10:24 +0200
Message-ID: <179069242536.2121.14601372514436460845@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a Lenovo Yoga Slim 7x Gen 11 (Glymur): boost off 4032000,
boost on 4723200, back to 4032000 when boost is disabled again.

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11
