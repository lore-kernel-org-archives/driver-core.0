Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EDC41B8F6
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205126; cv=none; b=a0rOvPJCxtovUvOMuN4kCJt5XZmXOngdzWHR9cdJFYHQ98hhEuSRcnRalpXkErgXIwNrIo9708n8JXQt206oOXiS9fh+JMYmH8VdG6CfjAsc702anNmVpWSbU4Q3hcAHEQ3Wstf8XU57NjAK9OZMs0JeFAv5gKpCd0DDcgNYkps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205126; c=relaxed/simple;
	bh=8hpM+TrGfI2rbJN2akFn0gkqMVl45ni0Bp0sA4vGJ68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krApfMeQ9do75wFN7hfnREKeK0khieK+o7ze2LfO9rtf8H75YwJUF+g5q/Pod6DTvM36UtTbry8LijS9srJ3jEws+HOxmudNBxLRXx2x87Uf8HURfLewcFxMGa0xus5nRsfJs19+3hNfppf26E+dLUhklfjYQGqpURLzIybFZls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eXuj5Xjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+4kJcqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXuj5Xjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+4kJcqX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBitM02730886
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=; b=eXuj5XjzzunNm/PP
	yT0Me3iks0+irV4A1RWwsgN/fYytSkrNebwbB3QEFO3664d7gCm6E1ZZXeeFDeCv
	6E4t5fQQOsPOfor26lfKXGo3KwdykavAK48uKvV9hEdsmqakxjsWMrt+kYlktFJ8
	P1PkLv77JgWgLalKxdfAmOORicqGsc1EgOCZmK7odqU5NhSkJso0QHrL++bifx21
	ifeVN4pLi35teK6jKFz3ZiA7Us624AVPJAG4569iETxdg8CcgdvKc7CEds3LhZOF
	AVJXVkfdZOP2NIyelNHFosMddhcOVXHcdZkEa8h2vJ66FcdwD/hnjGcSRiHInLv+
	cW/1lQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wadcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so63470191cf.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205120; x=1784809920; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=;
        b=R+4kJcqXHvTwERgRHsQcwfHV7laIsRhGhK+IFW3Ks7CRcPP62/QlPvFPCIMXlGJNW3
         MmH6NofbA0UhLgSCjtIVRPlS8nLW0RtMb+ezbSX7/eQ0h/2+PerJSLuwSbW32x8QlgAY
         vBK0hB+xF8AmLb93qpYrj9nTxvK/nITjo6J75drwQDac/XsnpVKsgjczffKDCQXUQ6OU
         aeqBq0/J/liwmubh9oCZ+v2NDMy8KeQp4CHc7lnwe8W7vB61pxNbJkTGsHvUFQCbLRzf
         n6xmk7JD21+WMfy6aq0CQhfDkAAoXq61r9MTk8KR1elsOT9bcZf8/8yteXRuh6oR+cjr
         oHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205120; x=1784809920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T/W6God4Jx8WMmxqemjau5eSXR0NRTo0Cd6tDZl/0fQ=;
        b=ax4ZUpmrToiLpjOV0zBBSywfLkxp7iG3QtkGiCohIJPN/lMfATjnbnEOz4ZqRGtZhg
         TW0ypAITKOd1ufcbw5EE+Qd7dseqY/UWk7ykhtFajf/cSmcPuhIqv1Kjz0h+XiBwxbkE
         m21+jc4SMXpygFnqsiE1dQB/97g/ZRdkqHq6Ffc7Vutq9rudPoTAoL9dH0nolIphDlnW
         S8y60n23Yh6ThPZhg8/92mNhRHNOKcnEwa/v09Z4P1120MxXZjezmUSOaHK0UgkX/Of3
         eQjLWhww0A6RH13gRvXyWmnPUT5jReE2UxwpLuU4mfZp8LpdQIJyQk0+p4psJcCKVnCw
         2qRg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+c12BIt8tmrFKtbfhb3DLKZjYQD39qhVOyu2fCbkOGCbC7Mcg/7rfJojas14Hr7NCgclfFN0pplIRQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPuVKVLFVhLs61oYc74zIbOY23NoEAWv6iY8XrS4Blr//MiGrC
	L898qstLGWMLwmDHa9hI42tcDqx/WSK7bRS6EZtvmpBnwA8hASNucitD6OGjlDVQjGqbG+0UkjE
	2nsM/YCuar0HPX5907nWuzPFzE5NMDB40xzq1h6f+a++1Qdcxlvr7ERzRIW9e0vqO5Q==
