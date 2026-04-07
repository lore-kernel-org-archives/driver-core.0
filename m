Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8463B7773
	for <driver-core@lists.linux.dev>; Tue,  7 Apr 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568499; cv=none; b=MqWJcQ8qFjRhK7MPuSCuyv5hWdh4P7uMRWd2u55TumkkIIaC83M80G/rincZxnu7yLrEIYCLPZN0NUWQVAY3j2/z2aUSI+qx8zDeu421LB8hkcFHM8RKCqU2Ffgap0ZDgY4pz3I/Dsv6L8RoltiZiDO4aTNG2Xq7IF98Q/MLPyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568499; c=relaxed/simple;
	bh=OEfrFqY10EtQxTVjSrDWnxKhZ0dRAZ0uYSNJWN47ZEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OL9d+B7fYuYhOyaq65wYkusq4b+iggxXEw/aICCoL7lLxhNWndh5xX+Vcu9KfJune3r06g86iMEfzRBv8YsHyyNL/+e+2dep/BG1f/OaUZ2rV2SguZHXBoOCdu/+h6khGpvA3X8UTndsW7okgD3nZ6GkJ0lG5bwIFjNqUUONFic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNC+pgOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDkqW6NL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNC+pgOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDkqW6NL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D6ODT2009393
	for <driver-core@lists.linux.dev>; Tue, 7 Apr 2026 13:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=; b=eNC+pgODrXDdH9Nx
	6RcG9TXWfqCBBPfRmXbLWe6K50yACYkK83ngffbftT1gbltBVuaqcCK62uNdKOnq
	lnCoy8W81mSLY10LxTEBCoZupcilNsSmOb4yUf1iAMikF4mQpAcpAGjL8Vyoj7ak
	TDz+LOjlXEIrcWi6dYaxQDZN9dC616vistiEWhQBaw0ca+z4Q0kzh0PxSF/g9Nj1
	LgY0hoYH2ancptfm9mBkj6NSTXQ827XG1kGX6gLWDwWqveZV7tln1+L17DGUEw4R
	L62F/NjISBK/H/RMVZQ419XCWK4Zc+PZMX/EOkdtiheogulxgPTPVXlbwNoW9rnW
	YooYuA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtw0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 07 Apr 2026 13:28:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a14905811cso38673606d6.2
        for <driver-core@lists.linux.dev>; Tue, 07 Apr 2026 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568496; x=1776173296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=;
        b=MDkqW6NLZt37USwtj5R4qH9O0eeV48vCUWYx9wuSkiG/1wnS55CmQFvHVRDP4uSI5b
         j9krX/hUCuqTY4ut/sDGApUrHRispngrUcRQ+sFEtofcvilFJvnX46ocmlzJqeUTnAK3
         DuafYh4ZY43tHWw0ONyg1naaS+WTDDqg8LcjrD8m0sgYv5YKX117LBYUWdA52rSIXnDk
         TU9p8OCe+eLXOVWLUnLGjHO+D+sn0/Izhd/pq8daSgNdknKcObhM6CeANyuhVBLorBfj
         s4THK3iOiYK5o0M9m2FvObLvd8N1Gn35KYrpebKSliBlLxNzkT6V22Ax6x22Jzkuj8q4
         oWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568496; x=1776173296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w5c8MEzhdr4cVa+dIv0sfjNJqngruD2IfC4W4N4aSpw=;
        b=tCkJpNb+CTD4uZ5qZ1ptwdoqPMhkKvhN7v7DvYU+pAJqG52AVvOnpThEyCYJCdJtgR
         rzmxlmgcMw3p9h3Si05BoGZJhEj6adAWWa9T3TJpwohFFxTkOg7Y4qGSGwR7F38gs9CZ
         eJXwpDHhitnltiZm2KQ5Ndc5dGOi1GeeZLpxknAl5KhBnxbFUb5jEm+3iz+qUXf9gdBv
         sWCpyJAm6+WCLzKQnREartmnN7oIFqAbyahzT/QtY6Gu3VU3UJTQxQpRHJYah+EQpDX6
         IPs4xJ2ZD+jIoygDUB/DlMSmlo0PJto99tBv+lBidyr3I2CNudJ4HpPAgMGqwchLh6P5
         6xNA==
X-Forwarded-Encrypted: i=1; AJvYcCUyegjfmcGYx6GvfEtF2quj4I3w1E4B0bklkUlpwt9PGbg+3ifjWbbnWufIKcvi1Hcst6cPBmc8Mzeo5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOtknIMk3tXBvX+V5AyPvAu810hUdhBrYQnpeWaxEW03+d4nq9
	YAT+5UJtgrzrOrVgvhQcx2mtrisIAg/a0YR2HdCJ3dzq37FdwkbA6vfjEn8z+6WceyPYvlKVkcp
	Cv3AuY0e7qvrm7Jnj26cPE875eQzj9/vCtqmN86eBvwN6G9eH1kYOol6Aiubgt/fPcA==
