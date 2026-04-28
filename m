Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D2827AC45
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368042; cv=none; b=hgoZlq7ql4rxjUu3pSNOR+NaIGCDqtz47+SyfUvK6efA6nJOaz08HiIbhvkiRWp7uzZ2BldR0dfXHlnuLNJbgY+WPaPZJBovr/Uii6rsHUHuhYR5yY3c71gacafIwXBsIWLEYOLK3vB917Rfj5vJDI3B55JC6d/pQNtaY6bqoSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368042; c=relaxed/simple;
	bh=v704HvQFpji85zqtTx7vFtx2qOD8lmV93/eij/QpGA8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X6UWKEdfbzo7Bs5Aozd8pqw15hPsHA5kmN/6PctUMLf2SfP9884Q913uXLnmz8MNY5FksGB38S0Jm0P4JbQkTC87/ML8gNjgRD/mzQEKAm/XDymMuteIXhU0AhmsB98LPWQAqouJF8moGVbfrXsD5HDg6MSDy3md9VLhJo7dnTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNnNzm00; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TRu79NF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNnNzm00";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TRu79NF2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S42uRd1329549
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZP5Mct8DuDFqqQxiTfCUuv
	QbXOYwpRO1ngaXvKtcaH8=; b=gNnNzm00R8NbUUt/tvD1s+CpBKiQJpPuioIVVX
	rzYMqvsf0BS1QRhl1XZ7FyLlKZCqzwAitE5uVGNjuNoPnCn62zQBpeiqJSy1GNok
	MQVQIKm3y+8VNibsKdukdSp/Q4WuiWRIFyGWfzV93+CC+i5GbCba7swJUBMHUFwW
	sxcHGMAvemLYD3HPPnua8lGV5Z77STu5H+k3yuFKjVNXnn7QI/b8AakHO/cU1lv3
	cs0acSZxUFDMScR9RAMQC+yMpPE/oIy23OLDo2hLUY6lVfN+xGeHR87d6z4Te8bg
	D50xLs9X5DtVIPxhAhSgNJzuvoGdGnPQoctaW/J8nVZKbvcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhah4n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d60fca52b9so1581779185a.0
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 02:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368040; x=1777972840; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP5Mct8DuDFqqQxiTfCUuvQbXOYwpRO1ngaXvKtcaH8=;
        b=TRu79NF2w8QxXkavAcQPmRrwR/qE4iBTY10lxM+DilIYJqOKmIWYxJBHVGetRGrvTV
         ox2g6VZz6i5VTrkQhblCDFO92Lk47Rjp2P0W6MM9YE4QCjK6SqzOuxnYz7pRmjGUzFrb
         XVLm/Zw7t2NlzcU8DTiGI3P2HFycdZPpLaqdpkTkTTOTxmkoC/ZnWuGUDkYyMjWSoDMq
         sIdfPB1wtD6rKZ1jm9ppFiXPXFWBefkdl3UQkw5OaZPCqub4aDa5m9RL2w0CZSQyiy3O
         p2FpnCuar+btSmzGMrUT+sA3ny+326SV7pOypZWMaU4WosHe34QAN4FeWe1K5pHtAjim
         sCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368040; x=1777972840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP5Mct8DuDFqqQxiTfCUuvQbXOYwpRO1ngaXvKtcaH8=;
        b=YQ2wUSTR4cSmXraAtiiJGR3X5PK9ktPYxFYXYTx92lh19pirJUjalv0AR8h7/bg2G5
         waG5nlCgHwe3uJZxvUsYzRQI0yLs4LKGJ8jByEmv/45sXHmx9GsiZLFP8ugZTrC2eiuh
         CVO730kGw/Sraa+ZFw50txFb/BEK3GnYcuRyMZekvhxOHbc3rvAX8SzH7RzN6o8x+dgS
         UtFq/YrpKUGRVUtABCXWWyhn9Lp8oN9RMPvGaEzalMrMtCc6IyK0iBi8uWj5bHFchjQB
         f6tM0gJv824UXWPVqA7BKJO5Z5k5Q2i0w3J6AJ0mEQZ+m7gqBBgsVUXZGPw1D5NWuLp/
         myxA==
