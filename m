Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDEC3F4830
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439278; cv=none; b=YEzxygIQ/L3oH81tFLdOxn0eWUGbyeP3siNxayhAnV6dhN9BIgB7RNtnXkSzbb1LpImwjeQdTUvaGHIufGABBZwdc06m2iKmB07S4jrLAljEljCNGaTVhd8ChWyRG63CUnCQ959Ac8MvcYhPB71twWG9IPZ1sJiM5PEpGUktluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439278; c=relaxed/simple;
	bh=319TtROIp4k6HKXuhKK4mVyHm/0kJT6EedfSsyEPGV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxKAq9pJVO71S1q//h5eqYGSEbyhqwtdgrutkWAF2EM0H25gU7qfu2SDwy4Ld5jq5NhcRFRPiDaifdAytFcNl3EXWsAhNvdipnEquAyZNswv09ViEBcXFufHyxJuf7+7J+8EJwWxwomXgoAc7PXDDPgOYZ4k974gcgEO5lhlCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gt8WHs0B; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gt8WHs0B"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2569aa5116so155286766b.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788439274; x=1789044074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OdGwx32ezn89YbAvB2ilQpl2ZjEbuFoBay+4NhbUp8=;
        b=gt8WHs0B1OJwzVbErcF7NZvcu9mM7x4wsQmt45gO8+pxI83U5eTlp+e/hvucU2YmNv
         XKOz3d4LwTR+DuBog6FmhiTqPi4G6F5nv4039uzK4XtTJdp1R2MaNy4ANjbbEIrgy1Qa
         GXn4iY16m3OmgRNWvOTLaByY3Pd4ZO4/WZlAJ516gVJ6LVOdqa0QQmmZzGDOeAltYXo9
         qSZnE6YnDBLyApmSi1GXCHntNtFs7MZYEjZXFZtuiZ0ibhUcD/djgKRlqbG9x+8xUo6o
         AQ/HDsfO7Hf82qbNP+aBp5qfiCkYiQEfIx8/l+DUiT8o4LmiFpoeeQ26TrTMDRhr3bEl
         bAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439274; x=1789044074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/OdGwx32ezn89YbAvB2ilQpl2ZjEbuFoBay+4NhbUp8=;
        b=nawMrPZiR8D0aXqKYRIzuoWPAXyWTucmQPKQU/EcsjyyNTas2VRMv7ICn9XVGyN7Ge
         6P5CKKND8NzTrgi9VayJ55eXxSEVjYC5gpAnxa8Har3cuEqm0JTO9mOJV0k7zR3zWf3q
         QvgqD6mxMXWV5D9x6ZyTWa2Pjxlt/vk914jQuDCZsoUkC8KxqETeqyOXFU0GQKlN1QiV
         umAQ7onbzM48qd63x/0Yc0f4+hiLXiPofMmXPmGi6OZv9UtIXdVG18CGrvYGYh0XJk1e
         SysgWERZywW/JKg200JYoEpNPqOza68vxWwQ8zdMS3PdetFzBX0eDoH4vFFg/qGVyWfT
         NJOA==
X-Forwarded-Encrypted: i=1; AKwUvBxYNlKhEHAagVAHAovgwMwzanppu7zbIvxHubp4wkKyFQe80qgh5/uA3zgqBv8SShZoKph6vnuTW3iZ3g==@lists.linux.dev
X-Gm-Message-State: AFuF++k3HWuffKfmWTTPjWEYimtS2h0Zye+F0Ds5TYZgEFvaFcB0xyQX
	rtgdphdiiDovTmp0A7PG0164CU2+86nv/oYf8nP0AihtyZbsTGKLqbg4LqvgSTX2E7rzNScD
X-Gm-Gg: AYBFou15BqwJ1xwa2vWWIckE+GqUwToInvZGwRBp/8ZKZcg0leZc8q4kiYfzjqCe1Cx
	TDdZGsTfb5wnTh/dWJrm7ElC90jU7oEI8cX0NEGMkmWRBjoWC/oUEdYCm0u8vpSCedc1w5cZqWJ
	OXSZcVISmZQvzS3retMqqpUfX0b0aZP0gK7I/o4fy5xLW9gxCmvCXKpi/foXeFou4A0rWpa4Hgt
	MjQoAmajcVxTWQdI+Y1nP96sv4UrA01N0p9uk4OuvTfwH4IPxhLumwdgM0pBUIQIfL8FKob2HIo
	U2YFCXN2d8hrCE8HUIP9zIr9NJYJqEZRlskA6/yyaw9JBQr9d/VZMs5nSmxAsAB0Qk/48zUZ9/n
	0xgpBnbgqvvU2TNSbNqgiQeGJzh96V9y0A4IqLn3VyxyrM1SCWfKQvXBGOcdda15RYIqfV0SBjH
	8vgdxG1W7Vpf/hYdItFT+oCMkZs1tPCNp8GFeR2pAsranSpak0AG5tXkxs+liZ2iMbe105NRlh8
	Bgff6n1eXtJ+uG775cCnk5Cln1zFw+9J3mwGKM5wkUenQF3ZuEkPNqnDldq
X-Received: by 2002:a17:907:970f:b0:c25:32b0:e56d with SMTP id a640c23a62f3a-c25efe0425emr292477266b.7.1788439274267;
        Thu, 03 Sep 2026 05:41:14 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3a396b1sm93223066b.0.2026.09.03.05.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:41:13 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Yohei Kojima <yk@y-koj.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: warn if file creation failed due to uninitialized debugfs
Date: Thu,  3 Sep 2026 17:41:11 +0500
Message-ID: <20260903124111.87353-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ai0m0atzc0cXT0yQ@desktop.y-koj.net>
References: <ai0m0atzc0cXT0yQ@desktop.y-koj.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Jun 13, 2026 at 06:45:53PM +0900, Yohei Kojima wrote:
> > While I understand your frustration when adding new code to the kernel
> > that would trigger this, does it actually fail on a normal boot today?
>
> No. As far as I tested, no existing code faied there.

It does, with CONFIG_REF_TRACKER=y and CONFIG_DEBUG_FS=y.  Since this
commit every boot here prints:

  debugfs: Unable to create file 'net_refcnt@(____ptrval____)',
    debugfs is not initialized yet
  debugfs: Unable to create file 'net_notrefcnt@(____ptrval____)',
    debugfs is not initialized yet

This is not a race.  net_ns_init() is called directly from start_kernel(),
before any initcall runs, and debugfs_init() is a core_initcall, so
init_net's two ref_tracker directories always miss.  Nothing is actually
lost - net/core/net_namespace.c re-registers them from a late_initcall(),
and both files are present under /sys/kernel/debug/ref_tracker/ once the
system is up - but the error is printed before that happens.

I bisected it to this commit and sent a fix that keeps the warning for the
case you were after:

  https://lore.kernel.org/all/20260903115135.63210-1-mikhail.v.gavrilov@gmail.com/

-- 
Thanks,
Mikhail
