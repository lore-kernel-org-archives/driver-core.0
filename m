Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801079;
	b=hSJomtDydCNRWmTVNWfkAJ3GehHmDxzVrP6uM989YPla+b4eVbAta0NII7izcbGPz2ZG
	 NB1pkg4yhfCrCwHf6vMdSLW8WWOg8bRS6IJ2EhGLNTguXDBAz600+rInFWoDokIPsv+iX
	 EW9Gbx94NAv3PhERZ9nSMPu8Z2khKhtb5HplQ2Lj/IEMaiuihSCzvGJJQXOiPAn8lpkKR
	 QraHPaqGLpnb4fb8oIdqQgpRUQVPm9Zmb0X3hYV3TMl9KAKwaieL6x5qXCUq6ic/tEZk4
	 vXtyhEVS+g9Pe5703BKfcW4pKSe1XaR+FcuCrgtV/7n4GJIoL347yZNhqljdVdwznQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801079;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
	b=ieJ/QaBmzmx1VQJcUQ8bFSi90bcDo/92fNIiEHBEGki2Y48gRI9DQeK873XrqNHSMFnQ
	 ggrUVHSirf06dLj5FVCAjY+vlPN3mkTZRj3l9BAI6q4qFDcoxEXszev6Aw+o9k/5oGMOX
	 Y2J0oOuCqw+EBlIFqC/3nBlrFaDZMBuuRoFa9hGaHEy0L9iRYtmPe7iuaklZ+nTrLLQoN
	 bmfM89o9pG3HkxLKxea1LYmfyeiyUmbaHdhfOBizReSRyQz0TKJV7h8GEfCpVN9ij4T0B
	 /0g3v02PHryZkqXVoSLlpMji3SemieNGv6hWaviu/+ZPeb3I/9VwsjpIR6jm+UqK/QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCpwgcqH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQSgQYoM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A85606EEA8
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A85606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cCpwgcqH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BQSgQYoM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZw0s119391
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=; b=cCpwgcqHhX88zqxe
	wKpSvCBv5dquXNMbyzsRpkUZKkkHfISr3zrtgx/n4+6juick4N4OY/MXhKeXLaWD
	97DesLv3ibhadPjc61dojFlEetb+3q724OGWzkhy1fLVQFyjuf8J9wb9lar3Sxv6
	qLtGuiDDoGpZdGDmxWmqhCHno2Ji2YMdQzo3JjUD74A8Xbk2pvBamVmkWzba/sqB
	XJsq6dJIIpDVA9ymxqpSig88iIp16Sl4HicVJNisjPRNS8XJNbP2ueCOP0A63c8E
	Bfrz3Peu1JysW8OEh8myUkzbUFp49cW/rYLq2ucaQtaXEY+N7BSXAxpuYiOgVr1M
	SOtMig==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0aare-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:38 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eae356241fso207085e0c.0
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801078; x=1794405878; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=BQSgQYoMFLHkAJnZ2bMZX9pYgtisIk0T8hQD6SyUwH7nVO0vzIcUGbtAADFZZMNZvX
         Sj1X72j6ZtvntI4SdZ8/RnUKQM8w3HzkK2M9se3CcbjE217lCkYAdVFlecGtNKgr/X6o
         MOsDJRB7skjvTHPAOsC8yaPu/KES0WSeINOAbLu6oq8m1HcQQc6yKoD1EPNCWy2xlQ7o
         pqS5Djtxo4Vjl+pX9gRyzMcdaS2RDePkgZsh3AduptyjjBpEHJsULSBwlsPDJ8YvOmPI
         zUx3fYtpu0xtrXSshMW8bE7hc2S0fR6jJNgAcP64U9ZwfD3r9isR13yD2Ua7HLDsN3kl
         pDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801078; x=1794405878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itd8Y+uchN2HJrYq4RSPlfZt/iDxc9zWsOFSO8a/jcY=;
        b=iiTrT1Uyd5NYd6LJGaqOqpZ9aXZYoz9Krv7huQY0/E81XqzdJPwxcbXFf8AQUYz0ko
         EwJGMLelng5DN+069YUKVIXv0p8siUVcJxYqgTiXh88PeoJODZfVfiEuT0qj5JzhKHnW
         nw2TXy9h0LaEvuL9Cg9S1qOJ/aSFKslE4+85zG2a9s6vH2uBaX5ra/vWUYIFbpx7X9+U
         gxUp0V74SNEJHmmktxVhZWh6ezpUE5J+CyaxYxUGdpgS99/+4rRS93l8Ol1k7VSD7Hii
         chegth8kL1Zwnhea713Tq96LEdWeRJOQsLW8Mgt7kMnBFk93laI3c/4hZyPZWNtpyr4m
         NU5g==
