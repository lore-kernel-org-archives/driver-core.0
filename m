Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B83FCB2D
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491596; cv=none; b=q2kP5Dij0Ns+kti/fuDWPKmY876AnDpbS7WlJ9fk9IfZ9i0DzcPwCJ/AH08ZApv3UDotIt7TXvgk0B2YNdMWWE0pRK/cDbyP6HzQjDqYdE/RW0I6g2stuloiYfel+CVxbwKuzMJNFSPTo2plLWwPVjKJPfkzLgM0bkvx6RYMaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491596; c=relaxed/simple;
	bh=bg9znAoidL3T3xPeKitW5n5yYJtb4QN2AQr+a8OWug4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=CvaRd492xdHxTlz7QqQlK3P1jwhAxhbMlJYZ6w5VrXVBkshYnlWvsvw01S+nFjBvnVxWckAyVlLwfE0ASbaIPXjnDDf/zTMhXY3YEVOVPd03wsfRKI3YzVCFfAJmiyaU5Rl+miZkWwuMaQkpbtEC21qSZGh7NaEnMdag2ttPNVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvimXqHU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvimXqHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z6k9bAlUN3GR2gspqeApZc0R2eNHUyrDASVXA4THBoQ=;
	b=YvimXqHUztp6R6UxreormUGUA+6kfC2olplo/yyDX3LNrLDwtz4MtLr1/rOZDeanc5vXRT
	vg55G4ULODJqJz0gdiTkuDkh4q5RPqGNPyVvULHGh/Y6R8bVtzmFOCcCVFktmt939Lz9cI
	QZwpSn5P01Czc+4Lo29Bb/IjZnwTySI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-u0mGwigTOJeVY0Fi8TkE4A-1; Fri, 26 Jun 2026 12:33:12 -0400
X-MC-Unique: u0mGwigTOJeVY0Fi8TkE4A-1
X-Mimecast-MFC-AGG-ID: u0mGwigTOJeVY0Fi8TkE4A_1782491592
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51768072950so12743651cf.1
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 09:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491592; x=1783096392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6k9bAlUN3GR2gspqeApZc0R2eNHUyrDASVXA4THBoQ=;
        b=kMs84Bcy/2mll8/BDQOpIHT5ezl/xruhoJgAMmaXSoj+/IRgzMYBOC4eaSeqpisW3O
         8GrZclrcdtGzwbxVs1rtF/fINM68TO0JZLXrsroRzvSHDAYhXXIqG5mbit0HvEROLzUk
         f/GB06LVxXhdJ7e/z0iDIY2QC8YyciF1+88PYrKvGtHLGT8vTVla07XsdiwTiPymjSg8
         HJD0kMLpgqMUjBnarAAvy5zb1IhvnYbBg54noSdpUvOIGFTiVahb9BOJcNiS1ooqDSCH
         B9hWb2XIs1+GmZwT3VoTc22vQrE0WIAONn6E9kw/Bl8/DfrUMH3Ub8jHk0YA81qSVty5
         gcPg==
X-Gm-Message-State: AOJu0YyCumhydeZS3SMA2BRwzKRnztrG0XMSMKhhZRbq0clhlGpCdxmk
	obdekuGjrHGIB2WYmJkXU84yaJ8017laMJYmj+84DCi/mGKscEpDQvgQc4JRVY6kUtl1yKSjA3X
	eN2OTuWGWKFMcJsttCdXlHh2LtCgOjbS226fkC1MDhZjKvTvNWuFcmGh0SRAV4q+BYFLyO26g8T
	Q/Z8p2GJ+T+EV58xA/OYZN/toFKAuemyGex4/KNv63RNg/E58=
