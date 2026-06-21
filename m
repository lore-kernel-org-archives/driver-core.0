Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB232749DF
	for <driver-core@lists.linux.dev>; Sun, 21 Jun 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782038602; cv=none; b=fQ4ljx2Zpi0lqcRanBoX/LkNcboDZxgjWV7mJNZZ0l/gcBDFx/WqM3EGMrUSqHkE5ziHG97uWXM5aFm3QeIK1hkAhwLA5DKo4ndSiJBbXoQRVolBepKLwxbmDp7aJyL6WppH8HsjVPx7eOOyILkOtclcUaAaGfB597Ny65A+65U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782038602; c=relaxed/simple;
	bh=ChN+miFWN7R9QgBcB3bpKVzpHixW3KXBOc2f3i5tGao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h6V4eBqQR9172NU4Z2zebQNpMXg47bRLK6cxhpURQxBkf1pjVNXnjtlSK1GWXrJ9cqmErm2CFkYRvJuWzD5eheJKyfEPSmB7AYnAFi4aibghoZHRlJC2n5cdPV1QFVU/q/5kxU27pvFbF3beOXkJsgwdXP/uFIFues3cQclSqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STWVadHK; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STWVadHK"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so1326198a91.0
        for <driver-core@lists.linux.dev>; Sun, 21 Jun 2026 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782038601; x=1782643401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GRlEbUz3CfEyLnpEiThnBZLXsJfnIzThrcJcWYN6lbg=;
        b=STWVadHKrnx+T/vRh1BOtw1avjzyPexHVcUBd2ab81uf7f8FP4JYyd9sDlZsdekBHi
         Nf5md2Y/gQkHfwtGzyhrYJWubEWEabWeHE3WYuVTi3fVyvJIWOOT+1LFO8HSlQbF97zu
         O4sz5p/9EIQ5F9sJYI+5gE2uIjaX6CJRGxsy/RXfaxyMDhqimCzaX2pckmQuXKft40Hq
         CeaYRrXebNed8WbrjiZD/Apabv+5bTHnMgzI4VYzMI0oIoSsXmmOY3Q35bSCz+ChNsbB
         S4FtPsNZi96Ify0Uzlq/3Lv4aNLNDFK6hplZMKdcaGn2QNMcbu3sWCEdX5CB2PknSI/f
         d+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782038601; x=1782643401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRlEbUz3CfEyLnpEiThnBZLXsJfnIzThrcJcWYN6lbg=;
        b=L+Ka6oe2C66XFrAeUluwsS/GPXKrZWTHDIXdqFyHxNCqc890WBabCWoT2TgCm+Gksz
         +Qx12u3x25Z5IOVE2W4rTARbAjzPR9bY58r93F1shOLS3L031IeEA58av3SqcHF43yQN
         58mGo7BjhDSuf6wSAVcUnD30d8SO/Y/R/3u3HOsVIv8vNNkRv8TCmNSv2Gd3Mf67gzXj
         cPCaT10s1LZ+Z14/AAjHg6NlmU90QaciZfqcw3qBdvydxkiflzV3+xkXDjJShzStSFRR
         s4AqdqV0R44oiNSAzf8WDATiFuJqL5Wca9NpQ+O4DOjghLDhnNa6KKC50IUxMDM2TT1B
         Z6uQ==
X-Gm-Message-State: AOJu0YzAqssFDQW+sxf//SUDDKupY6WtZrGzM1qHGkz+7kRiioEjYMDQ
	JhD5sTq8Vy7pWWRa972LlUrIzbnr1bEXFng4iEd13/J8luyK2l2ho5/l
X-Gm-Gg: AfdE7cnlYw3pnYpdBQU2gHw4bN7n63HVgRGyeGbRCf45nDjrqzh96cjp+a3VCWIdw8e
	9OS9A7zHWFdWMnidkdT35Ytx3rkTJBuqtIUF5up8xEsvLSe0XbRgziSizScuTZGvYIW98M5Z/Wk
	MKXtRcWpwScondLCDJ0zJhyvwQwZpJNJ+Ht99bcgm6OQHg5xY4P4wwA5utUaAw3MpgGG5S5M35K
	aZ/kcE3n4Er0sZRslhDbz8aEY97E2rPVDQNQdjwOyml+ttMoGY+otR6Z6LkR/bnkL6nBgWw4q++
	r62N+0zjyhUnJBl+cPDuhaA7r1+ouI4pO7THzl+WJYytndhCJuS9FblqX3R07tVNcCQMf7s7OWT
	ki8iqTuDaCza+CtKKa8R0wOyzGqJr1e4/78dRkQLoDJujucqTaRXtDiZPQ+MD3S2knA0NyxkhJG
	OxJFcXbhsXNTtMF0nM/rPGEkkBzTv7vp+DuC99iTa1gG8=
X-Received: by 2002:a05:6a21:32a1:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3bc5181970dmr7662962637.7.1782038600746;
        Sun, 21 Jun 2026 03:43:20 -0700 (PDT)
Received: from DESKTOP-P6LTFAM.localdomain ([152.57.224.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc60e6ed8sm4049806a12.32.2026.06.21.03.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 03:43:20 -0700 (PDT)
From: Sainath Manda <sainathmanda777@gmail.com>
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sainath Manda <sainathmanda777@gmail.com>,
	syzbot+f83fa2cf571bd7650422@syzkaller.appspotmail.com
Subject: [PATCH v2] kernfs: fix deadlock in epoll_ctl by waking pollfree
Date: Sun, 21 Jun 2026 16:13:10 +0530
Message-Id: <20260621104310.18486-1-sainathmanda777@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a task hung in do_epoll_ctl_file(). This is caused by an
AB-BA lock inversion between epoll's ep->mtx and kernfs node teardown.

Thread A (epoll_ctl) acquires ep->mtx, then attempts to acquire the
kernfs active reference during vfs_poll().
Thread B (kernfs_remove) deactivates the node and attempts to unhook
active epoll monitors, which requires ep->mtx.

This patch fixes the deadlock by utilizing the existing epoll POLLFREE
path. By calling wake_up_pollfree(&on->poll) before the waitqueue is
freed, epoll users are notified to detach their wait entries without
requiring kernfs teardown to acquire ep->mtx.

Reported-by: syzbot+f83fa2cf571bd7650422@syzkaller.appspotmail.com
Signed-off-by: Sainath Manda <sainathmanda777@gmail.com>
---
 fs/kernfs/file.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 1163aa769..db3fed4d7 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -600,6 +600,14 @@ static void kernfs_unlink_open_file(struct kernfs_node *kn,
 	}
 
 	if (list_empty(&on->files)) {
+		/*
+		 * @on->poll is embedded in @on and is about to be freed.  Tell
+		 * epoll users to detach their wait entries through the POLLFREE
+		 * callback path before the waitqueue disappears.  This path is
+		 * serialized by the waitqueue lock and doesn't require taking
+		 * eventpoll's ep->mtx from kernfs teardown.
+		 */
+		wake_up_pollfree(&on->poll);
 		rcu_assign_pointer(kn->attr.open, NULL);
 		kfree_rcu(on, rcu_head);
 	}
-- 
2.34.1

