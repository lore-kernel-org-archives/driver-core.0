Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5C2459CF
	for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261944; cv=none; b=jg3bseq82vrnp//PnRLxcx4wuIDAxHPNHXdcwdRecjm3f7cNSs8NSzJI1n1v4/rjOQNHxVlTr2h3SZ45laBLIy2rGZX8V0e9sAmk6axfdaCuEEVlQ/vbUMWYeWe1qxJqPFPxh2235awto5MH4iF/yGErd/+YvQ3w5wifb46nF4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261944; c=relaxed/simple;
	bh=GinynodeLSk9D94lObdTgdnoKuabwLn1gG9SeHBc73g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YrLPYLJBfmlQPM4UduDgg+5qiU8BAJ7IEgbgfAjhFiMghrOV0vxy01M9HRGc9QnqLeASvk3lzstdhLjvrWEwQOa6TKg2bIj1536dFCaMsU/5Aa0FgQM5/WfvQ/I6+TqOXRMWbPqixEzn50tHVQ5RCjcWsrKi6MlaXKJM6+SgUsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oc/GbMaz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oc/GbMaz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cf636dac8so3027164b3a.3
        for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776261943; x=1776866743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhMXx7gXY1dD+D+IXaFNdkEaadu4kqcUrwYP3v202/0=;
        b=oc/GbMazkTHt6HKDQPZCB/CRl5COEh0jHR0A+P9NVO35pUFnGEQhHLLW6oie9bgn8D
         FAZw1NFMsqFanK0J2+yRfeotqLwiSxg9iQ92f96mIe8MTQ3DnifP3jYAbQqusEzcbf6k
         tSv0+5xdoDbU0B+leV3+lbpeYRZwQaHNxFWr2Fk6YJQ8yNobpQNtVQgQAun72hquvwbV
         TSTcwsAZsMHKNZrqwat3TQ9vD+VPDFA+GQfOx/6XGfqmk451UyQiFqpnbhhMpmYC4uq/
         rhF2imxIw6lBQKkt6wGu+2T34TQQkumi8Y2ho0PvDAOVVD5/nbYF6RqCinzy1wV7A0aj
         OGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776261943; x=1776866743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhMXx7gXY1dD+D+IXaFNdkEaadu4kqcUrwYP3v202/0=;
        b=SEoQkkKJwcj+4ZFXxnUfAHG1Y+sTfDkAWeRJlR5hjrZcU8ioksfy6WzP6lbLD68sme
         m9Xo1IdLDlx6gIePAvsK+/UYHjskqOKfsKfmFYsHXkjh2ao1JsUvE09I0FyLO+4xOqkh
         67vi+ij9NfKxqXr3zw+wEqnYVwV6kwcHWVYQTwoKFwWvqVqB6i3nH4kkgW37H1pyUL2S
         DLwGNDtI5agu7TwZ/nRwLL29Nb5uXd+ZUwpvO+v8XKMcm+s0gnUbykt0pgxMJBqGSQlo
         th0lLW5D0V6UEYxqImJih0LaKI4HDK2p/98x6b59N479zmcvjUHNqVgHU8hTSd55by60
         2DBA==
X-Forwarded-Encrypted: i=1; AFNElJ/EsNuKZWawXUM+9T4AnL/lm9O7fiJAgEpVOdO2ApeVftQxjpw2ehlgvZuqIM64i/A6QcqYw6sUwpyb0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YypHlx8pASQ/D+qC8DECrMQtWj6+jo/6e9OPRwpT150G9zCISvC
	OUJL0xojOoIoft2Ib3Rsf5E+sIdCbXXKOP1KMcVAerRTtBiUFwzYWdGW
X-Gm-Gg: AeBDieuj4rgyPXk1d3uKm9I2CgumG3jvYQIAlnmTb8jBxksHUbEZI92ufmFGhHI67n+
	QInPY+jzq+GAbKnNLgQqCqdNhHvQ+jOvu+pC3G8lb7QVbIHklZf2J5WRGjjkzM5rmmJmlHpLEAL
	bonOku5pi+e0Au4F9XkEJvzZZKfQVqE+olAA/nvnmnJRD02MzwGnNx2qXLzfatLX0c5XOtKO9VW
	rldOrjjNfLvolOMIL9kuoIVILXnuDk++ggU+qSrPz58FJVHONXSwM3FAs+uVSaB50vWVwl1vsTm
	HqDmZi0tTPnzEKK6KygE0q5uBgVuAUhGAiBnhXvsruHGMRcMexDApGSVkN8iYZQ5cYb7rLVfoyP
	5Q8gUhfDGTZmDbifYjYviVQc4rXOTjsh2gdCN1EBO7s/h3J9PTZRHscxSxKCRC2gkRr4qLHA8tT
	GpaWJlp9UXodY4Ite8iHZ12k16ouuODuQ=
X-Received: by 2002:a05:6a00:ace:b0:82c:e775:d43a with SMTP id d2e1a72fcca58-82f0c3562camr23289124b3a.35.1776261942884;
        Wed, 15 Apr 2026 07:05:42 -0700 (PDT)
Received: from lgs.. ([223.80.110.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f67416319sm2178857b3a.46.2026.04.15.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 07:05:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform: fix reference leak in platform_add_devices() on register failure
Date: Wed, 15 Apr 2026 22:05:26 +0800
Message-ID: <20260415140526.3290729-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When platform_device_register() fails in platform_add_devices(), the
embedded struct device in devs[i] has already been initialized by
device_initialize(), but the failure path only unregisters previously
registered platform devices and does not drop the device reference for
the current one.

Previously registered platform devices are cleaned up in the rollback
loop, but the platform device that fails registration is not, leading to
a reference leak.

The issue was identified by a static analysis tool I developed and
confirmed by manual review. Fix this by calling platform_device_put()
for the current platform device before unregistering the previously
registered ones.

Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/base/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e58..9a4ae2100401 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -548,6 +548,7 @@ int platform_add_devices(struct platform_device **devs, int num)
 
 	for (i = 0; i < num; i++) {
 		ret = platform_device_register(devs[i]);
+		platform_device_put(devs[i]);
 		if (ret) {
 			while (--i >= 0)
 				platform_device_unregister(devs[i]);
-- 
2.43.0