X-Forwarded-Encrypted: i=1; AFNElJ8Sgt6e/BH1fg1NcA+dHLQmhzfF7MOWX6XxRSqtsXr5ycKCM/yygm4Ulqk12kLJkTGz3GHT1XqVyjAOkw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm7QRL86EXTNIyw+M8FnfIyX+ZPAmbyv8Atcbl/5boRgkCoK5x
	Dsvxw6+nMU6EIetRq4wpYhWds/O5utErh0pq5wKsb8T3ySecwMOzt/DeSM4J8Ya5aU8ztaS6CTP
	+LGmv4lPutsad28vrsM6kMf/jPbhL42l4NP9KAEkiUiLxglmO2InEbe34k6U5QwyY1Q==
X-Gm-Gg: AeBDiev/T0Tu801lo2MrwVuiibQ+JqVAUItAIt8EqS4KCzQUrkdNQPZsVtL7T//nHgk
	db7Jntgq2OjyU9lScBjEps7UuH/awhp+Y9iF0CxbThLFDt1FlZhlvuGITE8vx8njQcn8d0k6OzY
	Cspa81rr4UXXTaDcmg5hZpdm1VpskGfLXjQPI8P+rES7/tyHlWg9fbHMiRgbni7OSn8QJ3H+JYr
	swuMcN4f12LoPGBJXeoOZLCJ/KM/O53ImDqZ20MDmmRv3MMoz2TwVK3OStQ+uMxaGEYp2LkGva2
	/l2nrsAC2ncz/ByuT2TzQ3eu7DqONwjboYDupgsDCvRphxfB5mIWmlWdGOgKA/iOKSYJI2/IaNU
	J15AdKwoq60rgcO6PxHk4o2bdFThnRs57kKbtCQC42rzUx55+Pew+/GSZpwXW
X-Received: by 2002:a05:622a:992:b0:50e:614c:661f with SMTP id d75a77b69052e-5100e12e8e4mr25846281cf.20.1777368039605;
        Tue, 28 Apr 2026 02:20:39 -0700 (PDT)
X-Received: by 2002:a05:622a:992:b0:50e:614c:661f with SMTP id d75a77b69052e-5100e12e8e4mr25845911cf.20.1777368039132;
        Tue, 28 Apr 2026 02:20:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm15726195e9.5.2026.04.28.02.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:20:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] driver core: remove software node from platform
 devices on device release
