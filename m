Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A4255F2C
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691521; cv=none; b=Y3cdRIbRGSs1DjdSKjjdAVJ0o+17rUkpXynZ9zJVWZi4d3m3I3ihyA183j8EjYyJjzII1Bo9DB84jQjMXNxDPQ/mXzyZhe+9A3ZJ89VQrchnDUCFy660WLKVCs5kIaGt8W7U3bUBCmqZKGWAw5LzxiLX1nP5VgNI2+UkMNNSeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691521; c=relaxed/simple;
	bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9ZddRXLAcgnPg7IFqMOTE99XHwMcPjDnRX6sKGTJl2Ei9bvVBod2B0N4ejSnmgZj3eQfGX30FBocpON0pbjickI+byLLlHTCdscfW2zHEks+coBxJhA/LzubyeZpZoAONseCxbzffP6cqkp8QuTGwJNIHxAUNOk4gTXafxVRXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3ySqATy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPkSSqp8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3ySqATy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPkSSqp8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6Nt9871516
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=; b=F3ySqATyHKbPSeSH
	ugB/fD+6KO2wJzEN6VpmWMmQfMwQjYHaMBRlHIMe6OjQdZDtCS+FAL+APZSICeY3
	FqqdeYqTMDcuNBgslxX9aPeJ256MGDQ47y9mt6weF6/8XT3NvMzcGIpUH7gGaQ6a
	WjMIk6lHeMF8ME6eigPCUM5mqjqwnm4esaToAU0UFkT86xK87kJQdHErUuoKUF6O
	Lvh6PTVNeAlcJipZg9wS1E/dU3eU2oWUSfiphaLYFB9tui1gNMPCWf9MLiGJ9Kgo
	/J2SHb0afwipAkiYwgtCq4v6yFzx8grNMj7+mqF8pZilWZM0sktB6F4SIRQHphTT
	72OTSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8pvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1ada6c43so13418741cf.3
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691518; x=1784296318; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=fPkSSqp8ahRhrEGSU/by6TXUNBtQwU7lzBq5GUhEL1LFJuv3n8a4X9Fg/KXooQ0YlY
         XxnxUAsAR/FbcY3K3RGeydeMtFo5s6DGj0sDr8LNFu1rb2T+f8UMsZK6G6dKNOVljj22
         rFIQRDAilgnFBwkZ8qPXJA+8Z4yqH17MXfzoBoQUbfztjWTpHiUtlE/EFBycUabzU9BD
         9U+ERZy40O18Dj3bH3nRBiAGkBS5Kykd+DJfeqKGgMJA2REB8OvixImL00CvtcFyurGj
         t7faw3NIr7HCzVBWMCwHmIlWMjw7wCCmgU7/IrzpCDirKWaFWPSfbapOnChd301cmbvH
         pbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691518; x=1784296318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=Lz1n0jUJbCHnY2KinjJqSc2aiKXSi+FAGcdt/FrDXTrYc7pk6oyzQSibvwpnE2XSFO
         5z6SlglkfxM4vr0ccgNm0asUDeN71Wr0uvsrOr+24ylINz3sjZRfXFLko75Lj1pdl5Gb
         elbf+EEMWewi0RxHknUxcgyGd8/cW7h/osjaHJJmw61kCSytcrcpq+Cu5lmh8LHqKZK/
         uEeaWGSjp5QKUJHRKGsk9862+ZSOSsFi1VkfAUUxpklE8R5XElBTHo/c19EDOBjPSnr+
         voKRQ/3+CFv4nVQZr+0rBOYpviA9W0xEOgw0dcD1mzFweIZd37cSUd6pAfV7ZK0PNZ3h
         5uvw==
X-Forwarded-Encrypted: i=1; AHgh+RoPPskQeGt2CYNAlfsJZ06mToQqjddeIIDudXvqmG3Fcxs9B1xqv+pYo4B1meLiqc/BubxurjAbxIwo7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR3ewyN2lZY3LFUu9pcgzXgFrpfbZC1Eo1TEFviOARWxXhc6Kj
	vUcxuT+rfSl4mCVoOwnGrdmH8UUGYjpNTwU+0DhjcvTjccVoUCIjgyoBnk2ssLdatC9baaUe5BH
	K2xN+pFtWfMEIr15NUL53lqfOAK7yPq3yKTbaGfF8Y1xzucnmQcRn7H8/tdcpLBhneQ==
