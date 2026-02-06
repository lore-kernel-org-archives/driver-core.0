Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7598309EE7
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373972; cv=none; b=JIs3PCpj2jzsjAsbwsJBlAZGjRqwgzqIPK1S6KCwnmZaM6+LrkkTJRtow0JwKexFap+uepVUjzy3fwAI+pXNhVxZ9HisvgIJjUxLeyr87KhbwOiVQ7BsH6cCAXWVhgCmFt9xGERwKudZb3sgxTPupnhubZuBR6ja5WrbXHP+Bcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373972; c=relaxed/simple;
	bh=hEmoAVYuBDzIxr9eEjk+1WK2ho+HzV/anGLC5ujrk4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I0vZhWPjxI8yZri6FpmkTGvhWzuu8cNByREorLL1J4kytXCrhndZgKg2z0/ZPDI0Ori9e41Zk2TTbRNXkjDOmiP8EVI9gCRwuLp0RaZ7J9jjV1FgvI04NRSayWCUA44o2dI5BpR3iAjeDDEWZQMUW9N2+X5ys2lI3fAjG3u9Ub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwoFupaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bcV8jp5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwoFupaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bcV8jp5m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Xd881852685
	for <driver-core@lists.linux.dev>; Fri, 6 Feb 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=31g9Av7sRhnAfddToHVTSlKjo7DknHOeQFk
	NSP0IhnI=; b=SwoFupaJqU1RJ9WID25bFPrTeflj4FpYu6r6acgNjJi1CRP1khm
	DAYnUfSW1kB1AnCOc5ABgr1F1At0K9avLXWdKcZMI+3HhgYocciLQt7kSp4imXiP
	AjxhkKO8yvpwKJuN3+ZZE/KOupOIN1s7akydm0SO937IthBS+wG6fvuSjH1/32uQ
	rKIkII+y02gocd0KuiTmkvWmnM/Zkl+ntRF2oBoao5FnFtdhPekjW1/QOf2kNfYt
	DYHNykQuHFawtgQ0DLAWlCdNGhDkTBjpgjjFDI0dGBfmcpk5+tVVpMT151jMKms7
	bCtgKMgfU5wq84kPVpLQ/RJGyZ2AoLtohcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148k1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 10:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so686638785a.2
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770373971; x=1770978771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31g9Av7sRhnAfddToHVTSlKjo7DknHOeQFkNSP0IhnI=;
        b=bcV8jp5m5/qlJjxUH9Hg1KMt9X1Z4wOKhI9rgbAT4HTJogzINIjd/CpkevA+PNPuJ8
         swlLfTEb65iJHDWAC9cstgxJy3mkMyWJivu2MYp6fy5serRSXV9jR7xfk1YaA/rrTFQH
         WjYM0gpRbQT5eHHdpCtHnVm6pfDapuj682UV4WEqJ0FhGIg+jAAMNgeiYwxvm9cJBc8+
         7pNaixs7R/DqjmxTdx3XodOMsz15DXt/sw4iMRxkc25j2+S/lar5R77K+bkgTkfltEwL
         QPoXQxx8mIOHtmiXg1Ekvyogf9bAS4O8ssf7hYpLoci/KksmSE0qyIrG3fXHdz3gkv51
         +McQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770373971; x=1770978771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31g9Av7sRhnAfddToHVTSlKjo7DknHOeQFkNSP0IhnI=;
        b=sgqkvqacuCAAMYcXYlOjjCTrj/59TUMwY0cnQO56pq0Q65C4cVgNA0SjeSRVbr23WZ
         PMWlPCxbFIsP7ybDvQytT6YqI8Qu1XP2hilH4AxBuAvdUUw9YMYY97wzqD55PSCzUULx
         jIHY/ptZ0aObzTtjQQIUVQfYV6pfTf0bOT9XF/1T4GkDr0jjhpfhQvZQ4Cy0nY9Xu1Z8
         iOHh/pacr+6pZcy2uG3B/Vm6SzsyuoGXH5O8C0+UQ/JAS/VD6zYkeUuzAlaqPOJDatyW
         /IP4EcTU5A7Fzi9oiK/g9lJJ5Zg77cxZYyl8qMiojApmbkIh3AaLudML6RCmLM+Vl08v
         D4WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCRA5X6DAQbkdt2FPQ/mfCiEm8f2HhszDavOH0OVRpVPkIRYDOE7GtBI4it/IAJX2g8JuQKzNmvyhxPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN4ZWvPSnP0aGjdwJ7FYlyAL0bKWO1sb2nlz8uFdYSS8rF+YdZ
	pu/Icm5bxwpfgbp5PTnMvFIiwwt8RGO7SiJqny9nxzynXinPaJOtBd3VkJ0PdN28IFgxh1FodZW
	UazrFEk8uyEDiPaLqN32hztJkkvVig+6bBrdo7k4/8m40TfDiRt1IXEjj9gExPcucWg==
