Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A5F34CFDC
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 00:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312800; cv=none; b=vGEbZC8L4MefaFxuqaeS3ihItTCVtNob/vPBvm2RIEkOK7us5KvOm2dfTeuntgQ7TdGJ0AauU9aJgHQIN2vJOv57MGr3TM9LKB2wWbdbcnKzYtdxAYQnJzMZ4bInuur98+cO85iXUoolzoZRVaQBXPOsr4nPmUnjKUdbScA9giA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312800; c=relaxed/simple;
	bh=k7sHMW4gg0o0qIJMt9ltjJ4WtnO4WFu/L7mwYOnZn+s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sRCSwD3FNHh1O6T79p4Fx248x657chAje75fpLWgiAB/33De56unQExIRgxYm9RHkQKNLCDYohB2ghaIviXGCcrAtRL70GN8zflZZ8zskKF4vZh92NJ3ga3cpii4htTfDk6L92P9Ze6Pv4Z36SjW11++it5nXsJtfQMtgebEEC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ/uSZ4a; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ/uSZ4a"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3166509eec.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774312798; x=1774917598; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pn7J7KNNIQST5/lUfvga5BnMqTjXD5cWPJOt1fdVH4=;
        b=HJ/uSZ4aeFijq4mw6U5Q6sQQr/pIfESqpb9xJ1ABnjjIPFl98+5m72ZAXcsMY743IZ
         Qkxaax1l89//2fJ/7nOJo+/AAKPi90NPfEZs/eiDbp/a6Oz32nGtrPy+HigQoj+Bid8+
         vMG0SQxdEpeqOVuBanG60CECB8Qjvb5fd60FC4gp7mwRCBRx9X1No+5lBFQPgnUdQhBt
         nOQJSoUIKwq40QirIELDu6RzMg3bpRzCT51SxDbFE8Nw4t7NhCzddtwVPvgzT3yy569c
         lZ3hPSTKbGXYOAh5/FgPIRuyk944cH7mFcNa964L77tvC6uzBLj5YqMgFFjxamze2oo5
         DBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774312798; x=1774917598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pn7J7KNNIQST5/lUfvga5BnMqTjXD5cWPJOt1fdVH4=;
        b=QpEu0TWp6NhS2vZyllzh8daLpmpWeADCSnkml7Q8XaDjEJPi4RIcA62F/bUYfdjqJ3
         I2WkVnX5OdGOS52ECNmQNaeIzq9SRS13HbnpsC7QKO4EOY76MZwZIpcjzFjuMOgoaXS8
         pUQ3O4J6VlvOzyFFjMJfvN11lSv0bjkgL649x9MeB60NNcWEMFrSeA7JJuKhWdQXzxu5
         GO9afHH4N68x20wT4c8J0eRKL07cqKbqD1PeC1IbFUEx3+OR7eKUzQvF5Gd4pDoWNKKn
         m87mirrrpG6WFdyLqbY7A/Zt6FQ9AmC1mcetWVSvV12Bfsnrcd3+TW08urZalOXMYZVS
         Ebiw==
X-Forwarded-Encrypted: i=1; AJvYcCWG9fNsjfsFig/MVoCvUtlP6qD+Yrg4KWPWks/FfHMX7iPkifPLB54tsiKhz0tCVdC5/A+lcz/95QfoXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YybZ6a8StNo4LasJzKIF37dfh31be344D4PJzDSTGtEcNd/3cOf
	NLwJCT52sKYzRZIar8RSmo89QwZrpyCpWxbqrxRvw+rDMuuDwI5gp79H
X-Gm-Gg: ATEYQzxQ/KyW5o+Zdbp9fP0Marlc3JUi3BYNIXhwMJQ7QJAyzMWH53GzQsp4w9mQeiL
	gv7IKiA3VOjRfZ7XVb6AVah0rQYEF5cQU4nhpRvwrYAmdv247aa2Wx+0IZQrF7VMT45xgmkMURU
	bgUlympgqChNC8C3Q/nTmSZKoSm15suCsAzBg55aa3eHF2jqQiSwcJPhlhyelBr5yfLreuzZzTt
	oP8b7nVbIBWktEUA9LKLc0avch1OQ2KjV5LBX6YJZhib4Fxlttzc9dnIG17/D1rE16AMF+V9UHl
	LLhAxckZ2JPm4ljQDASSz+28Yv3EoN8mE8wEomKxP7qQr5IPNt1EDbjsybq4AAHafM8P1vW9PEN
	QWR6HWw+MjZeMDpAfwJ9bi2+qEomfyo7kPPpg7Yy/fcXa3XFCyCJnOc48AeWSmWgqrwAD78/NKr
	j231VAobHMGjsCs7OnaRUj5kUk1WMOPOdZxtyyQ7siIY0rqxnU1skzOUjgDza1EOdZk9HVROmA8
	bWhlVzYR6gRS2s=
X-Received: by 2002:a05:7300:a2cd:b0:2c1:27c:75c3 with SMTP id 5a478bee46e88-2c10961a7e5mr6039314eec.10.1774312797948;
        Mon, 23 Mar 2026 17:39:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b90dsm17543148eec.10.2026.03.23.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:39:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] Fix handling of GPIO keys and LEDs on geode
Date: Mon, 23 Mar 2026 17:39:36 -0700
Message-Id: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEjdwWkC/x2MQQqAIBAAvxJ7bkELI/pKdAhdbS8pa0Qh/j3pO
 AMzBTIJU4alKyB0c+Z4NtB9B/bYz0DIrjEMapjUqA0miYnkejEkjuj5QaPNPFnvrTMOWpeEmv6
 f61brBxS7d/pjAAAA
X-Change-ID: 20260315-property-gpio-fix-51586cffcd5d
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Hans de Goede <hansg@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 driver-core@lists.linux.dev, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826

This series deal with breakage on geode caused by a recent conversion of
the board to use static device properties for configuring GPIO-connected
keys and LEDs. The issue was that PROPERTY_ENTRY_GPIO() would create a
temporary structure on stack for GPIO properties which would later be
discarded.

The first change patches the behavior using existing in kernel APIs so
that the bug can easily be fixed in stable kernels, and the other 3
improve the API and add safety checks.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      x86/geode: fix on-stack property data usage
      software node: allow passing reference args to PROPERTY_ENTRY_REF
      software node: verify that property data is not on stack
      x86/geode: use PROPERTY_ENTRY_REF for GPIO properties

 arch/x86/platform/geode/geode-common.c | 24 ++++++++++++++++++------
 drivers/base/swnode.c                  |  9 +++++++++
 include/linux/property.h               |  9 ++++++++-
 3 files changed, 35 insertions(+), 7 deletions(-)
---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260315-property-gpio-fix-51586cffcd5d

Thanks.

-- 
Dmitry

