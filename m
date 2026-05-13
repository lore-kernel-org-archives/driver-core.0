Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46865315D53
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684721; cv=none; b=c/ostNcayLi0jUxImPclNGqgL7JtLnBiXu0yfp5Up1OUnpN0XLKOsXmolMXWkkq5iJNDrR4C7K5EjnVNdJqOOn9vxJxefShEvn0Az3q8pftzmwdIU8Hg0p0gg7sBVXX/XAOXlJQC/UNpmYPrO854qV5S4Dl3XOVMvU8pR07SkZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684721; c=relaxed/simple;
	bh=0V71TtYcYEciG9iq1qyh+HCEIwd3+5DXRbbrqXQ54qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aekpeLEZfcHOkKERtar72kLY7cEEyXe8jAmAEYCke199ZAvZxJDhv/qeYQbIuk3y0BBxflg0xAYiJ5QhrzksguFrCkeO1KN/Hf2lWaig+2fJPXmrpALGWsrd2/Imgv7999RhYMBcRH/UBOQ3CMpI4CXC3r8ZLbk8WSqT8s3tP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S24A/8Qm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJJ4WOwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S24A/8Qm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJJ4WOwE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF4nPN4082512
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7G74dft31Lo1+haHnmSpHq
	lZXb5mdDLiyXN6E5wj57U=; b=S24A/8Qmzcan0EorjYsERpeGgy3QqFCNAZ6rcn
	OIEJ9AyKQUTmmSsBVcUwkqpyk5qws30lN6EzaoSqkeDcfFyVKPpQuLOwJhzFV6de
	IbGgFT4gh6Rqwyg0RjrYFvHl1CuH3iDzVX0FdzfMzX/KKxrLvVBu0JKK5VwyKVvk
	vSjgZydzClcn/v4m+m/QFmLAw81c0R1OYZ8sU+bHFWmd0xqDf5m6GLnZ3BJdreTc
	HhGihtm/FCv8QI5/lWDjeXbusA2Ty9EHinaSW9OE5NigeYz/5/TANRRPaYYf2mHD
	vZXHuXJRGGfUAiKQk+KM+3N/XhfBze6iE+QS7xv9FfLUHLRA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1ecp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:19 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6961163ad6aso12631628eaf.1
        for <driver-core@lists.linux.dev>; Wed, 13 May 2026 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684718; x=1779289518; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7G74dft31Lo1+haHnmSpHqlZXb5mdDLiyXN6E5wj57U=;
        b=CJJ4WOwEPNYie0kvteAdNvPpQhn9RHK5XSTX7S6ckWR99I6rF8xoOfwkenC85GKL2j
         QRhge/poOtitYb2KsaUzRcwWqxCRFz3ZV5np0AcgaKLAFKXnZbBnvXnjFGUU4urYMfgc
         QQcWJiOC9Iv4+zjRGlLze2Fq0gs3NaxASK1pk224weZKGUwdlLYIK7vHNfju46LUsQKO
         YryAOoo9r5mbe3o3P3/jSA7m5FYgbgNmviMcH1X6i8gCmqyDOWvBxFLSilxQlNZMr+8h
         BDjvFQXpT4OyRw8qoMcosirgQ9EZSbLhSSO48lzwr5chtHDIgxSVasuZ90zwc/ureLS9
         A0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684718; x=1779289518;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G74dft31Lo1+haHnmSpHqlZXb5mdDLiyXN6E5wj57U=;
        b=bQ+Ug/PDMX3cfdvLlJUmidawmTRHq0gi89fhk3mWbz4QTAxajm197WbsffDoD7ypTu
         8YSFx6/XNm6LvTqdd5Bo1B/uUtCmVGy6+NdQEIURGPt7Wx+JyDQ7QvAW6+jmYNiameSR
         SgzdGJV5aPihZ8cYk7zH94g/fmEHDwwClj5Aec4N12cjj8ThWCn2pXocl8S23VHlAHaP
         E+JQtz1aYKt9HNmo3WDs3xxJfw51dpSehq8DGVNjT5tA+d7XI1wfpfAKqAkk47ORhMAX
         MM3LP8haISCmHxIzSros3Y4kn97R5GXV/uf0IfQXAQt7iDX6Q8EtMWs68wmWEFCxquuG
         RZZw==
