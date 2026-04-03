Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A897D2765D7
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237632; cv=none; b=flG2t+J5/0Z6f4xtiAHnT1Yb+y4sTGEi0NGJXuR47wDZVsYyxuPYY6/b2t2zB/Wvp5tQl2BKgOug8CI3kmi4oUwMRccVUvqUm2oQlcTWC0sGWbfC3PvDGsB/WySgvsFFsfYx+3HAxSasbQmJrdcZnCPaNd8WoEKeT28rphTEOqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237632; c=relaxed/simple;
	bh=lquwIt3pxmUHrqV0hylBWdUZ9FzuojFhb4iwrjx2pmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GJXTeTRkF6jzAoEMnyba+h4fDQJ+VBG2kd60o13R61QzwuFcUo4eQ1hP9N6oNy2BrsK0TEVuBaAwpt+xty6g+xq/jjgS2Hrqqauxh+3UxtxsTUY8KbsP5jICAsFrfxw82wHW/ha6aUr/xEijEz+SNHMjHEAOAdmpUAF/UxYgb/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=at2SJ6nb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9ljkrB8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="at2SJ6nb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9ljkrB8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633BombW3780273
	for <driver-core@lists.linux.dev>; Fri, 3 Apr 2026 17:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WhdmUQMs0c12v3Jvg9TgqF
	jhlSe7hCaVqUcHAfWSqgE=; b=at2SJ6nbgXLGzolnsKGvZCjdDEWefMJ7i4Dpv3
	bybqmytK2vg4v876pkVJOa2bZrGAv4MKclN4uMMtGxwh91oQzbsxDNGRa58/VhS4
	BbrQHyLuDD9yXqWFj5febnt7YArMUMX0/xI284Dp380kkwM03/Qf6kPZTK/WGJ2Q
	jSGPB6O8ahVFfm7/WUaV+PCtjGKPAbeRc3BSnNMxGkVIFs7T61AaXwjxsJuWs3oF
	C9QFkl+QYZqn68jv6wXoGn5AfPAl3t/8q62uhJbuusZHA56HyP/moH+g0UJB7Me4
	EZOlYrvN5KRap8GkrICEUQ0KYSb2ghDrdOPvBRjLpVfRQw3A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da663j9fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:33:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6097ca315bso3294691a12.3
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237626; x=1775842426; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WhdmUQMs0c12v3Jvg9TgqFjhlSe7hCaVqUcHAfWSqgE=;
        b=i9ljkrB80goHCIkJY1IVxRHx2F8v5RwSe6iSEzWJZus03mfJpY5BW/zxoEV9J/t7Oe
         WjN1kyo22dI6n9My4uudfWP1+XufISq7IF44vWqbdWb9MkNnPmwvkl9/fx29U+1zRy45
         PK7bxZoq2xHhPVS7GuQ6rHs+Yvjf2ose2wEEJqiL3FuSjgoUllmJm25dtt5yiI1B+gMn
         wAyDjOEcUThVjVfG1hI0S0Gc9r1ulvub6sCfs02Jxep4vu3GzzBLpzC8n67FdFbIi6iG
         WdUDmGrXobam7DOM5FMpnvm3EAqg2L3gcC+z+ptN2HMqFbX2YhLGfEMi3tWUzeYnOmSV
         qq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237626; x=1775842426;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhdmUQMs0c12v3Jvg9TgqFjhlSe7hCaVqUcHAfWSqgE=;
        b=DBRO1sTzRHAwa/jD9VDY25JmtxenUXcGglfu6iBBbpy31Vl0op3ajhSaF/UxRNAr4R
         ZjSnduEcT/WndaKUfbSsnzv963GxpW6b4PchtZ82JH96+JN6HzMAY6AxBKLzL9xh+3W5
         Jp+MSV/SNFfV1M5TpqBkFyLHVCf15y0pk52fLP+8BSb4pBX1XKWVVYvgozEjbbFtQz2m
         FMDyPly+//NTLkZQ+dVaYtx6di0ocwB3koHhgkA6sJCKqVqVS7SbOCGWdmSg/SgfrcWN
         RiN3p4PrP06byxM9vVbJ4pS5R+UruLsPLmtgqE0ijrPeZ8LXTwq4Okc1wYuz07d9mM/H
         mmRA==
X-Forwarded-Encrypted: i=1; AJvYcCUgtvm02nKKGCoMrn0fF0r0nABfcDNg0GMO+PN3oJVER2V7FmH1remFfqqGvzrgJ6DAOskTq8SSY+f7LQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdfw3FbLoCps5qABI4HUGsranJctSKcDF2mhOO0ed0vhvLRw0F
	qx53tmg03smLDX34SLFPRtZrph3mB5BLBKVG+7Wnpf7V+zm96mDYA8yXLzypAdyVRN23S1xZ/BG
	VZCTBoaXu4kRU1dZRgmNgvUKNHs5y7gqErBETcASFj29BGaIT1Lwn7ke5dLJ/zSM9Gw==
