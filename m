Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1456B221F2F
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385737; cv=none; b=UftV9FJMgUtzaAtdtG+oFAWMGprzCIJNXn6+1MSvKjZgDih4JLr5oW6xWKEkla+AL27CEr/hU3SPr5QtycOKD5UqJyZptS6QAO/NOm6Pz7cstqcu5NbVRKQgNv+VbBESQkcd/gxUiBOw1md1c6F4MrtvMUDis5ZK8Z8IYfGNbsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385737; c=relaxed/simple;
	bh=jNYQs7plAlKB4GPMoV6aaPXbKYzbU5BDR/SxJA7HBwU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tU5TGc7rY/SuR0ouuOFyzf+N2Mjfmi0Sz1Af0McaajcIoQPm2AQ17BPtm+BOtnrhc5AFxbCgz23wcUA7TmZ3xC5R/NGTa4NCvNnWraBV100W1BPw2WTz64C+yPaI48HBeoA8o23ai2zNFS2VNpjD/5U9YsPTFn5u/Ym6nI1fiH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLpuaS5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geIJeNpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLpuaS5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geIJeNpD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tmwi070779
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mupIkLccalRDrukQF23t40
	a8I0ddQYNnwfRbZ7/jpyY=; b=hLpuaS5OXowV2oUZun+7CRQeFqOM+6pdBXB7Qv
	jL89mx8bOqpVSHTU9a7igawgeWkQ7tdbZW1DB+FtoOcVukDMB9hs9ePpV1RCcFOF
	Z1zzxzie5QYHRECvPvJBnLoVrZvqluYgv1/zr+D94+f4+nvvHvliim3+fAVXYM7/
	bmaAB4d6jP1J47vqjd5+XNBpJ8CaiDnnrVizs6hGFLJ7OSKHyDpSdO314fc1ulri
	1KTOvpULs83g9xOvS1Ffpn3YAiCkuuupxp6Jnwl7g0sXRXVLVBU5hgHI4n0f6LeN
	Sra+hLS/vnZIMBLrmJgbJ1s+ikrquhf7nS2ziRjkeh7B3vgA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymx61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:08:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c73939e0314so963845a12.1
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385732; x=1773990532; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mupIkLccalRDrukQF23t40a8I0ddQYNnwfRbZ7/jpyY=;
        b=geIJeNpDjP3sFMNZ2ReT2GJFL0+7myQecNnOFxQ8odeP0sc5Pe3CxDOVx1RTnso40u
         4xVRfnvHgKjtdg+PTVcUB1mrMd6OBGhF1ridJfitDxoWHxQD3RDRyM7S5jZk8zrtH/qd
         /sFkvWrbP5wmiU74GgAJ/0a0CYwLe5tjUPkREk1mHu1qk3P167VmxDcFpEoiuBsmnMjw
         m9ncBs2xppMJ+zwzQsWDhSTBWMagAmyv0wGmUs80xLwDvOxc8KH64++VB0zlHezfpxfv
         cYkZ++ulZDOmEtfN10X/XrpIUqOB6wp+pj7UebNjkuUt6cbSc4yXabcFjVJfkxXWyNvr
         0flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385732; x=1773990532;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mupIkLccalRDrukQF23t40a8I0ddQYNnwfRbZ7/jpyY=;
        b=InEfXUQjuOGcMvnGKv6cw/4H3zU//VtH3j2s6nDQncBDzEOJpK2GzutD7S7aO+2a+j
         7O0ijXtKL6XldtdQlYBObR9p/9GGxXUW+sY1MerM+HrXYkY51uQx6SnYROd2YqKR1GGs
         uXEKaepS2XmBGidEDsen2fWrO+9criMSd9+XDMG9YXmb8bAMRaRADeRnilDxMH9w2/8i
         NgEkwtKcw2LSxKTMc2sdOHvEzikrPrtUrielGuO1CeIRmNyDhJV+WZ8eWmoM+yqe4kzV
         /9YNRADW6rsI6EOBxUzbBOCQZVU21sMBDsYOa09ThoKEB2/gweay9m5AXsE2aPt19BKq
         p1aA==
