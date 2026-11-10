Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312083;
	b=E+tdhJmxy6bXSBWGGH+jJ9KpJCAc7/vzNlr8nU1QpuM54i5QMS+fNJri5NdwszCKeFnO
	 t9pveWLC92s6f+GQZFkIh+R05N/aAtVBF517cx/EEbHdEnRc1iHSdNTtCnIjlA+UbOM+H
	 dDNGsbqDZYYTPHrJ2Z2DbxNZqlNhhxgbC68WMzdHhaCnA88ODlx3025cTw9JfMDwdp2pk
	 FCeYO0p1WZoCtAsQ01W2rxlIITLOz7hxvUc/PipxOV/nn/rjnj7cDglW+FlexdxxyhGY4
	 0lS9AC1D+rUAnUvn9clyRixfpOxoqjiRyCkHjlBunKGElKmkDIpTQLHPYPrNJYoPOhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312083;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=;
	b=s+2OT/gXiql+eaELS/QcNO48I/JoQq1G/deA2ERoICtXzyBfr5ZcVeI5pdbn6X9snFfE
	 QPUUYHhONoJvzRqCAedvimVGBxBJLb0mGvIPUAj52Av3nBGCR8QEQKpKDzFcMbWs6qgAh
	 ZK1pWMauOavxSR2UiNCw09lXMkoq5qLZnkT2als2/R6p6iQMtatZXkdOKD8jrLrUPFnGg
	 rYsRij1Kp4OuJ/BX45r3QiuAsGTY3dzI+0eQeEAns8HHn4sIPLFSvLH7pFF0Ex/8bzoBl
	 ECgZppFFu3MMsmjXPm4T8teBKHL0KPdSag/DCXlB+SVxpjdQ1N0lQ3uMUO3O+aqCkKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KYFQ/o2M";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DmHXmvbU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619EE606A33A
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 619EE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KYFQ/o2M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DmHXmvbU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAA9q4186986
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=; b=KYFQ/o2MMIr1RdWY
	FUUiMBa0do2xwoS7/vJbrjRGH1FBOR0BZ1UNBAAI0+h2XJ6TR26I6M9T7LJ7HerU
	Gy/Mh2rvHHWdjyRnb+p8v+d5UsGr+Eip1shpBxpv5Ea3ZZ5+VbMB7NVvTGaF4tpY
	FO0ihg7hIHedNyoOQp/e+VrNFOWE3YAa0k20GMLL47sDyGgsJh1c3NzuscgVqff0
	MvkgCRLdLJFxFA+/hOWcAVoNw1G7gdJbJT/l9kggxSiryz+k3oalpLCmaJgp419A
	Ag6dcD0+IHmQ2YDEBnNXYrfbmpLb7+I1653XoqWeqCXxeyOdGnXlEDXFPZHos1YL
	QHKe9g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwgps2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacc615f73so2162203e0c.1
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 04:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794312082; x=1794916882; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=;
        b=DmHXmvbUKrWTSQuifE+A6RvmIifAg27VehHfkeRa6HB2BjK5l6kIwBihe+vED7XJO7
         j+UMvOogDcDP7hqxDrmjQTrUnXnIU6/0f3gz9A/CPiwKkncyxUUQsFgu/4i8yBx8GcL4
         xd/gGPcXiolUNpFJSK5VdXE7tcn9FwtlTIGnuuPOFCKJS0VFxjGeA68X3cxNZ86Sjs13
         RRICp0tX0IR3u4hmLLbzYw9qQTH+fSbsaFRhFJXCJeXwfQExaOusdgiUqQF0nJMOA2Xe
         ZBnNtA/xz2Ls8LUJu09KObklE3yO4Kesh+kS1LHcYTD5By2QYi4nv3tF9kULiZpqBsPe
         gWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312082; x=1794916882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ivyhI3wFnjLJj5MrhIqbJpO551dowsyiUiy2aYJmX0=;
        b=mCn2zvO4dzdbu8a9dyDd/VEC9yk1aGIGneQnqVu9d8k3oEWWrN74bkkUJzy4V2lI+H
         xy8Me05v4X542c68/49YTi/lNTJqUN7Whm0AjOvl5Z8eCjcke33Vs9Kveo1OSjaAwvqJ
         hvmBeyAzJp++C5pfyheh/9i9fjIl2sHQodqwLCmVzFwrBVeute0cDhNl+hn1FSSf6Urb
         buCpIOWHc9oL3GpnHmjQadIWAKytZhx5tAw7gpXteNtfRiVEiorEYO5H9hOjSdwH+CS8
         F6TCLKeDOrO7N6f8O8TzZLf+VNp8VoygQjXNQbJYImR7eun2Ebm77R1W2R7jaqSeO2Jl
         1RBQ==
