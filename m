Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59742F1FE3
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861283; cv=none; b=tS/GZuqV/ufoytZ3pskizrMkmGD1ux/H0k8gD//fmkF39mgplno2AltJTU/DRueMF1n+WaitzPpQUw+rHXtFmiSRZhiiAjtSYwKZPY8pG14zE6bqggE6S20IsyaNr9fIJFNlYw1vywTJssXft4EDnSckSjDVVZqbZ/2MgRX6gOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861283; c=relaxed/simple;
	bh=/fSxe+n1OZ1v+6Tgy1mZCXlwoph1Zflj1uGrZV7rApM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E5ySqEkIKjogUJ3GHV/RN3ZWaj1YUyuI1CaKpbA5chyMAZDsRRJ3k6TzjEito9P2Xd60rlJCqsE+4GvuiGdgG/Op2gTXSLcJNnj/FaPlh+AcK1SGfheJt1QcF4SsvaykPNOLkM7mM4hvQvP2biMHKR84G8eXwt5nqREOzYqVKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6LzZF/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFRSb8Gc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6LzZF/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFRSb8Gc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NF3MbM1423380
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 15:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O/YxMSsvmQ9zPmYtsY4Ckd
	pS8mcH8SzQIlIHcTMTkKE=; b=Z6LzZF/nXGRvm2/j4yDunWVwflB6jHzroYR4e6
	REdAzU3V6wMp5/9hFo530v0AN/hTiotMhKiKwFcE7cR9xlbfPGS3G0AxjhokdTlF
	W/1jwqODNhO4x5nwJZI58IZyC3H4h+TI/uy47TwT6/oGejyajl4LoJq71TdYZ2zH
	jsWririUNc0pRq+W5FvSjoqy/5B64xXCmkANsmDZ7aEN18J2nLmaG471R0SUYZGH
	H7c3eNGeaS0K3zNDlh+cmbd2O9/V157CVPzCp+lFs+XN1uuU2Sett1vxrk0j09MY
	GV4XHVy325BVCQ15wQ/lXZRxR4xQAS06zNEPcB6D/jrrsyaA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgwbj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 15:41:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c882774f0dso4120902485a.2
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771861280; x=1772466080; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/YxMSsvmQ9zPmYtsY4CkdpS8mcH8SzQIlIHcTMTkKE=;
        b=bFRSb8GcmUvGAuV7chqWTGeeb0FCVLNHPyu9ObSyeCZCcNrnr7YrwNk79eYGaiCrnt
         y0HOX9JqIP6CrB7zJfxCzxCt1/pTnuq4ZPZauW1dvi5RiNRLj8wBNcl/K7sCOqZPFiYT
         V+CZXqKZrAKKIVLrswwtE1Uof11L/vK02A+AQMMYH7pfM6eNwQTIYhShAT1fWkODJZuR
         GAjEYlLKrc8IZRE1crnY4VVw0Rj1vrel2eAgi8A+EQg7y5ykB6KCzHJCsXjYg6bvrRc/
         N1HE7HqXrvWJHeoB3rwzweCzawLBK/XVBfcXSR7OijW3lHQpl7Cprz4kNUh6mXIVMdGA
         L3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861280; x=1772466080;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/YxMSsvmQ9zPmYtsY4CkdpS8mcH8SzQIlIHcTMTkKE=;
        b=OhEom7w4RtvzOEBkfYfZVm2T2fgtplK/sKNrnOKKRyQ9un03lbdq9HVRHclFVmLI7+
         9x3SKTJkmWO3xuCUfFkTyvZc+Oek6HmQb5md9SHs2403tKMHdagk+K5EwWchFFOgQeqQ
         Z1vpGK0aTZz6hJpVSS35mA4HvU3lY69yH/w4T3DhEJwHiK5HYQgg7kRpUqxGEJYKlMOZ
         W6Atz3ls10yt1snoz00oEqDRmDbdG3vEalrC6OC0DOurO4rJ5bCbNGkqiCjnBykN3FoG
         EjqJRiCUHkFjwHF4PhttxRp3huP57b8MfDfT5WfzGis4pUoD8M2l4gabn5JEPZuS9gTP
         Nm0g==
X-Gm-Message-State: AOJu0YzfuC1ubrE4PGHrQZgxx5X6nMNaWr3c4bXscDPby6sT9iJlKNQT
	39ATkp1zwHtoZTfmXZZstmlUzNdE6f9wdkeXJWs/V9efbn+tQqB2Xmy8gNNW0IkaQXxb2Tvibyn
	gWMnEkr91Ej2uefWdxDQstr3G1vubHPyJGLGL0zUF6Dh1/33q4xIGKfVYMszTBwST1Q==
X-Gm-Gg: AZuq6aL52NQOu28NvOWQYsfXzOQPAxGfgKnpXolYaYo9a6sYXipp12MKe7IQ7chGqKQ
	VIYfMgQK6HheyLpNczTcQw8S6KG0JXVhjbuwR5Uwl3Q2QkeYaSgqAMQga5U1iD3t4s+iKKLsTBp
	sXz5T2IwnMK1LxnQkeptIzKbmeORhOwo5bL1FdgkydUP1TAzDtoSlTMZc3hpZMOAw3uerwoqbdl
	sAmbdU0ixIL84UOe3SETg2ZqRTnrOqpyKBPFowBlpZA7HmSH8NdnaTaT0fmT8HPk/8VatHIooHF
	4u+2D4kIwDqdgySqpLNliA0VkLfzbtdZz2szCjoJD6UcpvCsgkSmQSXrqwpFxEXNG5ESMbLbYCR
	BuIgRsOjkJXqnnmhbqX7SftSUhXYJHnkFot+umlk0ywCXqwfLJrNg
