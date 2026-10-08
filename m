Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB08370AE7
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442039; cv=none; b=iZRcOjFqyYW5UTTKyD414H17cNq5XFzac1eu/2U1WlVr9r/4mbab0aKTm/47DMKZ7m93Rb8XpjIu/9fYtR+y6NRxA9MD+ufegI2i2/VkmdagAPnlzu/pOTL6d1o+f8nF78bRh+p+iQYvXbBcejpYwT5TTcIiXECRtUxVE7Fxu+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442039; c=relaxed/simple;
	bh=ctiFRv/9qIPR89unFFyZVFx8hVtPWP9YHwmSpNcQyM0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P8xKafygf/wVeRWDWT3cgcTI/btKIuYJx2trjcFK9/4rmqmXDJVpbQvjOzgMoyowZOeH9lKcl8kVVu+OY9d2XxqfnzSyF4cFHWVBQ2idj3hOove75RQthSsPpq6siaWbw9JhrDZ6atp2OsmYTBrvlZXAre7NQLo8oIrVN1mnpSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRy+b33F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6TDFMoB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRy+b33F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6TDFMoB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BQxP2895326
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sk4/cs+o2AN8kozG3+5FSW
	cAJZsyL4W5lSP17jdNCoc=; b=XRy+b33Fs005IsMRhBz+Pz6lA8urizthAyR/J3
	N8TC/vS7TXp94/AP8FBeD8QuVWyM7lFCn2oaatKr/sSEQFAIgUjYOmXB4bNWx64k
	QyB7eOMRw1/Vx90/EcAhdDTK211jUlZ/vPOF1elDnTj/B844VI530XcjGxYWvdMf
	ZPlQWxMUMbhyQuaBf6yPyT6gMTMzxo2DvbpiBi3Sfao36GC5wPtK5oV9IvpSf+tJ
	oWKQF9J5iqDdY9usY3XbDxZ3QwueasZ7aAVliacXI2KC4LwTEPjIBnr2XlX356ur
	tVFAtgMPQ9pyYtwJd6v7cvVDrhvgBf2Y+zcZ5v6YZcguQ4xA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg93km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:47:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso616792a91.0
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442036; x=1792046836; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sk4/cs+o2AN8kozG3+5FSWcAJZsyL4W5lSP17jdNCoc=;
        b=b6TDFMoBXIk3YkpqA9TMgotMoAqTnfa8cF/HY49KQsOQawZt7AAsP3NeKNfAPhgB+D
         VHoVqEA49SMXvLG2vAzEekDnNbQkFFKnxqoh7jkbwxbbaE1UxfcRZiZCtGhCbx03Wn3/
         7STM7UOgn4YuPhRcWZ5y92xDaUqHR+yxhNDIpi7TUFC972ikeiLb5Y6G5Kxusnlv3JGd
         X68t+H5+ensyH6vr6xyOXilLpjirVMw/y8XjSd/bY1PZ9IcwPTQ4BJqKuV1AW2MixYUr
         VYX+/9BDmil1cLBmflxlCeJ5WaCKGacEXju9X9k53xXlyhXhIfX/7FIpmOBoWQruo9wd
         msIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442036; x=1792046836;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sk4/cs+o2AN8kozG3+5FSWcAJZsyL4W5lSP17jdNCoc=;
        b=i+9IbPBxgNz9rpziic0xY5kPn1jXd2SDvY8MU33P8w7mofFsC3wBeiA4EVHPcvC/h3
         NDfWjw9vXQvYpvN3r9l6DE8GdSpmSX5i07qJjXRiVVESUCJMUS4fZy/0Xt+OyOXuBTZy
         g7j3lOL42jMf9F5P8aTLjCrgGikz8ahw6/dJwxEuF5vRsd58W1PYkRAGbJnfQnIushqE
         P7NjlWfKtDnKbF0QEyZibwLDMkNiZqI+cQjM+0HZlGwAoT9PGo9Nj9EXNgUMYeTQ6ml+
         3ODqLu/hBtZ6mA+x3UQtYm2Z+l6HlRxZ7nSdtKfc4VT6KpspJvvl6Gt+G1Cr3XRA7SIX
         VXdw==
