Received: from smtp153-162.sina.com.cn (smtp153-162.sina.com.cn [61.135.153.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBF949E15A
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474833; cv=none; b=Cyp/hYBrNauBAiYZL5c/ngJy3I8dzZWfG2BBp7EtoZZdlYtcf4RU3/uA0iIwJZSL7wwAaXBBLshzD1P41nXFVahjsrll+VliYFhuhdtCdTJE+iaTazUC/2MD4vzUQEtIEpNUXq4X65W7LrsbRSat87SciRieZzqCVeRaN9Ps4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474833; c=relaxed/simple;
	bh=kF2EfUR9+tHGwzSc3aEB0STsS4CDvChlh7Kr0RK7aXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B96bREios/va4vBMNbLeV4Q3GMdjWCl50NIllIsHpA5Pmxmc709B4A7Cv0Dih0olJn7Ph6IXhnxehN4bFh++A+OlEgZwn2hHtepMwEd8c0x1XiIRndxqXGhiwf1PvWuTTMcaW4H7j7s9UfvSJ4igmRC4NvdhdXayQwwvShmnBeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=jm9ETmEE; arc=none smtp.client-ip=61.135.153.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="jm9ETmEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789474826;
	bh=2huP4BHOtI3LZuHML8rqO1cAi2lXFTTpM4gi9fRaXUM=;
	h=From:Subject:Date:Message-ID;
	b=jm9ETmEEvxA/qegPtvxayVN0Fgn19qlqxDac7WKqDeKLKQ2UmTYhHgR7abTCCvFDJ
	 VNDOj3lIqKESY6uCzome8N+zt9i/sbzjbXX1m7sriAFBmRi6H6+7FNOipADjwCHjk6
	 FmnjhM3l0xANUzsXVs2JutXdNYSo/auhveSFtZvI=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.31) with ESMTP
	id 6AA9380200001DAA; Tue, 15 Sep 2026 20:20:20 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 9019526816028
X-SMAIL-UIID: 6CDB34C7268A4AF4BBBCC362CB1B782B-20260915-202020-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] sysfs: prevent writing excessively large files
Date: Tue, 15 Sep 2026 20:20:17 +0800
Message-ID: <20260915122018.924041-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
References: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
file write via sysfs_kf_write() may result in an out-of-bounds read when
checking for the null terminator of a string element in the kobject_actions
array within kobject_action_type(), potentially hitting:

BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
Call Trace:
 kobject_action_type lib/kobject_uevent.c:86 [inline]
 kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
 bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
 bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687

Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
properly.

Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 fs/sysfs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index cd5bb0f9fee6..a63130d18680 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -228,10 +228,12 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
 };
 
 static const struct kernfs_ops sysfs_file_kfops_wo = {
+	.atomic_write_len	= PAGE_SIZE,
 	.write		= sysfs_kf_write,
 };
 
 static const struct kernfs_ops sysfs_file_kfops_rw = {
+	.atomic_write_len	= PAGE_SIZE,
 	.seq_show	= sysfs_kf_seq_show,
 	.write		= sysfs_kf_write,
 };
-- 
2.43.0

