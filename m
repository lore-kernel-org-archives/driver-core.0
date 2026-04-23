Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027D93D47AF
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946345; cv=none; b=qSqZgwLVQySaQUFxIQi9bioWEilS7WDtdQhWNOwuWWFRwQGtTPRbu3y/vBbtB2kCG5MZlsIVl269Nv7roXDCLQOoGg+jkgDMuXxdGGbVO0etpJJN+Wx37vk8A2vd6oEElaoLb+ipEkww0FgovP4NXA3Zg03RbJC/00Hw4JmQghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946345; c=relaxed/simple;
	bh=Z5Ah5+zyjgUIowchJf0oKYWytwiEw0ZLXjONRjD4ydc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIi292YMagbGh7FpL4+7mQkUg12+q8gg6b2v2l5GVU4Y4oS/rtSQCR4t5BlKDT8rcRMxLJSovLKzM3Qbn9U4JoOn4gVpsKkzGMX4cGTR0eTlydEC+UERz/F1xcLI7poX4JhykuTSBMLx/WjinOcmFm82vcfroVKyBUpLmoQ8FyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PaL5obF+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGyMa1z1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PaL5obF+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGyMa1z1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uMtj1565689
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j1/l4zkCa5WUec0T7M2clK+8oAp4jlm4b6G4GuYEZaY=; b=PaL5obF+VmPEeVdk
	PIn9tUqsYNkXghkv4jQVevu4LphVVP1CfApsx+rQG8nV1q8iG3mB2BBn7hTRJ29j
	trG2F910t+WAfMcU9hYloO6v349sShlwYu1RGlCWVjsoQJzJhUgpXdC6rp3jOmvo
	GVwTiqsHSy/2dhekLhA1TR+DLm8ZjuvkNwN/RA2M7heAWJgmuYFIUwlarDnLy1jt
	bEPJ08dznH2XOYRVZ1TaF9TFeZourg092OjXgQZop/j/kFNCPXzi3xXSsulR7W8x
	8rvSRx91QWZPnxrQKu37Jt6LyJ4yUGa/R3KSDT6XqqDZqE5LgzJM5dmrlcBo2Xru
	gXtqAg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuxw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:21 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56db8ed8e40so5768232e0c.3
        for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946341; x=1777551141; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1/l4zkCa5WUec0T7M2clK+8oAp4jlm4b6G4GuYEZaY=;
        b=bGyMa1z1mXIOXT/z3e//9qT16DwVcIOmxz7vc36XaUliBxjxgDYCpNMckTEn915EZy
         8v+FqtDGVpWPIjW4s03koIjrUhYIG5j8IoV+eXHzwRlKED36fVmF4+Ok9BSIbaJVPoCs
         /YHNEylfahPNX7Kdh14SbG8nvBNOWYGBnk9G4M/b9CFIiHPqMCkZ8qGoalHpdPMnXbNl
         YCVruOAnIo9YgrXd9qsXfnwsg4uq6/nRQMNRfdvpw/9PJBvTitnxLj1rVTTbC7OFRjZP
         UdyqeRevnfHKCnWiSDn04Ugj1mr+LnyMRXBztkI+mv8SYEkWbA5fDoxG7OQv3WT78Ct8
         t9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946341; x=1777551141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j1/l4zkCa5WUec0T7M2clK+8oAp4jlm4b6G4GuYEZaY=;
        b=aqXgM3L4xPgslpzHOfHOIspLNlU+Ok0IzdJLBB/LxkVCluUSqln2ZAWinL8sG+UaPB
         yNDZK7R9lzG+l6qV6Fhh2lk92JR6W58UNR8eptMYrYfHwBRWhhUt6hYbqM+8M0wIw9AH
         wx6KzXmsARUuikC05iQFBu10viFWWcTf44H9hTL5eGnOAa/iTToSlSS3zaL/E9FkPqdj
         KykJ0WEvNr/MMwF47X//9GavpJ3jmKiLd/DLJVAmftPCJToaGSqXMCBBR4Pg/SizLxZM
         0H6FRX1ONIm/i9TQLcXJWu8s/TB1MVSSepm8V7xrbRRwddQRJEPJn3wIbJQS+RYVGm4s
         pG1A==
X-Forwarded-Encrypted: i=1; AFNElJ+JZBCn/DuYl5GoRknqMpV1fmnXq5y4PPH/Z+/rVxslokJP7e4mXWR5n8K6fapU6guXSXS8hYKIkx3ZzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzeh51r0s5QjUnSdYwhO+hfWFbLw3WZArPegAIdOKNLcQPSUgm2
	54+jMzp3+Bquh7AJLOOaEToHlqGA3zhZO+fE5kQNSdu98R1AoYdLL1ob4bFxqZ8dP8zf4KqecXq
	oDmnTmapTRRoz2iQXj+fVcoRQ6z1yWiHyix8HigI0XBFUDDYVqd/SSjm/0v2aza1KNg==
