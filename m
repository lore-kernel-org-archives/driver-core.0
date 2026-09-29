Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F9E51615F
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681929; cv=none; b=MAdGqudDdCuuaObpq+owgNuTUYvS//zstPRb/liYhzWxe490P318pHhR6E9pRvmo4rXZBTs6F9wcQr/G4pTxllMd4Yn15DA5MI6SQq8SCX070ryupXFTfDrF/TmsGhTX93RPrviBUw1mHqi0J3uHFeyVvdnP/MSbldJAu8fvUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681929; c=relaxed/simple;
	bh=IRkPQ48QnFX19GoN/M4c8BIX+Ad9l2A+S+ag7idBrDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=udDDt+0BaAjfw27SLI2nBKj3FSA6/WsEg32Ko145GcP/GO/13bUwBA9Z61xcikV7KBwOtcKds/jAkepf5JIfYEfMjUqUhNUu4CvlkgMOQBPBt6tLgd5GY0tPlmFtmtewEzWPFXQG+kUIRL4rmsCdpY1NjpgnQaxObtNlaydsJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+ToRTXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TazzfrWb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+ToRTXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TazzfrWb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj9DG069864
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjuBHnNOqcpw5ApUs2RooCq8aTsOYyQ4QeK2GhXHYlI=; b=Y+ToRTXCNjUAfeFE
	C/6ElZeFVpKv0drkZ59SiNBa+mh/wd0ne1qZtFd57k9DSn4zDhaGZvxxXJzDztYF
	6VVedoYihiJ36xnYCLBMCqeCNntkxyElKg/T8/aqvBKPIWfOzjHaC6zVcb7wiLGs
	hAtoOwhPMnm7C/YPyd5xuWTafLsMyAGzth881TIVaaHJpOPufD5fcR/PVbrWSzR4
	ZDf4o9vx3iJm0Fnr9VIFNneyuNH3yRvvTht1sgj3j14CqUiJOfRnzYLGYSDf13AD
	0pUl7dnf++XUSCbk3wcyFN6S2uBw9WRw74yJC/5tcPwxKQ6/lvdkbwCgS6JcxM5t
	zy5wbA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjjey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34344599f01so2409174eec.0
        for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681922; x=1791286722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjuBHnNOqcpw5ApUs2RooCq8aTsOYyQ4QeK2GhXHYlI=;
        b=TazzfrWbLErLqA+y3qyovW6Ev54BTA1bjsWOdyNsjF8HyNjwP8w8ArYxakuUzVqJMw
         c70968bn1tzwK+ZnRJK+MHecF61hHEkwH8s4sAm1RPb3mDbsyhYvkMziMYY93dM2fc0i
         HTuWg0juuguF5nI5SYNyFug8uL+nOoYAvKNT5wWATA9XbD8Ss5XDEbW4GmYhodidSMcT
         lAba9T4oa8tDB2PmmcE4379Ezg6BkHjCaioRMCRhoDqV3npfTbGwhe5WdFPUF9rR24u7
         yPBuIuqnPrhWSjE6uidlytPsJY6nZg0Z1jgPg/3+OvVM6B4kkHBfVi32o3hUtEmujMBg
         ABCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681922; x=1791286722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjuBHnNOqcpw5ApUs2RooCq8aTsOYyQ4QeK2GhXHYlI=;
        b=DDtK8e3ypToprdYH7IUHm2bVQrCY/ztXmsPr6sb13L/iVQwswIvmyWS8t3gi8CHX21
         nsb7hBhDL2Luj2Jh4EQHbVVx2QcCGO7it4/lLu+gUWKhTPD+Sjn+GxEj01FNGJwAjLEe
         Yial3xlSshdyafS47AQKx3CMBJdO6E23C61fbMwItRT73fSaQD5bWoOgxB3sqd0zz/EY
         65/9QP9HhAWtorFQoG8zw3T7hEKdBHQQXC823vjrrlQIp/DwwsAjuzdhTJr7kpxKzCi+
         ckBYzUfRjkK9ZuQFsm8j4wzfBWpPZZAb5sqgXs2OmzeDxDybEAl9EZRuylHu1D0wqqAn
         UVhw==
