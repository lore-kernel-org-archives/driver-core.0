Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017385;
	b=LYv7TSkCAYdVtInXuW6493sXxRy1bKknDb3ZGPtrkbK0LQBdE9gFepse0p63vTfd4ab7
	 vnW5J5Fmfxd2PuBtNUbPALm0HZT2AaWsgybY2g6XUWuAGdldNGboZfjx4BZnCKAjGZd4o
	 h2Ii+SN5Q2iysxE0krP9mnYvJw21/r2ayLNxhesTZ+bBuGMoEfbTsMv+v0zbaWMwA+HGv
	 4K7dfyXB03gNzgVdo6mUhif3PJlGOD+owlcNl9sv0UiPFIZqgBVdICSYfzT/s7zbSnOSR
	 I7RqObD9VhTmUcb2XTOz531rM235Gvi9FoaZSJ4tgM9kzK06lLvvKKtHqmdFTcbsaSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017385;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=F28cEkRZw6qR8QYv0rrjSViytgYVUruaxZYjwZM/GiI=;
	b=4iqK7+UBIrS296PT+W3oiRmiaQ1e//vXj2BaXjBDvtSLENYgutm/bcZxUgLnBMBI/Ljf
	 DGviuM1fCk//XdU+0lW3gAuSdhVyr09MzDAcOrwundUKxAW9r6kGip3rfLMUvgAz2XL9z
	 CXmX0GnzNtQ6yeOge5nPkwy4JBwpomTmj9QmejMD577ERg0ChNcQS9mcP9pKm7q2xbrwg
	 ryXsfJmn5OraikD67pcJ2acHsZGAGgYfRDws27EPBJSEiGP5k6xRFY6Jrowh+u5E+7cA4
	 wayCHQ+nIPAfXvGaFY0CoKv3RciIp6OKBKTGtnrdnc550H1MmUyky/uCkaaBCyKUN0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVRWHUmm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA16A606A31D;
	Mon, 26 Oct 2026 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVRWHUmm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284BB1F01825;
	Mon, 26 Oct 2026 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793017384;
	bh=F28cEkRZw6qR8QYv0rrjSViytgYVUruaxZYjwZM/GiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nVRWHUmmQBWzJjaKLYtj7Cs9hBRzpKDsPyblR+L9mqeip1CnW37rOhv99PxQruLGG
	 F9bR/dIkIEDwPH3Ww1wgvgZe9ts0Mv9WDYDVzEyUvIqTSIoWVsqSgzYseEFoVt3Xlu
	 tLVXovWCeBjfrjW64pb4R0SC5LkjtSFOtl9eemi5ut90BPibXq3ZqlF0aJAuZ3Rr71
	 9gMtSlyL/aBdT3S4GrqAMpJwP2CnkcgnDkd4BSH6sS9XsD2Su2W8duCzHwWxTCWsQq
	 f5AZJgohMtdHL32wOVh3YWugp0BrVbFbCa+D6OvbG/EQWP8Xk0fCYfOS8rLB1MWQFD
	 9GRWRl1bW/cpw==
Date: Mon, 26 Oct 2026 07:23:00 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
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
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Message-ID: <20261026122300.GA3598537-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
 <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 02:03:57PM +0200, Konrad Dybcio wrote:
> On 10/14/26 9:09 AM, Yin Li wrote:
> > 
> > 
> > On 10/13/2026 6:37 PM, Ben Horgan wrote:
> >> Hi Yin,
> 
> [...]
> 
> > Hi Ben, Konrad,
> > 
> > The original 0x10000 reflects the per-MSC register block size as
> > allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
> > use "how much register space is allocated for this block" rather than
> > "what the last used register ends" to avoid holes.
> > 
> > We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
> > 
> > That said, this patch is marked DNM and is intended as a local
> > verification example only, not for merging.
> 
> If you don't intend it to get merged, you can even put 0x12345
> in there. But for future submissions that will have the intent to
> be merged, please stick to the 0x10000 size

Why? That just wastes virtual memory space. I know it is "infinite" on 
64-bit and *only* 96 bytes of PTEs, but still.

Rob

