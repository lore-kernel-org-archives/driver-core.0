Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D2F343D8A
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951355; cv=pass; b=nnBb+l0L8F1p+AZMuIpA0/2AxVrsjEpS6yrjtmSKgqZSqCTbBAcGmPJVCIG5Q+8Ty0dPsYfZmVwu/ACH2hcJchCRuwPSmDlCr3irKvmpt+kear2hxLMneI1hEw7qDgP2qe3DdG07Lyc49ZaNLVrDVyOaaI5Dak1ch+13OQ6v97A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951355; c=relaxed/simple;
	bh=O8MQHkIkl8Q5/Ng+ZEc3FWOG0qM8tf/+bTkS4UZRvZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIwTIK/e3tUVpxuhDAUN+qSU5NcFnj/XsSHtTs32nqZaOM86vmpG5Ro1I8chq1X5s+8CoKePTv0jX3+aRGQFZCDEJq9PRKTjmaF4tjhzgX6s+axpaTQ/pHiR3TgmL28vTvhbXcQU7CAk1TwZ3bFhiwxS5q55V8dzaWsC2FUiCAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSkhitSd; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSkhitSd"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c855599a77aso733485a12.0
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 23:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779951353; cv=none;
        d=google.com; s=arc-20240605;
        b=WMy6TNdBmiTFR2lKWBVK1GlHOKVaSj1mkxejNgq7p8T+fopg7S3IV1tjqTvBmBLejT
         Up8N++K14Rpv/G/t96W5bhz2Q8oUHG6POmYe2WVP6RLdN/bpI0MinwmPB27npju956dj
         xyi6OuQg2SHVk95GftHjF5n6vM693U+7QGc7VoIvIDIB0g7ocKE1SVIf+b/UL/YtuT63
         FZfdltP0cLf85SV1b6m46I9sZeEHfMzKHBtIDspIHg4PxM4FnnoSE2qwxmFOOlofMdUf
         HpVDQANOitXZUpU2LUAzzlLFTLNOAlVLgmmBd5hbfseouj7+bHUr7Ndfns3tL+kIdbSe
         UVlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W6/3mvnQEmAbU8GWvsgukb4jqkElMDK5rAPPCjcQiVs=;
        fh=vzV8MRKSPHYyjNIOc/fNNhkK4HYMBuJhpuBvECvc48M=;
        b=Yna+bjuOJIpK+cGmUpDOCAHoMWDtcYSfUseTOVqSyIAG1JSnJOPPFqzNViFd3YHeMm
         477XfNkDPXg6PnK/9gtiPlufkAmRycoO8yHZCkDHjBLyr42d4J6gaub7LoRJcEyxTiEX
         1cuM9lwzVxD1JRP8XSEYsDNw2QG7+ylBmDpmP65q9Y/u1sVnm32NUZb27PdQP03cI/bl
         8nm24dXvNgkY5ImADnFgFfK54ydDyABZgY++1fO52Drha5iOl+z+fJEvsJgUwngvsEe9
         YJefxc7df1SfO6ej4e1+27khmE+BZx4ZCS8Vb30Ikv9mDFMeC+9CHLADpRRFQCUzh4wK
         dHng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951353; x=1780556153; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W6/3mvnQEmAbU8GWvsgukb4jqkElMDK5rAPPCjcQiVs=;
        b=bSkhitSdEp0OylE6t2xKqeBFO4TePRB4EafR48F0aDuxW9rlMa3vwaDFdUyxw9No7u
         RKAjkl20Ywr34lt1KgjCd8PVwQCHSeXn+CxcezuOPzRwn+OgKILi9k/zOi6vYuDXE0P6
         4izePhm9xKZsKZDqOB6Gb9K7JfRvUcBWHm8BRWNFI+zIhcb5EN+EBa0UksB4yc3o5a6A
         mJhKeLzX3a41Y3NrJUaiEn7wJdc2p3ImEimM/kJqg8CWKmu4tXwWBlOzHq05CP1n02ul
         aIBAcqIaF5N1zV97ToEzIrWfmTm9adG7K9/BoLsrIxhvjtmNBWzI5oE44y0K4MFTH/Ai
         BtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951353; x=1780556153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6/3mvnQEmAbU8GWvsgukb4jqkElMDK5rAPPCjcQiVs=;
        b=ZoKnTvreI0XfhMHZmTQ+3P5Umt659Fh2v/fYUvP5VyWe00/e0brRNAqT48WjpaHJ7d
         rvRVFzixu0eH4yv9Of2OjnAvHq8RCkMiS0c5tJ2yl5LbZ3Za5jG62lMalqzrBYdekMAa
         aVX6EqOn9r4h99J11GuJsZpPJrOP3nagc7vwzLSYMAeiOA4h42y8X4bnKt5OFpWpm4c8
         HvJnzyd4fsP0ZR4lMgaCMjh742LKenixx+PIyBFySjzwg6dJiL9u8shS+IahvpqegCvY
         Doz0wwfZeyxvBNNR+Wc1GtKnYdY2u5HUVQ2+TCRWDsL1pF7EqD83diSkLIXXyEFE/K/3
         CaVA==
