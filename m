Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9843D3D0E
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 15:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091153; cv=none; b=CTbCdaazZeB4OueeMbBEZh0mmRoePtjhznu6JDLdBBM6SIiSIkkrGr50gmE+Z2ZCxlVqJblU2JDApRfiF2DT5S190WJ3OwACPQivpsoibxhyeWznyUdGhL45o5ZCIyWw3qghcBgPsCv82Dq1AXwHLluu0bfYoIc89PkwEMa874E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091153; c=relaxed/simple;
	bh=+1AFISiUFHQ4vbjZNkqW9aWZMrSy4vCzMTnu4c7NCh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mW4IfL2upM5yzFrkVilmLwjG0HkqICY5viTNn8OuNu/OILTKQJx9gPbLa/eA3J5I9KlCvi7CizXuJ6nqofvY/NFFLSQU4kX8nOBV/Cbrgj2bFZm4oUQcS+NoNJZIHHr1vbuh00h2fED838EITYH+XFu/0/0pyaHVghz9FOItAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSjNwadW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pbm0aLc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSjNwadW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pbm0aLc4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663D5dpR3195080
	for <driver-core@lists.linux.dev>; Fri, 3 Jul 2026 15:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WeUVekFxFkuveS+M2x0ccM56quUUYg6HrGNJ97KLF8=; b=pSjNwadWc5o8+Bx6
	hts1chv7RdRcidjgnMa0AL3V8enFnXFkutJhZFIcwXOLJN75Xivfyluyk3PxYnZt
	SnuI5gcRqHzjhsMDDkRb1LywXMzjaM5fOWIVLOohfcL2BuBSwLDigj3XD2yoDfSP
	DzIyp+ZISPoNNVF5ZZlDtJ8kSqRLmbqYgtzA8WG4S5Fjl2jKqKhla9UCqZT4fIwa
	J/0PrkDNMsOV0Lpw4s/inRnW5e6gU2FUSv956Eu8RX9A/emQ3ROjLQRoCGIiCzLl
	mn1ymqSvkVKe9hQLp8AaP21zbsyeF+yAf1b+KujIxdLjq1rzmsDPun8JjtoXbgwp
	6xEgjQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyspf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 15:05:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b314193so11391915ad.1
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091144; x=1783695944; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WeUVekFxFkuveS+M2x0ccM56quUUYg6HrGNJ97KLF8=;
        b=Pbm0aLc4fAAPIT8N+PphhRF+nXEhWJK//ACQNQZ6uQa0VrzRmysgjYvKqyQzzWjUM/
         En/QeC/rOzQmFZNqOwEOHxUoW2izck+haYC7iR1kwLJbcEEYbm7cAQCE+eJO+cmCee7B
         /70JsYxUPlv/b8CrjHfqDhtAAx8AodmY6NZYBPOQGNs7kFbDQDlViPuy01Bekd++gu7i
         XiaL8BtORSQPoibZ/NDXrLk5mOPCVcdSGnLMP0k3qolVr6/un5eGoaFD7ieLi3CB73lY
         v62G6pZc3bs7kuAJUOmfYEHaOo1gCnCjVd319ilm4sLYNLmisn+nwBp8tO/decDyEf8U
         DhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091144; x=1783695944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6WeUVekFxFkuveS+M2x0ccM56quUUYg6HrGNJ97KLF8=;
        b=B7vNyUoZHs2+nd9egjsB8tLSCR5+r+dnHx5tzmbvI4rQ2RHsgOqxPKnmQvPcg8X2o6
         ifBwmLSJ+5cDVtuJ0/+K0wNS0P19TjjnMvltW/6WXz3E3xXQesPSx05C2IasgFZb8zh/
         DmnlyNxbpXuH7tT7ifCghNsojmamu+7qGKIypdzKY6nXnaJEieHJ8gDaPmdCxcShtKAk
         wkB1wBe3Df4AI4JKTa9BcNCbBjrFSe2XmIPJdtY00NIkVP46R344HGVXXW4/8A1mVw1b
         lbKhLOZhSq0YgRejuaZZTYWSC2ehIHsJ+8rZxqJ8lk7Mk5SJ1MFnISLxFqUeAsktiO4/
         dDIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrgc9dD/mf7xdMjE0d8/6bJW6k7R0EBtHENLx3ONV8BLczb0cBVcP5VofKVbjTcg8B5jt/ZeDgvUPs19Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE/9421WtzljT2Bp0LBSAjxJsUu+xzKVEqb+d0GolCzQPVNPn4
	VgAoWX3B73MX/RWBSNr3YVQZvseNr9Tqnh4TOGZPd6vCBHEBZR8YErH10ZlKdSuX7DJ7JeBhImZ
	7so9D485SnCPNjw2KNqN9rksh8KQO4GIjuDyD9aduL6Qfxc9a3uRt62DeDX+r6YuwrQ==
