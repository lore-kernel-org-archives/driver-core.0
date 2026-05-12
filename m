Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFAC4D98E0
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587199; cv=none; b=EpJ8MN9FKPW1SfZwLKIX5Fv3EPDNd38TMlsWVFWwtj1l5Mb5TOQjQ+p2bRrG9S2HKMwrZCL9MxdQNQlY22kYw3zfLIsdVo0G+IVNxSWDDAC3wZ8ICzwEmts7UgBHjEJJdMfX8JyNyZZcv8z2QYiTpeiyLP7I9dIswF/1UWmGhoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587199; c=relaxed/simple;
	bh=FnVwIXx6Ku4B5jDoy/RTsmZKiOzQrXf6yp9wvc3bzuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhk0uU7BklJ3hpUoq+BR39Bc8iRsUkFkJD3WfpvibCxvqb44pctyr3qNVt2ChtwF/leEMkTo9qCop+laMu5rKIGoE24unCz5Yi/UuMxYQ14WBkiE2YOCTkv7zfL7rPPCKUgirqrOLClvXjice9Vdgpy6D413j3SpdU62K2Vd0CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmRF+qkO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OidkszLW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmRF+qkO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OidkszLW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB2MgA2519014
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsIlzmh9tphlDY1UgVWouFfmn5szfdJ33CZ+C2oPx7E=; b=nmRF+qkO4mGQ0+Nj
	XiOUNC4GoKCSEBmbKGynKNgdlODGWZYMxmqGXvqXoBsKRaeWPJTBnRg2XrDqeT0z
	Ep2XUuJIQ5+uli6AJEgiVUfzZqzJzapiWo9BCo5LW9efKZJglz7MMm9E1cDLqrne
	UH2pSb0c163G1U6RUcWsfb77vHwCZ8MFL/U2UUhoeIBwEg7RmNFRiKLN55ZIlcHk
	sjxroEZszldR6ogPUFJ7pgbs+rTamRBngCZN4kmYqAGufDsqIyh3mh8vuBKEeOjj
	qxVhLeTPT4RRu5ASdw81uaVfUslDLE/b5CM8gcElkYUoNjoLGoSAjuHoCKgeC5rZ
	u8jleA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1k669-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so30866491cf.1
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587196; x=1779191996; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsIlzmh9tphlDY1UgVWouFfmn5szfdJ33CZ+C2oPx7E=;
        b=OidkszLWNSH4K0g7mct+06UOn9mhDShZyv6QXqhL349z3TC/agFtfCd4nlHumzQk7r
         CUatndJJanoVvL7Il68enDPvDSzNNLbuH/nUKo0IAHXoK6hAyy2WYgxy3W4dQTWqNO8J
         0DQKTiKoB4oy0Tb83LlyjKUxl/7NVRGEqGRW9Vy0b9xnpoam+Z9DGNU162wnrzEtKBHU
         xVG2VhnuJs1GQrP6n/9NnbHmqIiyUOM28qNHOxTeYRBv8DUEesDqEc8hnlo+yFJFzB5y
         7Kn0Ub1ZuDgg9UYsDj+SyJeX8vCesTxu6r4gMSJK8sIpddDceapvq8QJtW5rUIrjqhZM
         lOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587196; x=1779191996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsIlzmh9tphlDY1UgVWouFfmn5szfdJ33CZ+C2oPx7E=;
        b=E/1CX+JVYqIt35+kcTkoORYVHavm14iqfJWkyg9jxAxc0NkPzppyxROh4oVqthQwJp
         r3x+9ApUjbLIr99PazLA/0aP4xqNff8ByCkp29yg2J4Kchk1dpCy0vDKYoXFaHJrExXA
         TrqIl9YoP226K5Jpg61PGiXCfJOOYr3M0z6xIvIHWliUcBUadEeQGyS1BvuXdajaosBb
         zBFrIozJLH30FnG6mKJLic1aVre4dawkEdONfN7Ej/B5hG4ni/YtNjFdCDHpDe57VTBo
         j0UUDuonchizQ4LqExfT9MDTrFV9Ut3Vi/CdcsQhDze5j8de4w+iZQ1ly2vz9VZzbN5T
         K6Mg==
X-Forwarded-Encrypted: i=1; AFNElJ9kwB2rnJt8VMlMDrzHvzSDRLGURhRwNFf+cfl2h+kbAT4OWqNAalCQxoyLVgo4H6DmtJsX3zEWnpp5gQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFJvp6A/e2f8/bf1diM9cxis2OtzC8IRtsUVCGcueOe1kRJ6u2
	0L0pjpNPnU6wyMIDub8xAVOmZpWWxn/msW0aHwU4/zomFHbCwoFmALdnvvYZkwEIZtiOVt/QiiI
	+H3cANJSx3kwgWdWroN7bH+dXJewqUhtA8JvNjxAIuuQ8HSfmzgUu2sP+HJr/qLyaAw==
