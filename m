Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1E33509B
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429759; cv=none; b=d66Re/iH4bbN7t1NLE6c8+3J0su5yvevPjnkX6p0QnAosnsgm5UXqBZE9Z3DC3dfkBmlR4UtUsUdp/e9ncH3qGzcGoc+mx6fVgDMaE7BXTdyKL6lu9YrWDTNRQQS/dzTyRNNkEyIDbP6oTWJXnrmJKrQxssJM2I3hfC8LnLi7wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429759; c=relaxed/simple;
	bh=vLc4tl1bcz7zAmXY8hAkknqRMwhTq2tCZElw7BIMEec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gTWSbBJTlC+9fEvBWAdlVmJutQT5DrUaYpweC1YQyP4HEZIm3DBVH3CrCof7F4idNO/KsVmjoumUDv+W1I3l8SwIpQB/7B4QGKPxfAEMGO7tlVKGrxgJAcnEEBWpBo1FM7NVlmtmE3z6bibzkEJMQ7FIFsbrB8K1jAK/s1rku7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym/QUOIc; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym/QUOIc"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0bb213b16so11341291eec.0
        for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429756; x=1775034556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sa/J6TmYzy7RRB74cQu1tp4OkFjKDwdrKLlqQYcFCKQ=;
        b=Ym/QUOIc51NIFmKUYCipB+yPdmmJBPkS2Vmyyg+nBTYRRKDyroODytUoqN0Q6iBl75
         rXU4oTkSRjK37M+WO2oBqF/7xeD7qsPiRvqjvCKu+tyOpWiE+pmddgnVW3gau8m02HbK
         E4uR/dOharHCGe/l3A1SCryzfXPNLraFfin4JAX/Agz0xpHy9XwN2eIT/v1YRZYOAJsT
         /XFnYpZ55DMYLpeBoqpkh+DoDIy8mAFmuzRUZ7ped9nwNX5DKR5CgTcdsGMt0gb3cl6D
         k4I3VPmoYltnsISrwUIQHMWmGGTtcMpQPUhO141Bw9aOkF/bG+4jYLZfO8g+CCqKVQml
         BxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429756; x=1775034556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sa/J6TmYzy7RRB74cQu1tp4OkFjKDwdrKLlqQYcFCKQ=;
        b=oNjyNh0Rb6AhIUxYnD7ULu8USd53Hh3Rzyma3xSk212406e6QF2wrDtksm4Pn9zDJc
         /bacYN5rO7dH7ZJfeWCowyYQfQ7FgBpeEiGnXbhwPUD2xPNdvqfLc1nR7nLin+3dY7Tx
         H4M9jHMjaLUk2NU0EeBF97SWWDpKTUREhkmnAQEWxDpwVsSWmF3z+YyA3o6VZz3J9mti
         IiUo6kQsvQHpwthwsWAaU7NyaSQoW4ojLjl5swQs0iIY9t1brY17UL4z7y8ZiII2MpAl
         rum8lBgz7YB9Mny9i8g9Ml+ps7oBy8W0ayA86yHQNNOm9cmtP4c8eB5J1q64OoqbeOFa
         ybGA==
X-Gm-Message-State: AOJu0YzGWIEyaVSrjm88rGCwY1kw+FRpSk3BoDPMOMcWgbX2lF/1o+VK
	hKle/JPr3mfPW9S7nxxQ9bMYxfV8eNFIDcUfJv6b3ltAXqHrefDUdqHj
