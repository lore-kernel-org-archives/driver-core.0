Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584831;
	b=FLFtmeQ3gK0SV3e6alWYyOZZvafnkAszWZtRBRCAYuWKnrhIgDrfFB7nqCm01DVOumsL
	 7GviUaAzO5wIqv8qEdOMhHWbqwRgqJML7j2lJcIAuyklAMQToUJOQ3DPrWy5XrKhISDzZ
	 7bVys7MxgOWg86aUllNgt98l4WIcBRDEMKLhEh5G7jhP+XQ+I8xzlnSbACY7b4ZZxsZgd
	 VlTr29Kr2Or/3SQCglU8s813mijH6FRZ00R8esl9nQxeR1tXBPfF9uZ7tpONyRS78tGOm
	 gdJrUuenog05bKNqJgohwOBlBFui7nTbYCfZQWtXmkBifECUdaowTlZ+PWVs6xqgdHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
	b=YTqJsWkyT/a9cN2xFcy0hD3slmGNIxxrp/qbiYMRx/K8gPT/ndo6ZtDw0J45HfsSPwSn
	 Vkz4zRD/qDxoY7ErrobiJ3bATsTGKhH/Xjykdhs+XsjSAzXKN6xV7o7Kuf9YT0oBxypCZ
	 veYpDp7DGGhahp8/XcOUJqz9PpoEWg9lXoJ9tDjXs49r8bXNm3J1dNsc8eqlZnftOckEZ
	 SwEIOvxJQmIMXvn0rWNABGn3NURLrBOOXpSAI92tNgDij/p+igtlPVAR+TcjWrmByPbPc
	 wfMSPxP/ICivOYH4gJyI1lGFCNOWZFzpkqU4AVM4tS7AhgXmij5rkMrfBFqWmK2slvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY+rgzTE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F3606A890
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3F3606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FeHmIXaB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PY+rgzTE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR0Ga1011372
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=; b=FeHmIXaBYieL6OxG
	t6WUzojIA0ZKYBDTI8hL2F5VD7PdZyQVhoF8QNKqrS4mA4n6iJaAoIlvnhonIEDA
	Lm+z6C80W/reB6J2KTaV9ql5SlXhPCIx0S/e1r30MiTWPHpbPPeAOveG50n09PLP
	RuEIPw3JoY4Snyp2Ot0CQeamBYdrL/vpaJhgvLr7vb1zRDmqN3+qLw5Qv2PHPH1t
	yxSb3kAX74B/PyMVEmo+5VPpHHmddiEpPW9fk8EJXJL1zCoVNbtxdD9EsGtunU6W
	u3bby84HVmXrzZcBZKmoCOZT82WZuuh5ycecA34oL+5vjPSErYRuu7pShRxq4WKK
	h4OyaA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkubu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:10 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990aa76e3daso123000241.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584829; x=1795189629; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=PY+rgzTE0O+Ze5uynb5lQhrh5TIxKvzkEExnwbtYfJzOj/mJk8RQXhOm+lvJWKR74b
         27zo9OUJkSwV4awhTYWf3w84IaRdd6flBriuFOzvumDqgo6ONsY6urX+GSGm5sCUqBNh
         GGMgqxHiFBEu2pA4LVv5wYtm1S87Iks6+ooxYCI0R+e2vqgK+Wb9pkEx3t6k4ehhFSLp
         TJeTyjKQcJIqYM66L5V2CjWosb/d9mzQhK5Xju02kATLc/y4ksKomjtgwwGFmNzE+wGS
         b4iriIenVzg/AGqLUAaBR/KVFjP08pWyiqsAYZyg3x8PzldsRi4tdo/PcvEJwTIqYQFj
         aBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584829; x=1795189629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0SG/UcU30V2xHOD7lY1mRa6oni/p3PRzhrNY3Gt+7M=;
        b=jhMtpJO57Cwo2NKmW/OKVVg+YPZpjpI+6oDvsWTkZV8AlmvEXLuKAnDd/1Y42kJyWJ
         DVizd+KEnOL5NrPj0qDcH8MivB/mG4sIRN54m15RBaKROxYA9Kp8vuvVfgqteELEpO8+
         RRPWewAhiClR6Z0pSele6snpi/7b0iTtaLsXvypOSyM0NR24KEkjQiRMSIQDu3BHiA4A
         g1NfsaNU7Ko2UVUQ7bh/bt7xX/nKOgMlv4oG1CfCIpoH4Ws3XBxYYFx6bmGMQbQDV8Rg
         uTiID2DGSJQCKLVBX4zBMyNhoKkzJNTnIU1gVQtAltXlswP+9H+UINg01tRYDrbuShwD
         OV7Q==
