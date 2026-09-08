Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508F84746BE
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856282; cv=none; b=NmMRHcQ36ObWek2+Q4Od9fxGhK22JjeqxWxWuA5LBT3Curr+DU9j/tiNcIby8At4q/WSjXNkUi1Sx11M7TqdJnrwXDnqCi8VS/za4I9QGoaRBkE5Re1IwaPoRwQjrfGnil3gD8TQe0sMxF3/26ddOUvl1ygSCpcUpMbchKB/78A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856282; c=relaxed/simple;
	bh=VOWmJwlWc7SYqz6NviqAALXf0GiO7jEmiavJ00IcvEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArAyaGysFYrKa0klk9g8Xe4EDjRFvKrPn7HyGHCaHdVV23LmMXj+COxxrRhw3X4l1oVG9eTWStF9evkNc/CoUt5l6PLbrbl5W8QYQkoE+zTNqSt6Hl3B6cD66HY1D9lX1L9DR7tDuCHHmQbwsnAkwiHm2olpQErUUhVO6z+73/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfNqrdGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zt8EKQ+n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfNqrdGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zt8EKQ+n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1RU2712332
	for <driver-core@lists.linux.dev>; Tue, 8 Sep 2026 08:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qyfnFZk0oGAhMugpkxnEz1t5sj5W+rRALTd9m5wJm4=; b=AfNqrdGkz0PqCk+j
	kqzsG7hn/DvYX+a4Uhfnm9TAB2xGQftUNVupUuoZCWdEAWlW+YvEYKjEk1al4HQU
	QXLCF8vdI+uEWo3a6ya77ksCLb/Vl8EQgg7VACRyf1mpOBHcTxUUzchBHPNK9OlW
	u5bS6lzoznHYgdhg54XN5s58RZNu1xwO4i+kX67Y+FFXtrwrOTCgRrRes3KO1atw
	tN3vwPZ9+tqDITYequj4rynVrIzEb9rAJldP9lnJpbKaK9p9W2MF7RDyf2nuwxgC
	41uafjaMwi+iAgv24pwGE6SJB2JTWxPXAq6GiG3LY1PSqGVYk3HNydHTUT7Fw8v7
	nDWPvg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqm9ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 08:31:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7ec6685adabso6136317a34.0
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856278; x=1789461078; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qyfnFZk0oGAhMugpkxnEz1t5sj5W+rRALTd9m5wJm4=;
        b=Zt8EKQ+nK9QIDtrj9bTDeXQuvq+9BEJBkOPKBXD8PNRxrF+GBChSv9TjlF89ksNb42
         ZUOAMA2VwiuAeISA8K5DqIV3jhF1CXtuBqBACX9QCx/9OlEF4PFtOc0EdovPU+J2M0mY
         /oAiGRj0wdYwXx41e4C5zhTC8x5DDGifhKNupDVmanKZFEDFg+iSDi353C5elbCBPCY9
         e6+YoxxYdEKpc89ps2JtmQN6CD/f1yZrtpFBtI/b8BonYU+oyRunbDaXM++GsQeIV0xA
         rB8PEGHQY/GHxDZ7UrcQbBWciBnBsfnJ7aokqGsB8exzWXexllPiuBrGBoOrtx0bjDkk
         BgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856278; x=1789461078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qyfnFZk0oGAhMugpkxnEz1t5sj5W+rRALTd9m5wJm4=;
        b=QpTc0FIDVS7+CZzydcQfYolkElYyliItdpiIZ5DbIwHTPRh4BmLTbwTfL+kUVnbBdw
         M8uJy3EynzalJsM7bnlOVNXFMwevOEdJPLLLWWcKKt7I6M2bH6iXaEkuenx4KS+Y7shE
         YTquHPsG9743rpebOkP4W12LylA2u2wwNDqWe/RtKJ1idoJrT8pF98M1ndtkosRxX227
         mgOkS0FuLVtyB+YWfUqAqa6RO2cv8Er2U/jmJ8+Ydt2RGQITAGCNMwZh1GIdkjLlKjLy
         asQQGamzd40zG0lGgZBGp9dtuRtyoBqM/95lWPkjFuAbXPbiDt+m/g75ZtQHCvmeuRUH
         GqYg==
X-Forwarded-Encrypted: i=1; AKwUvBycqRJ8Z5SnIexL1g4PwZpJ51MT/7qujWMYuB4Vx7Joy3zcFRCZ1J7g54ON5lDDypnykd+dWkBueDFBZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lrVIRgilKYJIWbxF7Hhmp6NqjSUUTvjSwE6XniAzzS0aEqHQp0
	W8EI4Co/ZkeUfF1njqeA9x1dtIvaoaQlDlxUzsy2V8rllTIFruVD+Gn3PaI93WaVh5qPEvYAl03
	CmcgPT7T95/FphY+JzgvvyszlVAVfwGOnlKPVPdCMAokygJp2KAmTXH2MEmOnSxZDn6ooMSCW1g
	==
X-Gm-Gg: AYBFou36iE6Pi2aFe6VKCAtIwFxL7gVU3nnN4WHyGFywFq9PG360TTOyVgaEebuBUQF
	SjnWawCkShQIerCoZc25sbFSJXZA8c/NtIfFRMiKkHoptw18a4NgcFyhjFFauGrDquq/t8vFwPZ
	IsKCdLqv9SqyLRortvqCGx8D5fzjFZ8/+IAHdf3Nxdas8KKCspNgDXepCYKwsYSpIZEnqE9moI1
	ZlSzGPIvQIYc+2S0v2mjVhteVytn3QLpM91PESaU5lM/9sJNkUpMEkhU6Bhmyo6wNsLkf5QsmqP
	IAi0MpLsmI/GJ/ruf3juen2xWFWTW1P7ZPuFvVwuVNDJzIlU5ZQgTHmg8FmSJuTp8TM5sQVaIi3
	PBPJymj7vF4zIBRDI2PB+QI3fHw4eQmY0ZH+EEocO90aH76dwtnKiex3oAJuuEySHbvuH/Psekk
	Y1yrn0nQy0h/+t3AE=