X-Gm-Gg: AfdE7cl34st0Ut1PpqlhV81KUbMcs5Bc/7rMlEahuo6QhFbzINMgti6Adab17WBtRow
	oSNe66m9T/BiVv5hPnYGJiwK75Ap2d9oXySWfOj6diHheusR1PBU+cOiZJl4gwXvjt3MsJT/irP
	N8LFoZvRS6FgCID3Q0YrIaQeYJo6FKtpjwUdiMvNyf4++AI2zg/FZBEQbq0MIj3YAQ7HQCl7BsT
	YOBFMo9yw61zx0YhWKu7YUFaykVsusjsb8idG7RJs6/+1BGRVaebD/CG1ZyhQ9/qMaXaRjfhWHV
	PJbbIJr5CVc3UuF3dPm8LQbUxslwtTvmEC/am7Z54NTVOG4WAyPYz/fHIYnINxOMILMGgdzmP1v
	17JC117LsA5gz+IXquwoGe/hZZws=
X-Received: by 2002:ac8:5747:0:b0:517:5e3e:526f with SMTP id d75a77b69052e-51cbf27a872mr223608201cf.52.1784205120303;
        Thu, 16 Jul 2026 05:32:00 -0700 (PDT)
X-Received: by 2002:ac8:5747:0:b0:517:5e3e:526f with SMTP id d75a77b69052e-51cbf27a872mr223607781cf.52.1784205119845;
        Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:36 +0200
Subject: [PATCH v8 1/5] driver core: platform: amend the API contract for
 fwnode setters
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-1-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3252;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8hpM+TrGfI2rbJN2akFn0gkqMVl45ni0Bp0sA4vGJ68=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM828c87nWIkYkRuS35nkpsw+eafF3SQ/NOI5
 nZphlbwEjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPNgAKCRAFnS7L/zaE
 w1PYD/0ap/sMPuzCQnZ66mfD+nEmu5nhkrMsO+nv/OYqI/SxhOEAqeCdbYwNEDMFBtr3nmItPBo
 izcMwlPWbzo3M8RG25l8zyCyI4A1dX3gx87PlsQauyNvGK5+EhyDzOVmKl2l0miKpRPVg6d5ePQ
 n6x+1eThx4PH98F66txfVbot1AKaqdqN8gfpI8QF/tJd5nvxExDKUc+jhcvgsc3gIfVKtf2l+Ml
 e5qIbc1muPS4/+Ysn8rVZMhCKLMVyLQ4Q9CO+HrHCibK9guPfwNhUvfWzKEXOmOXSiTBH02PXOY
 rZyiFMCDEPKnTyGDsZ5AwcaALmSJ5FauJf4Sr5/0MAM96iaPTpDVMFotgm67DrIQw7QIaBXAYJK
 wjzJXlMa24vR2eIFaPD24p1vSJ+I7epc4XBuIt2rdTEWeA0EnjrWPtOt5146iRgmlWoko1t8AUl
 v0FRoBfcfzmSf6xyNXi6652asT0Rbz+zfkIoveYItuvk1OG1mHE4I0WNIh0c84v/pmFIEg3QO/N
 8CfVARbevx8CJnGoYN5SZkVPeHFRqrM6df/KRb3czazS02Fq2qMpHX277XkDU8BE6xBrOwLyiuH
 EwazYUjxAFzjcjYelFGMIggKKVRYZ4U62LX4kx3M5rno+x07Y2WwUUEbkVLd7XrO+TNeu5AU1nO
 vcwxjx4pFdq+45w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58cf41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UJBV_kE8d4TeT66hubMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hWbNV6CIus0tnHAbJxDTIAMVh2IK5U5r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX/JQY7OKEXGN6
 byr3IERd65XX/f4pXJeveckE0UDHpScMbV0NmOo7Jz+xFYTsSn95MGa6MjLzPBYOIxh4gC8QunM
 +X/Gw+GEzkhgbeWFZH7kQWLKZHBbiHI=
