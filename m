Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801057;
	b=tt/Po3WU+vIfv9yFz8lZ+HbGpPpRpdai2cse3HDIQ3s7mOXQSMrq83jTyy98w/QMLI0y
	 W+2YJ8JlmFXEpFIedLzW3++dBxxYZHMAc47OoWZy+DGy9ZoIZA1i+5q+6gsc7XP0c2esz
	 gpq5FONrRrLUqtrmuniXhKGDNgO1RPWgXuwSA1h6w7jcemrhpKePRR35wMrjhHiy5ge7K
	 s6Ap7Ee2VXZoc1uyS20Utol8L/3rKnKk/OA4xDs9Jv24vnsSuWZWIcLV/iKBG2zEoWibL
	 kNNuuzfzItefTXXjTQXCfBgXanpSHRVeZ8UN4SaDg1h51sGOV41hedve6dcjTJ6pQwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
	b=AnYRcwsaXQ5bfoezY65uzSH6/x1Qi1Wj2PpcwvkjhvyVVJB7J0ljXch742usBNX7IKhO
	 maZ5Z+SUVlv51FDICLLhJIEYr+Oixukm05s6iEbF3rhkeZbnSK3jBKlM50OGmWPoeU8g1
	 ahZjfZyAIASXepoE3S6MQ5oBMsHnebn8VkFVRt5A7FgxCl7xVhX3n5207JC/TJ/+nh5xJ
	 aaXZ05KxZLhnl6vL2TyPFNDpPTzOaJEWdy/RWocZTOKdGmyLOOWCBiLpCJRRrolpccx3U
	 e/96wyoM2IaL2eN0Aac5kQk5HA3Ei+lJcmU8gFqJ4rsDGQhikJVve+ygto4lnb1Hd2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW7tXMvC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S5ScJwez;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B835D606A336
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B835D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hW7tXMvC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S5ScJwez
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZuBn608415
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=; b=hW7tXMvCQpuSSKtN
	ZFd63aatRREqxNb/XXFLE6kATLNEDiKcpvjMvAjmx39RMsGxDeRD5HsnP5epFx8i
	C7VX5AhR/CS7+Kz+Hc8bHQYjGtRDRzcKW0AJMtomtI04C6denBUTQlrW+cOE61g3
	wcFoo+1OtUxgc/Axpl6QascgzF2dWBsFgQCota6CxqKob/Xfr3m5lC3OG7Nzrq8X
	shy8CFc6gBQWyiQCU/8XeClybsI7Vc4YNFyP1eWoxBFkS7sfb7Abq7mUlfTd66lr
	j0MZJpxFrVVyvYsF5pOhzRxflj+eWAlkT4oLT0C/uLmh68Re2kCZr6Ma65mnPw4U
	ez8wLw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80ksj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:15 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec3e1921ecso606979e0c.1
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801055; x=1794405855; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
        b=S5ScJwezXeEo8CyXyYT7KGYhaAWlb93haESaTLxvI2G3AUc0sqLbMlUvS9twgvNs03
         WJDHDkLCkofLC7Kl+D3xw+5zXQDHdILET916t1xINYvo0ONwcbeY7OQe8K5dtyIzJIB9
         0sJhxd87/0ZrRiaQDQhW3YPzAqHO67PS0r62aMCKpc9lj+rFpZCSJczWtGU7Ig4BzARF
         VVzlZIL0XFFGCRqe74+1eDSWdpJBLd1B4MIAgOAi1+oHotRvXJ1UG7tGQKvP1mGCPypB
         6IH/e2j1YKXafqI3W19rrS25yfvFsXjeIblm1vC0oH/JkcmXjovV6ahc7qFHmGPGHyNT
         xahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801055; x=1794405855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1AqakhzVdc9Vv48h7Bt2KKLj8pj9gQLGMHQuyOjDKY=;
        b=ya3VqBHgcJF4MEL7UlHL/cLZVKPynvZLSjSkjVIpCb8BLtcfhMWRBlM36Sm2Nlv+2p
         2Q5y5cVB0CHNIfTCjrnnNfHkakr7JHoknQn0l3uXtX6/Ey+5hKWiO/DReY73RQTkxnBd
         j1dG99tF2OHC8RuTzyLn4L9lE6YR5h+us21h/lVgKiNOXQmbUBBFBlUkVmj+m76vT3GZ
         ds7OffRXSh8/dItP2cfaG1QMxHacynltVMyQWZWEyTCyGU4irAHWvqFgNhY8cc5XLS9w
         oTOeW872zYOR90vrgy7ZKZjtkQw8haA+ebXQG3nhWcTDDvZE5NbJoUkCWzGPlq3fFCdU
         UG0w==
X-Forwarded-Encrypted: i=1; AKwUvBwlA17BFqt2sxpgzPxEedJfDF8tc3mWKiV3ZqNNL2YUgb6BdBx9SHBqrP+gerHQyke/AQwtwjNPhK7nNg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+LKTLx5pnKs5xvUTKg5sobw1usUciyllR6pjD8VqNwSNnNgmmA
	zMSuTSeqgLuj4e6LeXVWEbryHaMI2x85d3irlBdJlsLZGHjwvwjUULADw7Fd+OdxURTM+QT9kOK
	GmUK4fc5E/iSuoM5kZwyC/0BbqDRIj35n+qpxFghj4aURqTJr+rDtX4kz11TKPk0lBGi9MwGLDg
	==
