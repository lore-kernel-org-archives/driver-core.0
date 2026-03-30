Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444162FE05C
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 02:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774837679; cv=none; b=MAcsXJFyGj4FI7hjg4LPbD1IG1LNFVNnNUo8RAcfgAUFivrMmR0dKv8Pwk60aL4QLrWHb/PXGreSXIXuMIeVxTrXWIWmCgXrEvwKkNly2Zwn4jXoYRZjVU8UTbZaz5nOtc01U5SIDxZkJNS6iDSB4pNrznh08sDu0P2VAjQ/aEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774837679; c=relaxed/simple;
	bh=vZyq9h3vkeF5aQxGQqlBRMFtAQOkVVXTBRKDh1HO88k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G3Ltogc5sYSUlC2ABs5wFURBnX1xLz1Ymp3WbqL7Alh8MyAyvdlhjkVzGKacKGqwVUsNpLw/5TIgHqPi4c5adrpol8m/bk+wNAGVAVyhlRVisbDQ6UGz1aKR7U1J161uYMUrd7lD4JeBbzC8VktUGHglD/j7QfsHZHRd6P1WzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3EVBkjY; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3EVBkjY"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so7886175eec.1
        for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 19:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774837676; x=1775442476; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ySc265PnZwbX1P9RXTWeU43Uza4/FiDlEOhs0dGdd68=;
        b=r3EVBkjY8N/3gtOxwH4Zk2x3rEokg5h8FGWTNRuOIGUGigaApgDmwkKvjZkgOvoQx+
         00Y+ST6onXRbAMCVKMq99vnpUczZ8naGaC1iNehwOTGjKKCvpmhEIZ1eH9JTEs1sUqia
         1A5x9o+v2O9NPtZ7Mx6yZkHhlCxKsLT4OokXjZKKh+UrYfB2KqsCD+qxHLXhk/7nnHrL
         RiU83voFunstyfSjwovvdxYNgfPJr2PexulQlSHhynUJBO7Dq+aYUVDYvxg1r6kjw2pS
         HNkqIauk/HkBarivC+LfTgBE4iVI3zIn7AlIU8c4BBAd3yewfHDmEKOTGduS9nDo5SwY
         BgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774837676; x=1775442476;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySc265PnZwbX1P9RXTWeU43Uza4/FiDlEOhs0dGdd68=;
        b=lnJ5rBlhff1HREAz9mVWlU48VD9rWAI9MV08nmp633kVfzZIYYSMuCBez086yq0ESy
         Hj/PEqOJyBsPK0DlZ/QOWLPHFzZpYdY4Ut4xpiTKM1E6TfDEnwMh6Z3Yi9sttIlMxako
         endt7JnTEgfeutEFBcYD3W/yGxqYIS9uvI0WLCSH5mgCjCHq+RYNFEHhqjKAWqYh5RMf
         lh3wphDYxv0MoPz7HsdbecCcotdACU1omEtqQEOPnu4mGCskgT5j6T+HpmikLacl3Hw/
         bl13YbHB1+e51ZCGhLPStLOXbnoXIVY57XmanTrshXu+xd+J+Z3j/c0Zors8xVcjncUX
         tT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+Sps71o2KKZwIFuqzET+v5MAuerh542dwfTvMXFuzhG+TgKVkiaf8YbjcoMTrgIVihj+/gookObql8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1p1N3DKehzE+v4e8nETJbQw05B7X5y73c+EpcRs+Ncuo79Pp/
	teVqiQVQ4fVKyaUx0fKewCOL6FKT/sXGrwPhVyY5sRGvVbAlgcu9BA8U
X-Gm-Gg: ATEYQzw7mQw70NRdS37PLMqmweqsspDblxktvNAB11EKNjFdEO4GYrzDOLbd9FFkiHr
	V77oY0//Hxa9lhj/b+LVztoy4HgPMKh3E7Z+ahZeGEOJ2b8Rv7QA2XF5XV+tMPE/eGWAPY2PLG4
	Aa/Wr7CHsMjzI+Qecds1HYRVWjAanQiO8UTEQcqqYUkGwIL4oD6Gce5+0Aov79EXFoYfq4CNAEQ
	aQpQiRW9bW6NoaFV/iA0E7IsD+mi9aNGPaeKhrmpWjAEH/L+T3JiMwV4x66/MTnYWTEh9yf/+Qc
	axyNG0uC2frtkLOwhUmrgy0O2VIlEA3rSCw1e5ExsLt/wnH84ZJW9fZQPb/6TK/zJocZvUaq5ca
	ycRqq02sirHEVPBvGzsHk1L5OEy1TLz3QfJf3VzARfsarqRi6arm48K1J304+OhtJQc72C23SUV
	+DlXK4BDu2dXAUirBSbIIPJqQmGIZGbigqln1R4roo03jAvItGUxsDuhwKBdWoMHVva9dKQnIAo
	SxwIdoNMgQowws=
X-Received: by 2002:a05:7301:a03:b0:2c4:4276:709f with SMTP id 5a478bee46e88-2c442767647mr2600127eec.1.1774837676295;
        Sun, 29 Mar 2026 19:27:56 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm6250673eec.30.2026.03.29.19.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:27:55 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/4] Fix handling of GPIO keys and LEDs on geode
Date: Sun, 29 Mar 2026 19:27:47 -0700
Message-Id: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKTfyWkC/22Nyw6CMBBFf4XM2jG02PpY+R+GBbbTMonQpiVEQ
 vh3K3Hp8pzknrtCpsSU4VatkGjmzGEsIA8VmL4bPSHbwiBrqetGKIwpRErTgj5yQMdvVEJdtHH
 OWGWh7GKiovfmoy3cc55CWvaLWXztryabP7VZYI1X8zxpUo7O1t390PHraMIA7bZtH6Nd0K6yA
 AAA
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
Changes in v2:
- added printing offending propety name in patch #3 (Andy)
- Link to v1: https://patch.msgid.link/20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com

---
Dmitry Torokhov (4):
      x86/geode: fix on-stack property data usage
      software node: allow passing reference args to PROPERTY_ENTRY_REF
      software node: verify that property data is not on stack
      x86/geode: use PROPERTY_ENTRY_REF for GPIO properties

 arch/x86/platform/geode/geode-common.c | 24 ++++++++++++++++++------
 drivers/base/swnode.c                  | 10 ++++++++++
 include/linux/property.h               |  9 ++++++++-
 3 files changed, 36 insertions(+), 7 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260315-property-gpio-fix-51586cffcd5d

Thanks.

-- 
Dmitry

