Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845693B5850
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531058; cv=none; b=OeweOeKNoOtzjs50rAjtw88vS4XfdclzeOmS3vMYIKVZmjb6dUHIjBUso574bzWGL7SkL0uD4FIW5GiPYRdqXuioi4IrBfTbgcGyPjGUHtwg1V32mrsPP4tsXwosiQOUC8Xj7B9r4KzoqiAVDRSufJcQlvLJIh/nJXTTHOphoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531058; c=relaxed/simple;
	bh=qoFME3ujxct+hnJQk+U54vJ5l3zfLaE0czQoS1KoMiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEuJKkS5znKC9PNKybnv4BVTUDMHP8tGw//wupoArLgQISle4Nhbd6ka9TxTacBRAZtD1bJm5suKMRKmBIjOt643o+DUyt3KD6wao+FJwL8UHUn194BH2buG1r8h5vrtZ60Pyt2JE2njwS3uern4mGGMWaunIxRmSjfyhxxBG/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e742eLSO; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e742eLSO"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so1319853a12.2
        for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 10:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790531057; x=1791135857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbAFUyj3BltCO2hVtF6k3xelf6aUmY0axkJyv2edRTg=;
        b=e742eLSOWH409YagIP2m3sFvLEMw6bW9pZqNEXvILbM2jBi3RyNkvUApYfEohCnS9O
         f9RsSV9Q5O5LCT53TPW9J93eKhKWCiB6oZKqc7FIrv69bUKBrfsTuRGKO9xARcERT16p
         x5BZfAvyQd8THUwSGgyDakg/4hjO1JXWsQV4QeWAJqipv411Put6EzgdHGHw5RNS9aDd
         Datyk6N8IAR6TzKu8rur/57TOlIBoNJiMLJvT7oL0OHLp2zPXuKLVxH7QgW8BOAaXRdT
         NTe0w6wIL5wFLuVeqS4LCPdj44x+kzIUG9TQ9DaXMlMtK1hiOeWNgXPF6Dotjd0XbpKy
         tj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531057; x=1791135857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbAFUyj3BltCO2hVtF6k3xelf6aUmY0axkJyv2edRTg=;
        b=DGGUjH2y8DFBprmukhTmD+lsvtPKHYi4N+e4amXVkGZlVlm1s8MewfsSGUNZjLMx7v
         jNKtuQijLup1CsyaILmy1Llnmaan8wtgLvijVeHrhxgywXbgnBOj0sS3YpVA7L4Fo+9z
         1hJJrxPC3yxBRZfhYMjlzk+2OB3xCMNIDSqyADunND/yt/ty+oumOI+JmsYEdtcRiXVd
         87isTtzF0T+ByfgfSDFGOvh8U+srDGd1AebsiaXb7/kjU5FQn8LcZGDwMgeMFNeYR36s
         D5lfTf0WL8osBgXtsDA9gWW6oQewfANZp/U2DN6bjfxBqHdKPp1rLME96fFEW7o8Fen3
         1L1w==
X-Gm-Message-State: AFq9FYKD6M0EzYq0GXxS+N0mVRP4nKfkl55blS2I4XD+IwZPGup4n5BD
	dzkUpKD1g14mM7RAn8jqkZDFxvyr0KCI7u2AvXmTrkcDgeVMc99tbbSe
X-Gm-Gg: AYBFou2ycMp54/VhXzwM5y8QLT3eFMhT5zrjhvZ0HmLzevcdXLeQyyzFpdaH6//LDYG
	K74kImRx0ulBgJDfcGJQJCGro6MZTz99EZBw77LY9bKkemtzYHsd9e8uOZDdCSX6KKFxWLMy7l/
	SMCoMc3KOaD7wZ50MdKfDqBa8Lp4Ymkc4OIB8zoXcn1oWW92HFAVJjYVP/FZp+yPFk5i5Ym0eUN
	UCbTWBf5jDqLETqJtescG+oarx+TudwsMftJ8/xsgvLIF6G0t7/Fl5hLt24/4hJmlQlGaSqQ4oK
	BEseeNPogrs6K2Oqyo0Wjf7Os1QFWq5EQ4MBzjSuzGcRiyL0mWvtcH79+rwq5gIIIhsl888UFCW
	Yyze7duzRCiB5BoLnX24UvVrb5JhebFK6iFxzVSSVCdNre7iklWqL/XbVPY/BmkZ7TdFWk0PGaS
	4pHz0poFxzVopmzPNSZ7UdAqaWIS9oGvO5js44A02aClYID9GP8Gii6ygqzhXXxQkIr87UqwI6d
	pRKepz6FadbWP2AL/4iwvdDFNG/kQDNQDqcD1LYosQYeL+qgry6o/RWT15g
X-Received: by 2002:a17:90b:5846:b0:39e:6c69:9b90 with SMTP id 98e67ed59e1d1-3a099235dfbmr9818678a91.53.1790531056584;
        Sun, 27 Sep 2026 10:44:16 -0700 (PDT)
Received: from localhost.localdomain ([211.213.99.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0e151be04sm9553785a91.9.2026.09.27.10.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:44:16 -0700 (PDT)
From: Hyeontaek Lim <jennystr233@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hyeontaek Lim <jennystr233@gmail.com>,
	syzbot+d164947c037324221043@syzkaller.appspotmail.com
Subject: [PATCH] kobject_uevent: fix OOB read in kobject_action_type()
Date: Mon, 28 Sep 2026 02:42:41 +0900
Message-ID: <20260927174241.36888-1-jennystr233@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kobject_action_type() matches a user-supplied action string against
the short "add"/"remove"/"change"/... literals in kobject_actions[]
using strncmp() with a length (count_first) derived from the size of
the user-supplied buffer (up to the first space, or the whole write).

strncmp() correctly stops comparing as soon as it hits a NUL byte in
either string, so a caller can make it report a "match" against a
short literal like "add" by embedding a NUL right after "add" in an
otherwise much longer buffer (e.g. write "add\0" followed by 391
bytes of arbitrary padding, with no space, so count_first stays at
the full write length).

The subsequent bounds check then indexes the matched literal at that
same, much larger offset:

    if (kobject_actions[action][count_first] != '\0')

which reads far past the end of the 4-byte "add" literal, into
whatever object happens to follow it in .rodata (observed to land
inside uevent_helper_sysctl_table on the reporter's build).

Fix this by checking the literal's real length against count_first
before doing the strncmp()/indexing at all, instead of trusting that
a strncmp() "match" implies the lengths agree.

Reported-by: syzbot+d164947c037324221043@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d164947c037324221043
Signed-off-by: Hyeontaek Lim <jennystr233@gmail.com>
---
 lib/kobject_uevent.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index xxxxxxx..xxxxxxx 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -78,10 +78,11 @@ static int kobject_action_type(const char *buf, size_t count,
 		count_first = count;

 	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
+		if (strlen(kobject_actions[action]) != count_first)
+			continue;
 		if (strncmp(kobject_actions[action], buf, count_first) != 0)
 			continue;
-		if (kobject_actions[action][count_first] != '\0')
-			continue;
 		if (args)
 			*args = args_start;
 		*type = action;
