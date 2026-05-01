Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77EB386C3D
	for <driver-core@lists.linux.dev>; Fri,  1 May 2026 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631168; cv=none; b=HoDIKM1UyFH4ar6y83V6y/MEsKIQi6z+CsCN++bChKZvG0j2kFPwbYByrLVNu1gGunpadiHtq+jeQMyb0QKlzLHOtVsSan/6NlyRxuGLeV62FcNtdr+cUg98LbnsSVaZhnFBGTY07c6pCnTndDgYAu49WjKknnwjCk+abuAy6gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631168; c=relaxed/simple;
	bh=z0mD3CVCy+SQRCqq4yIGoWHFKe/By3TKbOqiG7c//BA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s6Kl7w1pxlaBalJH3ZYsoAhtjtplyu7qLH0lUFYlWBJrc53EBxK/dPvbX70+1x6+ADjKJR1dfbK1gBGO8mNU03R6d6gnXTXDi0S5BRf5HNQS1Sd/3cUloHGZ7RYEx4M176QUvVbT0i4RFMBeXyNZJAVPtNzAIqe97si/X+PnlV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0sYYVQ8; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0sYYVQ8"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c726f46baso2873165c88.1
        for <driver-core@lists.linux.dev>; Fri, 01 May 2026 03:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631166; x=1778235966; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCk1H00mEV7897HGRKRA9ht3ytPF8oITdA6iPUlnZ0o=;
        b=Y0sYYVQ8zivf53Eaf7MpmEbF9wL8LwkFjqGAu/WtH3yDSRHndpGNH78aQAbe6jdKk/
         EiXl2Fx53T3AZ0ffQDNHqTmrYKg1EVcNWgG3t5Yxv9MqDVz66mXmLhtmYs+0eZYb5W6j
         g4vOr6O+MAPsFhHu/IdBXQUhBlq98KEvRhqrWRDW+rTFjqUFFP9JgWDy6hrKgFapaDvb
         IePmhL/xxV4rs2qs6brWZmfpzyqh1en0xKBGFfWRVIOLDpmjOquzr6JUry70OM3TcgVr
         uHf3I0ZU+PG7TVTMm2BnzK3gbfKiizgUTkaFlYfNWycYLmquih6vdfomtMMPtkMDDY1Z
         dOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631166; x=1778235966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCk1H00mEV7897HGRKRA9ht3ytPF8oITdA6iPUlnZ0o=;
        b=lQcZXSX2n4eeZdqVcCphhRVRoeqGY3ozqscVdxojViTDJpsaqMmvLPy/C+DfoheViX
         Wu+g977WMCM4yW5WUco3kLRonTSrVjFm/AH2uG/CZm7K3nKzkCl3jzg8+JTroh46i+38
         /K/GQIQCqqcb5baxaiYxvy4tChnLVUrLjr1KfaVNrg2GfAI4Cd35worb25dp6dFVqUsx
         7h9iVvvRWG7Y0PdmlRNg1upiMWtawlQp6InVVrMRQO5dUQ94yOXk1p/H+SA1Pn8+pxB+
         04iOpDIr9+iS3VX2ZLA4WMdRlqI2LYto1jvWHJfiUxknLBXL/Zv3ENNa24Ps6tbxC9hz
         Mdtw==
X-Gm-Message-State: AOJu0YzQfh19FK8qO4FDH3tyIJBj4mfLz08Vyt3iUmIki2VyFNRwHup4
	yc5dF4VfgKuNyjatHUDhblX4+FvN/q2+yhh6JDgAFsIfpu8JP2pQYXnX