X-Gm-Gg: AZuq6aIfTJadXnYUkdoRwYeM4+m+gMEjWmrfw/a3usM5KE9KzNY+h5kxFP0wkffMkAJ
	Mc/LGtRIds9+Kgrp+A5cjm9LswUHjFJEYZAENqJKkOFGCTokJKekv48Pib/BsQapQ6Cgb5RkEFU
	gmi2KLfYuigafW60/6Zw6zM1NTpZK6KU3BNVMyOYqn0gqxLFXY2Hs3xwCq+7k+7sOREOhnycPZ3
	S//uANgBVBiUz1VXt149F2xckNPiXuvH3HLgD7XRMpjEnkydSVspkVXnt31qjvyGhePFtGf1DJj
	6xASVfXR7n49J1q3At9VgfBVxiivOj3CC+OsH3eLsT6jHhUKBNmfrHrDjC1iXRwifSGEbtIntMb
	nqoy5oeW+aTcykV4u7sspSdwDXrlH+wsptDppZzSeKmUd0/SfrA==
X-Received: by 2002:a05:620a:2a0a:b0:8ca:105a:f5ca with SMTP id af79cd13be357-8caf0d3d0dcmr251353885a.47.1770373970735;
        Fri, 06 Feb 2026 02:32:50 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:8ca:105a:f5ca with SMTP id af79cd13be357-8caf0d3d0dcmr251351385a.47.1770373970244;
        Fri, 06 Feb 2026 02:32:50 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fa9:b625:6a3a:d8c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b34d2sm5263028f8f.1.2026.02.06.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:32:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Shuah Khan <shuah@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Johan Hovold <johan@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] revocable: hide the implementation details from users
Date: Fri,  6 Feb 2026 11:32:06 +0100
Message-ID: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985c353 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AY_JnWu9_Drb-cVd1FUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3MSBTYWx0ZWRfX5h6ba1bv/BFA
 2+vunF1ZK4YqEX0UMcfgmsFbICIM5SZgc/j5Q8+phEtQ2ql4ZYlfb50zr9i2SroGeUKxV4uCc53
 QJkjrhFfJkefgEQdYjb+BQtAV1XWrfZgMdTe0iCudFzjsEioQWJsgXxaEth6cPlz5VMAVkEv4rF
 pFu+DgusVC2BqFSjLLW1ILPPbzo4ietonrq8zj+07CDreZnLGSnLULpv+Og2D184sCUYcX/lGD2
 L/D1GcOr9JDLhP7ILuJdSkM0mkKnDhkoyjXR8hzk7/+TEuahCHqNACFbNw28NuozNAQZ9Hf3beJ
 8RswM9XBNN3a4fWiZxqbxO2qgNOnUKsmPBVBAbKtEy2p+p89VDAw3H+gBCYGIUye/Yfx7rXAQ0n
 cCM154iR0X5qTtZbrT/5C+JNW+lVl7Tdj9N9p3nbcqlaDWvaKLYNoZ73PcPKoTBApBt+dhFXA6H
 nzAhIRs1qAp8xBrTAWQ==
X-Proofpoint-ORIG-GUID: ZSGTztpo3GWyxq-jvteXlfdcu4_oqD6J
X-Proofpoint-GUID: ZSGTztpo3GWyxq-jvteXlfdcu4_oqD6J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060071

Revocable stacks two layers of SRCU on top of each other: one to protect
the actual revocable resource and another to synchronize the revoking.
While this design itself is questionable, it also forces the user of
revokable to think about the implementation details and annotate the
pointer holding the address of the revocable_provider struct with __rcu.
Hide the real type of struct revokable_provider behind a typedef to free
the users from this responsability. While adding new typedefs goes
against current guidelines, it's still better than the current
requirement.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I realized that one important person was missing from the whole review
process: Paul E. McKenney who wrote and maintains SRCU. I had Paul look
at the SRCU usage in GPIO and I think he should have also signed off on
revocable before it got queued.

Paul: I'm Cc'ing you on this patch to bring revocable to your attention.
The series that implemented it and made its way into v7.0 is here:

  https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org/

