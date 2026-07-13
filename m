Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E4741CB47
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948047; cv=pass; b=JR7MGmq4a3xMvT7fTiAzmaM+gjiHq3QVw/kHkU+SFENNWE4w4aUZ3+v6Vo0tBVPa5tK+C+ftfQfQOiV8DNoHqpWSRf0uRYrsQhVtxa9PAW9Lm7zdCuSwjYNZOrz+HmcmOuZELNEaCBeLxj0vquHoRDgHfy2lcl6O7n04euUwRuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948047; c=relaxed/simple;
	bh=Uj6Bq4yqRSdDVWgocVXkGYuTG/yfXUB29fBsrpNa/UA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T10J21HpKXg0TEmUAcQYXsSIu2TJeenOT8KihHcEDHDLrI1xbm0jI/BD1JPAR5rik6vUy3A2ulHUea9wsDwvSkaXUXHUU2ziOvu6+tTJh7gyZMoQu9qRrikJHmNGkM/vUUjIWo/aTaICgYjhHEKe+aKH+YBtHkm+T6K1+Y4eV+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCZAF+5S; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCZAF+5S"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1793065a12.2
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 06:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783948045; cv=none;
        d=google.com; s=arc-20260327;
        b=Mf1GTeJ4a3/lyQLDyiLsMT5jzEyLDnMR5bybNbRderruyDvyZgTEkv/vg1lFSWVpMN
         Gaq8j0y7Nu86DPmnLUG08KmeKRxGtU3MVnO2QrfDrP/gfwg4yR8ngannYShEi+axcpzY
         PWcpDO7fogq8Rrv2cNnj+c4c3MefGq+kXXHgUD0e2qNN0xIwtUo0BGGTszoO9D7JBjME
         Y0xxo9GEWsRHcyZvKxWCbQbOqiDA9jbzhpFyIh7Iigl9jE0V4Ju7QQd8jxmLgD5MWDhT
         Oiue9vSWHpCQpDxSlUz91A9igb7PUjt8SyqQ/jWnECtbUbUL+9dzxbH1E6WNvVDtI2D3
         f6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Fqx/czp6jQUNV38u5qUVP1ElD+PeQ9iFnGsUGSfqqU=;
        fh=pXb2imKlCwwmj9X5hcx+Y2gp4YFZMsd8m9yKDAZ5ebs=;
        b=s0QXfpND3/zllMZNTMx6sG8Y3g2QNAJk5pZkSV8Xv96UwSILf+Dhlrnx3xgIecZgCE
         au3ZPMnLLQdBZKxLCw7ft6b/0NeG+dxd3IwJFJ0HoYcpi9IrepWUVJKw8yygJJBvRDxj
         uHPVCM0Nh3fx1cayYy+mh8rGBn8ibLM4GgQFffFklqD/f6zQ91COW88/bU0Ed/XoGWDm
         72uSfcbvQFKW7sBJP1icfZCgUJyfUQHlkEnWzkTaRufxi/ccwMkH3G7SGNGhNqAx8fml
         luUWfhNus2au82DTmqKkqR3PBgbaeMXkHM3mcczIj4rHzh2qefT0ADLAk1E8xY8rKi2j
         bxsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783948045; x=1784552845; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Fqx/czp6jQUNV38u5qUVP1ElD+PeQ9iFnGsUGSfqqU=;
        b=PCZAF+5SyXe96hdcrc2AiKnlP0sWeJatMgdNoXHme/+ZUp9Cg4xY4qCa7ydR+6xcbG
         6Bp9f1hC1VdtG5ltdJWRXLsIoe37pOwqIfKBTdJgfj1mKGNfJLeasyUwgN8NC3OFBRYa
         Dzfc+FOHQ5VZRMX6ieUdrjVwXaGeOtIrBxtWzuMKRqWQTJLkre2NCvvMBINoMuNiu/ih
         q9JHiJ98uF/d3djQMeY0owBSitIQqLwjy+/oG2eqcHa+HzCjPwtsaEEIaE4mAaZzSCUw
         5bij5sQNp/pJHoKiT3lAWmqglXuygR/r7AFgl6dz/Ct1kwTndqb/8GFVZnbDnW62YN43
         oDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948045; x=1784552845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Fqx/czp6jQUNV38u5qUVP1ElD+PeQ9iFnGsUGSfqqU=;
        b=IrY/lIPYovU1OlH/hta5oUS3DZlYRmD0Hupe99wdXbOJzOGCeqCRZARj0MX8fumThF
         AuSQUmccSJYw2y0oF1vYuBi9cOkVIxSU7QzoVBoMerIsYBBBjwznx92NIsJRmq2hAmPC
         ZuzHuH2hh4bzX+cgKsAeXPwp6wZW+elbrZ/bmuVLryXa9HuTozmxH25A+QsyaxDNLL2P
         0GugQ71QVOhBHO4FO2p85yy1+xTeo723aRkDolF1t7xpiV+JKqv0UdEswyNl7CRTHoeA
         xRUq8YoWr7IuHBKeX7Rg2512wjz0z8eBRdFvElj3yHbRxGc7S/PaQwjAPdDdKIV7fp3A
         OlHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6xuUqEZgS1UyMEr6NgQ7y5Hi4b7+chHBLD1Rq1WE0MBnPYmIzC90RFvUfScIKXafospYEpqjsaci4KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb83hZbD5FWRcnLWxIkaNCYdy9kGNi1rD4LK4yU6ONI+feskQy
	ld4hqX5OHE8E0VoRu/BKU22p3ACGDd4UreKiWBAgCwFurPaROyn4UoHgbzFGoB8rC+cRtvRmlta
	DQQSty1sf5kbu6s14SMaMaAa/pCAPD4A=
