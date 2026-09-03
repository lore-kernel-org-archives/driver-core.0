Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082F4471408
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429829; cv=none; b=BRXJSm0cPZZsTgH75fAFy7ha6JrenYs4hezTdK1VW0u4MfHAK0Vc6ROMeTGy2XjL7d9us+gPQUD0+ACo8yO5q+D3pHizfU+MFX0H00Gl05GuggOBrX67d6ToOQGlTf3QBAp+7yKUD2+4tWR9NxN7mAi+d1ARrhf1kxkALc94Cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429829; c=relaxed/simple;
	bh=GNI/elh2dFmSRnhzVi2c80kp1YqKr+lVSRz3WyR+GNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPrTZlexfG7vCUywWZnvSsynQwDHn2jnIPPN8UdVXmSnsYSGyzbzfj2zErESA8F6B1/7RmchX6G0JUx+KY6m0T2BcyqYIvjQe6VI/czUaNQqSVBOFknIK0nrkvWuMLZ372O3Tj/jYM6tegEHV6bAMlwtvdUCzF4sunHO4plXDkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fq27WkOB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fq27WkOB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0634A1596;
	Thu,  3 Sep 2026 03:03:34 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35FA73F673;
	Thu,  3 Sep 2026 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788429817; bh=GNI/elh2dFmSRnhzVi2c80kp1YqKr+lVSRz3WyR+GNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fq27WkOBzGZZvkP0SsLX+4oIHjZydxDiALVuq/Sv9qBsIrlXHR1yrtgSkYYWlpfb/
	 8Oi/OcsswiK4zNXExvZVCvGPYA5nn6yxzs+HPmtFfM0QTc3GRaJ8AUeL9S1s89kvUh
	 NznYccQHETWjpHvtkP942KJA8PpcaZRDS2SfQ8PU=
Message-ID: <5c9e08ef-051a-492f-a818-703e64e7b8b8@arm.com>
Date: Thu, 3 Sep 2026 11:03:33 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/15] dt-bindings: arm: Add MPAM MSC binding
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
 <20260811-mpam-resctrl-dt-knp-support-v1-1-ea6397bead59@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-1-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rob,

On 11/08/2026 14:30, Yin Li wrote:
> From: Rob Herring <robh@kernel.org>
> 
> The binding is designed around the assumption that an MSC will be a
> sub-block of something else such as a memory controller, cache controller,
> or IOMMU. However, it's certainly possible a design does not have that
> association or has a mixture of both, so the binding illustrates how we can
> support that with RIS child nodes.
> 
> A key part of MPAM is we need to know about all of the MSCs in the system
> before it can be enabled. This drives the need for the genericish
> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
> until a h/w specific driver potentially enables the h/w.

Do you have sufficient evidence of platforms that would benefit from MPAM device tree support to
consider this binding for upstream?

Thanks,

Ben

> 
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 +++++++++++++++++++++
>  1 file changed, 199 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> new file mode 100644
> index 000000000000..53a6fdbbf05f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
> +
> +description: |
> +  The Arm MPAM specification can be found here:
> +
> +  https://developer.arm.com/documentation/ddi0598/latest
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: arm,mpam-msc                   # Further details are discoverable
> +      - const: arm,mpam-memory-controller-msc
> +
> +  reg:
> +    maxItems: 1
> +    description: A memory region containing registers as defined in the MPAM
> +      specification.
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: error (optional)
> +      - description: overflow (optional, only for monitoring)
> +
> +  interrupt-names:
> +    oneOf:
> +      - items:
> +          - enum: [ error, overflow ]
> +      - items:
> +          - const: error
> +          - const: overflow
> +
> +  arm,not-ready-us:
> +    description: The maximum time in microseconds for monitoring data to be
> +      accurate after a settings change. For more information, see the
> +      Not-Ready (NRDY) bit description in the MPAM specification.
> +
> +  numa-node-id: true # see NUMA binding
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^ris@[0-9a-f]+$':
> +    type: object
> +    additionalProperties: false
> +    description:
> +      RIS nodes for each resource instance in an MSC. These nodes are required
> +      for each resource instance implementing known MPAM controls
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - arm,mpam-cache
> +          # Memory bandwidth
> +          - arm,mpam-memory
> +
> +      reg:
> +        minimum: 0
> +        maximum: 0xf
> +
> +      cpus:
> +        description:
> +          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
> +          device's affinity is used.
> +
> +      arm,mpam-device:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          By default, the MPAM enabled device associated with a RIS is the MSC's
> +          parent node. It is possible for each RIS to be associated with different
> +          devices in which case 'arm,mpam-device' should be used.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +required:
> +  - compatible
> +  - reg
> +
> +dependencies:
> +  interrupts: [ interrupt-names ]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    L3: cache-controller@30000000 {
> +        compatible = "arm,dsu-l3-cache", "cache";
> +        cache-level = <3>;
> +        cache-unified;
> +
> +        ranges = <0x0 0x30000000 0x800000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@10000 {
> +            compatible = "arm,mpam-msc";
> +
> +            reg = <0x10000 0x2000>;
> +            interrupts = <1>, <2>;
> +            interrupt-names = "error", "overflow";
> +            arm,not-ready-us = <1>;
> +            /* CPU affinity implied by parent cache node  */
> +        };
> +    };
> +
> +    mem: memory-controller@20000 {
> +        compatible = "foo,a-memory-controller";
> +        reg = <0x20000 0x1000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        msc@21000 {
> +            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
> +            reg = <0x21000 0x1000>;
> +            interrupts = <3>;
> +            interrupt-names = "error";
> +            arm,not-ready-us = <1>;
> +            numa-node-id = <1>;
> +        };
> +    };
> +
> +    iommu@40000 {
> +        reg = <0x40000 0x1000>;
> +
> +        ranges;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@41000 {
> +            compatible = "arm,mpam-msc";
> +            reg = <0 0x1000>;
> +            interrupts = <5>, <6>;
> +            interrupt-names = "error", "overflow";
> +            arm,not-ready-us = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ris@2 {
> +                compatible = "arm,mpam-cache";
> +                reg = <0>;
> +                // TODO: How to map to device(s)?
> +            };
> +        };
> +    };
> +
> +    msc@80000 {
> +        compatible = "foo,a-standalone-msc";
> +        reg = <0x80000 0x1000>;
> +
> +        clocks = <&clks 123>;
> +
> +        ranges;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@10000 {
> +            compatible = "arm,mpam-msc";
> +
> +            reg = <0x10000 0x2000>;
> +            interrupts = <7>;
> +            interrupt-names = "overflow";
> +            arm,not-ready-us = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ris@0 {
> +                compatible = "arm,mpam-cache";
> +                reg = <0>;
> +                arm,mpam-device = <&L2_0>;
> +            };
> +
> +            ris@1 {
> +                compatible = "arm,mpam-memory";
> +                reg = <1>;
> +                arm,mpam-device = <&mem>;
> +            };
> +        };
> +    };
> +
> +...
> 

