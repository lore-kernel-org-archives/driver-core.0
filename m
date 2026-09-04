Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E173F3293
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520704; cv=none; b=dbo4gRKwuF+fkVIFqKNog0HTkw4Q4KIi8xHy7MFI5HpDmO/aDm/ir+b8r/jE3+mXIgIwKjMXdiBfwkgGTNv97DLZZ2gF1o5OSUQ8nH2txJjVzq0lrRDRUDR8ZZQsUCX44oeQHJUFB0AMYDDXBmq8qR9YQvZd0yB7xGFXyfDsBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520704; c=relaxed/simple;
	bh=GzGdhUqHabJdT56/0Vx+2i4I/VGZGqigv9kQT5jq97k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RewheWpZtY35KhgLANvPHsAi9iKKYG5FGIt+2Sx3WxoePVNdZ3hFGUrbErb0lEvsS8kO/S2GedISrn+6uD9hdQa+i4RKgJ4RfAAV9j7o3udrZ8aeGyhPnj6OpLiUE6ep/GogIwlwwLH+YysCXOIGZvY9bjRMpT6auuCne50oI84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeOkfgn7; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeOkfgn7"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso646200a12.0
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520702; x=1789125502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ru9Oqw83JdPP5GZWzgBwRJbCsmncN29/3DvUioCkWHY=;
        b=PeOkfgn7i2TD7z7fHpJIFDKC+rnQjPooDRqda+r+hi7QJ8yeJZgSVPRQXKCrMN7crj
         7OKHDRVriDdfJDKRzwyjx7uPlfzA1xSCMPk3sYSb2iOxxhKDTG1XZHhRuQo/AFcTRVDF
         Up7gbYvDA3sLb+gmGpQ3JoWuFP6+vWJMUAGO4X4anKfP0Gf1Pg87/CaSxgIk6kjCjvVx
         flIBwbZNRoZJMdIp245fBOqE1REPeP2EDLmY2IPoKgHMkCLaumN5WJjskBJ3ocK9H8nl
         E0Ain3ZJgTTaS361UEU7iPo5afj+Jo3DON5x4uQ3zwml95HFKfOgpxyoNDi960WY9+vq
         i+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520702; x=1789125502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ru9Oqw83JdPP5GZWzgBwRJbCsmncN29/3DvUioCkWHY=;
        b=N8CUDnPZGgZJa26zMaEkLDg9lCO1cLgUD6j1vQWfEXeYLJay9ULmkwo8uYArp2G70+
         HAjkMLGOjdVzIjiuEydDBMzdoE/cLuCGM9FG7iNvWhmztI1GV7NwmF/Eudu5jqwW7nnB
         fD/z/q1EWZAkoKxb5u0yR+NNzsFFaI+9zwDnLlpxarOXa0dFZB5/OpDWK6P78xBwZk+a
         iF/Yo0uSYS7YGisdJh6yP1YiFAP+svljUpDTZPqejB3Z3i4SaGOzLQbSuntBK7YL83bk
         c+YHJYYdkM4iR8ZQmtcoE+adFT0F1FPoxe+nnWOUnKe3Zd+PLKkIA9MMZ3CCEQl47Y4f
         qIbg==
X-Forwarded-Encrypted: i=1; AKwUvBz+K/cipZbrFp8DmNPs/1+rf+t6M5HuOq1vQMremalMmfnFVl4Kr5NdmmEY0OrSUQJ+PTSwf+jbLUZqIg==@lists.linux.dev
X-Gm-Message-State: AFuF++mSP8fMd48zHppEeNbwNKBQU1UuoPtSpQq36AGnDIaUSEawk5IU
	lhewoJ8zFC+M01t/V4pszVDAze5oI8xSHU43wyMGsJZSdwL/pu+TFx6o
X-Gm-Gg: AYBFou0ILZHSh7a+JgQ1dxGTXs7BsfZQ1+qq6uKBAVGzfTMd2P7bz9TXVBaewk+W7aU
	AjFcjq3zpoZy6uRAvsqPfNGrKyIRBTOM86UG9Z+h60XYg1jHZXqT6Ee1GHbAvgsmm9Y5YRGgnaI
	s6VDYq2ZeW5woi4p4vcb2yuMfg2lDKLV82Mc+ONpvROE+aX2/hBxE8kjFt1LcMnUJPxv7r9Vihc
	Z0W6pFbC2Xm/PXNDz9o9b1AAQscW42LNyrr60vtD75hnEQgq99pt2m0RiHgWHAkvYthVEJwt0DF
	1tJavC71ed3nYjLSY5jJuTfsQP4DbaigXMGR7OZ/OfbCDHlXch/fq6U3LKKyNjX/5FBPLaTryIm
	iif3f7RBZenDbHYirg2EHlMjiHstFL7B2tKOaspsArT6wEJE1VNXx4I+A4XL4N3rcXlUKJFtdib
	b4XxS6YVZ+4w8CDyFa3PQyYgvpgNNmSTO3BrHZakHitW2MmRfHsvgGKN1F9TiyWdJ9I7/SkcOZX
	EcdoQVQ05lXVB8=
X-Received: by 2002:a17:90b:2b4e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39b261d0d8emr8546870a91.15.1788520702508;
        Fri, 04 Sep 2026 04:18:22 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm6304088eec.12.2026.09.04.04.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:18:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH] driver core: fix typos in comments
Date: Fri,  4 Sep 2026 16:48:14 +0530
Message-ID: <20260904111816.31254-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/base/property.c        | 2 +-
 drivers/base/transport_class.c | 2 +-
 include/linux/kernfs.h         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index b136c339ddae..d8152fee72c3 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -705,7 +705,7 @@ bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 EXPORT_SYMBOL_GPL(fwnode_name_eq);
 
 /**
- * fwnode_get_parent - Return parent firwmare node
+ * fwnode_get_parent - Return parent firmware node
  * @fwnode: Firmware whose parent is retrieved
  *
  * The caller is responsible for calling fwnode_handle_put() on the returned
diff --git a/drivers/base/transport_class.c b/drivers/base/transport_class.c
index 351c3d3ce6a0..2bee796601ed 100644
--- a/drivers/base/transport_class.c
+++ b/drivers/base/transport_class.c
@@ -7,7 +7,7 @@
  *
  * The basic idea here is to allow any "device controller" (which
  * would most often be a Host Bus Adapter to use the services of one
- * or more tranport classes for performing transport specific
+ * or more transport classes for performing transport specific
  * services.  Transport specific services are things that the generic
  * command layer doesn't want to know about (speed settings, line
  * condidtioning, etc), but which the user might be interested in.
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 351a5101c862..73786b567ccd 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -309,7 +309,7 @@ struct kernfs_ops {
 	 * write() is bounced through kernel buffer.  If atomic_write_len
 	 * is not set, a write larger than PAGE_SIZE results in partial
 	 * operations of PAGE_SIZE chunks.  If atomic_write_len is set,
-	 * writes upto the specified size are executed atomically but
+	 * writes up to the specified size are executed atomically but
 	 * larger ones are rejected with -E2BIG.
 	 */
 	size_t atomic_write_len;
-- 
2.48.1