X-Gm-Gg: AeBDies6akLXtXjTDDsEZzeEDEB9dKgsVjoaxQe476erl5XAKXIh/5tDl3ai4erKJ7p
	kaN1LBtp4danPEGCm9QfMi30oMz6rZitCUFoc+sUyLXghOTICG8xrg02MMRae0CATGIwLO+nFyc
	sBK/WLb2tMK0Jgh/TeRW9/5PylV2P6chm7/2IU6kDElR5JaKOUwI3H/VKVnoeT5oh/yA7N23iWa
	PB5G89l1rfhEBKrrjTLj3ZbfrWTuZ+GGiQyHQEHyTGyFAyCeZz9ds6AJmS4Gv+n1Yd2wIdvdd/w
	hB0ko4quDfk47lo18gbrqGgOkQdlTWswL1wjRbhTWC9oBmFaW4EhFw7RWiX3bXgcMQEds7h8Zis
	9Shi8ph1Oxf9fQUa+m+nNaKa/V9BM1o2OKzL2Lm9vQLn3Q1k4yqtQNMTY8AFEqke6r0yNcC+7i1
	Zsv7E9zHF+S9Hkl8pZ/mhLh2QP0LnUqcG8uGEWwUqNJXFkTfhH9XMWqKRJu0kHufXfIh7TOfxTg
	wRBadF2jRDQ
X-Received: by 2002:a05:7022:f40b:b0:12d:de3e:86b6 with SMTP id a92af1059eb24-12df82989e7mr928285c88.38.1777631165731;
        Fri, 01 May 2026 03:26:05 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm2621191c88.11.2026.05.01.03.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:26:05 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v3 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware
 teardown
Date: Fri, 01 May 2026 07:22:11 -0300
Message-Id: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OyQ6CMBRFf4V07TOdpOjK/zAuXgegymBaBA3h3
 wV04dK4PMnNOXck0QXvIjkkIwmu99G3zQxikxBTYlM48HZmwilPqeQMsIoIpUXoMHKVMcgHMFh
 VGs0VOofBtkMDQqtUUqn1nmdkdt2Cy/1j7ZzOb453fXGmW+TLovSxa8NzPdKzZfdpCvpjs2fAI
 FNSpMqmWjJ9LGr01da0NVmaPf/LyoECN8pme6MFU7tv6zRNLxusuNZCAQAA
X-Change-ID: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2987;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=z0mD3CVCy+SQRCqq4yIGoWHFKe/By3TKbOqiG7c//BA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlf6jdZr3Ocskv3UelJ8YC5IjyzNG98Ximi1sdTffNxn
 mINT+XzjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIyVKG/yVqK+WLZL55nd98
 5C1DZPk9Pafq30zpP9bOX5F2U6fPhZPhv8dk1q5dT10kLcQqtvf0G+3y2Ti7eInHwXhW8bT9l2z
 ucQEA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading with
request_firmware_nowait() during component bind. The firmware loader
keeps the callback module pinned and holds a device reference, but it
does not provide a way for drivers to cancel or synchronize the queued
callback before tearing down driver-private state.

Add a small firmware-loader helper to cancel or synchronize async firmware
requests, then use it from TAS2781 HDA unbind before controls and DSP state
are removed.

No hardware runtime test was available.

---
Changes in v3:
- Keep request_firmware_nowait() manually managed instead of making the
  existing API implicitly devres-managed.
- Track scheduled async firmware work in an internal list protected by a
  spinlock so request_firmware_nowait_cancel() can find and synchronize a
  pending request without weakening the GFP_ATOMIC caller contract.
- Match pending requests by device, callback context and callback function
  instead of matching by callback alone.
- Avoid the devres_add() / schedule_work() ordering race pointed out in
  review.
- Leave devres-managed support for a separate devm_request_firmware_nowait()
  API if needed.
- Link to v2: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com

Changes in v2:
- Add request_firmware_nowait_cancel() in the firmware loader instead of
  tracking the callback lifetime locally in the TAS2781 HDA driver.
- Keep the TAS2781 change to a cancel/sync call in I2C and SPI unbind.
- Drop the unrelated cached kcontrol pointer cleanup from the previous
  local-driver version.
- Link to v1: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com

To: Luis Chamberlain <mcgrof@kernel.org>
To: Russ Weight <russ.weight@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

---
Cássio Gabriel (2):
      firmware_loader: Add cancel helper for async requests
      ALSA: hda/tas2781: Cancel async firmware request at unbind

 drivers/base/firmware_loader/main.c            | 71 ++++++++++++++++++++++++--
 include/linux/firmware.h                       | 10 ++++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  3 ++
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c |  3 ++
 4 files changed, 83 insertions(+), 4 deletions(-)
---
base-commit: 1bc46462f4c09f8d429ae8ec17f92886d604659f
change-id: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

