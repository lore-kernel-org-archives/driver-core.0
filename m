Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE19147DD50
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 10:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430325; cv=none; b=gZM4rias2S3vFm+TZnD8m+Ctz8aHuy0Z5A+8fKwfM+7FU+lw6XEeblMUwhI4SjCLkCfwuWXgL/6+2PE7H7Hg3ouAso6kDT3H1hBWgZFskqhSHWu8TJVQ+d6+mYeDleL6HrHOKuV7Uy1y/GGwxZNfK5cSTRhBvqP+PSo1rr0P2pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430325; c=relaxed/simple;
	bh=fEYMGsvJWJBa3n7iqlAGfU4k0c7yVYLaR3NvNMIrQAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1O0Qyh/PBaemeZy5yr4dXb09r9j+Pr7TguBLHJ4x4oHdGbNKZtz6t8uV62jQx434AFnVmaIteonZpWQrjJ/0hd14+D8lsHtX3QIpWn5scjSv/yeHi10b30HXWN1yZYkLBvsMP4T4+FQ99GwFemCayPavK9gstSFLUXMWns3yNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XhOocVH9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XhOocVH9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AF0D1596;
	Thu,  3 Sep 2026 03:11:58 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C29E3F673;
	Thu,  3 Sep 2026 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788430322; bh=fEYMGsvJWJBa3n7iqlAGfU4k0c7yVYLaR3NvNMIrQAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XhOocVH9p5q/yKTJ31cE2iwnTkO7l23lA/UrdoxJvm3yGRToLj2JOKIDm44oH4/uW
	 0LMxOEgssfPu2wluW9CeAMsSDcp77MlmGaWgD+y70mU6sOz4PZ3c92af/GGFMfacQx
	 fiNiHTwoYPpeMZtzhJn+5YzMQekLxmHR1MdOZ7f0=
Message-ID: <8f0c4f14-d0fd-4b57-a080-7011fbc54be0@arm.com>
Date: Thu, 3 Sep 2026 11:11:57 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
To: Yin Li <yin.li@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>, James Morse <james.morse@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yin,

On 11/08/2026 14:30, Yin Li wrote:
> Notes for James, Shanker and Rob
> --------------------------------
> This series builds directly on your not-yet-upstream MPAM snapshot
> patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
> like your guidance on:
> 
> 1. Do you mind us picking these up and continuing to extend them? We have
>    kept the original authorship and Signed-off-by intact and documented
>    the inherited-vs-new split below. If you would prefer a different
>    attribution arrangement, or have your own plans to upstream MPAM DT
>    support, please let us know so we can avoid duplicating effort.
> > 2. The fixes to the inherited patches are kept as small, self-contained
>    patches on top, purely to make review easier. Since fixes to
>    not-yet-upstream patches would normally be squashed into the original
>    commit by its author, please point out which of these you would like
>    folded back, and we will reorganize accordingly.

Yes, MPAM DT support would be good but does rely on the DT maintainers having sufficient evidence of
platforms that would benefit from it. Folding fixes into the patches is the way to go, you can use
square brackets, e.g. [li: <what you changed>], in the trailers to make the differences clear. This
way we avoid having commits with known bugs.

Thanks,

Ben

> 
> Rob kindly provided some early off-list feedback on an earlier draft,
> which this series has tried to address.
> 
> Add Arm MPAM resctrl basic device tree support.
> 
> Arm Memory System Resource Partitioning and Monitoring (MPAM) with
> resctrl requires device tree (DT) support as a prerequisite before any
> higher-level functionality can be enabled. This series provides the
> foundational DT binding and parsing support for MPAM, laying the
> groundwork for subsequent features such as MPAM Firmware-backed
> (MPAM-FB) partitioning.
> 
> The patches are based on earlier work by James Morse, Shanker
> Donthineni and Rob Herring, with fixes and additions on top:
> 
> Inherited (authorship preserved, with fixes noted in each patch):
> - dt-bindings: MPAM MSC binding [1]
> - cacheinfo: expose cache-id generation from a device_node [2]
> - arm_mpam: device tree support for MSC probing [3]
> - arm_mpam: memory controller MSC support on DT platforms [4]
> 
> New on top:
> - standalone fixes extracted from the inherited patches (device_node
>   refcount, cache-id sentinel/type, RIS index range checks, MSC window
>   size, accessibility return type, foundling MSC creation, cache-id
>   error path)
> - dt-bindings: schema and example fixes
> - arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace
> 
> DT affinity model
> -----------------
> An MSC node is nested under the device it partitions or monitors. For a
> cache MSC this is the cache node, so the MSC's CPU affinity is derived
> from its parent cache; for a memory-controller MSC the parent is the
> memory device, which is accessible from all CPUs. A per-RIS fallback is
> also provided: when an MSC sits under a generic container with no
> affinity-bearing parent, affinity is resolved from an explicit 'cpus'
> phandle or an 'arm,mpam-device' phandle on each RIS node.
> 
> The Kaanapali DTS patch is for local enabling and verification only and
> cannot be upstreamed: the platform is already upstream with a public
> device tree, and production firmware does not allow the OS to write the
> MSC registers, so this path only works on a local test setup. The MSC
> nodes are disabled by default, serving as a reference example for other
> platform DT authors.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
> To: James Morse <james.morse@arm.com>
> To: Rob Herring <robh@kernel.org>
> To: Shanker Donthineni <sdonthineni@nvidia.com>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Ben Horgan <ben.horgan@arm.com>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: "Rafael J. Wysocki" <rafael@kernel.org>
> To: Danilo Krummrich <dakr@kernel.org>
> To: Reinette Chatre <reinette.chatre@intel.com>
> To: Fenghua Yu <fenghuay@nvidia.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: trilok.soni@oss.qualcomm.com
> Cc: aiqun.yu@oss.qualcomm.com
> Cc: ganapatrao.kulkarni@oss.qualcomm.com
> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: driver-core@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: trilok.soni@oss.qualcomm.com
> Cc: aiqun.yu@oss.qualcomm.com
> Cc: ganapatrao.kulkarni@oss.qualcomm.com
> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
> 
> ---
> James Morse (2):
>       cacheinfo: Expose the code to generate a cache-id from a device_node
>       arm_mpam: Add device tree support for MSC probing
> 
> Rob Herring (1):
>       dt-bindings: arm: Add MPAM MSC binding
> 
> Shanker Donthineni (1):
>       arm_mpam: Add support for memory controller MSC on DT platforms
> 
> Yin Li (11):
>       arm_mpam: Fix device_node refcount in DT resource parsing
>       arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
>       arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
>       arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
>       arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
>       arm_mpam: Fix update_msc_accessibility() return type to void
>       arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
>       arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
>       dt-bindings: arm: Fix MPAM MSC binding schema and examples
>       arm_mpam: Support MSC accessibility derivation from RIS nodes
>       [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches
> 
>  .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
>  drivers/base/cacheinfo.c                           |  19 +-
>  drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
>  drivers/resctrl/mpam_internal.h                    |   2 +-
>  include/linux/arm_mpam.h                           |   4 +-
>  include/linux/cacheinfo.h                          |   3 +
>  7 files changed, 638 insertions(+), 43 deletions(-)
> ---
> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
> change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
> 
> Best regards,
> --  
> Yin Li <yin.li@oss.qualcomm.com>
> 

