Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554C36681F
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535183; cv=none; b=IQzTeoCVbUKcIJRu9NT7LQqyi+LZ5SMRXDjhIBq0hiFuWJd+x7hb/BdMdGBPlnAdxWWVSU0wHX/AS3ETc1q5tbbzXXp5Rfo7+wGKmGEjNEsBSReZ7B35DSlgw0TGeEs/LTwHo14Je4wcd4BGHmnp0BywU/3TCKi8fu4xptE5cD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535183; c=relaxed/simple;
	bh=fzTDzlcTiurtcLcASnONVPBNJ/00AJpVuXeNhsjcsIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gsp75eT1mhsBAVglPkypqNo4ckwXF5lqlNS8/mCKC3/FQ+lC7sFkScUpjWIpXcS+l6mtN9oB+yPMEBa2ckO4WzejiZM0rfWfGFt9qJPdiRmSNkjmiadjX0WMOrde2tZMi+YhcUBkEhEZHGEg5MSYB/TtfwtsRh+W10b9byM2LCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAF3P/Ed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3Seg+wk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAF3P/Ed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3Seg+wk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U7DhNM3885006
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jmU+eTKeSzZsmZqsWWYjZP
	HT2G4lkCs2tUqdc/LTdCA=; b=IAF3P/Ed/Mg5ad2hMzjtfnhax/pk2i8UvE9e2U
	6rxDzTroCE+0iOOL+BbHR2FOMS/KbDpwMD8FfIOH9BmxsguuNMNjIP0Rn2A2+Kt4
	pFWzjAVvribbrG6404mWUaLvdcK2KUbXQh6qgaaHx1zLDWkvLpwwqwas74kK6s0z
	VHOoj0KC84WhELdcKQX4em5t/2mKFHpn2Jfw9HVoaiMeWDI+ed3VfO7mCMswGfNG
	CT+t7KqOKGFlu7YTMslZYKVI/xOuFm9e9wSW1BM1vDSG7fnn9iDaOuQFQn/e4dQJ
	ia5Qq9R0JsnfD0GmpZiWa37Skq2pYzeqvXsFmVHQE2i1LAng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dutmahkry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d58bed44aso14617571cf.3
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777535179; x=1778139979; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmU+eTKeSzZsmZqsWWYjZPHT2G4lkCs2tUqdc/LTdCA=;
        b=S3Seg+wkartcePCyz5oRl9iCnZZb88RepOTSRUGxhBdcvDIi9mLG0HVT7RxqfUFdd2
         B9SQVKlaNo4bO4J0PWeRl1O1Co3o+dOJTiNKhR3vmWQ3qcBlisakvcC2DPmf0MGCR6HE
         TjSKEPagoyxT8bPcEymdeOH1W8ons7ia69bd1+W4UgcJISICzTY6HtPEL9dYzPKjAg2B
         /Jajre0gIOQwfbfmotdC9jR2BkcN6QdD5PFPvEBGvKOEtZIU9fsEUO2X6K7vCRFxuP4i
         hm9XtZ85nT4yIbhRW+MJ83gaDMSr8bo62T9YS7gxsj4tnD9DqBMmfJmaxVeuQkRC6kJZ
         lZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535179; x=1778139979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmU+eTKeSzZsmZqsWWYjZPHT2G4lkCs2tUqdc/LTdCA=;
        b=WEDvjWfPOKGHQ5w8x4mZbXSApZOes7ZuEgaKsfDVtxYZKEfxvM9c/6Rv4xoGlT6ZF7
         LYYAp6UJ2vXjaBUuxbtX5D0N7/nATuzWk+/dou4H5V0Kipmf4n6loZacHPDiNe/I//5N
         CO9YgWSs3lsxAIOu6rLxuMgFH/tnDQBoJRb7jV1suDgV0uUbXx0hKM7H5loRWZzqG9qz
         EjIWHJo+3egqgoqlVOzyo6xaS8fXPJk6065siemiHgLdwC5+5r6ZWJRoLrosqj4m7zf1
         gn5DwdXIrL43DWKQtYoghZvMAytMDUPIgzyKCU8SZO1qIwdLdn6l2hw7L/0NoOpjeswJ
         F0Gw==
X-Forwarded-Encrypted: i=1; AFNElJ/OcALuigtDLKCkaqDLh4aN9/VEYo18O7jkUCrGv7iGd2aHdzVkW9l8l4mCwFknq0QWrs1ZLpuPu3B05A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrOJ6qD3ExGtyaTW0TUygdJnIKFWFgGEgQuYxB2zc/A0MHZbgE
	tH9VQZBY50tyEnpeSbIL86q/CjJCprJIg4FcBWcB7IAO5fazmpII41SFXUBaNftSzo7zSGLYMOE
	rG+j6vER7q7nT1/x/405WGMzMhzTMcaaXR/mgPecbrX7sJxQpFPxW9KNv+7tGAkF4SRaeRGdyDQ
	==
X-Gm-Gg: AeBDiet8BbS4t/5qVARIk1U1pXZHETJX6YntqoHkjZCAzQ3zCZ74JIuHokXghOO5xjp
	tCvomuVDOuW89OqSyhTflSQkj2gzTuyPr0FcH5jN077yFuyFxUe6Yq0dwVhdSfyY476Dz5fSr6U
	+JF++FAup57ButBdhb5K1POJaII56Hdw81LN71fnRRVGoXfVU9Dp4Q+Abfg1GdgB0x3Wuf+BkXT
	vH+0kkQw4lLbmv60A2TsDWlr69TGvu+1NQiOuf11MKBAu4tDTnpAaOsq1DoRnWWpiUYAvGmGXun
	Kgc8wQ3koUrU5eKOCF0S5mlh/pRoN1V+pNg5fWvm/UrLnHqA1wLtxyIPEXHm+qvuRxkNgnSdItP
	EY+s6CKdz912PahY02UqGqbU5CSvIru42Y3CAbcXaUwloFS47bjqUz2drvZi/
