Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB06838AC79
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979933; cv=none; b=G/1vKSKzD4PZbVkp67kXpaARB9KLjE83vrwcp+FZiL/gHYs9CL+i89CtMEgRIycop4AxH2HO+Mu4d2fbYBW7av9T5rCXdaiwpe36u6TGSvDDALh3V2fJ8JKRZyuezKAaEoXUYyqwP6pncRVn5AxtSKRkqUI84iKRjvCti/Wet2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979933; c=relaxed/simple;
	bh=RfgrVvknme6vhAOFjjbtHTulvqGle3JEa4VWxijNxXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvI+bMOinZfP79ZsruqGS/gci7+EveAlprLeRFGDAuQUv879uGVt1x7NmxjAf3lreQ/QH00iKZPq+CNtwhYyphewCr2JpFY6sAVrgelG8s7hTXXTTz0axMHxGvyk9O6q5U+NqNic21bNCgD2LYgoWd4wgkmSQHJBqssi9Ip82oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT+AfpyO; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT+AfpyO"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1305908ae11so1693495c88.1
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777979930; x=1778584730; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjBFmY6oME3TcUT9msMQ0JkYRg8U/8GzZccCOVqrKM4=;
        b=pT+AfpyO7e5tzeFdWKnNRGh0kbYM+ONvKSAHvdOfoDNccEhXslTqhpG7uN4NJyBB5C
         xEsUx8ZC7yAh9Vu6qexaDNGGzilf4DNNSayQF9ackT5uZDQFoFQ3NRuxwAHrReH9Xo1S
         eL8N2OSvIoW8okZZU5M4BcmP+biX/zjm5MgghcfFSd11s3PWyI7nUcXB2yGcgICmKdhG
         W4rpdKUz7Fo8Az6AwX+vN5RbFM/GTiMndsQgTfXjwTiAwIMV47Gm+TD7JJJydoZwEyMJ
         BGtVXHTjnBMPJImuKGvSHJtHQIkgGujbJtSDMcpdwVoMrA7stSG5Ut2AWPJVjpk3duwx
         khUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979930; x=1778584730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjBFmY6oME3TcUT9msMQ0JkYRg8U/8GzZccCOVqrKM4=;
        b=k9Y0IwGO+/ljczfaZVF9+JDU7TDfojwuXDrzln+oysTrHJZFH8t+4NUAantAAFJwQp
         2FGWOX0x60O5n68lOKArpU3I5G86T96EQ6cdLMGtBErtKVF8UUTkCedNA3YBEz8Qysdz
         Qch0J4uSCIgOEHjcvbtiRFbvUB60rbEUzwAruVunLh3BNrDcWPoaNlRUbP1LsqPYft0J
         +YtbJ5dejsEGMqaQQVJ86cA1qKoKowfQ98s/rZZO+tMf7LkVYL+efEzMmnYtGaKphGSA
         p1zANH4LGQXKMB/cTwI04RCeVFKsw2rkro/8nzhCehp4fAXruDzXN7agZurtaKUKbDdg
         Asdg==
X-Gm-Message-State: AOJu0YyB2VI/kers50mXvqg9+BucC0D+MD5OC7Fox6UcDZGxxxWFOclI
	rCrUzwWTeD9/7S9mpQxscVCnBXBBys1jfDDty4/ng8gQLi63ONIfw7jwYAI2og6K
X-Gm-Gg: AeBDietFptxbmIT97CxE1tXtYz4gyMEXpNHLG9BciTNsUqVIu7/84H0l15dXCnGwGHY
	X4iDFiunYSHE758tC5qCTIDlJ+o4GNFqRZ0o1sAtbGP8SLq2bq9yUiDXK+Sfj4l/oWe4jkM9LXB
	W2onpMPa8L28SzgBVN2xAtYAQoNoQITcSHJmCQhiFaggvQrwmIP1je4v4Z2txl3vi+RMH1//XCl
	FuwCM7p5z3r6dY4QStWLqhFTa4Hr2/kC5Yr3poTCIHUaSdzk53QzM4HoJ4qLbmBLkJSYs6Whmok
	UXpg1P56InvhutI34Oeg74zTYd+wOaP4XwWDG81NtKGmbHi2msOZo1nGRbHtweNtlyPT3cAfG3b
	cpMkont7BKGkFboil3UYw8t5gWvfk5/tlMBwA6ufl93/Q/FBBJER4yD4wVLL/6DPzAJHo6m98lr
	cqKAXZawKUYB1Ck2Py3rpfU9/jr1LVKXn0dOL6s49ELiEad2a9NPeJvRADm+yQaqTdkxtNQvAXd
	MmpzUrjQWdc
X-Received: by 2002:a05:7022:6998:b0:128:dbbf:fd35 with SMTP id a92af1059eb24-130b1b6785emr1279909c88.28.1777979930401;
        Tue, 05 May 2026 04:18:50 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm17247290c88.5.2026.05.05.04.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:18:49 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 05 May 2026 08:18:17 -0300
Subject: [PATCH v4 2/2] ALSA: hda/tas2781: Cancel async firmware request at
 unbind
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-2-e7c4bf930dc8@gmail.com>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
In-Reply-To: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2250;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=RfgrVvknme6vhAOFjjbtHTulvqGle3JEa4VWxijNxXc=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk/L/Fa1/D3LvgQOr/TvCNz0psnhmaM62cdmaLwrrxMX
 yM3IjC7o5SFQYyLQVZMkWV10iLLPV0PrtbHrfCAmcPKBDKEgYtTACZy6RrDP4OES5/L2+dM+bT3
 HpNKnyHbv7oSpryvepclv2+/N6fZXIqRYftsHvU1UVN+MH+9d7brqpuE5A6vpVcbvrQt2bD1vue
 k/8wA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading from component
bind with request_firmware_nowait(). The firmware loader keeps the
callback module pinned and holds a device reference, but the callback
still uses driver-private HDA state.

Component unbind removes controls and DSP state immediately. Later
device removal tears down the TAS2781 private data, including
codec_lock. If the async firmware callback runs after unbind has
started, it can operate on state that is being torn down.

Cancel or synchronize the async firmware request before removing
controls and DSP state. A queued callback is cancelled, and an
already-running callback is allowed to finish before unbind continues.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Fixes: bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 3 +++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..dd1b0cc63ad6 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -588,6 +588,9 @@ static void tas2781_hda_unbind(struct device *dev,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_hda->priv->dev, tas_hda->priv,
+				       tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_hda->priv);
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0e4f3553f273..d243baff95a7 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -750,6 +750,9 @@ static void tas2781_hda_unbind(struct device *dev, struct device *master,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_priv->dev, tas_priv,
+				       tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_priv);

-- 
2.54.0

