Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B1D369970
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090681; cv=none; b=PDB2ek/7QlI2UeouG0FJ8qdy3wqSP8uKPKlEyn6xpFnlrOtAuPvkA35TZiAnShqxkfj/tq3O2Cnf/khnzPAE9nL0sLmPS/sbFHe3CGKEiKTUsgT03A9n9jXvF6Pscrre339ZaMJahw74JsG0kowpDcgViMUzfFbrnGZTuP7Sg8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090681; c=relaxed/simple;
	bh=82uVRUQu11NXyZsVPm82V/B3XnM+D6pCFBkj/vD7jSs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aU+2t4ZsXV+j9jtWQUAQ2fTw2nCsdksUErl0Dws9+stlAuixJ3G8t4qzFfAh+Ix96QOpiD8NLiqsNflEnpJwUaotN+ztZRXkOZ6iwPSehvIwV8d9k+NE9RtL4hsPpkF8Uc5LGsMGKhu9sluwmBpThwwMrrAvpRqq7lhCP/M10s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=omkRl74L; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="omkRl74L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090629;
	bh=TJKZtWiprgUspY4RNaw1d9jTovs7Pv0dIVGo3CDvBTg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=omkRl74L9BnJ+syWg1rrYKy7TuMZlDspPBFpAszf+Zk8obRbGAlX6chTIfe8cifA2
	 4ipUxhZQ2Vj4jDg6S8KJb0ToAH9pM6Ng9yAx/Cu7afp7+VKhxPjxnywTqe9zX6+6SC
	 SU4WH+iSfkHs8XZUVngdMwXZHy1/bcmkMZ4hIC1E=
X-QQ-mid: esmtpsz21t1774090627t30d284b7
X-QQ-Originating-IP: AQ19W+u9FUPANAVegDK9vd8HUPQnUE5SAnb8ksdr+Z8=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 18:57:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2755794152099023227
EX-QQ-RecipientCnt: 14
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] drivers/base/memory: fix stale reference to memory_block_add_nid()
Date: Sat, 21 Mar 2026 18:57:04 +0800
Message-Id: <20260321105704.6093-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: M+Q6fuWNcK3qxaTfR/EjiLvlNn+SojSLtfYIRYWpvmnVf46LZVbR7cd6
	2h6EuqnnXrMJu9B5AjSCL94RGDYajEF+90vMPPHcF5tyRtNmfWVBedCC/G3PoAn3G9CmKmL
	uSsuOIGo7KFSEF75vcfokM+Rm/Nu0DcnCyZM9MFhTN8LqD/7brIVypvk1BOSOD/XPNViybA
	jGCkDNNVKXN4bWPLTVegdgHnZVIKscDEjUOvJ/RJKbVJQsDumdxK15yjgG9ajcoJHo+NU/D
	/NKhDPJAXTcEDV5bUUcuBj5ZzRDZ6w5tI7KVZUBezhlny8sTHzukPDKCwY9BhZXKXUOw+LH
	2HDbobROoRmQtvnee3/0F906GDG1FMwNrYPREvFel29SLcZD0DdNKObdvMF9+/XDMyAjuRW
	Un/+yWh6zW/lZIeHx1iCzxMEWJ70Y8yS1YvY4SrUaivW0XwL/AIGJBguUrzpiWUX/kY56lf
	YM3Qc1155Fw2qlpCbXw1ed7y1lYx1PX6ZMTWJ9jq/8zgMkWJEGF+j5Q7SI5KyprhWU5rB99
	kOq6IetHFI7Myecjfc46HGMe1PLCy+Ci5j8R5tS9dyGlhaA6b4JIemG2CYUpdl7bAg15cMN
	10A8/j8SLNzACz3jJdsw/mYz7hbMX2CMMY19JZsl2FAdVwynwmNMg91SzA/My1CNv/OHY4N
	JedFqzDUMAs1V45kjHV/enQTheXcN+ZpJKzcL1Vgv7CbKiq+4wF5uS5euv5henVELH9sNsa
	ELEjzZfAwdH8jwyhlAAmGzKRL7wUiCr0hgnm6tSaye1alD1dedx4aIo7jpw7qY/P7M4o7tE
	zQ1CT2icxAEE61b0IddO7vnlPmmO9AMZqbNkAMd9QK/8C6QifREiVx+ier7hOyvZvGei4Cv
	iCRk0WjHr9rscB7aC4fvGWedY0RG8WYVbSe1uMHrfH5FUU1tLxEBG9fI7cZ3hJwdY4v8X/E
	URR0Z271wAT5atE8bdYV6yumQSnTXi7B+CTCtOLpwKYvfkwocPtLxyPxmdEVKsvPs8YMIbl
	csjiNup8AtZXr9Upld8eMslSpOVoR5P9muefSo1JnTE2vZNBL+CpVVH6ZMTaWkqpMGpjniO
	w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The function memory_block_add_nid() was renamed to
memory_block_add_nid_early() by commit 0a947c14e48c
("drivers/base: move memory_block_add_nid() into the
caller").  Update the stale reference in add_memory_block().

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/base/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index a3091924918b..0d6ccc7cdf05 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -815,7 +815,7 @@ static int add_memory_block(unsigned long block_id, int nid, unsigned long state
 		/*
 		 * MEM_ONLINE at this point implies early memory. With NUMA,
 		 * we'll determine the zone when setting the node id via
-		 * memory_block_add_nid(). Memory hotplug updated the zone
+		 * memory_block_add_nid_early(). Memory hotplug updated the zone
 		 * manually when memory onlining/offlining succeeds.
 		 */
 		mem->zone = early_node_zone_for_memory_block(mem, NUMA_NO_NODE);
-- 
2.25.1