X-Forwarded-Encrypted: i=1; AJvYcCV+fpDncRuyvBkB7s5OCmlmB/stPP6qoGSa31gKHXVe9N9tsYbu6sGNhlSm7frgI3QNM8xotayYtDQ8qA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzta6pNHYaMbcylMzD6P06yLR0jYk5CLBrrmXra0glGvVeZ1+jw
	Pyq04lp9j5FMrvooB4jhr9/zH87vLUYh2QaKhuINfmrM0JyP66LYcZW+H54TS9qgaN9Y7KbpvEL
	SYtPqve/mfYTcwW3E1CzOvWew4Zsnt7JP3qGYCEkWdwPbDrKQgPKV3A3xBA0CZA9bog==
X-Gm-Gg: ATEYQzygRKbjVhaRxQaEHyduWZLT8dZz19u/dSnq407WYpec0VZ1LAbp5iVP/nvl+rA
	Ji7pCVxe5KifA39lmk9ALDIJA0ie7vBD/wte/kVRdgsbRmW6F+9rPOuW+BktRiEf6C+rkAOWyaV
	BfQto52yKpxfE7JDu7gaTCvbbsEzAHCTLiA8If3zj4talbG5l4u1Y6RgXKxhPbiedYWtgvp73c/
	eY4eW4LW7ej/WRmyDdJz7PsryW+EXd0vOkLq9rlYAfddfe3nMCagdzjp4V9lWv89W2aSSnLuSTG
	A430o1/sWpkMOx9k/w5xHT/86GpJ5UdHDUlHmrL75krH6VZZ6BJIX7m1+0fABSL/PtN0N6g1vDo
	1NEkmJlNdS89rCfCDwQCGc3I2YgmNr7SgVnr5uwGjykuLgFmgXCidqW79
X-Received: by 2002:a05:6a00:8018:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-82a19722448mr1884736b3a.15.1773385732451;
        Fri, 13 Mar 2026 00:08:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:8018:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-82a19722448mr1884711b3a.15.1773385731950;
        Fri, 13 Mar 2026 00:08:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:08:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v8 0/3] PCI: Add support for PCIe WAKE# interrupt
Date: Fri, 13 Mar 2026 12:38:39 +0530
Message-Id: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPe3s2kC/3XN3QrCIBTA8VcJr3Mcza+66j0iwkxLarnpZkXs3
 bPBIKhuDvwPnN95omSjtwmtZk8UbfbJh2sJNZ8hc9LXo8X+UBpRoJwQYPimz9bHdpf6pgmxw44
 zw/ZaE2U4KldNtM7fR3GzLX3yqQvxMT7I/L2dLPllZY4BM8EskY4aCmYdUqraXl9MqOuqDPQms
 /hg6A9GFEaA44q4JaPA/zByYgRQor4ZWRg4MKGWagEU5A9mGIYXCnCEW0MBAAA=
X-Change-ID: 20251104-wakeirq_support-f54c4baa18c5
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=4319;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jNYQs7plAlKB4GPMoV6aaPXbKYzbU5BDR/SxJA7HBwU=;
 b=y8e5wn+GPIWFPATU7djvUgfzIyrSOJk1QmKF4EOb8Y05aGRybZSoSGl1CjYqqn2eCTSY/H48Q
 Xxvc8C52XheAWv7lF1CASiJAd9FlqEZfXG+WtZCff7PkFasbX0Woy16
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfX//r3Jep4dX+c
 vNsNDaUxTKTCpdpR98ZnjC3onPrZ7/6H9a0/OG67eIJR4zQCL6ry64f059Xt32CPMlyeXDnDsoX
 KVg0gfCqe6OwD3r1S3TNdXjqmzNNDPMfd1zZTALO2XwQ3MnT3gF+kVX26caCRhQwCpDaHxHphSO
 S2BcEgfMpzzA4LN7E9vaTqCJnAxCHgiCmYBU+5C6WPC9eyQ1tui47RLrjWrz9Dg2TY3d6sIOrl3
 HtTFboCa0D2/epvCez2gqbmWe+Ha50aAJ6Y3VsdbT3aI8n8iiVqRCbfXG3M079qfOoBUsFXxeBF
 1IqLDX47x/g71ZR4reTIn/GjEITo/2zQShAQq13XNCaPDwcixbQv8m/33hMDRvlaqWhZnBEKxyI
 0XHZfIkaWSVINtCl2bpwCDmJZHGdZ0wjsweq7CrMb0KaJbRbphP+38pwLplQDZdi4RXYJf6z6Pq
 P7nbvLxpxMpFvu2HEWw==
