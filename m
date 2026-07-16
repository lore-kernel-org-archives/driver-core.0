Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E141DEF5
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205129; cv=none; b=U7mg54VvVNJbCKeq91xot6vr4pp1er23WNfUHkmEuTlgNh//CxXoQDDgBgGeYat+QPPLqtNVMWQIrhzIJ4mouKEQ1PzByjx014sdQPrdopqpLkSlZS4hu/OAX79ejdYD32D3tHrdbIixJ0qb4ZW1MQoOPq3sycYXgY9acHjdehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205129; c=relaxed/simple;
	bh=6y0x3dVDg6MbsMReImz9V4/sAZmwhZnLqrvpq5yaKmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q784WliMaoi/+P9SFIx2hb6EgE2z4FZe3uSoqk/tqion0XoG4DT/yy7I44NDgCCfaZxufuR5VqfG2rfOiuti1JNoW7YJYg5BQ0NsNRQLOfl18A5PAvuKdcFBvkfxc0We6QMKOyrEEn+haa8nNvZLZCjSl1yEO2kJD7bwqkFp6tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRgQrzqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idcDq2Qm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRgQrzqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idcDq2Qm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBioUe2355507
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=; b=CRgQrzqkesW4oIVV
	7F5rRIcYbXHguAE155t4EsEGyed4PIJd7wvNTKx3WyzV42NKUI+fjrqNFoz2hi8s
	DeoZ0QWzERUbfaSebfpdqIVUcP64kxGyhlM2qYur2YTaPPC+zuBh/FFWi5pdp5uw
	f/S8jHKypi+wYU8alsaEQabyyZOK68kOd6csdaJYkY6PAT8Ll0yovJDve+kojGHZ
	GBRNGxfNto/c6Wy9Zz8SzbCi45LG4qcf/vUKUlx4RJSoBcWeBgrZSVBHx2Fh2Eaq
	b/CsYkB1nNhg9LPoe+jXg+OM7uPL/av1dl1g3dmn7zBMX8VpbjiayLBD5RbDS51i
	5uhETA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064bqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so63473891cf.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205126; x=1784809926; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=;
        b=idcDq2QmDStv8YXP3oSbZ95JROmHVDHs5yte1u72UIhbudbOF84X6i25AVot7L8WYq
         tMJQBF5mZ8yWAA8lJg+G0EJo910fjWq4KiObqZeEv8VvHflfQGrLbniD8mvF6wkN0QP9
         luOhwRJHHxFV4OcRB8WPd/dK8QQNp6GaLlUYSXr4dv1ccQAGZ32FzSnaspeGI/hI8dwn
         9Z6atOY0d55kLS3dHZHZfs/fUcvQrFXF5Y5QR/H3AvVCKVMEGH22BtU+Bio9GIlFRxtz
         v+XGTfFBzPRSytFFgjzE0YfIJ9utNvwlLzHBuOkwSnri29fuf7JFUcoRENRHz5liFkww
         iJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205126; x=1784809926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpH00IOQaI/bqw5+PSR/7ymija6RdUIbqHVAIBnnA5M=;
        b=G6fiT9a/VJNSeNeB2NBBzhuYRzvxawziFxjuXKsgchLZ14MyHa2JjK1bv1JmbyC1m8
         yaviJK1aYaKgTGpp0mgsBQjrVwT4IGXlFZEhN0XdJQLPQJKf2fVI6VuuVkSfm7BC/GrP
         z4n4JIZqsc1HQKIAXJsEnTHRepP9PE38e42i7LX7IMHnRtho4MDbebtx1PYW4In4QKss
         yefUU2xNahNMEo4ZtOS01KehTahppDGdHdgAGlR2BCCoNIgZ7gF4JLRBPki9d8UzYs1i
         wgacndkxwim4XlczRBQr235BtknNMyGuSP41RbXLcvYXZv8wGGH46yGFP3ZbObcOWMRf
         Y3Cw==
X-Forwarded-Encrypted: i=1; AHgh+RrH9p13hIwWL9nZBSAkLHnoMkJo6RnlBaemu1w6N//VI4gP4P7rrsy9qIw+2W2c97scOhx4EP/Qgb1sHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6tDOLVs6hsoweq4Xak7FLGGQdn1kg3DRaEhYMzWFrbfgzzn33
	zOqsPRR/c3U407OoXy1Mdraw0ctQ0F5wy5bG/0BGGbtjV+w9PJUQJzEi5+TGHsKUfrmAmI8DPqJ
	aCOB+hf7C7miunAq1o4LICP+0cEgF545Pk5wEEXNNfVl3q8vV5QXnNQ53WkIL0WN95Mh5th2Scw
	==
X-Gm-Gg: AfdE7cnxwHDxDGe4USgAIw+GnAwOxar8D409zuBiwTklsgSYm2i5I3ELm1u9jkcsXPP
	1vCRnlriZhgOlm0BfHU1hoLv4hjxAiw7UBlprEl1yWaG9lJdt8oLxIOh3de9/Ep0Mymxb1FLeaW
	TGjVZFmJQQLKAVRjz9SD7mQyrHFwVnhLp7FWie8jbAXbgatohHUh67tGYx0qEKacx8DdZFcvP8t
	EJt+TgZ3uwX/2F5NIUGUIEqNmJSt+iE08EQWVYsNSd/FsASWnkKmX61QrTvyP/6opiDQczHv0GT
	axEvZ8UUHlcb+E5nXksCy7wdqv4LIElrhFd9MWye8t1kxmZsAXMx31PZLCt9Buk2zjsH2wn7+Yh
	+iayafDeZhMSQGmSi0xYYpBl/Bds=
