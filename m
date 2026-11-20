Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178814;
	b=rjt2b+oOn/5ytrvdPl1jgxgeyHtew7S3a7paW9UUkJbKnMg7EGKzFI9i7xTdgMj0Qv0l
	 39yROhOkHtzoreUDD5FM1zlmup6RXmAkqTnZmpRmZJLUC5ejVJjOhO0yMwkOtImamOuGo
	 rqTj99M1Ej/G04VVD7gmjRMJcDiKi+1VFUrkAvoao+tIkyKmOi1pOjmhR879d1D6Pu2QD
	 /LBckGQIIwTlYEXDZLo9vgEMVJEr0WDzY2gzSXnPWQRvYvBs+RsTQ/k5AA0luXAosdURy
	 oxQecisxZGkPt93R6oCIEFKUXWPyLkcmxLV+2OwVKuMc92jUb17ynOJ+lCc/tUDk3Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GGZq+HX0iaPQ17xYik2Dtq7osyHrjasQtnOjIlmO+eU=;
	b=tYPWbg8EBO7yXWkN+E72ixFSfvxW7RGuVVQQdkU5dC2cUrzy1xkIhSVs8gcASy61u62u
	 ILOEMz9tnDvec6rR9D61eqSmzDeKrKgkxoEg6S8xB+0pM0xiOxMO/0Uhunrhr2F9quLBM
	 CXNvvCwrbdpcDgJlzLEtB632HOeK89HLkzjgncQcv4zmZTJUqE41fGgLr8rPqmWitmdfe
	 dZKYqrtGG+69KfTMMHl5Ls7iovQQV+oLYvfXStBLh/TpSwbxZwZQokSU+C1Gaj3nWZAq8
	 IzkARRhSSfdLUAQA/bDTlEMAXwlfPqo556EMmoya64ZNbw3JbscrYgLnGstfL/KgCQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbQ4WCRr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONEINTLz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A9606A325
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF8A9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbQ4WCRr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ONEINTLz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjx991168955
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GGZq+HX0iaPQ17xYik2Dtq
	7osyHrjasQtnOjIlmO+eU=; b=XbQ4WCRrZ7ZSTSrVFEmTxEgvoSFrZut0eQy45P
	KX1kqJWFOzgOyz8L16Sy9IgxloYUHbvmlHUQLojXzh6IJBFghNvBYn81GRwCV/MM
	6XaGcykpOmtPRwkyRvO3h50zF8KAxEmXRpCvUaFbCGfyXfolosQtVJFkY/SbPX40
	ZjoT4AIXDgn1llwSSymTTnoN/+fgK06bnJtprFDcAaMsynRJrmWnqYi6twA2uXs3
	IyEt2/i56STtV0vo3jCHoPNbKd9NTeMWH89mRYZEiCqcMEHrBTURJzI0WMcXhTwj
	Rf4nQCWnrEpzxjuwMtyB9f54fHh0Gk7hZ+vGvbp94KWDz1dw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5useh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 12:46:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213c7a506fso7380776d6.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 04:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178812; x=1795783612; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GGZq+HX0iaPQ17xYik2Dtq7osyHrjasQtnOjIlmO+eU=;
        b=ONEINTLzULyLNlJhURwstd2qWS4oVqEaYD3DQpJf3pXR+JA5En9gwsxB2pllK+MFBi
         f3uzr8TvFCyYoXp2DFLfnz/zV5GUGANCnSkX4vkINe94J2QSGkxRUPuEXv+5Da/9Y7fy
         Q0CphRQSfIfpw0Im0tUudfutyEHt9u46eXU8jTfaddpdRFozHXHN5f9uTWv84IEdEHQr
         wdeyYEZ80i06CmoH+d8FT9qH1FqWeUQa9u6C8p9Aah3fD6YSYHbWT9ufIpsE61f4Ibm+
         JRKQoCh5uLbLn/J1jkMg4EeYinodeSaKB6kkICABxeX0VXSjvkIBy52xOm0nGKGJQzo2
         XLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178812; x=1795783612;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GGZq+HX0iaPQ17xYik2Dtq7osyHrjasQtnOjIlmO+eU=;
        b=xFF6Ej9f5vMY7506CE3cHm1Rs6l8BH5R0RWKGd0q8lQJWN7PcQVSYHKK3foJnksumd
         rTLj/f0lXZM8ZV1VoMvpXQFDmtmJ1GvpSjtkCNfFRa7x8NiKjyVpx3+Mg7Q6BCBTATMK
         6L8egF504AOC7EMWnRoeZc/RhBm/YllAycLJZZiV4Qibz3PRjzYOGAYEmY4YGHCUlhOG
         9oFnhqi+Ju29YF4AN4VeKPUPhkDStr44Qo3VQnTnaJDVjZj/ZexzZH3bHT2BC7khiJr+
         GE+DknSBv8Ixdh2l+tEM5nH+zWxOxPllcSduzD5TY85J9To3MUlD9KEouwPaXccSEvqJ
         pTcw==
