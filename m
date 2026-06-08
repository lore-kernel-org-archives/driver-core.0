Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9938F926
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 06:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780900625; cv=none; b=NH1+QiYM71kcLQkg2Q7si0zv47ShFfu+J5oTyJ1JjtFOiLaDCBPp+AsQGN5uuWNDsTuhlpek99apwVmU64wJeA41y5ZNKF0bwsiyA4LOsGs2tW7JQqEOk/ZZmtTBY7lx1bKp7npn+olUtq93EYZ1ZkZxw8Sa3Nlc7WZKjwFIpfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780900625; c=relaxed/simple;
	bh=z4zubuJonZM0PuY5HrRAKd+NwOyYcrFyprf0P1lz+uw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UE3v+4DPXGa87PuVfHTZJavvZ2l65/oIBL9l5CXxTE17Pl+ou9OBPP/Ds6EGgKUYqnbaZAjIJnkmuGkm5NqwGiaXfLWzsACYoZ/Fs6uUJ++YOcgxFOoHImhmwlMLK4hGOgNbZ5n8Ufnbu6b3iooxNB4oNoXvrQLWQ3nob2EiNlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfxZslwY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfxZslwY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so2672333a91.0
        for <driver-core@lists.linux.dev>; Sun, 07 Jun 2026 23:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780900621; x=1781505421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v36uDZrl9Fx4e8iYPm9LAwB6EMSC+5euhGAyMrWHwew=;
        b=hfxZslwYJpiCAoc2wTC7yMsZ+tIswd4ODhcVZzCVOuSkDuwnd+CO9lEv94WVXPr3SN
         ezdmMjzBOlsIe4/kpRN6hqmkYNSiH3VSkCB+8gZNvhUp6T4Ui+vpJMSN1sIdH9xJkZuy
         DubASTzbeiST7n/BuE9cY+HTJYIWsnScWqAp1oPvJsAczRh6hRudu7cy66dEqfgvsybb
         YnXjkBt/q1jI1ghZdu062iFacqKqLwXtlNLAz1R6uw0sCGY3bMUP7DDFLb9N/2nJUWq3
         qYE8GA92p1AYbpqPrWNnwiMttvI7HMpA9R1AVKo4HJCA4InNnjuPo3bcsFiuJVMBVuAv
         ftOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780900621; x=1781505421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v36uDZrl9Fx4e8iYPm9LAwB6EMSC+5euhGAyMrWHwew=;
        b=aILE9MwViL8m4rOphe8XDb2h823zPnfAxwADxVG4zU6S6R3t3mn6PxmzSOdlLhPbF7
         6BjECkQnpNjDcWirXdH3KI5lTUieD5NxXiII6JRP2MU3+DqBraEfqtpRv5koKuObmxEZ
         HnvMCbM/2dLL8D61exsKusp0Qpvf1RkrtKzrBMbe5kAIOinLbAXsHx2UhjslK6NP1Y9k
         qmlAweI1wb6Wu/t8enDZHeEqxlvxm6Ie7bMWMogpoBVWuIc6hKzpiZQ+7X2mZESAi7jl
         DBaycqNkESZHEnSBoXf2DMtwswxt/FqS/MlTL1eykWDOAiLoLnKHihyu549B3ZDgbClh
         TxcA==
X-Forwarded-Encrypted: i=1; AFNElJ9h1o0GK5kotFnLIMAibbogbK1zSimb+qeMDT+E4bbANZkhLMCp8nXD5cU34ezcd4vOyng0Fla6wKIjHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJQw7NAtYSCWNzb3S/bQBKiLVCuYBQmt5tFR/3p+0P9X8DBor2
	O0UBQssKLTiZ7Xq611Fv6ewDVgK/awR4vurhSSGpxNFglWuGzkXPbml2
X-Gm-Gg: Acq92OGrFqdppf36dImc8KtUoqYg91owuBzc5o4BG8zFLXZaWw8OZkd5pQDDI50rHNh
	sRYPAUl0uU7pi0ioxD4mKQ8HphnfzK0QDR8QosgxfHk3s7hr9VeWDT1ZHeWwJn6JVyr/2gJ1drW
	G82ZacEhI5I+nUhmv/jqAGJuKBbk4uGStNBEjff+Uip5YfO7FcUS8qmeBdlb+Ha96P4AvYfkqD1
	nBnxytwfYYwcSL8lRBYQwfbBBi2hIsz4zNPemISMvwKxIlRotj1yGxgnpXrfpY4oDLvknQ/WAhY
	6zf0XSxI4Hi59t6klmuMybgfMH54vUxlVDhSbBInhwTCGDjV5/oDG6vtnFmB7UMof88GtTG8EL6
	4I1TxPw7I9S5azhVme4d/pGb9KhvVgp+/w6zR3eBk6rfFKcAfkK9/kuW8QdmxZ+8sGvpPAdsZIs
	9ocTmA4rB/CkoMYpzhayuH/a+uMujT9/VCj4KsrnBXlEfNGS6EgDFC
X-Received: by 2002:a17:90a:c88e:b0:35a:10b6:1208 with SMTP id 98e67ed59e1d1-37132b9aaebmr11145163a91.14.1780900620637;
        Sun, 07 Jun 2026 23:37:00 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:9a2:954d:67fe:d9c2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8521sm14423069a91.15.2026.06.07.23.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:37:00 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] kernfs: use nofail allocation for global locks
Date: Mon,  8 Jun 2026 14:36:55 +0800
Message-ID: <20260608063655.69-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_lock_init() allocates the global kernfs lock storage during init
and then calls kernfs_mutex_init(), which initializes mutexes through the
allocated pointer. A WARN_ON() does not stop execution, so allocation
failure would still dereference NULL.

The lock storage is required for kernfs to operate. Use a nofail
GFP_KERNEL allocation so the init path does not continue without the
required object.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 fs/kernfs/mount.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index 6e3217b6e4811..6cf8e71e5bd08 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -451,8 +451,8 @@ static void __init kernfs_mutex_init(void)
 
 static void __init kernfs_lock_init(void)
 {
-	kernfs_locks = kmalloc_obj(struct kernfs_global_locks);
-	WARN_ON(!kernfs_locks);
+	kernfs_locks = kmalloc_obj(struct kernfs_global_locks,
+				   GFP_KERNEL | __GFP_NOFAIL);
 
 	kernfs_mutex_init();
 }
-- 
2.51.0