X-Received: by 2002:a05:622a:3c6:b0:51c:7b12:1211 with SMTP id d75a77b69052e-51cbf34e7d3mr215997881cf.79.1784205126310;
        Thu, 16 Jul 2026 05:32:06 -0700 (PDT)
X-Received: by 2002:a05:622a:3c6:b0:51c:7b12:1211 with SMTP id d75a77b69052e-51cbf34e7d3mr215997071cf.79.1784205125413;
        Thu, 16 Jul 2026 05:32:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:39 +0200
Subject: [PATCH v8 4/5] driver core: platform: unify release path
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-4-5c2b8cc38c28@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6y0x3dVDg6MbsMReImz9V4/sAZmwhZnLqrvpq5yaKmA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM855KGpNaO9QL7bwoMnsMLTBpi+7XZHEziTV
 So+EpZSkbWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPOQAKCRAFnS7L/zaE
 w2swD/4+XMquiqrTLlEE5V+DkOFKbQJCB6v3BWln231RiWMUELuGlSJRmxQilk6NjMIEn5Tfi+T
 6M5dx4/ydhrlr7funY+g6Mezl9vYxe5vGVcd9Yk7xCQUufFcK/sWmNhX316m51czITDSwp/Paiw
 WowWE0ebhKwNwQyI5FvAXUn7k5atTt7TBqqhQnXZzlXW5AVW8tGEAsTvaHxaKRKeWCwW4r2Z4Qa
 HZ6eOlJJJkw9DCkrhZKH1vGK6thNPPJp+xKVOCmWL8kD6UEP1zlZrxr4qQXJMkZQ+fUvxDezaTG
 4DyHdpUpOnntHks9d7tM6Tdm3dDc5J6nh4jzJ7Ww5CeKORy9gykBuR6vY7kegnMyqXdMyLic18T
 59NoLcv+7VjkaaQ4kQTSojULBGu5XiGKwpf2tIbWTWfUd4BlSmR1lErbq1FcsbgmiCcC31mSWN0
 wU6/shhVs6OHOr33p9XcPSu5e1C19taokpKDjoxftJcewYCA/7t9BEeF0eOwvEXgGWwSUMDIs07
 YgMJyPe7z5uP5Ckdak9ydbrCvn3A6rwhDThcLp8MA3mezzW3IuH7boUILU+GylTrOZTVpgKdSDG
 g3RL2zMQyWvV2xQJ++dNNd6I4mhYzWYqfgLYJ5fV/Q0aBcT2TJ30ytxbx3rWMzrj0N95kQbcthb
 S5QmZDNmeMuwchA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXwKm3iO9oGZV+
 UPtJwHH9klWcwUIZrmDbC/PwgkIFikera4CZ9gecntRArOQ3yx4J1eqAI29jIguP3KDAwk5w6Z6
 wkabd4nCLWE11Xr6tSfiu2TpiAcj8uE=
X-Proofpoint-GUID: tLEb_izgKP4h7W4vaPDl6CaVuwB62n4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX4B2+onS7/zgj
 NcEAek8pmQ2+AVdGIJr/96sCV1PCz/fYUplFKVFnknA594txV2qE8jYhymeMa2mRbxIPwytxgK6
 zl/DuoB7jHg7/+/5afHJUTsXl6lFz48+a9L+CJFETyscomFdSFAF5LPXEQGEjEultghNZRKz7xp
 QaSFnehpTuqEuE2opjRDoYq+xz9rN/Vnaa+RdONTrfONz7VBSDQZeOFgDq3gANQqAiNeZGowsOR
 jrXQxarayBogAlhIoNkircTuRXD6rzwiI9Ny4pJN7c+GI/53+kOeCvA8MESP9vY0pBtHspCeGJw
 BFbDQ/G3tSk5XV6A1nZ/5AkX5VmjxspEeV6H0Qa/FBl51hm0A4Xg7Wn7vQNxHdHgq+F4FS94IxT
 hIJwytlLACb0rSH15DQFuPv+jgxm6TEbBb+WH3R3k2Rzfq0lg1+dtYPFwgqiurFnJwspUW6ueum
 tXyulCXimANjiKrkRAw==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58cf47 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=djyy7gggcHwf4V7r8BUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: tLEb_izgKP4h7W4vaPDl6CaVuwB62n4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

With no drivers that manually assign software nodes to platform devices
created with platform_device_alloc(), we can now unify the release path
and remove platform_device_release_full().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index fb57d487a6c2aba799b4ca5ccd089006cf2d8bf6..66f9ec73d47e90cecac9217ff6e0f051fea5b057 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,19 +599,19 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	fwnode_handle_put(pa->pdev.dev.fwnode);
+	device_remove_software_node(dev);
+	/*
+	 * If the primary firmware node is a software node, its reference count
+	 * was already decreased by the call to device_remove_software_node().
+	 */
+	if (!is_software_node(dev_fwnode(dev)))
+		fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
 	kfree(pa);
 }
 
-static void platform_device_release_full(struct device *dev)
-{
-	device_remove_software_node(dev);
-	platform_device_release(dev);
-}
-
 /**
  * platform_device_alloc - create a platform device
  * @name: base name of the device we're adding
@@ -960,8 +960,6 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
 		if (ret)
 			goto err;
-
-		pdev->dev.release = platform_device_release_full;
 	} else if (pdevinfo->properties) {
 		ret = device_create_managed_software_node(&pdev->dev,
 							  pdevinfo->properties, NULL);

-- 
2.47.3

