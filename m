Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D2363088;
	Thu, 12 Mar 2026 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328723; cv=none; b=hscOv1aAVX5Hsjr+7PLoQGT6Iv8IN795lJSP4kZTP6e/EPy12FO2nLKhQWeblhRae2bj7oHGdjtj9/MtHkMgzCAUKVF5IonFQVtI4df/JdKJ1cAyRb3ZdoRz14O/EKlX7HBp3RH+XMC0nbaLqAwjFqtatYOg2ItxySwdGC3T2W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328723; c=relaxed/simple;
	bh=RU7mCgn4p4aFt4z17AtB/HzQEKVXpAiuBbfZS5Sysa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6Pz9ldXGaFeAirnQIwbKpBfBd1razHO6XJetOK+JCggvFm9WjFzjQC1MATtbBRiCO24Iky1foHzMoxBieA+NokMMueFCJd/K6dWeBIh1+Xz1Bm8lce59qqcTPgW8oKz/j3pdhSPRi+GX7x2fxGD/b0rp7WaPM+hm4uISw7l2dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V1k65cmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V1k65cmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24701C4CEF7;
	Thu, 12 Mar 2026 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328722;
	bh=RU7mCgn4p4aFt4z17AtB/HzQEKVXpAiuBbfZS5Sysa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1k65cmJmmo+ZdpjbsNZv8nsCPVPi61VKALCKXZeOdH3/KVdSz+l5mdTs2j4pTFLz
	 TjGA79gCGU23W5C90XwC6e0xdRba2zTRj0weRhQoxKvJs12V/HeNxVa41VKe9AjWPv
	 fXDGMebsWeyd/6rYWviq9pQAuQImG1jFn3xPJpkk=
Date: Thu, 12 Mar 2026 16:18:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Message-ID: <2026031231-whiff-speculate-805a@gregkh>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260224183832.GB3239922-robh@kernel.org>
 <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>

On Thu, Feb 26, 2026 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 24, 2026 at 7:38 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
> > > linux/of.h declares a set of variables providing addresses of certain
> > > key OF nodes. The pointers being variables can't profit from stubs
> > > provided for when CONFIG_OF is disabled which means that drivers
> > > accessing these variables can't profit from CONFIG_COMPILE_TEST=y
> > > coverage.
> > >
> > > There are drivers under drivers/soc/ that access the of_root node. This
> > > series introduces new OF helpers for reading the machine compatible and
> > > model strings, exports an existing SoC helper that reads the machine
> > > string from the root node and finally replaces all direct accesses to
> > > of_root with new or already existing helper functions.
> > >
> > > Merging strategy: first two patches should be either acked by Rob or
> > > picked up into an immutable branch based on v7.0-rc1, the rest can go
> > > through the SoC tree.
> >
> > SoC tree is good.
> >
> > For all but patch 8,
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >
> 
> FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
> KH? There does not seem to be a centralized SoC maintainer in
> MAINTAINERS?

Sure, let me take them now, thanks.

greg k-h