X-Gm-Gg: ATEYQzys4J/ExIuLmAC65iLFeJg0BeI4VmsDCGtbddJ6HiFXjAsoOeg5NrE4tIkHRbf
	OhHwHTl55D9G1ACZ1YlHhDLu97iOoIxxKz0ZOnZin0Td4FrHOujs5ovUVcySwxup2smAq7eCQhJ
	FPpqzli2s3LYPB5TEXvngmNtxqXVoiZCwihb8YKZ2rsz7ER/1hftVu9py6pVqAW7DISu/wJHLC7
	NJ0NU90cyoAoyPNQjlwxLKVBi/I9RIVvTWWG9a1ZaCnUYxwAF42JV0KRZnszr3MW+AhD1S1Ss/m
	wxMrbJufwepavMbCRhed2SIlabQpHb2By4hyhxBCokDvKQJTir7sfv2USMNYb7uLMmm/uc4l3gh
	cMKLYcIxxxoptbSaGSGH/nSsgXTbiINpehIyPerGN4P/hBIGlNjpP1L8xkDNxsJROTu68Yw473R
	CzOqss55EwE79W3NHuG8MFYx/Eu0cHmr9vSWS756AdD6JUcsBVFbsrKSWwe8UT2tEuZG/TrRoJY
	JjH9nFR9x5F7td52habvibrA/Q6rM/zD8B1/jGB9TracfBPUQSlcO/zzcsw2LFv8hdgEdg+YWbM
	wg==
X-Received: by 2002:a05:7301:1288:b0:2b7:24fc:f638 with SMTP id 5a478bee46e88-2c15d114cc4mr1569043eec.0.1774429756409;
        Wed, 25 Mar 2026 02:09:16 -0700 (PDT)
Received: from 2045L.localdomain (17.sub-72-110-68.myvzw.com. [72.110.68.17])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29d28csm21760210eec.19.2026.03.25.02.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:09:16 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@qq.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] driver core: simplify __device_set_driver_override() clearing logic
Date: Wed, 25 Mar 2026 17:09:05 +0800
Message-ID: <20260325090905.169000-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, __device_set_driver_override() handles clearing the override
via empty string ("") and newline ("\n") in two separate paths. The "\n"
case also performs an unnecessary memory allocation and immediate free.

Simplify the logic by initializing 'new' to NULL and only allocating
memory if the string length remains non-zero after stripping the
trailing newline.

Reduce code size, improve readability, and avoid unnecessary memory
operations.

No functional change intended.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Link: https://lore.kernel.org/driver-core/DGS82WWLXPJ0.2EH4VJSF30UR5@kernel.org/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/base/dd.c | 43 ++++++++++++++++---------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 37c7e54e0e4c..1a8f93051470 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -383,7 +383,7 @@ __exitcall(deferred_probe_exit);
 
 int __device_set_driver_override(struct device *dev, const char *s, size_t len)
 {
-	const char *new, *old;
+	const char *new = NULL, *old;
 	char *cp;
 
 	if (!s)
@@ -404,37 +404,26 @@ int __device_set_driver_override(struct device *dev, const char *s, size_t len)
 	 */
 	len = strlen(s);
 
-	if (!len) {
-		/* Empty string passed - clear override */
-		spin_lock(&dev->driver_override.lock);
-		old = dev->driver_override.name;
-		dev->driver_override.name = NULL;
-		spin_unlock(&dev->driver_override.lock);
-		kfree(old);
-
-		return 0;
+	/* Handle trailing newline */
+	if (len) {
+		cp = strnchr(s, len, '\n');
+		if (cp)
+			len = cp - s;
 	}
 
-	cp = strnchr(s, len, '\n');
-	if (cp)
-		len = cp - s;
-
-	new = kstrndup(s, len, GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
+	/* If empty string or "\n" passed, new remains NULL, clearing
+	 * the driver_override.name.
+	 */
+	if (len) {
+		new = kstrndup(s, len, GFP_KERNEL);
+		if (!new)
+			return -ENOMEM;
+	}
 
 	spin_lock(&dev->driver_override.lock);
 	old = dev->driver_override.name;
-	if (cp != s) {
-		dev->driver_override.name = new;
-		spin_unlock(&dev->driver_override.lock);
-	} else {
-		/* "\n" passed - clear override */
-		dev->driver_override.name = NULL;
-		spin_unlock(&dev->driver_override.lock);
-
-		kfree(new);
-	}
+	dev->driver_override.name = new;
+	spin_unlock(&dev->driver_override.lock);
 	kfree(old);
 
 	return 0;
-- 
2.43.0

