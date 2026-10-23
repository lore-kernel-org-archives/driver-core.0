Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750462;
	b=hmy4zOXc8I7SqOclA3BJs+DOJcgyPmmBXu+ESvQYllf3sMD9si7WUDRgOFSmO5CYxrcQ
	 PzR0ApRhlo36l52Mpoe94xkADKFZCcrMEb3hJF+HQNvwlXON4kIlgmWkQrkb/KCr2+w56
	 DFqdOxGPcEZkDFnMNFrW6nY02DQXHTMdrfqaZVl8ryvZbj6PpC+IV46h2hmPfqbVNQ0qY
	 7mOzNiOILS2QM+aS6vzPtk+8c7XW/buV+3Q5fYCAXPoNEPGoK9I5yhe9Q3YWnROl5eIp4
	 xEmoSO4RThUTi2xLA2ytz4Lch4UJyD546nm0vFo3hX7AymZp9gsxuTeqOTkg99W215A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=;
	b=wN+Xd/zN7C/l4/7T8+OqOJufZq+69HZ/ySn0DuZN0fla1PgiZKcc9cLleTpVUN7L4UXH
	 jtigEfmLYQelR8alHasMtbVkLFPLyksN89r9XReO6zOopfL8YDAjN/hXUR/Dfd87pKh/k
	 BH7Coh4p32wQy//4IXmYlhX9pXqvYHxt5b9j9rEnzOBYvQbP6Ux5o6VjH8JiioErHMV/M
	 bjZeY/wncDyTa4OUjt4A5cKS9cfD3Yl5BoarCwSmCnBBVo/nDxwnYXbF31fwO1RnXiYrV
	 VFDwJHf21TMWiv4tfFVZ/0KPqvwand5E5a7eiuldaQHp2byAVLxAcREgZ5kG+HfZqgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Lgyycgo/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LmRAS8sE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78FF606A322
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78FF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lgyycgo/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LmRAS8sE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZNW1948486
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=; b=Lgyycgo/B0FC7eH6
	xRgd/soN/MISMo6rhLKsyFgoHPx0Qdw7MmzO0WVhH7ZKOetRsjqoh0B2OQlT6np5
	8xesbdxgElxQRwTCaFfyGBCoy2VIqnGs7pdEh7cr1HfvY5IFlylbAMFMOdZ5dpJc
	kb/Vr48Owld/N1u85HGcJSO4Xq20B9pehzsWjQ37Ggg5xn8bwmtf4O4DWEkqlpOp
	YQe+a9Eo4Pi6us6nxDW7LQRvryRf+X9PQjcTwOx2iWdIYe0l4dK9sQGS7zXLXodD
	PzWvb8BiB8bhh3d6cEkVJ9We8ZvNzAuDgkg5OH0znpsbJL4th4zdTUnS2IkOPZ6k
	qxPAow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtu5u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so133287785a.1
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750455; x=1793355255; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=;
        b=LmRAS8sE9vI1vvAnCynDaDyVHsFY/9E6E+eFSqGTk58qV9S0MsCDN0jAgq/M0iB/2D
         1a6ViGWy1owYc0STtcKyv6lqzEV9d29CZAGr4cuP0AfCxiIJfFIRi+zfg1V9NxJBbL25
         CUBUUfmz3HkA0ZStpW1m8JW/hoNc71TE71onQEenQXSLz5WmeWp/kkD6PbFMkXQg4e4d
         YMN1mVxWIxLFi/qwnF+FJS4sKi7fd7fxDwU736gtSr8HwOYk3zg/iqkJ01AWwh8ae27L
         WwoOVeijlVFKjtt6xEoUPPGaoWsRxtYfLDf2xOj42jL5ztyTnYel/+8kch7lxNbVThHQ
         EMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750455; x=1793355255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/lDJvjhBQBuyuaReRi3SarttfTu3Q6e0rLJWgeouyE=;
        b=JDumCywqcFHmcolzBHzF6UuQ5pR2dIF4ZZTNO0Pq/K7vm2/okAxTrJNrdmT0heLm8N
         nZm4IJi+pTFzVEv2+ipfpax4ri57BtJG/SvPi9YnpyCSt55nWBKgep//dEHULCdc7XIB
         LVb+xyLqFgN9GXwyQ/hyCx6cUoRd5qr+ulItGzgr/2/7mLdLZgyppT4kVeVyTwG0A2//
         IyBBzShfNV0bsvW2NhD52XC15HVqGiD5xT8v9CLnjoNhJIFjeD8CXapo9FqolodA9Yfp
         YmQGTCQtkDH0jSRP+Hcr63PJmymvIVbZoFapLp95Dk+dkC41pRkyhPWq8JBthjBe5D6P
         oVhQ==
X-Gm-Message-State: AFq9FYLV1J069eYBtdW5VVUIqBNn3jTjGpcZsEHr+Sds9Q/9zIMwDI4I
	J+ExwlJoLOyKCPLIFsDHmNt+cPV1AWTeCKBGylo5lVzBoFI9edAtpUMpV9RNU7WlyBhhhrzLgLv
	nWaCDX0ZHmzmrpYwifoOV5p588VoWajE5hKq0OtVSPdHzT+cAAx5NwfbbU2OuwyHVww==