X-Forwarded-Encrypted: i=1; AL+hErHDaCwHx+Eng90zD0AuIl5qxpav9OpCZZU6gPVg+Sf++PCkKwAJtkcp+sLjmoKsjeXHMqp4w9PC6bE5jQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8EWIoSTa/IK/cVv8ppIJao1jTCoKHhheJRlc9U/H8+J311Q7hU
	GJFvuAGrD1ZXNCsK3H9mPrfK013PMYH3fD6oYZiB+vYhRzggGdAIrvT+74/31+vYno1gqq6/ptb
	JQX0fYWVtfBP7Dx9FuXCI34kKfliR8TPOt8t46AdtDx2kksDIE9oI5QqKIjgSJTioLQ==
X-Gm-Gg: AYBFou2vXpHu/rU+jhdVLkMJA9ly8n2qQ6y8Fd1s1xNGjqG7z5XveQrTx5IgYgT5GB/
	f6oTV5B58uGNfAwb6PrOnEkIxo/5Nnqsk3zN9gavnsaJK3t5K0/ULDtJtqL7T+ymQFRrH3mwAW+
	sIF96jbrx4stdS7jqB4/zeSE+4tVsZ6nedyKILkj7LD24sas2CYzRtaLTC+EyPLPwOgpDfG4xPd
	PZAkLNiRWRKQ/lDAm3JIXXq5Qi87RZOgrpVz1M1WmK1tKYcgDJ/TVHhXpqPuyo0g2fviihN+BX6
	tmUI2nTOCAwVoUCzqOU21e6ChkLyBZhlW4RDYewrTx3O9tzk3zoOCTPMUUkoCr7aJkLH3eCv+Wv
	LFisPfoN128do5uLjFrKQImlHiiZWjpAPzANS6MJNBX4qOVx3RTb4GbTga4QxUqUhT3bur6cqxy
	9xVWuw2QU4ZOf4tazNfA51znw5AqGz/a9H1TDISvD9LcDTHKIRd6fpZUGwIrv0DxuxNbjXoVSuj
	CxKdQ5oq0kZWLoBC9suIN5PUY8=
X-Received: by 2002:a05:6122:511:b0:5ec:d84e:3833 with SMTP id 71dfb90a1353d-5ee0d16f2e3mr729775e0c.14.1794312081326;
        Tue, 10 Nov 2026 04:01:21 -0800 (PST)
X-Received: by 2002:a05:6122:511:b0:5ec:d84e:3833 with SMTP id 71dfb90a1353d-5ee0d16f2e3mr729530e0c.14.1794312077191;
        Tue, 10 Nov 2026 04:01:17 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm56820295e9.3.2026.11.10.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:01:14 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 13:01:09 +0100
