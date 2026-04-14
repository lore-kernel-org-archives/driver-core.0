Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490CD30C60E
	for <driver-core@lists.linux.dev>; Tue, 14 Apr 2026 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776135581; cv=none; b=SwC7Ro1akXgtWmIc1m+lX11QeZWQ1ChLcJpjVr0dZCMzUTQEOdraLZWHru7tpu0+eqHK4da9uqUQHBXjBkuFL5tJKI3npdHO9xPr0g7HQDCFb/wBGg3Irz0C/h2Y0cTneZ68p7ghJDHCOPlIWu0e/Gjr4+ZT5VW0SKDLAZ7CUzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776135581; c=relaxed/simple;
	bh=wXv4cjO1HjtQ943B0uWfXVygRo3lSkiMWt1oRZ4HAqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4iys3OJuuFVrvmxN5slAGjSO2aYh+Qx69ghfI5PfMJNjW8q+drz+iW95fR9ZltqTNya00vl8+H2ZDrisggLY/cj7iY42uoTt2hLy4EN8ognch1vJNspgT1pwX6rxJPqtSRp2i4t/Gd2yK56dIbAksXcsTT6AmzZEyAq2uUuPeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mZm4zLTK; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mZm4zLTK"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c565476d7so1110369c88.1
        for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 19:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776135579; x=1776740379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EBrFpoT6ZNiV9rc75QAOsIXDLNKxuSiEQTJY8HNosvU=;
        b=mZm4zLTKL+nDUjokwXsS4PjhblwPaHJEFpMl/P4hCjd00HVdtKYR9NuNbxdm6fzaQg
         WEJZdQJbcZKAbbMomBpFjForLRoD+xFKweMiMdesPH6jC5dB2oeuE+1Nj3goluIxwruL
         cZzENFAmNjDMJHnJ/OYi989qovAMkjBtZUFCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776135579; x=1776740379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBrFpoT6ZNiV9rc75QAOsIXDLNKxuSiEQTJY8HNosvU=;
        b=RSyh9ecm3s7XCMujuQoCpRU31XVUHK4bvkh9h8VP5vClSOJd7V2ukET4QLrvlJ9hrU
         GDopgS5pojgm9H3Ov1YtWM2ecqJw6LyYEMMfhrfuYNYhLkUT0KUpXFSuowhjrEijsCR0
         C0qRWFqToduPsWQOMm97o6+J8u3M/+N5lRNqq+NyeVFxwWYueXDcXqpouFETnixxjwvd
         xtcVk5PF+AdiLsqwafjf43BfU7xRwZc5ijYgyNEvtFfvBlJ6FAm59kEckKGcq6vB1QPn
         pOlOZ4csJZ5tzvROfXRsJJdbxTHHUynCTHdOyoUvm5P/LQC1txuyqcvfI5qIYqp47vfU
         yw+g==
X-Forwarded-Encrypted: i=1; AFNElJ8RXLxHMiJJ/pgYgmPmGgSO3/2BOE4DADSQLyaijFuTM+Vz0MU1y+NxjLFqkCbSSajWsx2KB31ob5IgnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVOJn5xMK1OFRfN1AsP5+vptanAo76w/CvnlIcGrey5mW6giKC
	S0p9ChA7F0friid+uEjAzifkCyLb/0DQF5StOAF3zW3W/qCtmQZBJxsp5Un2hcNhsA==
X-Gm-Gg: AeBDietdjwGvql9yUg4V+QuB/0ScvldaDvViDdOMKuLqsp4jFdS9Ms0Usyu5UOKhcmM
	h7x+oZ5CgwuZ1R3vzdSoyhIRfIzfMO89RMv3tK9E/jFEu4a1dFdb7P6/OhXH+T98asTJIpDedFb
	k5ZhKhI/Won/WJEqy5vq+R5eipVMA7hvtWAMsHb9C3MgYVLr9CuvBTcLSSuMcBPI6Zw0G7sudhQ
	An+fLb51VhQZJ5aItUjyuyEcpYicBWGyhAQbsAqcXi/J4Chua76dJ5U8UNCz3cxSf+7dif79PEV
	UyZjqS6/T/NhfijZawCLXnm3PuS4vQuD/kVqBIUrpkIQtoVhY3Yito/Gqz8QJ+9qADcv6IQo6LP
	mQQ7hAvOrRxIyROdjaLvhoiR3QU+eidZ41gNcGKw3Ou7VzHAwL5algFSMQ2ehUVlA0eJXElbMyw
	inYOd7CLdqmTpCwakDtbosnCq8mfO1QqomnaF7GVy922QJW1Klgc9+Q5ztt4wkdPpzszugiNuOM
	HimaCuoR/Wsbg6/AvA1UQ==
X-Received: by 2002:a05:7022:fd01:b0:128:d4be:7438 with SMTP id a92af1059eb24-12c34eeb7f3mr9760910c88.30.1776135579184;
        Mon, 13 Apr 2026 19:59:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:4a57:4cb5:2285:85aa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459f7ffsm16313871c88.3.2026.04.13.19.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 19:59:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	driver-core@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: Add kernel-doc for DEV_FLAG_COUNT enum value
Date: Mon, 13 Apr 2026 19:59:11 -0700
Message-ID: <20260413195910.1.I23aca74fe2d3636a47df196a80920fecb2643220@changeid>
X-Mailer: git-send-email 2.54.0.rc0.605.g598a273b03-goog
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though nobody should use this value (except when declaring the
"flags" bitmap), kernel-doc still gets upset that it's not documented.
It reports:

  WARNING: ../include/linux/device.h:519
  Enum value 'DEV_FLAG_COUNT' not described in enum 'struct_device_flags'

Add the description of DEV_FLAG_COUNT.

Fixes: a2225b6e834a ("driver core: Don't let a device probe until it's ready")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 1c27505476bb..9c8fde6a3d86 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -512,6 +512,7 @@ struct device_physical_location {
  *
  * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished enough
  *		initialization that probe could be called.
+ * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE = 0,
-- 
2.54.0.rc0.605.g598a273b03-goog

