Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA73624D4
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730359; cv=none; b=Z1/cvSMbZBKrxTGYFKH7mYpxhCbOn9OFeC2wo8uLzaBUoeIk3FS679zObgD1VuTXZQ9gKGhrJqUhVklpceRuhW2zL6EIqnbj2VST/OmP2SK1ikBKv2jeQrqjxus4XucTLnIC3Qa6xI2Bb0AvPFHj1O1Uyoh843p5A7fOIqq3NF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730359; c=relaxed/simple;
	bh=sMBANx47Nhnc7oTIakrAGi//Yva0S6qPyXhjWsdqQ0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TTIp/Dw7x4IB8vsBZXz7T6N4RL/6Kd6Nn3rX5AiFGM3hXQwsN7JzDV9F3OHCwugn8AY/mVfzIceI5vpdMl/rYnLv1Vqo54yEGUEc2lF1J36W+iXMT/1dnpzobY+3f10Y9w512KPUb2qdgDh9dhCYgCzrt2/jCSfbeb8TAJ/A0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zwc9TR1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIvTZ5QW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zwc9TR1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIvTZ5QW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASr5D2601130
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U11R+DW1K0DvlVpS/+RfSj
	VuIxy07bAzTDI4+2onV5U=; b=Zwc9TR1KYTjrB4eY3ZST77cmoPtscEwvcdFIdU
	RnGt1rEurBsFXaFKisBuIxdad3VhV7rhcZ1sZBlyvi16jqfS0AKcKXTHaU4hXwKb
	232cJC9+iWgi1A7CuzAXuh6wIm0nPO6YrP5PjgH5fGfp4abkk0q9iLVUViyqs7Jd
	1YUUqyaIOAsVxc2UEyqZ2VYZMKqX5hAQbvEfSBjZkAimAdU+TM6mWleQpNChjYGr
	xa1C4eOZimtIZy5tdsVWRbAjCj8APw+IFfQM1qxZPQuNTMwd1WFyGseKe6TWute8
	fuU+Q2Pb4w14DXsiNUubKyRm2tiAcB1zqojxdF7/gYLdaxRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8enh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92229624a71so584567385a.3
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730356; x=1783335156; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U11R+DW1K0DvlVpS/+RfSjVuIxy07bAzTDI4+2onV5U=;
        b=DIvTZ5QWlHmpt13UnSWDZ3yKK/kd/3wEWmqHsVZVW6Lm/yZkf8DSrh+fn7H/NEvpaE
         IZoA5unsm1JxV2Edf23IUVzmurizENoQefwmZv8zDevdHdSuoCjtG/lq41FMusjEgrcG
         4C+fI9QaYaWaU4FsgSd9x+Gan84jhKioVThTizCagrOmutIAG/1itdh/RRILzNMt0LFU
         ONdnX36GZ+Ip/d+8mfrM0ddBluLRMFuWVwHRgs5Su9GvNHUyc83O+7TMDG800YZZ9uoT
         b3aEiHIGgIGY3ANEqdjwE1qozZfXuCg9OC6F3X7z3C6aPAX50Wru+3nd2jr9BH4pEpC/
         8lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730356; x=1783335156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U11R+DW1K0DvlVpS/+RfSjVuIxy07bAzTDI4+2onV5U=;
        b=crnX3XlfZq//IryEkJB7Df1YVUAvt/9iXRkz0JVdzh+wj+gHZZkuXQ6Tboqghmg/1a
         55rCYoR+6kiuOM56PMFRfNidaDVpJosTqqpr7zeivsFWwUUUSWlhwwOvjWjCp+0SqK7T
         TngoKjutxAvYjfOb7GjvhRyBLSi/zlptaCOvFml2VBsOxfwwHa9D8R2alqEZuBaY3hd9
         fDVUaGPwYGfKwpSr+28MyLq0w4vWUhoNrsT+ZnFpFCVFfB0ih9BZX4CILkXlAy7VfkF9
         YgrDBHSGSRJOLPIY/gnMCyUHttURzR/WA7oIXv3YAF5Zk7npFsBudko3rIRr83+8VS0e
         qgWA==
X-Forwarded-Encrypted: i=1; AFNElJ8JyrCZ9yoXKUFQ8JSZv459y0dFgPW8HMbL5K6qtoLKuYAAqMuRiXMdMVGz6DOWseS4/+2X9+sw0wxjew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLun9qgF3CNMAVZxCQ/7Pg2brZ8tc1AidUqwvoCb0IRSDaLyXh
	TqCq5AGZGVDeRI0SMvpAgEw8z72+UOTDwsFDt1XddF7IlVS9MVps8skhq+5je1oQunMMk5Jmxn3
	va9+lrJtd/cFl4msoVeDRwGlMk2kBJ6gQoXz4GCXBbwtp9agKyErbB/jSvyLWvDlaYQ==
