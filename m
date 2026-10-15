Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9633D552922;
	Thu, 15 Oct 2026 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093002; cv=none; b=JR8JvGP8zJ2eNYeWuz/TTgxB3Rf2Mf/Z7fUJzOfIXYWCN5TkJgDGr8lEYoiJ6gW60ERFEmYeU1l2HYRpMmZsBI4irGAO9J3lY1MgHKGKGvZN5PhoKpsfsiUaaXDvVaNJBJw9SqrLeD25l3BdCMgYeg4So4mKKxpQJ/wA3kUZXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093002; c=relaxed/simple;
	bh=EkSHH4cjzhD2ZWJZ5Z5sffPHQutdvk4S86y7aYi/F1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9SN2UyaXMde4Rz0TJOWnCUuENX7J+1EUuH9evymwft6tWir3E72B4NruL4SsDJg1Wr5GH7TOfvY1fY8JJFHjBsje7JdTOWHRwuEMkmxPcttK1Khp/e+i2D0WVHqxRt6+SVIMR24Qz9k+tEQk88hvXiS2UhImImDD0eY/dos+9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLw0KzYY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLw0KzYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4411F000C4;
	Thu, 15 Oct 2026 19:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792093001;
	bh=0ExLOTvMpNdwpLI0kZtOgkFwCcZ4IqWfr3EbUwrSECg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kLw0KzYYomReQQbQQ+K2sJiVxDSsJH3OUDHmvawLUtBzvBzvcoW02JSoYsrIVSOS9
	 o3t+C+DkAJOuGf8MwzrhLtFqBHaKpuB89H0Eqh8m3+VrAI/Qaxxgrty/FBnR9QmXbc
	 mV+TBLIA4H6rnBhyWJRcwojbpXOxNKsODmequC9xvI5dGd5vBUad4/F0uLMJzOldK0
	 T8t3g8LrSrBoo9dTrKfxNetSr+mDHHmzhX6hSeT3ZK99f/QhtkTUQnp1NUyPJra700
	 T+eGYsGTzKY8rFD1jN0Q+jSpSCCSCYLlI+KA4Qie5tMdCcCdVE826GzWfz5sj6+yP5
	 /nKwaas4pTTog==
Date: Thu, 15 Oct 2026 14:36:39 -0500
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
Message-ID: <20261015193639.GE5059-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
 <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>

On Mon, Oct 12, 2026 at 06:24:06PM +0800, Yin Li wrote:
> 
> 
> On 10/12/2026 3:05 PM, Yin Li wrote:
> > 
> > 
> > On 10/9/2026 5:27 AM, Rob Herring wrote:
> > > On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
> > > > From: Rob Herring <robh@kernel.org>
> > > > 
> > > > The binding is designed around the assumption that an MSC will be a
> > > > sub-block of something else such as a memory controller, cache
> > > > controller,
> > > > or IOMMU. However, it's certainly possible a design does not have that
> > > > association or has a mixture of both, so the binding illustrates
> > > > how we can
> > > > support that with RIS child nodes.
> > > > 
> > > > A key part of MPAM is we need to know about all of the MSCs in
> > > > the system
> > > > before it can be enabled. This drives the need for the genericish
> > > > 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
> > > > until a h/w specific driver potentially enables the h/w.
> > > > 
> > > > Cc: James Morse <james.morse@arm.com>
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: James Morse <james.morse@arm.com>
> > > > [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
> > > >    standalone arm,mpam-msc and the two-item combination; fix
> > > > schema field
> > > >    order, type constraints and yamllint spacing; fix example reg
> > > > addresses,
> > > >    add arm,mpam-device phandle and remove TODO comment ]
> > > > Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> > > > Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> > > > Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> > > > ---
> > > >   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202
> > > > ++++++++++ +++++++++++
> > > >   1 file changed, 202 insertions(+)
> > > > 
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> > > > b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> > > > new file mode 100644
> > > > index 000000000000..3c7b13a23ff2
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
> > > > @@ -0,0 +1,202 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
> > > > +
> > > > +maintainers:
> > > > +  - Rob Herring <robh@kernel.org>
> > > > +
> > > > +description: |
> > > > +  The Arm MPAM specification can be found here:
> > > > +
> > > > +  https://developer.arm.com/documentation/ddi0598/latest
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - const: arm,mpam-msc                   # Further details
> > > > are discoverable
> > > > +      - items:
> > > > +          - const: arm,mpam-memory-controller-msc
> > > 
> > > Why do we need this?
> > > 
> > 
> > Hi Rob,
> > 
> > Thanks for the review.
> > 
> > The 'arm,mpam-memory-controller-msc' compatible is needed because,
> > unlike cache MSCs, memory controller MSCs cannot rely on the parent node
> > to identify the resource type.
> > 
> > Cache controllers universally carry a 'cache' compatible, so the driver
> > can recognise any cache parent and derive the cache ID from standard
> > properties. No equivalent convention exists for memory controllers, and
> > the component ID comes from the MSC's own 'numa-node-id' rather than the
> > parent, so there is no parent attribute to rely on.
> > 
> 
> Hi Rob,
> 
> As a follow-up to my previous reply:
> Whatever the outcome of the discussion on "arm_mpam: Add support for
> memory controller MSC on DT platforms", we will keep the binding and
> driver support consistent. If it's dropped, the
> 'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, and
> the memory controller example will be removed together.

Which parts are you actually using/needing and not using? If you don't 
need RIS support, for example, we should drop it.

Rob
