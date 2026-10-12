Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F943ED132
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791804479; cv=none; b=maC0wlyAdnv7FuEjHGYcwkMQqWCin3EdHg0+Mq8bceyJ6mcYpvOUQRhB3xsS6ha5C76J2FcS9FoFuQ5Uf+11oGdTCJpBBmAjFUMRunasL9lPa/vbntl0OVrywQQpvi/ZKUMGdMT4T1xLAF/ggzzg/cHoMDFXDcZb3l5FwbcYlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791804479; c=relaxed/simple;
	bh=kQCByoVaggjb/UJQTAgFLZ8KUS15fDOUT2X+RgYa5nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqTLntVtuzfghGMns9espm5JDZDSU4RJpWg2M4nxToPnaw0ZvhXv/I/Edelp5Uzsq603ZxWUzEbbHrM9YmqQPu+WSrXSv+JUiygA9Enm9mJI0jXB77rx1gc5Me+WRzgi8XsjtUY5yaEgAEUSakQUQkUL4uQBmJEE2J7aP/J0954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SXpM18Gi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SXpM18Gi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B541655;
	Mon, 12 Oct 2026 04:27:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322763F882;
	Mon, 12 Oct 2026 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791804476; bh=kQCByoVaggjb/UJQTAgFLZ8KUS15fDOUT2X+RgYa5nA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SXpM18GiGGokjVzFN66yDXwWffYyU+nyainbUrdvXUhlxb/5aoBKR/zu1Wk8q9m2K
	 BHJ6rVAmAhbWMus8lqcJ0+VVvuk0vEtCafbmbvQJ8h2GnIS+NnuRL9si8p2j3MjayM
	 3q0Q0Cr4YzezOswbyFk4QWwLY461WGXHjKeRMcmQ=
Message-ID: <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Date: Mon, 12 Oct 2026 12:27:50 +0100
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
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yin,

On 12/10/2026 11:48, Yin Li wrote:
> 
> 
> On 10/9/2026 5:00 AM, Rob Herring wrote:
>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>> directly under its L2 cache node so that the cache node is the MSC's
>>> parent device and its CPU affinity is derived from that cache.
>>>
>>> The L2 cache nodes are placed directly under the root node. The root is
>>> the root of the physical address space, so each cache node only needs an
>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>> a physical address. The two caches use distinct node names (l2-cache-0
>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>
>>> The nodes are disabled by default. Production firmware does not expose
>>> MSC register access to the OS, so these nodes can only be enabled on a
>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>> This DTS is therefore only an example for other platform DT authors and
>>> is not intended to be merged.
>>>
>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>   1 file changed, 38 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi

[...]

> 
>>> +
>>> +        msc@19870000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>
>> The MPAM register length is 0x321C.
>>
> 
> You are right, the MPAM register space is 0x321c per the specification.
> Will update accordingly.

That is the full extent but truncation is allowed by the architecture.

Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.

Does your implementation have domains?

Thanks,

Ben


> 
> Thanks,
> Yin
> 
>> Rob
> 