X-Gm-Gg: AYBFou3kKUgac21D5wiN7adZrKelzIZ55EhvNOF9IqVpoPLrhbBHoTEN8NTlqMRqbsy
	NS6MuID7ZTk7IqT0c1WABi6AHQy0KHoe5T1gIUjD7FhbOF84t7pjcDMA17ijfFXQYy/pXq0N31f
	uhsTmqGzq0UQ6x7kmIG0kmhe9bc4iisPHnEFBUCfueIWFrWPYYkz6cWL3+lzDHse+N+Lf8Ln8Xa
	goCnBMkHgd2ZHS+QasqeXsvZgck4D0dRtof60NhLGoGdBdwu2dqitVlst+L+2qfGfMy+r10n5IB
	qvZzW1W9ULQ8hgxUNR/n07JBX/u8o0u+TeVoqbBvWT+Zbx/Zpx7zX6aA5px7RVW+SMg9N3rYMTK
	Oa99M9MHGI3wHGgUFAMaIOypGfNp7
X-Received: by 2002:a05:620a:284a:b0:939:6de6:9518 with SMTP id af79cd13be357-93f6f972914mr327954585a.47.1792750455168;
        Fri, 23 Oct 2026 03:14:15 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:939:6de6:9518 with SMTP id af79cd13be357-93f6f972914mr327952585a.47.1792750454685;
        Fri, 23 Oct 2026 03:14:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:14:03 +0200
Subject: [PATCH v2 1/3] driver core: provide a test-and-clear device flag
 accessor
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-swnode-dev-notify-balance-v2-1-948d920a79f6@oss.qualcomm.com>
References: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
In-Reply-To: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z4Jc1b12fs1aifGCYeI0BXhsdZ7Li/X0waRYIl2iCrc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNyS0nR6r/NdXwiQFTkQHidfD6CLufh/QrMX
 B2eqAWLpr6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcgAKCRAFnS7L/zaE
 w2HSD/9Ovh2uv/UTJT8dwylA1DdD/J+L+gyMRIpMw5NbEgVO1ppcv47lZ85VJPS11yB21GSYUru
 MAC33BJT7VZSOWBkkgbQi55NNrev9csl5CXDD3CBowBx9d59FfGhHGmwOxoDVEnxZ43NMjW7mz+
 6irUMK7glppjTS+AJiIiAyhDGsVAKGMHAL1lWldTrO4qd/IyHZMHnnNIKQcMRahlf+ra7EyBVBh
 /77PWAmTEyzql+re9iW6iRu9aVKAgSQFT1n47B9bXS3dMxDn5iN3C8KKw05Gf+K0/z4OVG2KX5v
 d3RHLAVYnGoXnteqaUy3AXmevJ8HPpO97Qp/xRAvRJs6hP4J3krTWRaK0y7JJVhTKlDf4gWhiry
 EtvJn9Lvv5EyFb6Vqg/i7wooIL9hs6q05mMh8hy7WbCa+H0hQLRnyZ4bAONQnObQKVryL0SB0Id
 mmq0vFUDbfHgjtpLRMbTYAThU9Ihh5NNDjypsbCjI/KJaFBK5tpc1/JLKnuYCjz+UFkPfD3baKU
 /6qZSEhe9sWDvYOrCApN2E8oyivZQolcli2oYKSkKCFR+hdXIz6TVvUEz7rqYOQUQTHt5vNusye
 dtIU+VCzGWETt+YmozzMCrpERZlPwgUDFJbiovfp3kISVcOabdw7hTPt6LhhLcDqA48R2rNzJNI
 iTNur4J6kJ+8Fng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb3378 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0Wdk4a6BYWEShyIiZzoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: -6JaJzNHT1tWG7AlOekaW_Pco4__YJcq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX7nOWu1K4OLCz
 Vbm5q6SY8AkErS7NFAbC0B1w4kzEeFy+CD1udii6o8RhEGUg8jKzu/4KozaFtrMB3392R2ARwyQ
 ILt+CVfyQyj91rfECZtpi1/gGFQX8j8BiI+b06dxRdFoV9PCT2kj521nQZ7adVJOjsQiGHRALbu
 2tQyJKyixkDd/bT8z0pXTBN9nXGVSsIDHgbYZXBsseeX9PdBSmqJ35236unqHTaMqge7wb0eiT0
 JBa8z/lz2+P8cN/guInHCFfibqVV7dXrtNWyWf2YApB1FPepXTh+md6APsGSyNq9WUH97oVdC03
 xxaD5ItgHgkP7/k22ZGHV3Fu5+5fO1Y7LVV2VKXYM+yXfVkR9vGA/U8QFgADpeWpkFbl/ighNER
 XGqpzja0W7lfYAWU3i3+OA1G0GIIp3k+MmqUQhPo0XSC2jWXvUMWTTqVIfOsAtmwOvCYX6WL1/n
 TV1NNmgMQjO3//svv5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX3pz2yA/OMbRc
 gTNYUuFSNDKZpBdUmVwv18KGIxzrmQZG26t3+jVwq9YT5uh/eCkErCNwF5x48Z3P6HmiIiDfzq5
 VAvA6P7uucFVl/h4/9NM/rdPsQo7DA0=
X-Proofpoint-ORIG-GUID: -6JaJzNHT1tWG7AlOekaW_Pco4__YJcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230039

Extend the device flag accessors with a test-and-clear operation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 429e39f647cf907d2a9868878d1f89526345c3cd..f31fd62dca9a89c1c9ad565b1cd673b71b740faf 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -822,6 +822,10 @@ static inline void dev_assign_##accessor_name(struct device *dev, bool value) \
 static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
 { \
 	return test_and_set_bit(flag_name, dev->flags); \
+} \
+static inline bool dev_test_and_clear_##accessor_name(struct device *dev) \
+{ \
+	return test_and_clear_bit(flag_name, dev->flags); \
 }
 
 __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);

-- 
2.47.3

