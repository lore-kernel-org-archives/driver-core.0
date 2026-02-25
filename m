Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7233AEF22
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022784; cv=none; b=d6t7wXRr4BspKqQW7qLEzoQeEH7/SXx0Y+p48EV42mh1flYqL9PlEf7yK0GyVj2kV+v2ws33+Bg2AKA2OpixuC/Xgzl9UtIxsmYb/kD+211XxHNtKaEnshrMosA+T7oyJZOsm93UMfZpRSTQaAxRHqaVXOgGojKZSvAxX+0MKj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022784; c=relaxed/simple;
	bh=LtELDaF5sq+sB18P62W54VA8G1PC1HSPJ/ZM2pbLYnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIw3pR2+QlToxz9X05MLWqo68D50CtMxk9hwuJZbQnKcywqAVU/ZGNxYe9i7WGbptyDrORbD39vq9sncDOcmeattaRs8/SkcuDr80WUPz7/C/x64OL2aIdB8aCQzPgxXwmjuuodR4WzlJWa4LRSFWtd6Y2GSmifbTMe3k1wHUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVInIVhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgXv3lqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVInIVhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgXv3lqz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SpJM229695
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 12:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b/lps+5NVJfzR1ZbAH0T5eG7oVjapVtfLtLhJNeInsY=; b=kVInIVhUvJCsXrf0
	sL0BXRIt5hDpXEjUT9mRdxADaiDKSG3pGItuf0XsUubWlJBW5afxUEStRcUjdtOC
	LRGeQHTS8quLcExDWzH1dRiYj0E1HoJwkeuuh878jbSUxr4XZZvczUVWvaKoqf/1
	jHribSwYfk4/SsF5TBpVVXB/r2GprUFsP5foL5j1iuXSJA6znCf0vwB7sxMsJhOX
	ITmD/yqB3cHD7bHPaqLyyHXD1978H5tycX5S/O4G8dkQ17VomFk+fzKNMErF4Y8f
	mzREVElUgP0VobbuB1qYrpiU7GcIKaoZWKpnTMUqzIUgbQ3I1My19fwrvruyNMVj
	nTXgsg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37u76h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 12:33:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35626b11c51so5237653a91.1
        for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 04:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772022781; x=1772627581; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/lps+5NVJfzR1ZbAH0T5eG7oVjapVtfLtLhJNeInsY=;
        b=dgXv3lqzhEvfUWDNcNayijLNISfn8g5WcorTNvkLC0gKbEsu8+/yzRLAKQNqFtcCt6
         N2eWYu0dvWM6D8XN2nGVlIZO88LvlivlouQhfLMVE3AfayiNi1D1wcLP86mB3Ylp4QIa
         FBk4d1kTTF70SVKyA7Dl193RzrLX4h1wBgqBAMgl9gOLEyveI9qL5wsfz3QwnPB3hkc1
         1F7M6U8YotwAuzA8OSZ5IEki0bQ8/sgtOgJsUdv6dgPg/HseBzSfHMHNc02eKgZPFW0g
         pYMzZfjdFI/6rYx4M5QiBH2wMkIsTbvCxuEPeRI4tFtvMsThia9pnfuZoR+zXW/P2UQQ
         6Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022781; x=1772627581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/lps+5NVJfzR1ZbAH0T5eG7oVjapVtfLtLhJNeInsY=;
        b=w9mPsSSWaKHSLeX88VoGs7Fn+CnI4YuC9W77mVN5Mf51lu6/XzmnmeF+dwSSFS/Ppp
         6xW+Tle/IqPSx1rh48mMwlAB+nT5b5GUo9npUG2miUTWRbajnvbtDkq5sV/+kf4gDjkD
         lMuW+/xUy/DePKycV10W1q9e8oo4vXD+aAmVcIdulKJzQUBDP6ERk5zgcngdV53Gr7Eo
         sAsDizbtAXOfSCjq+Ym5+APMxmBzNsxK4jqJifp4b1f4UlWN5rE8zi4llt+oG3FhnlMG
         b/wXIhZfihPnVtJhpKM58NbpurxWKVBgog5RfuQjZMnfpnLlpgLoQOh4wBJuMvH34PvS
         Gddw==
