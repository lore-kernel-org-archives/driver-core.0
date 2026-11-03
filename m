Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.69.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679966;
	b=M+cNnC/XaUxVTPSuvfQXJD+smCvX3S9XsmpCaDNVz2C6qQrehkC/XwgKXFNnO1s1kh1p
	 mZwdkEIwvd6iagfkqT/LFv8yND5bqEbYv4Z+ktGtKMIrv1FCFHCNOFVY3OrcoETeadZIO
	 W/rSgCIcW4Ns1ROKkPdwJB12x2UCvh7dKcN60/JUew3CDaaS4Qg+tfvAVLleKWbzHHPf7
	 P31yg6YK+qxsjWDLbtkrPreqy1u5nfiJL1u1P8phSJKwa7VzSV+tqAvd7X1AJqwC0kWNA
	 HEsAGo1ZUieABDJJIB1jZeopIdh9BMCcKq0rQJ1fEsc3CtO2PrJnHrbT/fF5+KqZ23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679966;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=mtdip9iG8kvZwfazJrrk93MIJWiLG6sxeuCO9RkwHoY=;
	b=dDG7f2x1XSCvfiuj/mvHZhcdAcBNXUYA7XqqbvNf8lRXePgmiuoVwZVyWSv4dI+vBTVl
	 fPVOBvCaxguG+KvkU4hx3hhxRwrGaZo5j15g8I3LMKF534PbA9TW1bQk9K+q6lR8Ke00W
	 OKC118NJKUXxDMUjLDY/tcPhwejoP0P+n/3JoftPFuU3nS6zOVLnQWIITIT5fCKqa6Ugg
	 coatRw7WFvQwYnrwfl4YGv6FEtzKxMy6wMQI0BKn+1PFhrdrbxGirhaGZyv5GSreHRt3M
	 NLrPvF4Vxk8GyM7d8AD7x6L+iNIiEXVO19Zu2/Ty2gFIVTr93KlVPgj07wAkgzKtOGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=LvVBni9+;
	arc=none smtp.remote-ip=57.103.69.161
