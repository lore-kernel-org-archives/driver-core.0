Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6B3FDBE0
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491600; cv=none; b=GfYSeLPTpp7/ScYfeKe0LlpC2bt3RzVhPdCe1OXcsIgU0uE8a8D2iuHTAZO6afwvOlmpH7Xo072D6a8YgMi/5jF0/VQPW8x4aD+Kdbk5isS+TFj3DPf/TCnfV5edIvYkOd4iV2nu2ezfl6AlvvreCSwXBtZy72nD2XSTS/g1Oow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491600; c=relaxed/simple;
	bh=0r4awvo3WX8HpQ0jmDWfm41yxp/V5lWErULOVsOPMpU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=SYE/siBP7vT5cB20dUVyEiHO6PZpYHBOziKtd6wZ1VC4VZnva9orZdbD8CnTvv5PCO7esMNpUDpYG9x7Pkk500Cu2D5qtVLNYM7BBUgnzV80zPLyr3TmWFsDJTTiS2MWi7q85HfnsBqVy9/sQluyoxbq5L4OHb2vlVb/Cf7MfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+lA7GXs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y+lA7GXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
	b=Y+lA7GXsp+9jM2uDwl3Ld5hJuLuY2afAfm+B+oC+1JQH4XLTluYBJHPJRUANK/1Ti2eY0o
	P29hCRi220FelqU9faCJxYh0EyPP0E8dMT7TzsoyP1Cc0+zzdgWzTZ7vx7cZaaVjxAOgig
	LMaewfAZZxoFHkhCYi4V9xyDuDTvEaU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-w_nqu_RsNICykfzI-h8Trg-1; Fri, 26 Jun 2026 12:33:16 -0400
X-MC-Unique: w_nqu_RsNICykfzI-h8Trg-1
X-Mimecast-MFC-AGG-ID: w_nqu_RsNICykfzI-h8Trg_1782491596
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e06f4680bbso25107496d6.2
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 09:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491596; x=1783096396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kw3/l9vbkRy63uWAwl6dQq9fs/WXuwY+XB1uAAWGcwc=;
        b=aYC/l10pspR0CtltfsqxErcd3ITfpp+N5lXTRNpRDL5MmSjLJgfdKENjTSseAiweoA
         vucSnFzxSqx16wM9+9PUrNswKuKakUfidoMGFPbkx+Vv11Ow9Ms75UZiPMQwYzeSjaGB
         iXC190BZZUoIYXZMhzaaH3LSr4NHJXLgpIzZNSj2vgPaUnKV7mDViDWLXQH1QLm0U0mX
         Up/b2/Z7QhpWZTMyRaPG1HZZZnVxAb86Ak32W3RmnBJoa9ZQFo+m1wqATX9W0s1109Bk
         pYz5qOVbDXkdh3Wyf9/SoSHFReFjzGrlnN8GLaA0kUiF3fb//2061YGR1QmGc2eQotTY
         egcQ==
X-Gm-Message-State: AOJu0Yzm37Sg0cs4VuLYJfxm/Je3n9o+BES3ZXvsuzr+5NdeNKLab51R
	gQ+I+sCPAifXRsbydFWq1PYf9kOtXqTBOoKe2DXgsvhNd1pOZ7+h0n0KFuNV9GtFbbfe7PyrD/k
	qZfol1TNniHz9e6c649f74YCqO3nAQBAswoqF9QzJTqJnaeLUJl9LQXRKHf0h2TfTt20GR80+Zm
	Gvb7/AEMDBtzPH27GpsPXFeJ63hIji3KrvfNJY47kNl8F+Q5s=
X-Gm-Gg: AfdE7clRB6ptlwHxNxm8FYZa6/iMEh2ovnUY2x8duZxI65AybdRK+P5l6OiGNR7eseL
	57kxsy5ntyyynH9J/zezflJ/bewrEgNcbcwggrUb7wGrtkmFZBZM0/8w6ldTX1Wqojx+p+6kyZv
	tPCsZ2EJT6SySKkN4lSshaPm2u1ptuXd9ZrExKA4Yeadr5LGJ5iYJXspMoEqjwXJBHw1YbSJFx6
	H4MXUVUVaaehGCRuDBl4E7nT4Akhdyu8YX/IJyx9DQikkjDxa7MqGr+bnxkJmOsh3ObOUzudkLF
	nhQaJnCLfKxa1OaZizmKyCSohYXIthVfH+MWAiCTg7lO940sarO8N6AZWTAIHFNSV0/IQqedHC7
	695pj9JKONBI/16zZIN+8HBVjOUrip+vDEsH7jy2w35mkXQceAw==
X-Received: by 2002:a05:6214:f08:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8e6d6288e1amr126315086d6.39.1782491595917;
        Fri, 26 Jun 2026 09:33:15 -0700 (PDT)
X-Received: by 2002:a05:6214:f08:b0:8ba:3fc9:88ca with SMTP id 6a1803df08f44-8e6d6288e1amr126314206d6.39.1782491595157;
        Fri, 26 Jun 2026 09:33:15 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:32:44 -0400
Subject: [PATCH 3/4] driver: core: remove dev_set_drv_sync_state()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260626-clk-sync-state-v1-3-4156d8196dc8@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0r4awvo3WX8HpQ0jmDWfm41yxp/V5lWErULOVsOPMpU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVh4SmnZ/eu+lX9xbTjbc2WlU6P9o2mTu3INrcnQOn
 quTl1vq0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEttYw/LPqCjq9dLLlFIv4
 vS+OMCRdDS6NnFbj9jikMjbqctaWUGFGhoXZFyZ9r5+SOvGeS1TQ5jVLJsy9HVIYb5ivJH1gc9/
 hdRwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DlzSAnSgMtyOJPG59r4kV72ft-yHXEa5HwcIKW5gdyE_1782491596
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

dev_set_drv_sync_state() is no longer used since all users have been
migrated to dev_add_sync_state(), so let's go ahead and remove it.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 include/linux/device.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index b7a3dd4b56ed..7f71217ecd48 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1128,18 +1128,6 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
-static inline int dev_set_drv_sync_state(struct device *dev,
-					 void (*fn)(struct device *dev))
-{
-	if (!dev || !dev->driver)
-		return 0;
-	if (dev->driver->sync_state && dev->driver->sync_state != fn)
-		return -EBUSY;
-	if (!dev->driver->sync_state)
-		dev->driver->sync_state = fn;
-	return 0;
-}
-
 struct sync_state_entry {
 	struct list_head	node;
 	void			(*fn)(struct device *dev);

-- 
2.54.0