X-Gm-Gg: AeBDieuNhbDukZn1Fbaxk2iUo0a5mjS9z06V/jRTAFdGPLyjrmbJtJV9JWXzISIXjOS
	pc2+eSfdSAN+/BQDld9EPwdRaRdQDdE8c49/QWJFKtKOmUD9oPbrhXDqgOZySHXvPOGjD3lyL7T
	+UxY3OyXlNZqRw6vOA0FLBZEBxlhyCaeJ3qXEnn52zNKLkTPx6+VFPajCR8FG1nvf65F10ffI8y
	pQ0b9wZBL6vt3v9V6H0knIaBSxXcqJhMkXkQJJ9+3EJoBdH6H0jhURw0VY4x/nwtUlMF6vCAeBF
	wej+Om5sxO/3NeyOX7ndaMIC0r5QjMpe+e5EBEaSlnUwsk8+v1Lsckr2/cDpM6fGumh926NZFr+
	xEb9UeTXGoSpDEHaeMTa97obgY5brqe4cr3tzHsC63h9y4+/tfVtGOO0/zG+52Q==
X-Received: by 2002:a05:6122:32ce:b0:56f:b674:783f with SMTP id 71dfb90a1353d-56fb6748742mr10294241e0c.6.1776946340959;
        Thu, 23 Apr 2026 05:12:20 -0700 (PDT)
X-Received: by 2002:a05:6122:32ce:b0:56f:b674:783f with SMTP id 71dfb90a1353d-56fb6748742mr10294224e0c.6.1776946340469;
        Thu, 23 Apr 2026 05:12:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:843a:1e93:1fb7:5d86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm426273565e9.3.2026.04.23.05.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:12:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:12:02 +0200
Subject: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5Ah5+zyjgUIowchJf0oKYWytwiEw0ZLXjONRjD4ydc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6gyc8BFN2OMi/NvzCeSL3PhW5qcVNOou0R9Rg
 h/WX3ZUL0iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeoMnAAKCRAFnS7L/zaE
 wzGWD/0dKHCDkPsrY5Z95Zjaq6cQqBJyjVbUah7Ig1lXckZgdmeTwtH6fke8IibjvD36gF0DoNb
 wSWmkg2BjE3ujC+A3elq6vB5Jd9uViJtNY+3hxBNZ6I0lUjP0X//rvzaZnmb0Oog8muxh5Se/nJ
 CfUTODJXIpr2x3LmZROlye2Evbgu3wo6Ve2EtMHNK5gg6Z7VRM2+KpyRLGLrujD8q/NWXsdtrLL
 FTvcqU1d2RTCKa/2584nm807/yhbFUjbLZ8NYYAUNTpxdufXpHQDMx1Pw7M7gha2Ouks9sxgabm
 M0bMyDYUBLeWNUjFfRUoDEcAnWUApXFqmgStOuqisDWz9gaWGRNh0iVdU+Q2EfJn3McvC0UVqMu
 uUf1W+kuanZ4QBVFTmGEwNitrLvRFCUp3ly0geDzbrP4XPfUv3kNCc8e8jrndPzaIhKlZgHFLXT
 p5YXYs7VWTy61kSPXV3mVkMxmOI8cV4UJ3SnV/zo4DQRb3drMuhy5SawuaE/0tFI+NcizIQqqLO
 ZleiLSATOAuC3GGOpFQIJD8vdv0IDPSkBYUKPpTh8rpPYMpH5Cn1Po89uUymIF+p4NKEPErhRJb
 A7848gc2xAHfNF1cU2Vm+5GtJoJ8d5S0XPogFrrCL0QPo9Kkxu+6/JUUv0+U9Pys78MTsK3znVm
 DcyTnL9I7VXBbeg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMSBTYWx0ZWRfX+XvZBynnb6Bg
 Kh/5SVoj/xYxHRXoEcHw9Nbd073N7kTGGPI3EallL7kQHyPOH2R5xzGWcwX2R7hjEfWtYKiEXag
 CVO4FqaL0of1GzExhg2W9OBoPiP+0H1UGH046XP4t6lfDWzpRdMUSLLTxFdD8DP6i00V2vsW4+3
 6Vsq5JthXjkrbuXPAX+ZuxGj+/K10OSoyKyA//D448VcU/zZUBKFzsbg7hveBKMFGc4Eac4RjSG
 DvHC2s5tUG/mV3cvZHAXQhGTknr6aShUKrNThmoQPcyi9JYJV5bojldrvSZGyO8VKq19BgJItnG
 49TixVAthiuqBoxUHlC9vMamGTYVYWJ2Mzqi+spS0SOhCyhPD92jUZU6NlePf+IOfrXCgiUQLHW
 EXAeQz7MMUvmWWru2KNAffog1/0ds6MMXm3Z5CpYwTAZHqdnLUcMbTHqXvIIcDOpVmRmJ76+ORu
 f3+seewUIuYgTW1yryw==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea0ca5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Qj4d4BcRTDQS6HVN2hUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: d54YgO6_-JYCOst5SLdqEpBESakLqZXA
X-Proofpoint-ORIG-GUID: d54YgO6_-JYCOst5SLdqEpBESakLqZXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230121

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

Make sure that we still function correctly if a software node is used as
the primary firmware node.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..43ea7dcd338dd3ddae57e6d0677e5cb2673f6ed5 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -885,6 +886,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 			goto err;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add(pdev);
 	if (ret) {
 err:

-- 
2.47.3