X-Forwarded-Encrypted: i=1; AFNElJ8M5F0dWzyYnApPBHqRIX6lLMzG/yWW4KJZSb6YQaQEY3DWnznXd+YklkSREFECr1sUufobkJ6XfslP6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4ZpMwVjAg5JnkbC2aPOUU8fTJ569U71xTNTWQsu76o9jJceBH
	kJ+LTPGhpPqGIgksvkRjlWIlbwEJf4+79vPvO3ykAe5nVhrrQQXpudNx4nq8b5pcteUmdwdWCBY
	gvFndc3BUTnD5PziN36rfoBGdCt/sys1C+zMMHlIsrVgnzk5VjlbAR4PeQTpTt/g4Fw==
X-Gm-Gg: Acq92OGhFVVdgHxMdobefgP7FjfhdXc4wG8hFCiREMfwo+iQJZ1rfNUrmC8XJfpZgRa
	DubES+7bYYzXT4e9QdzlEe+GaGC87h9GkVcDY5nLfXW7Ix5SriGYD+9wx9EOpOpT9uPP8S1jOvq
	0dOHtQdweFUAvgjBlIGWVX0xBfZv4eXGmuAVnXK6Z96MMft+WW+0jBaLKnbwoxWUWc0XLLus3zz
	eiRmBaF2NzeHNdrePbk0w1Kd6kJRwaUBnSq1gbrNze+LcB6zduoocIYSr1oa7ZHr7F4M1m269sW
	wzRJUirlZyvHoB/Rve3UOY7dGWq252VuyCPK3SEUt42CgRmAFeasxbq0SBNnjFnGQ5H4/F0Sivd
	Q9QqIbC684JomApZP+AW1gycyAbgju7MDb5IsD1G60L8MflXECQ==
X-Received: by 2002:a05:6820:2914:b0:694:a02f:75ad with SMTP id 006d021491bc7-69b78e78ddbmr2196262eaf.59.1778684718477;
        Wed, 13 May 2026 08:05:18 -0700 (PDT)
X-Received: by 2002:a05:6820:2914:b0:694:a02f:75ad with SMTP id 006d021491bc7-69b78e78ddbmr2196188eaf.59.1778684717795;
        Wed, 13 May 2026 08:05:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/6] driver core: remove software node from platform
 devices on device release
Date: Wed, 13 May 2026 17:04:47 +0200
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCTBGoC/43QzU7DMAwH8FeZciZTYidtxYn3QBya2N0i0QYSl
 g1NfXfSXeiBVlws/X34+eMuMqfAWTwf7iJxCTnEqYbm6SD8uZ9OLAPVLEBBo4xWMl+nSCwTj7G
 wjJMkLvIyJT5JA27wxgG6vhMV+Eg8hNsDf32r+RzyV0zfj1lFL91/sUVLJT21hMoOSA5eYs7Hz
 0v/7uM4HmsRi15gJQLuilBFxRY0emJg2hBxLXa7IlbRIjryrXYAvCGalYj7V5tlR21bQ73qmXB
 DtL+i1bAr2kVUaHkYGuz0X3+c5/kHM8CRkxMCAAA=
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3789;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0V71TtYcYEciG9iq1qyh+HCEIwd3+5DXRbbrqXQ54qs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMf0AQ5uwUBUI7xyN99CXF/d1xvwkayzkzbY
 U+f7MKCbBWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTHwAKCRAFnS7L/zaE
 w4wVD/4qIYDdscO1r9fZg7OMg4AxykbTGMhI8QAx5HQ9Nag2ozqAmn4UL5llwqMtW3WykfL/xxM
 JoKniDCBR28q8omg6PKuq2jhQnu2SduVxUa+N9zFlCm0VM/Gi2cnJ+JNsgX2XNXsckiqQcNMR8e
 pSpPAfQXLGJwva0x+V12SIkxJ3oVYOhhVNSr9/cUPyZTlvTSEqIN6OJLHrJbOoQfL/Nz7+L93oL
 UdoRZbK4855dX0SKR88YanH9xq7hJaFxYDJ+Ha2qM8Fi6ZScIkCqTaU3ez5dE14iS5HpdxnHkNu
 rtt0+HI3hoEHHQEzWbVDjHmyhwF6nz0pvd4y8UVIlGdDLEkGxue7V33n9PrAMlNOOwjUqF7jYqx
 dlEkG+Bgoyf6SyBdiLZxB7Nzl9zt9DlltvjFuMt019Y796DbS5zqRo5QlnXcxWFVOKf/kkfeIOl
 kMEU642tLKmpN6QWZxylQOqa/3W5AVpXwAZiZACbdzxJXOvAe2X84qLprOCG0VlaGzvUAlgUi8e
 c+LsXIvkdO6w1o73laxmTU9yqWDH/5ScSKEYRagXDFglXsHaG0AcavLbmcYoD/c3JcK5RQPgenn
 M2Wjq9AvbcaJu8po9jrCbdxHqV2FMb9RYEFIS+sKbvzMjmDbO7iuXVHUqXwDjPOFJbUqINmqh9A
 KItTVFjyUybEwbg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: B6rG6qcmgyFjBr0D2PM_45Is27JXSs5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX8jIV7v1qlyvN
 7/npw3+nB2Mtgsitz6BmAr2NmYqe4Azk6CE4DEYfTw53rCZIvbQRoKJiNMjS604ITCaHxLcyXfS
 OaySPz69+uMWe94D8TLDi+igOtOVBKCOVtdeMbWO0/T7+MVsWMtvYnLRENzjKx7FH8CsLwWvw2l
 CMhkTrsDJXFhnlzXTVE0aBCY3UExbToSqGaJpcy1tz7rH9blw4YfjCt4WtY/i4GoA8g4XWX2Kdz
 7mCS+GU9I+eBATIog7zesaJXur/JUybyMIIdnIxS/jtSNe6zCimv6tJwxcXJa/j12gzXnmViUXf
 /UukQ79GvdRRAPwcY6DAYPb+/xYqhzWIvxiUwkmwnKMG9gkk+yCLaCRMd/iTUz2OgJ+bc7sXWZm
 UXU71lsb8KJPHTRU+4raoivTULdDDz7BPghhkkCY2dwqkvXfd3BWSRorZ33XqBnkyEDablfFBpk
 yA9/xfhSISp6G5kKfew==
