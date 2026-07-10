Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300683EFFA8
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678385; cv=none; b=T8zY+D6bj0/jZfZrirhE5WSODcgDSV12rUPAM08+zqMPDhFL8O5zcU7Y1fzJT98TH83zks95VBguI6uZBLNf0nPAUdSGENuMVbNcKzr1zL3cwZvtJmZzvhff1CdOK3OvS9sxpVvSnv5ZZu/vbFTe1riMZXsYiLIALehCauRcC3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678385; c=relaxed/simple;
	bh=507xJERYnG5py92oNzE25+rSf6TS9DCmeVwskQmg59w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VoXFb+NKLZY2w609mnekI2CiUCJ9MXmj5nMHm4pUeiJy7nsYqR4By3RewcuuQz1lIgK6CRU/oX00LoizLMprPo6la+4bB7tKZYnqt88DN78NZ5pYj6t5fuh2LJIN6oalfsdXRbfIC3orkJWsALXmOkXeSyJMzY5Rrhyfe1/VoeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wu5cIhAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IphxlvD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wu5cIhAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IphxlvD9"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7e38f188984
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bb0rb6OYxOnjgheRhVhbX8
	rxvB0hOJvli2NDVK8wsJ8=; b=Wu5cIhAol99zZRRSArzw/EetOJXjeUYsNecyrv
	YKDyQr54gKdfucpDY/5pybi6i8suO9uqG+fkYXM6j5CYCbeg1xHmO57IslklIPZw
	6EpdbDwJWCptCNdjDQlnKUNcqWLs9loxGJhEszFM/X6uUW+MSXtZ12ToLLKWyvA2
	yZXB60rFKo0r5iQUmaneiGJKuf6oRu6RfE7J+kQUjkugTBuLn52iVyLebVhz6jCM
	XSttY0IEG3A9back5ZzjNoIo2nVWgU2hOvEIpqpJZyRnb+GT4jd8x4ygg+U7JHmc
	WkAbuUtA/wnvvJtEcytaWngRJzbMaPwBfWeoQh/ZwbeL5TVg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesuxp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848544a8496so899401b3a.0
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783678381; x=1784283181; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bb0rb6OYxOnjgheRhVhbX8rxvB0hOJvli2NDVK8wsJ8=;
        b=IphxlvD9SvkBGSHWc5a5qRB14nOo/HhR2eSJYkfd5/S8B/gRZwJRYOO5VQeU1SuoLW
         Opeo5Wt2yrLTGf8wWUfENa/vFpDu4ky3BGPU6M9MWV0fX7uAuIx6yOLGE3fwoe0t1xlW
         ZD1IWu1ohhdJVDzTxRmK0Of0ds4axrarWRc1hq8QnucMWuJGFXWB2UzYJGC26gnQTAcR
         7yxpKvADaAsD1sVYBRJp0vL/ceEwc7zoXVz8DA2Pxi826u9uPnZMFlpIjL+1sWSAXxU5
         USfP2HoOb6XApGmWDCIM9v+YZV9jQzsROZqLFfyU/X2FV+ct2SKjoVo9pKqgdDPxSqzr
         3qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678381; x=1784283181;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bb0rb6OYxOnjgheRhVhbX8rxvB0hOJvli2NDVK8wsJ8=;
        b=VFEz5yvsUqMHrGAWEI/TV7PLvxXRHrKEyc6qd5OBKn0OFsPd8i7FjZKTOymUJsh42v
         vdhkMTOrs6Bz3/N4i1wO+8OWP0KXe1hHGg0yuErROYptcYRU+hXIx8mvpRF6SSEkjHXI
         ZqS2B43ZKOXKOTNrn42lS+t72eAVdTlYWvuQkZbEmnWec7zAVanPU5mUj1K1V4nYycKD
         ISILPr3Zsws3xwaejEThVA7mNQSm7t14dqqewH5Yyqf4Uwkmtom0eBGCMI39Y1JtbZgh
         Vr/LE8AiW28+yfhiw+5D5JAkpWE6tdGiZqxGxAM9arbuvy/3oNS9oPWDcO7cxqktiMWb
         c1Mg==
X-Forwarded-Encrypted: i=1; AHgh+RoQejaTmBjOCSMwY9GfeZaGy/Mr35vGZXaJy6z0Iy/X2a5yWpqOogSglQzTdkTLU84MqJR3nw982NRLeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyipOS/9N4EyzTRUhyUizJqDGbog9Uubh/gWrsoKcHLgGiLQ3er
	Wi4GrVSuYdqiDbYIzF8WKDsKE2LhLYlagnb1BlHK+Z04BVTwn3+LHDf+QSLsB7Z+m/29QAvnk8s
	ckcYt3sa4DOWokFvMJFm1jyPS22tx8vMueOPk1rzxh8cBVuQyhHw5oHSnbpcZ3lxfrQ==