X-Forwarded-Encrypted: i=1; AKwUvBwBRtcc5LKc/YkYbGHZUCR8DO/Np/oyQVhyLzBIpSUZarfUkCNg88esEm0CjjiQJ8C4QxT3CTBTPcPG4g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJB4rWU3m7joF9p+yiYdBFUQP4VDtKL99+URuLL0oy3mCaobpm1
	kqLGJYJpenWJsAqkBLVtfWO2Rs9XmBX/sWbiB8x2XsPfr8kLFJpM8gUQoI906MtX9vxxyMJUZEh
	RzUM7ZxYOGJo6D/cZrHgsmZ8UVbavzZbvte7avggCYcxMuMXTXPmkUUfWbU5XuG6eYg==
X-Gm-Gg: AYBFou1cCAivmvgzbCWK4OfHkw2hv8Bkdm73GhDSyk2mSSbA0CfjN3Zbp9ClWQQ/n0/
	3BCxcoyvP5xI6ROk21YdJEstEKkpbgYjRLO2ukqGR0jYBYnsTm/J7Ls2lgdI+9xQF3eYbytjj5r
	0e/AeFd9wRiaQH1Mr4XKg7xURrhNWJlHU5HzCE/ahsDETFqeqqSX/9x8BFHf8KDNk4VhHOKlrBI
	DdU9eHnkJoQvqq5E8yz6rhYBmn66itrZOjYJW5Kfm5YOXzT9O+bUlEYJWL/MggW2pZsIVFnrU0K
	4lNihRtw0bm8bEZVd0hiEoAvZN01DE72a4HkTRrwqcVZVVIGn7u+9bhR+VanpgWIT5J7AR/8Ukb
	jO04bKKzAVoTbj3kgONYefDkOuflxAzM0zfXlJ9hh9LzTx2iuNq/4MOteeqU45rMftr3xQHXV1/
	/phkBXqz65PZ0Dj3Q=
X-Received: by 2002:a05:7300:b90a:b0:343:4dcc:d29a with SMTP id 5a478bee46e88-3434dcce606mr16197177eec.28.1790681922161;
        Tue, 29 Sep 2026 04:38:42 -0700 (PDT)
X-Received: by 2002:a05:7300:b90a:b0:343:4dcc:d29a with SMTP id 5a478bee46e88-3434dcce606mr16197123eec.28.1790681921508;
        Tue, 29 Sep 2026 04:38:41 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm37145604eec.25.2026.09.29.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:38:41 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:08:07 +0530
Subject: [PATCH v3 2/2] cpufreq: fix policy max not returning to non-boost
 freq on boost disable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790681906; l=4806;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=IRkPQ48QnFX19GoN/M4c8BIX+Ad9l2A+S+ag7idBrDI=;
 b=IXje9iJZJznKOH54JVQd3nu1rEXtSKUyWr1zXv8ANd3q3Y8tn+bLjdFRhZ2pBZa6Imz3RWOHQ
 c5nkPHitCXICHMBd9pYCH1G9canzcpyjXv521zmVY19/DHGmPvrSL48
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX2TMbKLB/PHOQ
 cRZ/bQLemt3vqAwqMvOkydyslnBBitPcGhvAaVHTy9faRAmqzviOqQVO+uCaSigdyS8iDpMY19H
 8nOkDJ82msqTJm/WRVkQhjZwYsDbeGAmKb6K6Rx91ajgylek0TuI7lkw4yDdilYDX3wR4iRFzcq
 p73dn+YJeteHMfwlscU70lhKCB9W05bbxbLbr9LqyYzynPtrnpEfkLKc50gxAzvK7pFFilUX9/H
 LFldvZNkGzi5H/06v0EYZdkrhyv92QhgvM+UowN4IOT+8wPkWCysuViiPBort1rOzndC1BHSY3t
 EGsL7cUz77DrLHocUV6p6Fy0at6yLpJJwywc9qjzqvXApEWIq0PEfEh+nlAg4GA76OVJic7dhCJ
 j2Qegjw9WOIC8E7zcgCyXlH6WvRvdX4VwMrBXhMzl3x5GDy36JcAK/eKXUUE0mQbS1HWgFr0UYQ
 NEKDl/A7Kj0CaO2GWBg==
