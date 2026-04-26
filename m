Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A533A1B5
	for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 04:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177848; cv=none; b=uhzVYJpM3z3MfWA4mxyvHN+odCnaOfEoZnqCgZebFk9zDZXbV017ye8TBeJ2zGswIpGhCE7ZJTOkMsDfyih7vKK4TlmPJvYhgW3ylofCN/gBZaZ42IRqO8qUo92sYjGc4DTbSZBstUmwdnpxqmSm3fcmjaEpP5ahqas1rcALUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177848; c=relaxed/simple;
	bh=3rmFVn7mfBhf5kYzkIctijPsYJdxGwGtHSCiLTSRSUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpMDlrgyyGjsH1KVwBy3XxKQ/CLBYbU8KQ1q3N3qZVSXH6Oyz9z3+Jy+M/Gtugh9YtEOHcgFoPyV8ltiAuntRH/8b+6+1cY0d414qmpdHTldymAPI29iCLyXQQdnSm6JPNSrahsfO3pfPwfX+6Bik/6piGufLc1mbLfpfuwDZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhJAi4vq; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhJAi4vq"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso12081446eec.0
        for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 21:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777177846; x=1777782646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDj9dmWCvMh97BYRSTIuFj2QUSQn2a32UJtWHDEzOtk=;
        b=HhJAi4vqXby+WjWXlzZLAsY/bUmldU1mSPa5IiUChAReiWcmWJTIWUVlq4EW6UD4di
         d00geVCABsZROvyQtQc+HU+fX/X82iauiY+HeRmoz65RsXksbcAms7ylzpW8kb0hB0+F
         /IF0vo75ZWTG7A11mJwq59f206geA1PL+VoTN6B/5VNCYQWzak42TF5nG+Fm7EE0bE9c
         nkFbhA/+Ftd/CfFK5ENmYXJPjW5Xxp++n5awkKrKsjD3HhXpWiVdDhVRwOCFLUHXFX2I
         7Jl4AA5uEWFQkjnoMAwj+PjXyfEy9k0YRXaUhZQHQtaEqZb9yjs0nKQx6yrbaOxaV+4I
         dSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777177846; x=1777782646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDj9dmWCvMh97BYRSTIuFj2QUSQn2a32UJtWHDEzOtk=;
        b=drBhs3/EK8uSOUbLyWLsr4u2D01ROb8p557Ta291SSG3GLq97EFNZij+bFube+oEjT
         KARt8Gc/dDDab896Spqs/DVt7YRV0yykYwXK24wu6DSfKZvWuLWDt3R7elkrBpNX51IQ
         /VMltDKysYULpTojlNgM4/DXI5A2sT+X6tKKVaY8MQfJQoq3naQfvOCQsB6t7X1M97BZ
         +ghbdrNxF+FBVHShW1GaNeQBe8mWRhM6d9jAn7ovGG5qErChHu5zYAQ8A9I/XhQr3jJh
         D75meqAff20jOWDa5QXuJOxgyZNwzk/cgVGslGfeipQKu976/+l37MDTrcHZcgcjB6yo
         cXmA==
X-Gm-Message-State: AOJu0YxEbuS3hG09MXpjx2OPTylZuzlDdO3G7ct6oLJDRaU7gn73IGDs
	bFQpDc2ik49K+NzGyMBsf2fEthgRIf/SIn07aVulK68VLqsrYvxhqXPR
X-Gm-Gg: AeBDieulAd/PaYeXN6ALLVS7MN9NY8yzlek6imkB5hR6vId+RsUK6sr8jw/z2OXqMrS
	rI/3ctdIRqBWHQtiR6gtGxg4D/xjrQAHU3WlEatExFyPdnWd0bEMNAnWubDbvr9awP2fMunJ8gy
	TX5Ve3V5iUId+dyD5SCsZkT43cjHBbWEXVo7V7Oc6yTc9iPgfHhV8jzwiJ2gJD+K5eRqA26ywqL
	okb9gFUO/xoywwI/17zUuY27uW/F3bRML6Zvmv2BGkYvrSHF4KCpFDy/mBka6bFk4ZhCfftiCMq
	auNQx5DuvYdWC6tLv2IgESK/FQFm3JxUld9PIdTpdgYd3JiPVpzfWBVGtqmMxPL1b3SD79YNdea
	hI2GhPJ3l+Da9Aor+r3KmQSs0tVcuBnIsvvOvB9wjw/+z19luVpjXxPtYpp7iTNxK0lW53wSy8k
	xye3vus38h1VMDoJWwKm6vHyP3A5lKoPPKOTBqt6+uq7Km9z7k51kxbA7FOYuA5d0DeWQ2KDagg
	ijH9o9oTBtP64yx+PtMDyfBvw==
X-Received: by 2002:a05:7300:d70d:b0:2d3:f3fc:bb6b with SMTP id 5a478bee46e88-2e4646cca96mr22292805eec.1.1777177846449;
        Sat, 25 Apr 2026 21:30:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f359:aa0c:530d:9dfd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm37796971eec.23.2026.04.25.21.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:30:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware
Date: Sat, 25 Apr 2026 21:30:38 -0700
Message-ID: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the builtin firmware loader allows 0-size firmware to be
returned successfully to drivers. This differs from all other loading
mechanisms (filesystem, sysfs fallback) which reject 0-byte files, and
forces drivers to add boilerplate size checks.

Modify firmware_request_builtin() to reject 0-size firmware. This will
also result in firmware loader falling back to other mechanisms if an
empty built-in firmware is present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/firmware_loader/builtin/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/firmware_loader/builtin/main.c b/drivers/base/firmware_loader/builtin/main.c
index d36befebb1b9..1dcebe8e7f8e 100644
--- a/drivers/base/firmware_loader/builtin/main.c
+++ b/drivers/base/firmware_loader/builtin/main.c
@@ -53,6 +53,8 @@ bool firmware_request_builtin(struct firmware *fw, const char *name)
 
 	for (b_fw = __start_builtin_fw; b_fw != __end_builtin_fw; b_fw++) {
 		if (strcmp(name, b_fw->name) == 0) {
+			if (b_fw->size == 0)
+				return false;
 			fw->size = b_fw->size;
 			fw->data = b_fw->data;
 			return true;
-- 
2.54.0.545.g6539524ca2-goog

