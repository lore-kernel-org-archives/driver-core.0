Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635045;
	b=yV8ZcaB1qE59qY0oULgo27uMWY77hGwbNm2ZNxRAmQ+LxsMxz5bAqDX79dHlY3fTe2qg
	 Izs4jyiTsl8f6x3cflbd64enPpfIPyKSUBXCGhhp3/JcfzjuYHAtkADcMHZkAgxIuk1ZN
	 1ytuRqhIngylW6aolbBwLhQBJhj96pRtP8G+gVjWSPVh0uipRj476oH7J4T0bhyksxkCM
	 5Tlz9KhN+w2x+j3sA9rKill8JGlMtlvqw4ZhGqWQeZp4EmhS/kBcblSirRDixZ4meCkyM
	 D5vVCYn7YiDCNZvyhqL1qicPXPqWGzYxukB7lKiN0GPobdgtaeH/UuU/J3RfWL3rZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635045;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=2LxqEL0c09YgpVOKrP0D08bRca+IF1yQu3oKxoVysls=;
	b=MVg6vA7CEwZWgzz1jNomJjG7tVQx7ZRRiXZQLo0b70F+tc9TJEHCy830Z0at6cGx3DpD
	 xqBmB1DiAaY86S4fWvxtwYCCyToDQHZQN6l4AS3NDZIUY97ncEAC5ARlq9AugXmrl0qHV
	 +UqBaaPXCsTROEiAUp9u5i6YkZA/3100B86XD+PbEdZEWHdxmLgLGfScr3GXjbbG+/F+Y
	 0teOlsUO2eoY4Nu4kB+d6W9KeQ4Nz3iYs9Z2f1Yunu0OL6MkZ4MPqUJbiFrEMpqxk6SuD
	 KTiOVnKBdDqwNjBgHTN7SYtNTtMdG77ciRTMuAxv0xwCbK4rN2nvt3SBd6tPuZncONA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=ZJmqvu0a;
	arc=none smtp.remote-ip=57.103.68.223