X-Forwarded-Encrypted: i=1; AKwUvBzLW6Jbs7oWuL6qX3DxDoBy2hV/xcjK0AnAMYYNY6vOGLFDfAykLBvNYeImzEjSOOEoGOo/DXiIheq4Fw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKX1aKQBeec7SRlD+D+B/8W455W8a28R/hQtyasuvO+EkTZeIcX
	Zi6YwN0uK62qxwnTRnuFtwbqL19q5RhijnQELlPh+DKNey64LfvKPZzVTb8yTZME0W6VQ4Y88QQ
	7ViZf0RpABr1iAGEKnKU0Z8scvnJ939q4mvst4SUtDznwRgUeweoGeAlGTQm8DE9/0g==
X-Gm-Gg: AYBFou1W4XAue8xbXgsxr9WdmmbPxIqAad6CpdfqrgzepU1wmlcV9mpvctNqPnQkg9Q
	7GR1i09p6Ze8cSKXUrvvjvF4Os+TVF01cQt/GDbft3mfniTFzo/TjWDIpJVF0kqaG9qVGIdfx2l
	r7s9Z8tsuYYSpP2XTxMkVCdptijjD15apqe0Gm7dBU0Zdm2t6v1fYu3RcYMXzoP/H6+yZX7qFuE
	Y9WE+51KZDgS751NmGKVWTYTDF6foqg7Hg6UPAc6ToDtgczieYi2FhZqycSG0laSix1xJBewk0f
	6Qv52km03UREaNgixSdfP03hX6xrq9LpT31eSyu/UcYBFKKzQh7htvx/eWNJpm9PXB4en/yDyq8
	bM8MN7DkdecmG9j72/i8avbKdC4rMJxc13/RzwqOcAPFmox7PcJiaOxk=
X-Received: by 2002:a17:90b:264e:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a8a15314e3mr3834585a91.67.1791442036443;
        Wed, 07 Oct 2026 23:47:16 -0700 (PDT)
X-Received: by 2002:a17:90b:264e:b0:39e:6c6a:6580 with SMTP id 98e67ed59e1d1-3a8a15314e3mr3834551a91.67.1791442035915;
        Wed, 07 Oct 2026 23:47:15 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:15 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH v3 0/8] arm-mpam: Add basic device tree support for resctrl