Could you please take a look and say if the design looks sane to you?
Especially the double SRCU on the revocable_provider.

 drivers/base/revocable.c                           |  8 ++++----
 drivers/base/revocable_test.c                      | 14 +++++++-------
 include/linux/revocable.h                          |  8 +++++---
 .../base/revocable/test_modules/revocable_test.c   |  4 ++--
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/base/revocable.c b/drivers/base/revocable.c
index 8532ca6a371c..02dd3ec2c9ad 100644
--- a/drivers/base/revocable.c
+++ b/drivers/base/revocable.c
@@ -82,7 +82,7 @@ struct revocable_provider {
  * Return: The pointer of struct revocable_provider.  NULL on errors.
  * It enforces the caller handles the returned pointer in RCU ways.
  */
-struct revocable_provider __rcu *revocable_provider_alloc(void *res)
+revocable_provider_t revocable_provider_alloc(void *res)
 {
 	struct revocable_provider *rp;
 
@@ -94,7 +94,7 @@ struct revocable_provider __rcu *revocable_provider_alloc(void *res)
 	RCU_INIT_POINTER(rp->res, res);
 	kref_init(&rp->kref);
 
-	return (struct revocable_provider __rcu *)rp;
+	return (revocable_provider_t)rp;
 }
 EXPORT_SYMBOL_GPL(revocable_provider_alloc);
 
@@ -120,7 +120,7 @@ static void revocable_provider_release(struct kref *kref)
  * It enforces the caller to pass a pointer of pointer of resource provider so
  * that it sets \*rp_ptr to NULL to prevent from keeping a dangling pointer.
  */
-void revocable_provider_revoke(struct revocable_provider __rcu **rp_ptr)
+void revocable_provider_revoke(revocable_provider_t *rp_ptr)
 {
 	struct revocable_provider *rp;
 
@@ -143,7 +143,7 @@ EXPORT_SYMBOL_GPL(revocable_provider_revoke);
  *
  * Return: 0 on success, -errno otherwise.
  */
-int revocable_init(struct revocable_provider __rcu *_rp, struct revocable *rev)
+int revocable_init(revocable_provider_t _rp, struct revocable *rev)
 {
 	struct revocable_provider *rp;
 
diff --git a/drivers/base/revocable_test.c b/drivers/base/revocable_test.c
index 27f5d7d96f4b..732197c887ef 100644
--- a/drivers/base/revocable_test.c
+++ b/drivers/base/revocable_test.c
@@ -30,7 +30,7 @@
 
 static void revocable_test_basic(struct kunit *test)
 {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	struct revocable rev;
 	void *real_res = (void *)0x12345678, *res;
 	int ret;
@@ -52,7 +52,7 @@ static void revocable_test_basic(struct kunit *test)
 
 static void revocable_test_revocation(struct kunit *test)
 {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	struct revocable rev;
 	void *real_res = (void *)0x12345678, *res;
 	int ret;
@@ -79,7 +79,7 @@ static void revocable_test_revocation(struct kunit *test)
 
 static void revocable_test_try_access_macro(struct kunit *test)
 {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	void *real_res = (void *)0x12345678, *res;
 
 	rp = revocable_provider_alloc(real_res);
@@ -101,7 +101,7 @@ static void revocable_test_try_access_macro(struct kunit *test)
 
 static void revocable_test_try_access_macro2(struct kunit *test)
 {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	void *real_res = (void *)0x12345678, *res;
 	bool accessed;
 
@@ -128,7 +128,7 @@ static void revocable_test_try_access_macro2(struct kunit *test)
 
 static void revocable_test_provider_use_after_free(struct kunit *test)
 {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	struct revocable_provider *old_rp;
 	struct revocable rev;
 	void *real_res = (void *)0x12345678;
@@ -167,7 +167,7 @@ static void revocable_test_provider_use_after_free(struct kunit *test)
 
 struct test_concurrent_access_context {
 	struct kunit *test;
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	struct revocable rev;
 	struct completion started, enter, exit;
 	struct task_struct *thread;
@@ -206,7 +206,7 @@ static int test_concurrent_access_consumer(void *data)
 
 static void revocable_test_concurrent_access(struct kunit *test)
 {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	void *real_res = (void *)0x12345678;
 	struct test_concurrent_access_context *ctx;
 	int ret, i;
diff --git a/include/linux/revocable.h b/include/linux/revocable.h
index e3d6d2c953a3..f0aea6f56a25 100644
--- a/include/linux/revocable.h
+++ b/include/linux/revocable.h
@@ -12,6 +12,8 @@
 struct device;
 struct revocable_provider;
 
+typedef struct revocable_provider __rcu *revocable_provider_t;
+
 /**
  * struct revocable - A handle for resource consumer.
  * @rp: The pointer of resource provider.
@@ -22,10 +24,10 @@ struct revocable {
 	int idx;
 };
 
-struct revocable_provider __rcu *revocable_provider_alloc(void *res);
-void revocable_provider_revoke(struct revocable_provider __rcu **rp);
+revocable_provider_t revocable_provider_alloc(void *res);
+void revocable_provider_revoke(revocable_provider_t *rp);
 
-int revocable_init(struct revocable_provider __rcu *rp, struct revocable *rev);
+int revocable_init(revocable_provider_t rp, struct revocable *rev);
 void revocable_deinit(struct revocable *rev);
 void *revocable_try_access(struct revocable *rev) __acquires(&rev->rp->srcu);
 void revocable_withdraw_access(struct revocable *rev) __releases(&rev->rp->srcu);
diff --git a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
index a560ceda7318..30cc9c145725 100644
--- a/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
+++ b/tools/testing/selftests/drivers/base/revocable/test_modules/revocable_test.c
@@ -17,7 +17,7 @@
 static struct dentry *debugfs_dir;
 
 struct revocable_test_provider_priv {
-	struct revocable_provider __rcu *rp;
+	revocable_provider_t rp;
 	struct dentry *dentry;
 	char res[16];
 };
@@ -37,7 +37,7 @@ static ssize_t revocable_test_consumer_read(struct file *filp,
 	char data[16];
 	size_t len;
 	struct revocable rev;
-	struct revocable_provider __rcu *rp = filp->private_data;
+	revocable_provider_t rp = filp->private_data;
 
 	switch (*offset) {
 	case 0:
-- 
2.47.3