X-Proofpoint-GUID: sw49nyDNHQwiCIV2j-wPsgrjCjHcVJNX
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abba343 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2yvpktbjYSEXaF6n4vkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: sw49nyDNHQwiCIV2j-wPsgrjCjHcVJNX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX8wx5NMd6RnJB
 LJfQpKoqYw/ZBkboPwO72rXw8vWLUZBqQMtzeNLWXYiyZqxJ9hr3ReaR7TP5OHpdfyigc0OBgfd
 At0A18J01ZH+lYBzNpLMvnTJDH+xPHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
max boost is known") introduced a guard for cpuinfo max updates to only
increase, to preserve driver-set values above the freq table maximum.
Later commit db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
init") dropped the 'policy->max = max_freq' assignment from
cpufreq_frequency_table_cpuinfo, leaving that one-way-guard to be the only
path for cpuinfo max and consequently policy max to be updated, causing
both values to be stuck at boost frequency even when boost is disabled.

Unconditionally track the highest non-boost frequency (max_base_freq)
in the freq table. If boost frequencies are available, use the highest
frequency from the table/max_base_freq instead of cpuinfo->max_freq to
control boost values, so the value can decrease again when boost is
disabled.

Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
 drivers/cpufreq/freq_table.c |  9 ++++++++-
 include/linux/cpufreq.h      |  3 +++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 96515880b4ac..5e6afb6f8826 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -574,6 +574,8 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
 
 static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 {
+	unsigned int max_freq;
+	unsigned int max_table_freq;
 	int ret;
 
 	if (policy->boost_enabled == enable)
@@ -587,7 +589,19 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 		return ret;
 	}
 
-	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
+	max_table_freq = cpufreq_frequency_table_max(policy);
+
+	if (policy_has_boost_freq(policy)) {
+		max_freq = enable ? max_table_freq : policy->cpuinfo.max_base_freq;
+
+		if (!max_freq)
+			/* when the freq table contains only boost frequencies */
+			max_freq = max_table_freq;
+	} else {
+		max_freq = policy->cpuinfo.max_freq;
+	}
+
+	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
 	if (ret < 0) {
 		policy->boost_enabled = !policy->boost_enabled;
 		cpufreq_driver->set_boost(policy, policy->boost_enabled);
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ea994647abc8..820ed4559f6c 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -14,7 +14,7 @@
  *                     FREQUENCY TABLE HELPERS                       *
  *********************************************************************/
 
-static bool policy_has_boost_freq(struct cpufreq_policy *policy)
+bool policy_has_boost_freq(struct cpufreq_policy *policy)
 {
 	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
 
@@ -27,17 +27,22 @@ static bool policy_has_boost_freq(struct cpufreq_policy *policy)
 
 	return false;
 }
+EXPORT_SYMBOL_GPL(policy_has_boost_freq);
 
 int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 {
 	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
 	unsigned int min_freq = ~0;
 	unsigned int max_freq = 0;
+	unsigned int max_base_freq = 0;
 	unsigned int freq, i;
 
 	cpufreq_for_each_valid_entry_idx(pos, table, i) {
 		freq = pos->frequency;
 
+		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
+			max_base_freq = freq;
+
 		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
 		    && (pos->flags & CPUFREQ_BOOST_FREQ))
 			continue;
@@ -57,6 +62,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 	if (policy->cpuinfo.max_freq < max_freq)
 		policy->cpuinfo.max_freq = max_freq;
 
+	policy->cpuinfo.max_base_freq = max_base_freq;
+
 	if (min_freq == ~0)
 		return -EINVAL;
 	else
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index f048c925fd98..7bb58405e004 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
+	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
 
 	/* in 10^(-9) s = nanoseconds */
 	unsigned int		transition_latency;
@@ -791,6 +792,8 @@ struct cpufreq_frequency_table {
 
 int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy);
 
+bool policy_has_boost_freq(struct cpufreq_policy *policy);
+
 int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy);
 
 int cpufreq_generic_frequency_table_verify(struct cpufreq_policy_data *policy);

-- 
2.43.0

