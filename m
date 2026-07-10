Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612D42AA9
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691510; cv=none; b=KHg6oel4tC7ERCVVpWeHEPWltFXgdmn1IfTN45oJKYd42NKvN3vObGDyggTV+aojQsJisNClDfSFSYt5OYucFONWOBof205MBG0TqOiM6cMIJfVzJXwfHnFlWHCAOaWQOQXOgtTjt2Nap4+yo4nprGJLASSXvPqO4FfKfTPbogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691510; c=relaxed/simple;
	bh=neo7zHO1q22f/Aj8nISxBtgyyCitpGrHRzWxXr7ijA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PBp05svdMtoVt9/cRbLFFk8i+fDGnHzMetkgjkJB+IV/oOGnSyKmz+VrAHjdnmwHLzk2XaTVisOPccKWDw7kJo6jojA+9hVRkdX2y/PSJCuwcC9Fwr447DfYvJyVnC+eyoXNMH95XvQCmmFK5NfhhSCtydIn0MMrToFMUGMqxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpI3GCWo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePokH8Op; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpI3GCWo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePokH8Op"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD78Cw919608
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IsDPLn2lxw6fgPhVuow78b
	DKudDYUVZdfPodAAJcnlg=; b=GpI3GCWo4qYF8lG4IA7aUoXMwsJK8fc6WcX8vc
	3e0iA9Z2CKwLGwwxJAbklvLehOq8z8YiEQSsa2Hi4pQiMYnewqTsgHltwxBm40R6
	qQQESFLSQWfwwij9jFEaDNmDv3/Crr4EnKNwO3HsewgrjUQJk3S15rJLlEWK91fa
	419/C8M9lNGO7GX1jPhy55fePpcW8j3R2qh8oazr27yLgNSQVFB03PveuvoBqKVs
	9KyosVczGwwo4pEUcMhy436XfVSznR9VU4ODjQY1N5iYD6klWh9JTwQnOOcQjLtn
	qPo3fSZfUBXyj1jb2vQSPepfL2gO2ZRWJe94mLacbSV5TzqA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n24ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:51:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso24982681cf.0
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691507; x=1784296307; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IsDPLn2lxw6fgPhVuow78bDKudDYUVZdfPodAAJcnlg=;
        b=ePokH8OpX1HZOmVkYGQMjhjME3a4WnCDNnmJaLfrgzC2+udNkou4drdPrxz29ha1r+
         MKaay77N9KCYQFG+tjUPGvazwjlQXhCzDbuI1Eoc3ne0OpwrIVQHTf1wSI5W2P68a7vO
         63LigXLndRWWUAC29nceWpgC1GFu4t0qC4F+rSOlHeDwnu+V7wgyMpR+u034z01tZxOK
         5mC5nlbvsAnfyk4srZJTUVQfbPTyRyBhM6hNqpPqZz387c1YuaYOsv/EZwT/ikEkRjJt
         IG0XnPRrIgbXgBhM/XxZny6fM+8icP7MuVPbBEZc/9g/6Ce54FloQYg0hz9zT5ph8luF
         7pYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691507; x=1784296307;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsDPLn2lxw6fgPhVuow78bDKudDYUVZdfPodAAJcnlg=;
        b=cskN9CiazlUHDcpe+aQhGiwPFXHVpamTK3m/EYBSrMbGV+8tnKsAO3NpZGCMUzBobz
         NehOswL62mc1irJ0niqaP0iLZj+08IDsaUDm3JkftgKs3937wF+QhrtkmJuq1GP4ZVNl
         YBT1xDUJdPXlwCMvzb/tYXTQTOKyDGRu/dMpqmj141sGcFa6GeNO3nCZHAwH64UPT3vC
         49JUqzTDjeKMtVNgvGljDk97IfF7pLQkM3uASQ2FXdD3lb+y0x8rpij/rL1qvnOGGlP2
         p+KAvrOlIadwetHMdHygfJFQWkP0K7LBJkQwtuihQBVibWFJLeC92lM3ajf4ghXgnUkp
         OVRQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+tuaV/13MaPfZ65jPvfoZuDnvAM3ZkGsORzn/8jQxfOz3u4EhKJjWaEmi7CFsTQmbkp383e81Ri896g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGQETczrIiqOsCCM7NvJ1+YBsq6hsm6FraGB0vgRTj63xaj9Jd
	IGkBthMnSyJFHb22ayCS+Ddkj8Ftg4KbxH3tkuG3jMlPs42R0WKUBo/k6kfSNhlSoti4yD7R68A
	g+ALIcrGHiucceFbU0qLf3YZ+TjyQTi/WfkW0J3MBT0CXhqm/q9iaojKvBIeGGaizug==
X-Gm-Gg: AfdE7cmI/AN8MA/Pbb7pJxo1glHXFFt67PP0325YZ6wOXNtcY1qMZdLB+B+POJ2mdau
	GygCTB7s75s8CepGPCUIRH8rYVpO01nQg7Lo2a6RR8m+vujvMv7O3A9wO433BHPOYBohcFlK9CV
	7uhDCUVOKi8eQX9QK/wRVpd8QTPqt7H3sSzJu7bOZKsTWlc5qDpc4SlWFRJJ5B088CfYYIsUyv4
	CBoUKlaMK2oFf1J7Ri21LeBc6QwNw6PDc1mU6ow9PpgEXQzxPaLXSl7Acte0Mvlzwwp3xnALGsx
	4efeewpRCOICCpilEFspk19yiqBAVpnUe+bubWwh6bb2fTE7WEJxi8DPco08bpWOX2zjh6Fndmu
	BsvZ4VLnC3ytE/0l+3MPVj3U0a427asqSKmR4+ZnU
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr37155181cf.44.1783691507355;
        Fri, 10 Jul 2026 06:51:47 -0700 (PDT)