X-Received: by 2002:a05:620a:489b:b0:8cb:68ed:cc28 with SMTP id af79cd13be357-8cb8c9d1c8bmr1041226285a.11.1771861280163;
        Mon, 23 Feb 2026 07:41:20 -0800 (PST)
X-Received: by 2002:a05:620a:489b:b0:8cb:68ed:cc28 with SMTP id af79cd13be357-8cb8c9d1c8bmr1041222485a.11.1771861279696;
        Mon, 23 Feb 2026 07:41:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm295266755e9.3.2026.02.23.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:41:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/2] driver core: provide and use
 device_match_fwnode_ext()
Date: Mon, 23 Feb 2026 16:40:51 +0100
Message-Id: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAR1nGkC/42NQQ6CMBBFr2Jm7RBaK6gr72FY1OkgTaTVDqKEc
 HcrJ3Dzk/fz8/4MwsmzwGkzQ+LRi48hg95ugDobbozeZQZd6qrU6oguj4ixtwN1KEwxOJsmbN8
 hOkZDpKodk6mZITseiVv/Wf2XJnPnZYhpWu9G9Wv/NY8KS7SV4YMz9d5c6RxFiufL3in2fZEDm
 mVZvkG5vFfRAAAA
X-Change-ID: 20260219-device-match-secondary-fwnode-4cc163ec47ee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, brgl@kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1286;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fSxe+n1OZ1v+6Tgy1mZCXlwoph1Zflj1uGrZV7rApM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnHUHRveWKuWKDp0sn+82PftVjhn17Y1Kr2xei
 sm9M88c85aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZx1BwAKCRAFnS7L/zaE
 w80HD/9+l4JCPtjD6kvdPPLGWbQY5gqLHaSsauSviTdriVGGwUJEFye5fyueGABNTMDI9y3VCDf
 SR2huER91R0dHTpPBvt8uU7AG+U1k/JkCeegntxhzN2f98qDNxYFSrBQrkpUDi0xqFWyxG1/HdO
 eTqrTb7FdALrXWMiP8IOvNM3P+DjOaSSRMqIvfRArojKmAVKZzGcTczTvu17PF1PkZMS3HNntnC
 fVwjzJ1u4dAT8dl52fpeAVb1zhBN1IpgyO2A0kA63YLBQ65fFieDHy9x84FJ60cE8wgi2fId2lv
 2R3113pEtNqWAtu4bmR2LkF7jUP5M+/E70ztcURogimNdb0tIWZv6Z7bqSgVlC10NHhM64GjzHT
 p1Pw3QQWIx+akq1dB3KuEbhb5PmUdOwz79LOYappNfalgSz4/O8l02H4RSuiP//OTJW4kCb34so
 /A3qC3AJN8CxPTkOoGorYuutrKaFHsv25DsrAf8dA9EivVQ/gvXXlnmE3bm4Mzuimrjf7lRC+5B
 0+GcbgFgOedOssbEC3ECWTJm1EuYML0sSbjQWAmxdymScTq1snOvE+r9pXhZLNLC7iY4gRGfamv
 a7aWGQhob/vzdH8pjs7vZ6WazzICpkRCIQarlLVIBKcpOL1ndcUwrui+Hom73V98B6tvQ28+mK/
 FVlkpSzGbonNTIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEzNCBTYWx0ZWRfX9IPVasl7tSbU
 JcprJ1b+C9YyLk/1rS2rV/ZqVET2CtSW3/6ljVZjLBW6P7XkI5HybtfDh3nH2nStBQXqX43nbgu
 C/8Xy4sjwrY4p7Ty5VYMBt3lX54Tqm0oqhLBGbDdceQ1K3CXtWXJ0e6WlZ7S8eWXA6Kd0kV4Uj/
 YLkATTDQThQ+56doi7NNZ4PT5LiFP2Lagq4fEmDwpBH5+qh7Y6FMvMF7rBYcXvz0r4ZI6oCzkMN
 4TFWin8yS7PgWir/Y1cE3QwImZSZcw9qnSXtnv2wPNPrZqoW+sgAAMbQQn5riGef/k8j9k+d1hn
 60rM38lHaWZ3Ppoyf/wAQuAINgd68M0LTXeHnaXJkKdrrUv44suP8b/kljD6PJNYEwk2ck6Ty/C
 ywFZ4DOXhKOj1dym+zzxViZqWfhmgRiNeZCFKZt9dhd+BOhso955PXBzgAxnGrOAIo4V8DPMFUV
 jtd3MAcJzkt+kvSdTCg==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c7521 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=AoYrAuEogKCLvLv1WKIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: f0rCGRpAQyGDfX5GsaToKsm3qeqQjJjU
X-Proofpoint-ORIG-GUID: f0rCGRpAQyGDfX5GsaToKsm3qeqQjJjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230134

In GPIOLIB, during fwnode lookup, after having resolved the consumer's
reference to a specific fwnode, we only match it against the primary
node of the controllers. Let's extend that to also the secondary node by
exposing fwnode_is_primary() to drivers and reworking
gpio_chip_match_by_fwnode().

Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fold the code initially put into driver code into GPIOLIB as advised
  by Rafael
- Rework the logic as suggested by Andy
- To that end: make fwnode_is_primary() public
- Link to v1: https://patch.msgid.link/20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      driver core: make fwnode_is_primary() public
      gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()

 drivers/base/core.c    |  5 -----
 drivers/gpio/gpiolib.c | 12 +++++++++++-
 include/linux/fwnode.h |  5 +++++
 3 files changed, 16 insertions(+), 6 deletions(-)
---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-device-match-secondary-fwnode-4cc163ec47ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

