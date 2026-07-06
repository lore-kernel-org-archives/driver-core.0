Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AF04DC523
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328021; cv=none; b=mYFtQs0g1nxlpJX3dS7DQi9BhRck3Nj5+yGXnP0zEBp2yjVRKSGk3Tk0xbwLaefpi8HDJ7Z+NQ2jbRe2aWlMVl8tV2SKyQYG3TCUkQY31WHCSD/0xYGOko2fbFi7VC6FOI+mvJJ6/BgL3j8gDMUtB7t/QVYhGRfbCVhxdLi4Z3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328021; c=relaxed/simple;
	bh=kv9UvjF4OBgXx5N1hdvWktzSDOGEwPg+1mlUNMbBiJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EN87bEQYaCf5JCX8ZpsmiqybwWOPuyO0OW5+kI36xPHj/VoXx+MD9q1kjIr38riljmUfMy3iVZ9DGVJHC8mUlsPNT1IqA7Pz36vxmM45jC/5m6iaLxfuE5tExVxtgAnMKSrXfGvoy0Fb0DHjn+T+A6411ZI1ic6GfTTt9n0LP90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e3RYKBiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X9nic98M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e3RYKBiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X9nic98M"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TrK3470445
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xQyaC8kg27l0TtZIDeouQj
	A00fl5IzZHks8WCZaGeYw=; b=e3RYKBiwj+xC81Ik/Ry7deKZXGPkps9t3ajky5
	mUHlTjWh4meh4OtAmnRBud6iL9Bg9N9I16/PlHzDUNxA1MPuoQaG0ioboHbY8M2x
	UUk+ZoUkPLZuiU03Tl2OnDw5RhoTPDVKTOigAcVpVhH83a1T3vNWNiEHAarh2Yfe
	0PXGPsGDU/8e9KoEawpih236cWzezXKALka8+w9t/1+UJzs5NDLJ6+45Gq3Hv9lu
	iT+iDd2QQ/N20gSrl8pLKDS6nl0lJsgXuZTTVQlXtMnaNk35ad5G7V5bVPP3De+h
	hVoPa7cCZ6X5SfhuV9U9+9LFLzydqowvxuMbc031Dfovpqpw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen8pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 08:53:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84622d6102dso3752176b3a.1
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 01:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328005; x=1783932805; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xQyaC8kg27l0TtZIDeouQjA00fl5IzZHks8WCZaGeYw=;
        b=X9nic98MI6wUPdsi1bTv8cze6JMWbZZas/U4M47pwE05avFT4t9vWgr7kQuI9PDz++
         Xhk0fsxTES2CbDjALpo4ORCPt5PbVnG1aGu2goS5rTwhlq4dZyV+Ounr0XsrwTV0lheK
         6X0MOHVFfWaocQaySLNVeWA2yAKJfOxVmHxiNq3LXdF49hPvRjKddTFOC67DqlGURiJ+
         e64Hto7ea4lI21SoPT422fJCMSdHdf7w46Ndbp8d+1945jlZzJ6UZ4LhPqMSCIwWQK92
         ssIGpuFbYocMl/HHc9hLjVoL7nnLn+RaBGjTD43v5M9by7wvkXdYFsY8bMb7Ie6k0TaM
         Fkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328005; x=1783932805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQyaC8kg27l0TtZIDeouQjA00fl5IzZHks8WCZaGeYw=;
        b=UDwxSOSDiLc8us+RSKiKgx9CjnHL/MwlLo1CkAy3a/CjnFSyj/IyFHvJiMEnZugtUy
         4AlsXIHB5uWEQrUpebENoL2t9NeKtRZ5tF65e5MPnjUS2j4W7EwYuMgncY3Q+5zJ7eHX
         OvzpBc/kskGDPsuTaF37FJT1jTXO3lczT8NWYCUeP7jBKooRzwdQHnRMNgHHRZhasXwj
         BhTezQPnOCuEiAusMf8Jjy0vhg2X9z+NTipwrEASZLpBrUxHWWNSCRZ43JJJ6JHanyQB
         UqdP1YIw8zuZ2dL/6S0FzqD5e3lAG2fm3YJD2VVPgjkwfPaoyVf52mOk+F/yevDrV8uF
         chTA==
X-Forwarded-Encrypted: i=1; AHgh+RqaEnZvZLjzLJM9LewdTEzT6cUxizLUweBt9yZeOagxLtprtgI9fGz1GoKGp6ukoBgD8hZO2TJLjFjwHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/wZt2LNE+DxtNorW80jQEhM9A/+efbcNgiLQd8Nhty1k+N/AT
	nelQEkfRhAGpss58Gf5RXYzqrg+b7Txub4IWP6YX4eSk8m/smrCOV0DIh6GVG5A2De/2BT05pPn
	teEhH88gX7jNDpNTMSBSbA/TO63smlfCBX/cYIJXJHHCTk6Khf+Qk4J5uj/3B9D0jnA==
