Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E243E5EE6
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967997; cv=none; b=uOViIUnXCJjDaDn+L2+Z0by7Lpe42EJeWXLXB+Rw7ZEy2DD0/uAr5jd0sGNwNu2aL8/QRxSEFMR2sIyCXe8Lf95bjayml/FQ42nd0BkYH/k5H8TEo7nCQE8k/IoMGZNmtSqG1hu3DWVSz6GHTf/dYU/2AXnVKkbSndiDY87+zFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967997; c=relaxed/simple;
	bh=Xahz4rCSk/k2rCm9VfiBiTcsTqm1OyzAK1YGe8W7PNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOKFIwmjO81w6VTCLb3/qHjCNgnChS3+tvRc8oRhy4WFj03tU1chY1PPM5RMd+NW4k23vhqL4Dex8qoqz2kCD8t1TcRtuAVxhZrNF/bygcdvd0Ms7IODr84wtmPPLjhe4JqbM7DLz6YEf86es/DiV9pR0JNbsB7I5LNP63RU0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1z0KQYd; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1z0KQYd"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12e332315a8so7283094c88.0
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777967994; x=1778572794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hikQBulKv4h06dEW1pjIppYIH0338MvOaKTFQrLvwQ=;
        b=M1z0KQYdEDQX6MrgtcG98KYyWrXlpTMJz2hj4cY7oSE9eD4WRwEGRgi6hLzmtA9qaU
         PZm7oPs4k25xseYFKtlNRnbePBZ5XBro4mc3/9GcgSmroEFwAOZA7fSkdfA34ptm+KMs
         nr6ldo1w+C1AKiewsV95PkB3VzoML2RF1fuRtvWhUfWC9ImklccOMhpmhFZEQT6xDgey
         cPWq1PyGmAY2cDUsPRe2GYMsJr81qduyXQqm7vci7MEzu2K4IKySrG7IHjqxKYRR0gw0
         mhP4aLJSnt+kwa2KPim4TNvSnKu4upoJ+BCOPnN2MFHiXLN9mEMYYzeY8i6I12TWT29j
         LmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967994; x=1778572794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hikQBulKv4h06dEW1pjIppYIH0338MvOaKTFQrLvwQ=;
        b=lNrXtN1Sbr6pRV8omRYITAF9SlyQlgzGZe3jOsfvB44tXPbPkgsDFO1XxCZfybvUgB
         K85wCAbIx+maoX6odj5QazKOY217+4kQLJyC+qFknUlucgEsTbH7SMQOjjnGfsElJNgX
         1maJUv5KYFs1QUOP/e/apyi4wQykvBUNzIRxWdPS3+2Q73GWVwYbb8a5VdVujJFtwWrm
         3bOlc7Gkr/W8pOqmXAp/qDMDYyunfAEpMcHsjf+jKhXj65jZhllAUKo05mDrIGFxae5I
         yyTURUnCtcKt8CJpu8CLl//tbA2ti62Apb/wgign8hRQMGi79gsbnQA3zTZxclIeCz/z
         0wwg==
X-Gm-Message-State: AOJu0YwWH+qdghJCfoR7SfMIlbsVFmnqY+uHfmotMQm2fTAcHhwDoFwB
	fHbRLX2VtyQBFGMp3cMmSdfJfIBt74+YV6DwKxIgMCehPj1cGjZB7SfPnoHRWxx+
X-Gm-Gg: AeBDieu1NIPFxZs2fcwfyoNOgiJ9esCeCq1SUTbuP/E9ouc55lUDg2C97I3GrPWKd3K
	Xlkmj3MDn4QFYI3/L1k9Id+B/tUMLeo5qrletuRAYusfatsQXZaby70H9mnzAOH2b02CV/LHEkF
	Up0MNOXIwghenDi+5Z/lBaBa/rSjSEHH+U7qLZiz3NDm469siDIlDmZQtdpLvXhOotyoNkoRqiR
	DmK7WaNCJhVGxLMfVhc/ow6XwR5oViFLcGeMnFyDgADegXfGx6X2pcIYA8nnviy1LA275S5WV42
	eIy6UIaMbJGAl5xDoOExV9g4BxvQtiof51cCXm7iyXVYPGQipcXLOLTaof2IgiGPzSMmHD/XLv3
	OkQ08a0tlsmxYeVaM+9Nty2iydpcBkBd6xgwpYA5820dZhsEICDI5ztK8Pn5cwEJ+SIQTz65re6
	OKGplUzXCk9gNbQgyL8MT30JETGRyzzJ6mNveFzejIZRgJjHdT5lGYvXktrdVpj6lInY5/enD9H
	JztJKbPrZkIBESIqloZz2NtwH5kVqbLUPXvZaO0lyHLpw==
X-Received: by 2002:a05:7022:ead2:b0:130:9b78:b17b with SMTP id a92af1059eb24-1309b78b543mr2263345c88.38.1777967994255;
        Tue, 05 May 2026 00:59:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bf6812asm19071678eec.28.2026.05.05.00.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:59:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] cacheinfo: move cache_setup_acpi to header
Date: Tue,  5 May 2026 00:59:36 -0700
Message-ID: <20260505075936.183004-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cacheinfo.h already has handling for acpi_get_cache_info to be a static
inline ENOTSUPP function. Move it there as both functions are in the
same boat.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/base/cacheinfo.c  | 5 -----
 include/linux/cacheinfo.h | 8 +++++++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 391ac5e3d2f5..ca7f266729d1 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -366,11 +366,6 @@ static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
 int init_of_cache_level(unsigned int cpu) { return 0; }
 #endif
 
-int __weak cache_setup_acpi(unsigned int cpu)
-{
-	return -ENOTSUPP;
-}
-
 unsigned int coherency_max_size;
 
 static int cache_setup_properties(unsigned int cpu)
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index c8f4f0a0b874..73ab4a6e3551 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -86,7 +86,6 @@ int early_cache_level(unsigned int cpu);
 int init_cache_level(unsigned int cpu);
 int init_of_cache_level(unsigned int cpu);
 int populate_cache_leaves(unsigned int cpu);
-int cache_setup_acpi(unsigned int cpu);
 bool last_level_cache_is_valid(unsigned int cpu);
 bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
 int fetch_cache_info(unsigned int cpu);
@@ -106,7 +105,14 @@ int acpi_get_cache_info(unsigned int cpu,
 {
 	return -ENOENT;
 }
+
+static inline
+int cache_setup_acpi(unsigned int cpu) {
+	return -ENOTSUPP;
+};
+
 #else
+int cache_setup_acpi(unsigned int cpu);
 int acpi_get_cache_info(unsigned int cpu,
 			unsigned int *levels, unsigned int *split_levels);
 #endif
-- 
2.54.0

