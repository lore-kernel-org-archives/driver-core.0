Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CB336A34A
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587206; cv=none; b=bv8NwCl3PQSdxQyfjHgT/y1Exk1gAiaDCI6Dh+wmUimJboh/M67B/bnFxWbfXkzd8SiFvweGuf3UhTMi0wmjDY/Oqq3cpCF+fBrWeG2XD2kwbXNTj9LNvBFlhbTVbpulz2TXq1bQYcvmcjKxtmV4zSciJ/k8AcW0SX3oD8qg5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587206; c=relaxed/simple;
	bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sz2RtNzPyq5yo8FWRwqVDNKLIeK/7WKECEStAs6RtmScBo9r3lgJg1CbO5hRMyL6/v2q1SIIRH6VhOS3OcE2vxCMbQg7rV7glkIm98M/v5w52jqLgPCr9/wmmVDBf6mz35MaITgcv7YcFa5d5PQQWGlcZziv3LVRb7rTj62yJGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbpRXmmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i7kAlmDd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbpRXmmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i7kAlmDd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB43Ui2186483
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 12:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=; b=VbpRXmmuQqQ5qVCU
	RJJSwsi8YyzrKvLmTJW5z9ilS0EaWKFCIgIDSbAQLADWHSO+n2rJ6v1/vITsZijG
	j6inF/wJuYG5k+3ao3kOSb2gt55P7+GY4deEe4kzowQPVxgQ6ueZUdLHt9UOgZDY
	VZkt3kxDGbMA2GB5+TxAP64q0e6NghG8MrAXyLJW1HD8Ja9nzHWkqgu7KrBeYw40
	csCLSP+RZBJzaY9fyKeD8lAA8Vz78bHZtO/alvlEQgbIKF033vv4BZpe+O9ZuUxL
	aH37thCgBuoofqcZ5FT3uHpLfC12fgfDLynZRezXir5myO23d5wwqoESLlE4Dgqi
	PyUaXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2b93v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 12:00:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514b673c8f1so78655381cf.3
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 05:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587202; x=1779192002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
        b=i7kAlmDdr2wTVJSWvZttricBIOt2wE7wjhV2qLy2B2RIfPj0Pz4MVFTVolKcrARbkP
         l2Qr/HAAaWpB/37Sqt4SXxez0Xd/dL0P1KXNCoiZqEM7koenuedMFaoWU+BDrSbh33hf
         b6CIQeUvdoxUamwbAa8XE0B1SuLx4SuYAlPSNW8I9rkyL81Ul7W6EKJL6ebhtkQDUZMJ
         sG5zQtCb8iWSow2AVPnQziK3mNBKWtaAklr00B9bXvYMFno7Rzbx4ig6dE40zIyyhLc7
         WMBLBg9w+4iDfTWdO19pcSejFwrFLgUYdts8f3vPIrJYp+BzdXp9KXaTg/9Rc/mnXSS2
         2COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587202; x=1779192002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W1ocdRKROTEYKM8Gkerub/6nliQHs5DIXO6Yt2v/oAk=;
        b=r04oAz06ICB0DhhYcbrry0jb0zmISzk3SDdmxQULApxIPEm+mI+NNjW+ag0QuMIOhC
         1tmVlTWQyeI4vQuHusn2pMSgTMSodYF2NvDp39ATK1vPAcm+G6sQ1HJCz2+HmIKO4CZN
         OF71U+Fl4bgJYKC+Wxqira/jKYf+l0RE60W51EZnovLDWPDXonMc5k9mCAFStOTqGhSw
         bnNLaT7vzKvd9XGY78AqxTmUUpTXKzqQbiZyqTfhLiiBbX/c862FrwqWMWI/9TxS2aLw
         jX9XFS3PBwD8KyeiQv7phrlKjXZ1GTTuvro97JlES08LiMnqug1uhpKu75R7+DKKX07C
         y1sA==
X-Forwarded-Encrypted: i=1; AFNElJ+XDMkVS8denZ7kSG/5EUmFfR/fxlEU5a3avNmgPuEKDXTcNBByy1egKTQ2NbDpGaocSkRIhOk1asm68Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6D8txv+MssG+abcEl1iQYcvEA6RP8tRiRuoi2juBSJG6BUXcT
	G69CtQyKqA9NWQGfHv5uxy3zB79Dpg063TMHNoQuVf2yN5e/9cboHWSf4UaqrgFWcYkws1BAvNs
	xzxLP8izkF4VYNjj06m0s3nnY4FJ4cxds1pKbkZn1rjDVh/AeohSCw8ktLw9oe21ERg==