X-Received: by 2002:a05:622a:988:b0:50e:5e8d:87d2 with SMTP id d75a77b69052e-5102aad8465mr23395571cf.1.1777535179161;
        Thu, 30 Apr 2026 00:46:19 -0700 (PDT)
X-Received: by 2002:a05:622a:988:b0:50e:5e8d:87d2 with SMTP id d75a77b69052e-5102aad8465mr23395311cf.1.1777535178633;
        Thu, 30 Apr 2026 00:46:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm48714825e9.6.2026.04.30.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:46:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/3] driver core: remove software node from platform
 devices on device release
Date: Thu, 30 Apr 2026 09:46:03 +0200
Message-Id: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALsI82kC/43Nsa7CMAyF4VdBmTFK7PaCmHgPxNDELkSiCSQQQ
 KjvTmBi4CIWS7+H79xVluQlq+XkrpIUn30MNZrpRLldF7YCnmsr1PinG6MhX0JkgSRDLAIxAEu
 Bc0iyhQZt7xqLZLuFqsAhSe+vL3y9qb3z+RTT7bVVzPP7E1sMaHA8Z9JtT2xxFXOeHc/d3sVhm
 NWjnnrBNxHpq4hV1NKiIceCwv+I9C4uvopUxZbIspsbiygfxHEcHxtMc01vAQAA
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzTDzlcTiurtcLcASnONVPBNJ/00AJpVuXeNhsjcsIE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wjAOEs3Rp+hFkvwg+Te2zlZa3gEfax9fUxM4
 CFDworjaJeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMIwAAKCRAFnS7L/zaE
 w2Q3D/4zxEci4zkiPxu+17IZi5UGdCrQ+ksclJWcn101KzPnKcPiuInJzgdIVGlND7kzlP86vKy
 Uzyc9s9qbOxDhokTSVSaJWU68atlUbe8LtUelc/n42qkMiT4Zk8xYNuzkX3PbSHLQuDiOSkWkSE
 trwJvLuf2hKHoly7qe+3UVtaiwBAIDzTwFiVVW+0zGRQ97+p/OZQzrNgtDWpH4BpvcCGKRVlRRV
 6wqBmtKOcFOTNkDuClDhCSHfKech56AUs3ij6z0t53fkE12JGhQUAJGEuwtcqQz13b/QhhQCMYS
 AgIo8+fFtADB3C0VyB0032jQ4ivRmtlflzfqegUqJM64rVT/G9+sIYpNOFVb7hPW11tGyL6BJRF
 B3x0uf4cpFm2/B21mha9hIKF4gO7luPOSv/mPjz9W7u2Vqdp2CtnIncTf5qGYqUXNW7Kivh7wI0
 bs4PAVssxaeTal1pLCnI6oJbbazEmwaD21Vsj1myfpAxSatjMUN6pG0+yNfxNV+sbBQUhz60+GG
 /4d+20BMeDpyfamK5PlRAEPhFbeaIwTtxSoVe6scgjsO6BIOM0xohaQCkvUuM82Jv0xW3JZUjK/
 ZBjwYzpGWDi3n8/L7GMcIPmpe5C8zvbe5w3g2x+ARZ0HTI9OJru6mWMCctqV8Kav6UkR/0WATS8
 s3CVmeeMU3rH0vw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: VRwt77PyDhqN2MisH7kEoGAXaJvHlLRq
X-Proofpoint-GUID: VRwt77PyDhqN2MisH7kEoGAXaJvHlLRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NSBTYWx0ZWRfX7hvDRMm/tdHz
 kUY9MZMkH9PhyE579PUMwLHTvOF0M/37Uoph5KwnE5sz6YKJ6GYEU/gMU5heEkIYQHOOKPu5cDQ
 EzVDOLSW2yvbp9vUS0IIEx2k20VSC4evBPwTLh4Tiq1fBftKwuk0BCmsh2tDfwzr8rrESYa9svM
 Kwt9ScWjLRsKGhecXzIsfskc/tX1e5HcgQev9iFgrXsFd2So0Yo1GW5KnVg0t/28A8BvXg8UOCm
 gjfbCwCqK9YbPLxEOHrcmn0futYjiGb0BQU1jyNNGlbhKU5lLr9a3hgUg6u7DV/zjkMqvzD1fGm
 7flP/btzj/PlxqS3lejZD+wTcBtraYXkYZC/WOIozv3KomyPgOZ4NzyIgjM3rlFn1BG4iEUB0wX
 MqQHJTDyyRW3LC+3cT5sAyC7ww0EbLEPNjq2aDWn2eIiuMlqvf7dNCnrR7fxH8bxaIL6+KNZmiU
 NYp7lsemlYiw2Ru8cJQ==
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69f308cc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=lGtSNjaRAlEbDfKVVA8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300075

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
Changes in v4:
- Drop redundant !pdevinfo->swnode check in
  platform_device_register_full()
- Handle all three combinations with which two software nodes can be
  assigned to a platform device
- Extend the new kunit test to verify all three combinations
- Link to v3: https://patch.msgid.link/20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com

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

 drivers/base/platform.c                  |  19 +++-
 drivers/base/test/platform-device-test.c | 168 +++++++++++++++++++++++++++++++
 include/kunit/fwnode.h                   |  19 ++++
 lib/kunit/Makefile                       |   3 +-
 lib/kunit/fwnode.c                       |  52 ++++++++++
 5 files changed, 259 insertions(+), 2 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

