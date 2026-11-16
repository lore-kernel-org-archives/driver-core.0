Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822184;
	b=ml3wYMPs5kZTI/Goa6DzhmIOvapPacUcWietVST/tyMiCTeezUrSSTZRyMDs15aHVZBV
	 qx9tz/N/uThK3845mA9IjaS2IKzUDVIiZtjdQcYZhixgdMlENUeayvumBdwbIt1o0wBhk
	 ABlmAI2206aXdAsgLyArHXxNX5+TXUCnbzf15Ypmvfoe5wdDEdIeUQ20AYqh5VEZ8i23e
	 N+p9+L6fzKsfAkLWtNInh7Lr194fUQKj7h1q3uV1x5tIT1UQiqNXYPJtA5VkPvtLGsXqx
	 O833sbB6JFhzD5AS2Mf8BxTeF7jFFAUtAriXCoRO3cM57EcT5yUyQzChK0k6xo08h4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=lUNaTCcdfWDc+F04yNeLpG4cAB0pfDKkmS9IxUIqTLw=;
	b=vOZJpb50fV+DjvH0m6c41t1tkGtUfTcfgtW/wjxbL5hlctImhmupBDMwnv0ThOgK6wZH
	 uC3Tv4qw230Tty/P5+vbI4UemW3+5i0S/WFGp1ctq6AiTusHGsNzRu3G/p2OuapJmKXB7
	 1mwMzRkJf4N0PTQCeLfiFsAw93EnFnmyfP4Z2RGSU6hVCQDzUQHChrWT6pkCM2b+yc5dT
	 /JLXb35/8JRYNovUcAiwNGgSoOAhZPvzcwpCYG5Cvzt9bWfQFeKF6BF5m1XCir0oyS7oX
	 2q0rjRRHinBJtf7a3wqFAU+OLA5MncvD0QJRTm/tSeRi3a83hj1VCtIGBAi5wKgCTlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OBo/isXY";
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E59606A337
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E59606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OBo/isXY
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a070781f63so1096220b3a.1
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 01:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822183; x=1795426983; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUNaTCcdfWDc+F04yNeLpG4cAB0pfDKkmS9IxUIqTLw=;
        b=OBo/isXYHxYjebyNIgjdyKsHtp64tML2KUfX6GCPgaejpIlGtgktgyQuVahQlhQiBq
         b1G0eZRngM4/dquEX87tX6EGPfIh9vkY/GrCSWjXzhOk49GqFJ16gK+2aQtFSH61d0jZ
         LG4DiuOo8iaA3veTulABPhy7ccxRrXpn85MLPEo6bGOrSHMtBm5c8tvBCczYxC2dBAzv
         ZQTN0WQ9DF7j//9G4tBE42l7PVPcDI6nEF2eedKGVEIWwCf/r/JtkKri73JIJsRDiduc
         ud1kyQDxQyATAZ0fvhRBO5fwXlkHWONX6nBKmlQEtKU/yWk/azXVFGnJ3bmSSrOMqT+0
         mkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822183; x=1795426983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUNaTCcdfWDc+F04yNeLpG4cAB0pfDKkmS9IxUIqTLw=;
        b=rQtOxNnQ2+P8PQ9I4Hs8xP9vCpTvWBMrZqurLkmmpWTmVHt4f3j92lxW5cSpcn/0f2
         4okf9hFI3KkU823ucjos+o3kVI0qBqf+F6eFibgwDWr/Z1mpNyAyNYNKXxYcFc+pGC81
         6jJ9DktYwM22UNMPPiDbKA0If2SxLpvcoHFEuCT9J8QlPMuJ7/9HmBukrZPXYGUVdaQ2
         GPd+pI2ZZYb4mGZnmioRMD3Vs1rBt1Y8rULvGjxlr0CwZpXZ6oAflzTGyXY46J3XPS9x
         vORCLtOMzO1Rx1pc1VkVeDfe2nZUtHTaSCrD8VPO4lfECBT6+JVCAhNEjYD+F37H+W+x
         bwcg==
X-Gm-Message-State: APuU4Z87Qw0p80xAsF5ux9xVHBgTRCpgQzbkhYp1geXPG1U4xEbgZCJp
	RKW0DkK87/MT1Hs3GTfZ0Db8tDDcw4yyiFlduJRXioGuEVo7Lufa54tI