Received: from outbound.mr.icloud.com (mr-2004e-snip4-11.eps.apple.com [57.103.69.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB7606A326
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 04:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AB7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=LvVBni9+
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPS id 9CB21180016A;
	Tue, 03 Nov 2026 04:26:02 +0000 (UTC)
X-ICL-RepId: 01a19fa8-3188-7563-9f7f-c3428e26c95b
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhOAEMGXAteC0kCQwJYEhVdRVkMVABGEVcfQA53AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBE0TBVIHXU1WDUcPWB5cFBcVQUNeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQNBCUsDWQVeB0EXSQNVB1sfQRQSUg5cH1MeXgtQLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793679965; x=1825215965; bh=mtdip9iG8kvZwfazJrrk93MIJWiLG6sxeuCO9RkwHoY=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=LvVBni9+GdldmO1lNHdGu8sI5vA5rtmUSr817JBaJ7jJJjGXNzudrdvmv0IM2EGtkEVqO8ZTNWD7tvAvrsZr5/WljDKzU5al2iNSlqtIrC+myWlGylyIGWGVCMb++AKcuxq6UgAOZNHVFBkSw+pVALmJ2vOsSWC2RIYAShbzg01gFXIHJUWrFi6OGMEQgtco0Psw8KeQxxF+pK1GFCTb10Da9eNaZd45MFXCU4mtwOnl6C+X4xibNoT82k8h9PLBl6KwKrhMii0LzXpnoggWNacTgvi45CCEiTwdlMNirGmz4V6V7FQsLEn8UVdLjCKqAdrtbIozquprAa+JcfKK7g==
Received: from localhost.localdomain (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPSA id C81AE1800114;
	Tue, 03 Nov 2026 04:25:59 +0000 (UTC)
From: Shuncai Tang <jacktangsc@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuncai Tang <jacktangsc@icloud.com>
Subject: [PATCH v2] kernfs: fix stale comment referencing old @sd
Date: Tue,  3 Nov 2026 12:25:51 +0800
Message-ID: <20261103042551.10800-1-jacktangsc@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNyBTYWx0ZWRfX+Ih8INbMCFOn
 pNpMW4xiubBH5S1bMX4YVBeaPx62QPHxd9nSQWS2TnRbjey5MDDqYeWTjtbPSjPRg72HbbBZTDC
 Zn9b1ca890VZzyGjGlx12Mv8ysfAnQlAEYtYqjbQzahdJykMDAlZDoUWrnOkSZKkfhbIRpFwSF/
 zZeNUJhaxE3q3ss7ABb5G4sQ01g2DMK2IrhEr/6whHIaAwn5Yt3k0UPlYOtpakHinRX3bUIXedU
 IKtwMq6RZ68IRY9kKT6HdbjAxHt10orQSSuIuCtBd3r5SpNHpqEVA+EgSxZPTL2B4mzzDFjVmh5
 /nPGQQgnFUyUnKXN5y7EliHad/nVelCrXajqin3DKTIj+TBzbXtsqAkERrZ2I0=
X-Authority-Info-Out: v=2.4 cv=ev/SD4pX c=1 sm=1 tr=0 ts=6ae9625b
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=whGDNnZ4qqUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=y0CipOANcWDlji84Qf8A:9
X-Proofpoint-GUID: aF-1RuIVUnogzel85srVTsc2MFAd7X3N
X-Proofpoint-ORIG-GUID: aF-1RuIVUnogzel85srVTsc2MFAd7X3N
X-JNJ: AAAAAAABCNCz0kjW5/o4zIVJnbw4TUlt3BdaRPTdhVkxJ9Uji4jsViLbRE+s9IrqrRoMvm
 M/3oNoXyaeDz2ES/ImL625FRtWj/t5VBqOj0oQxSUg7cfrWCJPG6Dt9ukY3NJr6LkIL7Um
 N2vAhq3z4/i+p+DcrEEWtVtCSjfrf8TkPNVVp2Wf0QVVNUomBh0JINCJLR/618OGAKUj0j
 Jvvucr1lZtKdt4HjCbAUAQSl0j4d2qUKtBGRwJS+mm/coEjRORgEBfHHuc80nTERsj0Ftk
 0MGkOPAJV9l74ke3s+IkralP9Ht5eiFKHfEkl2MD2Uo4lC5FnqtFPXMdKUvRWyIs/09NpC
 +446TKdM+lXknFUCVvuPIcCHzdxd4KDki1fC+AwNyzIX1w2uJgG3dfhpz6xSPQz9f9eIxL
 jq8tfSAdaeyiOt91aGJtjKvQWJ/HS22Ti42OaIYGVAfbm6abV0Vb3qsn4SjQBdd92XLmLr
 lPrclhEe8OE+zurE/uRxW2Qez2VYou4ZFIG0bMMVZtLW9QZebkxBskQKd3qigxdq+JxCDk
 Sj9f6jFgAWxrI6awwq6Yh0oWtS7BkhJ5TcOljg5KthL8SGLp60BUkXaI1eWXK9TvER77aM
 RlQCqenHTjf8R9M42KsDqIf8rAQP/KDiiXaif4GT7vsCv1SLwMtOikgk1pLe2D/UTREHP6
 zSExBLasfjQXXDm10KEua1m3+0ueF5po+vBVgFHqPe5XR7GpH2oRVXe21uUh4pILURjBI4
 NtT9mL0JZWBe6MRaSbC656MqmG/W22jJJRluPiDqF7fJwukB1PXbqaFXzld4dli7JkdaBr
 KsdTApnlHExoUrLLwkHRwlxWZ8+gudpn9gfvkcBgvJUnujir30DDWdaZr2xCiOhj0Y5sqw
 bkE2Uugq8xfxMJeTQVA0MTAcmdEszN8fLR0FZAtnzpRyv6ZzMq2A9ZFFTaUNs7E3pVfvLl
 THfMvIOHVnHDPtdjnfmzdCVlnb8AYBF08gjs4r86fBLjaGGWrTdO5JZDR/00HVDmTVu+O+
 xYd0ckeVNiHvMinB8UFl2eR88DsHCHkgXqwWmka8628qhlCdgrhRYBh5bz31LzFZpA9EKS
 mC7BTW0LisKwIZ+FBvbutpsamEX4Tdp1d9fVaGCQsA9jmDVlLd/cYlpOJi531g+/Nohab4
 ZPUIRAq1xD9fe5LP3xtH+IvgA/ULUHTGsWKf7TMgmvbnV5mNiFWw0qXrJYHB43Up3zlw==

The comment still refers to old @sd which was a sysfs_dirent.
Update it to @kn to match the current function argument.

No functional change.

v2: Use full name in Signed-off-by.

Signed-off-by: Shuncai Tang <jacktangsc@icloud.com>
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