X-Gm-Gg: AeBDievysg3ROsNL1NuECD9hG+L1VFvjrMyJ4BcT1eAxIgfImpsDQSCVaiD6U6wWcHQ
	v6Ue1KqHNftlPCNJdnNDW0/W/qLYbgWQVvnWpUcOxJMLYZE7Tk1lWb2GaV0SSspVH2gc8VDKNmx
	QJtmADWwM8wsURxxG/DDcgBi29JaCjmh3xktnTlst6kJvX+QqW2C3nwtUpiWcm8oN538ZguxgpO
	M58zI/IuAXNkZvG9iAkouRCMvxw2BoWATOL3fDZlU7MDwt7FEniL6IJYIoneMT2Ttv6FIsPJSiu
	1K7vuBZUhnXMdOYj9www8tSwsqBcyXO7sAD51Y32C9NXA+Bf0i15LZV7c49ZuySYlcRbtHpJrcJ
	zGjwWxLTqf2U6xAe5wwmod+VOKDnJEZHMhxb8w6VHuSn1uKPmA6xbPsBK
X-Received: by 2002:aa7:88d1:0:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82d0d743763mr3740142b3a.0.1775237626158;
        Fri, 03 Apr 2026 10:33:46 -0700 (PDT)
X-Received: by 2002:aa7:88d1:0:b0:82c:9e00:f958 with SMTP id d2e1a72fcca58-82d0d743763mr3740120b3a.0.1775237625642;
        Fri, 03 Apr 2026 10:33:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:33:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v9 0/3] PCI: Add support for PCIe WAKE# interrupt
Date: Fri, 03 Apr 2026 23:03:32 +0530
Message-Id: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOz5z2kC/3XP2wrCMAwG4FeRXltJux4yr3wPEam11eKhs9Wpy
 N7dThCF6U3gD+RL8iDZpeAymY4eJLk25BCPJdTjEbFbc9w4GtYlEw5cMgaCXs3OhXRa5kvTxHS
 mXgorVsYwtJKUqSY5H24vcb4oeRvyOab7a0Er++7b0gOrlRSoUMIx7bnlYGcx58npYvY2Hg6TU
 khPtuqL4T8YVRgFXiLzteAg/zD6zSjgDIeMLgyshcIaK+Cg/zD4YSpWDRnsn0IDRvcHo/nBdF3
 3BIk/+A+KAQAA
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=4614;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=lquwIt3pxmUHrqV0hylBWdUZ9FzuojFhb4iwrjx2pmw=;
 b=QXHiJZg8wKuUbnPRDefxKLKofMd2Hk//kpYpGCOguqCazl1tI4dSFeEgjPx3SLlmZYoib9O7B
 pJsk97SePNcD5M71XJY7KBn/d/1IUOfBLASlz2yrkMzmJKqUWandkNL
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfXxZoyMIK6uOP4
 vbJUZsFBv4tPUGC2i422ifmkhbz1FwoYR/HLUVQP8amMfQ/x/cmiNAAqrbi384sTymclC0TWbz4
 q41PsO3YnlJxwrbyRqTneyB2pawAvPDRnoaDkJX67h7HvBUWkPnScpxjztdjSCaqbG+9XYo/FLy
 BGto1bZaq1NkPstJ9mJL5eRUR69E15QgekU/KsB5zNuZBxF9YcBj7dV1OWwT04zRKadptEAc1mO
 dv/xDP4eVx9ufyZxzXaPeuo0LUpaV0ioWTqvbzL+DEix0LiCOPSsMP2CfGtzSbCmfODAnzH6ZHh
 3MBQY/87I5FrmQzBMSxk3LmfazgkDmGZWMqDAk47upqBDmJcnIU8KvtjozbyZtRrU1LlvSGLSCz
 YPw13MN5MjM3pr/I3EGxPYdGgBxnTMlAYYl8XzaXEnQQ6RZnbIjyfSTvTwV6/QgMDnXICbOueyg
 r+dBigYCr7ujLmkg/xw==
X-Proofpoint-GUID: pMi7kEHyqkgY76R1d0AanAT9bCAAy15R
X-Proofpoint-ORIG-GUID: pMi7kEHyqkgY76R1d0AanAT9bCAAy15R
X-Authority-Analysis: v=2.4 cv=Acu83nXG c=1 sm=1 tr=0 ts=69cff9fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=bBQ1TlrZeL130n7Dx0UA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030156

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
base-commit: d8a9a4b11a137909e306e50346148fc5c3b63f9d
change-id: 20251104-wakeirq_support-f54c4baa18c5

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

