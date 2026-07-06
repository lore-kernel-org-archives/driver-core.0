Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA342A156
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342477; cv=none; b=GT+aeWL0IaV6EsLQJExmQpCfoGLb7kAk8Lv4GG9+3lFTUEeZ3flWfDFT1WvH6gWpJLyMAoY/U21fliuiT6jyVpoEOG9nITcNeFgma64jiF3eGHsF9aabM0xhnB2QB4nzHfgx2xqEQIlLNKNwPtzJB04tbs9CWBXsnyBlkZGX06w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342477; c=relaxed/simple;
	bh=j/ZK6ExUuxxG1XJGSDlCW2aa45sq27hCD52obe1DfHU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U0HbchoOXmtHvUyW0ozmk/7ger10BC9GIGhM+YxTr58qjJj36Qv0ajfhjjDQfLZ/6qhvWi57busdZy+N2zN7uPXAhC8Zhm1xG6EWCneH+TmYwb23yRM/qkSuyDqI6JWb3nyyfi3MvDITGHFGfZgKfnJAUqDbX5CZxoXnACLe+sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VbXN+urT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJGt9oLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VbXN+urT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJGt9oLd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPRe369525
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b0uvwgvESdJ1e3fK+qKM0F
	pZYStYyRNLeA0rpRF18uo=; b=VbXN+urTyJRLx2ACHDzsNAPpAALgCUrBh08uoK
	AhsVuC7SZJGRxAh+OsD42P1cqbjkoFmh11UjftxCggIFs26Dfzg1nX0dch50k4dG
	kgKunl5PmS78G6q+LaSzs0rMbTsCu39iWGl5649zEE+OBI/uthngD7XYTG4tE4E6
	RcsxH069m6JZl/5N95KS94r5bcm6Ce2FQM0xDJIm4dO9oM0seQ13CyT7Onh1AmPV
	Gg0ZJCfETuwtp6FPLfYgups6+8MqCmRa9ezOWh0Nii4H859vOdYP4XbXV+9by2Mr
	uooPM2IfBdMgL7SnK1M6sfG8jj79ms6yiDeGrjK8rdocJByA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h994fp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:54:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6ed4fe99so511490285a.0
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342475; x=1783947275; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0uvwgvESdJ1e3fK+qKM0FpZYStYyRNLeA0rpRF18uo=;
        b=YJGt9oLdPJ3uwhyy/7PZjGXhoQbdthiG/Lps/zulySiNqvLEiVXmPkd8wfb16EPZTG
         UB9az8tu507mlSEkFR2U3pAMkzxDQohEhtKUa0RdzNBhNLF+fG+RHMojCUOgJOjtTc71
         kFatp4tzPdmVRvep6h7y9R9+m9v6yioLHmmqJ9q5y+vCiASm+r3in8MOvBVwsavXTl+v
         +OsAYyyjYoNl1fbpEzAzXK76CwMYcJbE++MGlNbRUd76Qs8u0UUEGuTwUSCpPz2wjyix
         QIEZe8iO2GS1Lg8dxGv6qx/ivI24dQyX9cw75B/Uu24AB/RtGMhd2BVfgu/AuN3NeGAy
         zTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342475; x=1783947275;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0uvwgvESdJ1e3fK+qKM0FpZYStYyRNLeA0rpRF18uo=;
        b=A75bDyWJNLop9qxXsObtGjnzoWkm4QOxrgqVEqMH2hZKz4uYIXYYFBu6b5bJEqqO29
         QB/218Wy9knx2QRBiGSrn9HRYnH0wTPHWrTittav0DjtQ+wpGBZmvYw/G2CU8wGC39K8
         Qkl1GGfSoMTz1WyiMmM9Y2FowYvKJxX0uDYhSVrJksZJmE2Uk8mIW3QgSoP/PsEzSxXN
         kRWgft+o+JOgZr3vOK0O9Cl4tJ6loLFRHG5n67sKMTiz0fy87XZWmyuhKZrpGLAVZSxA
         XRb60N5DnHtmX2FH1N9jgvp7Z1+QNmPZrpf41YGlcSLK2nrFaDTbBIiRrQcNvffEUdin
         ug2A==
