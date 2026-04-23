Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE63EBF2F
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946343; cv=none; b=VA1QfyIwNsugxbaxIk3QtNfwlDExDdpymHqRKqify1KVLNucXBRjcmYn7s8uxUHr05NUkMePtk2mj9NfqgfT+t2FG5HZFOpEs+8XMrLGjBrrw12oiO7L6F9E37ipsKvj4ur7c/uR0cFmDl4Tw1n+8dmD2nzb8JW89w0W0+0MYaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946343; c=relaxed/simple;
	bh=TvAvtEEduAO3Cmm+l/HLnOozcpsitj84g7KvLFCDf3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oUJtWwY4TmS2NGPyIJesQJVFqEeBlEfvD6TOwL9FvSsCZMvWQ6liiZcP8n7R7eDUzbpB1XHkve/NQQKIjl5cFynn2KyHONL1e8aobNdLjcSC9sxSHb0FjKJy+Ej3DqCZoUoqCueyUi7BlQbUB+tKmOB9bPPZRkMB7IKYWc3UvxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K53b8g/Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G99NdxL1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K53b8g/Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G99NdxL1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uEVG3044055
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9utNRt0442ZMWfVuXusZbM
	I78VTB0ODYf5NvWVk/l9w=; b=K53b8g/YRmqa8J5pJkcyQckwhfAqL3INYF6n2Q
	z9sUNOzx0sYufRQQxPZ21SYN5DnU7T1aZZfqbruWbHesJc8sYfcfgxhTVKu+bbJI
	fyDeeKdUTGXYU3O8BN+/wQDtwVB5NftP9v/AXttXlVQyo1JoWr3p1z+IB4lcr1+2
	m5UpGZ6+G5z53fDdP/cT8Vl9NJecMCI1Gn1pqjRlMVlcx+fFxiH8DTD6/70IQkHF
	sz3foln25ZOwgLi1KZmDrpFiglMiTVuQYCN53Szx2cl7VoEMrPHWqzA8I45fU+FE
	1ze5J999lvGNhfT/3EjyedhPOXup4cUlp5mzr8aBwdYI+BJw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3t99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:19 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6102a8e6eb0so3430152137.0
        for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 05:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946339; x=1777551139; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9utNRt0442ZMWfVuXusZbMI78VTB0ODYf5NvWVk/l9w=;
        b=G99NdxL1kgHPz0cyrIVpecnADbVaTqPkw+rACTzCgzfIV/sr3U7ipbClefKd1jCLYe
         F8xLvJq00BmT9NWv0l7+ziDoWKbxxdGmfyHtV2cJkLkLEsFo4+1c7euivJ1lXFS/bn9s
         r+Codnfw9R69p1cvdjzGHDtDXp/H7GTmhyurEaICCuGS3bdxYQIhK6VAUAKkqnN5aOwt
         CKxOoHQLhPPRsReCaZNrSd7XX4D4oxSpUf5KVR+dehMtV+gixKbHSU16l+gkjjIW6JLn
         3DU4zoXdyw/JpOADUYD3Ll5CuOZm8XgTGA6oThQU/oagCpwXiLiXd/UOsKYJldm4aEn0
         RX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946339; x=1777551139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9utNRt0442ZMWfVuXusZbMI78VTB0ODYf5NvWVk/l9w=;
        b=HbzZMY42/wKY/ignVuyiiO8lr/mtbD0VdWKcOL5hURKhU+0jcWUJ4t/K6J9Ij4YJzz
         mqTBrHmZtXP3LREzfaTQGDpehmOgrpg9EyaKl5QQzVegaYKTL1IpzcEi7OL73DT7TGrh
         O4tvkRtGSaEdO2l3keLMyYvEJqfCcPesUgO/fW6yYVQ8kdJq1V6zHrBrDixrLlPu3sfD
         yjS/KtLPWlOxtd23VYhSH91aCm0qEb6BKbEicuwPko0Q/8jzGRMs520+EurNFbpqYrya
         T6s8tY8pVQ2oFSPGyUj5fFLZriZhxXLTFCAJC1TUATlKCzrTJpKThd+rZNA+kZUSYPac
         1Yig==
X-Forwarded-Encrypted: i=1; AFNElJ9ZMr9GIzk3ixnJE/HblCQ7G8vU3fEian+BxCA0p3otv40os8S2BB9iRRW5YkHxlgCarmMw6CiaD3uQjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yydi6u28ZBJK7Yk0hNR2b/VEUY+VmYt4rL5QJHy+M71YN10w9ey
	yh1uzGIvsQnsZ2gbwvvu0Nehxc7RIeB0mAX+U7UsKToqNx0kC6xugxTWamIf+E91VKkyy+af67S
	h69YNKh+eKLNDzEhiNdbvu4Hyq/80/Uj2v2K4czMt3tvdVllSy3Ft0PAtGfY0eJtVwQ==
X-Gm-Gg: AeBDieuJfu/WQvryCaFCvXazxt2lLQONz5lOgAMiHjFaqrgtdQHSkffVUR0X96RWOfe
	SoktickS2C/inTErYgOc+Q9i8mfZ69mSFVgImYl98M4j4QUu3iTQlV8iTATNTB4eP80QQb6EVzk
	4smqyFSOaQrU13dIKE7GJiPXXiIdcm4+9w1lqK+USlAEMG7aveFQ9wbGcfDoS/UnCS3eZEVX9ff
	l8xHhxBxSKA+5OCwTauCgbwgVwF8tsQ/YCgYioFGN2R8xzzDOVg7sSZNz+VxWya4uCzSWWpJ/jk
	xOk4rxZkF9yAL8PlldTJeaAwA829kVEZxcwpfb4Uj6H65PQ7+mQPHkqg43dXlyup0O3vZCn/tI9
	zyzmCSLUCbmjsWMTdJgj0u6td9zowA/IYntJiI8pG2uUQQg+0jf4g1VHbJX+plQ==
