Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02902409295
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763657; cv=none; b=mvwSf5z9rNOCTzkeftLjY4dZ65nECmgPRslLwfbiOEOOmtKRYvVAK/BmjUOQqLy+gWgowXfn+8FQizx/Ds/La8q0e5mXLR1gah0yJGE57xKQjNcnj2/rMqKOLPnIiTOA8mi2KgIWzN2TMI0jf/coVVizaxi6Lp9WFAvrzSN3St0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763657; c=relaxed/simple;
	bh=GnJq7OFzqU3yVwU33wEMiUZavL/p2fo6PlQ7aO7+lBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CotYiWDsPGqkSmjk3oIYo6KaV0qMJTuCqBtSWKtQxZysSzSEGmMP2xj6d1Bf76cUex/6NcwZkeqQscGDvh85dwiX5UDkRvUCL1tRkYs+LguweYTvNF9TdB/B3WdBDUGMUNxkBCv4xQCKdBBrMZwkX3sC3sXXE1AlTj1YOFEkqQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hklaPQ2Z; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hklaPQ2Z"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e7391839cso3368707a12.0
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 23:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763654; x=1789368454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Obcaema8mLbnmFBhxTp3oD6l+HUHR5TP+xdhdYT8HdM=;
        b=hklaPQ2ZFcO1ia4YO/TvcVVeyZ2lPoRL6VhZKOpdekPeUEoFmSESNuUiQAFcEVlQRV
         EBHnRHchp24Jy7QUd7MLu4nLlKLSRWCgHzM90a+8BKMimzgqVUeC1BreB5iaxUfEI0Tb
         pwTm9GiRAbrFJCTmIt+qF9MmYMOpbK1Vh2lwL5r5ySPE8RnoqPYr+Xa4Z/bDJxZGVhS6
         1TybVwygl3uFSQy86Hcq+EQdinWRPOEAd4P493lx5Zx/Tv2DDjQX8AWkeJgESj+B4MsC
         Xd0lN6aRmAjSNjdQNeQ/YkfcPu1s1hF1Lguvu/eZvb0DoUPqHwE/oX1FdIa8lVcvovcT
         xyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763654; x=1789368454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Obcaema8mLbnmFBhxTp3oD6l+HUHR5TP+xdhdYT8HdM=;
        b=I4qIX1z73Jdni5qCD3enBcxuKncqqLw7vVy9hBNpECmOZ6YVhjGEBwdLTmbiJPq/DV
         uNQXKOG99C0Qlo3rSrAHekNXx8IKbIpJYtkqENnv6idnEio48PbBDu2uJ/HpzSnHoziq
         zGv77j+kyQ/YqSGu7f0fCbC8rFPj5BXeEWSEMb2bseXAkCt8uDrJVnYMZq9wzZrEOYry
         RFMRAq6GYiJBMH1NE9ZCG+mih0njGN/rQbDJ72glUlBOjKN4Va4XIf/KzfPQnc8c6jY4
         Rme9mjSmGqAAwOsOHgyljLcoM8+Sq3ZVz42ZT9rORKVEkZ9jp/TKA1iUTiDY4N6cmyQh
         u3dw==
X-Forwarded-Encrypted: i=1; AKwUvBzmMLBkjoDhzshESArbbzKYC90JNlBA/xMMf1ci42qG6n1LdLKB5/myY+nAepQqrFG7bS/deLXM2iv1LQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mV8Bnp0bvUijV7IvfTQCNc0AzzXVKsVqUrFfshfqYMlZobnK+o
	oF9OdYUhlmFgHQVx5k4cVAX+Wfe4oEgcg6kh9GWU+8igdiocCpUt277U
X-Gm-Gg: AYBFou2QCp4URzYyPVDAr9uu9ea6peOvA41J17A1fA1QiyLadgBPnC8D1znocuJfahk
	u1uWB4hgQr5B+il/xsA4JqAexMrSPf1HmSPtok7ecPjMvr+1ZO2HTLpiJQIfRN+RYZbFhJqb45p
	UEjx+MBb9gbZ8V+HZN5nblnPf8K25F6D7IrRSOAGZys9ns4cojTiUs8yvuTXGNRDotlmNx1CL64
	wF8BrMQZKOTDZ9CgRHlyOgkeZYK1T5lyul0DeSEWNESpaYBpzi0rrlzPwOhbDh6hgVzZFrMz6cv
	CX+rliuqHGdRYapYHdet91WEK1akx86pDR2gevxbhgcg9jdDLxr4j5QUxlQdTaDWzzFJgEELw6C
	VTODsNXcV3eK6DTuriwJNvoz5ezVPTjU656LnhwAXrhe9a9lbvHJ3Iinq8MaI6URUl0ileY20sx
	2LjGukD/wAbEiTou9JniRJHTYNkkHZxcODpiggIBOu2ePza1V4E/YuTCSKrSVKwSpzyTQXmz+U2
	BvBqGYKUTCeug==
X-Received: by 2002:a05:6a20:244a:b0:3da:1fc0:fb07 with SMTP id adf61e73a8af0-3da39d18791mr30838754637.6.1788763654025;
        Sun, 06 Sep 2026 23:47:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:33 -0700 (PDT)
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
Subject: [PATCH 0/5] driver core: fix typos and repeated words in comments
Date: Mon,  7 Sep 2026 12:17:20 +0530
Message-ID: <20260907064725.10686-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 5 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (5):
  driver core: fix typo "sucessfully" in comment
  thermal: fix typos in comments
  tools/thermal: fix typo "binded" in comments
  cpuidle: fix repeated word 'that' in comment
  ACPI: NUMA: fix typo in log message

 drivers/acpi/numa/srat.c                    |  2 +-
 drivers/base/power/clock_ops.c              |  2 +-
 drivers/cpuidle/cpuidle-tegra.c             |  2 +-
 drivers/thermal/thermal_core.c              |  2 +-
 drivers/thermal/thermal_of.c                |  4 ++--
 drivers/thermal/ti-soc-thermal/ti-bandgap.c | 12 ++++++------
 include/uapi/linux/thermal.h                |  8 ++++----
 tools/thermal/tmon/sysfs.c                  |  2 +-
 tools/thermal/tmon/tmon.h                   |  2 +-
 tools/thermal/tmon/tui.c                    |  2 +-
 10 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.48.1

