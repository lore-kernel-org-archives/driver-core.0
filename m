Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F78285061
	for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785372533; cv=none; b=F3Td0rR7VRNTV8SrqU++TNb//nJjIEYGbw0BMGA1OZUt0MpIVn7WpJRMSzjP3cXCAL7SAbNe+Q3/IZumN3Xyi3stUODI5VmMFMCR/Dku6AVmgaSufIP7oUgOT1GWQo1bs0uckLEPH0dNRzYu2tdYYIZeEPOg+w91tAxKNlUPSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785372533; c=relaxed/simple;
	bh=sfBkuWG7cp9oC7rWjia696a5/wki/gR86QMS5y8V1LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBbjrPZPkXq+P7KFgODWykx2ebrH4nQWhIX0gDUUPAWAX12MW7j5KyrW7/3yWqeJH89WMzpHNG1HjekXJTUpTduaTq47QSswVF4Ej2cwkTPblf+hpgnR7FI8qkwIusSc20YYGJfLHVPOlE/ZJHlxv9i7i5VCW8km2FQR5JMreiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e533aacf2so91548785a.2
        for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 17:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785372530; x=1785977330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amG5+bslRdnIMjojUGahI0L8Zbj6b4FQtBhaxO9WyM8=;
        b=AXFNuZhxhXqxRStQyywODh3xeyJAcJUE653OUMbJGNKTvfI22orxs3iSsRlGWVGTNe
         +8F/zSHFgfHas/7jB45sPDx35lRNxyHiEipH3ec0IP2Ew3vBzN+Rjo6iUsHqX97oXynx
         lfx88eBZ63ggubgSxDMVSEIV4MnJLOLd90fNXUrOlAW0CIqoIhYw3TUQZiaI7oa1UOB/
         GJHDEs/4vjcwVW6o9jt1stn0slyQojbOFlwO+pDVMClfb4XFN6KwjVy6I6xk5uTaiMpO
         /N6JjC8cPTLyTaDQVVNzH1CExVo+7UzwSj92yrsWKCtJo6cIxnrog6JtiyaET58BHceV
         uO/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrxbUyBGY5fvnv3dP6LPQYL3Gv8w9SeFxGbanOe34NDezWc/4P/FOjA/ALMVH3HN0abs/xRipbYz+HdYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4aVjoPcES7B/VC4U3XtfD9jpj3pQqoGaSo67BF0OHCVH5+IoZ
	pEKsM53XZs7kiYDjFkmdY8vUugiG1sd8OEInJgTV2DR6GZimRQ+xj9mE
X-Gm-Gg: AR+sD11wu+R/LY7q/kHKMrKo8rqE6uYbLxd/cmWhzj3yI48powiVknThMiuWQc9xMda
	78JIv4x+63FPvUAYyeGgcegpC8EX/W1k6KTOilCcaLWxGYtLzPBlnX/yd7ohxCiEK+vg77T6hBI
	04Ni00g7Dl0heLD/VRo1HA2Yd115ItxSFPzAk/NjlFbIIKjp0OTEF9/N0kWkPpVHk29n2pJ2kMI
	hj5rnFnXpCjvUtLZn3XE5XFEt9Ncg7VcrvWgSZ8LLDEnoIFsE2yaLTt5Y7Or8OVf76b4nFBd0/K
	TbXwLTGNj27KrBZO5lwWJe1qnBYX//vKx2l5gNl+bl8OIc7ZPtV/17T+6B+fb3T33yMvhidBCtb
	zIjUk3nJtpyrdMw0w/jHyvszIgfGCVMbNRm0aQO8tmRix0kN0hSo2rZUlcRR/n/cAtfJ09TJt/j
	NeLpXPXMGJfsFB1UQAf0Pr/2sLeRePX3QTHxeqsgR+OTMp8OCvIxJzgvmzVzjTLX26GPP1wD4XI
	Cw9tnPvOaXKqESomdgZYMl66RGFiGFuE50JYIZ+6/nbY05uHPMXp1tZw6N7VNqEjv/ypP9Zj3+R
	eMakmlus1KGnVUzb1o21KXwtMA==
X-Received: by 2002:a05:620a:a40b:10b0:928:f440:2dc7 with SMTP id af79cd13be357-93485fd24edmr41612585a.35.1785372530378;
        Wed, 29 Jul 2026 17:48:50 -0700 (PDT)
Received: from Skuld-Framework.tail03774.ts.net ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3225b17sm290329985a.8.2026.07.29.17.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 17:48:49 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>
Cc: asahi@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple ARM platforms
Date: Wed, 29 Jul 2026 20:42:58 -0400
Message-ID: <20260730004759.3089449-1-neal@gompa.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Apple ARM machines (branded Apple Silicon Macs), there is
non-redistributable firmware provided in macOS that is required
for Linux to leverage the hardware to run properly.

The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
touchscreen, and the trackpad.

In order to ensure this firmware can be installed without messing
with firmware provided by linux-firmware and other packages that
put things in the tree, the empty "vendor" subdirectory was created
to serve this purpose. This directory is used by the asahi dracut
module as part of the Asahi Linux installation process to transfer
firmware from macOS to the newly installed Linux system.

This is based on the patch originally written by Hector Martin
for Asahi Linux.

Link: https://asahilinux.org/docs/platform/introduction/
Signed-off-by: Neal Gompa <neal@gompa.dev>
---
 Documentation/driver-api/firmware/fw_search_path.rst | 2 ++
 drivers/base/firmware_loader/main.c                  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/driver-api/firmware/fw_search_path.rst b/Documentation/driver-api/firmware/fw_search_path.rst
index d7cb1e8f0076..ddd945a47fed 100644
--- a/Documentation/driver-api/firmware/fw_search_path.rst
+++ b/Documentation/driver-api/firmware/fw_search_path.rst
@@ -6,6 +6,8 @@ The following search paths are used to look for firmware on your
 root filesystem.
 
 * fw_path_para - module parameter - default is empty so this is ignored
+* /lib/firmware/vendor/UTS_RELEASE/
+* /lib/firmware/vendor/
 * /lib/firmware/updates/UTS_RELEASE/
 * /lib/firmware/updates/
 * /lib/firmware/UTS_RELEASE/
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..1acc5842fb24 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -471,6 +471,8 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 static char fw_path_para[256];
 static const char * const fw_path[] = {
 	fw_path_para,
+	"/lib/firmware/vendor/" UTS_RELEASE,
+	"/lib/firmware/vendor",
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
-- 
2.55.0

