Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C6416878
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763675; cv=none; b=Wuk+ly5LuxdhdVnI2QyfxH+T1hM6ki5vhu6aN1W5RtzeW8EEJqW8H2RPJ2STTFyjrrb52q6q5tNqv1wATXb3vcq+0WI/hQsMidme0yYY89bxRoDH2K16u2whHIpvbJSXXvU0J8bS/QDiydjKqItBuBIN0lgnMjSL2BWhd0wBv/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763675; c=relaxed/simple;
	bh=p91ao2AKO1u40gx02a/XDSpFyO2CsKWUxeRtlMlap68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrfHvGziQ16bHqsPi5htpZz1plpx8Cv/egV4c/VBnGUYoOZ5e9LefsRCCUOtP4KI5DFySMcmiBpptiF231ZD8S5y2ePKkFjTcP6Z/P3BQJiFuMGDu4WysSQksZDWeM9ec/Ruumb4/quCQWLN/AxE1Ax7KTFMyfr3SdBogVmIWUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pj+OntNM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pj+OntNM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39b52169dacso917870a91.3
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 23:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763672; x=1789368472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIBBvWrmpup+w6AcHGzaJw3qF8lt2RTeR72Ssm270eo=;
        b=Pj+OntNMuT8lAbssRsHZtuKUzGiKMgciEfDTbQAhdB0EKTBeZRw1NR4/vg6zCfAcjZ
         o3h/JrOP0ZSejk/chDCOioQrZSJSuaIXnFHfNfE18z47rpxilGpaQrZYzfx/wZQfe48y
         ZuBQd0euhbSyGMelPeSVle1KLpivgnFo9AQbF9EsVHzsdI5v15zUbAztZeEC8OWXojcj
         mhIeYajV7o7Mx+9f8F1B/yTaqjUOmuUsyJEZpacxnfD45wKece3Y4zv2AwTzg/W6BMV1
         1QDMQlvaTALC+HdKw7O6L+pxOgee19SoZ+hh6h7fLHxXVf750psGR84Y+oJ/IipVZiuY
         RrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763672; x=1789368472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIBBvWrmpup+w6AcHGzaJw3qF8lt2RTeR72Ssm270eo=;
        b=bCesufcMFguzWzBhiva7PbPrpfDz0PBMZS3ZlHn/ETECvzHjKvMq935nbdITRU/Yuq
         UDN4P1YSocQaquCYKQmxQ98XssaxbsBycqfr6h5SuH92rdeya9WALA4oYsYuHhdgj/SF
         4CF466SqtIIiLpIDF2pAiLMPVt8GHqMnMSgJlr6boHG026Rl08YzieOh8Yr5RSuQWFQX
         OLT80L18Oej8gnj87v5t2CMj2EHyDQcjI2yHVHJsg12L5QpeQZUkevoU46HbDK5r0waq
         6FfMWbdgArs5cEZ+t4S4JbrayUeb8Kfz32ZVFNJvjObj+8Y05iWqQZ7B2hOx3hGtl5sK
         RVMA==
X-Forwarded-Encrypted: i=1; AKwUvBx9wg2CpgZ4qPkvxp5nQeoYOZ2bTRDWJYfZrkLpofdMAkhpDHZgBD1d8pXxZPfUskkTpSZZmHnV8dKcIg==@lists.linux.dev
X-Gm-Message-State: AFuF++kqRRH5a0SRmdXDc6OiaRQIKx+kWN+fjYyS93VIvtgonJuAc/2E
	7BLgtGtbv6Mvl1/Y+Ek9lr5fkWTLHiAORjCTZunRHVwEJ7+I4blWd7cK
X-Gm-Gg: AYBFou2goolHTWTF7UYKomEWFBdiFq1XE5ERjftjBdrHdBglGjcs45uMPwwxJCyLHXk
	XuMBaqKTTBBoB7exr+5iryN9zGKvF3CxGZWpj+jIFeN0xFnRCCG0U7qL9XUuiOSiA7AoHxZpjEd
	Cgi26/AlKXpKUlR4ynrix7q3K+AF69EF862HR7lFP9wJCm64oKTX44MFpcFnYA9u6syyju0bu1U
	bwTcKSFOO4cehDsoqSe084LospWF6T6UMtoD6z1MkCObTyz2wZzOQ9s+1uVnSky5ublCDo3h0fL
	1sXd89WYytwdniH2WO+Xh986OlNN/YpF/D0k+8lkRTk3bedN/O1SsNVsOqA/N1IIjyqoTDhC8tV
	q6IKMROWYHiBcSZrzAF7tJeJmSzK603j1DMmeHU4VKuPGhfoFDDiTgjz26QvLjYTJsK0dgFBTRP
	abxh0VEz4NvKDTBMJu/snFUOzjWYYcNJDBQEQBAX/FgMf5VTLMpgdwb3Ha+sjLeP2PFcHxTdBaH
	SXYb7qGCbylBw==
X-Received: by 2002:a17:90a:d2c6:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39b260d2f07mr32517136a91.3.1788763672025;
        Sun, 06 Sep 2026 23:47:52 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 3/5] tools/thermal: fix typo "binded" in comments
Date: Mon,  7 Sep 2026 12:17:23 +0530
Message-ID: <20260907064725.10686-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/thermal/tmon/sysfs.c | 2 +-
 tools/thermal/tmon/tmon.h  | 2 +-
 tools/thermal/tmon/tui.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/thermal/tmon/sysfs.c b/tools/thermal/tmon/sysfs.c
index cb1108bc9249..5d64aff12a86 100644
--- a/tools/thermal/tmon/sysfs.c
+++ b/tools/thermal/tmon/sysfs.c
@@ -225,7 +225,7 @@ static int find_tzone_cdev(struct dirent *nl, char *tz_name,
 				cdev_name, cdev_name_linked, cdev_id);
 			tzi->cdev_binding |= (1 << cdev_id);
 
-			/* find the trip point in which the cdev is binded to
+			/* find the trip point in which the cdev is bound to
 			 * in this tzone
 			 */
 			snprintf(cdev_trip_name, sizeof(cdev_trip_name) - 1,
diff --git a/tools/thermal/tmon/tmon.h b/tools/thermal/tmon/tmon.h
index 44d16d778f04..f347efb47c96 100644
--- a/tools/thermal/tmon/tmon.h
+++ b/tools/thermal/tmon/tmon.h
@@ -77,7 +77,7 @@ struct tz_info {
 	char type[256]; /* e.g. acpitz */
 	int instance;
 	int passive; /* active zone has passive node to force passive mode */
-	int nr_cdev; /* number of cooling device binded */
+	int nr_cdev; /* number of cooling device bound */
 	int nr_trip_pts;
 	struct trip_point tp[MAX_NR_TRIP];
 	unsigned long cdev_binding; /* bitmap for attached cdevs */
diff --git a/tools/thermal/tmon/tui.c b/tools/thermal/tmon/tui.c
index 7f5dd2b87f15..b982c1d77402 100644
--- a/tools/thermal/tmon/tui.c
+++ b/tools/thermal/tmon/tui.c
@@ -238,7 +238,7 @@ void show_cooling_device(void)
 				unsigned long trip_binding =
 					ptdata.tzi[i].trip_binding[cdev_inst];
 				int k = 0; /* per zone trip point id that
-					    * binded to this cdev, one to
+					    * bound to this cdev, one to
 					    * many possible based on the
 					    * binding bitmask.
 					    */
-- 
2.48.1