X-Received: by 2002:ac8:7f8d:0:b0:51c:7aa7:e0f1 with SMTP id d75a77b69052e-51caa1a7e08mr37154861cf.44.1783691506844;
        Fri, 10 Jul 2026 06:51:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/5] software node: provide support for fw_devlink
Date: Fri, 10 Jul 2026 15:51:19 +0200
Message-Id: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANf4UGoC/23NSw7CIBCA4asY1tIM9GFx5T2MiwJTS2xBQamm6
 d2ljYmbbib5J5lvJhLQGwzkuJuIx2iCcTZFvt8R1TX2itTo1IQDr6ACQcNonUbajlRj7I29UaV
 VrVWBpZIFSXd3j615r+b5kroz4en8Z30R2bL9aXxLi4wClQKgrGXB6lycXAjZ49X0yg1DlgZZ0
 Mj/0AGqLYgnqM2FBKFLYIxvQPM8fwHSVGPgAgEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3949;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=neo7zHO1q22f/Aj8nISxBtgyyCitpGrHRzWxXr7ijA4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjmjh6ryAQpnavue1CEEpD3WG6mmgQPBO2J8
 +YOqIF0EVGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD45gAKCRAFnS7L/zaE
 wwzbD/9ClSYchp9fPns+RvmXAQpK1xzqoPyU1vKbu5gynMkYlsxSABd8WOVXhZWC00z6yPdxcFv
 ZjJhOsW4Fvf0g82/FiDYSFKXJaaV5Uwr6aet6lBVy5ThMLU46BlkaEPGCkVaf9IJx5wC3hRHxca
 S1kwWM7IbTS1BIa+A8fjNRlz8TP9PlwuEKrOSrVt3U4mQyAuZj+0XL/6Y0FXjNpySKLZhyfylZK
 MRaZUUR6RFYHgmzIYoLBCtlUo8O6JfEnqZ/zMXAq4iVLTT4eIngstRIuUzvgTjF4VvMTwxUPC7O
 fnLI6Q4JL2hRbqBm8j1E7JbFYm+X1exIeLy5+FuwI31XY9qXX5gJG3JKZ6A232NQGMsqjBMjwCK
 5GzIuOvCefA1//PjZnrzhr0OkQvVi0mAOkEaH2rEp33gPuWtYw/axIRre90E0ZXcCoihTZIOIN5
 fwdDLKc6kQ7Wja2NowtvMQ5N/vYTg1Os6RA5R/U48ILDuXfLafSLW+JFyO9ZlLMIbbAvRcxbopu
 O3aUM6nE6GBFhQF5ryAZNNQ5cHYhS0I/NSiUCHovR+Os8YqFgYZuYYBQJ8iKrzImRhZSFEZ8IEu
 VZPdVO+kzLslXOnDCawwYzo4ZlTHVeawqUiHQuEqjbI1hLJ2eN7rQLucVV4nh7EbS0m3YWsuoKk
 B8NJmOGQOAPdjcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX8UDMSQMHnEGs
 ObUmD8M2K0wn91T5b4+NLlyKdrlBr0roarGR1iSRjNRWG8+It8i8HifDGLod2xk4k+8u3S58w/V
 Dy8oZSewW1HTqLMYgpFR1+GVpp4OINQ=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50f8f4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=Je3Peepqufej3slHyXgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 5N4Ceumpmn_WlPIJlEydtbMkotJH96-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNyBTYWx0ZWRfX5nBzPNyJekOi
 S7zQ15+sh9PSPTWdwFUtu0NsHOMlctGWMRkIGweL9Jre8e6FgGoj3SifBfbmrzesPWLvPNOYGM6
 yfsSaImxkJxAoNDJW5rFve/Hzra+9Dz6HpU5JXl0z1wcyXbevPPrCvuWVGpC1rB2ko8ZfldDWJb
 +7wtgXmhN/rfajH1hxbptqHOQIW8st4IqCM+h3zZ8v1hDNHpWoPZqGSJHEWiXFPf/7ZznsWpDKg
 ZwytGvofRXVHgf8aqAm9L64Us7Y4mdqnTdPj94fJPohajODDdFRpW6N5kV9bdOs0tb3Me7meCwZ
 ELxGi2aUWvLvAoJ/RORcUf4A5oO0vqPWguoBwZSAEZ6SR6V18Tz/e/Nx7fwrDPtD32sPK+11zSv
 KW/FU7xgSTZGyUcxYBIEPYDAgomgNfhZDW/VBqteA4GCp/MthlS7Up85mgdbmLMN/n82FW9vbn5
 SW4iIgTeo3wrThlFxFA==
X-Proofpoint-GUID: 5N4Ceumpmn_WlPIJlEydtbMkotJH96-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100137

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
 drivers/base/test/swnode-devlink-test.c | 339 ++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-kunit.c            | 286 ++++++++++++++++++++++++++-
 include/kunit/fwnode.h                  |  26 +++
 lib/kunit/Makefile                      |   1 +
 lib/kunit/fwnode.c                      | 116 +++++++++++
 9 files changed, 849 insertions(+), 7 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260609-swnode-fw-devlink-cdc8dc4e5cb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

