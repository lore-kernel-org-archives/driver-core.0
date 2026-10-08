Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B982E737E;
	Thu,  8 Oct 2026 21:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494858; cv=none; b=FbuuBZ7ndWg5OYa9laNGC8wbw59eRUCOr5w391vVQIdOlLAmDNkSt+oCQc4togSJ2IiAqvHTKSX3Z5JNNYVe191R9uWdXK+XPNbzrp8KSYrXFlgKoZLnbfggKX8RMW2bMXc9sSAkbzRvrvXQi9g8iqCw7i5ElKG5bQVb/BcYRZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494858; c=relaxed/simple;
	bh=XipFpLyCnRYFKzQPrRwtWlwdxCPRLG5Q5PKRfDI+DSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKqPBFeHgG7rIdFEDPYPaM5uvjEhfIE3zytKqDj0loZ/bT5EJ2EbEoOwJgHEtLKSwSEB6pvfXkTfzpuExlRusuhfSKaqmc8UDGpdkfSrVV7+saHvtT+jX5/8q5Y+sxLufKsyaqbooBrxPvMF2onRY33N1VnIMGpLjcrnA0L/8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwFiVfzo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwFiVfzo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F291F000FF;
	Thu,  8 Oct 2026 21:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791494856;
	bh=vZ69U7tRzKd8oN9cqFRMvx6HdrXc7nINJFDSN6qfasw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwFiVfzoMzddf4RuEvu/Vno0gHOrHsG+qO5rWJe8Mb/56EZsLtSAFXwQvHn2TjAYY
	 7fSbH9gEVrNM7Mppbg6m/y3E20eyMDq3lDW1VLUSBfkmqIWcLxWdsmy/nFHSx26y0a
	 pLPYTaY99U8Xv6bHJHbmLznBZzRESrA5pf3OWciLsuSeOgZ/6vZ/qyC0FhXWf2T33w
	 BM3CQ4QD0IztCHLMpA4LveslO+3TGQvJr/f1GAo2mhNVQCZxCux1c81tKxRa0nL1dy
	 3oEnCItBdP4ENOAc5CZlkuD+a6eUMh3trqfq11R0Xf7fr9+mnE7BlsMbZXiLioAFFC
	 tNKbZF0i21cDA==
Date: Thu, 8 Oct 2026 16:27:36 -0500
From: Rob Herring <robh@kernel.org>
To: Yin Li <yin.li@oss.qualcomm.com>
Cc: James Morse <james.morse@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	ganapatrao.kulkarni@oss.qualcomm.com,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
Message-ID: <20261008212736.GB1318789-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>

On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
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
> 
> Cc: James Morse <james.morse@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>   standalone arm,mpam-msc and the two-item combination; fix schema field
>   order, type constraints and yamllint spacing; fix example reg addresses,
>   add arm,mpam-device phandle and remove TODO comment ]
> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++++++++++++
>  1 file changed, 202 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> new file mode 100644
> index 000000000000..3c7b13a23ff2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> @@ -0,0 +1,202 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +description: |
> +  The Arm MPAM specification can be found here:
> +
> +  https://developer.arm.com/documentation/ddi0598/latest
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: arm,mpam-msc                   # Further details are discoverable
> +      - items:
> +          - const: arm,mpam-memory-controller-msc

Why do we need this?

> +          - const: arm,mpam-msc
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
> +          - enum: [error, overflow]
> +      - items:
> +          - const: error
> +          - const: overflow

This can be expressed as:

      minItems: 1
      items:
        - enum: [error, overflow]
        - const: overflow

> +
> +  arm,not-ready-us:
> +    description: The maximum time in microseconds for monitoring data to be
> +      accurate after a settings change. For more information, see the
> +      Not-Ready (NRDY) bit description in the MPAM specification.
> +
> +  numa-node-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: NUMA node identifier for the memory resource this MSC controls.
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^ris@[0-9a-f]+$':

Based on the 'reg' constraints, drop the '+'.

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
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Drop. 'cpus' has a type already.

> +        description:
> +          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
> +          parent device's affinity is used.
> +
> +      arm,mpam-device:
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +        description:
> +          By default, the MPAM enabled device associated with a RIS is the MSC's
> +          parent node. It is possible for each RIS to be associated with
> +          different devices in which case 'arm,mpam-device' should be used.

We should drop this until there's a use for it.

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
> +  interrupts: [interrupt-names]
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    L3: cache-controller@30000000 {
> +        compatible = "foo,a-l3-cache", "cache";
> +        cache-level = <3>;
> +        cache-unified;
> +
> +        ranges = <0x0 0x30000000 0x800000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        msc@10000 {
> +            compatible = "arm,mpam-msc";
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
> +            reg = <0x41000 0x1000>;
> +            interrupts = <5>, <6>;
> +            interrupt-names = "error", "overflow";
> +            arm,not-ready-us = <1>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ris@2 {
> +                compatible = "arm,mpam-cache";
> +                reg = <2>;
> +                arm,mpam-device = <&L3>;
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
> -- 
> 2.34.1
> 
