Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A7433123B
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224329; cv=none; b=Wb4wEHrAuHKlMPPiBZL6RDOi2FhKW9TcYinJzcCNVwdbUhZBZCKqAOJVTHFqfk2n37YNGCUHD1SkM+0TSVAT0dmuAOPKWo9soOyeeNdOjw7y5I5vBaNF3Tn6CXJ4AFncqnPsDzptjllJtEeJvwDfcZNe85bRNX+051fsZXWnDvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224329; c=relaxed/simple;
	bh=NlWOA6UrBUxPU2ZmL/Aama748Uq244oTOSPRnxCWr80=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FpXTrTUuVktenDvrbKvyZzZvKdDjE7AdScYJBI9M0k1WMXnY1icp8SIcXf1JbpnQvVTcMmSS82vddMm3GS5GoyDkWBp6nO3JwovvXCpcV2tG3Q+K/XTNogq5M4WJx9f4KxWidILQOdwC0+jh8lOgS+SGxkp+qKLzNGL459XAj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uy6V79kX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P2XPiZRS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uy6V79kX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P2XPiZRS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337cpoc2707131
	for <driver-core@lists.linux.dev>; Fri, 3 Apr 2026 13:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jncd9S+sPgUnlMtnW1kBhI
	3ZQuWK02IAKrgbnLxtzqw=; b=Uy6V79kXpcuITgY8AQLFAO2QboAK3c6Ukc/jNq
	NNS1GhOkUrLZqRV/4L2c7Vj8CccSup7x21tx3YhNiBscrNeZK8//eLN8mS84JxW5
	mqvy6cXLwX2bTAd7jplLELf7jLFC7eYofCrrQeNd1ko0TPkcxyChjCcBBU20UJvE
	VXHj9zDVFghxgk8bzolx593Un0nygJQk4p2fItgmLfJnYF2CDupCHB4iaBtXU/6p
	rF87apN4QKkethSsvEsROoBKqxrMsLr+cfBksUjnlb0kXro6O881/lvKBtYBUoYH
	7T1z8Vnw6nCxax+YX80pSfPNfBZMN8gSeJIJqPce9bvMlnjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjjmec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 13:52:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so87688241cf.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224324; x=1775829124; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jncd9S+sPgUnlMtnW1kBhI3ZQuWK02IAKrgbnLxtzqw=;
        b=P2XPiZRS/x9yhks3xfXL4iFhlgwH5jB9OIiOElOqBDUa00yI/HvjjvgC8rmEIfA5ij
         VW7eRqTcOgDVnKVqT8Yc60D9i6NpLl+c0+Op2lV0YPCrikDitoEmg7C1KhIJAzfsOrwu
         35X2T0geME4ub3DdrzsN/sQsdXS1QcgAXRbk9H0wC/am4TRM9IzrGA3dLCPGnhaD1hY/
         NB5m9TIOC8Oqc1TgGxbWBvFvl2a3djTf6PGjmsb1NYSaWgg+/n3HUVSA0Sb3WkuibOk1
         Jpz5xHl67UOV3TfsNQ0jRprT2UZDXyC/3JtsYK7yUEpuKwCJ7+QwqijNV4lZmr74TRWk
         0kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224324; x=1775829124;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jncd9S+sPgUnlMtnW1kBhI3ZQuWK02IAKrgbnLxtzqw=;
        b=fCrivtyl9p5C5nMbgX+Nuug0bEWvhgNYoizZZso4rmDBcXXtcydziRw4rEgPHAQqPm
         ftrxP7saFpWyGdoIIVvEDCztifTX5Nejg4Ty4YYiFeqBoGkbfljl+/7BxAiJKPGrG4xY
         HQuSSh9qtQVnG4/BuYxYvLSoWDLSZ1X+OQ13xk+xcn+GPaot/2Ggt2HqmOjfkjcHS/sP
         kwWN0+DVTH7AV9uP4Qi4EMrjQtAX46agwnZRE/rsFo0cvnfknmMbENSfOHpp2yPw4KGv
         YV3VE2tPH79g//up5Njy6GidBfrOBR0kPQ4DysqwIIjH/yeRu3NVY996P/ZiHWqjKas8
         OC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWCT9WFvc91TpL/1MfemDJqYtncNe1z5HSwyuwB9ol1X4wuSN57kKZk3B4rnJEuxoaNh8bVoMK9kD+mg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtvVR7TBCakES2teYRLDJkhGAbrlr/OzVWKIdLrNuymUEpfCcV
	nMMXQD3oEWsEXl0sn2y2bgF0yUJZkjHylBWTPKYTNRG709S1IGaWq+uJfGEisHqwLlKaWBOIwI1
	z95kZpHm1OaVcGW9mz8pAWWu5Bh4hw6DtAMg2+XBaXWaZ9l5uQhBaA1KQ+hpbM85eBQ==