X-Gm-Gg: AfdE7ckYHerVz5jBvGwsyj9Z0cZeCf+yrMyOHHFMKj+T0+RS9vxtXXpq5FGQ9ZJt8cQ
	nOo5eKMjS6OwifdbD5kM0apeQVNm3uq4oPeJMryES2wi/s01aBq9b3U4O02nEmL5scSVa5wapSo
	4ZXErUDGGzFRwMqnvnwbY2Ckbrlr/nwm0Pyg6n1dh+iHA+gBmDReHG6PGDAC5UYr4UScmaPzZAC
	BrpfbCe7/VaezHvFhECTvbC4vv0zvO66ARUaEq+Ycn2k0arilE41PiFz+yAdJnclXd/7naAe8j2
	S+yIRHyKAFVqeEU5ZaSTF6h3ce/c1RUIGj3Upz6wmmBvY2TwejcpBYlbY+5bAO9GVNuPdr4FpGF
	9wirowP/1s3EFC2qZ0kOL+l9zdiKBrZwa10VVtWuPZ1NEuUduww==
X-Received: by 2002:ac8:7f4e:0:b0:51a:8c99:1f18 with SMTP id d75a77b69052e-51a8c99223emr11337821cf.71.1782491591856;
        Fri, 26 Jun 2026 09:33:11 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:51a:8c99:1f18 with SMTP id d75a77b69052e-51a8c99223emr11335551cf.71.1782491589761;
        Fri, 26 Jun 2026 09:33:09 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018566sm234540526d6.2.2026.06.26.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:33:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] clk: implement sync_state support
Date: Fri, 26 Jun 2026 12:32:41 -0400
Message-Id: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswF2JdJVqITTUUFo5EId49a
 fkW/2cQikwCQ5Mh0s3CZ6jo2gb85sJKyHM1aKWNMtqgP3aUN3iU5BKhm5WyVvfO2B5qdEVa+Pm
 H41TKBwBFMJpgAAAA
X-Change-ID: 20260626-clk-sync-state-ad008829a689
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=bg9znAoidL3T3xPeKitW5n5yYJtb4QN2AQr+a8OWug4=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVu6/yxxZGNTU+anKb0WYEWPKq4NtjJltB6tM1De8c
 b0WaqDTUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwESuTGL4H21R2rlfI/2AfmT9
 1uaZAaufLI771ptpemXTtf0m3HEHjBkZlrppH/+y8Pxd1QULVANm6ta93pfv4WKf26rasPMGu1s
 qAwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PShc40Or5Xd61iCOcq2lbT2JtNwbvW8bbd7osxAFbu8_1782491592
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The existing support for disabling unused clks runs in the late initcall
stage, and it has been known for a long time that this is broken since
it runs too early in the boot up process. It doesn't work for kernel
modules, and it also doesn't work if all of the consumers haven't fully
probed yet. Folks have long recommended to boot certain platforms with
clk_ignore_unused to work around issues with disabling unused clks.

This series fixes this by adding support for sync_state to the clk
subsystem.

Changes in v3:
- Allow multiple sync_state callbacks in the driver core via a new
  helper dev_add_sync_state(). This allows dropping changes to the QC
  drivers that already have a sync_state callback since everything can
  coexist without changes. This also makes it so that this can coexist
  with the pmdomain subsystem.
- Only show "clk: Not disabling unused clocks" message once.
- Add Tested-by from Neil and Xuyang
- Link to v2: https://lore.kernel.org/linux-clk/20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com/

Changes in v2:
- Split out clk-cbf-8996.c into it's own patch, and don't call
  qcom_cc_sync_state().
- Clarify comment above call to dev_set_drv_sync_state() about
  the -EBUSY.
- Added Tested-by from Jens
- Link to v1: https://lore.kernel.org/r/20260603-clk-sync-state-v1-0-457120eed200@redhat.com

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      driver: core: introduce dev_add_sync_state()
      pmdomain: core: migrate to dev_add_sync_state()
      driver: core: remove dev_set_drv_sync_state()
      clk: implement sync_state support

 drivers/base/base.h     |  7 +++++
 drivers/base/core.c     | 29 ++++++++++++++++++
 drivers/clk/clk.c       | 78 ++++++++++++++++++++++++++++++++++++++++---------
 drivers/pmdomain/core.c |  4 +--
 include/linux/clk.h     | 14 +++++++++
 include/linux/device.h  | 21 +++++++------
 6 files changed, 127 insertions(+), 26 deletions(-)
---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260626-clk-sync-state-ad008829a689

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