X-Forwarded-Encrypted: i=1; AKwUvBwVjN/uqZ0K2TPeM7jpQVxeIuBdCpRIiwWFWD7EEFeV/f2A3yG29yl0PGQCZzbfC0HP6TCylXDj92ZK3A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8aTuYXixYkxbmuacsYrCjG7r43LAKuC4JHb29E/RWZwx4xyPun
	8RZYsIJq5P5fiqXtRW4Y9JDlRvj6RlkGu02Mpu3HX6MjxaX5FrFOIyxYlSdvOlbVob5RL4FSoTB
	4QTA0AzR3yanQVLoK6PbC7gxlfOR3VlKPqJ3+hxN91XqO2BmtV+fQUmnW5X83hQfYdk0B48AuTg
	==
X-Gm-Gg: AYBFou3C4FOF7rboytKfHJaAddKkJqY8CfS0sjCU8lt0I9ypHyWNO5k82xj4KGZoSa6
	SMSppXprt7dr+AXG364+nTECncxni7OXTsdDgpm4jvhpJCIyaVoGyULtuybbqTDadCTYn/SpOlk
	ZGrDfKNNPl3uPNSUX7UHzeHjZqLoA4r9Y7vJkTaHqMm5scy4zobmj2KEcLpKfZZb2JJZG2T5L8M
	Qtvdt5y/nbYZZGXmCHCaTahYEbjdTmdJx8OKM7Ll7NbdXwiyNxlUfDn8vXQHCtzUGeqF12kZGw/
	4Plo4GjqrVNQFagwVvNz5ddz7EfRW5lRfBNeH74O97Yp43hozRXjmfrxfarYA3Mpa7cGwzIFMlK
	+61fikYcw5q1wMEi4HBdSwm0uwc0g0sXyBYWHN9KQ9tjG6q8dOsxPgUSZwaFTVBiHgYiLPPBIOj
	Ea/Q==
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6418956e0c.10.1793801072632;
        Wed, 04 Nov 2026 06:04:32 -0800 (PST)
X-Received: by 2002:a05:6122:218b:b0:5ea:a0f0:192f with SMTP id 71dfb90a1353d-5ec6881c31bmr6418906e0c.10.1793801072076;
        Wed, 04 Nov 2026 06:04:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:48 +0100
