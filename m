Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.84.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706926;
	b=l7wC9wputiBh5FjdCmiZ4JDGCVqdARPp8SYd++84LpLaeE/y2vFCj165strjBYLghEKT
	 5bhkHGAFthXZ6196kQJXtQS2T4+3UGABVmWNHNcuL9nqFhTlRm35jdMx3SuEJkmDkPCNw
	 awAqj4UjW/WkDWlovt/RH+loULPjWiucBkPlRCb9rs/KVHwaY3uXmQHiMsVHeIM4X9x1Y
	 l5ynyqQOvyKQ0N1cXHTVrcsHBK5tfOwPn1Y7ImRDo80elxM5SJCKiBKAbAIZ11mVe4gQQ
	 MqDPdoNhhqbbYG/YzhCn+paIKkLwmUX+rY/Kdh7oOEvaxwL+8o/TAGziZv/4SgCOAag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706926;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-JNJ;
	bh=f76CyJ9mwV3i+UpkEsml6LZZAUrkkYxlZzkuecGkozQ=;
	b=l39WfhuUzfxRiFqAsNnrX7pAVO7T6KxuzJMS2jQDD8vIeb7gWvZK8US3ywU51HLlPFqZ
	 geUmCL1pN5wnkxJgfuIeAwmJiXTEHIVV9rKi+R2KuXBJVi505RVwbirK28ORP53E6H1qb
	 hAQ3kNC710i2wKKX2zS2h77pxuUQWvjVC45Z0P1hk3uxP2V0kCBKxMtnN1PbQacPwaFnA
	 TtVLQMvKEZCtaQIWC5sxdE8gBT5LrWcsDhaahGKw3SGXamPUhjaz166oSmxHvaj9mZzP4
	 IA2ezM7ZxnzqHLgL56sFBEp+wa2U+JXkcaciEGRtmUTzvGL8uU8AjpYepfmF3FHOOLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nRUc5uVG;
	arc=none smtp.remote-ip=57.103.84.105
