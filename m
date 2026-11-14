Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640250;
	b=EXecgXIot90M2An8/yptJFcmRXYuzsZIH9tYMlfibvSyCuRSLExmwKXxpzY0SBgN3zNL
	 ifAcHnnUmlJtQrAVMxEvFoXsr45Oo8HYzPxQ1rXJbAAzBop4SM/gFs3EbCtuwEq6RJwFL
	 5pzo45V7KU24xz9XI/svynkJZT9P9M0AL6tucopwuNkcVwDp4fITCif3iIlp/7jOGIzoG
	 i52enbrgvffL5G+tHkpusHvuEwNhpSSBKSMWFxXhw1b8QaJTCuS52IGpMCTudy8853Il3
	 2+p4WsCla3Tqy5BSTgosGbtiT2I3tk17tOsoM17RQYubFEIsxk6WbxAO/QfwCL2wctQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
	b=t+7La+EmQzIITZu9UwA/Tj87HN6+9bUAjLQEOlUpIFdHrjPXht3yRHkDy0ZPWTCuGt1z
	 Lw0Sw73Z61utYDyPCE9a07IQ7/+B9jhsUaqVLSmOOeNE9NC7rWVHZCf1Vk4HbLpKO1zVs
	 ka4x1c/isgFIfLD8cf9cdAGo/w7uQFRWzAmxTt4Xo8HOypdE0KG2UICXRpGyqij5fhwXA
	 K2BkQRrribq8MeOOtZGGOyEoe8ul+wymQA9sSZWPPJ+OgiBnSCHIndueHREMOZhV/Qc8y
	 qcfY3S0MiPEDqCX86WHTQwtxN2e5zZBbtsU80JjbitTxpXS+K1oQAPjvbeaY+eGjNRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=O+NuE7yJ;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABB8606CDA0
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABB8606CDA0
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=O+NuE7yJ
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ecbdf5343so39953006d6.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640249; x=1795245049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
        b=O+NuE7yJCUVW6psoSHUYWGYn3ng2wjRiWLi0J5Qq4UrUBBiZJCrgfA8lzn5ZHoLlCB
         eGtb4Gcuxiz5zJVuRwUKpUuKBsN4en0Y4S9gwpLeW7Cc1VFAQNKnrZ5aoANw6wH8To5l
         QPmnMcHeTfOYl6vZdBJO3dP9koJOlbIU6ijbBMtUYEXfhANmOItjylVGxNwFiwFNfhv/
         Satg4WGtMrOU2O03ueZ8QZtFqK94BtEC1Sp4GM28zvWuHmn/XzzFnV/ELqztya+oRfyp
         7GKXfcbic00cf6v7mWGBwlHx2E2DutthCihKctaL2qwuUm29gJI8q9lZZ4pzseEFJS1M
         0b0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640249; x=1795245049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
        b=BZXdVGv6easCAqqmdPS0Zi828LVT+Drh4n0SSALO+JgfXkuVuo0GtOFSIlRi68sMtl
         lMmlSzI7THVtNCalEFdsnIFzs3qqgtbTpitzXeM8Rd9Zud3mrxEZrdKIxqivFrbnWgzP
         WxRKKZw3pxF4zUWdbDPU0Vc74GReWtrHuS2F+V3RGgyYLCGWuzPnpjERhTbcA082dwDs
         fGOSmfYUUZ0zOC/B1DrSlcnB2iENeNuXpoIWoWKb0m1xyNBbPgMonK27Q83sjBBboMtx
         nIlPgO9Xt+lz+TdxY7YY66B0Y5atC2UTs4wvs9cJ6TlfC48Bo/OEGbn/NdMEphZ/5XKP
         KyGw==
X-Forwarded-Encrypted: i=1; AL+hErEmZkvjxzO43xGhsmhX1oFo55wOHiTDr/wpKwjc7nUUjGMtfg+4os2tuIutbTYPXi6LYsN7f9DRMb76kg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+PDcFCazNd8qEu8h1WchrJIbKrSL7NMYPimFJrOWxsLUh20YtL
	1PydD0T0nU3aO/dKOyPw6nrFYOWIgVRIOX+X4cHbecJFlM5T+Xacskl5QK7DNLsdFcU=
X-Gm-Gg: AYBFou0Wyv4AAfKKcUgfAtNhsXBDfadrsyqy6J5MUyyPpffBSWG3+RRgApnmPINoAUn
	d8QJ0nhRFUZCpZFfZuGfalX5bzCEAjW12u7Mi3VTrf1vDu/rKQRGuD2Kvwecu2/4kvblHHPQNd2
	f9AbovU3xGm3mfTwc8cUoF6QyJAAJZ5fsOkjUeEH/AF9jVBv1+Iz2v44IYpqFY9eStIP50jc+rH
	garHZAcT1aNpMmqr17Mc5NXXU+GRszMyUxEMGH4+IP82RD0ZT4/U9UvFOepvdLbN0eW80YVFRNu
	LLse0j7kZAQYIJQmW8VQ5/HR4HU1ul83Q4m8MiplYCW7I02dU9CM7pssFVbxfI/MdWQe6o4p5rc
	A9OB3avajntw16OS6Dl8ssy07VMy0UqlN8gmingZNgGjJlz3wUslbHDBUoYYWiuw8SwZ31HZsCC
	8AZEPuN2BU+quFLuw0gPoxuqaMX80Fp9LH31m6KVQ3iNK2/G/RKk7fjHHAXBdf8szupAelb2bLJ
	qV9QJ0cD/LPs18dZ0o+F4so4kd0WYV5XbmIK5iNgWvqRhfh83StmXORPb+sOqZoof+WOSF2Jke6
	ayURJ3qwbWwYQ8VkRK7I7xZ19cilXOC18xQAI+8Pd+aMKmFIzWRdMjt4j1D9hFD2sj5lKa1W8FO
	57Ljgo3+l9k8txOc1
X-Received: by 2002:ad4:574d:0:b0:91c:913:462c with SMTP id 6a1803df08f44-91f23f211e7mr73834306d6.0.1794640248788;
        Fri, 13 Nov 2026 23:10:48 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:48 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 21/22] mm/khugepaged: base the recommended min_free_kbytes on common memory
Date: Sat, 14 Nov 2026 02:09:58 -0500
Message-ID: <20261114070959.3490008-22-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_recommended_min_free_kbytes() reserves two pageblocks per populated
zone to help THP allocations avoid fragmentation. The reserve serves
ordinary allocations, which use only common memory, so count only the
zones on N_MEMORY_COMMON nodes.

Every node with memory is common, so the recommendation is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b4bd29f25c145..fac314b89a234 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3149,7 +3149,7 @@ void set_recommended_min_free_kbytes(void)
 		goto update_wmarks;
 	}
 
-	for_each_populated_zone(zone) {
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		/*
 		 * We don't need to worry about fragmentation of
 		 * ZONE_MOVABLE since it only has movable pages.
-- 
2.53.1-Meta

