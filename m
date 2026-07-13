Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4060E385D8D
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941307; cv=none; b=i6dxAShe/imLjp8KuMbh9Zh+ZdkMH+N78r5SsWhci+tpc4aOQDDfka+rPi7RFSjEs/QpJ9rX4yY0CvVbjcE3z7qh0BmYU+tlwgFXNywcVpCLV21By7dFW64jy1bN41eUwx3scWJpHUfLB/XGrCeVKOz1Emo9qw1n0afMsbb/spM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941307; c=relaxed/simple;
	bh=YLnhAMXI4o2AsIjbEgigSwyf7yABdblIj2hdQJTPptk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JbOrGcbm6mHiV0jfdNajyN/maBbdZ/XfJ3lY7I0VCHAQ+vA/MZEZhld31r6fSizajiQAamgoYUJbo85bHuRmy6nuZg6acfdF9+ko4Y7kmm/MXS5GWgiSD+oTeFUabbQG7OdeZu9eYq++uOM+FRmffbG/Otr++2Eovd91mK0bQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bsRP2EMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHECmRdy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bsRP2EMC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHECmRdy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9R8vQ1122927
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rgj1qOKaATbq5epILLAkJg
	dwBV26F560LVvJkeM2a58=; b=bsRP2EMCA4+XJvyt/WY5sTqOSLb/c/UmTSIzSL
	MRenKVOsnibbffNT+1Ig6yxXelfWmAPyQ1F3qodEOusMe9Wh7BggOYBj2IDBeUEW
	m5gGnGqRcgyyWk4IVruaRTp/Wjk2WfOujpm/QBI9ojsVPb+07tbvYPfVnQCv6jxY
	82P22FFS5XJKireQEzMS68u22QoljJX6v0i9ho1zThi4o0y01dOCi+A1H3wQN8m5
	8azQuLiTVylh3DcopDxLlUm7dlTse5hn1mKvx9RoUt/cSU62HDFudIiFju/L/vlc
	om0BVfHESuEgCAMK81cvANwc5FknN+8rrFMQqNpaZxxQZuOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0ccn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c33f48ee4so44232251cf.1
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 04:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941303; x=1784546103; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rgj1qOKaATbq5epILLAkJgdwBV26F560LVvJkeM2a58=;
        b=iHECmRdyesnUcsOUUpeWipdpJjtJ+O2RCsv8rzHNcrSyONg/Ys8m4F/gknSY/LPRf0
         tbAD9RCQAE6sXQwWlp/ZXbp5lXgx4Gu8R2M6DLxq0QrVBeahOUIbMNTVTF3K4Q14LlUv
         kSQd+1OD49md7KNEEdyy9fIsVqehI1p2AgaKRRCI0JbuLOk+6/r4S48/s7zKF4EOmI0t
         X6v4Yg2uwxFdp9pLmpzrq+qR+XziPRmjVJOyfi5vj/LbumnXjiWtRVi+X8PjangwxrtO
         jg5n/j4S+hdOwvZqinOYwKSL/e2MK2091vXyzvODFPXVSXXzfQfITKPTRb3Z4U0bvuki
         vj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941303; x=1784546103;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rgj1qOKaATbq5epILLAkJgdwBV26F560LVvJkeM2a58=;
        b=XWwWEYnGYZqzD/blHPilsvR8F8XCobDgCUrT3mgovltTmx/kRGT8N3h+W9ECWbAzFj
         FIIvemgyewwX7uq9gF86VXsC9qDfJIitiNRKzQe1WlYdV29EGfudaNHsGtqz/4OiGdLx
         mLvvBT+EKijmEGtzYtCcr2yECGea0k5XSLrwsnHQIFx4vgfX+6L/l81NSh/MTdLNdKG1
         5vSQCyoCWMwbH6kqXlNOm9er29eIK8GeyHoSmc3XTfL/jRNzVjI4HNVi89JaUlRibHoV
         Wa5mTShd2SmvvLPZK/1eXncnhbYkMy2ZkTvFi1UMBFiVHfNz5bVEgfFkxJP0t95C6IVJ
         daNg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/JfCzndeSRhbTnDQHSqQJBG9UTYRSu/wSbUZMQJcXehs7X2KE19lQ6S4u3xnujhUVczJvT85m6LU1Zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwicR6HuEksjM1T5R9chItQ8MOLiegikT13qj03xM744i7k4oel
	pusFTFOKvHElHFJruxcXR0gwNuESn6pdzx751/p1FCn+Bmn+ARirkZ9YnL2RjOhkQlBh6zKtUB4
	TBmkDp5QBBkGf+FHLuwSTHh8oq7AGREXUvu+SyS6aL+a1ELFK7vYUQR7dz1j3ETJ4mA5fZi6Ohg
	==
X-Gm-Gg: AfdE7clkuPU0Ykjyatg5mgms7XZoMTUyUeATdLxkrTZy/cX+kj8dPB0K8Dfs1xtOob9
	5p+V/dMwARpoKp6BptWd9HMoebgNBiu/a7fVGZajadVzEbD1urJ6+aX1c3YFS8i7dLfvcPG0XRH
	85bb/nmudnfUiYh4nE5I+IQXjRHcRhbn+ZG82rBXKoizQWwlMrNcozyUFkFNLFw10a+Td29B4qb
	3g7acu47pOkZogdYHg4EkRIFY2yZvOQL8im7xQXZzJ64r1qPta/l22MiAUqG7s75YaJ5ljrdtkd
	e6+1E7LMJxIYmSWyC9RIWMHr2URsfvQGxcRek6FZaRp7c4soDMfXwmeaXacxE94hFNBqZsvF+7V
	43ktBzNl+wMHZtHjL64lneMOQUdb1Z6LjJGb4j1Q0
