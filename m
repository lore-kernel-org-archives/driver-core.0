Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8E93E314D
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776351966; cv=none; b=th41dM2AekMLJUuH76TDsB5iHpFcPoSKVp991p2OLCHfMopP6vC7exv3FTsrx8EZ30R8Pjwh0P+z0R0gY8vD5CaCMtjLlG7HyP/1Oovyx0nL/NsPRhm3K71iOFqRU6pj6whMF2rVbOZ4u0hlYOvp87xcZyisEDbBeJabE2iAd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776351966; c=relaxed/simple;
	bh=Al1F9LxdwQPYH1d+6OVlctXzpz8oQZ3GDQFoDUgKM5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUXHztCSj7QSku7upuaqYZdNMQWR+lco15GwnL4Hy+0bPFUXHA/IVmZjLXbAVHKwK4N1XN5Ne4IIyGAn2EsTdgr0XjS9KiPoJLdkXyEkrmlXevTUGz/46lS9J7bgIQOJf+LhWyHjmKOqujeoWBu/0SSZciAzCykEEY7LLMe/HVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20251104.gappssmtp.com header.i=@u-northwestern-edu.20251104.gappssmtp.com header.b=WoV1IQTD; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20251104.gappssmtp.com header.i=@u-northwestern-edu.20251104.gappssmtp.com header.b="WoV1IQTD"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50b2ebca625so7109241cf.0
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20251104.gappssmtp.com; s=20251104; t=1776351963; x=1776956763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+r7pKm0Oa2J37AR0FDSLuD1gUcrwE8bT/2He5bq2wC4=;
        b=WoV1IQTDglRAn2qG/twve64KnKoeC8EmvFCXFRGzes9u5TxDKlOJp/bbt9Tg5b7sey
         iFuAe4+Y1tHwXpcJ7WWbxUUAtksmf/LBrFCVnR5ikbgNgU2c1xu4eq3ZxbTfyEKDjbxx
         PqFFEBUzcBanh+FmaQeiTSA/gfEmIbAEqAzCcadNGMefo+jziTbEvUlqZgyX8iO8eIhX
         jH1eyRMb8nR8gEKRaTNsFPUsjl1q6bFCvMpyvy/fOnBYbwCSmoNcNWvhQQb18ccfWQYD
         Yjv1Zm+A4qiFgMubvcwt2XivnPgeuD7RyDk94CoT8gsefZGLD22EEh08uUy5AJ0bsNev
         rzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351963; x=1776956763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r7pKm0Oa2J37AR0FDSLuD1gUcrwE8bT/2He5bq2wC4=;
        b=R2WObNx/YaIhSuZRUH77SjWxv9O9Gn9Lu7caM6nTDpUumt2lUjCajcPasJx/s8wYyS
         LVG9m/eX2pV66fOhgln/sZf9lPouwsBrdNjhjDgimZyB+OKPNJcn3ZmF7S++GC4LRRsE
         hPSDnTi6IeBC4RBlcP+7+8b+dnYhUYGGNJ4OeFdgjdwEvWUjpPz6PtMnYS77aL6yaCZv
         rFxKuFkDZdHUAziPM18qJvFtHYXWUQDOg1vrenPiLnyD5RDcgR5iFK5LFtHHhRffve49
         bgUhhCbV0btoPuK+B7VJRKkd0v6Jx+485gS9r4PqIzsAkV6PBc9FqmO1lGCiYp6M/SJ2
         chJg==
X-Gm-Message-State: AOJu0Yyv1q+KoIso45qR3JTEdReRCS0gf2fBMzFbFqaVxQpjLRLvz3G4
	xuT8jT25lBW1upC5lf7K2HHc4sgRkZvg2Eonh3dB5HxPwGwvus2owcOLcvk0LIdrdnA=
X-Gm-Gg: AeBDievxjH8ZNVJBPYstlHn69WbKLMGgVGRUciosQfqErKRz6dR3ONVTjRD5Lmuyvte
	a+2q1fsggnyfhkPQp2vXfPeFQJQAvgBWkEh7s0X/rLhSWnQV/TWEK0TsUHx2ItcTAihStLEdM6o
	JVZhXU2yLNf5g7q7PSNoGQiA7dcwH6QmCV/mrLm9x1267k4NjstxtJba9iSvFTbvlRVeHhu9/oG
	MrV1vOHwq47l0wRtunqFHDm15PGgpsmvCpLgMGWjCGp25qNLWKgjhy/CBo9Ef9OcPFLpSnXtdE0
	TJyAYKNWWIT9qJK93do0R3t1vw35DngTWMj95XbQ1G5vheLUcfC0jrOst+YUjj+wbOQDD1bBVJX
	8AbBCCrXUaPGXxOiZIwnpk3mfngw341gH+vMpg37Rtc5RAFbTlRhEnruUoaph6c+g6rOOsVoCio
	zOwgVfwB6dq7Jb1ETmUJf0yBti0szonj/IzT7liCik7dGD1rgxjiiKKkX2ut4mxy8G8UmtqulrJ
	3V24DJjr9AsXIITWeeDPyE=