X-Gm-Gg: ATEYQzz9mjL5JuL3Ew0Er71lwh9HH+ogKkRtHO4zKWiKyx23axML7AF70bVeKIncCVb
	IW3W288rL4zxNBNWkBnLHGeHI0kViAycwXSP974GucKjeHT7FA1zAC1b/tqGbjMCmpk2BnDJFjZ
	48irQJgRCXUdYdyen7hFTP0lSEES4Szgtz2l7SHxJxvj/gf3/WnKAxtIzKzgaIi9prXVeRudYZW
	51uOEwWJ4xMR/wgUQYzJTNLgszIYJvJKq0ZFfrCBrGgJni7hImvGGEENDrAIOu1SiNY8Kk4ese2
	cBdzM0nr0dQkRk/oZHA7YXuHA0VoKIS5XJjWOTBrH1yRyiHTvU1TCqTLOeyu41897w88xQlWr/G
	LI69Epz6NgkvVAtbZJ9rDSyfg5rKPnzQmZLTbHPtwy/Ol2zyixOvx
X-Received: by 2002:a05:622a:260f:b0:509:2448:410 with SMTP id d75a77b69052e-50d62ae8458mr42937801cf.47.1775224323922;
        Fri, 03 Apr 2026 06:52:03 -0700 (PDT)
X-Received: by 2002:a05:622a:260f:b0:509:2448:410 with SMTP id d75a77b69052e-50d62ae8458mr42937351cf.47.1775224323446;
        Fri, 03 Apr 2026 06:52:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/2] driver core: make references to unregistered
 software nodes a special case
Date: Fri, 03 Apr 2026 15:51:49 +0200
Message-Id: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXFz2kC/x3MSw5AMBRG4a3IHWvStAi2IgbKjzspufVKxN6V4
 Tc456YAYQSqk5sEBwdefIRNE+rnzk9QPEST0abQmbYqnH4ZoHYvmJRg6z/Z0uWuMuicKSmmq2D
 k69827fO8EvG3YWYAAAA=
