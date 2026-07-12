Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C43343888
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871130; cv=none; b=abWmM0II0OJPewU1Ex/IyhHrlbzgpYPgTBWaj9OGhMQPg+vxxe7HjrcO/Tc5P74qqlBpLGs1Db69+ejAY6VcOGhIs0hNNZTm91Xs4szo0zBh9coK4Ky6aJsNT3IR7fLSONzAtuFxFkFuaf0MWGodJslsTl8/lrjjmjbmpR3GpLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871130; c=relaxed/simple;
	bh=JQAGfqE0PffesD9sKQCzYKMipVFSPTwh6dBNXQMkTdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svbRWaSt8tzBxDEJiNEd77NMpqPdiH+NgsZGj+X7RJ2HZr3yB2YCDOg85fk/4UR2/zjWQS0GzoSvoiuW1CBRUjWN8Ay560Z/78oKCyOouB4zxIurZ1dYcLMSCjK3W79W2rFkkj+RpT5/F0yUKZFf6KEJFHjpdNG24LazzLxtNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=VBkLZpyS; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="VBkLZpyS"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e7c6ec9dbso93921085a.0
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871128; x=1784475928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BguinuoorksxpsezVhTMBAsbvTRcZT92EAAvPgOWJAM=;
        b=VBkLZpySWyNCGayR2O6PgN9pfK2MwXHk/IBnE5kmGyzhJtl+zIfOTwghFdxigDSpS9
         2DmPb9MMEJZbXlJsCgTVwqNpM6aXwSGmd/pJZHA8ngacI8Vpo/CsFpB3bKE6H/Qtu/35
         Q/yrLuTnsrHHr6hymW4mb8qHkjQ1noxHwS6XfgyxLoizxdtcMiUrU84OdtkblYxWWRu9
         dZ7u0mmtuy5asRO+muiCoogEANX/eNa5V5ZZK4tABq6nO9JKJX8KdtYZJNIG8ZtXNw0J
         x3cAjex4WPz8w6RrzhoHEmmo+e5AdbqimqhhyVIPfAq1m8RkxvaSJ+LqsErcKagPcvJW
         N95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871128; x=1784475928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BguinuoorksxpsezVhTMBAsbvTRcZT92EAAvPgOWJAM=;
        b=iia1UxzjR6DVhh+xA1yWacQFwI678t13rWPIKMhODYWj+hc8JP0USM/vjBzyTInerS
         bo0ZO4+8wefGigFbJa7YwuQ9IF2GkICVMYxYOt2YmHiXOVDOIZLbrQxemfRPpipkjsRI
         qo2OpXwZQd/VUD7eOb640L2DG4fgneo+qcG7hPGpNNOSBWS45EsZ1BMlp67sv3qZlBtF
         u/14PUSu4buHoeZxF/qUN4o58v4AcJQqKYTXescaxdDmjobdLtiYn86x0juF8iLUGyGT
         iXa+d8fMIdE8212i6Bb9Tpn8uFTYN+wh+mUCnHP/r3toa8bf3yan3H4z5fG++pDH0Lad
         gsqA==
X-Forwarded-Encrypted: i=1; AHgh+RpRJRaQLZIAa+AKMxcXpMknPLMLJyqTbckwAxe9NU/guzwfc2fcndNTcWRmyjjiyEc+3rsI+6rL6K7YFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxShgs/SdQm6q1+aQ7wq0K4u97JlPPEpyTjC+GDEwarHecHwc4d
	zeFqfc8Ett1AlgZGkQCKEcFG9u8DYs8q9UfwmF9CtlfFfBMDbj2CT52jFA3SrZ9KsPg=
X-Gm-Gg: AfdE7ckPT5m8N/hAPG7GjIcwyunmUKrMQyijmouR+SeQBO3yLvXNoYGA7Q3CTt/VULG
	N575gkPmVxp3mDlfkWw0Zp7+cfuidS18pcjW9Jxj56OPH3xNM/IJLrWwgR19UZprYlCoSEPpMQc
	9KPjQyC76C8SyCnZm1Ha8KrVumPjtSTmy2L28liKYOvU18l95l0+JzTOqXFuM4Ii8QQ+r/8vR7/
	tt/JGgDvsN0mCcKosVkrFabUkNsbc8nxfiQhOdbCStOkC5DeJhPYVoOqu9KP3N6Ee5W7VSGck++
	s4iYKxZRqR2dlX1id1b4pzNnWSpZKuhdU9pThlXH8ebwwDjk4d7WgOKnumRShCKmUQXArxXhgj4
	Wj0F0t5C+WtsRCK8JJqGQGiMs8QB5bGNDV9/WvC37kp4ysEl2nnhfcYViOjPqmEnJnPs8brcvnt
	TPYH2HS3VUygsVbO5X2hgAwZIpJ/7xuT6xN8vHvgtdgsUhl4Qb3xoKWABtaFsI3/+9k/qpa4Pfy
	v7+k8TEMX7E
X-Received: by 2002:a05:620a:400b:b0:92e:c117:5ed3 with SMTP id af79cd13be357-92ef2e222a1mr610227085a.83.1783871127659;
        Sun, 12 Jul 2026 08:45:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:27 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
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
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net
Subject: [PATCH v7 07/10] dax/kmem: resolve default online type at probe time
Date: Sun, 12 Jul 2026 11:45:01 -0400
Message-ID: <20260712154505.3564379-8-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve the default online type in kmem at probe time explicitly
instead of implicitly inheriting the system default by calling
add_memory_driver_managed().

No behavioral change at this point (still system default).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/kmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 592171ec10f49..38ed5c4e9c83d 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -73,6 +73,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	mhp_t mhp_flags;
 	int numa_node;
 	int adist = MEMTIER_DEFAULT_DAX_ADISTANCE;
+	int online_type = mhp_get_default_online_type();
 
 	/*
 	 * Ensure good NUMA information for the persistent memory.
@@ -172,8 +173,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		 * Ensure that future kexec'd kernels will not treat
 		 * this as RAM automatically.
 		 */
-		rc = add_memory_driver_managed(data->mgid, range.start,
-				range_len(&range), kmem_name, mhp_flags);
+		rc = __add_memory_driver_managed(data->mgid, range.start,
+				range_len(&range), kmem_name, mhp_flags,
+				online_type);
 
 		if (rc) {
 			dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
-- 
2.53.0-Meta