X-Gm-Gg: AfdE7cmduGHSAgO0xtG82UdWZP/SZxzU0Hh1LP9vp5WpxZlKA1mRZiGwm0+XT8iqRuG
	Wqg3Gz0mkvFEgbbhdvBin3dBDBTApqNvbkNhn6ZfVOuvk0g9y8Kk3f0V8n2Bw2sdKPP5Qa6B4hm
	QluOv6y6kbej1NqGbdhpkuYvA0I6VKHsSWVq2mLu9KtJjJ10QdyKdzu2D5ZjGcJ8mJUtHjjwcte
	3bG4JqgaT36m/3ed1SfhRx0qsc2lFxS6C79TUVSfc3FwcviD5KChLBdjtkVmEvC4Cf6GZSofa/A
	MZIFsJVzQ5h48oNKN2t6vTt464nUe2aS1BaDR5bDy3RcOu8ZqxTUMnoXHqoEDk6ChZug74Y9o16
	PpM5iPoU17+WfUz22U2Gu02FUH4toBSEMYi4CAafth9sf
X-Received: by 2002:a17:903:2f81:b0:2ca:d151:382d with SMTP id d9443c01a7336-2cad1513c0bmr45356635ad.14.1783091143881;
        Fri, 03 Jul 2026 08:05:43 -0700 (PDT)
X-Received: by 2002:a17:903:2f81:b0:2ca:d151:382d with SMTP id d9443c01a7336-2cad1513c0bmr45356165ad.14.1783091143295;
        Fri, 03 Jul 2026 08:05:43 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32904517c88.10.2026.07.03.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:05:42 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 20:35:20 +0530
Subject: [PATCH v2 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-1-578b78a0cf46@oss.qualcomm.com>
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
In-Reply-To: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091129; l=2052;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+1AFISiUFHQ4vbjZNkqW9aWZMrSy4vCzMTnu4c7NCh0=;
 b=WhkaOSwYX/KACsdDCwK6cOceV9G9k6O41aw/xNJptN3pHVbX6NRj3bPwGg3tCIGB355tgCOhi
 iXsJ4/uG66RDjut+TD+/pBhvFZr9wz2auoG+gT9Oy5f08xH8B+2oKG2
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX9lZj7dk3xuhL
 hcXlwC0ouJSsPlWpO5zhnVWcAb1+bSSrSbl1bkCCB9q1Z9PJZvyrEA0V+Tkc84XzMxHD5foW8rQ
 w4QTgbPsO0TVQBzFeSqFTSGvNkCqucB3bG2Ve3F/NIGGxSK1jgYzQUjxkMsi188ARzV5Knw23JB
 uJ4LYEn/uWnQKYBi5yxYP0Iby0wDaWqdWUfMbTq1O9OBMDZ8YHhUozgLRmBNAq2sUs2I4WTZToQ
 jTo4a4ytvITMvXDuCgNw9Xu43pQ+fzGbOg0SVaXwYnW43drX4gUYRxYB46JJ5p0zq6MGlazc6Ix
 8GqqDZhH5BlNsflVee/O52tpctS6ERL4UDJ4kNOC7/87BexyTuHAtJgq4/VX+dbVqvMNiDlOUCm
 4vzrYE9VQcQrRQLUFVyl/Maao9bK3jBzX/G3EitTUchKAyX3kY0kSflWosZ8JajqcFlA8L3+gCG
 ZFNQZWPvxe13jDsAugQ==
X-Proofpoint-GUID: _dtwdLHMgAJiyciNGHBd2a1IfGwz91zy
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a47cfc8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4WVRsyPI6hImBWJIeNoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: _dtwdLHMgAJiyciNGHBd2a1IfGwz91zy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX6Ykpj1yEeOSE
 iZu0xHZyTMBdJNqJD9I4SbZr+UWtqy90crafke/LWikwuDKXJAivUTGWefCcycuhZ+Wgw8J1fOy
 QTT+b3xVS7QAaeZPef/l9D21q+LatNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149

When a runtime resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  This causes all subsequent calls to
rpm_resume() to return -EINVAL immediately at the top of the function
without invoking the callback again, making the failure permanent until
runtime PM is explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  If a
device's resume callback fails transiently, there is no reason to
permanently block future resume attempts on that device and all of its
consumers.

Fix this by conditioning the power.runtime_error assignment in
rpm_callback() on the device being in the RPM_SUSPENDING state.  At the
point rpm_callback() runs, __update_runtime_status() has already set the
device status to either RPM_SUSPENDING or RPM_RESUMING, so the two paths
are reliably distinguishable.  Suspend callback failures continue to set
power.runtime_error as before.  Resume callback failures return the error
to the caller but leave power.runtime_error clear, allowing the next
resume attempt to invoke the callback normally.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..70d933bcd295 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,7 +469,13 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
 	if (retval == -EACCES)
 		retval = -EAGAIN;
 
-	if (retval != -EAGAIN && retval != -EBUSY)
+	/*
+	 * Only stick the error on suspend failures.  Resume failures are not
+	 * treated as permanent so that the next resume attempt will run the
+	 * callback again rather than short-circuiting on runtime_error.
+	 */
+	if (retval != -EAGAIN && retval != -EBUSY &&
+	    dev->power.runtime_status == RPM_SUSPENDING)
 		dev->power.runtime_error = retval;
 
 	return retval;

-- 
2.34.1

