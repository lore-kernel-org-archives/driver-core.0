Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57812342519
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871122; cv=none; b=FqEYknejr3pYBFM/1rpy0ZwKu1I5IsmU7nCB9s0KEY1ylPiltQM6Zek+vuBZor3ghRbQI+qu5HGV8YrtTSbEZ10ZKbhAVJLlN3vmYv/bhArGX23H1Cr6YbMQLCfXbGsFRxCHHAYwYKQXU5/IiwOuoImkLQGb/BEzfKCV6TFfKlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871122; c=relaxed/simple;
	bh=tfx6dOdIwwqQC/jjpRe//jhDfVXsvDei4cyYZa9VMO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pBalCaG5+yK1SnD0zaFElWJEde9J1NdWkar8eUyu0TBAZVnpV2RoI4axN1V8p3xihzKI1SxZ/FLIWDkXGCc5QCbvN3i5MieCWm+Ni1Ts5XszB1kUEbVn6pfjZXiwVLeJTQo3A2tAU+t71DeWcKrOSrhhbUgzTJqvQpyf7d1PSrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FmBTRZE6; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FmBTRZE6"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e533aacf2so116711785a.2
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871119; x=1784475919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1M/Y6Dv0V9NOM4+/puP8NWosRoeWXHurd+5rEoqGA8=;
        b=FmBTRZE6QlyWOMmqEzOs3toFavNaIiaeL9t2z1EB5jHF1TZEcWHkCFcpD1FwOF6wBt
         DdRLitWlH2Dw1pQJhOG+fGuGbYZGi0BYgB3PnWdE47d4jkVf13xCiXhTPyCjadx8lg4g
         4on5xfSzy62tzHiSl73F7n/ha0jDGKk1SJ5o1xICNqyG0aczhJDNgdTCm7s2lFwkTlKc
         z1s9P8NJBVlgJeobkllS6SoFFmNH0Kno1z6GuFsM5hJLUQnXIH5AqglT4XRUrr7wT1i+
         p+5FUN70WwHLSTG6twSBTAX858PdnZHdsUHoE85xuKmsbk3eP0w+d2d6gs+6Xh0TdX8A
         BObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871119; x=1784475919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1M/Y6Dv0V9NOM4+/puP8NWosRoeWXHurd+5rEoqGA8=;
        b=ETt/B5yIjBh1qF4WAdOmShbroXCH5RwqVUJvm/K77u1nrOxaRCkXGoMqRx7MVtguhG
         RL3Uv71yB6AJ3Z739xpYbLuCv4KQHZPH3Zm1loyo2qM8UDUYTZpEsiiLdcN3Lw4ImymX
         UQToJb6awdBM0QWHNTCFZHWsQIgz5BKjHJQbscqq2On3+BuIcLv8Qqf7UJck0Xtcm4NU
         6lkC93IVREMh7FgU5MmUW/In+qSLlCK3feMYq9Pt1jx+kihcr0nYoooecsEFYjkaNsng
         fVllgPgYmj/uhq2ro0wqDcCyJGzIr3AkAty5a8hxXisY1klWrBTguyGVAdvPVu25ejJJ
         ljaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq52/aw6+0EvN7Ed7CBSVGECRawWC/2uDNawIz84t6iMEUex2Ss6O6aXTDU/alzIGf4uxD77FRGgZSwfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3QcPpshp1gab4XYq4rnMjwjuKx5Uw95wvOOwL7DBdlnBq9m5T
	3YMbmV9z80YKDEveAgwIyvt7cwvOgUMkjk0fl0zKsjkqcurbNhc3WszBM5crcpJCaFs=
X-Gm-Gg: AfdE7cmqmbC4ABGGx/P7BiLQLKKeGUvuQ5j07ztdRPfiKFVaT5r11Pd2RVgH85xmr8O
	MBFgCmmV6dhhL/Oo0i59Mi9Xmm/rhc8MavdwupurU8T00brHg6xjfVytBqhiojYbFHn38tRUdQ4
	dQovXnXVPQ29wEMDTAhn63uv5cScELy6nSdgn4Ovt1tAL/TuiId1WIXfogX//6I3q8IHfQjqke7
	0lplBuD9e7BiVVhL/0s68yWRXbTxASq+2W4E2ONZ1kpSdAZVTDMJSbK8J1aNdZTL5RkA6ZEHtTt
	GTahL/OdHTz0Kbz2hFTcUmFFLI9lCxNxBjzYb1PkV9Tewqq9LByxPIwbxnaO6XnTNV1CVjyNhTA
	5DF0VRJbCqIsrmKlM3/2/iZYyYd6KRq795Baxy1SnHKyQnhHEV2VEhifXu3043iZ87ac+gP0IkX
	e24QLFI5HwYupPQtWfNiTGbavOT2ZRtMJZ8Z6p4U+xRI7TcNJz+0VTsn2zHXFZwpcKzSm2OpFUB
	ppCRUKZDZQg
X-Received: by 2002:a05:620a:480c:b0:92e:6533:26eb with SMTP id af79cd13be357-92ef2bb48d0mr596324285a.6.1783871119197;
        Sun, 12 Jul 2026 08:45:19 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:18 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net
Subject: [PATCH v7 02/10] mm/memory_hotplug: add mhp_online_type_to_str() and export string helpers
Date: Sun, 12 Jul 2026 11:44:56 -0400
Message-ID: <20260712154505.3564379-3-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mhp_online_type_to_str() as the inverse of mhp_online_type_from_str(),
and export both so a driver can render and parse the memory online type
through its own sysfs interface.

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/base/memory.c          | 9 +++++++++
 include/linux/memory_hotplug.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index bcfe2d9f4adbd..5eead3346f1e3 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -46,6 +46,15 @@ int mhp_online_type_from_str(const char *str)
 	}
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(mhp_online_type_from_str);
+
+const char *mhp_online_type_to_str(int online_type)
+{
+	if (online_type < 0 || online_type >= (int)ARRAY_SIZE(online_type_to_str))
+		return NULL;
+	return online_type_to_str[online_type];
+}
+EXPORT_SYMBOL_GPL(mhp_online_type_to_str);
 
 #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f04b915678dbd..8f6da2656f4e2 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -127,6 +127,7 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
 extern u64 max_mem_size;
 
 extern int mhp_online_type_from_str(const char *str);
+const char *mhp_online_type_to_str(int online_type);
 
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
-- 
2.53.0-Meta