X-Received: by 2002:a05:622a:104:b0:51c:7b12:6006 with SMTP id d75a77b69052e-51cbf30e6camr75201021cf.82.1783941303174;
        Mon, 13 Jul 2026 04:15:03 -0700 (PDT)
X-Received: by 2002:a05:622a:104:b0:51c:7b12:6006 with SMTP id d75a77b69052e-51cbf30e6camr75200691cf.82.1783941302732;
        Mon, 13 Jul 2026 04:15:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/5] software node: provide support for fw_devlink
Date: Mon, 13 Jul 2026 13:14:43 +0200
Message-Id: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPIVGoC/3XNSw6CMBCA4auQri2ZPnjUlfcwLqAdtBGoUi0aw
 t0txkQXuJnkn2S+mYjHwaIn22QiAwbrretjyE1C9Knqj0itiU048BxyUNSPvTNIm5EaDK3tz1Q
 bXRotMdO1JPHuMmBjH29zf4h9sv7mhuf7RWDL9qPxNS0wCrRWAFlZS1YKtXPep9d71WrXdWkcZ
 EED/0IF5GsQj1AjVA3KZMAY/wOJH4jBGiQipJRoBCsLiRJWoHmeXwt6wtlLAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4372;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YLnhAMXI4o2AsIjbEgigSwyf7yABdblIj2hdQJTPptk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiqQid0Q77ftt1lnoC6AM0NHBQVBZBRas2nb
 kbjd9hnRGyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIqgAKCRAFnS7L/zaE
 w8/9EACFncG4910BjZ31n/U8MxKfQwUv+GZn7nwtooUkAcwEPTFPdD/bwKBS5i81q2UWPuk4tIX
 56LdGr431fUNNlFuX7qcFZk/HnUI6ppxkURqLuX3RLVkyT9zxFxHU+rIFk+A/HeRF+Cla3HXqeU
 8N6ZaL3Wa/LSS2oQKsq2EsygnuN7E3i748qv73XVCGXul/pyCXW/lC++Wm7F1GnKcx4Wj5KCm2U
 syY7amtwjdPnMb1kmCbD6VuRS1pODWnjamBmedP/FNdrVy/DKxWE12JFQoTsYunsiw4SPHoU6kI
 FvazB3sFh2O8mfr+V83v60GAKZr7N3I7rIXZ4K7kYj6zi7lB/cosNlat6MZR/JwbAxKVLfs8x25
 6BvMaXMjqtQYPKYkN+WjdS4BMewdSpIwrwm2Di1vMUuAbpsizSG6TdUNw/b/reOwFbP9s/1z+vu
 2qabxUx0ihiV16OyGagUBcOX+eQf6qwFzBvslWqOgc/Kkj9zAM7A16y1UfE48YeuMPJh4SsIoIz
 zKNBZX70gwt3NRqYTH8XVh0hIvFi//oupq00M0L/MsxBiQbSDbmde1FKdlgqP9aMIjmsCxqEApL
 lqKiM3YBT0smgDhi61VPttJ3gnjwlRU2BcuMTfNc9rScViwpcnSLCyJOn0as59XEY+MXBLxpSw9
 TcP8ezoyYFLe0uQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX0twx9Wn2c/eO
 uGy4nwF2r22YXdFCpO0/tLRV0FmYM1+6wzybRDM0COB52srEsEyirAhizx/Lls5Xelsyp+kIsty
 jqWWrSxi/ohJEH9C6jyIMtqfQYYsJkY=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54c8b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=391ekyBddxe_bKEp6ckA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: Zb4JbuI4GSqgDPZK7GZrIjt-XlvsgU3H
X-Proofpoint-ORIG-GUID: Zb4JbuI4GSqgDPZK7GZrIjt-XlvsgU3H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfXxp1YqtOhpwV3
 BPSDzXxEWl2caKQHx0Nx5lwkIfe2CUoRcq7leTorC7i7N+B5/UnbNyy9b/+wnPXpwErg5LnSh+n
 R0gj3PhSWzqKhcN7XP6MIYg0op+d9YzN+eF21g4qMKMsb69KclrDiMMx82ma70EJImk/k2r17dx
 PSyB3Cqe8mzfKjAhYyCj4TZpMIV7FM4Qn0RboqmBR9JdzXVzJ6tRH6igVEzZdhI/uyvWQq0vuOC
 3WaMiFIKYtjtYV/h5d3pvIYsIw/D2dDFHX2vBpcMY9u4Ubft/PM9YgCwSDUNO0e3LYlspE4Y4DY
 XTWzEwdXeX1Ihq32thIQUa6LJm3UXY/g3zGbcmb1D5ekAI0dHlSeqpzvvmaVxNd1ORflQZVudPp
 MDjlk+SsWOt5sBOsFM/IAvmAMjm9VYm0wzRKHwhxQUSg5lJnQSI6sybaxqewSuPuCZihlvcsyRh
 MBAPPdQ/Q6oN0VrwZzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130117

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
Changes in v4:
- Extend patch 1 with an additional kunit helper:
  kunit_device_add_software_node() and use it in patch 3/5 to fix the
  release ordering
- Fix a memory leak in GPIO test cases pointed out by Danilo
- Fix more possible device_link_mq races: extend the coverage of
  device_link_wait_removal()
- Link to v3: https://patch.msgid.link/20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com

Changes in v3:
- Use device_match_fwnode() where applicable
- Fix a race between the actions on the device_link_mq and the GPIO
  test cases' swnode management
- Link to v2: https://patch.msgid.link/20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com

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
 drivers/base/test/swnode-devlink-test.c | 337 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 291 ++++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  29 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 146 ++++++++++++++
 9 files changed, 885 insertions(+), 7 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