X-Forwarded-Encrypted: i=1; AJvYcCV9M5/GwR98gFSFE0UjQ8xmLNQgtoudbENWwUpABXYp9ha4VvLSpRj2Zw0Lb7uAS53czPysAUfEsDRDBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfLmkY/adz1ZIYPaPNEe8l8HxpcIUMGZxf4BfYUjbMthKhkGog
	QRYWRy7BK7FR6IGxBQ8wsPcUglFrQEXEWrOCLnRMToLHW7bgao3bGM/LHTJuSfZ4DenP2TIAZG9
	zj94QcoM1OlJjqqkCH2dvMV8Y6cET/IjgOP424LUNpUvJ+oL7thm8/e2WZ3mHXJkQBA==
X-Gm-Gg: ATEYQzxE5D5aKmTyY2WLDWN+HRQiM5VUSIm9KUE/+y7fFnxd80f8mHm+mjoY0Nuu0xZ
	qhpAC4fOY2209sGqr2C/alOOPgtlaAj8PiEDc19ncUtcCYsdMG/fibnII4DCWbgMGakVqLJPjR9
	5t5e7Wf9B1msHCwr8AvvwqAHTiSBd0gp7eYFIDkoD7HTZJEnC2kxt0S1l53UU1zU9xLy2H/yNTw
	ppwCL3UPJOcM9I85XQG+LtdoK6letHHaKdTLKP1EyjkQg2rQNhbrSQbL23RAgCTrHwkRkIOgvCZ
	AEu4RjtlATukLZpB8PxwATJCoNAurdOKVJ5YoUTa0NWZvbgAcFces/HOfMLOSVCK1XhXSaVTjLx
	evbu/ubS0f+gW0DJGKXHHSmuKhZSLukwOSnPZ32LwuIgI1LuKFtGsdg==
X-Received: by 2002:a05:6a21:512:b0:38b:e750:bc31 with SMTP id adf61e73a8af0-39545eeb17fmr13378780637.32.1772022780602;
        Wed, 25 Feb 2026 04:33:00 -0800 (PST)
X-Received: by 2002:a05:6a21:512:b0:38b:e750:bc31 with SMTP id adf61e73a8af0-39545eeb17fmr13378734637.32.1772022779902;
        Wed, 25 Feb 2026 04:32:59 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34fe7sm133133125ad.2.2026.02.25.04.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:32:59 -0800 (PST)
Message-ID: <8b6e1772-6659-4c80-a3fd-ed624218d7be@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 18:02:52 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] PCI: Add support for PCIe WAKE# interrupt
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev
References: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
 <20260218-wakeirq_support-v7-3-0d4689830207@oss.qualcomm.com>
 <pjeee3vwggsrvp4kxarc46vjx2igk53xd6eoxjqh7ri5rf6fhi@5d3ccirqnxu6>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <pjeee3vwggsrvp4kxarc46vjx2igk53xd6eoxjqh7ri5rf6fhi@5d3ccirqnxu6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699eebfd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=P-IC7800AAAA:8
 a=KKAkSRfTAAAA:8 a=XLNvHsjt_HEOQZ6RAGwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMiBTYWx0ZWRfX+M9TBr80dew0
 5FYgthaeawMG3n1jwbWxhcb+HHonKBybOwdrZopDaooyrTyfMQT4GuU+EQfy3ByNNfW5uxJb4kC
 toI0t3+gYjHDJhjsp7VISfAf5sz/YeJp1Wlo3viyA7BwWr6CTzxKrLxJN45cP4O3gZqMPS2FRhr
 1FxVWIbWj8orTzcBFfiH51hTIEFjN4sEoMiXttXRougIjmiGR/4JoFFShWPpi650gzPelhR/PbI
 RI6JddU7L8m2Gf2gjBcPgD/M6qBDWt6vfezuR+XnaRrk85GiLph5b3Uyf1FHAfJGge6Uj1fn35O
 dZOVj8aYVMnerCLDhmVqNzQ534UbzaJW0nkIQrNrJqX0bE+e94+tmM3mS7/2FPLp9/i3B7/2mE5
 CMnM/OVwJBoN8eMyq15SKlfs4d+veHxIVZGNwAAJROvTG0Pa2yj6Qf8vslVpAF2IjDiBSv6xfV2
 tleHEw5/3RNWrRjvwjQ==