X-Gm-Gg: Acq92OEvwa5jJBXgIvXYnXJc2P/tSXLMOBr7Cutr90uotdWvTI2UuqvoNqHacsG1TNT
	jcrrMPOnHaAPa+zbiqWB+js2xyI2MuqhWcA68WfTl/7u52bG0BGCNFM5VELSqMo9usBuEEaGPVd
	3burN1R3TIsjFGOEuLoqAZELdP+2E1BVFMdwfc3i2G3/ww/WPObhxYPoZsAgTf8AsFmjsIc5Fnl
	MZInqKZGuEhLaNxu13sRgl4a46sC3DR30GIgxlaoeYuuIe69mxq5jR7jua3DvzKmIjPyLhR/iMa
	njl+Any9MADhGP0o+Cz7F5mJxn7iA4yaqZm6TmVnOQPffSVYPI53kuxlgfs3cBPy4GdG+5LheZU
	e9mJJBLhZNWdCKXz0SaUpQNVlH2jJi+DyTO90eMxR+PdJ7q5CCPE=
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514d22362c3mr34391151cf.42.1778587202373;
        Tue, 12 May 2026 05:00:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50e:5f71:62c3 with SMTP id d75a77b69052e-514d22362c3mr34390521cf.42.1778587201887;
        Tue, 12 May 2026 05:00:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.05.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:00:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:27 +0200
Subject: [PATCH v5 5/7] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-5-0035eff63812@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2155;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5qzvWWbh5DFQqh9VSRzCVHKMN16O5fAII+Drmf/uwQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYygPHpAD/qocFmp4XUtkTSI+UdhqkR026fU
 nuhG9wYasSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWMgAKCRAFnS7L/zaE
 w9JBEACdF9JAKwGbUN/7/vpGxkIxY4Z53T9iP0IB4Wsvrn2Z/RTWkzFYcsyta9gdVUsC30cUi1v
 Wtrud32nDPLsZjP9B+9n11nnxuVcDYM3YcmlcaFF6aFM7y2FK50ImRHVVGO3aIoaL1T7+0BA9qo
 zrX5i4uC0Y5exI93thWGPaSPt+ZTdUCUe8P8tHSfu73dvNEMa3jXxdDWxcaTqoINjtjBmDKnW5f
 MiufJMZyQk4CmPe0++KaQh7vAzdOBK9Dt1nuLk+1ARuJrQ1DFIl8wMMdJ+jFZIGt5DFaNkbMolq
 nOL0QhwG+1Uo1miuZTsiA77/sT95jq8haB4S/qZJ9uny/plHmX4N08K+/CW2LuzW6/VzEjBBaE9
 bL+tGPkLYUSDomKREI7AgNv+tmTHrPi2bvB4AScnlIJZDmS11OjPsQgriNO+6CcywhEifPUpS6A
 UQeGI18BnvvDEdqAOikuMKNyUnvnsHL22hJgKdzFwWwyjhZMrpAiTetH0p7hFPP8+uiMk9wKG3L
 Fiu4tA7yrEBfOWZaoU+ye17CQUnAVlbg6B9iChvLiBt4/Ptzh9sq0mWBbUCemFu1OLcrGTqDqAT
 vksr8UqkkJ/UKQmEwOkEMBc7ljIIYZ1SjdwxI7q6Kd5vwXNM0csDJpM8Rq47ezo1uKWv4Rj13vb
 IlMPFISGX85OT1w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: TUIrXT_PWj4zSJR3gyAykY8rJqGd1AWl
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a031643 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=j4F7sB7NKAO1HzpnjMcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX5Ealdz0o7pFY
 GM9/P4N5ylmsXrq3646oPcuWznzW+xlK+FPOMBiW0i9DsvsIL9MARlMfOmQxaPsczm+4gSDCpbY
 zoqHJWnSECok2TIzs555z9lGG6sWQcSYQGh+HY1XLZJoK2rQZpXbYdLhsVpfZSoM/s7rk8zXE52
 5CboB/ni1OFocySi1ajNhmqVXyOJNUq6RDn76ebo/tuU5gOdTp1B0sQxqdqpEhUDtXH8Z/eHfR2
 T4pcZxMlEWS/r8kQa92VSjySVvHjoJiAnmi0Yh8AhWxzmeeQhoKqdJXG9k9yS4jtPdc3tLztNSL
 gB95sXSOcvipXu3bv1m7ylX90YXAqLd75Gi745gUS8U+SNye8zk3TXraD/kZ2/S1gceoglf0F16
 /7LD7ztY2xa3R5oATEmqnH1kRevXisqZmJabMOuxSqJG7KEA2leIfuRs7DBE6apzVnvDDoG5MEg
 gClEtS526FOWDD8K1IQ==
X-Proofpoint-GUID: TUIrXT_PWj4zSJR3gyAykY8rJqGd1AWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

In addition to the above change, make sure that we still function
correctly if a software node is used as the primary firmware node.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f617e02b171f6e59a3c40504a71f8915a41e8514..d2f40b348f193db842aa7c17c9c41be59a03d35f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -895,6 +896,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode))
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;

-- 
2.47.3