X-Forwarded-Encrypted: i=1; AL+hErHY5G9X9hkak33HuXJSBZTBu32RzyvU+0l81o2v72kTrj4Tt9eiQ5vISdIVNzT2XCy4lFimHurqWfYEkQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+fhW0Af6bhCfjYSAJ5IZRrJXwr52YGWyOgOd/6TeQllKQQznK1
	f0/QF4LleTAl62TO0+1DWxZi6vTLv1qJyRjURTdB+vfvahozQwJHz1v9UjY+filTVtdcuFlEMaH
	UERKXz1G+TvVB09zHxkni2Ib0Fw5l4R3682dL2SFqtV1ZM8k3ntKd3LmT1nE+iJgysQ==
X-Gm-Gg: AYBFou1bGq8PXuiP5ADXSg/jguFoie0XP+ETzZpRn6PtPMzUGiMAISmprvflmSCAtsZ
	/Fpt0yW5qHUvlKvLHvVCxLiC9P8GtxsK2SD/ZaRiRVlgd7NKN0BPhkJREwHtHpHo8NlnRwtQuke
	QcLVh2DLKWigFnS7YcSCnmhym5ABlZyG58sF2KOkWCnzPrOq8cjRRpl6yUWMja0ILyk+8WCU4vn
	pIiATvm5MjnaXKEYKrFZbksE7ef2mIfQoVAYES0vWSDm0cCI0/awNqwtIAYf0TNgc7QnsqAwLC2
	hpYiGVfwUFdyxnTEeT8VMUYJD852n1/l5GONa7eMzaYiQIVfZyozHHBbc2T9RAwrLkP1zm/HA12
	dmWiaNPHjxgYXb8M3J5og7ABqfRihkt47fug6Nf8MIcYxWWDWqLAwcuJg3CORXO76zeQUz96Vnf
	8=
X-Received: by 2002:a05:620a:6497:b0:93e:c12c:9b73 with SMTP id af79cd13be357-949bab6dd53mr385752585a.78.1795178811603;
        Fri, 20 Nov 2026 04:46:51 -0800 (PST)
X-Received: by 2002:a05:620a:6497:b0:93e:c12c:9b73 with SMTP id af79cd13be357-949bab6dd53mr385748685a.78.1795178811127;
        Fri, 20 Nov 2026 04:46:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 00/10] gpio: make gpiolib-shared more fwnode-centric
Date: Fri, 20 Nov 2026 13:46:37 +0100
Message-Id: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAC5BAGsC/3WQQW7DIBBFr2KxLggwgdiKqtyj6oLCYKPa4IDju
 opy92Kniy7SzUh/NPP+n7mhDMlDRm11QwkWn30MRdQvFTK9Dh1gb4tGnHJJGyax+wrRAnYxYdC
 mx1OKE7ZKS9dQUHV9RGV1SuD8umPf3ovufZ5j+t5dFrZ1dyBjVDwHLgxTLIEfHTCjuBHnmDO5X
 PVg4jiSUtDGXfgfFqv/YfHCEmANr+3BuAN9wro/Qie4XMsL5kdy9KEz4G3Iz20VYJ3xr1OzHTl
 Cznp/UFudTFwgEaYaIaUSVJHOz0QP6/kTUoCBxNS9Fpv7D93VeMBxAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5083;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gj7Seg7pEQk2GZ/suLjtH8uyZWO74zJ9xG0nzF6H9MM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2ansYKCUJ1FilkZ4DSlf2TK8xh0XTxR1XG
 I9L8p0loxiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w16RD/9xI6g7I3JgyT030E2vrM2ruU3W/KTFNSMlp6Yha+r3djrt2cyTBJ/kUKPLM3IwbRv4+7g
 U0t9K4fEPpxZbAbr0Rhn/wjeATureoyXT2BfQKQ4lQKLOVLsV8yx5fGY6NxprbxJWRgt/Zk5BIt
 h+nRzSjpkDN5aeQ2S/AFtOjBcy5krrcbDi83Ari6dU9SfVW+2EnNPlA7v784Wy1/5Ue2zywxkio
 n6pCysdAetqLrr7E2gSQOzO8Ak4I+CG/ikmU0g4YV8XDW25PVJDiWjwKHcAkqmMZuIxK+gmXgdk
 eYcBOKV07MOSE7mceCS/uL55P/VDr3pBRhKBJ8kgHvc4CDHKHxD/qYMKf9IkB2NQDB7MJzvEIJY
 EkdcPe1U6v29rD7HJUcMlVro7Q/dhjXxli1Y7+ztCTwEfEK/n8lbLzfcrCcI2qQz+Nn9PA0nCow
 Shdi5G6MwuKHR+YSjb8m6FLcb+KxV+wRtRDjkj6Lg/oUtKtS5QkYmU3K/S8AoHyXu5IlJXoRG3E
 Q4tH2m7YvZvtmPhpHXxVGWE/Bhyf5pkmcpV9ZhfrQLwnpSN/FN5NwKZ0ii5uMswFXDlAt8RopOq
 AWscT1GL4sMqZvQnKNpqSlsc8WJ84fvRZwM7O/6pHyR+Mx0FXls8OaRkuX5aRSnz3vZDZGZ+pdV
 jH7myhlDZcWnaiQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX2BGr4m2LWenF
 MzROvwFkRJi3r/WoKSy2U379KAvYsQUDHZwWwGHwzzVnqxwChwjXVK9Q5jFY8305zwOtr9Od8zR
 5xB7S+NnBqYt9mpa8PNEaHKS4p9aSBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfXyojrpxnOKkhG
 GAX+dYPg21Ejgs+g/vAW+8X0aV9wPp7eQTqWryi1i8lNtsUCN7MNReOggpn0I1jylXsGL0nurMf
 dSm9e6Yz8P3DcIg2dH5Elr3SJpeIpsekBT3/DljjMR47y9bKdZwXYqDx8KhQfrpNnk1k25W13Tk
 Ruj1dAXiVthr+TGujRccUBPmFdqehPSYqfLTfYAV/R7Rzg2CGEYzLWxeaJ/96djOsRASoZuWkjo
 OqWhrp8iNWA7FfqGs/FlkTOi4W4z6v0QkSIstuWZyzxd7KHWY7lYEBtfwM5Q81eJVVfxyc5z6H0
 HGfapFYl4xbiJVeI4XCdJayyh2FYFQqXeMjK3Sdy0g+grQvRK9CZ2tIUqFupo30EJx7UE3neRFi
 jNrT5di5zBGuHhAD+1yYEIsJDoxyo9jFaZ24nXunODdiGjj9KHqzpS6dVHTRSjRFsv+vFMj5+0h
 y+jwSQmo2a1UqKdToqg==