X-Proofpoint-ORIG-GUID: G-pJnejQDcVFQgVp2g1rHBcp52rJYsRO
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3b806 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=oBmXpkfWcQESfIqoYmwA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: G-pJnejQDcVFQgVp2g1rHBcp52rJYsRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056

PCIe WAKE# interrupt is needed for bringing back PCIe device state from
D3cold to D0.

This is pending from long time, there was two attempts done previously to
add WAKE# support[1], [2]. Those series tried to add support for legacy
interrupts along with WAKE#. Legacy interrupts are already available in
the latest kernel and we can ignore them. For the wake IRQ the series is
trying to use interrupts property define in the device tree.

This series is using gpio property instead of interrupts, from
gpio desc driver will allocate the dedicate IRQ.

Bjorn,
Can you take this series through PCI branch, once other subsystem
maintainers give us ACK. 

WAKE# is added in dts schema and merged based on this patch.
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

[1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
[2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v8:
- Moved the stub functions under CONFIG_OF_IRQ(mani).
- Added the description of how dev_pm_set_dedicated_shared_wake_irq()
  works.
- Link to v7: https://lore.kernel.org/r/20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com

Changes in v7:
- Updated the commit text (Mani).
- Couple of nits like using pci_err instead of dev_err,
  use platform_pci_configure_wake(), platform_pci_remove_wake() instead
  of calling directly calling pci_configure_of_wake_gpio() & pci_remove_of_wake_gpio() etc (Mani).
- Add a new fwnode_gpiod_get() API that wraps fwnode_gpiod_get_index(..0..), similar to
  devm_fwnode_gpiod_get() (Mani).
- Link to v6: https://lore.kernel.org/r/20251127-wakeirq_support-v6-0-60f581f94205@oss.qualcomm.com

Changes in v6:
- Change the name to dev_pm_set_dedicated_shared_wake_irq() and make the
  changes pointed by (Rafael). 
- Link to v5: https://lore.kernel.org/r/20251107-wakeirq_support-v5-0-464e17f2c20c@oss.qualcomm.com

Changes in v5:
- Enable WAKE# irq only when there is wake -gpios defined in its device
  tree node (Bjorn).
- For legacy bindings for direct atach check in root port if we haven't
  find the wake in the endpoint node.
- Instead of hooking wake in driver bound case, do it in the framework
  irrespective of the driver state (Bjorn).
- Link to v4: https://lore.kernel.org/r/20250801-wake_irq_support-v4-0-6b6639013a1a@oss.qualcomm.com

Changes in v4:
- Move wake from portdrv to core framework to endpoint (Bjorn).
- Added support for multiple WAKE# case (Bjorn). But traverse from
  endpoint upstream port to root port till you get WAKE#. And use
  IRQF_SHARED flag for requesting interrupts.
- Link to v3: https://lore.kernel.org/r/20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com

Changes in v3:
- Update the commit messages, function names etc as suggested by Mani.
- return wake_irq if returns error (Neil).
- Link to v2: https://lore.kernel.org/r/20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com

Changes in v2:
- Move the wake irq teardown after pcie_port_device_remove
  and move of_pci_setup_wake_irq before pcie_link_rcec (Lukas)
- teardown wake irq in shutdown also.
- Link to v1: https://lore.kernel.org/r/20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com

---
Krishna Chaitanya Chundru (3):
      PM: sleep: wakeirq: Add support for dedicated shared wake IRQ setup
      gpio: Add fwnode_gpiod_get() helper
      PCI: Add support for PCIe WAKE# interrupt

 drivers/base/power/wakeirq.c  | 39 ++++++++++++++++++++---
 drivers/pci/of.c              | 74 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c             | 10 ++++++
 drivers/pci/pci.h             |  2 ++
 drivers/pci/probe.c           |  2 ++
 drivers/pci/remove.c          |  1 +
 include/linux/gpio/consumer.h |  9 ++++++
 include/linux/of_pci.h        |  4 +++
 include/linux/pci.h           |  2 ++
 include/linux/pm_wakeirq.h    |  6 ++++
 10 files changed, 144 insertions(+), 5 deletions(-)
---
base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