X-Forwarded-Encrypted: i=1; AHgh+RqJSe3hwkFx+T3n9QPtJvCVIW00DRWj5tcz1/NrL8L4MavRLzwxpueAiQkbtH2vgJjljPHu7FJhVmPTJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWMJAw9dmvbJqUOSTBMlpqWD2SXl0L1zrhdnM6YsCHk4N6Px0Z
	5w0Bk/iDhI5AXWjIfZIKryhSdmq4luCGyRP2YpqmM6RZwoQFUS2CN6lRe3uvyUGlICtgwsqQ+wH
	1dncxC2JN8pdDhFcLP6MQBuzdv5QyCjWUE1F/rUr+A4KKy2RThL+1p5M/npJ8vzuAeQ==
X-Gm-Gg: AfdE7ckKHY1xnnNesTE/7CI5Hsi8a7Yos3nOI3TG6wAkLp/EGxiURYqLHLcPePNPcIG
	UAV8LmbfN6m32DKCHL0yn8qvRxxHYPt+nNydAm0PwqJA/YSUV4IJr1+Gqjc0zimsbYhyoZ4hIsL
	SVnksX9695AeQ/hnP1Ei7Ak7f+rGY6JcPHhQSgKPFlH6bX7HfSQbh19RqwwzmkwGhL3JjaqixT+
	9PKU3s8KgAUA+JKTwMlgcE1Olb4JxGXGdZmBQ/Fvahtbv41eDtZ3f59Xd1YhcwqHywn0DgfihA4
	RZqTLqzlGQUQxdO92+OmgGld6cPovpWoOPjDdDwe0Jua1IHHwchnbyoRsyhNWFIPVAZfbotzN7Y
	yEXa/v05nl4w6YFIH2QHHGipuk2hymq1T6H01kFcv
X-Received: by 2002:a05:620a:6f06:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92ebb57e75emr57466385a.49.1783342474565;
        Mon, 06 Jul 2026 05:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92ebb57e75emr57460985a.49.1783342474072;
        Mon, 06 Jul 2026 05:54:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] software node: provide support for fw_devlink
Date: Mon, 06 Jul 2026 14:54:07 +0200
Message-Id: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+lS2oC/22NwQ6CMBBEf4Xs2ZJSgYAn/8NwgHaRjdBiV4uG8
 O9W4tHLJG+SebMCoydkOCUreAzE5GwEdUhAD629oiATGZRUpSxlLXixzqDoF2EwjGRvQhtdGZ1
 jobsc4m722NNrd16ayAPxw/n3fhGyb/uzqX+2kAkpulrKouryrDrWZ8ec3p/tqN00pTGg2bbtA
 1QvECW5AAAA
X-Change-ID: 20260609-swnode-fw-devlink-cdc8dc4e5cb4
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/ZK6ExUuxxG1XJGSDlCW2aa45sq27hCD52obe1DfHU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WBYQrpy0ZHmwjOS33DDQLwb1xXf5+gQKAD5
 zCVZbGJBKqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulgQAKCRAFnS7L/zaE
 w9NPD/wO9u4RjtzAd/KO/SZCDbQHuPhkalkh8Xr7gIsSTHw+oKCxzvf2wSR+DSmlELrGqjd9pUh
 C/Ksq86FuPN+JnaaRt3dGErLGTuTq3zALu6KNWPd4/ekUzK682W9ps6Fv81MueyNh9dclA0eSJ2
 GdlREszlGGdXPA1PMjpHUNks40RsfXqXonSsbBgbTPvDzB0XUEz7K+vWSSYSA15xxvS4GHgk0n/
 PNHHyAVUj+O+ToUIE1zDc0HeTspMLxvdPbmlundeNg4RWkgmzLYyMboeCZzXv3j2vCvxc/Q5RG3
 SBxWLwxfgMCe817xmi6Mp6Us2UaZ/JxmuRWHBvqZ8HH1o/Q08WTtjtSI+CrOmoQt0uKlyJR13I5
 rpj7UOT6+Hk66adqfRZ019jyRBLKpT185TQXlK97lY8+jsg7CObtv9/nS7o1bfgrPywmuozt/oz
 cqOBcdfNbCfUKKrj9XQyS0g5sRPv556ykS/ZID1Kmfb0y7cs9oyaplRUCMKrxNK96lF+9+Sl7+M
 6SI3YFpH2bwlozCSzRsqnwo7Cm+2bdfMmCzbv86UmKJ3YTmXPgArKOKb0kV0g3/ur6VWLyACMyp
 DtPd0VbFrhoFKuVqoMW2bDnwoi+bgkwNO8OJlEXo7VrEHge+6dMQgFa3UMPhXNJfKKmxAPi77rk
 Gc5jOBH507DyGYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xP2lJPssAtVv8zk2kZbhc3-kPoumGG9H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX40rPDHURTMAp
 SqxJWo7duNewbPhNKaiUm6+LzImU+5X6ZTEKWZKwAYD2gLXxEf3xmi15OBajCWm8x5RdZR0OQUv
 RAWQqniOL+wMtrzqECHzzupLRcQEL1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfXwugXhcqHM39+
 bGvaed1U4RzePOmsraQ3cWURsLCxUL0FJxJBlHMiomn1Xq4/ZsYfEOmR2mp6oxqJn9wWqvIAQAo
 kBHffOTIU+TyF61TcA3lOuku15LWycwSDtbXzsP7VXYe3+YpKiieYfo18CqRnLetIDILB6M01rq
 HRHYCGDm2julM71bBbCsHFGIRZPSKdMk392AM7Gk9s9AyTPsCgUjrYU8RFtCHBxbj5mmQf6SjJf
 wPPRDWSNWSBmgllIKdY8cuVZoHkleYAcILz+ILFGjJBMEL/Rne4hplUut44UmqR0SCMQ1xi1VOS
 pJBf0KPccf13EMYiSQ2+F9/W7C2iXBk7Pj69QoFv3++nHHnzvZZVeQR2TMoj8m83cmcQhQddmgm
 l81ZlU35RtAL/3U89yWJKOtc81/TqDRc3pyHbYFTPoEKVPOesBl3mM7UHgbfrd7i5fYFq3gjhPN
 IlF4eXZoh2TTUCZ2Krw==