X-Proofpoint-GUID: QXbMkdZL3BVge-8SH1Hs2z8h4MTUMQ9_
X-Proofpoint-ORIG-GUID: QXbMkdZL3BVge-8SH1Hs2z8h4MTUMQ9_
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b00413c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=268TmXAmZi7PCZOmIe4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

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
Changes in v3:
- Rebase on top of v6 of the strprefix() series
- Initialize variables managed with __free() at declaration (Sashiko)
- Unuglyfy the usage of IS_ENABLED(CONFIG_OF) (Andy)
- Pick up tags
- Link to v2: https://patch.msgid.link/20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com

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
      gpio: shared: remove unused field from struct gpio_shared_entry
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 115 +++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 239 +++++++++++++++++++++--------------------
 drivers/of/property.c          |  41 ++++++-
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 +++
 lib/string_helpers.c           |   9 +-
 7 files changed, 312 insertions(+), 123 deletions(-)
---
base-commit: d785d132202e8e8e93335ebf74ad5b29fca0951f
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338
prerequisite-message-id: <cover.1794667407.git.alx@kernel.org>
prerequisite-patch-id: d3e70dd6d3b14266595580dd0a45f358ed227c2c
prerequisite-patch-id: e0431bc18c6ad9be618368f3b128a6146b11c761
prerequisite-patch-id: 62b224f17ce0f2e68e8963de1180d9764dd24fe1
prerequisite-patch-id: 49110713d1b10ae2972ae738da383215d9be001b
prerequisite-patch-id: 97bf1ce8e594218715d5df30711d0523c7f07bc5
prerequisite-patch-id: 7099f0089dde47dad6548bc2dae7accc71737f84
prerequisite-patch-id: a0c5781fec5351c5e90d1edcd4b4faedd4079e14
prerequisite-patch-id: ea193b5da63539c30bb889caacc564202d335c66
prerequisite-patch-id: 0166cdc28724d37e716e5506b1c7865acc764e66
prerequisite-patch-id: c35ed24ac570ec685c6ede5cff80b9b140bd09b9
prerequisite-patch-id: e38e553067efe98f8c6352ce378e8de9e3491379
prerequisite-patch-id: e7d3995c1e740354072278a4f700da1848bf2d4f
prerequisite-patch-id: 5d211c7ce1cbfdf9fc8a7a6432989194f9f6dac1
prerequisite-patch-id: 6708d2610b6972e7f8f505492f341d4c0a7bb476
prerequisite-patch-id: 8e386ca3fa87881fa6cf0f00bfda37542eff8141
prerequisite-patch-id: a00aefd04979c68dfa7ae79dc8c4cec5593ca732
prerequisite-patch-id: 5a46d25bb0e28eae712b6ea6bd0fa247a79e0365
prerequisite-patch-id: 02fa7159f2a7660dc7b48138fd48e929c56cc9ae
prerequisite-patch-id: ba05aa979cc564730fdb522e1297a7ff9636cdd1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

