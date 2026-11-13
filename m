Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584830;
	b=MifPPKL/vLjw2ryJYI1GxFFP3Am3dS2HhzpjKTXH2uq1FddmwSD1mazqNgFs5Dr870T4
	 ecWcHD0Nj6qPgxBUvTbXJG+NASXqacRiG5woOkKoUvPwp6lMuQwDK2x074obPDmGm11/N
	 +6YjquVd5ELafCoQkdc38+oMnK1Ac5gb4fB29IBTFuWh2lRBsFIlMiy/uhLX+SZI4mFO9
	 YfvMISOdDYMBRQBugGXxz7g/q52wsu0HyQKf7/YrDkqFLAQMphM38wxqnefWVRXJtKJdH
	 d/VLNsYzr4MJAMyq4ogmTfhE9Rajms5HxXssYRohDj5N2ZyLpNtJ7UnCceoy9JDioRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LhvoIjPwf8qgSokp0XPAMhIk3AI3O12ul9x+XjikETM=;
	b=kCD+C/zNUbbC9Xur7RITvdmY3swHzkjKlG2WUvtRsIu8AG3OPOUddCBdEb34R4bEEGw3
	 3ZsWZ89D4oN4B0XVHGz2zfhxHRzne1WbytB/srcn2PIZ7E6k44gHt8hFmaScEjN3T6WOj
	 W613f3DL2MvHLwZBlwvpKF0ZY8XRtQnXD92WRqyXH1t2TtMOwAKjOT1wvnJJqd62ioSpN
	 lSvGE1+du6n+jwLh4wbOZIyuVIw4B88gOxNpVQkFSbzgJ9cSCCFhryJoAgsER2akXPSaz
	 RHYg4eoi73dgoNiZylLgiulYLev6/orTeuNLZCYSSQVZNMwQqoNnyCoL0PY5arQL1Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CXdqUjNd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jVmNBSTO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58764606A883
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58764606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CXdqUjNd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jVmNBSTO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR6501011666
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LhvoIjPwf8qgSokp0XPAMh
	Ik3AI3O12ul9x+XjikETM=; b=CXdqUjNdwxfkESc6nmWW9DKUrkFP4+VWDxMyIT
	5zzkDzxJlvdNGzHXqnGzmZ00HYGZit8pVYaM0vt741QDL2k70Tojlp72dbAANGqs
	wiy8BWIYlEoRmlzBTPoGDwizSxMEWU9tuHtAXkjNuKqkmTU+sjVWQPAoBptzXTyJ
	/5DNwvl4TO/BmJ8Ljd7MVy6JFGHypREnTuPgghIGuirod6Q2Whauhbae56WMq3Gv
	+HSYrZrsmBfXXAtmmDDb64gRmMO91Ermzbwlsq5op84HwqWYIQPME2Oo8SSwK93b
	zHTDm3LbTUtLXEt7vennFsueax088RWq2ATKTaAj2lwKlCqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdkubp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so122801685a.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584827; x=1795189627; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LhvoIjPwf8qgSokp0XPAMhIk3AI3O12ul9x+XjikETM=;
        b=jVmNBSTOPberLhfcnLKeqttadV+L9p5YJVs2kxND9uyNu+oecp/to0KDNdVwmorD2k
         VnjxXPJyWeAa6a+6pUO/SPJvhm28P0LiGdupskFIgC/3GLW3RadTcvvRrxW9rUq/TnrS
         xCR2fyOC/ySJNzysETJPV0n2QPTPwTuGjpYxZR/7lJzdeh1W1JVK2bxvEFUcthalDCVH
         toPzl6Hul8PruE+byyfhHjDpJW52av0RRslD/ddBan/Ju4COfAc1HYvVZkmFSOA9OEML
         IYXIGTEQbekP67mJUwddYsovgo+DXpA2drzJTxClM6aDBFSzYdkBm6hMqE4jGAwtEGA5
         qExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584827; x=1795189627;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhvoIjPwf8qgSokp0XPAMhIk3AI3O12ul9x+XjikETM=;
        b=yi+qxp3LwbIXi30zMSbs2qudsJAiqUjT0WatHafVHnmxO0JoQTRKyYNdiDR8DXZMUH
         EXGD/pNLMt/0rvfUU9NEnRXdub7rL2Gpxz4XcS+gC7JDObIODsGrHB4TjIRwYO2oy8QP
         phdDaS064ECsthdzyea0e/Zp2qV8r2TUQjciIxx0SnsWjbc03SMNYjKaGsL/JQytLbGo
         BlDfd8MORcI8k89U2xdOJdm01XPqMYHBLzmL69PkHp5crTVAmt+Fz3PK4zdf1Oi9XyGJ
         0NntVB6iSCxtLde+npoQRKFQjQ+69yiXFDzAk9Opcc3XOsqHSrnBMQvbL7bHkEBJXXUV
         +Ptg==