X-Forwarded-Encrypted: i=1; AL+hErEu5irF799rwNPJS8pCA1VNi7S0ofwRyBPAv37K17B2GscYqKdqDeGsRoimjNMy5Evsz4N5giOvxAy3rw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Z+vZLZMHDTfZqpN5sYjhorQ68vyAeaR7vRs+hDfNuMuQdcbu1
	9qbAhfah9neNjfubMW76Dka0caJLt9rKK3dHMOs/6Pry0SSgXtnVCFI3CDdAPY3axd80pOz7aw6
	st/zbodmF/zg5D6ZFZcTpbdS4NEILW8855002V9yrLKODAEdNJVf+vdvdSFAiRs+ChQ==
X-Gm-Gg: AYBFou0Fnwow94/mDa598hdY3ZPZ0ir1U0jlO7IV8e71nCiKVYqSkWHPwY0wyL8c+Nw
	SvVp/3h00v6GOXz9F2thW2KFByKLmean+nBfz3PEUKLuVswXldI9ybND6QlIqLIhK00fkw4LjJJ
	hCiHOe7sVcom8BlUoVjpLRrvisa1BfPmvpa9FORTd7DEl8S8HT1YVl2pH2HvhbRRQPKbK89oq+4
	Dn/tKHoMTvwzZgIkQwRgS+fWwI+OkKxNnUd3NkBpN3qmyNQeDP0f5CC2JrF64Y9trCEZ1RsWcCa
	UXWUTYa96h1f6KfebAjLP/+M7TX+wF/5CkfBBLB67jr5FEG024dzxfBaWxsmsGj0cxTKHl6Bfgs
	18hArjftNZbTE0RhtwSk85CnCRsDCG/AwfQKGj4dgelrbOvvUsMvfv1S161oFddLTwn0TdLenAY
	rUEA==
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691228137.37.1794584829204;
        Fri, 13 Nov 2026 07:47:09 -0800 (PST)
X-Received: by 2002:a05:6102:4426:b0:7c1:5862:a97c with SMTP id ada2fe7eead31-7d64d874efbmr691221137.37.1794584828711;
        Fri, 13 Nov 2026 07:47:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:01 +0100
Subject: [PATCH v2 01/10] lib: string_helpers: export and rename struct
 strarray
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
Message-Id: <20261113-fwnode-for-each-prop-v2-1-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m4NpZDP9wCk6X2lLRZntvYOO4JCGmA1kZu5D+y8yR/o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD34fNGOw3Us6Spsa8wQXUoWktbw9LNMm6id
 xSi/+Q9T62JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9wAKCRAFnS7L/zaE
 w4MUEACv2DIA4WBHencGWJ8xeH2XgSLKF7rWa1HACKBslDnGDYzgFtvP+WP0BINXGHsfU9nEWv2
 R0Zm5zbET8Gud9t2ocSRdp2QCz5PYjYlIyW0exI9eU6MQkoyCiNwN3PqBtAAeuQYsozHdBLGZiM
 DJXl8D2TQ4ZCFALyp4kaXFiFCY9CsM2DBK2FYee8jDAlx6slky2/X1htkINXkjpJhfpzrm5UIm5
 Hxzp1Wqr1jMO4g8ioJSpMqufUAeeyY/lFruejpTFY/HZtzc2jGoCVUMN4qf8hbuRGux+Q4GjO2/
 7E5wjbT/k1oSyCFHIYLZnNjdqSJ6xD7X2GOB1rE87UEqPdNY+si1LIjCgKT6WMTwJv6kP23Qnne
 2hLkvRYovnawknJkWeuffSgA+ZqI+FIYin9iG6P4ik7sHTUjsrIeNNmnbgELRdTbXQ5GmsAPDuc
 ROpFolb5danon5vtph7Z5zqjvc4ZJ27Qbifn0GTweLFQtiUDImuojNNiDaXTLLRcbQe6I5SAoNa
 gCSF69hau+bYvtD+vgR9qZVpo51TFSpCKyJYNJ8FYD++1VQGvW2v2yL4nFR822R8NOD3n1hjFtg
 cUZPDoLO6nxfU60mWZJvYgLDArvSgi8rkk/yu38ZYS5DdSNmCxcM/Fq7jv7wMlHdm5w0uTqK4Zv
 Cn/CsMAdImuO2kg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX1UzVeVe4l0Iz
 PIRorEYi14yS1DAnCGiDVoDgGn6glWEdaGLcXJGhM/Suc6D9a+dcLOx0bdMTJvaaFis5ePdyYsy
 QbY1pY6h+q9XQCk+BrZardSLf9PAdOo=