X-Gm-Gg: AYBFou2F6DLXbcw18givVu4P4G823UvpoOCPCD8YUOwTbkb2fsAMv8ZBp4RPXZRP0f3
	6hGErR6vJafiXA9YJXCs+KO41u5g9GyWg8EfJDe8c8bS3/O2y5GtTo9rEr3Vj6kmQ5GSOp9xK5J
	xK6qdJtbFOAoxJVdu3fTfHpKGQE5TXLglZ6dhvnJoQiOaGpUUZMmszTqL5u/Fimr0OujJiA/OTQ
	IDM9cMRYA6jw05/WKEgUxolwW+5yLuNJ2UJkx93SHRtr7zvjkX/CpTJbczTjyUoF3sQr7q0ifJi
	Q++/rIcu84VkJOGxjt9aT6ghzN4NhaEiRGAgthofFG5b7caSIPkRVl4yG7/5e12V1vzvNTCwnfr
	2KLFa8xHXpy7YIcY8L+yFvQMuF+LN8+Rlka0ky5rw3xi4MFg3+ZTxEhLpGJIkc+rv0xmUVSc0U9
	PtlIG6xcS1pkdQBtD1/fMk5BbyXwB3Bw4/329VWrN9WurnXJEoFMl2AAJlrJFHv/Bemk2PHbHgv
	RiP8VU9Lxmkjw2+y5Yok8m1X/0PxqPe7fn9iAf0t0kBkzY+gDmGv0ArZwZtqW9d17d/Dr0Jv5pO
	sotMd287eIwgEQWn5G5r0LOShV1OXEnUcWKAG9XiCgaWXqwb6+FJciani1xltQSHpn4eJRFe8BW
	0UKHiY4u0a0Yhq1eM3g==
X-Received: by 2002:a05:6a00:4b52:b0:88d:20ff:15db with SMTP id d2e1a72fcca58-8beb7a26493mr9160303b3a.54.1794822182843;
        Mon, 16 Nov 2026 01:43:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:53 -0800
Subject: [PATCH 1/4] sysfs: check for SYSFS_GROUP_INVISIBLE using equality
 comparison
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sysfs-group-invisible-v1-1-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Unlike SYSFS_PREALLOC, which is a permission modifier bit OR'd with a
file mode, SYSFS_GROUP_INVISIBLE is a standalone sentinel return value
indicating that the entire attribute group should be hidden.

Replace bitwise checks and flag masking of SYSFS_GROUP_INVISIBLE with
direct equality comparisons so that any invalid combination of
SYSFS_GROUP_INVISIBLE with permission bits is not silently accepted and
instead triggers the invalid-permissions warning.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 4e1e4f18a166..cc03229f8a94 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -69,8 +69,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				mode &= ~SYSFS_GROUP_INVISIBLE;
-				if (!mode)
+				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
 					continue;
 			}
 
@@ -100,8 +99,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 						(*bin_attr)->attr.name);
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				mode &= ~SYSFS_GROUP_INVISIBLE;
-				if (!mode)
+				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
 					continue;
 			}
 			if (grp->bin_size)
@@ -151,7 +149,7 @@ static int internal_create_group(struct kobject *kobj, int update,
 	if (grp->name) {
 		umode_t mode = __first_visible(grp, kobj);
 
-		if (mode & SYSFS_GROUP_INVISIBLE)
+		if (mode == SYSFS_GROUP_INVISIBLE)
 			mode = 0;
 		else
 			mode = S_IRWXU | S_IRUGO | S_IXUGO;
@@ -522,7 +520,7 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				if (mode & SYSFS_GROUP_INVISIBLE)
+				if (mode == SYSFS_GROUP_INVISIBLE)
 					break;
 				if (!mode)
 					continue;
@@ -544,7 +542,7 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 		for (i = 0, bin_attr = grp->bin_attrs; *bin_attr; i++, bin_attr++) {
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				if (mode & SYSFS_GROUP_INVISIBLE)
+				if (mode == SYSFS_GROUP_INVISIBLE)
 					break;
 				if (!mode)
 					continue;

-- 
2.56.0.679.gc527c65306-goog