X-Forwarded-Encrypted: i=1; AL+hErGNlh/4connTXKMkyzhR++e245eQkgc3kv4LfmBKVq6ifDoEpSTT4mQtVBtDq4LgDfDJuPFHhG97JgiFQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/E0jWsXeZoGVhSQrtIDS56uuDDcltODGJcQ1nvY62B2Jna2ItE
	YQvGuX/3KliK0twv4+aBy4rO2qMzHxCqdi3Kne8Ki7A2x/yjG+KZr2nJc1aZc8JKIMvhKBc81An
	cj6cXEjP5y7EdwmlXThRnGQVEW33CIG5VxsRJLrI4B4huQs1dWLM4Phk6yGRy5nYFmg==
X-Gm-Gg: AYBFou1fFTvzMxVmJbkG5bl5iJdQPqbJiVS98fxkmpKn1WF4Mxeaovl627qihv1AJMx
	McK8nI1UCT9bZljMLyRKoSMNfbAnmwZUB38gR/4KeQsV/OsQfNsU4vV2jJo5QR5qKAFDm2wZbcT
	zD9Kx+3grcy3PWrWldootheLfySdWzfrH0ngSZXzGwLLZxzwprcOQTBoUE/UjBpW1DZafDWmG+k
	B723WDhTbljWi9c4cVHRBmpCPRoQnPWqQQ4K1j4sXe97a/yyh80rInO/ipBMxmkTUqGiCURtFgi
	kWXyoAt1ZSiDb/HGZyz/dc3QrLy6sm87mnRz12temAQlIzg0IyZkJLU2K5zROWa01ZxAfs5U1fU
	IQMN35POZK+CJFucYlN2RRpax51DrDLTiGE+5z3Q9SNS8u5HiKZr9bEFPdcHeKc6W0i/fDOO28a
	7LLQ==
X-Received: by 2002:a05:620a:4448:b0:949:3017:1f91 with SMTP id af79cd13be357-9494bc117f3mr479652085a.48.1794584827241;
        Fri, 13 Nov 2026 07:47:07 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:949:3017:1f91 with SMTP id af79cd13be357-9494bc117f3mr479643985a.48.1794584826652;
        Fri, 13 Nov 2026 07:47:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/10] gpio: make gpiolib-shared more fwnode-centric
Date: Fri, 13 Nov 2026 16:47:00 +0100
Message-Id: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUw92oC/22PwW7DIBBEf8XiXBAQimMrqvIfVQ4ULzaqDc5CX
 FdR/r3Yvvay0qxm580+SQL0kEhbPQnC4pOPoQj5VhE7mNAD9V3RRHKpeSM0dT8hdkBdRArGDnT
 GONOuNto1HOrT6UzK6Yzg/LrHft6KHnzKEX93yiK27R4oBFf/By6CcqpBnh0IW0urrjEldn+Y0
 cZpYmWQ2+sAIdwfpXY+aOTLJKCbyee2CrBmepCE3IpNkJLZn2qri40LIBN1o95rpRrNep+ZGdf
 rN2CAkUXsPwrm9QdzGO/QJQEAAA==
X-Change-ID: 20260916-fwnode-for-each-prop-d7a6f90e7338
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pLIlI74EKk0YI7MaPzy0iJBswk4SNJ2VXVWpc/TRWOw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD2JMfefMzgqf2gQI9HjEGkS03S9cU/+15NM
 rjVlFW/aLKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw9gAKCRAFnS7L/zaE
 wxq6D/4xjxqWZq/YBLoZmFR+/rPVSoOwX8rkCks6n/OX3Jp78z4FF2adFhLx8bJ85Oku2/BISm2
 m0RUgQdn75xNST+tnoX5HcmYJUf9nUSGKP3T+L8P3rrEs5OnL4TKmPZXyNVtEq061edragWxV2D
 vfxLRfqfi7lKeG/PbEZcXRjHi2UqY9D1mMiU8me0zhg0ImJaediNulfKFjUF1Y73AeuvZmR6i4w
 Gob+FXXfoBEnFp95jPNEvvHRYhXdIR8SHZpbFIeO/7mADCMgnvCQSMd8jWyGUh6RieF4V88REBA
 hHtGU63S6UYK2MkpWdLHPPnopb0XTokOHJilHGLzNiyAEgmpIrtDjBMEN7VzbYz62y0cB9P1+xR
 x7uTqVCf9uwwCd40S53BeI0oxF4V3QJzlN2E2+zZaIsogr8xdBTnJhJe0VGPqNAan07bORhfS1q
 VaiuWXjNCRTflQk8sZN1TTPvDbb+AdUFBQl2NRiZLmicOVRCTVQspSV9zguDKhOa5BP/cZan7Ix
 H41ArOd4d//xYhalyUpxpFArnnmtHBX5/+4QSfi61MxWo1vukSRKdmbH79qduBXtA5ICXeCG8th
 dCpmdUvPCMKmQd7XdDLog0WiuOIYXKYStd3asW/exPaOEffaSzlDW839ujQevrvVhUZgOELL53A
 0wFciXGXz9Avuxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX1WF8CBwh9iNB
 Ci38qbG868UQY+loHzJo7W8GOmk8N61pKgCLz9kXSXk71Y+3r7inYrwiWyw+vw+wZYPfVB3t9ta
 bopeo5r2dQxlasN7z8mW9wAxl69A2G0=
