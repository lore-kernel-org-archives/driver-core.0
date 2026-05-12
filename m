Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BB4D990D
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587201; cv=none; b=CMqMPi7iaH+SNZP6MzTpSlkBaVsrkFGyLbYjzhOY0WZTQWz+seK3eeP1PxM/a4k/wNsVb3TnCmBBtR5Rw8QvjvLE/C7XKmSDEGFCECa8gbAYZuhr5GeBWdxjaO4svhu8VYt1AufqW3qF4Kb8HXXsctI+WT1ROIZt3Qwxh3u5waU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587201; c=relaxed/simple;
	bh=1hMeu1gCq3SSoVTeNvEzPugi/vqYRk+rwkD702lzSJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gF9JAg+6A+amK9+R/8gFgk2sBtUoJXkMmLSISlRVXsOh8j3X0MTz2wf71M+Z0rcaY/H/Fpi7gmhZPXIlWyQZ2bvx3jX+AMFYAeOcntqATnZog5VAoMnv11rFRkEk+qiLbFGGSRhf3ww3nN9ahGfTg94FP0CgfgCfXsCOOq3KKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE37I/Ho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmG9Z4lI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE37I/Ho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmG9Z4lI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBeUAR868141
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn6K0alRO0I+gqc5hvCv/EA/xYHUJ6n4NNziUoaD22s=; b=nE37I/HofdSHCsev
	jOF859YTErogyCaMLEGhAoXMKmFjUf6CR1xMWI9X6hdsRxbdQ0USkEK42xDkpjxh
	YKT+3Wne8BxEI/LOz/1YQu/4/yi+QChNBgIIWU0bxa80ig/P3yuYNow8h+sprdfj
	arEplIdAw+T96EQFOzpEE5jhPEN2MdhcVv1wPgj7swEDVs/dhmpMK/MtxZ913MhB
	XEtXBhTOZF6MTwIxvtKmtTmCo3JYEOVUvc1oTCGKSHRD0QNksXEJUTPc3YwpMgRC
	uRmy0lLSF2H27PqGBLl3yJq/vhlzXTwmiAKSw99CplmKL4GhYFEoezbrcoyMGaKE
	wWLfPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2ar5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso100799451cf.0
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587198; x=1779191998; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gn6K0alRO0I+gqc5hvCv/EA/xYHUJ6n4NNziUoaD22s=;
        b=GmG9Z4lIk9bQAz9Oxb23axPiE5klIRxqDEMQ819MmEHVtz+romzGAY9CqbWbtUnjDV
         avH2bx72bbhs1ueWgLbl8h0fbX5SadQd0jA2CRyQ8vCxl74/tmfwHoFQeD2fwQumufYX
         HFzlNcW3SOkZewO0uApYScEkNDDpXtx+SQ8ZJMO54jj1OeI9hS7XRFcWaDvZ61sFJ3eb
         yMWMUnrLMNUu9u/ob9jqIxDEo4rF0nJgte8T8z+4yNgzHZK3vqdGLfZfPOL+Bno56FRP
         1zVgumDKobgj9UxIek4qz7ArHG86/GymIRFInSic+9cYcuft3f7AtDlffKFKPV5YZt3L
         yItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587198; x=1779191998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gn6K0alRO0I+gqc5hvCv/EA/xYHUJ6n4NNziUoaD22s=;
        b=dG8PVyPVJ+ozdIEB7BHego7qgJhczCj++A1RsZyARrR2DQwcvOQKQqJAxqVXqOaixg
         8+vxyvAec/5Rho0wfbBPX+r2a1aKBYB2U6IZJ0/G66JmVa9jzAFIo39gjOB8oidWuQDR
         iIRrsueXGtfCTJ6yqMyUnf8JphETckFkMVcy8bkpM9n7tis260L5XKdOoTqEHYXXuN/X
         lO3+Y4FvvS1C+6iTzWXcwc5BWUHhRKcw3YFp/rZIQp4GbhtNnBig2T6azIdCd1B/OSqE
         xHHiUHTfntUDih63iQ960Q4u2TNpSU1BH6hKh1Xp2kjTqsEqSTp1TxLXoIe+0hhJTPbh
         QcRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yctg8w1r+KGlmO9FcwDlraHOhuGaH1hcXS2k1MqShKdcJoIl+8klvOzXeHRD4WgzDBUvmAF+pKz3XBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqhcOioq/RzLpdCJgRutcAZlXsamHN40UEy32ZaWdsprslVZC9
	fRsbG9mFXaBWtBSPYul4xyU+rKi3fR2KwtUdBMMLjORlpu+ewSzDSrGwEoLK4m1WmrE/0e0VocY
	LF9RNio6poZllihIdGYEao25XBhXo7HGY9/Skq7BE3qjy+D+7KtB1fYA2BDgn1XOvqQ==