X-Received: by 2002:a05:6102:290d:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-616f772f7d5mr11773575137.16.1776946338813;
        Thu, 23 Apr 2026 05:12:18 -0700 (PDT)
X-Received: by 2002:a05:6102:290d:b0:5fe:f4b9:fe2a with SMTP id ada2fe7eead31-616f772f7d5mr11773552137.16.1776946338340;
        Thu, 23 Apr 2026 05:12:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:843a:1e93:1fb7:5d86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm426273565e9.3.2026.04.23.05.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:12:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] driver core: remove software node from platform
 devices on device release
Date: Thu, 23 Apr 2026 14:12:01 +0200
Message-Id: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEM6mkC/42NTQ6CMBBGr0Jm7ZBS8CeuvIdhQdsBmkhHO1I1h
 LtbOYGbL3nf4r0FhKIngXOxQKTkxXPIoHcF2LELA6F3mUErfVBNpVBegR1hpIkTIQd0lHAOkQZ
 stOltY3RtuhNkwT1S79+b/NpmHr08OX62Vqp+71/aVKFC646uVvu+dkZfWKR8zN3N8jSVeaBd1
 /ULUR06OssAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TvAvtEEduAO3Cmm+l/HLnOozcpsitj84g7KvLFCDf3A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6gyX4f0AqJZtoDVOO9albOmAXIePGyBT0QbZM
 WtlfvEgx0+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeoMlwAKCRAFnS7L/zaE
 ww8jD/966ohKNrL+e0etDxUq9YWNClFh9S1gqy+dz+Jc0U34nqrblGLTYLTVVB8JEzuo9J4Ofgy
 Wz8r+enkzLp8Cv4xO22p6xpVu4Tw8f90OCFOtza8JjION69s4OKWM+l7CEiC4HiNeBVLxJa4BTR
 NxtA11a9LHgQtHXyXk3TvU457BvMMfcTm8pPDH8ghnOaJmRy4QEj0FLqd8RpRgrqO/VUJkZs4Z9
 7I6fVyBJERCSoBWFZEHOsfWNtOk6j+4hkwwZY9FptLTTt4NyeOSxkPJqi6MRyIZxOnh4aL9/ytN
 XaiwhQ3eNIdeq8Jx6JKrwhDKqVyqeknd2/nwkH5lAB2SHXyAB7RxEI75elXgS/zlKSGRQzj33+X
 4IrYFJ0oMc0ETYHfzq9kfRjXGXOogdqJEi/cWYBXk5Zay/fgpLGGHD1h8B98tfO47UKufHYSQ6p
 vdf97l1K1d7BASJf05fktkTQJy3hXMU4KYIfM9AviwQYrzor4JbF+hPL/U0soKrhWD11Gdk9jaV
 XUJ1yquW2YKFblHxGrWo4cCZ2myfSDqUlZCdegtrqjIUnH9rFblXiDtsbk4r5cbdTdUGvldc70q
 xtl5bsfrDKQpKsqyVpip7sBo3BhDtYIgrHEOyM2iaNKMSX6erjH9KEzUj62ww56/vOxs8xwrOy3
 YlinHL8MWm+9hgw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMSBTYWx0ZWRfX2i5B+z+kdQwU
 gjRd+EgakLsUeF9URaVNqQY7FdIgmgY1KBB9METmVApxZbYIcGCjrqEKiKjaUFLqMCs/YufoZlg
 Xm7VVzhCRUHnfSaZrXsyt/d7LWd2UMxHLBiaO/jw2dXANHREA2e3F2e+yKOy4JnjVo+TC6rs93u
 e5qG2WnwUCTLfwcBGq0MY8dK6vN9AxByceC7SySun5h+fre2KQFeJ84b3+KGnJtHCGkgc1xic2w
 dQFjk/y0Fm2bweNUveUI+pHOzMw/d8NxR/GPULu8g80tsQan8hTnIDAdEWHVwuNXRmj1bXJyO6N
 ws8byw8CCuDSgLUtSWgVspYTCQVPlX2JAhHJpqrgVdnO+JM3fvFvk53/F22DVVWbJjYG+eGymqD
 HcAGFzJ3+UrgM3M4PrnDPR6xQCilwSAQxEr/qNLEdtmQfKASlZHEdBESmUtW22iN2E57r4DBovq
 mDPCxow8TP0ly2ScScA==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea0ca3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=arlgqegt7JSL4kvz61kA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: bcrvqTSEuw9cfikhSbjEBbTgcQtpYI3N
X-Proofpoint-ORIG-GUID: bcrvqTSEuw9cfikhSbjEBbTgcQtpYI3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230121

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

The second patch adds a new kunit helper which is used in patch 3/3 that
adds a test-case that can be used to reproduce the problem and prove that
the fix works as well as another making sure a corner case of using a
software node as the primary firmware node works too.

First patch should go into v7.1 while patches 2/3 and 3/3 can be queued
for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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

 drivers/base/platform.c                  |  11 ++++
 drivers/base/test/platform-device-test.c | 106 +++++++++++++++++++++++++++++++
 include/kunit/fwnode.h                   |  19 ++++++
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 +++++++++++++++
 5 files changed, 190 insertions(+), 1 deletion(-)
---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

