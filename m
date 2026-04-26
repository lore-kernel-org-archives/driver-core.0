Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B2F25DB1A
	for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 04:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177849; cv=none; b=B3oAfH9UQox6b0R9jpgzTOHLkHylcOhyArzgnNskbpULURs1jJrdnhdnBZkVGKfufqF7fszJvw00kreMU5ogR2vpB/qTJCW0vVYuqX8lRfwt4j/hFh4Cxol2+1icOmC+I0GAZ1d8gzbRwSHGt5F2i+Ug99ronN53XrGarn789SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177849; c=relaxed/simple;
	bh=/9GAaFVs2B12Fx3sJy2F/Md/+N5ty0d1m+0UA5rwdsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRjo9rhTJldQyEm1u2x4n7I/rbvpQmXyXrrEz4/YNP3XLmha5XxfB1sbGPBcKsh7nJKs9v1EfWTnl1Q9wAc8BJ2kHM6Pcrx3KknDItkyuy2IU1Lvk5Dh70kh/dVVNgzmG9U398cXiSNDyfB+7K6wgbtFGtcIEbztnObXpO29EvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q57aREDm; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q57aREDm"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2dec803f9f0so5207522eec.0
        for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 21:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777177848; x=1777782648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7anmX684SpRJRGeOETMsIQPTKW5eKVp77hLeRWwHg0=;
        b=q57aREDmrq7TPKuX8rwT6mildQ14s69UfevqsZvVqBD1+cuZvw+GRdJmxXOdwrmJgU
         piD4X+yp0RRYiVMyoSK7VoCxGULSPIlqs+zWBXbHcwXoia0Al5jhYJQvOvQgCIkLaZg6
         lNxjMVhB1HZkfHqNQ9Dbou+Kbhk+DemC7izr+stL2t87douEJNpWB/0xD4rC4mJql8kj
         Wu6uySgQpTsnYqpva8cnNJ4Ayyl8kHKR5tKWzkOWc7e7MbA2+Eg5tbx8GFke/CuqpbXJ
         BisiXmMozf00pNKW9EcSvleMtH87rjh49vD+5N3jBGQMINzDvvAw2Z3SFKGZs+qSYcU+
         rvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777177848; x=1777782648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7anmX684SpRJRGeOETMsIQPTKW5eKVp77hLeRWwHg0=;
        b=GSMLX4sAhlx9KkFAiU086+uILSIOvbofBwGQ76mL3+vhvdL5+qgTRKRunrRREX5T9e
         hauKs2D7O+lv9VL1aO0I0MxOcyEwGe3ZvTNTVRvJ23WmLxproswOPH26jfxlfNQNhCew
         NNsBuTbP80nJicqxFCSiziPZl51uWy7VyjGApxYdvy0+AxMOMV3kfCsAJo7A1lRi704g
         TCQ2piyA+kMH9lw5PKCsBaviU5jkkYKk6wlsRq0HthZuD64es6V7nTVmn24yizzZzmwN
         qdXXusJYD3qAadxL85romsxw6VxzrjUvP5IlFsMBnwLw2BJQLfsS/Pj76p4YLoVo030Q
         jVDQ==
X-Gm-Message-State: AOJu0YzonsemrbwkRs6f2S1Tgy4EKiX5P7V9YCqDPbInk56z2pKNH7t4
	SoE7npV/+tOCl4TzplxsxcnLGiNIXLA6G3oRRd4ZBiaAuuXZsI1HVyko
X-Gm-Gg: AeBDies0jKgCSPSUzCtxnxhUYlynDh6HXj79N4S66Jxy4KKC5+CgP/jwTjk5DCev8Nb
	aW2K8MbtIlaIEkpMWqbxLVqzfW+kO8Ht2HLIoJ+SxGdk3w+UIZ6xbs83c8vMOxCh3xfgwviz6xP
	jt5sOoXTpKtmRRIv8WTZZVYomiT0DbsDK3eYeZH18VpOtXvTqW/F1mxpA5HITT+r22d+3bEy7yv
	DQEDj3W1G84wj3jjve0puPaFA0cC7VAOJQ04jB1o3gENfynSHGKkJane+VNIbaaFjnuzAMLlAfo
	dsyFDGmbmcbMaqTXjOA9yHuW8zqIWVWkc2DYIs4wJRD8SnFER79rxJsMJBsJ2odGOIVtrrb2veD
	9js5EpgX0oYG11nDBlkcVLcZRKYnNlxZaO8RGkMZJMqG+i07Fu2as0mm6CPktPPm8gCOVDS7rJs
	yeMOVYe5+TuaplSc37K41vsCjDLEKxY0luBeO4kBvo/kpW9aiGanrfe6z2LeXfsudaGBYqvPFzC
	UgGajq4DTZTmv+RVxR68ul6iQ==