X-Change-ID: 20260403-swnode-unreg-retcode-38b5b92eab28
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2105;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NlWOA6UrBUxPU2ZmL/Aama748Uq244oTOSPRnxCWr80=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8X6M2qYjAHwaPwqmT/pp9+4mIAqzXsPY+bba
 kOFCo306GSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/F+gAKCRAFnS7L/zaE
 w1LuEACh3O8artkXQUwfvuuCLjG5ktBfI+U8MJhhKQCCBPkRGQnZ6rphdma2YLCZHXYMRx7G27i
 GV8ZdKW+/q+QQ6h3mgev46ldzgTc5MKF5STbxlMc96ctIr352g7BhqKNc2az2ItE/YuTLTbGFe3
 q+c7VXV8xoD3e1AZR9nEvGZd1rPnx3SvAf0MGNUHebfG7umL/jlHx5JGPBdHdxJ2ogP+rCW3Tc0
 ftLLcX+fC/2oWOM+b3lfwz/Lxps/oe06HmPUwDVcUeotQjSNBUVGOmp9ysbHka0LQYUGfe1MC7s
 6lyO8m6wx02afdnNLPFDAq/9QuBm80TIPT6OQLJiEVcqs8UE+z/hAsLaJj8IHaLxQy9N7iS8VLR
 8q3yE54xuM0fomeiy5yFI76SYHYXIMB9vajE0cDyilOuKapYBF8QXzwxIAqojSqJkKdAEoucHeD
 pV+DXYZNsHo/2ePt1/SF0mEvlNFgKj6h/qeNYC+ttJWVgsha5zvj7dRGe09z0L7oMsXfOYJWnLS
 /zdwt6KHQvf+Wj/zLpWz7DDc2It9cspD//3kDzP0AlKnZ2cn4vfjh8c7qMp6CSY4mEImYBbfJ8C
 kk5t40EMKxz0CI5BdkSm8J/g1o+stvJgX+6p3lXxW+4e68ZEjWL4LpXJZPrl/lH1yijL82eTFsd
 po+o2jNh6+zmkog==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: b92q6IGx_6JY-SJA68sciP9HCne0axwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfXz/6sog0N0rbT
 2skI1RhXCDMnmLv8LSVb81lfSJgzSgbqXYoR/y+EKu4zY4QiXKnylhZMF+qOt/VceqJotvyVO+b
 cTH1DTsNdynG6gVbFnP27vsxuZYMmaT1/CgiLgWHhwQoxF1a1tSuJSWa/4p669NIlZM358l/saO
 s1xAs99xTCS6IQj1Wu0APcq/Q5EEmtN6XH887x80Y18QAEfzCbGB3teHpOgHbNJHvTzfgLTo5bV
 v6ObxiPJTarpiF+673xvrPYlwPYbp/2TzRu5LJiT6NgMhufuKMeOPCcihvlisgJkaCzHLFyJTWp
 BD3C3Lj2+LXP6u69eDRNNK63hx3gNAo2rcCBEJMto3/8QA5JopAaeC8+gnJGzn4lPOImv2iq37E
 aXygLkzgPNT8jPm95ePghCRboLsvGpxT7eONDDtl7B3QkCoxAHWy1h58vA5gHFX2d5DNBUf0qjb
 ncTD9iSKeDkWWXKqAnw==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cfc604 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=h3m_6F4IQ1uC9WK5d8AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: b92q6IGx_6JY-SJA68sciP9HCne0axwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030123

I spun this out of the bigger series (see: link to v2) in hopes that we
can get it in for v7.1 and make follow-up development easier next cycle.

This series proposes to make unregistered software nodes (ones that have
an address but which have not been passed to software_node_register()
yet) a special case with its dedicated error number. This will allow
subsystems to defer probe as if it was a firmware node not backed by
a device yet.

This is done in order to allow easier attaching of software nodes to
GPIO controllers and the removal of current label name matching against
the software node's name.

The patches can be picked up independently into driver core and GPIO
trees.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Drop x86 changes from the series (will be resubmitted later)
- Use -ENOTCONN instead of -ENXIO to indicate unregistered software
  nodes
- Fix retval check logic in gpiolib-swnode
- Link to v2: https://patch.msgid.link/20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com

Changes in v2:
- Completely new approach
- Keep the cherryview and baytrail secondary fwnode handling as a
  driver-specific quirk for x86 tablets and don't introduce any new API
- Change the return value when resolving a reference to an unregistered
  software node and defer probe in GPIOLIB in that situation
- Export acpi_bus_type for use in x86-android-tablets
- Link to v1: https://patch.msgid.link/20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      software node: return -ENOTCONN when referenced swnode is not registered yet
      gpio: swnode: defer probe on references to unregistered software nodes

 drivers/base/swnode.c         |  2 +-
 drivers/gpio/gpiolib-swnode.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: cc13002a9f984d37906e9476f3e532a8cdd126f5
change-id: 20260403-swnode-unreg-retcode-38b5b92eab28

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