Subject: [PATCH v2 2/2] PM: clk: Release the clock prepare reference across
 runtime suspend
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-clk-leak-v2-2-d044cf0c3f1d@oss.qualcomm.com>
References: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
In-Reply-To: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3SHtXxp2ka6mDGoKKWWFtL5EbF6ZZMZS
X-Proofpoint-ORIG-GUID: 3SHtXxp2ka6mDGoKKWWFtL5EbF6ZZMZS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX1pJgkZ1K5ySE
 RjeD/Sw/uVsnfZ3W3PpFISVuMlErCIHLoXEaMbbDlgGRY5J//Qhx/IFHJrSmbozTqFVt9xp2Z5W
 e7YcaHxK7KWmMyO3Q7gRaWRBDdRSxTs=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af30792 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PTOVzwXgyN4xjwbCXrMA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX8h06YyLET5Uc
 xkr7EpKZpqyFWQriHWTP/vPlwB8A1y8HgnXEy3HDaKJzHeap5az1JdqgZFh0UnLEePK1RzGxYGc
 6yzcAP4dvrfWvQPKyArIRo7jjpnzMyCWAlEnb1AUA5YNtqzMEyLv1n/jhYrkwmUszpGzxEmrXR+
 x61Rj55CH9sGuSvlyf/U33+WjhQst4fgbaqvBvs2E9mwchuRGVoacXtMu/MRs21Ulr3r8x3LYAr
 +4Qti12pP8YiKx0/syG/8v2i/VScV9ti40DmzmkRMaeqAWsiClM51+XQJufakEbNWDgJsQF3ssA
 VOCRql6uiAlxLel/h2UV8/LusUVIxenmKsri7YyaXqdAOV1C1ljUqFB/LEAwffIpsuC/7LElQbv
 lLjv1Hn27VJu1Vn/mhKzPdBhbre5KfIABcit6ulB/5ACbHR+GmSemSXXNYHuBgmcrjYdmlggsXp
 iTF7r3IjaK1Yqeys5lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100047

The PM clock layer prepares a clock at acquire time and keeps that
reference until the entry is removed, pm_clk_suspend() only dropping
the enable reference. A prepare reference propagates to the parents
though, so a clock with enable/disable ops can keep an ancestor that
only implements prepare/unprepare running for as long as the device
exists. On Qualcomm platforms this keeps the RPM XO clock active
across runtime and system suspend even though all of its consumers
are suspended.

Unprepare on suspend for devices that are not IRQ-safe, as those
suspend in process context, and let the next pm_clk_resume() prepare
the clock again. This generalises the clk_is_enabled_when_prepared()
check in pm_clk_acquire(), which only considers the clock itself and
not its parents. Most drivers managing their own clocks already
unprepare in runtime suspend: 245 call sites under drivers/ against
27 that only disable.

Reported-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/base/power/clock_ops.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 6f66e11a12428fb718abca197f5519b1ee21ff90..43150ecb58add7783d8602d525219c676fd808fe 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -33,7 +33,6 @@ struct pm_clock_entry {
 	char *con_id;
 	struct clk *clk;
 	enum pce_status status;
-	bool enabled_when_prepared;
 };
 
 /**
@@ -174,9 +173,11 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
 		ce->status = PCE_STATUS_ERROR;
 		return;
 	} else if (clk_is_enabled_when_prepared(ce->clk)) {
-		/* we defer preparing the clock in that case */
+		/*
+		 * Preparing the clock would also start it, so defer that to
+		 * the first pm_clk_resume().
+		 */
 		ce->status = PCE_STATUS_ACQUIRED;
-		ce->enabled_when_prepared = true;
 	} else if (clk_prepare(ce->clk)) {
 		ce->status = PCE_STATUS_ERROR;
 		dev_err(dev, "clk_prepare() failed\n");
@@ -460,6 +461,7 @@ EXPORT_SYMBOL_GPL(devm_pm_clk_create);
 int pm_clk_suspend(struct device *dev)
 {
 	struct pm_subsys_data *psd = dev_to_psd(dev);
+	bool sleepable = !pm_runtime_is_irq_safe(dev);
 	struct pm_clock_entry *ce;
 	unsigned long flags;
 
@@ -472,7 +474,7 @@ int pm_clk_suspend(struct device *dev)
 
 	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
 		if (ce->status == PCE_STATUS_ENABLED) {
-			if (ce->enabled_when_prepared) {
+			if (sleepable) {
 				clk_disable_unprepare(ce->clk);
 				ce->status = PCE_STATUS_ACQUIRED;
 			} else {

-- 
2.34.1

