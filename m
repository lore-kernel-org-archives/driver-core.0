Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1F3E63B2
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555474; cv=none; b=MnQmsigheXSXEOeiMA0NB8s8nIB2udorD3kvIck9jVB6A3xzp+8hqtxxzGZaILyffYhO9sBpTuZFanHYop8OZ5q2HKIqatLdNPkVjjSG1/9WuJWDaGtQiAVSo1+QK1l0XxXlGU8cHMxUB9CZR45cOeUCXU+LROqPUJwauMp3x1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555474; c=relaxed/simple;
	bh=7fRq7LA10J4O/eKhk5oIEfAzmx/Lm7rbOwZSI3x7Mzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYMJ/wtQDcT1DBDdivuhx4a1SorUUuFHfG2VUBP9tkg9CQxLk6qjanbmext6FCwL17b+8Clhhsd2sLPAuUyjiZSwUvrVxEasS+OJCj5IpJpVZk2cRmGUO6Y2vHK8+O6sfELMpMAFZtKxWITkzpfPJSCSl09ctWkDS2Hl0440e1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM3Bvhtn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM3Bvhtn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dcbade417so3617901a91.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 00:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787555473; x=1788160273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h08eMNhFflstQVSimX9yWegyrXFD+sdEv7O9yufYqfo=;
        b=dM3BvhtnqfL3A8ICxRPgyX2lSHeG4dC1hMBrIzGBg0AWmHGUn7FJvENXgUcqib+ktF
         cIJhwyfR4hfYUurQleYQ+DvpNX+27+alNNMUQ66A6JYq0jj3RQGp5e7PeawQ+0EbaOr9
         jP33wClC9TKFEUycrAbqmuJ3RyttwDJpQvY4pdWtZtFjdlgTF+0X3u5s/3K3DER4zyiD
         SBrBbJ5WUqghGn37LGSYBP7YNyfbW1eGkEZTKnxr/yiX1jzs3vGrrH8jq+H1W2NxlRcs
         2NI5IAZLoksj8tzg8eQrickGUEI5P/perPnMtnFk+iCydgIzD9D7lswGwqM7t/CTCGex
         U14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555473; x=1788160273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h08eMNhFflstQVSimX9yWegyrXFD+sdEv7O9yufYqfo=;
        b=jfeJVfXMRFIFjNc2dIG6bm2Pz7F6m3sv6gRzx4MeW33noIIJonjuHWGkR1iythYkD9
         MrxYx893SP9YO8qm4kJEKsLxl4j5Y8UtAqSQLZs25LXoJEKJmtcenInPm65HuoZuCRcp
         /3minjCkQigTI3GXa+nAi1Jq3jIJlepcYzPhFpO0KDMUC9GSdLm7a1gP66eFydXPVd5B
         dIB21prUNL+XvqKdm+z2t0vBBvpUsXsghsZEG9sz31/NGD8+KXa8DipbL+BsFZXuHzYR
         UDEx21POFoOkHmWzV9pr3clMD7bMa73m2fnZ7Nexn91b3bn789Mjmcg3itPqw14RtQ7i
         scjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1kXKB/p22RWAmTuk7+AzRlMf5XFoxeQLJdeNs0gztU8ApqCHrPwpjgfS3aPbcu5IjpXp/GQ4HTLjxIA==@lists.linux.dev
X-Gm-Message-State: AFuF++lUU9NgvJo367+JnzNSCThogyieg8nEDW+dhtf309vhC1QySR6L
	/L6+dzEmaaIeFnH2KOIP6qzrsrJlhDByltS4aft/lne9DBuq4HPWKb2I
X-Gm-Gg: AR+sD13nrNJWrnynoYxtJYPud7uyOoXG8tDTLH30Mn0uQEcGLKCiCgTk2Nr45I17LuQ
	V6SfomPt4DcJGbbL5cl4zAR1rJrdCvpitbuPXLk6vl5WneJPYrnkrkqfbqsmcdqxQzFLtzZzHpY
	4fDpHGxDbGQYmZN51TzQN6Qc03uEFs+2G83t6pS41B7GUDMTUeRbgW/Yk8ejp1Nf+C6X+LgTEIZ
	P6kx/qflBiIw2dS3W4NefdR3iwzajvl5glE9SCCnF4MxeBovw+wqNgblmBNc/w/qdE3UsaZ2UgK
	4GKQK4TQOG0Wlh4axCxWsULB990iGkSRuLKOM4YJJAgmJWUAKNE0Gt3s67pC2TxWPe0djdbr7n5
	g+ycjt/BjVVNbx74WbVB5DYh5Oq9QFVlbltUoUEFY9dw8DvABwS2r6fixPfFGrF9N48DYfddRFR
	+4WzZuABGRgAkSQV4QYzzYIhn/UmyGM55meh5RrvFGQC4IfIP9qNkBQLzkN1usxyeidQ==
X-Received: by 2002:a17:90b:4f91:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-395c33a6e92mr41420003a91.6.1787555472968;
        Mon, 24 Aug 2026 00:11:12 -0700 (PDT)
Received: from Default ([2409:40f4:100b:58bf:67a2:3687:c293:3942])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32814a06261sm6475250eec.21.2026.08.24.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:11:12 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+d164947c037324221043@syzkaller.appspotmail.com
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in uevent_store
Date: Mon, 24 Aug 2026 12:40:55 +0530
Message-ID: <20260824071055.96724-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a8bd82a.dbb3a75c.13dd47.0060.GAE@google.com>
References: <6a8bd82a.dbb3a75c.13dd47.0060.GAE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 9d2ed026f031

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..b03562301bfe 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -83,7 +83,7 @@ static int kobject_action_type(const char *buf, size_t count,
 	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
 		if (strncmp(kobject_actions[action], buf, count_first) != 0)
 			continue;
-		if (kobject_actions[action][count_first] != '\0')
+		if (strlen(kobject_actions[action]) != count_first)
 			continue;
 		if (args)
 			*args = args_start;
