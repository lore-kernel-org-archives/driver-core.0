Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDF83AFCE2
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496894; cv=none; b=qVNKD7eo8gvCHi4YPold/04QZd1EeCokFSDelF0NQ2Asg8jjNuPm+3NlV8jheXREmQ/XjrdUZ39sdCofFsXDvqZ5PjVDrytvbrhncJll0j5HVbsCJGMjyNkZBiQWOavIL7Pp259CJelNqN1Kd1prTwTeY0w6zde+h51tSYGp7mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496894; c=relaxed/simple;
	bh=WJsUluFFy6ycPc92WFtYq+2HfDLs1yNweandopo7sJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bn87iF1NShng0BUnymwIzeXbZkVniOFnpbfYkNxX0JgQDn9PuDoW6QL6xV0eD6FhjLP23VJk/kq+a1yhKkg3NWI4y/kdyCg6JLbg+UUi5NpbFgQYJ7ZXRS370XRyV8pXtJH/QSOPMjgdLw8x5Rl9wpgOotgE+3nRN/fcJUd5ZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GCa9/olA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GCa9/olA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4926046fbc5so14453925e9.0
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496890; x=1783101690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRo2gaV5hvxTFO0+J0hZat/ORpe9bgUHs0Z3grbVm8U=;
        b=GCa9/olAefi/kQf0w07ECfckIFiUG0sbIKMF7TxlCMzyzA6IX73LrZYzd17TuJ1iuE
         8ZfaQuVFSCCiaaD9IUZyVjMIK73yRVkQPWrX4ozjdtPpL8YguB3uVRw7B/LLGtP7snSG
         MVU7p148d2FxS7eO2yc8H3D6bDRkwGr9eQ8PQMkRVFmmWO3mR/kt+MMmxZJSuBz/8JIY
         0KZgJI4Dn3YfmKMVluibyrlnWCH6dhfFX1/FXJ42GTNv7u4XvD87jkLFSJygp0Vi1NfL
         BmpO3OW1EEGeuwrxTaYqGaSsdM1zCLsK7DAuN+CBujdoNu5TLFOGyZmyg3qs3+PvMafu
         32mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496890; x=1783101690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRo2gaV5hvxTFO0+J0hZat/ORpe9bgUHs0Z3grbVm8U=;
        b=MuJDsFRYPfaYxbsaQoe3rZtGGGUrk+ScU8M/6Px9br4h1zpbb6aHeAEBIf6i3RXKc8
         0nWOaYhjm+SA8X/AsGivKGcYXc8tI26HUQtLkbXf5iruRsAHFd8E58TO23XAga+VNoEm
         MbD/dRpwd2WIPFxhUclkmTbh8C8w8oRZQpIF1YlYapoQP3vPTu1J3ScouVkkQjc8xS/8
         AXYDk0DpKelsEAbkmjGgLDTfSJpWalrLHv2hK8Svl/pUXhijOFIYzqf2fHKhQH0dln+l
         A2Lnc0rSiZm2oKgyqbqbeucemeT0KasFBl675nWURVRPKIW5jZK9f5qhTc4mXj1Svok+
         qeXA==
X-Forwarded-Encrypted: i=1; AFNElJ90XGzDaNhJ8zZBIG7c5Z/V8IB3odVi/cc7PywM6Hk1FComztYmAbT3H6H2apOmpN1Vx3wSPNbWwYEgRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm6MaOIkEFmqqBlW1UEWejTNcbef5GWGhQrmsQWPkftKfiC/tB
	XfhFou9aSEUl3S1CDmUdBRetZi9qVDTvgPJnSOpVqReS5iQr4qo8WF6g0p5dhJVbu6E=
X-Gm-Gg: AfdE7cmkeADuGbV2kQq0Xxubs3/nUI8iUOn15qmMC/dVzPVeY4pD8X2grmNuTsVbn7b
	pLzB/fwFoFrfbuhqWR/DfoKb8F6YFjkAlBlvAO18n+TBeUqntCVKnzrEn5qyRDUpUeWu+OXPtXu
	vm/DN9GQI5XbUosuoSLvzxdMdjvoZ0ybth4OlsQzjbjAiAgb4oe45b3hen37R6tLswSQUbxivvf
	9d+mKjksgVm0IYKN/ujXknN5hPbgmbbeUB9+hSG+DeocNug+3DCetGs/weW3s/h3Uzq7C9dQUWo
	xC6v3i926MOKpRQuz5GWuJI0JdcFxGFTpj9g+yxf++cKosVXGGBUzkVV8Lb3Htg0mcRzUGBtN5Z
	brfcm5lEUZK8e6/kELA2d0l+6NFNgUEH9EqYIRsjrn29WC9LGXK4Ne2inF74a3P015mtqGhRzY7
	PU5v3s6qKJxnUOqvjp0vB/fGB9kxKngDMjqD9fQSJ+g8wFAJypfbe9bZDl5LQ20yRVrF2aWEzlg
	Ttf4oy0dfDJEgE=
X-Received: by 2002:a05:600c:350f:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-49270251449mr19282145e9.0.1782496890587;
        Fri, 26 Jun 2026 11:01:30 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49270208b29sm21872155e9.10.2026.06.26.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/17] driver: core: Include headers for acpi_device_id and of_device_id for struct device_driver
Date: Fri, 26 Jun 2026 20:00:23 +0200
Message-ID:  <976ec5b0529016d63ca3cadf8792f7b2324ab58b.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WJsUluFFy6ycPc92WFtYq+2HfDLs1yNweandopo7sJI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5APXZlCq/1x9rKyHKICCwCAVSuHG+JxkJn0 m3Aq0pZGN2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+QAAKCRCPgPtYfRL+ TvC6B/4jbxvKALfQ/5hNUMLACbXabT7/tPP1yEFjBeRuky75tpdWrDRLiYW7bXTZtoqDvfUp7LZ DRiqFTipbrUOCb856H6lIsYCj6i5re4f3GebsgA+tKEuqwQbhp5Wfl0SEel/PG5TUccI19aPzD3 riB9kyIfau5NjWhWIUCM+ybjlTzB+zI0CHg8aO32tb7tqvtpOOvij9u+lVvr07j7RgM7oZFFyIx ClE0viPWz34EgK6P28Zcpw2LMpYZbtajgfEE7nvdZwTksdUTAeOZueugLcZFUVBYa5ZBS4PpFdb HC5f1XWF9SJzZwy5xIAgEbsa6hAWCXj5Eara9wRGkQN58S9C
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct device_driver contains pointers of type struct of_device_id* and
struct acpi_device_id* but doesn't ensure these are defined. To make the
header self-contained add the (very lightweight) includes that contain
the respective definitions.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/device/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 38048e74d10a..5323157571a5 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -19,6 +19,8 @@
 #include <linux/pm.h>
 #include <linux/device/bus.h>
 #include <linux/module.h>
+#include <linux/mod_device_id/acpi.h>
+#include <linux/mod_device_id/of.h>
 
 /**
  * enum probe_type - device driver probe type to try
-- 
2.47.3