X-Proofpoint-GUID: B6rG6qcmgyFjBr0D2PM_45Is27JXSs5p
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a04932f cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=pY5QAryt2IY3wJuL2WEA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

In this approach we first provide a fix to an existing problem in v7.1
which requires a specialized release() variant, then address issues in
drivers where a unified approach would cause a regression and then merge
the two release() callbacks into one.

Merging strategy: patch 1 is a self-contained fix and should land in
v7.1. The rest of the commits can wait until patch 1 is upstream.

DRM and platform maintainers: please Ack the two driver patches in this
series.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Make patch 1 a minimal fix that can go into v7.1
- Don't provide platform_device_add_software_node(), instead: rework
  drivers in question to use other existing interfaces instead
- Fix life-time issues in the xe_i2c patch and remove unneeded fwnode
  removal
- Fix typos and tweak commit messages
- Link to v5: https://patch.msgid.link/20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com

Changes in v5:
- Provide a helper for users of platform_device_alloc() that wish to
  assign a software node to a platform device
- Rework drivers that could regress after the swnode leak fix
- Split the series into several patches as necessary
- Link to v4: https://patch.msgid.link/20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com

Changes in v4:
- Drop redundant !pdevinfo->swnode check in
  platform_device_register_full()
- Handle all three combinations with which two software nodes can be
  assigned to a platform device
- Extend the new kunit test to verify all three combinations
- Link to v3: https://patch.msgid.link/20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com

Changes in v3:
- Make sure the reference of the primary software node we possibly take,
  is always released by moving the get() before calls that may fail
- Don't allow passing two software nodes
- Add a test case for that situation
- Link to v2: https://patch.msgid.link/20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com

Changes in v2:
- Change the order between removing the software node and dropping the
  reference to the device's OF node
- Address a situation where a software node is used as the primary
  firmware node
- Add a patch adding a new kunit helper
- Add another test case
- Link to v1: https://patch.msgid.link/20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com

---
Bartosz Golaszewski (6):
      driver core: platform: remove software node on release()
      platform/surface: gpe: use platform_device_register_full()
      drm/xe/i2c: use device_create_managed_software_node()
      driver core: platform: unify release path
      kunit: provide kunit_software_node_register()
      driver core: platform: tests: add test cases for correct swnode removal

 drivers/base/platform.c                  |  19 +++-
 drivers/base/test/platform-device-test.c | 166 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.c              |  22 ++--
 drivers/gpu/drm/xe/xe_i2c.h              |   1 -
 drivers/platform/surface/surface_gpe.c   |  36 ++-----
 include/kunit/fwnode.h                   |  19 ++++
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 ++++++++++
 8 files changed, 276 insertions(+), 42 deletions(-)
---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