X-Received: by 2002:a05:7300:2382:b0:2be:88f2:3c98 with SMTP id 5a478bee46e88-2e42c253239mr17527430eec.1.1777177847772;
        Sat, 25 Apr 2026 21:30:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f359:aa0c:530d:9dfd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cff04sm37796971eec.23.2026.04.25.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:30:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware_loader: builtin: fail build on empty firmware
Date: Sat, 25 Apr 2026 21:30:39 -0700
Message-ID: <20260426043041.649202-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an empty firmware file is supplied via CONFIG_EXTRA_FIRMWARE, the
build currently succeeds but creates an empty section. While the
firmware loader will not return such sections it is better to avoid
adding them in the first place.

Add a compile-time size check to the filechk_fwbin macro to abort the
build early if a 0-size firmware is encountered.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/firmware_loader/builtin/Makefile | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/base/firmware_loader/builtin/Makefile b/drivers/base/firmware_loader/builtin/Makefile
index 6c067dedc01e..af5b1bbb31e4 100644
--- a/drivers/base/firmware_loader/builtin/Makefile
+++ b/drivers/base/firmware_loader/builtin/Makefile
@@ -16,20 +16,24 @@ ASM_ALIGN = $(if $(CONFIG_64BIT),3,2)
 PROGBITS  = $(if $(CONFIG_ARM),%,@)progbits
 
 filechk_fwbin = \
-	echo "/* Generated by $(src)/Makefile */"		;\
-	echo "    .section .rodata"				;\
-	echo "    .p2align 4"					;\
-	echo "_fw_$(FWSTR)_bin:"				;\
-	echo "    .incbin \"$(fwdir)/$(FWNAME)\""		;\
-	echo "_fw_end:"						;\
-	echo "    .section .rodata.str,\"aMS\",$(PROGBITS),1"	;\
-	echo "    .p2align $(ASM_ALIGN)"			;\
-	echo "_fw_$(FWSTR)_name:"				;\
-	echo "    .string \"$(FWNAME)\""			;\
-	echo "    .section .builtin_fw,\"a\",$(PROGBITS)"	;\
-	echo "    .p2align $(ASM_ALIGN)"			;\
-	echo "    $(ASM_WORD) _fw_$(FWSTR)_name"		;\
-	echo "    $(ASM_WORD) _fw_$(FWSTR)_bin"			;\
+	if [ ! -s "$(fwdir)/$(FWNAME)" ]; then				 \
+		echo "error: empty firmware: $(fwdir)/$(FWNAME)" >&2	;\
+		exit							;\
+	fi								;\
+	echo "/* Generated by $(src)/Makefile */"			;\
+	echo "    .section .rodata"					;\
+	echo "    .p2align 4"						;\
+	echo "_fw_$(FWSTR)_bin:"					;\
+	echo "    .incbin \"$(fwdir)/$(FWNAME)\""			;\
+	echo "_fw_end:"							;\
+	echo "    .section .rodata.str,\"aMS\",$(PROGBITS),1"		;\
+	echo "    .p2align $(ASM_ALIGN)"				;\
+	echo "_fw_$(FWSTR)_name:"					;\
+	echo "    .string \"$(FWNAME)\""				;\
+	echo "    .section .builtin_fw,\"a\",$(PROGBITS)"		;\
+	echo "    .p2align $(ASM_ALIGN)"				;\
+	echo "    $(ASM_WORD) _fw_$(FWSTR)_name"			;\
+	echo "    $(ASM_WORD) _fw_$(FWSTR)_bin"				;\
 	echo "    $(ASM_WORD) _fw_end - _fw_$(FWSTR)_bin"
 
 $(obj)/%.gen.S: FORCE
-- 
2.54.0.545.g6539524ca2-goog