X-Gm-Gg: AeBDieuThWltjqZUi75HzDOXtbfexTytK3EUUnb+L1GQ2FlpiS7d8bn54szxsgYLTyy
	QfyKYmoeVRGKPozyI0KV48IMZIU9dy/xugfdOMbp4BVTzX2gpARS/YZYl+uwjmPnKzhsCqxyNCg
	Git6ICT/aqDWYWlPz8V40CdxUnbMmtKf0+6VG8Ev7pAvJZOszmL7wDqOTG2cv6vhtZ/yFi5Hsis
	VQHuvhZWRpj/DIpvLoD62leri+YH1iWpTiVlIFrLzgUVP+HENq85UCuyRZmG1UbxM1S96NXnIbY
	nKPUZrsRrRMnD3uIA1dOD+2TK8KikOm8AhPvJfgbvPClLWHqvR/EpRsVCGO88Qht/R+UtyxhajK
	9xWt2R3DOpdO256uZRpKLwbFig0pPvYfbfDiOMenxfp8bzpzDpl8=
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr164477361cf.25.1775568496511;
        Tue, 07 Apr 2026 06:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr164476841cf.25.1775568496031;
        Tue, 07 Apr 2026 06:28:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:b36f:5370:5f91:2d5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccd2dsm4073807e87.67.2026.04.07.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:28:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:27:58 +0200
Subject: [PATCH v4 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-swnode-unreg-retcode-v4-2-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OEfrFqY10EtQxTVjSrDWnxKhZ0dRAZ0uYSNJWN47ZEI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp1QZlY5tTT9u7707SEUVxT4SUMKUdcSw8KweqE
 EqfOSvq9SOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadUGZQAKCRAFnS7L/zaE
 w86YD/0bskC9HEQp6u4n9iE5eHUdzj88nnBi8+E7bXgshffGQMjUkgQdC9LsraAR7ZsNIUUGMfv
 mvyn6HMSeU33eudv9g5ep7QGJlH7QPQKNgjTfhoJ55Ii/WHa+PVdzVESRDAGN7O7t58rW6SQDCy
 VngmqBnhvIg7oYlJPcbvJBqKJJNSidTDhk+DfHNvZnq2/mCsJGUDkUyglz5Q1WfT/CW3155Fz1U
 YBb0S+u+QMxbWG0Eh3MGovvhyGq3+0DpdQ6/i4N7f9jKcpyVLh1IhJvlyesswqzUH5S2wSpb859
 dcsgdTChI0yPEbV6K/lamQ1iC5MjvUZFciAYeApzYOwOzb8z0OT3RbFZDoWcFkUve/oJRYqpMaz
 nDSV/KCKDiH6Vq3EeO+2X47tjMrodSWhRAa/QTN3/hcl3ib3krTHyKhxIg9XdYq7ZI91ZRrSiio
 ra7IEuNGp9Pjhkc1RZlvf4UrRpoj5zX8uQ/R/OxTPro3H8m66SB1XJKtoCx8vdIfeYUEhvm3Vhj
 iqGRkBiquItARHAjuCPajV2OLCh7QSlf/fwQjwwxR0P3a5K/NX1rkEiDE8gwYX1WHVXbQLUHas9
 xO/ORkmqRvMAefGJztED0ifhQ420kzAkia2kShoCRRAFD9ukWUc3cJTzD4Ut3lrpfAlhES5bHA8
 3tPRAH2wrClAw4A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX6wE6xY79FCHs
 I1o5/jhUrOVbfX2j4CAQc0mSDVB2LtG2yGcOzF1WeUoD2Zcp+n2RsRLJvhoxd/bD5SvAkYg7+lj
 NWTFxwC+f+ZzPSFO/l/C+MWjuLkBaG6Mg6O9zucaPSlmWmW5m0w+QqZVw+TmyaDZ7NeeBeQ1wpg
 v2dCYKG+/XCld56euR/QS7KBQC3KGMm6iygWzGdhSQ1x3C9EA1nzsa41WQfXsuqvf3EMNxXm7fo
 DKhKaRgiQwkS0LLpMaHYc0ytbml2PZbcv//TF/KFEepr6ZnP4jE4YNBYfGk2x6TvkyUVWdBBLtA
 kqMu3AKjY079uWCsg3Jq9Qy+hl0Xg0f4Qts9TrpEuBwqho3NxL+1wrqxsG5ry0eP4UkkpB6vvbI
 4+5e98bCBApY644pRRmZvqsvPTNP75wMRAeehtOhmo8jl4rnMWMahe+0v/Zew8ECprgplUhXlge
 BmIe+DnIVg3ETfKxtOQ==
X-Proofpoint-GUID: i-EyP2NlojxdVPq9QxMqbBNugA1YkVYZ
X-Proofpoint-ORIG-GUID: i-EyP2NlojxdVPq9QxMqbBNugA1YkVYZ
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d50671 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070126

fwnode_property_get_reference_args() now returns -ENOTCONN when called
on a software node referencing another software node which has not yet
been registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENOTCONN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..4374067f621ed782a7e1549f7b0b7e44eac04930 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -93,6 +93,14 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
 		if (ret == 0)
 			break;
+		if (ret == -ENOTCONN)
+			/*
+			 * -ENOTCONN for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
 	}
 	if (ret) {
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",

-- 
2.47.3

