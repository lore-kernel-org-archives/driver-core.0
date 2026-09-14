Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CE048095A
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397469; cv=none; b=gyqSOW5LNLrdeKJwexjF1aE3IXqWEb7Imyngx2ZbSR6FdghYQi+pPU/bypAI7QPwXqdbW94V4+D6sGIWZh1Xpuz6ebzzjINIie5v1RyROnFg8Pjzo7bGnxmUFjO/UbHK/5AGKKArVg4OLoPeSha/5cPuBAC+ePLMCzHL3RY3t4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397469; c=relaxed/simple;
	bh=4eY6nSFOq/Va/DPcpboYKZBk7jH8z6qFhz7/XnF2Xng=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AwrKmHuHGqEDuNWiFoCLzFa3ahEUuYANDfPwOEqaeKh7boO4CNr6SEzn74lwkzs28JiIuMhkqKuFFYUifi9jbCpcfOoZcNvtAUa0e3iJmQwmujUR8Dtinwt0yuVc/Q8LQT3yHRI9mv3zF979eViYJ/8ILfVYDYMg6guLtWibny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mjlA8VU3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mjlA8VU3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99FD91576;
	Mon, 14 Sep 2026 07:50:53 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14DF33F86F;
	Mon, 14 Sep 2026 07:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789397457; bh=4eY6nSFOq/Va/DPcpboYKZBk7jH8z6qFhz7/XnF2Xng=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=mjlA8VU3/wPr4fGHLHOy27VUoOJLDK1Md9hbXusyenIG6Msi/NrGc576r3T5+P3ND
	 v3aAKee9OQwjnzEy+PLeuoA6Uj242BSoJDCG6X0rq92iZ1mhcCsy//bagStF39M71f
	 Btik+Fsx1UPmE+fqdCbNXgGpBvJqqxxifhkIAvA4=
Message-ID: <07d32b4c-1f00-45e5-b318-0f28bbb46f33@arm.com>
Date: Mon, 14 Sep 2026 16:50:50 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
From: Andre Przywara <andre.przywara@arm.com>
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
 Rob Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Ben Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
 <f71cfbcc-2e53-4e37-bb98-693996542396@arm.com>
Content-Language: en-GB
In-Reply-To: <f71cfbcc-2e53-4e37-bb98-693996542396@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/14/26 16:41, Andre Przywara wrote:
> Hi,
> 
> On 9/14/26 11:37, Yin Li wrote:
>> From: Rob Herring <robh@kernel.org>
>>
>> The binding is designed around the assumption that an MSC will be a
>> sub-block of something else such as a memory controller, cache 
>> controller,
>> or IOMMU. However, it's certainly possible a design does not have that
>> association or has a mixture of both, so the binding illustrates how 
>> we can
>> support that with RIS child nodes.
>>
>> A key part of MPAM is we need to know about all of the MSCs in the system
>> before it can be enabled. This drives the need for the genericish
>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>> until a h/w specific driver potentially enables the h/w.
>>
>> Cc: James Morse <james.morse@arm.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 +++++++++++ 
>> ++++++++++
>>   1 file changed, 199 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml 
>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> new file mode 100644
>> index 000000000000..53a6fdbbf05f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> @@ -0,0 +1,199 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>> +
>> +description: |
>> +  The Arm MPAM specification can be found here:
>> +
>> +  https://developer.arm.com/documentation/ddi0598/latest
>> +
>> +maintainers:
>> +  - Rob Herring <robh@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: arm,mpam-msc                   # Further details are 
>> discoverable
>> +      - const: arm,mpam-memory-controller-msc
> 
> But that doesn't match the examples below, does it? Don't we want to 
> allow just "arm,mpam-msc", but also the memory controller string, with 
> "arm,mpam-msc" as a fallback?
> I guess the pattern should then look similar to interrupt-names below?

Just seeing that you fix this and other things up in patch 08/10 later.
I think it's confusing to have this split now for a v2 still. I wouldn't 
be aware of previous review of this original patch, so it doesn't really 
matter. Please squash them.

So I think you should merge 07/10 and 08/10 into their original patches, 
otherwise reviewers might just get confused.

But you might wait for a bit with a repost, to see if there are more 
generic comments on DT support.

Cheers,
Andre


