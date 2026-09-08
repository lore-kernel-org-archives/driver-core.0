Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC5459B663
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889676; cv=none; b=R6xUUSs/HopZdQr2XuozmA1+HSKDuMI12nUTqsZnz/v4v3xdzXzc3MK7GqRelqN9VtHyTPcQaaVFt4JvmuEqHPYGSdORlC4C61kI/2+wY6Dmw0uBpmhNGumLDrgvz5ZNNubL1mAuwYwKOv4e65furx9O62/frJhU8/ClZEmnHho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889676; c=relaxed/simple;
	bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=hS2k+TWQQ2NQdH7dspHSf6fWrlbb0SL1oLeOHgrMxxM8HY0EBpY7qDWMFvZoUkNhhyWJFFNNsSRuwOiCJ+oeYYJe2/wTwHuxwzBUFryLxo2jqoMnG2B1oLB7KIFP5n0+yAs2Se/TF++TpxMIQyWzTVI4R2y0+9HuEQlDSAfc104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N01awWuc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N01awWuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
	b=N01awWuct1Q/NpyuCxN1KbPFeKAwwUMYIMyXF6YMQaMq8BZZ5F8+SGasmffaFbZXKBCYQC
	ZBrddybfihiNNfBb7fRvqpL5NfbX6r1FLfE3OtNK4TDSdODozZNjGBJcaBsiezxXr8HoAv
	xA5vE3+RCX5R6hR8P6hJeDn/t8tRA3w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-eYb4TJt6Nv-gk-h2msRPHA-1; Tue, 08 Sep 2026 13:47:51 -0400
X-MC-Unique: eYb4TJt6Nv-gk-h2msRPHA-1
X-Mimecast-MFC-AGG-ID: eYb4TJt6Nv-gk-h2msRPHA_1788889671
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so487697585a.2
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889671; x=1789494471;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=ObrlAJVmIgLy8P1+Upcg/J2MZN8TlOTUCcz3wOYGoFxOSx99fH5d7O8Bz7MYeay7V7
         oynPPJ88HYecomz4kGsZ21HVWpGdD9Oiv8ynb5k+77TnTd8tW3SFQQcZdsdcCwUes/e/
         OgMFfwtLgTEZC7Wsq5+pJBYndyaZCYqnQeqqGK2ca0rn4wLlwM7aTpKsgNGvadHo55Eg
         FIqlYX5PdTY2m28sGV6ejsuuIREjzOLQlVfN9EIzsK85ve61fCPXEmt8WHssyX317aiK
         MWCL1S2XsiDYLFGlWeq5vK6KNBoSiRcvk1Bkb5k5lQm7eN2omYXATQd+9nZE6Iut+l4X
         6BPg==
X-Gm-Message-State: AFuF++m1GPyQfN5GWEfk2oSZfYEXdmMGfH0T/E8qQ8DwQHDqHYZl4wr8
	LUTuPhL06DoFM57YvUacOzYqykFwjHgFz5bt6UycFWWnTqDOwrPbpAo9OdLRbjxiKf2qFgriZZj
	p8wRZm5vOkCF6woPHcdkEy4U//XNPjPKBpgmUIXyNOcFjPYLpBlQKT1Fa4THB70eZK3Yj4Pk/U7
	P12fdiP4Ae4BrM2hNEzB/zStqaTyyPDzv5YinNF4lWJ6WusmA=
X-Gm-Gg: AYBFou11LEFSaF+3t1GJNrpRANqQsTkfFo/tjwaRcf9L2kcB5b31WxuhWVTCop3wpS3
	9VJqbSO95D7mBQQaLRssbSbjoFD17WmtVsKqzA8Y3RjzPo82b5vA0VCDXzWVLTw9Fy+0hThcrH1
	qeJVPke6pFhCvrrHkChlHvLumcNHYkjcw0yS70u6xUJEDemkcboTj5P1kks/WB1gxctTC9h1Fgx
	tApB4VuXcXj6RHYWBzHi+xHX00HSS/cM2EiZ6gY4TZHm/AlV0KY0YH47gZwSvdcjBzUglQN8GLC
	+dPuYeFpdOAgUjkqg8dHLuqEJ7XxKRIUwXVP1JavCYq2siQZHhA2w3yeQ0HC5uErMHZz+HcqLkl
	i/gAZRNw3Q0sFo20r67uuRjjjiD28hAfXd0QbI94=
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317502885a.32.1788889670853;
        Tue, 08 Sep 2026 10:47:50 -0700 (PDT)
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317454985a.32.1788889665304;
        Tue, 08 Sep 2026 10:47:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