X-Proofpoint-ORIG-GUID: DR86sAzfiajjv4ROigfLirgAgC4r4dlJ
X-Proofpoint-GUID: DR86sAzfiajjv4ROigfLirgAgC4r4dlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250122



On 2/23/2026 7:37 PM, Manivannan Sadhasivam wrote:
> On Wed, Feb 18, 2026 at 01:42:25PM +0530, Krishna Chaitanya Chundru wrote:
>> According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
>> two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
>> hardware-only mechanism and is invisible to software (PCIe r7.0,
>> Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
>> the PCI core.
>>
>> According to the PCIe specification, multiple WAKE# signals can exist in
>> a system or each component in the hierarchy could share a single WAKE#
>> signal. In configurations involving a PCIe switch, each downstream port
>> (DSP) of the switch may be connected to a separate WAKE# line, allowing
>> each endpoint to signal WAKE# independently. From figure 5.4 in sec
>> 5.3.3.2, WAKE# can also be terminated at the switch itself. To support
>> this, the WAKE# should be described in the device tree node of the
>> endpoint/bridge. If all endpoints share a single WAKE# line, then each
>> endpoint node should describe the same WAKE# signal or a single WAKE# in
>> the Root Port node.
>>
>> In pci_device_add(), PCI framework will search for the WAKE# in device
>> node, If not found, it searches in its upstream port only if upstream port
>> is Root Port. Once found, register for the wake IRQ in shared mode, as the
>> WAKE# may be shared among multiple endpoints.
>>
>> When a device asserts WAKE#, PM core will wakeup the system, resume the
>> device and its parent(s) in the hierarchy, which will cause the restoration
>> of power and refclk to the device.
>>
>> WAKE# is added in dts schema and merged based on below links.
>>
>> Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
>> Link: https://github.com/devicetree-org/dt-schema/pull/170
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/of.c     | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.c    |  9 +++++++++
>>   drivers/pci/pci.h    |  8 ++++++++
>>   drivers/pci/probe.c  |  2 ++
>>   drivers/pci/remove.c |  1 +
>>   include/linux/pci.h  |  2 ++
>>   6 files changed, 77 insertions(+)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 9bb5f258759be3f1e23496f083353600a4ef6743..23248900253faafaf9509d87c531b454fca41798 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -7,6 +7,7 @@
>>   #define pr_fmt(fmt)	"PCI: OF: " fmt
>>   
>>   #include <linux/cleanup.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/irqdomain.h>
>>   #include <linux/kernel.h>
>>   #include <linux/pci.h>
>> @@ -15,6 +16,7 @@
>>   #include <linux/of_address.h>
>>   #include <linux/of_pci.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include "pci.h"
>>   
>>   #ifdef CONFIG_PCI
>> @@ -586,6 +588,59 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
>>   	return irq_create_of_mapping(&oirq);
>>   }
>>   EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
>> +
>> +static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
>> +{
>> +	int ret, wake_irq;
>> +
>> +	wake_irq = gpiod_to_irq(wake);
>> +	if (wake_irq < 0) {
>> +		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
>> +		return;
>> +	}
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +
>> +	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
>> +						   IRQ_TYPE_EDGE_FALLING);
>> +	if (ret < 0) {
>> +		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);
>> +		device_init_wakeup(&pdev->dev, false);
>> +	}
>> +}
>> +
>> +void pci_configure_of_wake_gpio(struct pci_dev *dev)
>> +{
>> +	struct device_node *dn = pci_device_to_OF_node(dev);
>> +	struct pci_dev *upstream;
>> +	struct gpio_desc *gpio;
>> +
>> +	if (!dn)
>> +		return;
>> +
>> +	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake",
>> +				GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
>> +	if (IS_ERR(gpio)) {
>> +		/*
>> +		 * In case the entire topology shares a single WAKE# signal, look for it
>> +		 * in the upstream bridge node. But if it is not Root Port, then skip it.
>> +		 */
> This comment need to be a bit more verbose. Something like,
>
> "The devices in a hierarchy expose wakeup capability through the 'wake-gpios'
> property defined either in the device node or in the Slot node. So first check
> for the property in device node and if not available, check in the Slot node."
>
> Also, move it above fwnode_gpiod_get().
ack.
>> +		upstream = pci_upstream_bridge(dev);
>> +		if (upstream && pci_is_root_bus(upstream->bus) && upstream->wake)
> Check directly in the Root Port (Slot) node.
>
>> +			pci_configure_wake_irq(dev, upstream->wake);
> I don't think we need to request an IRQ in the fallback case. Let's assume that
> there is a single device in hierarchy and the wake-gpios property is defined in
> the Slot node. So here, we should just let the PCI/PM core know that this device
> supports wakeup and PME_EN needs to be set (if the device is also capable of
> generating PME#).
>
> And then we should call pci_configure_wake_irq() from platform_pci_set_wakeup()
> to setup the IRQ handler only for the device which has the wake-gpios property.
>
> So the flow would be:
>
> pci_device_add()->platform_pci_init_wakeup()->of_pci_init_wakeup():
> Request fwnode_gpiod_get() and call device_init_wakeup()
> and set 'dev->wake' if WAKE# is available in the device node. If not, then check
> the Root Port (Slot) node and if WAKE# is available, then just call
> device_init_wakeup() to indicate the PCI and PM cores that this device *may*
> support wakeup.
>
> pci_enable_wake()->platform_pci_set_wakeup()->of_pci_set_wakeup():
> Request WAKE# IRQ only if the device has the wake-gpios property ie., dev->wake
> set. If only the Slot supports wakeup, then the IRQ should be requested for the
> Root Port device. This will allow us to keep both the ACPI and OF platform code
> in sync to some extent.
>
> Then once the WAKE# is asserted, the platform will wakeup with the help of the
> above wakeup event and the host controller driver will apply power to the
> hierarchy.
>
> But you do not seem to call pci_pme_wakeup_bus() after resume...
when we call dev_pm_set_dedicated_shared_wake_irq(), this will request 
an IRQ and by default it will be disabled. The IRQ will be enabled only 
in case of system suspend & after runtime suspend and only if wakeup is 
enabled for the device. I will add this info as a comment, so that it 
will be more clear and also in the commit text. The IRQ handler which 
will be triggered as part of WAKE# IRQ will trigger pm_runtime_resume() 
as per[1]. This will resume the devcie from D3cold to D0. once the 
device is in D0, the endpoint which requests the wake will send PME 
event and that is handled by PCI core already either through polling in 
pci core [2] or pme service in porbus driver[3] [1] wakeirq.c - 
drivers/base/power/wakeirq.c - Linux source code v6.19-rc5 - Bootlin 
Elixir Cross Referencer 
<https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/base/power/wakeirq.c#L163>
[2] pci.c - drivers/pci/pci.c - Linux source code v6.19-rc5 - Bootlin 
Elixir Cross Referencer 
<https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/pci/pci.c#L2378>
[3] pme.c - drivers/pci/pcie/pme.c - Linux source code v6.19-rc5 - 
Bootlin Elixir Cross Referencer 
<https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/pci/pcie/pme.c#L82>

- Krishna Chaitanya.
>> +	} else {
>> +		dev->wake = gpio;
>> +		pci_configure_wake_irq(dev, gpio);
>> +	}
>> +}
>> +
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev)
>> +{
> Missing of_node check.
>
>> +	dev_pm_clear_wake_irq(&dev->dev);
>> +	device_init_wakeup(&dev->dev, false);
>> +	gpiod_put(dev->wake);
>> +	dev->wake = NULL;
>> +}
>>   #endif	/* CONFIG_OF_IRQ */
>>   
>>   static int pci_parse_request_of_pci_ranges(struct device *dev,
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index f3244630bfd05b15d52f866d80a015ed21f98f49..225cb861b3425700fc0d9d4805f5d9efcaab6f56 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -1123,6 +1123,15 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
>>   	return acpi_pci_bridge_d3(dev);
>>   }
>>   
>> +void platform_pci_configure_wake(struct pci_dev *dev)
>> +{
>> +	return pci_configure_of_wake_gpio(dev);
>> +}
>> +
>> +void platform_pci_remove_wake(struct pci_dev *dev)
>> +{
>> +	return pci_remove_of_wake_gpio(dev);
>> +}
> As mentioned above, these should go away and be part of
> platform_pci_set_wakeup().
>
>>   /**
>>    * pci_update_current_state - Read power state of given device and cache it
>>    * @dev: PCI device to handle.
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 13d998fbacce6698514d92500dfea03cc562cdc2..22709573e41caf0ed45b20ee7ded5963f55aa9fe 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -282,6 +282,8 @@ void pci_msix_init(struct pci_dev *dev);
>>   bool pci_bridge_d3_possible(struct pci_dev *dev);
>>   void pci_bridge_d3_update(struct pci_dev *dev);
>>   int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
>> +void platform_pci_configure_wake(struct pci_dev *dev);
>> +void platform_pci_remove_wake(struct pci_dev *dev);
>>   
>>   static inline bool pci_bus_rrs_vendor_id(u32 l)
>>   {
>> @@ -1195,6 +1197,9 @@ void pci_release_of_node(struct pci_dev *dev);
>>   void pci_set_bus_of_node(struct pci_bus *bus);
>>   void pci_release_bus_of_node(struct pci_bus *bus);
>>   
>> +void pci_configure_of_wake_gpio(struct pci_dev *dev);
>> +void pci_remove_of_wake_gpio(struct pci_dev *dev);
>> +
>>   int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>>   bool of_pci_supply_present(struct device_node *np);
>>   int of_pci_get_equalization_presets(struct device *dev,
>> @@ -1240,6 +1245,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>>   	return 0;
>>   }
>>   
>> +static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
>> +static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
>> +
> You've added function definitions under CONFIG_OF_IRQ, but stubs under
> CONFIG_OF. This is why kernel robot also barks at you.
>
> Move the stubs to include/linux/of_pci.h under CONFIG_OF_IRQ guard.
>
> - Mani
>
>>   static inline bool of_pci_supply_present(struct device_node *np)
>>   {
>>   	return false;
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 2975974f35e88b5025701d2b721df8386419de8d..7f5132c0c8de36a6ec2775468a3d4e5156a046d0 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -2771,6 +2771,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
>>   	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
>>   	pci_tsm_init(dev);
>>   
>> +	platform_pci_configure_wake(dev);
>> +
>>   	pci_npem_create(dev);
>>   
>>   	pci_doe_sysfs_init(dev);
>> diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
>> index e9d519993853f92f1810d3eff9f44ca7e3e1abd9..d781b41e57c4444077075690cec926a9fe15334f 100644
>> --- a/drivers/pci/remove.c
>> +++ b/drivers/pci/remove.c
>> @@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
>>   	if (pci_dev_test_and_set_removed(dev))
>>   		return;
>>   
>> +	platform_pci_remove_wake(dev);
>>   	pci_doe_sysfs_teardown(dev);
>>   	pci_npem_remove(dev);
>>   
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..d1e08df8a8deaa87780589f23242767fdcdba541 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -586,6 +586,8 @@ struct pci_dev {
>>   	/* These methods index pci_reset_fn_methods[] */
>>   	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
>>   
>> +	struct gpio_desc *wake; /* Holds WAKE# gpio */
>> +
>>   #ifdef CONFIG_PCIE_TPH
>>   	u16		tph_cap;	/* TPH capability offset */
>>   	u8		tph_mode;	/* TPH mode */
>>
>> -- 
>> 2.34.1
>>
>>