X-Gm-Gg: Acq92OErZdCrVmUiaktBoer7yXj+h9hGIIpsQVYh3xF57vuGp0AOE/GMO/4czUfwnZV
	isUBuXY1k29H0zhjAvafBmZmUSBa8m3Yw7wqhZ9G/JWhERRNvZMCdqNAFsjfJsmWIt9PpYkWQQr
	QqTWqPTrOtsNtJRbgrTtyQuX0ZAHtH8ExnLVEKytqo0zM+lCxhLfk0gGZj0sx2zP87Bq4h04Dxq
	KBVemuEUJ+632A+QOBG2nSavY2294/2maU8hffbndUCrfzPS1WCVPTjptdss0zdmmV34ExSFcNp
	OSE7h1Fmx3AyEQiiheBuCBpfKHbNOsf3t/rRF7THtQpWKz2BANHgvwbuU/sYPCjINYW3t4kkpid
	seGGqZ9C7UrNXn/GXUzEyb2Z6wb9R0JlSdoBElG+G+7XEgE4i8mI=
X-Received: by 2002:ac8:5fc5:0:b0:50d:819f:e7bd with SMTP id d75a77b69052e-5148e7caa96mr244595771cf.4.1778587196106;
        Tue, 12 May 2026 04:59:56 -0700 (PDT)
X-Received: by 2002:ac8:5fc5:0:b0:50d:819f:e7bd with SMTP id d75a77b69052e-5148e7caa96mr244595371cf.4.1778587195623;
        Tue, 12 May 2026 04:59:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:59:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:24 +0200
Subject: [PATCH v5 2/7] driver core: platform: make the swnode check
 stricter
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-2-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FnVwIXx6Ku4B5jDoy/RTsmZKiOzQrXf6yp9wvc3bzuw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYuSqeVpF+6Oi3kvW3NNEoHQCk6tpKW1Pyi7
 2WNxlR1TDOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWLgAKCRAFnS7L/zaE
 w9OvD/9TDVT4yBV+W9E73T/WZHkxETcn/5Zk5PW7qxDBDuCaLa4ncmLsd4i8n3W9vPP3YJlGFyD
 XewbZFaa3M/WHPF1KHDoYn6jJpB3qM42PWskLqakoaze3tZ4pcAVreLZyExLmbgrmNXB2mdAU3w
 f6oKrs5sh8GkgNtnPG+ck4C98lSqXvjFfllUJzMbrzlO6qCEG75mxRevG+DgCP5HLCxhx/R+lVl
 7QS0S4RKlNGZlPER3Vv6r+yl3EcpztihZtDO9qUeOvOahADyWw4YKVYH++iGn4jawAuqTRvJ/nM
 a8L+U/mv+V7fxOyab0Dmyp4UnOOM/TYiqiIlF5LaysyZRzV+qVwPchvoewhU8JiqQ0Vm2/qn7oQ
 x5MZkj79CENg7XMcb78yVc1cTsAtk2Yb1BG8fFejh7Xq1ODw7mTOSp9aX9aoIft76v40+g4ioSy
 zwlzhz8C0spx54GhTfCtCDCD6GWV35k8fm9iHd5FYuOlO0TXf3sEZVpW9X9b9DOzwnJHtZxWYEf
 rHMmbTrSz3LLLt0td8k9VygyecaznwyolREajGcE8uElhU90E7lJPlDoOxAL+cogg7ulDA5tAB9
 oycQ+wKAEJ6jX23cG+XhjCdqJ/BF0ayheRl1mivwmjiEkik83S3A810JinvBU50vzJV6THDwRwG
 bf1h9uELBVNrWuw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qZh07e7DmDYTrf5ExdlejPCqOmuuXKfc
X-Proofpoint-ORIG-GUID: qZh07e7DmDYTrf5ExdlejPCqOmuuXKfc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfXzPc6GvfGNK+f
 iREyao4+kA6kYiZyqiY7Uy1Gb9BA+OMECuqZnsvwRCG/h+JV2wEuLaSDIiCZnFI8jy3BntBb5e6
 5+uk2WUjr69ItcWqGo96xiH6ZZQR/GRUkPm/91D6BZ1tOdmSZlOl3fYwO8F8QUiWPq17ugK0w9p
 +EPNQY/wKPwfV+nplQWJDCBbyQLeloXk3cpRim0SaZiib69wmhdrrzcXcLCT4wsCjk2rGlysHc7
 g0lRi0zDNMKi+Wyy7mPVtTeTJBEIsHpJTms0POmXAFaCxpK+s2GA61PlhuEipWciNbTvc0cnl84
 ld8DPSg1ixaQ5f1pY14LtJiEFVKnwmpdX85kgbBclOsm4W4cAgj+Tx/VdMm4h8houxuaHocWTUG
 gPxo4RDgKyOdeo4mqLescNsG34/jKAUVvMzUOaFtF0I+4H8ZZd6xZJJlw1KvUPdG2Y73Tz7Yh72
 TRxgbGpZdHXJ9hxx7uw==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a03163c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=mI8QAYneSzpRMWOT9SIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120124

Check all three possible situations in which two software nodes for a
single platform device can be created/assigned in
platform_device_register_full() and bail-out early.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..18f33bec36726490255bc7ca3c4ab07d9b7606b0 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -848,7 +848,13 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 	int ret;
 	struct platform_device *pdev;
 
-	if (pdevinfo->swnode && pdevinfo->properties)
+	/*
+	 * Only one software node per device is allowed. Make sure we don't
+	 * accept or create two.
+	 */
+	if ((pdevinfo->swnode && pdevinfo->properties) ||
+	    (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
+	    (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
 		return ERR_PTR(-EINVAL);
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);

-- 
2.47.3