Subject: [PATCH 6/9] fwnode: define the count_references() fwnode operation
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
Message-Id: <20261104-fwnode-for-each-prop-v1-6-6e28fe1c72c4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uLLErtVyyBCCkNg/MASZUF+mZGiOHH8LUrLC/RKjXs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztS2SsNdvowGbCSji4kZOTwDRHFzVi2ScCTm
 5DN09+/VD2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UgAKCRAFnS7L/zaE
 w440D/4vJjAqKGaTW6L9NuB+kiT9Z1j8j6GncKaGTKchN0TnH5ydAEKWi2Qizwxyo04HcaKr+HQ
 4T12cK/xUvEPrxrLPLy97ZpWxLC21qJ8sj6boM1JlVC2V+5QXDq6339woLssxJ7Y6M99mmxGNK0
 UVXhqSSv9ju6n+VLIppKzuq8CuwgL/VzXfTB7aHz/Cd+Xsz6lX+uaTHbSXBUKrANZ/8mc1Ah4xw
 LlE2LnTq7wisxno9g2y0vYQQIjSRHTS8THzfXWP1S4wW8tgjV1Pmq5QMK//1ycVjqLfir3viFE7
 Ff5OJTBBHCIPAMGZD0VdZybYCipsP2yjNt2Xhg6oFBqu9GpuuyiZ0cBuPFlWI3AwbCyBuM9QsVR
 eFk7uPyVIeuDQMf9MKYHvjKHoyUkDCJCc6p9uaA3hHhKcwSapv0I+gfJE/eojzptJZJHKvxyNuG
 +lG49XDNmu5UG/YjkNtvw8oay7kbYHBQicu7eEdg0fwqfiaDIm61T7X0PQvffKbI0/5Okf3t1Vr
 nKclDroDVSiQrwB2nDXnE8RP4n1FAt6bjHO2txCMTh1Oox5VR0B9mqCeH+xVxBJ9XFUPD637HRS
 yYvDvMriOT/0YdbwaG+p/rLaUxpahQjMVuGXSPkPEIzmD00ie61X6oRcCr74MhpYpDJ3ZwS6fzb
 fczhOO0ijZqWZzQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX3s3EN48201Q7
 DfU9QC0MwyPl9cFCR9PMxeyWP0FOF3mZMuoaee+VMpKoIkqffUrHmn0PnpX7x+jCxIDbTL3lBKx
 bp88VZBpiHoQsosSmQOHko9PYjQRTEI=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb3b76 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pu8Hlg4PHyDR7New1bsA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: EpUzywBcp1bYTOM9dU0O9ZtHqPSaBgF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NiBTYWx0ZWRfX/GR194ANopcE
 qqtbRyNXyzyE1zEUQYS4+KR983LzZhcKO92o0Xc3qfhVtSvvfWs7Yt9TX1LKgI1/nWwD/OQIGlC
 gMfkhETHiVvzbxK55jpss7HZm730HFTl3LqDypeJ+0auIRLQnwu7ymIsa8VtTFE/5y8Abb6Ej/2
 Cn9Ml5fC8qrmAksEbcL+XMEIhEeAlQxKvJf6MnXHd36Tq1QQjZv/h0anfXVx9cVXVtfM7KNIB78
 PD04c323NeP5fI8KxAmdJ0LapzmBA/mrwxDwumHjGKXSyYPWSGxqNWotvBOUoR3HDb4Dvo/cMpz
 OSlgPn0n36AgGM26zzTlg7UywwYRSToZO0h7mMEKrYrVhMtSANgcEP1JRjP5y9VqF2tP+bldFO4
 QdkzpUlsusnmQI4dKKRWXj2WTBFX7Qt/2tN/JAm8PwUxWsuvt4TP/+8m5ZmGPe9TM1PJGAsMAZW
 srkXf/FZdRAhkYIu0Eg==
X-Proofpoint-ORIG-GUID: EpUzywBcp1bYTOM9dU0O9ZtHqPSaBgF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040056

Add a new fwnode callback allowing to count all references of given
firmware node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 2d7e0b9245d445d473c7317bd27058abe5750b40..15acade60564ddb5f5a48f2235b626466d77dbdf 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -137,6 +137,10 @@ struct fwnode_reference_args {
  * @get_parent: Return the parent of an fwnode.
  * @get_next_child_node: Return the next child node in an iteration.
  * @get_named_child_node: Return a child node with a given name.
+ * @count_references: Return the number of references in a property, including
+ *		      empty ones. @nargs_prop names the property in the
+ *		      referenced node holding the number of arguments, if NULL
+ *		      the references have no arguments.
  * @get_reference_args: Return a reference pointed to by a property, with args
  * @graph_get_next_endpoint: Return an endpoint node in an iteration.
  * @graph_get_remote_endpoint: Return the remote endpoint node of a local
@@ -180,6 +184,8 @@ struct fwnode_operations {
 	struct fwnode_handle *
 	(*get_named_child_node)(const struct fwnode_handle *fwnode,
 				const char *name);
+	int (*count_references)(const struct fwnode_handle *fwnode,
+				const char *prop, const char *nargs_prop);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
 				  unsigned int nargs, unsigned int index,

-- 
2.47.3

