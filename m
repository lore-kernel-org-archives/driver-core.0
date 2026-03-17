Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31D83F87E0
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774049; cv=none; b=sGER8aPYuX6Vt9UcHsHbBSlBJVb2Gn9AqmYia10cZBUSt7kpq8hK7hwleTo8YyFxyMi2M31aDtlcZ3GPZj7Z/Ad3xa4x4ZcvAiCn04tD/HVGJaOU4Pv7O4BGCnJ05VyL7m8+LOkSrnqiEBWe4G+JNXeXLnnSbXsad8UTeGs3GO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774049; c=relaxed/simple;
	bh=u7g7PqC1ksiTGawd2FT2mK39JtKLQRmCXd42/gsT/iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aU7NR20jIpcUwxbpZIDAl7l1e/FQhoLKe9XGzQ3cyjrHyjMmcI3Sw/buHNdvxHLi2hw+YQdz8V+7qX3DniK4ymBqy50w7FBCcXGylaji5aFHLKv57ooJ9YZxIDeCpMzwu9924No52gAaqKoyN14PsvEWrRkw9QVpw2Iog8i9UT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gml4QNXK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gml4QNXK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso101641a91.0
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 12:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774047; x=1774378847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5pUoPYvzvdY/i+3VyCKmXdQJFa9RgqmeQepWrHmR+w=;
        b=Gml4QNXKBflv7OUJbPPuiu22eSw3SHibYIYui2wyCFEw3hQLxXnXLuVfYi51+2CBcu
         lzoe0LSITuEah/arr25YgB/H2GeNfzQ0qx1wktevjb/01MbXeMqoZq4qMTJpsfZMrGqI
         nSw9ypuG6mZpKHUd9Wo3lrCdqfQOtTwGaIQoY5jLYUhFp53/5uDKlS9iNYSzeZ3Uvl38
         RrnRQrWWKWr/5LLbrzhG+AZ53dq1JDBrMRihJEg0cyCknbRNVBAzeZXcf8QDowaen/xZ
         poGDqbE3VCUN9jhXT3ns2LsJ1f9czDQc9xl3VyxU7vJkmcrpbJImFIkQS5xvgC8P7/hX
         LbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774047; x=1774378847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G5pUoPYvzvdY/i+3VyCKmXdQJFa9RgqmeQepWrHmR+w=;
        b=M/szUmsM4jNrK2tyQpdF9BRlS4nQn9F/o3NsydJdJyCmxrg6CMH3x/bLgOD7BWmS1F
         SUv3s+j/6vA96NJAwgO8njh4e21KCKULZTdmpzZYh99kcGu6WTfQZ3Z4tmLnrvcd2W9e
         UT4kqSJDkkb9eprJG+mBB/VqtRynDUoxYZeSd1i2zjMCM7QvKhq5M6SxcTYvFh5sdrHg
         W/Amigp/ws4sDq3Zaigv6gE0K68DMkeePd1ufgom3XAlqN94L7HGjEXaU94M4LQGG6GD
         PGxRozbzxVYLpUycWTIbXPjBgBa0E62pmUC2GQvLODtctKnZmJokA7/o2hirV35oysf7
         G68w==
X-Forwarded-Encrypted: i=1; AJvYcCX7AtUAKBcAomtqhSO9ooMpAGaommEknIg7UUvZt/TAHY773fmHeBwDt0xEEca38TDMc9w5Y9xadX8bDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTdVJkKCD+XENMtBgc8oMpniu+y/4xkRz/bkNcshBymGPF0lz5
	AzekWExxtFFd4q4j4LKNFwbOIse1tkD8N8LJrccjINUM3bIRTvCywavs+avzNw==
X-Gm-Gg: ATEYQzw2Fd9oWcFLIsSyLOzXz17ECePqOGIipBUhXnATwPOW6d8Le0AHouyd4e0cr1Q
	JZBF4VJELXjfnYZ9GvH7roK4SS70LN4EFtnIaGnJvdQnZ6SgDct8FY9eouDfanklPlVnk2kVZJo
	wSA2ESYttbRBaQIqv4Ml6PxqdtpmkG7GevdHZEUNHi6GXJsIUJk7FWT94ZMdqNMv4kf7HWaGeWi
	rR0Cl6nlXwRQbtnQiyE9kNY8q5aadyIkWKF2gAEcIifK0K2Id30KZYJl0C2DqWMukMxKfvO7fNE
	0+99trkZ2HRLwq1kavEADSpg/JuiMfwkhtxCy8sOVB+6GarxGsWBSConh+L6RazzC0K++HwXbrx
	gA7gTthY6IvzncP6pObxCmk4YiSsPfqQrcc7H5FW8ZTKgnegsJXBAP8/SpIjGV2XbcvVLXsAcHe
	Gmp4cIUESfQeU3VX2/X2+aBo0yYQA4+AurmorbEyP1BmxXm9r5a6Q/NFVprzJe2u5ceXrf6NM7Y
	56AaKfMK4Lp2JVeFVfDPzMBcf478gyAOJ8y2BQvWV3N2n7VBaEar/q71AgH0JT+UdEpQg==
X-Received: by 2002:a17:90b:3a47:b0:35b:9f51:a755 with SMTP id 98e67ed59e1d1-35badc14391mr3481930a91.18.1773774047144;
        Tue, 17 Mar 2026 12:00:47 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5a2c60sm196240a91.9.2026.03.17.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:00:46 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 2/4] debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
Date: Wed, 18 Mar 2026 02:59:11 +0800
Message-ID: <20260317185920.43387-3-hanguidong02@gmail.com>
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

The EXPORT_SYMBOL_GPL() for debugfs_create_str was placed incorrectly
away from the function definition. Move it immediately below the
debugfs_create_str() function where it belongs.

Fixes: d60b59b96795 ("debugfs: Export debugfs_create_str symbol")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 fs/debugfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index a941d73251b0..edd6aafbfbaa 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1047,7 +1047,6 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(debugfs_create_str);
 
 static ssize_t debugfs_write_file_str(struct file *file, const char __user *user_buf,
 				      size_t count, loff_t *ppos)
@@ -1142,6 +1141,7 @@ void debugfs_create_str(const char *name, umode_t mode,
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
+EXPORT_SYMBOL_GPL(debugfs_create_str);
 
 static ssize_t read_file_blob(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
-- 
2.43.0