X-Received: by 2002:ac8:5ac5:0:b0:50e:32cd:52fa with SMTP id d75a77b69052e-50e32cd53c0mr2194101cf.3.1776351962785;
        Thu, 16 Apr 2026 08:06:02 -0700 (PDT)
Received: from conor-Inspiron-3020-S.mynetworksettings.com ([2600:4040:44b8:3600:d171:db71:e260:ff8d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1afc1629sm51124321cf.23.2026.04.16.08.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:06:02 -0700 (PDT)
From: Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>,
	syzbot+d1db96f72a452dc9cbd2@syzkaller.appspotmail.com,
	syzbot+faeac5b54ba997a96278@syzkaller.appspotmail.com
Subject: [PATCH] sysfs: return -ENOENT from move/rename when kobj->sd is NULL
Date: Thu, 16 Apr 2026 11:06:00 -0400
Message-ID: <20260416150600.2148935-1-conorkotwasinski2024@u.northwestern.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_move_dir_ns() and sysfs_rename_dir_ns() pass kobj->sd to
kernfs_rename_ns() unconditionally. If sysfs_remove_dir() has already
cleared kobj->sd, the NULL flows through and kernfs_rename_ns()
dereferences it via rcu_access_pointer(kn->__parent), which KASAN
surfaces as a stack-segment fault on the shadow lookup:

  Oops: stack segment: 0000 [#1] SMP KASAN PTI
  RIP: 0010:kernfs_rename_ns+0x3a/0x7a0 fs/kernfs/dir.c:1752
  Call Trace:
   kobject_move+0x525/0x6e0 lib/kobject.c:569
   device_move+0xe0/0x730 drivers/base/core.c:4606
   hci_conn_del_sysfs+0xb8/0x1a0 net/bluetooth/hci_sysfs.c:75
   hci_conn_cleanup net/bluetooth/hci_conn.c:173 [inline]
   hci_conn_del+0xc36/0x1240 net/bluetooth/hci_conn.c:1234
   hci_conn_hash_flush+0x191/0x260 net/bluetooth/hci_conn.c:2638
   hci_dev_close_sync+0x821/0x1100 net/bluetooth/hci_sync.c:5327
   hci_dev_do_close net/bluetooth/hci_core.c:501 [inline]
   hci_unregister_dev+0x21a/0x5b0 net/bluetooth/hci_core.c:2715

syzbot has reported 35 hits with this signature across net, net-next
and linux-next between July 2025 and January 2026, via both vhci
release and HCIDEVRESET ioctl.

Return -ENOENT in that case, consistent with sysfs_create_dir_ns().
The underlying ordering problem in bluetooth -- device_move() called
after the target's sysfs has been torn down -- is a separate issue.

Reported-by: syzbot+d1db96f72a452dc9cbd2@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/687c6966.a70a0220.693ce.00a5.GAE@google.com/
Reported-by: syzbot+faeac5b54ba997a96278@syzkaller.appspotmail.com

Signed-off-by: Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>
---
 fs/sysfs/dir.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/sysfs/dir.c b/fs/sysfs/dir.c
index ffdcd4153c58..6664fae288c9 100644
--- a/fs/sysfs/dir.c
+++ b/fs/sysfs/dir.c
@@ -108,6 +108,9 @@ int sysfs_rename_dir_ns(struct kobject *kobj, const char *new_name,
 	struct kernfs_node *parent;
 	int ret;
 
+	if (!kobj->sd)
+		return -ENOENT;
+
 	parent = kernfs_get_parent(kobj->sd);
 	ret = kernfs_rename_ns(kobj->sd, parent, new_name, new_ns);
 	kernfs_put(parent);
@@ -120,6 +123,9 @@ int sysfs_move_dir_ns(struct kobject *kobj, struct kobject *new_parent_kobj,
 	struct kernfs_node *kn = kobj->sd;
 	struct kernfs_node *new_parent;
 
+	if (!kn)
+		return -ENOENT;
+
 	new_parent = new_parent_kobj && new_parent_kobj->sd ?
 		new_parent_kobj->sd : sysfs_root_kn;
 
-- 
2.53.0

