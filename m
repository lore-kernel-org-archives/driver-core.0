Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F900419FC2
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205123; cv=none; b=LUK0Gzoig/NCKf8F47sWGPfOLNU+8nCmFHRaHq8SNXkkeDYdAg+V7KpUd+8BrlVmVXcBw7ScrxGFUiliUNfKGDTXIlZZriKNpZ3dwFREGiFZmfNy3o4bX6o8n5T+XR1truWB3Sel/9Wxh8M3OiU6xyHY1bTm4eIptSrglsG7IjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205123; c=relaxed/simple;
	bh=l+GVxg7gIvyDgqoTTqrYYsU3vUaHictcdK7A6qwU6To=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q3qLUG+UtY7aJT8NK3BJqnWqeaKKc7zzUFrO3hStF9k75eEfUi0LZ0ZxbsPWYMNybcDBTMwcvUg3nSnWA29nzE2v/iil6aEDUcflvu6cj4zC4ZY63e9ttRWHCYNYDz3Xl4xO4bSD2Dr8GS/+TM1la74GCGn2d1sSwUPRKFjPsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXYUz3Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mc1udXWK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXYUz3Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mc1udXWK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBk2eD2744233
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s1CMIetpvxg7sHg7+DwO7k
	DIKRMvUV1yPmdATGl81Ro=; b=XXYUz3HypZzvBTZ8YanpWEC87C4h5dZs6tEGZX
	De71CpuMPS5un/U/tF1P/LBUy0YHsnhxxRVWC41L4xg3Kjvm7wRGmTKw807r+54z
	AL0DKLkfvKJvDhKYTCAwl91F+/r117QWwaKQRlseZPltJF+yfRb/khveypr4xIqB
	NkduXGrVVv1RTimKE9ay8uUVbAxoPSvrWUb2pbdAlxJT+l3hpcQ4j5hcJi8kA4qB
	+5FHNQwUAmSIKO1BeqNOxtB5a+2Xozw5l35kl002SWPfi0Fj5qMe68eqtkJ7Cl/N
	+yzOdDCBNRp9g3fYgmgxWaD7+AUGZTOi4aSEVai16CTvWOmA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1kts9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:31:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef18406878so116528236d6.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205118; x=1784809918; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1CMIetpvxg7sHg7+DwO7kDIKRMvUV1yPmdATGl81Ro=;
        b=Mc1udXWKaPiP7F2bgUqMtp2YEU69CuCszYt0qgkfmQcVxPanReaqrZSbbwtuN8kRen
         6MoeClLl+QwHXGFX/2nMkvAO5SH5zEzAHYoXf4j+hBIh9p69K3hgIyG73gNMz3WO3h9R
         b34Vuz/xFU/4zFohlOVND59rdD3y9rkiyyOWIMCmNJsz9huj3hk1xeV9GWwjYlSkJvyF
         +1Ri6AJoMcZZBrNuQkG5d7f9HGuQQ0fWWejSoZOeMcdQBgUTNvfFKZw4/7yPJX52stC7
         dixSkeNFRJwFCnejFxlc94Wtb9qjdBx+EPfakkdMYjLyRLLg+pX54s3TcN3VAv2qOX0v
         +ggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205118; x=1784809918;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1CMIetpvxg7sHg7+DwO7kDIKRMvUV1yPmdATGl81Ro=;
        b=Bxhjc3pJgDrpDvNJXvzeVsegzcQOWr3RJ+HRuPkzqANuqkdVHX54d9TGl+VPD+PpA6
         CVimSt3fX5QY0AF3B/pezsoRdsB931m1o8td+tCJr8a3AJSuzxGz/4fnPpo9B/7PT3EF
         Ia6qr91RAfiSMsFTPBGDZQSqRMIAUGViPqEvuYn1pNfRe5GyzqxHuBaMnusZUDvzAGj5
         b10yUmIoscEhOGI5pnjQgNVVBx7NVgtu+fptPit8WNOme8QToaJt6RZdh6/KdwvanExo
         OoeLh1WPYdUQXCCW7rRALuayptIbcjD60HfIcbIe/rSPKHzpnDuKduqBYJd2ohE0KBQi
         RXHw==