X-Gm-Gg: Acq92OH7R8EtQ2JaxDBzMLBVoXoe8SLXyQn5uwZL08+Ryj0R0Aau72L0zPxmj4INMXz
	qvm7MghLrTKsUbZE7+CyQA6meg7PCFA56h/R8fjgHsPoGFYIMa5TGldvIuRU1EWY6NIP3zT3Gkh
	sETTGCtTAqCsywIj7VclK6QSgFFa95s4UFq6nZOWffKch/r5RQJR567UHYQGeb+QBOTEEc5wHm5
	fCgN5iNM/a9Fgk65dq+Y1+QnS8sfuDAfOgxfBSW83y85p43LqNpKt0TPOJcLcruGSYmTH/bAfTG
	zE62uIEL6zsto3UfBhe1ZYJk1H3JTK96twe5Pyqtx5emiPBWDVoDLy5uF6Y6pPkq1Ftx2eBhEJd
	tuHxglWNiSB60UBguYJqNSsYkwL376fq2YGWiUBDZJ1QLZbgbhI0=
X-Received: by 2002:ac8:5fc1:0:b0:50e:6135:f27d with SMTP id d75a77b69052e-514a0baf33dmr202421331cf.53.1778587198288;
        Tue, 12 May 2026 04:59:58 -0700 (PDT)
X-Received: by 2002:ac8:5fc1:0:b0:50e:6135:f27d with SMTP id d75a77b69052e-514a0baf33dmr202420971cf.53.1778587197795;
        Tue, 12 May 2026 04:59:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:59:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:25 +0200
Subject: [PATCH v5 3/7] driver core: platform: provide
 platform_device_add_software_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3870;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1hMeu1gCq3SSoVTeNvEzPugi/vqYRk+rwkD702lzSJ0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYv3GAv2eZuGcQuN3eqfuoVY689gc9gsWBu+
 YITubifYASJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWLwAKCRAFnS7L/zaE
 w6BGD/0RRzcGDUT1rhONtHIRmNB6WOnJ3706An57VS2M4of4c5Goyy6PGimVshH/GIISNiMllA5
 A+KR/P1hnT+piwAECznIeztfxsH9b6O2KgxpEv7Pe2DBZkwpFQLRJ1eOAypZ3P6SoN27BKK1xi2
 JiKCS8W993kMveLuhFRw0eZtKXXtlBdtWl5zKw2IcwQkdqtkZ0CHevEFq2+hKn1Nt7jRIW/u8bd
 GJkjJuE7a0+fGAXiN4nyYGqdjTn8cjIwO1hsA/S2Z/qbw9wjk0dVMzNz4w+m9aiXOlXtLsxHE4a
 6bhj6GH2Pw0ojuHYB6Qv6dHYkKpsvav/uRy6k8qNZkbv44fUhGT5ytZe9sWG/Vl8JEY8BEMUf7s
 Qq9S9pnAYLL0tvdETWPI0t8R1K093TbTAUYCy3ECON9EMH/uzZWKRLzfxpbSRiVVesCyJdti987
 4IHGaQ90OygyC7CvDSknVUTFbyHQM8IFyJOXMNwFRx/cKE44lebECUFc8Q32dDMV2VSJesUIaru
 ZUHnNIO9Kf7aLso1DRWYryI6+qHoLh0gJETcCkvSjpzo/++uxEzX4Xs300MzzDHsox+mBiiNSDs
 BBqtytrbSkbBWad/CBk1DHnwywe3Bsrv2nM58wVgEIWsW1ml7A+ZuTMkMVe5YYGeTLBBxCaHzNZ
 yrT5web3qDg+Zdw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5p6W_ud_x-5yvV4A-xtFvPRugMBSGIhE
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a03163e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9foaQtFGGNcyJ0tOL8QA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 5p6W_ud_x-5yvV4A-xtFvPRugMBSGIhE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfX/pKzFmvlNY6L
 3jnp32qGua/qz9ULXzL+IPRbwWGgCHDMwIO4HhxbXuQOZ1wiHbbCfky1okBGVwnP9Ua937FnCmN
 8eYzTBA/qdTDs1ENLW8JXXyc3sOVWP54/5D5RCNZgAs4iD7cXJ8RuXFmXM6R3xM/3QWsDBgwbzw
 YDAFzjHCtJMfipbO5hA3GRqR+0d801EreNDzrR9wf91tIz3LxVieV+U/eIh2NDkBxCd6USBy4qw
 ua3WxZHARltrOdQEii6aQuuUSWuX6k/rD8kWSaz6xZvyRrMg+kHP4NwfK4T7XnWtONUt+np78iH
 to74McSiUJx5EeAnc85FgygKEmmVR8fMduaWQT19a97U3gsryI9uV6/sq+kNwbux7rTSvxkjfB/
 rOjDfV8Qj4KwGdVNV4yOM63orHTlfu8mNi9oyaLQ5EZFX7U/GZD4+e/vVjep0TtNZW2wneUgZ09
 OrN5Elbu2hKAiGwB8mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124

