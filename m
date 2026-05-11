Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D113806DD
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778484366; cv=none; b=h+WbgTsvPsg3jeWTCMXCmLV5rkFKZWCi288GQRe1SwoHK6JnKPAFZnuhxRFzWZ/X0EVfo/8DThi+cL/Glp/hDr6JWcbID6URJRZNOkHk4ye/L2iJF9AAryTHkcA1cB3GwMS7NLGIA+hFfC1zVD3NQIBz2xKvAGAKFhpCGqmfVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778484366; c=relaxed/simple;
	bh=hkS3MGd5vdH6MTFE3zmkhrklxC7+m7j4op2aa4ecEyw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YbWUIYdCeeWw9uxB6YAXbq0xlE7oykuVwyPorSI39xUrLz/ztn+z8xQAEzIDevS16D7xVoqJJJJ1tx5Kq79O1kVx3r504dnIcdfaisnxXgvNWgftsmst3qwxkkNeYW4Gmkauy5iiHRM5b1VEG3wU8a8JL8aIrnUnG9CXTMXPRdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxWnyf1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvkeIIDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxWnyf1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvkeIIDj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B0LpYi3557324
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MlewpCeDeyZ4jxE5CUustr
	2f2yGW73aObsLOlDvSyN4=; b=HxWnyf1BEKSq+8HrMj5xMRPF2YecnOTWouRQjl
	oRKduwxBwtOmWIk8/Htlp14yHmUI9KKGMf5POXXp0G0Tif/mJU3JaSnHoQkeqceL
	uGSBCoynaOWwwxtZv8SpBhXzn5UMj5DWUKnZaJ9A3vx3zvbWP/uQ4r7iylS3K3Ws
	r962lz8mDkX4jbDfLBZKJ/bMLyG2PcObLond5Mx/l4BV33byx2F1mauwb+BlSaQG
	fpkBowMaj94WdTAW9r5IdLMzXj6PNyt6EMHyS0NOk/BRsp/kz0Df+oG/G08/ut82
	IY9Qo9+kaB5KbnuQbhxBXCBcsIc7QTXjtcsvQAkdC3N1Yp0A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x79mt1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:26:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365c5ca76fdso3083249a91.2
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 00:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778484363; x=1779089163; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MlewpCeDeyZ4jxE5CUustr2f2yGW73aObsLOlDvSyN4=;
        b=SvkeIIDjhOlOPbYLImC+R5wMZU1adQCRI3/y3CtUZgvukGMzBPRxbgmjGKHYo6ae1p
         8TppBGv6TYDglILrra5PY1a7QEtGhENnT5VhIXqtcXnewpPKnsxeS0f2i0togY+z1pN/
         0VWOT/HjMy05EGaOtkP5eKuiHYEdM5zJLvWEOFNyieW8fh6k6bLzqCaI8e80Ebo+NcxW
         TLDehScVx3Nf5mre3ET0b6dwscvCipBkmktvxZ4x98uHtFahlbuQ6nipuTgSV8sfKn0z
         fYwaB3FUvT3cZ4i23WF0TQZ7GD/Sa1nLwEX84BZVXNl0c1ozQpI9uiHuA9NoYr7WpOAb
         Hpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778484363; x=1779089163;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlewpCeDeyZ4jxE5CUustr2f2yGW73aObsLOlDvSyN4=;
        b=eqjxtekwKS9KwrVjlVw6YnM5qGhut9EFcBSRjbHKGfC9JtTrwLxAJm1DFzi7mSEpSD
         6vvnmen63HauvaxDqHThk4g33hlPV8b9K8zmHKbEBgW+xDnrwgPClEn9pki8I/NmRjU+
         aryZjztSipXYIQppfSpFrobsSYs+3Y/3D5Nb6ExVlz6NxwuWnlqtQHM91PcKvmnaHcAY
         arMeLyF4ZUmQOqgaeSpetWeYGtf3OCUYvP4IGTauH69v7EzzP1B1LJ9JxXqqkdyjUvMT
         7Z2eD0kNiqhRw5dFpEafZxhAppir1UQvtgsk6Cg50XDvO1Bf76vtzWwA2oDMYwsbaLMc
         MlBA==
X-Forwarded-Encrypted: i=1; AFNElJ+GmmcJ4GVcYOOCW634U4znJZNM4KGHbBY8THzxS++ojCCauiNjDJMKiXp0Iug1VBW1qVtYij4MYydArQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBKw6RiIeSk3qbAPKZiiocB1DkLCtXuo5714DKel3RtJLiMEAa
	tAt5ukaXfOyekL82cjAwZSAQclOGbqC9XlhubUfpk2KYB3UGfS+uFZs++o1cmdHbWuQxvmxVYIA
	fuFrmgM7MNcXZwwW+slApG4oOp6Sb7F1cgpB6/aPnOBR7COzJzCF3iDIs9whgImBg7Q==
