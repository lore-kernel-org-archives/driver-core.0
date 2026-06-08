Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951A03BCD0A
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939644; cv=none; b=MwH/l3bPngRpT9ak6/7y5eqPV3nVuKjXnodf9/VYmM2Tvsj3Ro/4OiiKPLtLWlhjCOo79MAAxdaFvDAIPm9vH+6n+ggiVITm1DLBOHvAVXp/fSyOofGRwcEiqARDvhpuUtMSnuT4zFWmhqWYXbtK0WP1wgk9eIoIzjqUYnab1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939644; c=relaxed/simple;
	bh=l9C75fcvWZvNi7gLPQfgdXteJ6Q9R3agLFtFkO6hVog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYjIO7AG0C7hzjd8VX+LiKJx/ueJF/qUk2MHC8nf31nkAf6Mk+F/ZNBXYrJstFLg3CrKK9vbCcHQsTed6+tCEO3gp/xpAkaDRu1WQIb0wSi2NwJJcQBa58jiphKp2wV91JuwfarmM5LybXIlLOrguBRtC9OCyodGapSvmjWkGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZFe+YLb; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZFe+YLb"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-91574384cc2so530546085a.2
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780939642; x=1781544442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wv6HsGvDV1p2p1paiycTLObnogj4qdnEwbEaC+PHzwA=;
        b=cZFe+YLb+nf5tL2LBFOulWkEetWV0cqxta4V4OU1m1jFpll2nADYjRn9siLaE1EGpv
         Mzhe/xNTLnnjcw03bVuSfYfebUTUjXrooo3GjjlM6or2vTEh7dxnYircF6/XakoLELee
         ZyRdB7YeYVZO39WGYa6j68kzq3omeT0EJem+zFO8S92g3SJiECkQznrWZ+PK93otfxb1
         XZSttJQTC/G3Izt9oog1TiuwewWoLnCAjF+lwRYhdqekXk6Ybm8ZltPA8ilPQvU6FP7s
         PV1re7RAWXN8YDekvgBghEeu2qEU66gZVTsDD7C76v0JUnAS6QjK4T0sUg3sUF+YFTIk
         TFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939642; x=1781544442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv6HsGvDV1p2p1paiycTLObnogj4qdnEwbEaC+PHzwA=;
        b=SjScfYDWlZj1qObPbT78nvuGXsIvyrRob81FHy0zhJ1WFQRZ9EKtdY0AFO1sMt4LW3
         UCm+WuCrkctvekJbkaS3huZZuV/vhc+42scE42+sQp2OYkNWSiL9iwpvhLTPKZKBdc0Z
         G3QgZZTKTFHMqsPCFpgRF9IF8cyQWe+yNawPwBY5jYXhwXSRUoNMR/E0ayTnxNSj5cyn
         CVOED+6AlaghYM3GS2JroOqrHyFX+zOBAYRp/BXQrMC4nbok+BnZj6r3+RWKsXE0BGVd
         q0xY2eVdkfpRx3owUCTUSKX9btlkQ5zZ0LzPr79pMs8HaF+yGZAKFlWWMK+XrFaXfBXU
         lW2w==
X-Gm-Message-State: AOJu0YwejQDycK9RxGvm7YmV/eXKpETnhEhbixRk5RhnH5gy2QsGeGsk
	Dd7oVKMPGRqzrLtIqLxm2vEfzdvw8vy8b3M0ovKoniwDVqtitXuEKavM
X-Gm-Gg: Acq92OEjH0ab8Z8wHUwhzs4AMJIdBR17O9f64v3AN869kcvkbBcxxHWpMFBJ5renokL
	oLVzLJTP2qPnthynXP2Usx33PP/4RuCcBNbmq9Hz4SJ93LGDuMXzK61ZJ/JKHN9FV6YuHjr3ibs
	KXdJEUhQS7TrUDD/N6HzVISmv3AdVyXpKC2ujkTLM8qGMDxY021cSwoTaDq0lrgx9m7MJ++OIS9
	zQpo5i37c5KfZF/UsA+fE4tb/gfbLE/Yef+HVi+HTKmZhd8PaKiNa5eLYjGpry4nJq5bLUPDpcl
	qvEfKhdhBVHNygKi4T0g6iZF94EAqBuFZDIzAxHpeBzOIDh2cAW/exl7KqlZzPsqoq6VnQ2S68g
	LkPs92XekaQIJaIo+1ENycP14QG5J7eYVKUZw/BxpYBX3wHGcnOS96QNWwFGfSzpPOcueBK65zs
	sFYF6kL4r0Pszla4G/ntwT6MbgDbsPyHbLUdmvAY+8IW5kv7sIhiU=
X-Received: by 2002:a05:620a:29d0:b0:915:9fba:8794 with SMTP id af79cd13be357-915a9c4869amr2529413585a.6.1780939642525;
        Mon, 08 Jun 2026 10:27:22 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3c2492sm1931802285a.34.2026.06.08.10.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:27:22 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] driver core: attribute_container: Unwind device_add() on attr failure
Date: Mon,  8 Jun 2026 13:27:17 -0400
Message-ID: <20260608172717.88657-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

attribute_container_add_class_device() first calls device_add() and then
creates the container attributes. If attribute_container_add_attrs() fails,
the helper returns the error with the class device still registered.

Callers use an error from this helper as a failed add and do not call
device_del() on that path. Undo the successful device_add() before
returning the attribute creation error.

Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/base/attribute_container.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/attribute_container.c b/drivers/base/attribute_container.c
index 4ad26b8dd6a5..3c456374247b 100644
--- a/drivers/base/attribute_container.c
+++ b/drivers/base/attribute_container.c
@@ -425,7 +425,12 @@ attribute_container_add_class_device(struct device *classdev)
 
 	if (error)
 		return error;
-	return attribute_container_add_attrs(classdev);
+
+	error = attribute_container_add_attrs(classdev);
+	if (error)
+		device_del(classdev);
+
+	return error;
 }
 
 /**
-- 
2.43.0