The software node added to the platform device in
platform_device_register_full() is currently not removed on device
release. In order to fix this, we need to first convert all drivers that
use platform_device_alloc() and then assign a software node as the
primary firmware node to using device_add_software_node() for correct
reference counting.

To that end: provide platform_device_add_software_node() in line with
other existing helpers like platform_device_add_data().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 25 ++++++++++++++++++++++++-
 include/linux/platform_device.h |  3 +++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 18f33bec36726490255bc7ca3c4ab07d9b7606b0..f617e02b171f6e59a3c40504a71f8915a41e8514 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -613,6 +613,10 @@ static void platform_device_release(struct device *dev)
  *
  * Create a platform device object which can have other objects attached
  * to it, and which will have attached objects freed when it is released.
+ *
+ * Note: devices allocated with this function must not have the following
+ * members assigned manually: swnode, resources and dev->platform_data.
+ * Please use the provided helper interfaces.
  */
 struct platform_device *platform_device_alloc(const char *name, int id)
 {
@@ -687,6 +691,25 @@ int platform_device_add_data(struct platform_device *pdev, const void *data,
 }
 EXPORT_SYMBOL_GPL(platform_device_add_data);
 
+/**
+ * platform_device_add_software_node - add a software node to a platform device
+ * @pdev: platform device allocated with platform_device_alloc()
+ * @swnode: software node to assign to this device, does not need to be registered
+ *
+ * If this device is already associated with a primary firmware node, add the
+ * software node as the secondary firmware node. Otherwise, make it the primary
+ * firmware node. Register the software node if needed.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int platform_device_add_software_node(struct platform_device *pdev,
+				      const struct software_node *swnode)
+{
+	return device_add_software_node(&pdev->dev, swnode);
+}
+EXPORT_SYMBOL_GPL(platform_device_add_software_node);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
@@ -881,7 +904,7 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		goto err;
 
 	if (pdevinfo->swnode) {
-		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
+		ret = platform_device_add_software_node(pdev, pdevinfo->swnode);
 		if (ret)
 			goto err;
 	} else if (pdevinfo->properties) {
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 975400a472e30e2f98cc8f13bc36a63129bd4fcf..bd421506e98fc293c97121693e4bd18b703e41fa 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -19,6 +19,7 @@ struct irq_affinity;
 struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
+struct software_node;
 
 struct platform_device {
 	const char	*name;
@@ -262,6 +263,8 @@ extern int platform_device_add_resources(struct platform_device *pdev,
 					 unsigned int num);
 extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
+int platform_device_add_software_node(struct platform_device *pdev,
+				      const struct software_node *swnode);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3