X-Gm-Gg: Acq92OHGaB64WxuruNssrUVbeZrn2YDVc2znSB/0brf9n1h3cMlWt5skHJ1bnNGAKto
	Yr2uJUxhR21hAUGy1Ah6Wqo6zpc6FtW5fYaOq2g3PCzqTgGKC/Z9VVtQjdBtaSQqhm7pjUf4rRV
	anbEFOZNd9/2pPjoYCeOgkR6q4b5rtI0ZwtlLZ9v9dxqwhslz8U/KiKcI4HYne+CVH7wfKw+k12
	OFP5+BflVNx0pTHsoeNrtHIdAEctmSg+Q6VxNYXBfJUrhmPn9jh67EhZtXdvOPcGQ2cyM87s+2I
	Td3D3CSAJu1/J3p0CYm+9sjsl+ukrAvc8zIQcjwg3avU5ovxreTNsu20yGqh92Svt4G/KSGHBy7
	GaO6lwrVxzCScnw3gGVud+HpF7pyQfZh9JseV6pAZRLKAEDP/f8HOv2D4
X-Received: by 2002:a17:90b:3a0f:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-365ac9913f3mr22736352a91.27.1778484363044;
        Mon, 11 May 2026 00:26:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:35b:9896:cbcd with SMTP id 98e67ed59e1d1-365ac9913f3mr22736304a91.27.1778484362279;
        Mon, 11 May 2026 00:26:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367beac2c7dsm3314306a91.5.2026.05.11.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:26:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v10 0/2] PCI: Add support for PCIe WAKE# interrupt
Date: Mon, 11 May 2026 12:55:36 +0530
Message-Id: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCEAWoC/3XP24rCMBAG4FeRXBuZpDlM92rfY1kkTZM1rJqaa
 FWk776pIC60vRmYgfnmnwfJLgWXycfqQZLrQw7xWBoG6xWxO3P8cTS0ZUA4cMkYCHo1vy6k0zZ
 fui6mM/VSWNEYw9BKUra65Hy4Pcmv79LvQj7HdH9e6OU4fVl6YvWSAhVKOKY9txzsZ8x5c7qYv
 Y2Hw6YUMpK9+sfwGUYVRoGXyHwtOMgFRr8YBZzhlNGFgVYorLECDnqBwTdTsWrK4PgUGjB6DIx
 mganfjIAZpi4Ms42zvmoktnNphmH4A5TFEF3SAQAA
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778484355; l=5027;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=hkS3MGd5vdH6MTFE3zmkhrklxC7+m7j4op2aa4ecEyw=;
 b=WpbV6hfanGgjrUU4ds4cjqfOu67pGorwdJjQAGb2fQ0schkPvEwSFzrk45M421efyLP9Ok2bz
 uNnev+zSyzbBoyzXuxuSmeN3N6qN9tYC72LroRanV4EUob10cTu4Nvt
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: XEi2-dKS_UyVu74fosf77q3O1jS8iiSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4MSBTYWx0ZWRfX/lCZ4G9OZaUT
 khsciBr6AH1MxNZpMK5GH96h2D3gPpxagdvKyi3nJmk2F7DRVBJlrdGGAnkNpIw4A3vr1GRQYVl
 5hEeix0iRDRl1FJu1VHCna5QdvBbXo41xQZ6b7MAibf2kYsysWAKQn09y3ceUsTQaUVPFvudO+r
 CzXRE3PXrF9OawpIWhG8zsF3Lkcw9QfG8BGtRygoHfMJTQdf8vB4Mw+LqXgkEZBamg5D75Re18O
 Q9xWA7Wlk3zyS7X01b3//2N5oGTQi55r8wDQ/BtHsyQ+f/J41axz0FqXjUZewy4+BQB3SuwFbkS
 6Yr1S/sZvvTKder4TG2U4bgtdrP6tVxnsjTjNBbKw099EAb/2t9axBie5/ZuqoaB6Nz2kB1hTmZ
 7c6zsT/SDp4rSr0UripdaBSlT1+ABl4kiyZeKkGqk6PJ7gwT2HwE11Fn66VIO65sJuYk6XKI335
 Ql2DDe/ep5ZBjuxjhlQ==
X-Proofpoint-GUID: XEi2-dKS_UyVu74fosf77q3O1jS8iiSG
X-Authority-Analysis: v=2.4 cv=Yvo/gYYX c=1 sm=1 tr=0 ts=6a01848c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=5_YdMucviHHNaXn7sfYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110081

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
Changes in v10:
- As sashiko pointed, shared irq has plenty of race conditions.
- So we are moving away from the shared IRQ patch and registering with
  dedicated wake irq only, as part of wake irq the link will come to D0
  as the parent controller driver will be runtime resume first and then
  pme service will kick in wake up correct endpoint driver.
- Removed device_init_wakeup() since it enabling wakeup explicitly,
  which is not intended as this should be set by endpoint driver only.
- Link to v9: https://lore.kernel.org/r/20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com

Changes in v9:
- Call device_init_wakeup() only if
  dev_pm_set_dedicated_shared_wake_irq() succeeds (Mani).
- Change the IRQ_TYPE from IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW (Mani).
- Link to v8: https://lore.kernel.org/r/20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com

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
Krishna Chaitanya Chundru (2):
      gpio: Add fwnode_gpiod_get() helper
      PCI: Add support for PCIe WAKE# interrupt

 drivers/pci/of.c              | 72 +++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c             | 11 +++++++
 drivers/pci/pci.h             |  2 ++
 drivers/pci/probe.c           |  2 ++
 drivers/pci/remove.c          |  1 +
 include/linux/gpio/consumer.h |  9 ++++++
 include/linux/of_pci.h        |  6 ++++
 include/linux/pci.h           |  2 ++
 8 files changed, 105 insertions(+)
---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