X-Gm-Gg: AfdE7cnmSwDocI/TnEIr+UsJ8knaNrZMFgOVYGJRlVMTj1+o86hYIXyVKsG94QhA5SN
	zsii8cAuOIUJcK2Y+3l13SRJ2FSTO+I5REPl/u9qaNMCL2g+g5goGGhacOLUpF+iYAtwzDDL5R3
	go6CJ59ADaa9+dirSLiw6sZOf/X6u8MAl5Swmd8fasAQhq2cYLdeUG1LhnAPqGPOfDIYtJq97xk
	99ldzJq/q/vrbjp1/tZC8EvXHMtIjDr2TYBQ57pNtXdIkjHHN2LUCIDOowEPNUwXUGF3JBgR2PT
	SoNghL7Kj00kaT8+AW1mnJ7/jX/2z/mgZcZLbm9zQDaCt0StpgCHr2J635vpqC1VDINZOEkr6eZ
	KfFrprDHi1aWH69rcM0pFq0MkuwTJKmK+dij2YLGt
X-Received: by 2002:a05:620a:6187:b0:925:56bc:b8bb with SMTP id af79cd13be357-9293a3c4dc2mr2126706185a.9.1782730356130;
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:925:56bc:b8bb with SMTP id af79cd13be357-9293a3c4dc2mr2126703285a.9.1782730355526;
        Mon, 29 Jun 2026 03:52:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/5] software node: provide support for fw_devlink
Date: Mon, 29 Jun 2026 12:52:05 +0200
Message-Id: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVOQmoC/x3MwQpAQBCA4VfRnE0tseFV5MDMYKKl3UJt3t3m+
 B3+P0IQrxKgyyJ4uTTo4RKKPANaR7cIKidDaUprrGkx3O5gwflGlmtXtyExNUyV1DRVkLrTy6z
 P/+yH9/0AxskT72MAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3053;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sMBANx47Nhnc7oTIakrAGi//Yva0S6qPyXhjWsdqQ0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5hKkNN5givpV9eUSYn3bslTOtY9JHZk779k
 FSEh9H3gnuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJOYQAKCRAFnS7L/zaE
 wwiLEACBhoG1xU4psmdAS0pn+KXVz6t4DQGfGc+hRVTlE4wHh/cmWZ+z/mxF3gi41HRvkLarDvx
 8WA4Zuz2FvKz75IdPfqXvaN79NMGM0SdMmqxSAgxSmGmF/fYHU/ij9vIt9RcikytbUzR/3VKx52
 UVa3Ke5KUu1gAxdNKEnJB9OUpmhXCE6YPgfUR7G0ijjpEupO2ELYISJr6Mq0ofFC8JXwUTKPCk0
 sle2LpF+Q7P1/t+vmVz7TgBhy7Ei43tAl5LKh3nx2ptZx0OC/iT+mFlpKpDPWIkK8Lh4qTHGob4
 LHRXGYexb+brcd7KndwaIc0H0p3CsPn0XzY2X/Y4aNUYGfVoYZsTs2GQTTeePXcr4mrZQgw0QMg
 tQsxXj4z+LOx2sfE/bPLMCFSJ2menXFs7dUEF+zQ6tm0f3Gr+HRoX8fLcYa/bSqjzFWSFXUVIXq
 iB97XsOkmOyfDx9l9rtoQa5kkbTsDwDYamGnqEZhHwCe3ZHloSDscaTHe2CUwPqKM0X6o3Ax7BK
 oFp28nVLHXVi0bCO3OvOe5kYQe54XEm+8yPS2y6kuRpiqtxl7EV4uTUJfpXAZj1lRpvBQ4eDiQb
 zTY2wriaigxtCGiX5mR0XS1NWyC/wFHJoVGq7+8CMPg5qZeRrIYpK/X42TC1kYXiGLDB3z/Aopz
 BaMx9qR4Kq2lXQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX/6JN7AeFDI3K
 hwfZEY7NwmifXocHqQkYIQMbLq0cf6wXwwaKhiDuM7Qb1bwIfDJEpFqu9U0iO+crgAZcAIvog0T
 5NDTzdBxMVWs4YLAvhYx+ULXrrdqoH8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX23am3LCsMip2
 tiV+SG/bDsKXBge/TRcYb6wj/IG9uZKTepTDf564uNmv0shz3C5rKV+i2cPUSKws3DBpky+zITk
 pNv/IOOe9S9MXP7Bgzw0StyB31nhHXTmv0CLj+V2TxZH1XDTYQ0STmf3WzjJ9aQWy8yr2k6fT/K
 bPJy/C2KDPqa4OTunC7mA6G202sC/10yqTgPfvmDhUV9NmnaNCIeiSvsWJtEts6+IuqJyXC+Nxb
 NIuHhUc+wQzUNbRBnP0fTX3a7tm/Xh2aXy959TDdCmUnwvWRdR1bR0gFRphepoUNjC6PAyZhU7i
 cWk7ioT5X3Oy7Q6Yyq5u4r0ZRRPHOkpa3UPy4/MRWc2efsCUH9PALsVBG1OFWdStvd3eQI11OFs
 BX5Hlkb3FBbEMynswgOd5O7ns9Vr+qwNYEz1b/wMU/lsgO5OFPEuFHBh8Az03nBIxOonVfY/4Mu
 +yyY+NsaDSlJoVsmjvw==
X-Proofpoint-GUID: 315iFNwivNgZ01n6G5ZHr-krADS1SwQ_
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424e75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LOQarlIh65NSffUShZEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 315iFNwivNgZ01n6G5ZHr-krADS1SwQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
 drivers/base/test/Makefile              |   3 +
 drivers/base/test/swnode-devlink-test.c | 336 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 272 +++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 833 insertions(+), 7 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