X-Forwarded-Encrypted: i=1; AFNElJ9MnbX4olXSR0/5Pb3Vtdq5x7PrJywB3LrOnkwGSvwM23YFhAPsvyW9N8oKZi4tdndzNHaduGvsbG9uqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNWttwMpWyYhvgU2ZsWLn1l2o/n/ff0E+oAMHjWO/K3SK3MFNv
	4+g6eOMaO7vJaP9y73KX6CKcxDdbjv6bFZsRrFbtLOBMF43IdvbXfO6FKC0vhkYuf6wPzcvGyPE
	9xr/u95jJmcknQ3A+Wd1BCWnNG/zSBX4=
X-Gm-Gg: Acq92OFNauhWGbsxu5ZWGmMIOVdotIllkKPke5qqbJW6O7yRkPqXWnI7C5SOe3QhD0L
	Mex+dywxznT2BxkqK/gN7nbXJReaLybhMhh8sHM/WZk9pniqOJblzdTlz+ry36gePXKeQf8Mtf9
	zxjiXTsbw7LStRPJzpKExjFy2gvYDztZeUCvRZJKcxhq2+H8OOdb6oFFPcdu2Np/aZ0pANRlS+6
	jd43Pyansyt1yeEn1j/LRMH7flmM7JQRts9J0g3+AoNt1S6owZpezqIUHH+fE3CWI7q6PE5g3s4
	P8qTfV6F+Dvi/AIHw8PZ34dSbqpubAlJpgnc8v98u9RxKbuk
X-Received: by 2002:a05:6a00:6c8e:b0:829:8942:2c93 with SMTP id
 d2e1a72fcca58-8415f583a98mr26455486b3a.9.1779951353539; Wed, 27 May 2026
 23:55:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528053204.46783-1-phucduc.bui@gmail.com> <2026052841-task-surgical-1342@gregkh>
In-Reply-To: <2026052841-task-surgical-1342@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 28 May 2026 13:55:41 +0700
X-Gm-Features: AVHnY4I2wjdko8IENdNdArC87wDUrWCNLBqZ2Rhy5Ei7xMeOH8waByuKGhpv8mU
Message-ID: <CAABR9nEYM8m88k=j3mcoCEihpDZXLtTUdQdndvfdwsr8uzrU5Q@mail.gmail.com>
Subject: Re: [PATCH] regmap: reject volatile update_bits() in cache-only mode
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thank you for the feedback.

>
> So this isn't a real bug that you have found and tested this fix
> resolves?  How was this "found"?
>
> Please submit stuff that actually is verified to resolve a real issue.
>

This issue was not triggered by a real hardware failure that I could
reproduce locally.

The investigation started from a previous cleanup patch:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

During the review, Sashiko bot pointed out that there could be unsafe
register accesses while the device is runtime-suspended, which could lead
to hangs on some platforms if access occurs before the device is resumed.
The review suggested ensuring the device is runtime-resumed first, for
example by using pm_runtime_get_sync().

Based on that feedback, I prepared this patch:
https://lore.kernel.org/all/20260522095401.72915-3-phucduc.bui@gmail.com/

I then spent some time investigating if there was a better architectural
approach, and summarized my findings in this discussion:
https://lore.kernel.org/all/CAABR9nFdvh9nfa03oxFLgD2WUj4LyHP8T77xKno9wjiQZ48h+Q@mail.gmail.com/

While reviewing how `cache_only` handling is implemented across regmap
accesses, I noticed a logical inconsistency: the volatile fast-path in
_regmap_update_bits() completely bypasses the `cache_only` check, unlike
_regmap_read() and regmap_raw_read().

I submitted this patch to close that loophole and ensure consistent behavior
across the framework. However, I completely understand your point that this
has not been verified against an actual observed failure on real hardware.

Thanks for the clarification.

Best regards,
Phuc