X-Forwarded-Encrypted: i=1; AHgh+Rok6DkWjn7IHl0DpvPSIHOcAtD4LFeFCsILwjmBfcxShUW3XnXHFPt8uZo+iURA5MJCT5Ze02PwUm5Hhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzESXRfclORcRFig9gpKOKKy+3/5xRBnkJKJxP2ezuXqkUpzVvy
	3ipFDhzI3RxPxzeMZdTHaxv6dFuSo1f18lAayd/Hq/epxl8hwqen2PR3Z1TL2NbjBQq2p35YP2y
	NXm/H1s1IXWar1I3b9WuHUn7MtLXIMH69LnxqAozzWLt2FPFDmxRmx3NaIpl6hIc1iQ==
X-Gm-Gg: AfdE7cnReWDnB6dkf3pyQ2fmGvwQ5dJObdd9aupNHNSUiumkZseOrqXeWxuUMLFXsnp
	YyILaQF84ZeP4yopNiAigHhR55UKGDuRtV/EszBdVeapPC3WnXHM8QjKwq44q/BIDqFiHvbGIId
	mAw3+YD4HeU23wp5L1LsxPivxxMnPMCqdSOF4wAEPcaXKk/5ZdZdtzQ5V9pXh5FnP1zPUeQxRIg
	xi54SCYdwtlAiDlRIqetMNA2d0n5Pc+5TvICSZqq0+h2bA9voApirscCWCfJv2+S7iv28snU3uD
	aQ6+1iu6wZEZjgTKsQa6ry+zkUcyozVYBSBG4aJ2V87ebmlXn5L3T2fHHMZv2GtA5c7LRBiQJAI
	J4pyJiKhfwBlqBE418I429YRSZTE=
X-Received: by 2002:a05:622a:391:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51e42481546mr107232911cf.42.1784205118202;
        Thu, 16 Jul 2026 05:31:58 -0700 (PDT)
X-Received: by 2002:a05:622a:391:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51e42481546mr107232321cf.42.1784205117470;
        Thu, 16 Jul 2026 05:31:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:31:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 0/5] driver core: unify the release path for dynamically
 allocated platform devices