Received: from outbound.mr.icloud.com (mr-2002l-snip4-11.eps.apple.com [57.103.68.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED848606A33D
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 15:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED848606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=ZJmqvu0a
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id B02441800103;
	Mon, 02 Nov 2026 15:57:23 +0000 (UTC)
X-ICL-RepId: 01a19cfa-c94d-71b1-901e-5ee954807d78
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhOAEMGXAteC0kCQwJYEhVdRVkMVABGEVcfQA53AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBE0TBVIHXU1WDUcPWB5cFBcVQUNeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQNBCUoCWAJcA0UXTgVeBEYDXVMZUAZDClwXShtzBFQHXQVdVlACWlUSBEAIVlBeCF4fTBw=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793635044; x=1825171044; bh=2LxqEL0c09YgpVOKrP0D08bRca+IF1yQu3oKxoVysls=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ZJmqvu0amP+RS18BxyzIT8fgt2ogMdjfuQG1PMsJS3OpznfxohtxAqgHqEoWV4tBrJv+AgtsZbFlP9TCQfL/be+GuawDAJ3rnWcM7+5+PQsMMWMZH6orztVYwGfbGqjUAwfBewJEI4V3gsaeU5FqvUntDaysPPY72hHskDjWDHW/MLGebYBG73pyV4VQTyJCqrENLqqF3g/EER92zDYVimPvEMhkVgyEBjA863HXlCGEqngfh1ahhpeY0ed4vvnxLB7OrRvBe0uEQy7aMGnItR6KPHzHOfOU5RyxsFfDBL8fDWAWGj4jC5pkM0bKK/x8rByOsRziHX7PAIcpNU9qrg==
Received: from localhost.localdomain (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id CA87018000AB;
	Mon, 02 Nov 2026 15:57:21 +0000 (UTC)
From: Jack <jacktangsc@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jack <jacktangsc@icloud.com>
Subject: [PATCH] kernfs: fix stale comment referencing old @sd
Date: Mon,  2 Nov 2026 23:57:15 +0800
Message-ID: <20261102155715.6633-1-jacktangsc@icloud.com>
X-Mailer: git-send-email 2.50.1
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
X-Authority-Info-Out: v=2.4 cv=Qq9THFyd c=1 sm=1 tr=0 ts=6ae8b2e3
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=whGDNnZ4qqUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=9tPP0pGvBWh4zwi6mFgA:9
X-Proofpoint-GUID: OC6IOQq_fGMzM2Hs-VaUcTFJZCNpxcM1
X-Proofpoint-ORIG-GUID: OC6IOQq_fGMzM2Hs-VaUcTFJZCNpxcM1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX2OVIEZuw4HEA
 M2HfT1uWB/ngx1Y02qDl38aQrjUd67k8uY5RevTxEf9p3gsxy1eK035uvvm4yPID5knyKCbgbkf
 K14dEkLWbalQsMYgG0IIIK5d1xb+Rwm9zDxlrKqW4A+hStA9kZEIEkTMLiDYLe11+pYGdps+hzr
 6wkH+1qSHcmEyNhnFyuPvNxKsNSe5qEIEfJOQoriclRnHEm6kE6sdo2xNeGjeiKXcrzaPYWA49h
 D9pDKN91UrLER8/bTP0Ga4FUa9g1ntsjHtineF4eE3GAGbL7Y29X2dOdkXpKdM9Bok3Tq/PiURm
 y2EozCy+YZBK0xyg6FyRbRGcZQYHHiZr/wEFEj4w4tlg/JObzwpHHNBHMKgIqk=
X-JNJ: AAAAAAABHoDLA64DKmkuzYE6sIrOmA65anVKc9yEKfUzp2V5bm2sdLRvJKWKi9xpUBLxpn
 v5s1haI/Q2KMxDaBZezDnHm8/t9LHyU+7GW8tZ+knmkocUQQV4h94Qv7aF7uYunPu06rD8
 0W7OwZYFk1sS/rSVz2RqevpHGArK9AIrdsjHuPMvpSVAuIQ+hCV1V8sQj6ATde8FVoVYqq
 c+9AWY4S88xvOnJj8bhZ9KEsmCayyRUWISgEQlXZ6T6zqM9Vu9iPZvJVrRWtOY3nNFtR4S
 qBNXPWp2FJ++OzL3tLpaqW4YsX3Y/2kzOJzvsSAJr3h5eNhXlewte1Izx+Ttzs87DAddxS
 RlNsJb/LL7J1nigfVGX4rPM7Iebh3Xv9H06lVFBzauZZHKZm7f9susljYngiA/0xDBs8JZ
 iu+oEENaiBl3ednE8gquhZBH4FuWy3hpmmYwvtYnkDLojf/fTyCvdTJquILAItF7IB/5HJ
 kpQtdwpIALBej6QBhXsTFn2h1xG9+OgtMheht1xxsZkoGCljIo4NdMRWPVNwWSpfCHc6mf
 9uy5uAfplyfIwlCIVnSm6MT/sR2Q/3z5/F27DirRqw8gJYovLQXZm34nEInXVWFZ36wxbe
 0Sjf1hCTixjpWc3UAKeEsaCKpWGkKFX3VwqozcNDMCQcasFZNe7+6QSKPT7PNGZ/vHDLnY
 551ZIYsp5g4d4DBQRA4WNCxugBXFgCFBnbYgnfiwgvvnIjEYKmHX119n+SeZkmbnF171FV
 RO5PTryfvsy+r4K3C+7wWPIF0cP1NnFUISUCK2EKQxbHhbMh2GCCdsWO3g7DG9E7Xtb0kc
 OwulJ0r9T2oLcZPukAiRgpjpSsZGoftfUjdOJ4yJuD1JYeArfAiLlhuOAxGdsKZdwNV7+8
 ZLqK58l4Mm+CyPxXz3rlRrPKq2wNDinGBHErWRfTf/SqsVnfvCrRi81UoEkHJHQLgws23a
 MtcoxGXuM3rr1ib6nTsTMFddDu3erX9qwu+Kd9vlX6zPMhToV3ELRlKG36q5DNuRZOnxLW
 Lm+L9GIDyUiDjcGkek0Nzp23WWy+GeDQ0IdYG6XFRe8DVaSZUusPu1EeX7Bv4mtnsp3DUe
 324RE+0Kh9476pdh5oZG/20ymCdlo/r3Pxy7qSTyLMKvxui9f1cWzSrHzYZunrccZkJnP0
 1T1o/hfU9zHYazBqPiV5qu6xwDgpdCTC0UQu4mmw6+srrsBS8Qrg==

The comment still refers to old @sd which was a sysfs_dirent.
Update it to @kn to match the current function argument.

No functional change.

Signed-off-by: Jack <jacktangsc@icloud.com>
---
 fs/kernfs/kernfs-internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index f1e93b09e..0fd8dea0b 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -72,7 +72,7 @@ struct kernfs_root {
 static inline struct kernfs_root *kernfs_root(const struct kernfs_node *kn)
 {
 	const struct kernfs_node *knp;
-	/* if parent exists, it's always a dir; otherwise, @sd is a dir */
+	/* if parent exists, it's always a dir; otherwise, @kn is a dir */
 	guard(rcu)();
 	knp = rcu_dereference(kn->__parent);
 	if (knp)
-- 
2.50.1 (Apple Git-155)

