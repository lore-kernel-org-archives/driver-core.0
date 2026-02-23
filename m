Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA36D20E31C
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853865; cv=none; b=nf+F+MP00T3AHjSz22wuBbxZKH7YER0kKOMx+mcxK7Xr+BMLlrq6I1zTRbDhzY7tTXN+8s0zoRdRgKcdfvlLK4Lw5lR7I5hpSuD3EIbNWBv7mOecRxB2ow6JyFKxOe66dqFtCZWFBAFANgW56kWi+8Et0xujgK88si3eCVLAbbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853865; c=relaxed/simple;
	bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NZQEmt5Vb2DCIWSFPAu12V1iTGsn87YcsGbdpD1jTSf7rIEtDUAjbUz7VvEIsUME+Zf3iSMlOM1qv79r54ZeiYt0sgi1kuH+9Rh+3Z+71vQpQohIGbjdSV3h7j1evYZEmlk7Rx4QIAVH/Y0yF2zylm7M5FnNUXXmPpruKMUhwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcS2jH80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wcu3ojdC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcS2jH80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wcu3ojdC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2hDG3151782
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BPmaMMJCKmfQnceiVQlewf
	F4pWyv++KTwwJINk8vYA0=; b=CcS2jH802qsIIJYTQKLEhIrwqr8D1QKbHK9M+T
	NxhhRoqiHcBMxthLUjI2gG+s3u02zEmYYEw3hPWu84AmQv5LKwdjUeO/aQJDNnRt
	1gU3quLKiTnBAl2CbmFg2N1RLGIrJe/y67bseKH0HTHwN4Tkv+Ya9LJ7H3FBu3zG
	jLwxa1mg94Y2zSYcrRiSqUDAytbyJ2rGyQVqCwM70nXfNjdve/RleIsMiOdlIlEa
	eiyzDSo6PlI2/v/6IyLnlj3ysVpPWy2JBNaSZ8lJILOyi554R6ZU393ewSo8AwAw
	AQIB8AowMsjr2ht1polxdbIYWQvs1Rlqi3ufx8cnu6Ek5Zgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8879w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:37:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3fae6f60so5524537285a.1
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853862; x=1772458662; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=Wcu3ojdCOyUrooZKhZKjUOzK1qMxqDlFGcp8q6cIur69hKrh8H01Q/I0Z+gfw0np6C
         MshVkBF2xzhA4IlPRFN8jWie1O7iJAX/uAwOmOpvQcJb0mdtbn30ScF6H0HwWpxvohPZ
         VOEu+1ucMjMXBzgIAnEi4SpESKFXAJEWHWSxuDgw+wrVnhpxzX2+tBMddj8zHAk7nPd5
         XzKYBVo+Emzt3psudQJFTOvhi6hz1+usxAFY0Hl0AVLoeC3yN31++eA541ppxGADLeX2
         tThn+xRG/EXi0y0QvyuRIEeYH+0vLkVaQp47W7KqZyV/wzsGzrk9rAy+oESSbDcvk/Lw
         Srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853862; x=1772458662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=WK2RX8H0dx6w6r90Q9T2ATP3I1MhPeg7dhbUUPVRsNrXRdxPQPAjUFhNd9SbKiI1Q2
         WKYspCD94Rl30e8Y3fQe9IJXqwe5k0WYp36HCeEJ3a6HNz4/hvClebomASLY/8nNM5M3
         QRpG5i16kDUL+N58DqFeNQCTw5yLjqQ+uawYJV0jEmeDcFMVGyhENJpMPyllmebDcAvW
         +/v17nSgyIQoIDVIvHpcV9YJJyu7J4Gxo3hKkkK1XRPJpLJD8Z4Cw3QN28BaqfoCe1/W
         LnK23quOKW8/YAVZ/gBzBr7id9juJt0Zvgde1LmHndEtfSQOdK9m/V3kvPgxSbJOvAa3
         MFjA==
X-Forwarded-Encrypted: i=1; AJvYcCU01a+ZVBSQrvdeY0nqFa6PIEAhm0SoDOCgWLs8OkTW8RLxYGhUkEDNW2kFvfqHeCQbx9ApBxiRaT4ikQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwevnZJrzpTxcH7MHSmNdZJcm113kSkwudnO6LGh9OyKnEQZAel
	lYG5sLLuC+wu6c34vGVYn6/6wUbsCeuap6DhaLfZzXHr2iFI0NNVOqo/RvZakxla3i+noP6GFA1
	ss60ytCJRCVPkUDRQnHz0Hitg4Qt4O4ZzAmLH7U+y1jhqF+rAqHHbjdRaJXKO18+XBg==
