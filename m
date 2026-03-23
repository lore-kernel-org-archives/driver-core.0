Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF85231830
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230905; cv=none; b=AsG+wgR7s0ra6uV3smhSZ01JJoSTNcm6WqYYmL8tjEQQrqLS+/Sgk3j2ggN1Q9MwNmm4ENCgi020PogG/cVsDPitePVmfEX+GDRGdA0UQueFdY7xqgvjnOQdXXm4kcsOPxvYQTHJH59KF8Z0p1Qjc7tOwOalmsTejnR52xHW4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230905; c=relaxed/simple;
	bh=DcXRlt171JGbuJjlPztdgWcwKxWTeoWbtUiwkXQpQqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rS2ZAqbS1aTWRSkBKBb117mFNW3ZuUC1fZ88HW6kGAdhbilpu79ZvlIeyM/xezxBkKjV2hUnK2M2iYt7ImQYZIX+/ohgGoAL/mLC782SqYOaSb9dcOiOnhQXfeyztAifTutTXlR/AmaQ7fm8XhOXe33Gsx6FbseNKi1uNgKL7u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS7B9AhM; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS7B9AhM"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b6b0500e06so4159954eec.1
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230902; x=1774835702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPoVYlhKSTxPQorecgbDpnVbncz+dhf8Hr/jKiyeXpk=;
        b=NS7B9AhMrDG1l7yU4Evqd8Q8RcYiIc+IFvPzp8+Jda9ervsnIfJypOnGqRC/lULU7l
         8v2jBVLFzRY1sEfhHDLGyPgU+P69SJqaQ46BLydbwuZsJ38FJsDpP1RRMXYQZbCiUswi
         d7QaKBlECPaouNpDC1ZQ2T+dYii8pmPvvV9PazNrj7XeYV29n5g4KDHhLrPBaPX+f824
         ALcX2kDhWFnb+7Z5NoUgZK3Meg92Klq00AgEWiOuD7xfhzBOEs9O1OGYuV5DA/o4IUHx
         v3VMc302T8FJX4ilslWVb18kdVS4cQTx99Ag1gm4QARsntXcSvbsGg0yll+yWCeZ1XlG
         FH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230902; x=1774835702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPoVYlhKSTxPQorecgbDpnVbncz+dhf8Hr/jKiyeXpk=;
        b=NUwVg4qhLLQphKzXytgq/FzQtCUTN/IAXbGhyIaGLvW8ogknit2hh7fa4DNmragpVd
         tZ4vKLZqLf0IGLOrAkyEeOmlJvoMXYhg+Xi08cYS0FXAxqUY08SD0M1qvGG+08m6Bn5e
         zsUDw8356oQAJWXdOH4skDUb/vfPh5OdFnjjh0TuTeR9k1IbNq9AUAbzBvM+lP4/lXGC
         NWa0TcCWvyR2thVNRbxn1UFtXY6kTbv8CjM3dRYWzHvLLZn6wjJTIIw1pmdMY7rYZRsA
         SMtE9IenhaUvi5pW8u8/2h5oY4WjrMYBWVkBF7hC8MNenBPEEP6uYJYUbDm2fpKV+dyP
         xBsw==
X-Forwarded-Encrypted: i=1; AJvYcCXIidjUAegryG6wckAYeJVMejaLdzupn7CVtMDQ2kFyRnl4x8NsLv4Vkk9hvM9uhhGsJq7jZptlYB18OA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXGh27R1MFvn5M3hgaOnBjKGCKMM9Y7CWxkHbr65+Adpuzl/6Z
	OVjEYozGjTwN3dCbXo+SNrC3jTqqWMDn07bFLu6TihwtXZKIC6T2PjPV
X-Gm-Gg: ATEYQzwcSNtTqBVzPX2kkODwlWatpmD640tmjH9NWJFfU+LBCT8ge2G9WxeRTZdaW+1
	u+x3akxH69cA8PNBjOcfQTu24RpFeoRLGrMGplYSrL+cN3eLEnJ3x44swWGTnFZFn+tZhFH5XZW
	vFhrugQidlalzjN3HbEXJCTbR7u3zn8Qob1B8+ct+a80rPURVP37BjuuCuf1M1HQAdtioB31Ntr
	lArQvS5QHniC8U9ZxFSpyzNZJ+cnWzZK7bfnj7fDd8lySQGGklu1Y40vfwwFBYdIDNbdKkIdzxc
	8ZOR+NWe+dcl4VLh7XG9J0sG+OB1AweFFGhz/g/y1caFuao+8O9Q5HedHo1SjI098vcRYB2m5EU
	XPJ9atkNIdhGWrBYpPu7+0dbP34BPTIw6fLa0o23EzBEK0eApL/kUPtQalHS45I2834fXxvpTJt
	pm71ofqStBd+I9FOec8ws3DQun8xqb2ZDkRNX8Jvx/2drKJ1TvN3i/99D7Bh+imXpX6S4YvnW1X
	rl+Nm2R9RmoYKE=
X-Received: by 2002:a05:7301:3d1a:b0:2ba:6978:2b4 with SMTP id 5a478bee46e88-2c1097533admr4453382eec.20.1774230902218;
        Sun, 22 Mar 2026 18:55:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:55:01 -0700 (PDT)
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
Subject: [PATCH 10/10] driver core: class: remove class_find_device_by_of_node()
Date: Sun, 22 Mar 2026 18:54:28 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-10-b72eb22a1215@gmail.com>
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

All users of class_find_device_by_of_node() have been converted to
using class_find_device_by_fwnode(). Remove the former.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/device/class.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/device/class.h b/include/linux/device/class.h
index 2079239a5aa5..e6ad009ce70b 100644
--- a/include/linux/device/class.h
+++ b/include/linux/device/class.h
@@ -107,18 +107,6 @@ static inline struct device *class_find_device_by_name(const struct class *class
 	return class_find_device(class, NULL, name, device_match_name);
 }
 
-/**
- * class_find_device_by_of_node : device iterator for locating a particular device
- * matching the of_node.
- * @class: class type
- * @np: of_node of the device to match.
- */
-static inline struct device *class_find_device_by_of_node(const struct class *class,
-							  const struct device_node *np)
-{
-	return class_find_device(class, NULL, np, device_match_of_node);
-}
-
 /**
  * class_find_device_by_fwnode : device iterator for locating a particular device
  * matching the fwnode.

-- 
2.53.0.959.g497ff81fa9-goog