X-Proofpoint-GUID: xP2lJPssAtVv8zk2kZbhc3-kPoumGG9H
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba58b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Je3Peepqufej3slHyXgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

Currently only devicetree systems have their devices' probe ordered
against their suppliers automatically by fw_devlink. Software nodes have
lately been used extensively treewide to describe references to resource
suppliers: most notably, the GPIO subsystem uses it in many places. Now
that the conversion of "dangling" GPIO chip software nodes to using real
links is almost done, it makes sense to ensure no needless probe
deferrals by implementing the add_links() callback from the fwnode
interface.

This series extends software node support to use fw_devlink and adds test
coverage for the new behaviour.

Patch 1 adds new kunit helpers that will be used later on for test
cases.

Patch 2 implements software_node_add_links() modelled on
of_fwnode_add_links(): for every reference property it resolves the
supplier and links to it. There's no allowlist like in DT - a software
node only carries a reference when its author explicitly wants one, so
every reference is an intentional supplier dependency. Graph
"remote-endpoint" references, unregistered supplier software nodes and
self-references are skipped. It also mirrors the device pointer onto a
secondary software node so fw_devlink can find the supplier device, and
purges the fwnode links on release.

Patches 3 and 5 add the tests: a kunit suite for the add_links() op
itself and GPIO tests for a real-life use-case: a GPIO consumer
referencing its provider via a software node.

Patch 4 proposes to add myself as a reviewer of software nodes.

Caveats: a supplier software node must be registered before the consumer
device is added, If the swnode is registered after the consumer was added,
add_links() has already run and set FWNODE_FLAG_LINKS_ADDED, so the late
supplier is missed. Graph/remote- endpoint ordering is left out for now as
well as there are no known users.

Merging strategy: with an Ack from Kunit maintainers, the entire series
can go through the driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use loop-local variables where applicable
- Reformat a long comment
- Keep trailing commas on array initializations which may potentially be
  extended in the future
- Add missing headers
- Update MAINTAINERS in commit adding a new file
- Initialize arrays at declaration
- Fix signedness of ints where needed
- Remove unneeded DISABLE_STRUCTLEAK_PLUGIN switch for swnode tests
- Link to v1: https://patch.msgid.link/20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      gpio: kunit: add test cases verifying swnode devlink support

 MAINTAINERS                             |   2 +
 drivers/base/swnode.c                   |  79 ++++++++
 drivers/base/test/Kconfig               |   5 +
 drivers/base/test/Makefile              |   2 +
 drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 273 ++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 836 insertions(+), 7 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