X-Proofpoint-ORIG-GUID: XbNuMsYgDj5GT3IgrCVJ-XRLkMILQ4db
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af730fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sw4_LmjLfTFoMrZgmVIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX3bDN0hoMFG4Z
 HpGYrbk4ecrt1+YALu7L1Ns5x/ZUIkiCvzT8x/RVn1sz9C5SLrcg7lykz81IDI4hko9xep2M1q2
 luPjML4fqWR4P2vtAOLvgg3oSLrfxVXferkfI/7L9Tsva2sC295FH63B1LYddVq7h2o4h3FrXtE
 ogqKz+pWen1ZCvgbGSlVkXXNV6pX+vwDQzaoODFgwyDDrdAWHdhKBkJajS8jUG/ZGNZJz4BsR4A
 54ie9e3CeJ6mv1eEtBwDqo7P+4q+6wsT58hcH+nxKndH1vVO4LxjbO/lQcwuksUiXXscMyReLra
 +We0da6S9N7cjJ+hX6+uhMo4NvNl5TGdf5qdHtgO6+eczulFwoSmMygM7V5bF2v2RV8/IYHcmt5
 rhkGw7RJrxohC4zo5MD37gXaJKAuaHhU7qkuAJjzwAFsFdJqouCgk+90IbDmronMXQheuXkeOjp
 C09oHcITMYm1rRAmQBw==
X-Proofpoint-GUID: XbNuMsYgDj5GT3IgrCVJ-XRLkMILQ4db
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Currently the code in gpiolib-shared.c only supports OF nodes and uses a
lot of OF-specific APIs. This series attempts to make the code more
generic, ahead of extending support for sharing GPIOs to other types of
firmware nodes, by defining two new fwnode operations, implementing them
for OF nodes and using them in GPIOLIB in order to limit the OF-specific
API usage to only a few places guarded by ifdefs.

The new fwnode APIs are:
a) property_get_names() - this closes the gap between OF nodes and
   fwnodes: OF nodes allow users to iterate over all properties while
   fwnodes don't advertise all properties in any way at the moment
b) count_references() - there's currently no way of counting references
   in an fwnode reliably: using fwnode_property_get_reference_args()
   does not work for empty references (e.g.: phandle = <0>, <&foo 1 2>;)

The first patch adds a CLASS() for string arrays. The following 6 define
and implement new fwnode operations. The final patch generalizes the code
in gpiolib-shared.c.

Merging strategy: patches 1-8 should go through the driver core tree and
be provided on an immutable branch to me so that I can pull it and queue
the final 2 patches via the GPIO tree.

This series depends on the series from Alejandro Colomar adding
strprefix() as indicated in the b4 tracking.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Integrate the series from from Alejandro Colomar adding strprefix() into
  this series as a b4 dependency
- Reuse the existing struct strarray in the new CLASS() for string
  arrays
- Make sure that props != NULL in fwnode_property_get_names()
- Replace string.h with string_helpers.h instead of including both
- Tweak the kerneldocs (Andy)
- Use size_add() from overflow.h
- Mark gpio_shared_fwnode_traverse() as __maybe_unused for !CONFIG_OF
- Return early in the OF variant of fwnode_property_get_names() if no
  properties are defined
- Add commit removing unused leftover code
- Remove useless alias variables
- Link to v1: https://patch.msgid.link/20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com

---
Bartosz Golaszewski (10):
      lib: string_helpers: export and rename struct strarray
      lib: string_helpers: implement a CLASS() for string arrays
      fwnode: define the property_get_names() operation
      device property: provide fwnode_property_get_names()
      of: property: implement the .property_get_names() fwnode operation
      fwnode: define the count_references() fwnode operation
      device property: provide fwnode_property_count_references()
      of: property: implement the count_references() fwnode operation
      gpio: shared: removed unused field from struct gpio_shared_entry
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 115 +++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 242 ++++++++++++++++++++++-------------------
 drivers/of/property.c          |  41 ++++++-
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 ++
 lib/string_helpers.c           |   9 +-
 7 files changed, 315 insertions(+), 123 deletions(-)
---
base-commit: 161837d37055642b03475137461d4438c65dbddf
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338
prerequisite-message-id: <cover.1794574496.git.alx@kernel.org>
prerequisite-patch-id: 6c8ea11afdfadea1c72457e460596f9140195f8a
prerequisite-patch-id: 81834766a605fc75e62501a8459944c87aa7848e
prerequisite-patch-id: 49110713d1b10ae2972ae738da383215d9be001b
prerequisite-patch-id: 97bf1ce8e594218715d5df30711d0523c7f07bc5
prerequisite-patch-id: c94cdf0377763fbdcb942add8a058161503f9024
prerequisite-patch-id: d0e6af689d680619ee07aabb50635328052bc9af
prerequisite-patch-id: 1006c25c87a8e46129fdba68822b9592c3f5e0e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