Date: Thu, 16 Jul 2026 14:31:35 +0200
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjPWGoC/43SwW6DMAwG4FepOC9VYicEetp7TDtA7LRoA1rS0
 k1V332haCpSC9slknP4/MfxJQncVRySzeqSdNxXoWqbWGQvq8TtimbLoqJYJyAhlVpJEc5NSyw
 6rtueRdsI4l6cmo63QkPpnS4ByyJLIrDv2FdfN/ztPda7Khzb7vvWq1fD7b/YXgkpHFlCaTxSC
 a9tCOvDqfh0bV2v45EMeg8TEXBRhChKNqDQEQPTjIhTMVsUMYoGsSRnVQnAM6KeiLj8aj1kVMZ
 qKmTBhDOiuYtGwaJoBlGiYe9TzNTcHNOpuDzHNIo+dybLMScPdka0d9H+IdooppSWTutMgy2ei
 NdxtTo+nOK6Hsf9SmoOobit62Y1dpKp2A+y/23nx29S3kvIGNHa/JGP+CN1D+3PQ9rPqvkYf4i
 0B2KOSSl/lvX6AyFErmBiAwAA
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6013;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l+GVxg7gIvyDgqoTTqrYYsU3vUaHictcdK7A6qwU6To=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM8xfbCcGlSij+W3IlrV5rWQafhRbpnujKIzJ
 VeZ6DLcidCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPMQAKCRAFnS7L/zaE
 w2/yD/wMHKEOz8hsz5FFtrYv0HvjuwIwK9z3HNr0C8UKT6AmOsLVTOMFbe7bxaF8O4G3l+ABDN+
 ayxM5kYybIr/sSQYApVJ85K5e7xDYGRNA6fivmv2+2V2NE8yNUHfGfJm8RoVB2Udo/4eN/CP366
 QsAQPvXJ76m7iKbcg+vRZ7WSYfglgnm2D8zJtUfBx88NTeaY6TAGhy/NwvQwicN3vTCleNlY3pO
 I2tBg8rTX5AgfPc4qf/dSotMqW2uC9IjmO5/YQg8wEPToR/W92hpnlX7+VYe/rikLhz08baG7Ai
 raYYgBcqog8TXce9vdcdkQt0JEEVOefJty07dkpKZVApv+yVCDQSo5n4cqbO1R68aMpefIk0Vhf
 cF+v0ELnGNntMIMG4W63XWc1I90+NmfoMSkN8AedLOh7AMUSkHnVxMR6kUgpwmEUqd1a51nMQ2x
 RyLOlR27Omy88KtWA3l7SjpTXJioi/NCjXRez/ivsawosJe3o7y/v30Y2QuVopjuFo7/PJ5Zx/m
 tVP1Gvmh7ANnKDx6uckSKO8wdUoahbtrb92OvwNed+V5oZM4VUmJ+aC2ckXPLJHnPguY0e/o94f
 d6SC3//0KWxWKVvX6R0OHI0Mtq8KnGmi7SIw0Y2VbTXBKNVpVsFCWTUHStstuTCJuSxi4YQqAI/
 XsyhjPlkV23FReQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6Zt37r9HWkWs
 1SsJwtEmwo/a/W+TOT+ISqAUhwFAJhjEDDt9hEFYT6DdTTIdFVyCNXaEd9vqlQoM1LukGLPV/cm
 3xvrJxtoZVVpMYN9mEC6DM1kgIQqr3QTuL1zzu0h5GElhbJdfNaLPEij3FN3FaJV7sHZCq4O3WF
 pYFLkKMora8IjJ7bDAcbl7ui2yGdFo+rcVG3QHdr38hSjFxDB7GDTMjjq8Vk3vNw4j/CMBs8y8z
 miFMQeHXoroab+kM1SBieO8mOduhT5DMtF+q+XV0EklbHaaPdRE6RCMgccjxWNh/o+CMDAYtzV5
 xi5T8hDQT4scYFlLeU5g406h7Mz2RSdlbSbvpzrvGCzkTabmGwnu9ltGJRap7Lby7/A7JXeWEiT
 n5oiIVZ9HQBju2sXkV/B4Dmzni1VFUOwgQUvIm8DAkisoGQy6gfBjE6bw8FfgUTvKEsdO1pUdnI
 L14tLhWM7TxjseVUeIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX9k7y5nWb3dza
 FZxoidTY33uDTg/Ek5UqzT6DioXKa2+mF1LnGlMcXSClAlFW01D1fCW8QVZ+/gL+iPTtMMihHtr
 qK1x4SZnUAbQRGah+AeKrQxmZGLEZoA=
X-Proofpoint-GUID: DG0TdPip_9fhtKfSxLlVJ1BF2Pw2X0Hp
X-Proofpoint-ORIG-GUID: DG0TdPip_9fhtKfSxLlVJ1BF2Pw2X0Hp
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a58cf3f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=fY9noNvUkyJ7C7eDhOYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

This is a follow-up to the fix in platform device code that introduced
platform_device_release_full(). With the two prerequisite patch series
applied and with the two last remaining offenders converted, we can
finally unify the release path for platform devices using
platform_device_register_full() as well as those using the split
approach of platform_device_alloc() + platform_device_add().

With an ack from DRM and platform maintainers, this can go through the
driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Move the special reference handling of primary software nodes to
  platform_device_release()
