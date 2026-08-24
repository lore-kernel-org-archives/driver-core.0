Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED90314D1A
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 07:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555284; cv=none; b=igrXPLinC5teiSC1wzugdb9mcf8IDAJLz6XJmTqRhV8KOM/JkxGV1UYkfJN6i0TQ9N8SFEvcNN59JAMBbRlFVML6P8iGAiWMYLzRgNobZLqYQRZPcx3/vNvW4rJByxtm2EEplPoqEOP8aUsqSiomB56bC1pdyT4NUalUpjOOFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555284; c=relaxed/simple;
	bh=7xrR73hibg6ZIjxJQy5lJ3swXwXvtKUyPH/+O07oLuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mp333ppKaIoT6fJCiE4ywt7ZuGGZIfA/MnxOeLwLvel3U9h4Htuh7jOI7dk2Sul68AEdZj+rHhVIrfyn0mBUdzXZvgGO6q9i19j65aI1+f+8LiejF8kgqjYLj3nsAi3QUXUurZloNEcvTUJpOv65Kgzl71Bntij/t/rMq1hXwGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlswAmM/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlswAmM/"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84830c774a0so3435449b3a.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 00:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787555282; x=1788160082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LG70tB/GjcXzjzKWY9bSayeBfIiBE+Po8FBZo0qg7mI=;
        b=NlswAmM/msJaB9BVMfG2EpotvZU62UhIGEkkV9c6xpDN5CkC1R5bxaSqkIoosqe2Ms
         PTtOwHhpsoQDxTLudJkUk6SFlpyBOb5HwXweysltBnouA/lMqPYUE8JGvRTlAUovZYQT
         Cxt2nYE1w3DOQmdKgPfzrhPjQhawZVWuvZA/q3+z2bNCYwhISmQKCAUr4+/DUaTJdBek
         fEZdnlssNMlQXZ7HOwOJoqrvXbbRi7EiZhuVXJQwmJKa6fdiLNhK+KC15Nndkm+FdOKe
         cz+BFnFqc/D0CZRFrKdIGdElLm6Dci0F8jydfI+jLz4ontNXsgr74c8oGJXVEWJplgod
         j3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555282; x=1788160082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LG70tB/GjcXzjzKWY9bSayeBfIiBE+Po8FBZo0qg7mI=;
        b=jzWVAq0XMOTXlaQaCor/fLT0thWHFWgHptdZzU/K+czF4AAxp7VUBFctAKpFiXW0FW
         z0gRoIU/slEOyqwbixBP2PCSCTi4GY7ngO0Oa2aA7RrvMUhsQa6vjOvJMi971eKYa3aO
         Zlm8HhEKgMSluu8Ck+H5X0quhcNGSUAAl2CsT2gfhhdR2YIMLdCaO3yv8yn2yh2ux1Rj
         9l8WMks7p1qmQ9s0WlSTl7annK7b5quEYPbvoveTvpf4ZcODYhZkNm5uPZs+ioLxsk5h
         fE7+bVZ1DIAI+J66pfCQrxUSUIv82ScLb27lae6rT9q2Ocdwvc77DqA2wceqYgDpoEVL
         1EcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3VBzKIfDmGw+KCfWIvOyoCgbv61hkYXMCBIJNneYkSS1lqvd1OPk/88WaEj1Tq1xpzTxKarO/gO9jbQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nyP2zt3wfPU7MDhs0ytVCWU1wnbP6oH1lxW2TLnwy1Ac3SLU2e
	FySx3851ML3Zb/DrFeqoU455jQp+IvHGMinUojGxvdvwrTA4lXHqHaoc
X-Gm-Gg: AR+sD10Vy1qWVk/7wRVATFZX+w+hjopNDESS9NoNmkjgnR1MoIVMHmfgepOnTDDVTRI
	8Wliij3prS7Wyyj2GUPmkq7MADhmbLT5AhMnzDFUh3po6/+N7wDsxBYs+sBqkK+1K+zpGEohoae
	qFjjiuV6tc7U0CUNHKPVub2Bogb0DEtGFz2UUi+2mrEvGeeNI6InbvojzJyu53idsogguEZ0kqs
	v/K+CP+zOVYYa5MuYbdoo9r0HRwjzA6RDjIYshR5FlK/hqT9+BcdOkvaBBcC+9Q1eCdU30RqtWt
	34fKcU0IpnLdn/DkgFX16TFdw9pseV/6CqFps8cWEglL8HTBh5nu4kofzwimPSyX4WPTy0DS5Wu
	ANmzsFx6r7qGVCSuQy6XxHqjmSmeZpiNcQiVCEfTX9P5e9vFUHSgSYYtqugnRY0FloCuFDjWX26
	e3G8x4NbCxd549A+mpaBsnlY0DmubIdbc7M1v6m3fO8CVT7NnQSgIsPSH/8hkZC1qP+g==
X-Received: by 2002:a05:6a21:710f:b0:3cb:d156:d362 with SMTP id adf61e73a8af0-3cd2fdae771mr46990058637.3.1787555281782;
        Mon, 24 Aug 2026 00:08:01 -0700 (PDT)
Received: from Default ([2409:40f4:100b:58bf:67a2:3687:c293:3942])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c31a5sm23143448eec.11.2026.08.24.00.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:08:01 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: syzbot+d164947c037324221043@syzkaller.appspotmail.com
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in uevent_store
Date: Mon, 24 Aug 2026 12:37:48 +0530
Message-ID: <20260824070748.96585-1-jeffinphilip14@gmail.com>
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

#syz test upstream

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