Date: Tue, 28 Apr 2026 11:20:25 +0200
Message-Id: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANl78GkC/43NsQ7CIBDG8VdpmL0GjlaNk+9hHApcWxILChY1T
 d9d2snBGJdL/jf8volFCpYiOxQTC5RstN7lkJuC6b5xHYE1uRly3PJKcIgP5w1BoMEnAu/AUIL
 RBeqgQtXqSqFUzZ5l4Bqotc8VP51z9zbefXitW0ks37/YJICDNjsjed1Ko/DoYyxvY3PRfhjKf
 NiiJ/wQUf4UMYucahRSG0IyX8R5nt8Rk9EDHQEAAA==
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v704HvQFpji85zqtTx7vFtx2qOD8lmV93/eij/QpGA8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8Hvdv+9Qmy2YNzrX4dczoJT5DG6vM48Q++iAf
 7RMQ7XWHr2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafB73QAKCRAFnS7L/zaE
 wz9aD/4uoiKcai17FTePdUWidWatRsIaB7v2AHMZGpprkIyerzNBXojc4ZFIO3rNmUe0D7MG1zf
 6YxLf343oTfoVkvXrA5CeigceWsjsoADNxEUQQDuQwWpo/mMNZ6jli/XSSTxIEGksfwtZlDHw1H
 ftcihK2HErY0a3w5+kgQ3t2n6gUVQU/FnNNUJJOvVAm4OQqGhOLWFkxyDiOnvwch1RDx6EsPKDj
 yj5KKboIQLNflgwLk7a0i42YdywHhJujQlc+vpkPcRzZWA2kFwHGG1qG+ACcikU7ZJLoxQm5LFx
 KnNRPK8o3axXFVk9+j2xBquoakyuJBJB7OBAVObZ4RdhRegvpAFOW2doAfqQ9SbWKyZqe1mU7Ti
 uOC9iUr02TX39OCoFd8ucFFpODqUI6kRbmoQ0nBiR2Dz4vtENRyqTJuFvJYkQZ0l/xZ+mSoBUYG
 cmu4Jv0lrG2BMKg6/zFNElVLNyOQ2/PUpNxWuzClhspfkwGsja0S7tPBTCiZNYgoa0bzm9aMeG+
 VH2JjxlEvO8R5LDOGMCAI7lW7SwJsrQ3I4R1pgyRYgv+u9Lux3i9BZ3aRaPSdo9gqfqpEwr6dC8
 7QEWbAxCEpCfNXpHyGPLMOJvjs6ltUESiqFqZquWS8GqvYtn2ELUO7B2UMxAb+J2hbc8KspFzBm
 G6h3KV4ElO247lw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX6SV/ha2JGaS+
 WjfemIZwAlmPi90k24G4wLtl+RmbKGrYB8G7JaoB6LHl+kSSrvscZRR5oAT/WoKQf0KICizjAZs
 c3D0PO4UJqgH8u71Lbsw1S4hXG23R7pSPy3GHUu7tZui1PHq3wZTrSw3OGlr4pn8h8jszBcvZdM
 A+E+/UghWlseT15uZgKlI4lPM4+CBAuT+lt+HZO3ytUkmqxze3abpc6Q/FaN4vdBmmI/Uabh4x5
 vqEW9ei4laU2ZJ55da2FMDa52QoItLzImd7zZjYrrsNlO1UxG0upQT5/eu3Cqfq8JcWi+HNmenA
 XVFqTHMV11UM9iF9CR9GKMzO3pVw+SfuoE9cX/ziIdgc8/W6eQuWQz0mn7SXSJ1ExnkaRA9O7O7
 Twq1kr8qFnkJi0jsEZYFLYJydTDkldoT2Si0xK1YM2bjnZSPjeWgYezKs1pDef0mPLMoWHLptzm
 FkN9EU7SxLPbOnfIYpA==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f07be8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=lGtSNjaRAlEbDfKVVA8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: ZnTJ6CGCb_QOIHuAdJTVPqkUjsO3v1vQ
X-Proofpoint-ORIG-GUID: ZnTJ6CGCb_QOIHuAdJTVPqkUjsO3v1vQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

The second patch adds a new kunit helper which is used in patch 3/3 that
adds a test-case that can be used to reproduce the problem and prove that
the fix works as well as another making sure a corner case of using a
software node as the primary firmware node works too.

Merging strategy: patch 1/3 should go into v7.1. Once it's upstream, the
first tag containing it should be pulled into the driver core tree and
the remaining patches applied on top with an ack from the kunit
maintainers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Make sure the reference of the primary software node we possibly take,
  is always released by moving the get() before calls that may fail
- Don't allow passing two software nodes
- Add a test case for that situation
- Link to v2: https://patch.msgid.link/20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com

Changes in v2:
- Change the order between removing the software node and dropping the
  reference to the device's OF node
- Address a situation where a software node is used as the primary
  firmware node
- Add a patch adding a new kunit helper
- Add another test case
- Link to v1: https://patch.msgid.link/20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      driver core: platform: remove software node on release()
      kunit: provide kunit_software_node_register()
      driver core: platform: tests: add test cases for correct swnode removal

 drivers/base/platform.c                  |  17 +++-
 drivers/base/test/platform-device-test.c | 156 +++++++++++++++++++++++++++++++
 include/kunit/fwnode.h                   |  19 ++++
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 +++++++++++
 5 files changed, 245 insertions(+), 2 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

