Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC16481FB7
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887828; cv=none; b=jUx3TmScSFCg9LBV4HXpN5YFcAXw7wvXM8J+nEzrs2o0p0x2dN0OVrjAyKOxh8Lv/nuq2rd/Hn4S+LUEcQSYk3L45cGdwWvaaQPdDCDMawiQnbE+DSHNglpvhuVEJtzIN+b6sgvuBQZCKoihWx6QTNW8fTb95DoUo6T7icXSGW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887828; c=relaxed/simple;
	bh=Mh0tHP0zmojBiDfOy1rkxRGn/+RuEeoHsjseVp7M4GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFVkX5fPAcPBG2O/pKlO4sk049PaczuiIlOEk1vR4ZUO7HN7DWYh60huVMPbyzx4OyNwGPH6oFazAPFQ2nt7bG48XzplRt844GlSgpFKktAhi8GSxvllp031bwYghmIzuo8h10Frxz4+KWCIqTcnRcl15tzt/ND5lXrqAObo9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=p2H+/bCw; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="p2H+/bCw"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFD4169C;
	Tue, 13 Oct 2026 03:37:03 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECB6A3F7B4;
	Tue, 13 Oct 2026 03:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791887826; bh=Mh0tHP0zmojBiDfOy1rkxRGn/+RuEeoHsjseVp7M4GI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p2H+/bCwrB5D/MqEuOkmydkFoR47CcvySBVRZokvqjmLZNw8aFXm8ca/nC4jgTt2Z
	 NqLrNECXPseZeuCSsmH+bev5SNyHw+DeVnGi0FCoJB2hAx5f0Y3TksBuZ0LcvlC6TF
	 m3jDXkSrv0UL7q2IgiYt/B7bYSL/ist0tegHPPNQ=
Message-ID: <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
Date: Tue, 13 Oct 2026 11:37:01 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Drew Fustini <fustini@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yin,

On 13/10/2026 11:13, Yin Li wrote:
> 
> 
> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 12/10/2026 11:48, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>
>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>> the root of the physical address space, so each cache node only needs an
>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>
>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>> is not intended to be merged.
>>>>>
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>
>> [...]
>>
>>>
>>>>> +
>>>>> +        msc@19870000 {
>>>>> +            compatible = "arm,mpam-msc";
>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>
>>>> The MPAM register length is 0x321C.
>>>>
>>>
>>> You are right, the MPAM register space is 0x321c per the specification.
>>> Will update accordingly.
>>
>> That is the full extent but truncation is allowed by the architecture.
>>
>> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
>> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
>>
>> Does your implementation have domains?
>>
> 
> Hi Ben,
> 
> Our implementation does not have domains. So 0x321c reflects the full feature page for MSC.

Truncation is allowed when domains aren't implemented. I was just trying to say that that part of
the spec (9.2.3) is out of date and needs to updated as it doesn't take into account the possibility
of domains.

It's only domain specific registers from 0x3000 unless you have some implementation defined
registers (9.1.5). Is that whole region just reserved for MPAM anyway?

Thanks,

Ben

> 
> Thanks,
> Yin
> 
> 
>> Thanks,
>>
>> Ben
>>
>>
>>>
>>> Thanks,
>>> Yin
>>>
>>>> Rob
>>>
>>
> 