X-Proofpoint-ORIG-GUID: Y-ok54VSEsR-0oWOykaP9L25nu5lHr5Y
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af730fe cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=NBg0Ud2t-6tr7aH_vnkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX5YP3cap51bfF
 oKLs0i2JkiJILqOnLQMbyR3Z4cqae5OMLgtqtXpCvk7x79l5jIWvWiamtR4mcvDtiN8nVsK/0I/
 Gyog2ndah1GoCmS95ZK8SYSN2enPkLsp5Oso8iVnvJ4JYvI+0d5pvLA7FkzU6lpbVUOiGcpePrA
 cySo1CDr12NUPUjQOuM9t7qWSpngcYRMBVXRR+IQxEZX/v6cY6kEIVgbQnq4bnD3HI76DGK8jaF
 WrGj5G+2LKxbn7X0LNkyVMuknrek9822LO9dEIGOyH7d/cAMkbiDp1gEPQhGs9gWkiT/qNisErZ
 z60i4S0mM6y8Ww0JDDbHMonYZ1hxjaHyJDKcOkqADii5viRxIdEIFJdd16rS/1iOfbyydJ0pqfS
 Q04O/1v5h7SX0dnxbmyc2Y9csR4Ij7QI8fgsT97J9vHHxbCjBCC3SEYmbDCf5N1GWxaWLEWJ7vt
 zuphgzhDhBnV9rk+u6w==
X-Proofpoint-GUID: Y-ok54VSEsR-0oWOykaP9L25nu5lHr5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Ahead of introducing a CLASS() for string arrays, make the existing
struct strarray public in linux/string_helpers.h. Rename it to kstrarray
to avoid any potential conflicts in the future and make it clear, it's a
kernel type.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 5 +++++
 lib/string_helpers.c           | 9 ++-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index 3fb88a1e989833ad5ea1a46858efa16e3971bf08..c9f08066439bdd33cc26e2054dbe1ba2e867aee7 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -116,6 +116,11 @@ char *kstrdup_quotable_file(struct file *file, gfp_t gfp);
 
 char *kstrdup_and_replace(const char *src, char old, char new, gfp_t gfp);
 
+struct kstrarray {
+	char **array __counted_by_ptr(n);
+	size_t n;
+};
+
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
diff --git a/lib/string_helpers.c b/lib/string_helpers.c
index 98d6ed0eaab7e9f3d54e420c404629a28b925bf4..8ec7ff6dac1212fe8a1f242654944ba6e5568e20 100644
--- a/lib/string_helpers.c
+++ b/lib/string_helpers.c
@@ -804,21 +804,16 @@ void kfree_strarray(char **array, size_t n)
 }
 EXPORT_SYMBOL_GPL(kfree_strarray);
 
-struct strarray {
-	char **array __counted_by_ptr(n);
-	size_t n;
-};
-
 static void devm_kfree_strarray(struct device *dev, void *res)
 {
-	struct strarray *array = res;
+	struct kstrarray *array = res;
 
 	kfree_strarray(array->array, array->n);
 }
 
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n)
 {
-	struct strarray *ptr;
+	struct kstrarray *ptr;
 
 	ptr = devres_alloc(devm_kfree_strarray, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)

-- 
2.47.3