Received: from outbound.qs.icloud.com (qs-2004k-snip4-2.eps.apple.com [57.103.84.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DE8606A32D
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 11:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22DE8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=nRUc5uVG
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-4 (Postfix) with ESMTPS id D56161800118;
	Tue, 03 Nov 2026 11:55:22 +0000 (UTC)
X-ICL-RepId: 01a1a143-9309-724a-8a23-45ab1c42f372
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhOAEMGXAteC0kCQwJYEhVdRVkMVABGEVcfQA53AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBE0TBVIHXU1WDUcPWB5cFBcJQENeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQNBCUsCXAJeA0MXSQBbAF0fQRQSUg5cH1MeXgtQLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793706925; x=1825242925; bh=f76CyJ9mwV3i+UpkEsml6LZZAUrkkYxlZzkuecGkozQ=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=nRUc5uVGvnlFJfL8+DGJHIS48jd9ZVhXeaFPo06EqwXM9Qurkzh3mE9TNRlmx/bcFSdX4MxS/QdBiK8wjfXeReNCbHHsCxzjyUD5+tM+qLKEJyXuP9dOzZgpBHM7bZV05LXnea2QtTPFPB2/dNTncfDLSUBJXbZEezRQsyfl7z3nLQwVx3l3VduI3bramYEg9UNr8dd+0EKQpwBIdquQs3FoFvj5rCdnRKdurQc/jZiGp994LGFM3/7fRrtZB3p1gGyHFhsLktyb6BHp/obumLmOJPEYb5auwU+OY+hlOiXcQqlnWIy3xZnLHJDLPYTbQbnemUDAVN7a6yXRJe8jiw==
Received: from localhost.localdomain (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-60-percent-4 (Postfix) with ESMTPSA id 45C68180019A;
	Tue, 03 Nov 2026 11:55:20 +0000 (UTC)
From: Shuncai Tang <jacktangsc@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuncai Tang <jacktangsc@icloud.com>
Subject: [PATCH v3] kernfs: fix stale comment referencing old @sd
Date: Tue,  3 Nov 2026 19:55:13 +0800
Message-ID: <20261103115513.13676-1-jacktangsc@icloud.com>
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
X-Proofpoint-ORIG-GUID: LBqpdxxDHIA_-i2ro2H2gXpREnbaH-eQ
X-Authority-Info-Out: v=2.4 cv=COknnBrD c=1 sm=1 tr=0 ts=6ae9cbab
 cx=c_apl:c_pps:t_out a=bsP7O+dXZ5uKcj+dsLqiMw==:117
 a=bsP7O+dXZ5uKcj+dsLqiMw==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=whGDNnZ4qqUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=uR7FC2m04KeATL-xc2kA:9
X-Proofpoint-GUID: LBqpdxxDHIA_-i2ro2H2gXpREnbaH-eQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NyBTYWx0ZWRfX7BqTvmYD4dDp
 AQaqvtAcSTbVgcbthCIZHiO4VfrfCbhqLdQ/Qb0dw9m9i6Nm9rfbsoVCxuvxjvevlYIZypf90pv
 p/ih8oFWn81bD1vGVa5jlWzNa1cttOCUpkc5k2abJZwCLoi64X2j82A8tIYTByaBAj4bJP8lHlM
 VLarl1trOGWBEiD+A2zRU6ZXTOypnuusD8YBFbReZdJOagROsxLJVS1mPcgmrxVVPfUDltvZrRx
 v5OA6QQbLFe5qI2RwJIaU53amGMbiDhRAwtVCqSkDb4RFi5RvZKxqAy4WLwwGk4913mfgwAoIQk
 eFz/1zIb0GYIPVbJQVSFP26y9Lb/HkN7m0Yj+ZB3/N0hQ5eN+uWS143z6wAl6U=
X-JNJ: AAAAAAABMoCVOV7aSQhF+AosBEBhmiU//WmqJ9e/UWN7FdeoiOUvQv11zBmXIeGYoXxw0L
 IN+VH5WrYFRxAW+gg5dIwlwTbwGJYu0OAm4PG+1+cAhR+aTu9G9vfLQ3QBGMxqAIlSVW3v
 aaFrW6sWGDOBnLMg6mE1JJVRGJF+pu4QnApp97Wv/097Tlzn4RaSZKtjm+m7eKjOavMV93
 Tvsk+R99noXmKzk13xWWb2mBhGLQAZTOYHfZCfNz1uozE8l107fzBn9ZrSGYATnUFm5N+r
 bauwoQYhKghiE057HkhQ58TCvCzYMiCTplXl7wkTt6p+T4Osahf4uVEe1UYTpHym0g5Ge6
 2AxAOGLMYrVnPxPYOniekpj1ENz4ZMVNGgdcyGsb3PS6HRXH/pguejSMNCxM6JrA7/b1xm
 TuECqx5Gaft2Cj52TiSMMi+tI0JGxU4vuwFk27eGfMNDGrK7bfY5thOoSbGK9089FS2r6J
 osIM3N19XMOJdzVC8ZBBom7kSvhoEKmA8JoOJwfVIWYWl9ukVwFUvBuvj95Qtl6eyGWz7a
 tnsAm9m9pR5w6Dl/0V5Lm2aJjBnr9Q5TLjp9CzOYi5W97R/Go/LuIhEzmfXn+Z2B+e31sg
 AHPyiC9ad5DZK1iOzZvdsAzWympPxdfWasAIguCIpqOrJ+ddeG+apgy0OD5gRvbjzpIQPC
 UBdDCCww063IqdPobfaFewCej/pOfHiEOHqnlHP805oMvmj4lzRAuLyhZck6HZvHlb+hRn
 h86N4oh7MF9GaYA30Hax7J9B4Gr2AEJgmUTQkJjzQIMqVhNSmZHWLbMd2Nzaa07kTH2Tke
 JCmNhKywll4a5zhr+4rPICSU7E/TxdY9KIxWl9DexvnWzMWYNqmsBpxd279uTVu8uCU/7f
 K0l4w9qjC45mEU8zqQ0pfXi65CoP5VK/Ji2U758NLNn2Gzkq6ko9EcI3uxjEfEPsPjK+Ge
 MyYnDkvyUxvorydluU1tr+HzwJ9Lj8x/QFu88aiJYlld+saVBBU1QG0FsL+/iRVr5w3I95
 lp5qciNfUbnsASn7GXPx4Wr1/x40XrHTgeY/dslEkSbibIXkDDermX4x8ivG09nuz6Dp+g
 7RUMrRX4F1k2+x/zbciyGXlTPe6VoLYHppfAi9sIIY567d5ybHfMYG7q5HYx8VFv8UiC6n
 Uat20zQtYOrpIXxmxFWbIjdZnDRkmfaHrMkggJArdvel4SiZKNQsY=

The comment still refers to old @sd which was a sysfs_dirent.
Update it to @kn to match the current function argument.

No functional change.

Signed-off-by: Shuncai Tang <jacktangsc@icloud.com>
---
v3: Move version changelog below the --- line.

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

