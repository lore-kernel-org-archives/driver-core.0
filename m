Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B843502A7
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 06:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787726801; cv=none; b=PIbc7uxlBqq6Hxom08ezkH9lZ6Zba5k9n8f5zuRXw0ZtY/N0nXVMekO4jHDTOIJIa6fF7Q8CT6/TVR3N7Bf9bn9eKF5RACSP1Oxv2FacIdTMs+67asnp+X5g0J8b904N678I1FY7cXrCwoKvUgAh860BiWkdkKhWW/MLTIAedd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787726801; c=relaxed/simple;
	bh=RvmfKNqGs++XS3Jpy+Cd9TKLvbJU9vVRoAzGbVDPlpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cAJGngo3PudO3GqaxAqB6rryvpU7a1lhMcsT+D00k+OSNDZZi+g/gaZ6FPmSTtpRO7tvgkBx85B8yQII/rt95Y2+/km2OCsYoodYCwsvFbobzcmANe9s5oEaIL+ThKGLHctsp6a1j1kphMDolH1pFtd3pMcRbN2GXaz21N+fOtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z91uuDqw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z91uuDqw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787726798; x=1819262798;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RvmfKNqGs++XS3Jpy+Cd9TKLvbJU9vVRoAzGbVDPlpo=;
  b=Z91uuDqwrCPvsZHJ/KCXSTpwwA3su7nghiJ1sGYPk6e2vqUzl1qEo1jJ
   Bb0y5BmjpXejy+BlIN9+X0F1wG614paTRUQtCQPqKWtnhLgukyOI/7Kro
   RMOt8nRCHoQmVcJ9ZlXa4woMWTU4FcMkEkafEu5zU/IlNK0XpN9SNabwr
   PRKsaYEVlMoJiVt3Q3NVqhlkEfeIs1DVLbwDMbvdCxH3MqcQSynta5OgA
   8kwr3svX45gI6KT8FfNZ98mPLtTkB2O3eQt6Uo7/3hRANhC1SHm3FqbE6
   XLS2HB2k1EorbEbgBv8STQ4KAzThtJBtHZTYV/ie/bpwaKgYoTBE1g54R
   g==;
X-CSE-ConnectionGUID: SsgkrIxvQCOGdFMEj6L6kg==
X-CSE-MsgGUID: s/fR3XICT86XziZhjRrcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="87970894"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="87970894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:46:37 -0700
X-CSE-ConnectionGUID: eHmStvQKR0GhFNqy7nDz7g==
X-CSE-MsgGUID: M3A5zhszRAqyH1tyg9VqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="272747997"
Received: from tester.sh.intel.com ([10.112.106.126])
  by fmviesa005.fm.intel.com with ESMTP; 25 Aug 2026 23:46:35 -0700
From: Tao Yu <tao1.yu@intel.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tao Yu <tao1.yu@intel.com>,
	syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com
Subject: [PATCH] kobject: avoid blocking allocation while holding uevent_sock_mutex
Date: Wed, 26 Aug 2026 14:46:33 +0800
Message-Id: <20260826064633.589258-1-tao1.yu@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uevent_net_broadcast_untagged() still holds uevent_sock_mutex across
netlink_broadcast().  That serializes all untagged uevent senders behind
one global mutex, and it also keeps the mutex held while the netlink
broadcast path may perform blocking memory allocation.

This becomes visible during USB enumeration, where device_add() sends a
KOBJ_ADD uevent from the usb_hub_wq context.  If a listener is slow or
the netlink broadcast path runs into memory pressure, the sender can sit
behind uevent_sock_mutex long enough to trigger hung task reports.

Keep the existing send-side ordering, but move the uevent skb allocation
out of the critical section and use GFP_NOWAIT for the broadcast clones
performed while uevent_sock_mutex is held.  This removes the sleeping
allocation point from the locked region without changing uevent delivery
semantics.

Reported-by: syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com
Signed-off-by: Tao Yu <tao1.yu@intel.com>
---
 lib/kobject_uevent.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d24..b8832a5ca583d 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -311,9 +311,26 @@ static int uevent_net_broadcast_untagged(struct kobj_uevent_env *env,
 {
 	struct sk_buff *skb = NULL;
 	struct uevent_sock *ue_sk;
+	bool has_listeners = false;
 	int retval = 0;
 
-	/* send netlink message */
+	mutex_lock(&uevent_sock_mutex);
+	list_for_each_entry(ue_sk, &uevent_sock_list, list) {
+		if (!netlink_has_listeners(ue_sk->sk, 1))
+			continue;
+
+		has_listeners = true;
+		break;
+	}
+	mutex_unlock(&uevent_sock_mutex);
+
+	if (has_listeners) {
+		skb = alloc_uevent_skb(env, action_string, devpath);
+		if (!skb)
+			return -ENOMEM;
+	}
+
+	/* Keep send-side ordering, but avoid sleeping while holding the mutex. */
 	mutex_lock(&uevent_sock_mutex);
 	list_for_each_entry(ue_sk, &uevent_sock_list, list) {
 		struct sock *uevent_sock = ue_sk->sk;
@@ -321,15 +338,8 @@ static int uevent_net_broadcast_untagged(struct kobj_uevent_env *env,
 		if (!netlink_has_listeners(uevent_sock, 1))
 			continue;
 
-		if (!skb) {
-			retval = -ENOMEM;
-			skb = alloc_uevent_skb(env, action_string, devpath);
-			if (!skb)
-				continue;
-		}
-
 		retval = netlink_broadcast(uevent_sock, skb_get(skb), 0, 1,
-					   GFP_KERNEL);
+					   GFP_NOWAIT);
 		/* ENOBUFS should be handled in userspace */
 		if (retval == -ENOBUFS || retval == -ESRCH)
 			retval = 0;
-- 
2.34.1