X-Gm-Gg: AfdE7cl+OE6HnzBIZVXBx90DgxGdPHKPAFx/J3AYKyTML1Q8QURdk3pCHylnwzVHzsN
	V2tW6VYyzsJNctA2b8Z0vl40YP2hm49kRtqGEz2st8wVIQJj1bEM4M1n7PAJUm+afXiSSgycaAs
	dsfh8ghAy+X0IZDKAd3tSBkCewZHwe1xS7RC+7Ns6dCuE4ROpJDMcoYDzE5eSR3yDbJw0PqFR/K
	QA19MpGl0lExpTpbvV3gv0GwrAulLFO3n2rm5i/YZUyWUd4jgoDIAI4TW3vSlX6Gjj1e63XGT9l
	Tyr0fcKQQUh+qPJ/2XilkZn5I/wHrwOqbpzwAJlLAVCa6hP1sKuw769K2H4y0hYCPRflmDqe6gz
	LYsY4/MzShFt74cRRx7xHU2Ecq/8wZqZcvX3B0yQb7oog
X-Received: by 2002:a05:6a00:859f:b0:848:5935:2e11 with SMTP id d2e1a72fcca58-8485935322amr6044415b3a.48.1783678380742;
        Fri, 10 Jul 2026 03:13:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:859f:b0:848:5935:2e11 with SMTP id d2e1a72fcca58-8485935322amr6044384b3a.48.1783678380167;
        Fri, 10 Jul 2026 03:13:00 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm9977815b3a.46.2026.07.10.03.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:12:59 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v4 0/2] PM: runtime: Fix sticky -EINVAL after resume
 callback failure
Date: Fri, 10 Jul 2026 15:42:42 +0530
Message-Id: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJrFUGoC/5XOTY4CIRAF4KsY1oMpsBucWc09jCEI1WNp/wk00
 Zi+u7RuXMzGTSUveXlf3VnEQBjZz+rOAmaKNPQlVF8r5o62/0NOvmQmQSpQsuYNXU1M5M43w5H
 6bFtjm4TBjJ0JU5+oQ2NHMo2ldgrIlf7WHmztKg+srI4By8RT3O1fOU6HE7q0MEvjSDEN4fZ8K
 Yul99I1yI/1LDhw5b3bCA1COPgdYlxfJtu6oevW5bDliSzfmc3njCxMrbcHvbXgmkr9w8zz/AD
 MfO1YbgEAAA==
X-Change-ID: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678373; l=3214;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=507xJERYnG5py92oNzE25+rSf6TS9DCmeVwskQmg59w=;
 b=9qtHC3wO+lvgguwyg/YH/XaI46a5cd/3BUHBLg8wAzd66qJAtThnToflVUGl3tpha+T6cUCl+
 M/QpLd8HbI1DExzKIyCBvkl0lKUDMRVDEwXXeqIg47Apli8uRJwZ1gN
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: MKVzGJPLXLeTlafk-c7PQmVoa9_tgEES
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a50c5ad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8
 a=LpQP-O61AAAA:8 a=cm27Pg_UAAAA:8 a=uz69HyL-ks-YmZ1FyLUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX17OFfXizEY+R
 i08vGeEjhU+VgeMSMy+tAI+2BqM3m90ruQdfBWvDr+DUfLH2QwbgOyj1RTMY5sEODZy2rJxJnd7
 1aFE9L/WEy+jUrc3TyCyysWWNVv4Ntw=
X-Proofpoint-ORIG-GUID: MKVzGJPLXLeTlafk-c7PQmVoa9_tgEES
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX0GGFjxHUnaRU
 BXG+UJSb90LyD+ucYC0oSA38Nzv1bhnjaM/5qIgzDi1ZwBSxqiF8pQYDo63M3DuStj8ZyXOMWLW
 exr4Cz+5MkVgDciSW6nTPEYzNmj89+O7l/z9tBmfyivPg8zck4eZlbBKNpj4XdcIO6zKh8A5STE
 VyFWeGzkDUBEDtQAeAZR6VC+jGe5aJxCH025lT39cHTeuoOvhEWQxqXx8OHQtWNxx7RtT65wFh+
 0fPgOfnumTeeysJHC9RuVV1nuFaRRzSluK7YEuYC3mrRFaqLbWqeAEFsfGLyaHEKIhP+f6X0kLg
 sTKYWaX6+RwapPROuuW+AnlcC3i0BDm+08wSTBSUm3zL6zgorxQCrOHkWFtk1UqeMRe3s7i8QZ8
 3J58C9r0w8rsItk4r2llhNyt4QuDht9rNR7p810ulKBYmQNwucq1HFQmTa0paSccBm+9y8skvXt
 1wlNo1vpvHxTNmk9NWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100099

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
Changes in v4:
- Added close brace to resolve build issue.
- Link to v3: https://patch.msgid.link/20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com

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

To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Len Brown <lenb@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Mark Brown <broonie@kernel.org>
To: Alok Chauhan <alokc@codeaurora.org>
To: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
To: Dilip Kota <dkota@codeaurora.org>
To: Girish Mahadevan <girishm@codeaurora.org>
To: bjorn.andersson@oss.qualcomm.com
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com

---
Praveen Talari (2):
      PM: runtime: Only set runtime_error on suspend callback failures
      spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()

 drivers/base/power/runtime.c |  6 +++---
 drivers/spi/spi-geni-qcom.c  | 17 ++++++++++-------
 2 files changed, 13 insertions(+), 10 deletions(-)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260625-fix_sticky_-einval_after_pm_runtime_api_failure-6797d0a5c4d0

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>