X-Gm-Gg: AfdE7ck/sNrXGJg2vA6ndfWLP/4nLN+1eOodV3ZdmP3muMMleDvXfb19j3p6g/vGNxy
	uk3kH9lYI9KK/163hmOfV+uOidwhVIfuk48C71ZYlSUq4lN1wN0v/zClV8KHw9V4vrOicSWTv3w
	RfpjAUAjave9arWe0eC5vFD6skhjpkvmKXKjR2zTWZwqf75p5jP6/IAFiTxdD9t9ezEfZzRPe86
	FGrIgkSz3Uqf0I7qvWdHkFXf+ogH8EqrGJDaE0TfTvSXMo6rmgZPXNLxXhbusheZ/85+0tau+Y/
	63y5b9AOrzbGpIM3gXc3fsFVwLMaNy7klv/omae8zTCTd3i8Wsi7oudi2jLlPxmsxX2UmxiMNRE
	tAFaiWlaiHv4F6mbcxlWYOEeahnTLazZbTVG5hmYlpvZI
X-Received: by 2002:aa7:8882:0:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-847f6ee37f2mr7547860b3a.35.1783328004728;
        Mon, 06 Jul 2026 01:53:24 -0700 (PDT)
X-Received: by 2002:aa7:8882:0:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-847f6ee37f2mr7547815b3a.35.1783328004019;
        Mon, 06 Jul 2026 01:53:24 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9e12csm3411834b3a.21.2026.07.06.01.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:53:23 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] PM: runtime: Fix sticky -EINVAL after resume
 callback failure
Date: Mon, 06 Jul 2026 14:23:08 +0530
Message-Id: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPRsS2oC/5XOTY4CIRAF4KsY1oMpaBucWc09jCEI1WNp/wk00
 Zi+u7RuXMzGTSUveXlf3VnEQBjZz+rOAmaKNPQlVF8r5o62/0NOvmQmQSpQsuYNXU1M5M43w5H
 6bFtjm4TBjJ0JU5+oQ2NHMo2ldgrIlf7WHmztNh5YWR0DlomnuNu/cpwOJ3RpYZbGkWIawu35U
 hZL76VrkB/rWXDgyntXCQ1COPgdYlxfJtu6oevW5bDliSzfmepzRham1tuD3lpwzUb9w8zz/AD
 BtxpibgEAAA==
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783327997; l=2169;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=kv9UvjF4OBgXx5N1hdvWktzSDOGEwPg+1mlUNMbBiJY=;
 b=mn+rVKDPni6XEuSuNPFes5p7k/c4PzNztMybdKlLJYgI6PIK5HSfOADRi3ogBmqhDFX9uVZQy
 NrjIgpAcN4eBPNCytloZRClJGZK4bIp80HuDvav7fELIF7FKAdvj7Ol
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX7m3qSUcL/wXd
 J9TILQKkzZR020JuPehr7196lB6niJlqZH9ILC9CxsqzWJLrMaSGITphmvSmE/UgiRHKDnV9cqQ
 BYVVQSdWCrZiOFI84ZShT+wZGg8p524=
X-Proofpoint-GUID: qhDjnX7f8dAIXa917H9vwzSFHrF4KFO5
X-Proofpoint-ORIG-GUID: qhDjnX7f8dAIXa917H9vwzSFHrF4KFO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX7L0zIG2+jRMm
 4PAxNAjGqlxNMQYiKvnhoYS+QxQ/kZtOJe6Xgi7LqgoA3IFSRomp/4/Ij9FVRKplfpsoQygXW6C
 8TJENHG3s6z0q47eGma5aEPXPTCjH8ioIcgwMwHVeN+8VfcPRa017gJimknPaKmDmrCI12FA04n
 /M8yia8+p8nUv5bB4OjbbTUcvDzxcfDsIdfdsAQatbv2zQapoaOS/mKHqlZwmIsis/FheWTFeXJ
 k/2EyA/SqjcZAWy/QI64AqACISqtDjOkmBeD+pF1aMT0you5IRNTFUQ0iANQwswbST0EweFkeP0
 HztaN58z+/wB4H0jF1x23oKvdOmYHC5z/yGVRRI8OVvqOX2JAHknqkGOMMIj8Mxe9YKHbKThkhv
 c4l8ITouQwiUvBPhYYdVdr/fLST6CTm8uS4c65LHmWKyscboyIus5X69PxMbbDZtslvilE8lIA1
 ey0TqYqMa52DhFeWcLw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6d05 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=rhjnKYj_BpsB81YBZ8oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

When a runtime PM resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  All subsequent rpm_resume() calls
then return -EINVAL immediately at the top of the function, permanently
blocking any future resume attempt — including those triggered by
consumers trying to power up their suppliers — until runtime PM is
explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  The first
patch fixes this in the core by only setting power.runtime_error when a
suspend callback fails, leaving resume failures transient by nature.

The second patch fixes a pre-existing issue in the spi-geni-qcom driver
that this scenario exposed: pm_runtime_get_sync() was called in
spi_geni_init() without checking the return value, so a resume failure
would silently proceed to access hardware registers on a device that was
not powered up.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Changes in v3:
- Moved power.runtime_error assignment from rpm_callback() into
  rpm_suspend() at the fail label, per maintainer feedback.

- Link to v2: https://patch.msgid.link/20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com

Changes in v2:
- Reworked the fix per maintainer feedback: instead of calling
  pm_runtime_set_suspended() in rpm_get_suppliers(), fix the root cause
  in rpm_callback() by not setting power.runtime_error on resume
  callback failures.
- Link to v1: https://patch.msgid.link/20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com

---
Praveen Talari (2):
      PM: runtime: Only set runtime_error on suspend callback failures
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()

 drivers/base/power/runtime.c |  6 +++---
 drivers/spi/spi-geni-qcom.c  | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 11 deletions(-)
---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

