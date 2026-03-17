Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163C19AD8B
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774990; cv=none; b=kDc+JPk9PW4edIjKJiaEtXXMjvMDx5WJai1xzAMzFgWdgQpw0sd2TQqboEUICwgA9/CQMmgb0TgBP4vzd7YZdirSIaR0nG7s8L4NCn8koOXG3u7G58ISJI8v9lbwgjxT3mdZU5wCKQ4bAvnufD+MhiaeF+LdSTGl2MtN4OzMF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774990; c=relaxed/simple;
	bh=AusvSwUyo/ia4o9pnKiDXYbXSTW8aHRzRq2lgMTLrHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uv5JSmGVxL5j34k7Lg/+h4S7UOnEwXa4YSwUMal7Ubvs+7ALhhtbE1P+stpmUkL50D0/88GvibGWI/2XpmoH+pBFKBh+z8ZMYznLqWfhoViXtkIbQMt7Y7i1rTLtedzLlGcQSvZh+3lQWn1X3HVufoiYvVEFYgbR2MsFhg4tTsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMxSUhmu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMxSUhmu"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c73a12af63cso3747408a12.0
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774988; x=1774379788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNksHD/Ia/lI3PwtOgNwKe8s7JojbqFZYiYVCtaCE+Q=;
        b=YMxSUhmuW1OfK0mF79ZzaEKjpf3MbI68v7d3rVFn1a5EHtXW0Ng+ZsIDCgUwdXkDSX
         Ur37JNXLzvf+rAWYrGLzPZhlRAonvMVAUgvH0tmfajkK8fSmSR77QX4KwyWBMmlMSoD7
         lQBYAlB1SoqmYOXA+VPNqoL85M+Cx817HpMz9wY+kaDVaJfMosDFTOmpKhWxavu4dE8D
         AezNFKPccgVS0END4vJriOPam8j0BVT79dYKk/cEVy+LiMwRFZMRmnx4slAMaRSQWcId
         1XEuBtiQ/BkdFYNT+rOn22dcvRO/ygNHrUSy0Kz+/rP15ve8WOcmvvsqnHc/mUySWJYH
         daXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774988; x=1774379788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNksHD/Ia/lI3PwtOgNwKe8s7JojbqFZYiYVCtaCE+Q=;
        b=P8o0zKnSUgoq838qoHgKPnwEEgQxhKjlrwaiTq2Mv0hvbYTgpkmkaz3N5DowiC4vnW
         KTRePqy6OYyMfSka2PWRGw5FwQwgN5bsLUlgWojZiuAuMz9JF9zeHn2Yt3RTGW8QV5hk
         n8e1HPY8oAG4ANod5LclUq6BWaUlBFdai4ecZOQ68mTLd5U5ca8NYnPoeSMc+6NXCdvK
         Gtj8A8Fl3AgUFXmibg20tZjIavAnWwq5qkhOmfYzytZigXBX2tDm8Xu1IJDDMBizEkeX
         3850zlspz+5glI238qhSvLHPuOkMfJP4IVj/51CK+4dQhDNXvKhYMcapbWrOVMMDZbOv
         r3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZt7TnMRMStln1hUFom471LtgKNMxAqHePXn37KJid3Edgd+xyqyZHr2HLT0B0qduJ2dWNBHrOo6VWAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr8m7unDJjbA96i/pPPs0qqvYa9K4sSJwEXyqwgQWuob7robFp
	3Wj8yFPvqrxLkf6Pmu+0clBi+SIbhH8Jn0JrB/UMZyNTTasYmI80ar2v
X-Gm-Gg: ATEYQzyS1N418U2IlKIuY2wW9hGYUdEUtkB9FzlwldjpdtIvVA8WBhdI8AgfF9M7WGG
	tO0xvBgUhC3p5lHQqg6ylhLYaHy9ZJGFuqv2vRI4atsiF/F7uKAfl2QlDew4fLEGy5i0+J4qSHZ
	+ubWGOQi4tB6ATJEfrGhTtnUcRAH7znjAoA1rI2XQ/VU4GnUNxpK9gytJGQXpzq7gHeSPLe+7Yk
	hnKppReW0zmNhUJWQvAJezoTfowtTajrOCLptvmmwS175hvnAA2hGNg4900jG9t/zZ8BxDfR/8W
	kxQnLLMc37yjfPiOfx7IbK/xhNYBygZKxZhoR5EOCO0rTU7pxTo6vfEu15IpGAEEAxpVYPAv2jV
	e0QAiT25TZEGHqlmLJXRq8cyVpPWgZEKKicWMATIYKF9Rug4a8Mq42tFn2qni/isDk2dPVEoC7U
	+ehA+Nxkw5hIcpvKGgDXmZsSbQCLUlKg036k2TKb4ufMrGhV0xE8I5UHMyOUGJhO1O7Kw4VMFHd
	2Q3vhi8av8ZdTP2kO2NRROMxFtuopqIf4ll7KRBwDfZ20qfzLedy4fAZUta9ZpyWDKhBjdS7Ol6
	i1Vz
X-Received: by 2002:a05:6a21:398d:b0:39b:7f5f:d591 with SMTP id adf61e73a8af0-39b9a0c86ddmr341476637.63.1773774988182;
        Tue, 17 Mar 2026 12:16:28 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e546b01sm334350a12.21.2026.03.17.12.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:16:27 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org,
	jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: gustavo.sousa@intel.com,
	demarchi@kernel.org,
	jouni.hogander@intel.com,
	luciano.coelho@intel.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 4/4] drm/i915/display: initialize string params to empty strings
Date: Wed, 18 Mar 2026 03:15:38 +0800
Message-ID: <20260317191538.43535-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to debugfs_create_str() causes a NULL pointer dereference
upon reading, and is no longer permitted. Change the default values of
dmc_firmware_path and vbt_firmware to empty strings ("").

Existing code that consumes these parameters already verifies both
pointer validity and string length, so empty strings are handled
correctly. Furthermore, heap allocation is not required here: these
debugfs parameters are created with strictly read-only permissions
(0400). As a result, the debugfs write operation is never invoked,
meaning the static empty string will not be erroneously freed by
kfree().

Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to display params")
Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parameter under display")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index b95ecf728daa..0a8cad98d480 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -23,8 +23,8 @@ struct drm_printer;
  *       debugfs file
  */
 #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
-	param(char *, dmc_firmware_path, NULL, 0400) \
-	param(char *, vbt_firmware, NULL, 0400) \
+	param(char *, dmc_firmware_path, "", 0400) \
+	param(char *, vbt_firmware, "", 0400) \
 	param(int, lvds_channel_mode, 0, 0400) \
 	param(int, panel_use_ssc, -1, 0600) \
 	param(int, vbt_sdvo_panel_type, -1, 0400) \
-- 
2.43.0