X-Received: by 2002:a05:6830:3509:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7fa1deab695mr17694341a34.3.1788856278457;
        Tue, 08 Sep 2026 01:31:18 -0700 (PDT)
X-Received: by 2002:a05:6830:3509:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7fa1deab695mr17694327a34.3.1788856278032;
        Tue, 08 Sep 2026 01:31:18 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm34458641eec.27.2026.09.08.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:31:17 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 14:00:29 +0530
Subject: [PATCH v2 2/2] cpufreq: fix schedutil not returning to non-boost
 freq when boost is disabled
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788856266; l=3709;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=VOWmJwlWc7SYqz6NviqAALXf0GiO7jEmiavJ00IcvEA=;
 b=QoFQI5h8STWQnYAFONEZGcYGQQhEdPSUuU+INfo1+hC7d3erZB+BtVGKXmjIdQ77emFJ59KNZ
 dKQfvNUOhxbBqufd6L3zsmP5d8xQmc2GdS5ufRnw7cHyrazL0/LwrGN
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX236o9K8izkJ3
 6zxSnUhcLIOKrH95m6m89VzxMVQ/HntBBxseNHwtoSuxFXGOpe4t/mni/6ImhKaA01qNp9pSe3Y
 es+IzHnPb6uch16A5//F5R+zFugmOVsolGa5/zfOwKwXAwmHIhlZ0ikovOWtvfgZMpjEMpucWHC
 ZfBlsURARXKD33letqFtKRE1FwxD/+L6kDVfTJcMzQgAHyHk3Wplug+GOw8FgnsB/62Jtr2DDSt
 KwyTVbhpgodzVmfVV5lbDdwPSX5bPyO9iY3fax8cthxFaS+EgQFROI8Zm519Shv4Uj6iLK9SCGv
 OQbZ9scJuHo4ziqmgR3O6gGkgGCwgzjw6RsFROQWDhKwkfPid/J4tR2o2jYHG1Hvpqx155gjy9f
 iOPLSSCaqOup0/a+LkmLC/zH7rsBrnj3NP/7Lc7Lkv7Mxaki7I5fhXpbBZ8H3x4dXO0+fIwljW9
 HvcjJONct8x6eIAhEKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX1AzhFw2qYKmT
 C57OvAKxtCBxnUyA50hVa5t3EW4H4LjP4enFqEPcLm2OgtFWit3fSka6cgVSJY6/Kx7hl3O0Ld8
 Y1ab1PXFQaBiDKu7WKy7khWxdkO5IF8=
X-Proofpoint-ORIG-GUID: OmAJ7aU_HDN6Kid1LsLZpZE60AyHscRZ
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fc7d7 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fUeqwVvmJro1Iw4YaasA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: OmAJ7aU_HDN6Kid1LsLZpZE60AyHscRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080088

Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
max boost is known") introduced a guard for cpuinfo max updates to only
increase, to preserve driver-set values above the freq table maximum,
causing cpuinfo max to be stuck at boost frequency even when boost is
disabled.

Unconditionally track the highest non-boost frequency (max_base_freq)
in the freq table. When a freq table is available, use max_table_freq/
max_base_freq instead of cpuinfo->max_freq to control boost values, so
the value can decrease again when boost is disabled.

Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
 drivers/cpufreq/freq_table.c |  5 +++++
 include/linux/cpufreq.h      |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0d0df986fa3d..a13e72711597 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -574,6 +574,7 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
 
 static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 {
+	unsigned int max_freq;
 	int ret;
 
 	if (policy->boost_enabled == enable)
@@ -587,7 +588,18 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 		return ret;
 	}
 
-	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
+	if (policy->freq_table) {
+		max_freq = enable ? policy->cpuinfo.max_table_freq :
+				    policy->cpuinfo.max_base_freq;
+
+		if (!max_freq)
+			/* when the freq table contains only boost frequencies */
+			max_freq = policy->cpuinfo.max_table_freq;
+	} else {
+		max_freq = policy->cpuinfo.max_freq;
+	}
+
+	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
 	if (ret < 0) {
 		policy->boost_enabled = !policy->boost_enabled;
 		cpufreq_driver->set_boost(policy, policy->boost_enabled);
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 4984142dc08a..7e183e16162d 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -34,6 +34,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 	unsigned int min_freq = ~0;
 	unsigned int max_freq = 0;
 	unsigned int max_table_freq = 0;
+	unsigned int max_base_freq = 0;
 	unsigned int freq, i;
 
 	cpufreq_for_each_valid_entry_idx(pos, table, i) {
@@ -42,6 +43,9 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 		if (freq > max_table_freq)
 			max_table_freq = freq;
 
+		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
+			max_base_freq = freq;
+
 		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
 		    && (pos->flags & CPUFREQ_BOOST_FREQ))
 			continue;
@@ -62,6 +66,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 		policy->cpuinfo.max_freq = max_freq;
 
 	policy->cpuinfo.max_table_freq = max_table_freq;
+	policy->cpuinfo.max_base_freq = max_base_freq;
 
 	if (min_freq == ~0)
 		return -EINVAL;
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 3f3b1380251a..419c71ccff7c 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -46,6 +46,7 @@ struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
 	unsigned int		max_table_freq; /* Highest valid frequency in the table */
+	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
 
 	/* in 10^(-9) s = nanoseconds */
 	unsigned int		transition_latency;

-- 
2.43.0