X-Gm-Gg: AfdE7cmXySXUgCEHOjkumPIV3aUct2iqLt3PT6Uu9KI8oMVM//VXJDF/MZahDWWOCmK
	LW8mG/AaOWTVGP6DD6CevW/lb36WgkR0a38VZ8GSBx9WNhcKOEq8VyBNEEqi3IDsf1+Y1Qdemwj
	5RDaLwyDGSSy42hYwuGO85hAHPLZF3fRiDbUFN272dXu30zI6SXZUDA/AFF/3lNJOi0s1hBnRsl
	nBa4RJad2PQr2k8nCIj1T1CcU/TCS/zrEvfSUVfwgtosea2M/OfjNsYO6B8R90jf8BBlD8vI0qK
	TpBvPHVS2OGZRDSMA08XcIOiSbbXeFb0YDGfyd57WByIozfuRpfEKL5GF23LyNACAncS4zXg+vt
	2MhfBiztsCvtYScT1I8zA/CkmDpqMVo2VwKrowRTN
X-Received: by 2002:ac8:5f4c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-51c8b2aec7fmr125426921cf.12.1783691518104;
        Fri, 10 Jul 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:ac8:5f4c:0:b0:51c:e6a:1b5a with SMTP id d75a77b69052e-51c8b2aec7fmr125426501cf.12.1783691517650;
        Fri, 10 Jul 2026 06:51:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:23 +0200
Subject: [PATCH v3 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-4-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPju14ZePJwCsYAjiYhx8i5rjT5UTbEC9PAiC
 443aOSLN+WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD47gAKCRAFnS7L/zaE
 w3UKD/9BiRulUtSRsu+ohMhsfYeNZYC/zsyq35GANqEkhKyU76r8Fli1KjU3pHnabL9XE5f8owq
 14X4eblkJWpyBej453pKePC/c97tcsKEYKPf3UBUSmHBUu8z8nyDonDQrGW4NeuAKI5BQnqFTmt
 isFpnJNKAe4Pq416vnY56HSdM85KZvviEX7mEHxmyITHf+O6C7dy4iMnYojkX5UIvvpAoICDWAa
 HPr0vY7B7Df8O2/vifavIDtUA/Qw3XBgULH3jELalHz/h9OMWcDPmS3jxRaq58M8ZdVSQ8QW0FK
 R39uMNGn+Bv2MflNRLRAHLp/YuBD7TXSQIqaatRARwqXwHn/rkcmM2tkn1MUoRtZDy7P/+FXc9J
 X1nLKucD6UvV2g9zC0iru/vtBpABVt+Mv4QpwahJ33lB6amKOYmFKwsVS+LiLphdOpeY+rj3bUw
 CIuweJjVAVGflWl0cf0zoeUVyZDyoAfHSgfFSpbfrXnAiTrtu2ob6CnOcEKqgZNxowr68H1kd7D
 U3QDBBMFrdUkm294dPJjEHD3njv1IZbuRYQOBR22e68sLUMY/BO9WG+2KaxOEJkgeMzbFmHas7y
 BwG7YdxUgJH7H5UwM+JQbwwcfryU+Rn+Xrk/q3i3R8ulCm73INqvvi1K3xOTTg4sanfjQzZuNHV
 osiKy0L3HjkFuPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: iqaJHNC0qIxiSz5vfvIr_delYAh5aYTA
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f8fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX7t2T/auIVuHu
 pDm0GPlRvmJlhcYi/91jiYSzIOMl3RjRKfuOa0GEecOTA1Zw6w5gbl7qRyt6sJ1+3EsLWZsODTd
 1YPoUQkAvEwbWc/6ydRThetHZA5IHpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfXzTg9BdUYjhHr
 WGHx2qjnxDtq2L+pJGtn2aXbSwPRA5F7XL6fbtk/B8FlqI3vtoNPcbixDHjR58LY9ETKjsIAJl8
 NKwnk+7m30gb0de6AYS7lr0ukIAleLDUKIJQGQyG4WPMW1yU0pIPrTdHPUafF8GbL0s50iWkU0g
 AyRoOb84I0EaGA+sm7Y45qSIIAmsCbZyqhG0aGMNt3oHWC2I2FfrQteg938Hku0L4NMDcHpxYTT
 pCafG+UxelR4sVwoiSK4+796c+dzfGC0A5A/kV6TWqKyJAbGbDjnP1HtyCE5vAZsvpYFpaH5fbX
 l20vMV1stmXwhRNDan+q1aVk2eVbFBfAINxWADxPIW8KLndaQTgTE4uG8b098DpcyEQszBB1Cox
 Dg6qEdR/DCp3khODDK5JLZ8YZaELWrSSYpIuJhAM63vJIZ4JW8cNb7s42/TyMsq5LeV7ILp17L7
 6apDMQMexIaoUfXm+0g==
X-Proofpoint-GUID: iqaJHNC0qIxiSz5vfvIr_delYAh5aYTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100137

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7741614c941ceed9e46e9caea72bad77cfb7618..da886aa69f362f4cb9dc529a26f8dfc67649d7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,6 +25101,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3