Date: Tue, 08 Sep 2026 13:47:17 -0400
Message-Id: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwML3eLSpOLK4vjMvMyS5MScHF0D05S0FNO0JIM0AxMloK6CotS0zAq
 widGxED5QS1ZqcgnIGKXaWgApYv2WcwAAAA==
X-Change-ID: 20260908-subsys_initcall-05dfd5fb0f04
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeJmuupF5qfh/577Yn+n6AlwhRTy8z9+nMK7UN53dY
 njB8hdTRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5y8DwV+bCmc9hUzsWllQ3
 T0866pnk3+b3w9Wt4l5L02+uoEu3rjAyzC//cKIqLmHOvw/rd5y/xuD2JExGfTFbQpY2n87nG8c
 fcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4icJsFeQMaMh_vY2qrm3G5jXrtoIu5lrQFPpHY5ZAOM_1788889671
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

There are a fair number of clk drivers that are registered at the
subsys_initcall level since some clk drivers need to be initialized
early for other drivers. Let's add a new macro
subsys_platform_driver() similar module_platform_driver() to eliminate
some boilerplate code in the drivers.

This series converts the Qualcomm and Renesas clk drivers to show the
code savings that can be achieved. Once this lands, I'll convert the
remaining clk drivers this development cycle if all of this can go
through the clk tree.

Outside of drivers/clk, there are 364 drivers that use subsys_initcall
and I am willing to convert those as well starting the next development
cycle once this lands in Linus's tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      driver: core: add subsys_driver() macro
      driver: core: platform: add subsys_platform_driver() macro
      clk: qcom: convert drivers over to use subsys_platform_driver()
      clk: renesas: convert drivers over to use subsys_platform_driver()

 drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
 drivers/clk/qcom/gcc-glymur.c          | 12 +-----------
 drivers/clk/qcom/gcc-hawi.c            | 12 +-----------
 drivers/clk/qcom/gcc-kaanapali.c       | 12 +-----------
 drivers/clk/qcom/gcc-kuno.c            | 12 +-----------
 drivers/clk/qcom/gcc-milos.c           | 12 +-----------
 drivers/clk/qcom/gcc-nord.c            | 12 +-----------
 drivers/clk/qcom/gcc-qcm2290.c         | 12 +-----------
 drivers/clk/qcom/gcc-qcs615.c          | 12 +-----------
 drivers/clk/qcom/gcc-qcs8300.c         | 12 +-----------
 drivers/clk/qcom/gcc-qdu1000.c         | 12 +-----------
 drivers/clk/qcom/gcc-sar2130p.c        | 12 +-----------
 drivers/clk/qcom/gcc-sc7280.c          | 12 +-----------
 drivers/clk/qcom/gcc-sc8280xp.c        | 12 +-----------
 drivers/clk/qcom/gcc-sdx55.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx65.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx75.c           | 12 +-----------
 drivers/clk/qcom/gcc-shikra.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm4450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6115.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6125.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6375.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm7150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8250.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8350.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8550.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8650.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8750.c          | 12 +-----------
 drivers/clk/qcom/gcc-x1e80100.c        | 12 +-----------
 drivers/clk/qcom/lpasscc-sc7280.c      | 12 +-----------
 drivers/clk/qcom/lpasscc-sdm845.c      | 12 +-----------
 drivers/clk/qcom/tcsrcc-eliza.c        | 12 +-----------
 drivers/clk/qcom/tcsrcc-glymur.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-kaanapali.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8550.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8650.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8750.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/videocc-sm8750.c      | 12 +-----------
 drivers/clk/renesas/r9a06g032-clocks.c |  8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c |  7 +------
 drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
 drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
 include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
 include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
 48 files changed, 107 insertions(+), 487 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260908-subsys_initcall-05dfd5fb0f04

Best regards,
--  
Brian Masney <bmasney@redhat.com>

