Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E751447F3C5
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939303; cv=none; b=O4IcognoSD+30wtspLr6s9ljRgoanNF5frC51L5lNtKVMGzMXhqLBQ7Df+Rq6P+lQ0Zmi/ffamNlnRpNpnnxuXCDIue72Z9NSuzOuNPAZcrEnrdNodR01akcHqXkw1ncndFivL2uTPl22k3IQjIe+xSpUHrDDmrq4TY4lcW+GSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939303; c=relaxed/simple;
	bh=WcCYelFSOhbeoMxtjGueNhLN0g0ypi6G7QGQ89YUic4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gsp2mFaVUghh23vvFr0ggwFa171rBwA6i6XSu5EpEEKl+YO/4YzyOeR/dkDEOX1QlIKEi5A8EXBPGfpaYQiZhmllKUJe4ft0q9X5aEAKjbCflBVPlwyDTZ7/MX8qZ1idJOftlt+Yft4At1KxHuGPnMfxcbQ8N9YsaJWVHGyQr5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4Ir9Uqm; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4Ir9Uqm"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fe8912so1093811a12.2
        for <driver-core@lists.linux.dev>; Fri, 02 Oct 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790939297; x=1791544097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/U30FypKXGiK+JknnhSRfyksD6iky5csMYxiBRiMgs=;
        b=D4Ir9Uqmz3w9XurangITAkgwvHiw4vr4b/ONMp8BsMGagzMG/F7B99vyefRuGdie87
         im2SgygypQ+icKNNbdFOslxtOWo1isPuB7tS69hpzDglnyjTJfSP3lerjDHRIiNIdpM0
         OSTeS3wt0fZs29ZdOzk2Sp5Yln1T0++uK1wPrFmAP36CpqKEFSJQTcCeQzmThmy0Sox5
         +H6Vtecs3Hqhgs3SpfgN5QetphVX+/Daa6yspIK9jdT20ZVug1bWtk0jlrHPbPZ/MyOf
         qUNgc00Dzch1GuxQr+GHRwmO43BW4zsD3luv3ANJsg26NbM/EUiDKcLTTrImfEIp+QYu
         Gq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939297; x=1791544097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/U30FypKXGiK+JknnhSRfyksD6iky5csMYxiBRiMgs=;
        b=D8W06e5l5ptWIOGyrN0zR2HqKX8DNPrD2vIaL5ALrzevABl25ZWqhszb1q8EZ8W+Vh
         Iausr8tOblxArpJHryxbk8kmooCzo9iKaIsOrk1Xwaj4csPC3Mi/by9X9yi9I0NCgaW2
         ddFmJ/LnSqHZCgmK2vpJ+dv1r2paCCeZv/iGjK7kUE41N5vSk/CAndlBSwCZdx4yGjxC
         3lI49tmfGhhAWARDUw9gaB0hDdSc8FC9g9zPJ489u7Y4YMmi2JHtxp0mAPCBM6yugquc
         haOJKQjqP+9d+ev2W7DQ98L0KOdEoWpz8TCYa4CmnBZKtQ6B7DqZbaPC4gOc1svBDm3y
         TV7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCIlncOVzXp2JdNCC6s6NRgzubc04W3fVZFgTiAWk6Y2ykwhDU3v41UEK8HCck9GZU2HIUmndxcPxgUw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLcxW/1yn6ShgZwm2T0JD0c9kxq1WE3OgPfclT+oLkeZpFymav4
	wZ+EPVAXMA4DEg9Sx21vNdACRkI8sedEKOZBJtK4ryndxk6x/22cdvBm
X-Gm-Gg: AYBFou1pJNs4GgAPGlJb8F+ZMfQgm5mJnT0Rtx1LVvnXPUwviFzfvdRZKAet6BhiEA4
	qYpdZc1rYnpxcVNtInbNBQFvevaPkvyGExq8Z6ptKjyUydzXPARLZRTTY3JY97XtZqVldxsE4Fk
	tq5CX8qFpNbbhD+Ae9ykfSmf0xalFdtUp/uVpgcI3YKH0UI9swu9hURY2eGMSQn4a9QI6q5dn4q
	KuaJJbGFSUNaiF10io2ZRPtSlywTBA1mB5l1weZFPFirBCTN4U0mE3knmdtwQlry/p/fFKKO97e
	1jgr4lslp/2Lo69obSgDbw0Az2fA5bGkgEBLFXkJukefTCyI5lGq68JQfH4OZYoYNidAndO9BaN
	27FFWa3uyq2C5UpVVwVyw4mbY7CtXofd9GBtjOM2ss+qapRDBptlDsar9jdS5t39eR56B8590qf
	pR/T7wUuzJpwqaIXe70yKPJnFSf9K/To4a4kgXY5fdXPh3NqZjwdTKvDfnPcdRMWt0W1p7CgKw2
	wjp4d5XEtV96CzQTinqbbtrvtfYCPoC22xIjgHtXqLiRJiXrUNKvUoC4AmLKefMVFnn4z5tj7JT
	Mt1S
X-Received: by 2002:a05:6402:210e:b0:6ac:c1dc:fa1d with SMTP id 4fb4d7f45d1cf-6af9de987efmr1696666a12.0.1790939296938;
        Fri, 02 Oct 2026 04:08:16 -0700 (PDT)
Received: from localhost.localdomain (ip-80-113-107-207.ip.prioritytelecom.net. [80.113.107.207])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9dabbe89sm846216a12.34.2026.10.02.04.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 04:08:16 -0700 (PDT)
From: Jesse Jeronimus <jesse.jeronimus@gmail.com>
To: broonie@kernel.org,
	corbet@lwn.net
Cc: Jesse Jeronimus <jesse.jeronimus@gmail.com>,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	dlechner@baylibre.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-spi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: devres: Remove non-existent SPI register helpers
Date: Fri,  2 Oct 2026 13:06:46 +0200
Message-ID: <20261002110752.89529-1-jesse.jeronimus@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9b894d65e978 ("Documentation: devres: add missing SPI helpers")
added devm_spi_register_host() and devm_spi_register_target() to the
list of managed interfaces. These functions do not exist and never
existed in the tree. The only managed SPI register helper is
devm_spi_register_controller(), which is already in the list.

Remove the two entries.

Fixes: 9b894d65e978 ("Documentation: devres: add missing SPI helpers")
Signed-off-by: Jesse Jeronimus <jesse.jeronimus@gmail.com>
---
 Documentation/driver-api/driver-model/devres.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 5067500ded5c..4f0b90e7e138 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -460,8 +460,6 @@ SPI
   devm_spi_alloc_target()
   devm_spi_optimize_message()
   devm_spi_register_controller()
-  devm_spi_register_host()
-  devm_spi_register_target()
 
 WATCHDOG
   devm_watchdog_register_device()
-- 
2.54.0 (Apple Git-157)