X-Gm-Gg: AYBFou2vnMcFqkq1clHemVS6OrDNqVSu0epR8h9s2fSuSn+fUWxDWJMvRFWnMUOJZxp
	VLQkVvxyBfz8mEz5nqUO4ePdScnv/wDsJ5DuLyDCMy6kTGd0r5wgc/88TM4miOWZ34/8HqGHhZq
	1l9ThGRWfTEYmmELcuQCH6uS4Wto2WaWRFkuxd+U9v+WxEmwyhNvXZWrXXsM4ErLvDjW3J9zVQN
	25h/UG9wEjRjGihoLjp6j/eHJesRbbRU/g1QhmZWSmeH7STnsgb0ZtzpOJO5V+g93FGHczvd30F
	yvh/7kyPQj3no4EqgrzHM4pSBJtcfSshkAYnqQAAH3++SDRCF74JzmlpCxozPpgd58CSZhL3WcG
	xnlaAOJcwsbf2lqGj8FHE5JQDWI6H3Dda9XE01H9/R+4ijkZ/kysUTcyRqpms4rdmaRHdJ/M+/u
	5tQw==
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4305604e0c.15.1793801055017;
        Wed, 04 Nov 2026 06:04:15 -0800 (PST)
X-Received: by 2002:a05:6122:c155:b0:5ea:ae80:c97c with SMTP id 71dfb90a1353d-5ec5879d16dmr4305566e0c.15.1793801054567;
        Wed, 04 Nov 2026 06:04:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:44 +0100
Subject: [PATCH 2/9] lib: string_helpers: implement a CLASS() for string
 arrays
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
Message-Id: <20261104-fwnode-for-each-prop-v1-2-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X4m+GBtBmyDIIU2ymTvn7JPXMmdv3wdDg2SwxtGCMic=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztSySWtk1BlVtDvFLGvG8VThjJrWy5dSYUhX
 +WkF61XXdeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w6+4D/4j7k8c1zrVHvsP7FPnP0L/Otl5Fq+MKofbzA4D0w0BETcvM58YVvJIHn0rRzBRYjXgFv0
 9qXudM0FtJwygIzyfZIzLte56iIzSHDvMIEkS4RdkjvSfn/EImsCZvUHuLS1FwGEHAY/L8mjvAZ
 7qADB4uj85+JnI3rgvVNZO30GttbJaZv7hUd/IgsvP4X+WqtexFh+HDOGUoca8rX+2K2RRlXDmB
 xXan6FU77l2TRtc+/356EJklrHHYMCS/bcWARKNjk9scpRFZY4j1z5ihdJBNcXdo5hZQfPu7iC2
 /92H9utwbeeMTc7+9VMLVIp5BTnmA+3t5Uy9tm1H0qA678k2SpLmAjHjIqTDEnvJcuTMZZzhECm
 3zQbX1fOX28Kk82WsaTU5j4Q8h74/YWhmpbsNgmOKrVhOoeDPKs4PqPqb168OwbQBGQ2/8cnefn
 lmQ/Hk111jcr4umGsCttNdWUsG7GaK9fzEnkisIUJAzZz1DFKUL76R/H8Ldg3V/6YsMf6Sho37w
 VJp5EAu7XJcDdQ1cyN29EDRHxXg5953KclxYnuuRSHcuJPQ7qUgmfwG1Fp8I/T1hbw5meMS7Uul
 RdJgx9RGQanZK2xKrKQ7BjUaUOAUmSHM596KQlL7gscczn/73v0KSu8d/plig2FW1xjmIPHujHp
 MVDUJD3sOPzk3cA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: VU_eqvmPVTgTMisdvu4MNgwtJVLHyWOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7h+wavBrVhKS
 l+oQblE0UMW9mSYxyAT/Co294V2JgjXpk+MOWhiXMAwvdpT7WmNqjqOdZBSs0yD7vc2yhzN5fmt
 1GciobeS0YDfichtXsM9lOc8D8o9latLywKaVtG4eU2tu0uIQhn8T8ZQOSFxWF2TS+Mb7xTOaT1
 ef7I/poIaXOpD1zw9EKYZ7o52uk15qspB+s3OCnBddDZWill1oTff/iOpFNGXPLHOlf1i6TM34X
 WCf/mM9MIx9noIm3WWHAq+NqVseBaTa+dgi4jDL9Oj+T/wRwAr3qkPv0noWZ9WA9uC8KQUVIgN3
 p5VcGthGdDPBxP5Fm6HKab3UwPWj3P6d9dYp5kiGtidMW12fTFTby8iMx1ccAOtb1eVwgDru1Id
 oFlvibWqUVtgExPLUWHOj6SqNv2QUtlKbzfTD8+X/5h6b0WCQ+3cqt8YawfhbnGGUvBYdaQX+iT
 9haMdgWtZ4dXKqBMX/w==
X-Proofpoint-GUID: VU_eqvmPVTgTMisdvu4MNgwtJVLHyWOs
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb3b5f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX0LYXTCXfNKiy
 k+2YBGTNpwtC83TxOQDgXvsFdm1qtzJWe5rQJo9j3Te4aKjeUuZ+93Zx2KLAPDsZmOILo+dGF1S
 UGlZJxPfuIA0ZyivgfexeN0awW9BcJ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..3122be1359a36272190264d1c3e4c84dce785e6e 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -119,6 +120,17 @@ char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+struct kstrarray {
+	char **array;
+	size_t size;
+};
+
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.size),
+	     ((struct kstrarray){ .array = array, .size = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