X-Gm-Gg: AZuq6aJMLvjgVtg4nwybUJhEf+WKTy2sqBoueqd5+al1tlVVsmaaSAfOK+h0EsMl5hA
	eO5H8QVF5kzanO5O4kHdvtC3QfmIClQlJ2Jr4aMQjzivpDL8v3cnTDm+wWihB6Ma44nfwn5F8hc
	+xlBATI2v3wFcT6IRQO3AQsuI13WvqlfrdOsiuxIesLURevNzqmP2vTZJK5a8ESJW6d84Fqbgiw
	M0I/w5KOhQoTup3/gx0Y3tXtchWxCdUL5ZqYeWoWmqAlGOw9DDFiSMZw2SOze1E1b48TDguvrp8
	nXMc5fTw7/cTBucC0gligkt5bd/zrdFfSU5gQIwrQjcCgkPeo1e515IggAfiwhZTpDrNGfywOSf
	hkhevTDmfRRj7pJknXvI/NpjKPzjJjqCarJmHFkstHpE8YPaVTUk=
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160536085a.31.1771853861881;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160534485a.31.1771853861406;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 23 Feb 2026 14:37:15 +0100
Message-Id: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtYnGkC/22MQQ6CMBBFr0Jm7ZC2IgVX3sOwqLWVJsJoBxsN6
 d2trN385P3kvRXYxeAYjtUK0aXAgeYCaleBHc18cxiuhUEJ1Qope2SySB4j0YJa2661h0ZI4aE
 Yj+h8eG+181B4DLxQ/GzxJH/v/06SKHCvjPCmN7q7NCdirp8vc7c0TXUZGHLOX4FjjF2tAAAA
X-Change-ID: 20260119-soc-of-root-77c86c54010f
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgVUenh9qw3oSpou3F8KSCFXav2bvcRiege3
 sGVJWni6mSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYFQAKCRAFnS7L/zaE
 w5uXD/9yJoDbzqFe8HN69sZX6yHCeFb24ey9/QRxDPVxBDUzo/mC1CmWvU9maHjuUi2DhsZqteY
 vVFK/mvqS21ADpPY9IZMhs9bAmGazA5FS6vLdUNPVB4LEkay288yM5di7NV8q+nibyZUd+hsN7V
 X16nMjmBSYZQcTGiOzDHPBzeSgdWvaMLE3VaEh/A9eFmK4duP55S2ax2luP0asf4iUjas6/ENcc
 kLL8b5IE8GN38bvLejihYDytXYJTc3u1PGWEeZF4cfzmOXpPEd07oJp0xSx8/+OLRylFE69VXH1
 8LAwgPhQSnLbfXneimOOuBt62w9ZnCRFc4hMTIju6Kt4wcigTjzSECjR4kbedSz7coD6p8e7bxj
 CzFz+qCGHaam/FvGnBRN8pDaB4hz0RbNofKeXNlBhJlVpAr0G3X+SYpxc0oHh5sRcSNu2stBssc
 FlqN7icTX1KQnCpSbzrB1rE+vXwxe0uBbzuSj7DaEzGdJmDJXx3ars6mFSunWmWbPUr8x3fsieX
 p/iTxe7StpSNuiucKFnJNzAaPYri1PyLu0BQA8gV5IIZ09OKvMPzXe4pLTe5iL9rZQPda+m7wuT
 rEx+R8qYrAT+W/In7OB3eZuTsNFHzTwavJjw1XOfN7LTRrKIPlvd8OxtwgVlbnz+AXam9TwfM8d
 qTt/p/Jo5DS26nw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX98WDBpCuq3V+
 gpISF5o5dvKQtaujaWfWYcstag23HmcKa89fX1aaMXBl3rkMCW/TTaslbttt8Q0YIG+ZQHthW4R
 QpyTVqnT8u8o2wz4KpCxEsw2I1BMfuRIPbuLm7ZZ9st/eJRmfK78rTjIU9iXCUzgHXxP80VqeyQ
 cXkSZnbFtWqda+giNkL/xb6+0v0DtJkgP/FpWx+PnefYaAvef9EqpxPn+Pt2PLNF0vbET61YhCy
 SJujOlmZOedQR+LkFjEuUzcjv6UwVj57SVDpOEXGZPQmbV0d5IKxFYRnWMYcIgAs7fbKiDku/gv
 8D9IF8Dao2pPeFUdUrrc0Po1SmQ36sxKKbaccXEOXq170s05Rz55Nx8O74pMxPOkAMGCeTwgAKj
 4ebjTMsbF+D7TlA8drpubPOI4VRgU6HJ09TjMecImL1KA6yTQPq+zpy+pRuj3pRTIPQMJy2nzI8
 it/Jdy9IaprZyQzl7Ow==
X-Proofpoint-GUID: WEvZbSNcToaYTBNwZ1Wl5CvX1QZFxP2B
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c5826 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dWNf8gF45q0IjK5QRoUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: WEvZbSNcToaYTBNwZ1Wl5CvX1QZFxP2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces new OF helpers for reading the machine compatible and
model strings, exports an existing SoC helper that reads the machine
string from the root node and finally replaces all direct accesses to
of_root with new or already existing helper functions.

Merging strategy: first two patches should be either acked by Rob or
picked up into an immutable branch based on v7.0-rc1, the rest can go
through the SoC tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- rename of_machine_get_compatible() to of_machine_read_compatible() and
  add the index argument
- add a stub for of_machine_read_compatible() for !CONFIG_OF
- provide of_machine_read_model() to avoid having to look-up the root
  node via of_find_node_by_path("/")
- rename soc_device_get_machine() to soc_attr_read_machine() before
  making it an exported symbol
- Link to v1: https://lore.kernel.org/r/20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      of: provide of_machine_read_compatible()
      of: provide of_machine_read_model()
      base: soc: order includes alphabetically
      base: soc: rename and export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 23 ++++++++++-------------
 drivers/of/base.c                 | 28 ++++++++++++++++++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                | 14 ++++++++++++++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 77 insertions(+), 34 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

