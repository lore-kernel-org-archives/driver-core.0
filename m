Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CBB38E5F2
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772012562; cv=none; b=P/J/FyHUVnTp0k9e4lXU3iHRxGNHbO84jENT2uc/Yzl53VH8QSDrYUtSCUms7wc89Tx+V4WVe8O7zVO++2FuHgwPE+6d8ItRQAwm8KdcCthJEGmZHPEypMTqzm151U7vJn5gRlBTi30q7wCSh6OUs7UO/FZ4kTo/hPUTn+PCKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772012562; c=relaxed/simple;
	bh=K9a2s9JYkj0KSLlC0p3v78WuyHO3yDxajztaUeqowf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBbhcU3ix600e9sTM9Nu6VkDf3diT+mlqxgPHIUKFRKujeQFl0ZviBXh1/7GKrn2kPmNjfVR+TsmRQi9OiYDQThQdDmWK/S10UTEWSs8+FO4VPFGIowVwLECS1FCt9KMsFEfCDUru0ht98dI2rk7qdf/wx8tJtYc+vFqT2O+Ttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mT9Spqfg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mT9Spqfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC2EC2BCB4
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772012562;
	bh=K9a2s9JYkj0KSLlC0p3v78WuyHO3yDxajztaUeqowf4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mT9SpqfgCsu/X3E++A3RmEyNDeS1Jlb38T25+6EctL4aTNtrYmIn9sJwobi0Kjivc
	 SIWlIil8HD6rI4tZWkASdHUvWoNLME+BBS77ASy39EdP9AEAvu8Grv97sZx0mgt4gA
	 FeuVzd0nOinFN0twGSxBNd48CSosm2UTZtSO4BSCkLC9t3U6SY6VNPtrfdwBTtZPix
	 cjoD2KrAApoFMf/6vraGzPtSqKDsk0JAwdh9JUpg0jU9012elBvMgLfvKfToNyDphC
	 cRF+6q6DtW/u0Fl2wkp2IU3lxk1cSXZg3CgiNc7XIWbaJI8xW6WZRbGZZKtucy4U+G
	 mWWi1ENNudy+g==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-389e139ee5eso5180371fa.0
        for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 01:42:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYDEtXw2Iw6ae5xYfZGVLO+Ite4u/Tdt8HzZLVVslr5eQCIFseh1LDzoj4Crj1ocVT9rlMc4Hqv0pcEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ0naUx/lhnpV4Km76ic5n6BaIHx/lUj6/1Y37Y1Y8+BIxAlhT
	uKbdV7WKOhn/WQdTrLdNf6yQJgUl4Cp6c3jKGD99gaMkK5QSY9QcBHp1ka+8cP4GvYCxodvZj3J
	s1LsaY9VlCXfDZ8MRlIOkILCxOmfPFWNZSZxgF6GkwQ==
X-Received: by 2002:a2e:9e46:0:b0:388:25c1:d969 with SMTP id
 38308e7fff4ca-389a5d14de0mr32354961fa.9.1772012560925; Wed, 25 Feb 2026
 01:42:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <20260224183213.GA3239922-robh@kernel.org>
In-Reply-To: <20260224183213.GA3239922-robh@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 25 Feb 2026 10:42:26 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
X-Gm-Features: AaiRm52qiNgvNEan0Ja9tgnzlKTIzAcLn92f5zLzhmXEy4_h8wLWb64Qeoqf4C4
Message-ID: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Saravana Kannan <saravanak@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 7:32=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper funct=
ions
> > to retrieve the relevant information.
> >
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/re=
nesas-soc.c
> > index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10ed=
d0d58b064650085cf 100644
> > --- a/drivers/soc/renesas/renesas-soc.c
> > +++ b/drivers/soc/renesas/renesas-soc.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> >       const char *soc_id;
> >       int ret;
> >
> > -     match =3D of_match_node(renesas_socs, of_root);
> > +     struct device_node *root __free(device_node) =3D of_find_node_by_=
path("/");
> > +     if (!root)
> > +             return -ENOENT;
> > +
> > +     match =3D of_match_node(renesas_socs, root);
>
> Doesn't of_machine_device_match() work here?
>

No, because we're using the returned address of the matching struct
of_device_id later in the function. If you think it's a better idea to
introduce of_machine_match_node(), let me know but I think that should
be done separately.

Bart