- Make the API contract for platform device fwnode setters stricter and
  don't allow to call them for devices whose primary firmware node is a
  software node
- Link to v7: https://patch.msgid.link/20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com

Changes in v7:
- Drop patch 1/6 as it's already upstream
- Drop patch 5/6 as its been replaced by another changeset sent upstream
- Lock device when calling device_is_bound() in kunit tests
- Fix invalid reference put of the firmware node in surface_gpe
- Rebase on top of recent driver core changes
- Link to v6: https://patch.msgid.link/20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com

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
Bartosz Golaszewski (5):
      driver core: platform: amend the API contract for fwnode setters
      platform/surface: gpe: use platform_device_register_full()
      drm/xe/i2c: use device_create_managed_software_node()
      driver core: platform: unify release path
      driver core: platform: tests: add test cases for correct swnode removal

 drivers/base/platform.c                  |  37 ++++---
 drivers/base/test/platform-device-test.c | 180 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.c              |  22 ++--
 drivers/gpu/drm/xe/xe_i2c.h              |   1 -
 drivers/platform/surface/surface_gpe.c   |  39 ++-----
 5 files changed, 224 insertions(+), 55 deletions(-)
---
base-commit: 0de8455a9de5713f4022b20d655f18edcd3cf468
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
prerequisite-message-id: 20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com
prerequisite-patch-id: 76dea1205a0905915a03c0d7c9e94399c92501e5
prerequisite-patch-id: f6c074c48e5eb2f5e92c57fa1320b6b0fab3ce1d
prerequisite-patch-id: 07a0c422cc3233e2fe87cb9bbd6baab608d0de82
prerequisite-patch-id: 5e980cccbfdc82adef1573f8a8a9639689836432
prerequisite-patch-id: bb193e0baf41714061b83b3925cc4e28036f2b9c
prerequisite-patch-id: 5ff0ac2c7c4cc548692ed5f567db30e27e920786
prerequisite-patch-id: deb425beb85441169aad53c1282f35df513b8015
prerequisite-patch-id: b0e9e719c8daf30d97c110478a5c3c7af106472c
prerequisite-patch-id: 9f118a7cdb92893ed4e913c7c98bbdb766ff18c4
prerequisite-patch-id: 1b2391d8295e80086182f55e5189b9aa588687f8
prerequisite-patch-id: 986a0f4f9a682a255f6eef0fe2128a86c595ece5
prerequisite-patch-id: aae63ceb82cbe6f65810751e596e542df0ff513b
prerequisite-patch-id: 155601719d4f5c433fd7dce63842007f255bec81
prerequisite-patch-id: f9bebca5cd8f5ebf9b52e9c688a3c83ddc7efb7f
prerequisite-patch-id: aff2299bcf258e4e6dd1f01c591141385f31fdff
prerequisite-patch-id: 51cfbca3ab011688be133a259d598007289237c4
prerequisite-patch-id: 0e9bddaa83a1f5a99745c2f50f7c3213d7b17fbd
prerequisite-patch-id: 7ca12b7bbf0168eadaece00587dad68e1ff3cbec
prerequisite-patch-id: 8d483c4b391ed1b95897c951555e7ab6c5807e2a
prerequisite-patch-id: 495173352a585bdfd0c58721c8be0558d06a5335
prerequisite-message-id: 20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com
prerequisite-patch-id: d7f936bb1eb8e9fdc0a6a35770e376d36a0b595e
prerequisite-patch-id: 77b6a4eb67cd6bcb6fbc974a4d0368be6a2810ef
prerequisite-patch-id: 744bdc8ea502dab2db13b1cbe963c1db49c951f0
prerequisite-patch-id: 185deea7fe874a7d4a70c93e0b60cc3bbc75ec25
prerequisite-patch-id: d9e41fb8f4070e53ac293db82ccbad83c8d2a40b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