X-Gm-Gg: AfdE7clOiShy0kuNXWcSEH3Kl4+xNE4Bp/5VJooIrHG3EN9U4vTLapucGEVMAUFSuVK
	uLVu23lSHbEKKIM0nRLzH023SwoXYLAi77z5tcOxR3ADV/M1nzFOBIaK0G9YAEKRxy8G/9yk2WO
	Df4V3DZqeKJUA2et54AaYj6TSqzrvEJBkczNRGM953H3ii5o7fLAKpVyLFvevmXifzdoVBG1Iqm
	OlVz6rQoSX60zKT22jIEB+FfYoHBiBXtogYVKhoHJyNU4N64yeO8y7IbfkuZ67STzYRRU9ifRtJ
	7EIdYIQq8fLpCP/Yqrl4w94eWuFtWHzA/eQ8fEe7nBNtcKlEZNPMG9l0ugxc3A==
X-Received: by 2002:a05:6a21:32a2:b0:3bf:6237:4d4a with SMTP id
 adf61e73a8af0-3c1108c0ad0mr10164721637.24.1783948044948; Mon, 13 Jul 2026
 06:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713073059.47914-1-phucduc.bui@gmail.com> <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
In-Reply-To: <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 20:07:13 +0700
X-Gm-Features: AVVi8CfkJmByub5tQXV2QE6hKgT1oI4wRsJZFzUYZ3a0E1lOIwNn_pP9BYAZsT8
Message-ID: <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging registers
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the feedback.

>
> No, any access to the hardware is buggy - the whole point of cache only
> mode is that we can't access the hardware.  The paging register is part
> of the context that needs to be rewritten when resyncing the cache.

To provide some context: I based this patch on your previous commit here:

https://patchew.org/linux/20231026-regmap-fix-selector-sync-v1-1-633ded82770d@kernel.org/

Reading that commit, I mistakenly understood that we must enforce
the hardware writes here at all costs. However, based on your explanation,
I see that I misunderstood the architectural intent.

Just to clarify for my understanding: does this mean regcache_sync()
is strictly
expected to be called only after cache_only has been set to false?

If so, I will drop this patch.

Best regards,
Phuc
