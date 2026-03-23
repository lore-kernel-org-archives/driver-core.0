Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15104222580
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230904; cv=none; b=Ds3s8+YR22r5N/wuQAE41fKuvGAJu8N9feySrZQ3Z64hnRZnrMaHV5L+H64HHA+hsnqt+Q3neF9s+Jgq8hRpF/OF84CKNxZYt03qhCW6en1nw1SvyopiUE5D9LKwEZI8CgoNoSdkiLDdIRcwNBONEKpSBOB+9FLjBItwaFr7r/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230904; c=relaxed/simple;
	bh=oa2EwaUUG59FtphzeTYHy1LbWnpif4xM00zY4CiwrfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PB21dRzNOp4sz6YmBNuqVQT8l3J/PXrOWvqDqfSC0txluFMFJM8+6z1yw6SBp+nHOjDRV8rX4vPUwmRVzuluoJip96HL9ieau7HX1eXAbcYfp5l5Y8jNiz95Hj09XRc5rEkK/0dhf/wL+BxYMGhMMebaQzXfMBBCC93YMn24Oio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0QXvmjm; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0QXvmjm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c107ef474fso4398621eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230900; x=1774835700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBYbOsFewxAK/zyXErJyI2wWdOZnO5pIFOiKOKYi888=;
        b=j0QXvmjmbP7Nr31LUIhdmDK0qENlGPfypY16LwRff498O0vr7mYklT9MrfAw9UOjAZ
         8MC7ewUk6kWl/DiKuh3uO2sNKQJH/jQLhmdi6qWXLCeEs0hk2P0VeX9frtyqaz5qERVh
         /hy8OjURZM4sa3lL4oWh56CA/FcRouaHk4Z/RhBVabYgjEauaSbBL2Shnff5/sMN3wn9
         FD7dpcUZRMxjBboGShCAfJVncspXsXQDkXgP07uFj5RbJmcu27ziGKVNGI+eIQY6+6KY
         rOjh4UqmQQN6MzWdMT1yB/mJ1Pq7VRyRu0xpfWeVc5DYRNdDgny9xugRRRpOvaZzRQRi
         Adaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230900; x=1774835700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uBYbOsFewxAK/zyXErJyI2wWdOZnO5pIFOiKOKYi888=;
        b=QZcv3T58sd/uSw3w5dtcqQ6YypB1kTl9I9uYHBlqJl5BxMGMxx+dFgpqEy06IpwCSp
         k1FtiMljsnvD4S6Qyj6nwwvQiGz2vgUoeekzaqflC3YIPuFDS2NENydpsR9YTNaeB9xC
         lw+D2Lhfx9wZFjbY/poT7gjEXSLilqUxbdp/Q5goL0zo/Cg+2jYi9PkkdmFWQAOAhLWX
         CGkAOXlJclcmGhh+G21xe0n2yYlt6kbD1FxzR4hcmTlCll2tV4uxim/KQB89+L4ETLg6
         CEFtxYcrNoGK71fCo1p/ojQkeXMRCZ5yJRcmaxADnvynQ6lXACv5SQHLPi++tHMIpdFs
         iaHw==
X-Forwarded-Encrypted: i=1; AJvYcCV3lqsXiym13wmzoKUq1Vht2KNOng95IWWZRXXP/17med1m4lxnjaw+OZmxQdoTniHDxjzCMXu6npSPJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxeoa2RY6FtPmjuhVrFYMq/4CRZtNwnLQzgNk4weq9QZn3/aVQ2
	amr1GD+he6jMDUzzVlRMoWbTcm9M0WEDNwkYdQ+nRVj3YMP0TPPsyNtX
X-Gm-Gg: ATEYQzyei/ISY6aP2SAngKGHThDD/k95tg7p5PX802J6OBpJO+bNrTNlsyYSnFB0ExB
	GkDhdGBwKy26Z4dmMa+tt90vZmSQ9lJ2ZcOdhQdB3gep3+OFvJBXqnNVbrqDit8LL1Nsz/dVsiV
	ZmGPQOo4au3hRzkI9KcDdrL/xkW7aylmoAHr8XBqVqzVj/8Sekz6sKcMOowBqtXSxinXFnkYRh1
	G1k3KEbxvoEBi3q0ANpTQ4APrXy/yeKtaZHGgZeHfZi7adDBzWuws9RuXnQ+HJKy7wGWrCf5p7K
	1awd288nChoPEH2q+oUYZwE3rX8YectyubrVO9uWDeZYNhaINS3XjL6tqSNHgsehQqfxZ8QzF3C
	HASqvBL+KnGaJSFbDD+6vDiMYr+UNpdR2WbuKlFs9+Ts6+bJ57xMheeeqHFecuz9sy7ANbfuMPp
	Unifcbs9ffxp+uB/hTVlCetqU58HOFK+0x5TwYg3zZ7oTD7NJrNh/bhUqiiWmVVbbLdfVRYouzU
	G10ScUUOwAmqWE=
X-Received: by 2002:a05:693c:2b06:b0:2bd:c8a2:954 with SMTP id 5a478bee46e88-2c1097b8ae8mr5509864eec.24.1774230900153;
        Sun, 22 Mar 2026 18:55:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 09/10] fpga: manager: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:27 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-9-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: 8bit

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/fpga/fpga-mgr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index 2672070ced02..1e7585a4608a 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -716,7 +716,8 @@ struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
 	struct fpga_manager *mgr;
 	struct device *mgr_dev;
 
-	mgr_dev = class_find_device_by_of_node(&fpga_mgr_class, node);
+	mgr_dev = class_find_device_by_fwnode(&fpga_mgr_class,
+					      of_fwnode_handle(node));
 	if (!mgr_dev)
 		return ERR_PTR(-ENODEV);
 

-- 
2.53.0.959.g497ff81fa9-goog