X-Proofpoint-ORIG-GUID: hWbNV6CIus0tnHAbJxDTIAMVh2IK5U5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX0EH2q3c3RaSM
 6Kt0bNlp9MhDD8nbEew3XraL/EBiotQMroNqdFJ3zlvGxc7peR5Gq+IPmTWRV0Ylk+swqjnBqNg
 U+Aqhno4KCWIb0zDgpn4iTrED4XVjEGyvQeGlz6J7w5rRz0VfXder86fBvkLCuug7TBMQYRAFi1
 4CIXKLWe5RzZcgYs4GRRXe+6juU2EmItKMI9Fj2MAjNoP3OotVzfhNTZcD1r7A1ihz7iN690RIN
 0hABstouq6484O48FRPgQ//JdnT+qBwm/XlzLxGJ0BtfGoInYhtzFzP4qLhpIyENO0Cs1vjvbMO
 /LVUTExQy0Cpzd62b09HXERTiiO0SoJzTatWiANHkzYbzDuO9VooTXfqU0zTLU7zQGZaAbQpK2b
 Q/8j64zrbKA2tiVeUzgUEunYAVE0KEQWybbJ6WwlwBwYTtWpn2ymtWBVuuGnGJGbv86U2s7aR51
 ThkRiEycysWzQT+te/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

Calling platform_device_set_fwnode() (and by extension:
platform_device_set_of_node()) of platform_device_set_of_node_from_dev()
for a dynamically allocated platform device whose primary firmware node
is already assigned and is a software node leads to a resource leak as we
never perform the corresponding call to software_node_notify_remove(). As
there are currently no users for this special case - just disallow it and
warn loudly if it ever happens.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index a71015f1d915340aa01ebfae67196d4d7ccecba8..fb57d487a6c2aba799b4ca5ccd089006cf2d8bf6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -707,7 +707,9 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
  *
  * Assign an OF node to this platform device. Internally keep track of the
  * reference count. Devices created with platform_device_alloc() must use this
- * function instead of assigning the node manually.
+ * function instead of assigning the node manually. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
@@ -723,11 +725,20 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
  *
  * Assign a firmware node to this platform device. Internally keep track of the
  * reference count. Devices created with platform_device_alloc() must use this
- * function instead of assigning the node manually.
+ * function instead of assigning the node manually. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
+	/*
+	 * If we call this function for a platform device whose primary
+	 * firmware node is a software node, we'll never end up calling the
+	 * symmetric software_node_notify_remove(). There are no users for this
+	 * right now in the tree so just disallow it.
+	 */
+	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
 	fwnode_handle_put(pdev->dev.fwnode);
 	device_set_node(&pdev->dev, fwnode_handle_get(fwnode));
 }
@@ -739,11 +750,15 @@ EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
  * @dev2: device whose OF node to reuse
  *
  * Reuses the OF node of another device in this platform device while
- * internally keeping track of reference counting.
+ * internally keeping track of reference counting. This function must not be
+ * called for a platform device that already has a software node as its primary
+ * firmware node assigned.
  */
 void platform_device_set_of_node_from_dev(struct platform_device *pdev,
 					  const struct device *dev2)
 {
+	/* See platform_device_set_fwnode(). */
+	WARN_ON(is_software_node(dev_fwnode(&pdev->dev)));
 	device_set_of_node_from_dev(&pdev->dev, dev2);
 	pdev->dev.fwnode = of_fwnode_handle(pdev->dev.of_node);
 }

-- 
2.47.3

