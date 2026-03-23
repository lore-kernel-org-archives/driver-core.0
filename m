Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44E378D9C
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256552; cv=none; b=ZlwLOiKXD1pWMjYfDX8xjUyk755fcX3AZIZ5CZf2auYfLZsu5sWwFBje9lsC6TR7bXxaPL7z3eFLhDURoDy4MZTlFIdHQnDauUuRi1EO6zGz2otruCNNxHyVmS7rDFJYr+TJd02rgzcCyNQbG31QznZwWGSWOGIbYM8qJGFaoPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256552; c=relaxed/simple;
	bh=cDfCpC2k5COsvd3GHRWIpuxPdl/asKWV7zeOf4SM5dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NE/T1ABVv0tL6dp5FIcodCZu5pwerJV+Lf6Fpsq0vsYBhrRjRn2dQWA5Qx9uXgKG5VNGlIjRkJb7FJioi8Aeb4boiQr/2eiCR089DEy8aUfYjpKtqwW5wOYhhj2zjsCrUktmsFPud2mSFOuFSXbpRjosBNvO+rMTy4y8nQAbbY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4lvmN9v; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4lvmN9v"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1273349c56bso3383022c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774256550; x=1774861350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg0E61uEdPAy3sHgDaZndNka+4Nyveqsr6678EIZbOY=;
        b=e4lvmN9vB/OaTVGr7QRN4Z1xnwaSV5JMOP7GN5RqH7rnWav32piUJTdSRaAFY+aBSK
         006sfb9tn4gb9LyQ8aXSisH5OWCeL0lJApI+LV9WMOmUysB63C6QFYiHm6XmddV4BTAB
         6+oxu5LzoFxMAfR/jRCx9+yPgY9xStb+E217XNc6D6IzEi+KaOG8JYTg1XrGaogNiGKM
         RpiHny90081aYEu0UnUjW89WsDeBtl6X0/07pLG7zoSxI4n07h27KFNjlDiWo5TJTGCY
         k3oqqRScrdaFQt4jv4GvZuSJ2cDNYKFBSgURHAycuaxNi6PBtthQUpxpQUrVftl0PRcw
         NEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774256550; x=1774861350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tg0E61uEdPAy3sHgDaZndNka+4Nyveqsr6678EIZbOY=;
        b=N2IgMEDq/NuLQDe+NgUMhmp1kVKIN2CBE3Vpz0HLXZQggzCjJj6U9yVC4AvY78zEl/
         NfoFDsFJkMxkReVYMjaE5XsoaJgHYJcEHOq9P32F+Ct6Ebu5l1qKG1mkZypgucLjb8+g
         jLGlxBqEqfdiyPI0RrHvZHgbg7UPisk6aEF+GFZ2hE8Bad7E8nqv2A2qIJNjJGWSKaC7
         9HxjVGo9ENhP0wX62RXE8gm3c7P9VZJ04qnJxeiQu06SQN6EU5b5PEsGorjvDwM1ZfOy
         Yu3pT58Iwetfpqh0PrxRN7tA4gF5ZmDgj8iiFPgzQfuJx3pJjnUcj0FVIBsXWd6X7A9D
         DZNA==
X-Forwarded-Encrypted: i=1; AJvYcCXFq42XrCXuFUQPTeEGbURp7+MGdhF9YoqeMc8d2La+V16wb9ICd3S5USfCuaWR7+Av8cTVukzlABT6dg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh2pYvCVRK/sIvp1S2UsBrg9+/CbUYesqUq0hWfyE9jNX7/JqU
	a/9LcKysonSiPmd2mQtyQGOuPbB9aX5eEbJJHbrbgZqw5xvS+S4Zgaft
X-Gm-Gg: ATEYQzyHVbD6g/BqplM/IW09g0bwRDxTFHG//cduWeNFDqZIBy/mUC6gMP5HQh7gCDR
	wjtM/wGUaOcT1bCbqct3s42X/f3so1gppzC+ZE/x84RsnozmNlDQLUpafiXASeWVpwusSPQC9nH
	nBlOALzNPO0HTgoWCCEZgD0FWV6UXQ87y1Brs42qembu8v2bITOSNPvdkoNueu961TX7f661rBM
	GQ2InoS9nT4F+RBtT8liU042YBkydwxU7ZoShVcxK9wiKK8zK10QSkqhAfwarbbgMav3W5FLYzH
	b5K69oBTlORJgpNAWfrfkbR38nMeJ0sC9onRrSiwR36wjm2MO6okZzV8WNgkEz3s/0pFKvlTu2j
	CvPoa9H2hvUh4o9EXMfDncBPJ5aWij9/9vtBiBEFyXhcp6wJR3ImFvQKMlgbSFj+PVYOf8pZTqy
	T0Wwe4YrPRC8pLnycpw2H12bRdrVaYFUXgZyo36e55ZDMCiPDbXOnOs6Dg4k43LpPjzV4UolcLp
	d9MHkkoONeKmt+Q4xEEwzc+D+OsUOgTd15JWYZaHuSskn2uRaD/003inhpe4LRt9dQ=
X-Received: by 2002:a05:7022:f68b:b0:128:d4db:447a with SMTP id a92af1059eb24-12a726cd01bmr4665776c88.29.1774256549584;
        Mon, 23 Mar 2026 02:02:29 -0700 (PDT)
Received: from 2045L.localdomain (90.sub-75-221-98.myvzw.com. [75.221.98.90])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bb33fsm8620227c88.9.2026.03.23.02.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:02:29 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: peterz@infradead.org,
	cristian.marussi@arm.com,
	sudeep.holla@kernel.org,
	linux-sound@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH v2 3/3] soundwire: debugfs: initialize firmware_file to empty string
Date: Mon, 23 Mar 2026 16:58:46 +0800
Message-ID: <20260323085930.88894-4-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323085930.88894-1-hanguidong02@gmail.com>
References: <20260323085930.88894-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to debugfs_create_str() causes a NULL pointer dereference,
and creating debugfs nodes with NULL string pointers is no longer
permitted.

Additionally, firmware_file is a global pointer. Previously, adding every
new slave blindly overwrote it with NULL.

Fix these issues by initializing firmware_file to an allocated empty
string once in the subsystem init path (sdw_debugfs_init), and freeing
it in the exit path. Existing driver code handles empty strings
correctly.

Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
@SoundWire maintainers: Reviewed-by and Acked-by tags are welcome. Based
on my testing, reading a string node created with a NULL pointer causes
a crash, and writing to it returns -EINVAL. This completely breaks the
interface, making me highly suspect this code has never actually been
used. Additionally, sharing the global firmware_file pointer is
inherently racy. I will investigate fixing or removing it entirely in a
follow-up patch, as it falls outside the scope of this series.

v2:
* Replace devm_kstrdup() with kstrdup() to fix allocation/free mismatch
with debugfs.
* Move initialization to sdw_debugfs_init() to correctly handle the global
pointer and avoid overwriting during slave probe.
---
 drivers/soundwire/debugfs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index ccc9670ef77c..2905ec19b838 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -358,8 +358,8 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
-	firmware_file = NULL;
-	debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+	if (firmware_file)
+		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
 
 	slave->debugfs = d;
 }
@@ -371,10 +371,15 @@ void sdw_slave_debugfs_exit(struct sdw_slave *slave)
 
 void sdw_debugfs_init(void)
 {
+	if (!firmware_file)
+		firmware_file = kstrdup("", GFP_KERNEL);
+
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
 }
 
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
+	kfree(firmware_file);
+	firmware_file = NULL;
 }
-- 
2.43.0

