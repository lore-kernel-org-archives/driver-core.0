Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F67383C92
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391012; cv=none; b=fNQ5qsjXTxBC3DdWfsl1hbSNPqe58fFRapkrxuc7SX6e9Btsq9Gv81g5DUeOnMHX5334SSQo0NQMkhsAUpx2w505WzHdo+bXBJrecoUNu5UCWHP9GzpgASb0k4nwJsghRjqYpMNQoPrIOGEAabayhlAMXgu0UQxOjlLBiiDngtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391012; c=relaxed/simple;
	bh=2nRDxZu+d9TWrj4WVetOFAoz7B787w6aylEKVWKeURU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+ALvatd/mZJwhP2cKaWUFIpJNa4qEYODtUZqXwEd46UFZJk7l0OdPindVfjRBjvettH2dZIvSzhEOwcC7kxke805Yg45oITQyT4Li+dtmPgkM3p0ouvbBSTqMI63pSPYoYDV3HGrgSEZHY7RtkzOEv/yPjmJnzni4RWgTY67Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEVHVxmx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEVHVxmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32622C2BCB5
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773391012;
	bh=2nRDxZu+d9TWrj4WVetOFAoz7B787w6aylEKVWKeURU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=pEVHVxmxlyR1AQS1tR8C2csZ0Qi99RNivHqgeYILFINvq+UgxBXoaqmb2GYX/Ld4+
	 Ggrfr8od449FzPXaxUdGgWt9/wtQ+twSFhI5ShnQhf+y7mcdjLtdJ57IX6OVMgv3Jt
	 xOfteiTDFayLyYkGt8Nn+e+3/sQZlOyOpu4k3d0cYbILyJZ19z4aLF5ss3oSCP/ncp
	 zA7ewy+LaQATTSk1EFJSIoXRBQdGPWQp+wlgdKu9Q4NxiAihO/U3kiiejZdFS5vghm
	 /+oIxRgcMibWkmCXvDtAKs8WeeBa7Hj0DtuJLWDonFuHitIlNZDOZIIG4fL0NK1iRe
	 KnIZQzvHZyJJg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a2f92fab4so17352501fa.2
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 01:36:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoUWEUCgnp6uk0p2Wof0kgxgcbFe6XJKeIOOEAIvNO4XrvflMuZdooj4G8cUbcQNoBPeE4GJ2gH01NMA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa1hqEOR4JyufrZY6EsN6+eDjrc/ltBz08/9DXu/q9K9GZJ0ua
	eX1dCTZTDiwe3hr2AEk0mvDEWxLICcCqTNaXQbWf2xWUa7CyZssTw61JoGCIgB1QxmznKbl/Odq
	zu0AR5QOJ0CbPkHYpCV/4h6ROtLxzOgTsbKz8O74NdA==
X-Received: by 2002:a05:651c:515:b0:383:20cd:52fe with SMTP id
 38308e7fff4ca-38a896b6407mr7399191fa.17.1773391010614; Fri, 13 Mar 2026
 01:36:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 01:36:49 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 13 Mar 2026 01:36:49 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <2026031231-whiff-speculate-805a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260224183832.GB3239922-robh@kernel.org> <CAMRc=Mft5vc-C8miKVdw6C-qRdYsqfgm-UgLZJOctFwagMF0iA@mail.gmail.com>
 <2026031231-whiff-speculate-805a@gregkh>
Date: Fri, 13 Mar 2026 01:36:49 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
X-Gm-Features: AaiRm50bkC2plkyLpch8sSUugz619L6Cf_EZYcxggWcjYtxkwiUVoHYnqPIvC6o
Message-ID: <CAMRc=MdhhEMJn5JTB3wn_ScmV=a0o6fTnaUDSDjOLN5WH5rOFQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: remove direct accesses to of_root from drivers/soc/
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev, 
	Peng Fan <peng.fan@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Mar 2026 16:18:38 +0100, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> said:
> On Thu, Feb 26, 2026 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
>> On Tue, Feb 24, 2026 at 7:38=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
>> >
>> > On Mon, Feb 23, 2026 at 02:37:15PM +0100, Bartosz Golaszewski wrote:
>> > > linux/of.h declares a set of variables providing addresses of certai=
n
>> > > key OF nodes. The pointers being variables can't profit from stubs
>> > > provided for when CONFIG_OF is disabled which means that drivers
>> > > accessing these variables can't profit from CONFIG_COMPILE_TEST=3Dy
>> > > coverage.
>> > >
>> > > There are drivers under drivers/soc/ that access the of_root node. T=
his
>> > > series introduces new OF helpers for reading the machine compatible =
and
>> > > model strings, exports an existing SoC helper that reads the machine
>> > > string from the root node and finally replaces all direct accesses t=
o
>> > > of_root with new or already existing helper functions.
>> > >
>> > > Merging strategy: first two patches should be either acked by Rob or
>> > > picked up into an immutable branch based on v7.0-rc1, the rest can g=
o
>> > > through the SoC tree.
>> >
>> > SoC tree is good.
>> >
>> > For all but patch 8,
>> >
>> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> >
>>
>> FYI Rob also reviewed patch 8 now. Who would pick the patches up? Greg
>> KH? There does not seem to be a centralized SoC maintainer in
>> MAINTAINERS?
>
> Sure, let me take them now, thanks.
>
> greg k-h
>

In the meantime Geert sent an alternative to patch 8/9 so this single one c=
an
be dropped from the series.

Thanks,
Bartosz
