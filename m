Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C019A3559E1
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 21:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583735; cv=none; b=mKNqn94KubM4ih3XhmPWPH8iqRXLwbnrfQpAa5smJdo3ioCAkGpzsyuN3v16vj37M6Yv5ccV3ECcBgnDwriit2V1jUx3NGe/pycc04tXjIuJ511MadRAN8yqSe8kCDQY0I6rvyg8e75zc40GqaYLsdDuw3IPacjUbIpKMDMAeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583735; c=relaxed/simple;
	bh=a2/4NZb1cq6S5TUZgGQmvZJsMsttNjgFGxtg5rSSmVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwCxtqD9ozZelUPnuNUkOTYQ3dC/tOxy6C2C8pgeemqSlpjrvPEguNESXwOn444wgOrZI54kd4DZHNjBF0bf/MUnqrphHW3w7L52qnNoShHZhL1971PYQ7UWo6F6AizB5W9O5TUfrmGoKqBYlUVhM+vzxy27lkcv/E5TgduuXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiELh0/E; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiELh0/E"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c8f9846c8so1983367c88.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 14:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777583733; x=1778188533; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5HU0juTrz/+bwfhVRVrLsU2IXIIJwo9lCW9lyuPHrs=;
        b=fiELh0/EN63H/22EwpJ/LVhVd01DWCbF3CXvNF5woPG8hH/mFEoMMdmFAazn0UdCME
         mSU+va5hMC4oTqBVgrqlS+xTjYe4blQFPajTxmjxtovDhG4j/lB4IOFk5mEFguogejij
         jtdc67VnUxJSdXHNgZLoSgKdu4d5Tr7ryn0ywp6nh7Prd7lCMLUNsOyKQhSNw4KLDyPk
         YQfOf2sRlMX0R+LQFEEsLWb3pLjD7Yd2Y3PxceIR+nvCWlxq+ejXJy+EGq/M57EczzW6
         0SRJ+lGbX5bqNq4hpnfnFJdosiKuPqkgACkCUfiD4aU0FTlqALnL/1Lk4QFSZI4s29nD
         7/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777583733; x=1778188533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u5HU0juTrz/+bwfhVRVrLsU2IXIIJwo9lCW9lyuPHrs=;
        b=W7e2jpyjsDPwP1Xee8oPkwn0tpYSr0BLXO1ViYWe2/YwG2phuDy3Pmdz5kcYbPEpFG
         QV+dwN+dszwLZgi6cCQoz4IW1p87/8IeIsl9xgBJFsU2LTMGBFplZNZxcD99wpvxk25N
         X7IyEBn09fyHcwq371pklgMSP5kxeNaLgdZq7R70oUJ831jzwceN85YiUPwLZt9xXyMJ
         aHq1iOheldfeHCryAy4U9MjPCceTbV1zi+FYY8CYnZYHKQyCRbkXUf7ua4lJ8horPXEA
         qqCcq9rSn6A7UwjC9w+nKrhhNOb7j9JJiFJyPgBV/LFDfGcTVkNAkVovcDZjfgxhuDjz
         PjIA==
X-Gm-Message-State: AOJu0YyPAC4jbnc0TZs7p7f3tLkvMySzRV6KocmH5LozAJQN0Kl+p22s
	ATUwVdJijl65sbKvZ3wjTGNhiPIb8w19X4v1BYxIEc6Z+n3OVCe86QBZ
X-Gm-Gg: AeBDieupAd37wSMwxf/IItHiXF2BMitTwpTzTEVde8LRcsWz8pQY1aimyQx2i3GiBwN
	DjoDGw5BPkVYETR6m/y3jTyVPgsJpQz51HnQxw6zsWS94GFuekRU6GGjvzagSk2NJabc23fVaGN
	2beQhnAXKhJyeRSfSSwlJTa3jWShO9hRpYSsIfDZoNFwirnBNDExRUdXkP84/14Rfn4pnC+4kyv
	U9IZpwkNy/DQ+8BXSZnlvzEQ5MeO1QdOjOsWSlElugfaA5o6EkAakZsVozH6O6wG8leiYnY/Who
	22UVsrnjWWhxOS5+IQN+2pEv82RDsa2Bj6YYi7oH8bU2wi1UBFuyqwpGduykJmm+WI0E2btNHAT
	Lvypmqhwagh90qajcW9vJnsvBmlvG0kEnrl4Pk+G5qdLlu1/aLN8FtJC658dHvrmzM3IcHVVOD+
	3m1tEj/SCe6uOREHtLHzb64I1dj3I3aHSYiOAWRcmzHB4qINB5PDSTXUJkn3tvBWydxnmSGKJlQ
	L6TSFCwarSC
X-Received: by 2002:a05:7300:cac8:b0:2ce:25be:c8e8 with SMTP id 5a478bee46e88-2ed3f15d4e0mr2351042eec.17.1777583731421;
        Thu, 30 Apr 2026 14:15:31 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm1581959eec.22.2026.04.30.14.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:15:31 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 30 Apr 2026 18:15:11 -0300
Subject: [PATCH v2 2/2] ALSA: hda/tas2781: Cancel async firmware request at
 unbind
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-2-2c7d89cb3175@gmail.com>
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
In-Reply-To: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=a2/4NZb1cq6S5TUZgGQmvZJsMsttNjgFGxtg5rSSmVY=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfj6W+ZUkUXdEW9+/VnoZpvg5rn7+9absxJKC+v2dqp
 7FQ6bGDHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRL3EM/1S+9qy722QU1d+t
 lBwu6vzwg32OG3/QW6Pp0zpMxRWZvzIyLHQPWvF4+95dJxoMtv6+VurxX0XFy3vVFMfrmtktnYk
 feAA=
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
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 ++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..34c6940f3521 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -588,6 +588,8 @@ static void tas2781_hda_unbind(struct device *dev,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_hda->priv->dev, tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_hda->priv);
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 0e4f3553f273..6b0d6c764009 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -750,6 +750,8 @@ static void tas2781_hda_unbind(struct device *dev, struct device *master,
 		comp->playback_hook = NULL;
 	}
 
+	request_firmware_nowait_cancel(tas_priv->dev, tasdev_fw_ready);
+
 	tas2781_hda_remove_controls(tas_hda);
 
 	tasdevice_config_info_remove(tas_priv);

-- 
2.54.0