Date: Thu, 08 Oct 2026 14:41:09 +0800
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABA7x2oC/33NQQ6CMBCF4auYrh1DC1Rx5T2Mi7YMWhVaO4VoD
 He3wMKNcTPJSybf/2aEwSKx/erNAg6WrOvSyNcrZi6qOyPYOm0mMiGzbc6h9aqFgGRiuEMd4dZ
 5oN57FyIYXtbG5KpQ1Y4lwQds7HPWj6dlU6+vaOJETh8XS9GF15wf+PS3lHb8f2ngkAEqmVdbj
 aouq4Mj2jx6dTeubTfpsCk4iC9Z8eI/KRKpGymLUmvRyPIHOY7jB++pDVEyAQAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442019; l=6372;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ctiFRv/9qIPR89unFFyZVFx8hVtPWP9YHwmSpNcQyM0=;
 b=ByECJAbdUhTxQw2IbwX7y2/voTshL9qWecGhDz9hSB6Q4w3ZZCMybl4sDperzamuYZs21QL3+
 a/yOl1HAG2lAZBP/u4HhX7PbXuCT6G/27IXwwMi4KtabXhccolH/4Q2
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: ccTGGz8AT0d4HvyDTJ5MC_t2hR-aqHm3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX8rAxHykoah/w
 WYpdsBM/VhoQviXGIl1DrE5FS8sCDho6SAUnz1RvH4T5SbDlMReVO1WjlPHup4ZTDc+0CcumqN0
 oQwYXqPJuAEe3UYmLnMRePLWNUYOowk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX2C9YNZJeoPxU
 QjCamP5wd6S4ek0nDpCoaacRgO8AkSpvOQWK7wn3nxi3ToIAjt8n7XMDil6efXBh0UF7cVSWYXD
 jDZ/74YOtW/m/1tRzCVfLKeT1NbNB47b0HfgssowGMaqTtSoocPGnMV1k0R4AvcCjyecSce7iiq
 sYgwCZ4wWVC4Pxg503jQ9GsXPCFLUQ3mFmA3ZST2kJTevKGmMtimCGMj4Xi+oc71EDJn9k242TO
 o1PfG/WdwcI9RjQdsQXdtE71wSek7m7csfJywwel7ZOYNK2DXflj/E1nG19JCyD4/QWaLyfnhmG
 XjCHtHKT6sSTr2I9KS2f0pyu5NOcFuJdbUNbJ6X5Z5jTupdNdjzUzEZ2ZGtwmNV1gjaCUGuI/Ib
 Mecys7HEoijvtTsDY0GxPKbtn8QVmYgLM8JytaFjGrqkPvpoSMoODLQBv1QznsWFdQWjqTJ0Lev
 D0hV4y6xuKOkcs3WKXQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac73c75 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=omOdbC7AAAAA:8
 a=JfrnYn6hAAAA:8 a=eVJKr8h0iHB_2sIDOaAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: ccTGGz8AT0d4HvyDTJ5MC_t2hR-aqHm3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

This is the first formal, non-RFC posting of the MPAM DT support series,
following two RFC rounds of review.

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The patches are based on earlier work by James Morse, Shanker
Donthineni and Rob Herring, with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

New on top:
- arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

DT affinity model
-----------------
An MSC's CPU affinity is derived from its parent device (cache or memory
node). When the parent is a generic container, a per-RIS fallback
resolves affinity from a 'cpus' or 'arm,mpam-device' phandle on each RIS
node.

The Kaanapali DTS patch (marked DNM) is a local verification example
only: production firmware does not expose MSC register access to the OS,
so it is disabled by default and cannot be upstreamed as-is. It is
included as a reference for other platform DT authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes since RFC v2:
  - Fold the binding schema/example fixes into the binding patch.
  - Fold the foundling MSC fix into the DT support patch; remove the
    unnecessary parent cache availability check from
    mpam_dt_create_foundling_msc() to keep it consistent with
    mpam_dt_count_msc().
  - Remove the #ifdef CONFIG_OF guard around the cache_of_calculate_id()
    prototype in cacheinfo.h.
  - Remove the [Yin Li:] annotation from the cacheinfo patch.
  - Rebase onto next-20260918.

Changes since RFC v1:
  - Fold fixes to inherited patches into their respective patches with
    [Yin Li: ...] annotations, as requested by Ben and Andre.
  - Move the RIS index range-check and MSC MMIO window size fixes to the
    front as standalone fixes with Fixes: tags.
  - MSC MMIO window size: genuine off-by-one fix; the ">" bounds checks
    include the access width and are kept as-is.
  - ris_idx: validate range after of_property_read_reg() and keep u8
    downstream, instead of widening the call chain to u64.
  - cache-id sentinel: keep ~0U notation, leave cacheinfo.c unchanged,
    replace unsigned long with u32.
  - Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
    variables from unsigned long to u32.
  - Fold the device_node refcount fix (of_node_get()), reviewed by Andre
    Przywara in RFC v1, into the DT support and memory-controller MSC
    patches.
  - Drop the "clear mask on error" patch.

Previous versions (RFC):
  RFC v2: https://lore.kernel.org/all/20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com/
  RFC v1: https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com/

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (4):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      arm_mpam: Support MSC accessibility derivation from RIS nodes
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 397 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   1 +
 6 files changed, 631 insertions(+), 38 deletions(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

