Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D28400969
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967690; cv=none; b=C3IRmsh1Od5ees5uJXgmAhcEngppCoawCFm3+u1u1Gc8p9WD89cc9tY5Fm3rnqyWt400bU1TiXpiTmQ90gMwyiBUsRFjQLww1RXGalH6eHfihSVzv/UkzQKrc+B9ZGHPPv+8rkfVOnLzhNsE3GiwBAQfXhzlJvl2XoO8omGX9mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967690; c=relaxed/simple;
	bh=4q3srqtFp1h3A95lCQEjKRdZTxaY+cGjas1UVMNU2Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LGWNUvx9y5/uxy3JxFQU5OQKij0rnJ7Eb4DyMT4YCmoh4NyhAAGT8Vtr2hrl271tCoPGsB4ieX9cWtlUagy0vb74pqdrb9jj4a6a035RJokMVNs4IQFb7n6ozDSHnS5BMlIcRf0UIFbkkaOB9Guiip+7qsdyWvbNxetLgPrqReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=keXwL6QE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="keXwL6QE"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0148201fbso3119732e87.3
        for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 04:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786967687; x=1787572487; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9jIpGBastiw+6fayBkJLj/KHHg/HqumJJPDo7EbWiK4=;
        b=keXwL6QERikVJIZwRqh9kKIsN6pA70Z/UP/E81Lm9qp7xC0WYuXqBIKZ9QrW1xSDIF
         2hbK+04A6KutqcrLf/e+Kne6grKvp2NhBLNB7+HI1cN+k6GYeb6GBCRqIdpuhqMuatC6
         DusQCvJe0JKpFuzbRV/WAARcBwVGk4gYgeb94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786967687; x=1787572487;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9jIpGBastiw+6fayBkJLj/KHHg/HqumJJPDo7EbWiK4=;
        b=R6URo+/0F3UypLi7U8uH5VYR6Q5a1kfAY+KMwVkgQxryhM641D2SDtc/MfPYZrm0aX
         CwzweozW04OmWxV07QtxgRRshgMc4bN8ioiyTnrK/wTaQXMkvG+u9Laexp8OBoDiuzEh
         UZeiBLSGaIhVfIhonBud0WxrCk8lVz/WOZuuMfrdc7wU7iAs5uXJGtNWy/53AaO7CtRE
         55lwOOOWkV89e60VqkBpe/Uz2krEmvA5n8EmLaJ12YPn9C1BmVyr5bZh1OCVZVAFvAuu
         +2mFc8BuIcGN/vtIH6yTu0CqmQguXdwbPwyG5JE9/KJIrKX6HD8A14VE9NEcNXW0rZXF
         wtRg==
X-Gm-Message-State: AOJu0YyBqGyE6c1emjcs1A970LU8FtPyzDN9MmQIRVwlOQhzUP4jwknw
	cccqaZ/zEsIDxwlmt5QRDk+VhX6pFQGtWK1KemmCOnIRVqqiG3K4nIDuDb2lgr8xGQ==
X-Gm-Gg: AR+sD13fsixFtUoiNObONZruBZXPoFwwlxRArswlhOQiHl0N9t3XP7A2cvgp+g16XBp
	pqUre1kqPKuJLn6faMQwW/lgndhEdEj0ukYRVVH52EidSWqUNE4SV09Z+7ffsE32TrDgZLDlkvr
	mSlpb0QAdnvYCZPv1MeMfRep/GdEVa1nT3qSSTkiDFv6d5ThQnn9/QkBZCZ+a/EyxllxLNrqB7d
	ElFPZOuMOf/99RgdATekrrFeWMk42JKVRHfDx1IXPcoybsZ6xql2A87WIA2VfL7ZLjeALMgDWZ3
	Pao0dS5cfXN0fRU4WGkFhuU+7qQlvXk2EeOXZP4N02HB72coSH75/AvEV2U2q/A0rTMnXrIpPx+
	tphzidpcGNnI+JsMHp3vEih0x/O20CYOEhiQ7Zx7sXEvPIV9V9ZXacUdiiqRM+7N/SXz8lmndNZ
	lXIqis0H9NnhH4pICfE3OSWz58VT0s6YmFkywKbTdk54GWDDoAWOTE83/dUVIDI9xhXFbxOYqJn
	sU2rP8364lSuhCxRD/3xX5CkwAb9ud2gU1EFV6No7xTfoIFlw==
X-Received: by 2002:a05:6512:8384:b0:5b2:a353:e4bb with SMTP id 2adb3069b0e04-5b45910e12dmr2778513e87.3.1786967686907;
        Mon, 17 Aug 2026 04:54:46 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e3c17sm3771201fa.14.2026.08.17.04.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:54:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Aug 2026 11:54:44 +0000
Subject: [PATCH] drivers: base: test: Depend on OF instead of selecting it
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-driver-pe-v1-1-7003ddb9e400@chromium.org>
X-B4-Tracking: v=1; b=H4sIAIP2gmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nz3ZSizLLUIt2CVF1Tg8RU80TLxKQkY0MloPqCotS0zAqwWdGxtbU
 AorxpiFsAAAA=
X-Change-ID: 20260817-driver-pe-50ae7a9abb31
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Selecting OF instead of depending on it makes it impossible to
disable OF when KUNIT_ALL_TESTS is selected.

The purpose of KUNIT_ALL_TESTS is to test everything with satisfied
dependencies, not to force dependencies.

Cc: stable@vger.kernel.org
Fixes: 0e6f8ccd4618 ("device property: add test cases for fwnode_for_each_child_node()")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/base/test/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 542ce07530a1..292cf33fbaad 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -16,8 +16,7 @@ config DM_KUNIT_TEST
 
 config DRIVER_PE_KUNIT_TEST
 	tristate "KUnit Tests for property entry API" if !KUNIT_ALL_TESTS
-	depends on KUNIT
-	select OF
+	depends on KUNIT && OF
 	default KUNIT_ALL_TESTS
 
 config DRIVER_SWNODE_KUNIT_TEST

---
base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
change-id: 20260817-driver-pe-50ae7a9abb31

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

