Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B773D8113
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313080; cv=none; b=tBeMdI6eWnXMSS5CGCQzTzz7GDIOA/iuCopKBK4QjTEB9OkNi2RKZ7CEJjW5g4yT0mx4srVv+1nKYMBOD9mjlVoUY7t9+bvsNgARGhKtkjJMRjeyWpw38UL6DkJs2q4Z34lmESbE4drRCJKjixYYPSbGzzY1cUaVuY8No4gHTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313080; c=relaxed/simple;
	bh=cz/Kd5Fg1n6RVtyFBzJpN2apXZy9vJ9be28aEaW5jhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1WrJoGEmQZ5RhziW00GDlqGLo9tiigHa6kL5jGpoLv/MpLhxoJwM9glKk5Z2ulTuR5tAgXXrTYvuqMvIDEPIZfm1ejGOaf0o5RPTvfvj22R08uJrLSyQ1oZhj46gHPoLi7pmX5MoYjqB0+D/en1TYiahJE1Xf2h7wMq6E2uaEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jbRpIgeQ; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jbRpIgeQ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51778069c31so7689211cf.1
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313078; x=1782917878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQoqst23Sd/uqsFRXXVKz4Ck7yyavMrD/eBg48X+nsY=;
        b=jbRpIgeQeX5/AM1PM6aHkUyezKeU1wcxLP+1g+N/qMWZceh+8VsoiuEk0ZXEJiYIrC
         dGnYzlPn821da1skuBzYsXefn+ImK+eD80XbUWspQym1FPYSxHyRccPF5lmeYVhg7DDM
         gVT3uDug3Cr0g6onxaAp8KZD9vecvRH4ZVNEXQgqCBxWGtVsxTlHssDH+KWqbimJnJ+6
         a+1i1lnxKj76mvroBlCZmwv2grJ2s4EpG6cGQYF3VytNKi7b/0c8dUkUOSQJ5RkA3QoQ
         goBezJMMWzUO5QBUFvOXiumh6pccInsznwDBexgdF7uRhg9hp7xCsIEWD3cK4TOdqMzg
         uHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313078; x=1782917878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQoqst23Sd/uqsFRXXVKz4Ck7yyavMrD/eBg48X+nsY=;
        b=cwWZwknq4Gsoy3NZDwq5l96Qr1uCJglz5REbplj/PwXTVEvcsnk+cCOCiIBJOcK+fs
         jLPKJeeaFARdbGmHs5YvlMoxEjwGNg74Bg+YIdDVx5DOZJ66+gAgrh4CRYE1UC6ItQvg
         mo87JTWo8fDi0Tqe0b5aA9Ik65Y2MctkvtOY6UAXPQFW8TGIIHU/qYDxfdMnX5ZbrjyV
         i3xhgwlQAx03g/7/dHrFFPiYq5qpFTw2ptE4cFeIgkmwn0cdfaiy7V4j13QD1/TThv2/
         na3yg07kCVGOC/2CWJ4BJbiZgItlLj8K+YFu9XklfDfQKjycaOaw5NPXtdH2MAP5t81G
         gSdw==
X-Forwarded-Encrypted: i=1; AFNElJ8QFrkJGK/r+yhxoFOQGeT/L5daamiLZ4MQUwIxrHWEdVV0vIWcwdjb7B6WYZGz/H4FljOYb35Ye9bjDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXfwF7kncwG1XpMukylA0KwfhXEf2o5S8xHkKd3Bi/vFL1oOQQ
	UGJoGRzHhILprZGPDUTuAjQdJ2eyxVlQfiPMQkwPSrwUxKAgqktSK5DLELO2b9BFVSc=
X-Gm-Gg: AfdE7ckTK4NUIE/2xQ0gmkt2hFhN4/6TvTt8c/q+NM7G18p6NOLDebnx60pq4rNq07f
	6clx0gcosdvWpbH4SejDo7IQMpNdOB5RIXOueFgR5fI0xjrhR9q5c0qqhQGXIg2E6fHD/IH6lOk
	bbHwWqsvxUAwDF55ssBlo5HfEUUJoSMIU/He74YTRhEDq9DE9HoUWXMRMBL+FpyWcDK2zxYhC5e
	5lRYIibBON007STMAVP7Pkf1ow+Dygaf432G9e+4QlzUSN5c7sYyHmA5ceHvGBW7x7oXc7CCTrY
	CsbCh7hBqxCidcbPQDZPOFgGu13IL1Mu1nD/RyWzGNXzGVRIW8Axg0rjNsJIf2Rph3zIWbhNq+Z
	ukH+Ynav0d5LYDPQGhU+Sde9P4y4+sdLo7bs7TprIUtCA/JuiDjktxss1L+dUo1e6yiMLDFaEdk
	1LgGhRin5VI4To1CmCArhlgeKJ2RCA4aYfSMr1g/6rQHkJjhI1llmn8mfCALD4WHv56IK6ANyJs
	g==
X-Received: by 2002:ac8:7dce:0:b0:517:7e26:36a9 with SMTP id d75a77b69052e-51a5485b854mr12138801cf.39.1782313078372;
        Wed, 24 Jun 2026 07:57:58 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:57:57 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
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
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 2/9] mm/memory_hotplug: pass online_type to online_memory_block() via arg
Date: Wed, 24 Jun 2026 10:57:37 -0400
Message-ID: <20260624145744.3532049-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>
References: <20260624145744.3532049-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify online_memory_block() to accept the online type through its arg
parameter rather than calling mhp_get_default_online_type() internally.

This prepares for allowing callers to specify explicit online types.

Update the caller in add_memory_resource() to pass the default online
type via a local variable.

No functional change.

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 7ac19fab2263..6833208cc17c 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1337,7 +1337,9 @@ static int check_hotplug_memory_range(u64 start, u64 size)
 
 static int online_memory_block(struct memory_block *mem, void *arg)
 {
-	mem->online_type = mhp_get_default_online_type();
+	enum mmop *online_type = arg;
+
+	mem->online_type = *online_type;
 	return device_online(&mem->dev);
 }
 
@@ -1494,6 +1496,7 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
 int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
+	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1582,7 +1585,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 
 	/* online pages if requested */
 	if (mhp_get_default_online_type() != MMOP_OFFLINE)
-		walk_memory_blocks(start, size, NULL, online_memory_block);
+		walk_memory_blocks(start, size, &online_type,
+				   online_memory_block);
 
 	return ret;
 error:
-- 
2.54.0

