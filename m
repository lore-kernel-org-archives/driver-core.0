Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C353191C4
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 21:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772056068; cv=none; b=YM1niDxH7lKqIJmgeGq4ZMQUtxncTL4JGm32uCF44mjwB94t1jHQM2J6NzBYSkq5CAyrzIGaDGn22duHP/kujkUfYP5PAE7A4Qa0+iwty9hM+0O+nH5jNbf79ULH0GGf9T0iI6Z9j+3qQqVQg+8odbArevdzsnzqdCSPHdD8Zbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772056068; c=relaxed/simple;
	bh=l8N6B+v3LKcBSMQDhhMsq1Ou4LUvHgBtC7GiADD7q1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7TDGgz29ywHV+du4LKw2nVvokZcPTO3mfIHjw/6d46zVje/6qpQvvJOWOWQAGrFC/NrK47zpkqI4x+2sAzFh+k29GvlC+Nr/OXMzZzk2v+tvvVjzG7aEJBytBodm+bGKLP6+5AVAzkie+AO7/KG/byI10U2R4D7HKmzFJ0zHfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlje59Rl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlje59Rl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04360C2BCB5
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 21:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772056068;
	bh=l8N6B+v3LKcBSMQDhhMsq1Ou4LUvHgBtC7GiADD7q1o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tlje59RlQj+qfCgUenfDHKivjPqo4Up/NZl0XvsV7LfceH/kWiOS/VQww38KJlbd3
	 mJUb2v0pTRXO1O19c/Ag6KK2YnV+lwzS3cL4X1C6PnIb+ueY10cJsCqIPule4nSH37
	 hQ4iJDRO/43D+s3/Cyihs73/6aAP8mxXQbVZV9TANtZ2UwCvNF6EZ99GW36xjzhEXm
	 OFDen/gVpNhdnFX82h8dK9mEILI8hBN3u0G/BzpXr+7ZjnSu/OZwYTWfCcz+6udaVB
	 uv7c5naBeBBSosyouf02ln2HT7HEcPnp7dR9jvrlph/Tv5QuMrzQ4QFMEyfyUae5r5
	 cfdbze6R8tmfQ==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8f8f2106f1so21768166b.2
        for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 13:47:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8Rm3j4sWf98A6r1He57nT7L9qXPm+UP/Dr9BN5WHX2YJ0chergoiX7R8kiTCHcoxmlXovDTIeEx2eKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjCD7bk4+kfeaZSMYdlFv/r9z0j2FDlRYGz7ERfLo10S+STGqj
	BUiWnzyvwiBfUJO8455tBMbotbECAxl6UEoP+Ce/AoKIOVHzDrEnXKxzdZXys9Nb1fdgkPXS8+J
	2XZP48ISo4vV/l2adhQHbnI9Z58gOSQ==
X-Received: by 2002:a17:906:38cb:b0:b8f:7200:63bd with SMTP id
 a640c23a62f3a-b9351794335mr92810866b.42.1772056066379; Wed, 25 Feb 2026
 13:47:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com> <20260224183213.GA3239922-robh@kernel.org>
 <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
In-Reply-To: <CAMRc=MfAuDqQZQAPXnJPJ9P1OV38dsQb0CWCh_EtZVq_G9dwsA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Feb 2026 15:47:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLr3zzBfVujuj2kO3VCngV-wa97e+xEQj_sjakzRXyZSw@mail.gmail.com>
X-Gm-Features: AaiRm539jdazKEwDTNuu6a7Fra_2vBg28zXqHEjYX1GN3S7PxX9gedX_Y-Td3eI
Message-ID: <CAL_JsqLr3zzBfVujuj2kO3VCngV-wa97e+xEQj_sjakzRXyZSw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <brgl@kernel.org>
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

On Wed, Feb 25, 2026 at 3:42=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, Feb 24, 2026 at 7:32=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> > > Don't access of_root directly as it reduces the build test coverage f=
or
> > > this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper fun=
ctions
> > > to retrieve the relevant information.
> > >
> > > Suggested-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > > ---
> > >  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/=
renesas-soc.c
> > > index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10=
edd0d58b064650085cf 100644
> > > --- a/drivers/soc/renesas/renesas-soc.c
> > > +++ b/drivers/soc/renesas/renesas-soc.c
> > > @@ -6,6 +6,7 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/cleanup.h>
> > >  #include <linux/io.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_address.h>
> > > @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
> > >       const char *soc_id;
> > >       int ret;
> > >
> > > -     match =3D of_match_node(renesas_socs, of_root);
> > > +     struct device_node *root __free(device_node) =3D of_find_node_b=
y_path("/");
> > > +     if (!root)
> > > +             return -ENOENT;
> > > +
> > > +     match =3D of_match_node(renesas_socs, root);
> >
> > Doesn't of_machine_device_match() work here?
> >
>
> No, because we're using the returned address of the matching struct
> of_device_id later in the function. If you think it's a better idea to
> introduce of_machine_match_node(), let me know but I think that should
> be done separately.

No, it's fine.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
