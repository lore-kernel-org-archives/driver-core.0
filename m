Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810A342B723
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677192; cv=none; b=XCigGdV0vUUmrNIuHwNiJvFZiH6hoiR8DfAFyVHQLrLOaLOtljcyhX7ZQIoyHDTQynfASbvOg9x3V5t+ipvCfblR2lyZHqO7wPfK3TvmjyMLwOM72fyZYU8V7PLh/SELW2C5josFTjZeumuzLU9Vr6o/ovRa2a8/dzFboD0qwQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677192; c=relaxed/simple;
	bh=cIKGnDKNpd0yeMQIMK4UDELk2FN0CMAVb9xNAeplAlA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFJCpKH/oF1ERQdPV8+2F3ElfT9bqKMTpkpxo8Gqvsmt6DUa9ZmKQstfo7g4W7NKQaNHWQA2UsW9rsMQjpqfiyYQmmtDfLDy7rVmHeP9rKE1fBvtNmCCBlwzOZxCSRNCgGtJWMS4MWTfNVI6sXcI4BSn36wlTErUdlC4Az3mQUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9bt1TwsC; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9bt1TwsC"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wN9Bg-0000000GDvP-0pSx
	for driver-core@lists.linux.dev;
	Wed, 13 May 2026 14:59:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=cIKGnDKNpd0yeMQIMK4UDELk2FN0CMAVb9xNAeplAlA=; b=9bt1TwsCEKoo8St3/+kGbMAKD7
	8ZvyLalmRMbAvKadjuldwHhuGmsdcR29ANCDvQyYiCR4yUTaHaxemyWl9mGIa5128c8ywQ6j1BhoJ
	ye/CFFEe3WkOdvngj1LjSIZRlz15g9n+Dxk4AK5L6b9wQ57BSh/eMJhb6k/jEfJjf75KRVai/vWEF
	liEzGyrd9ax5LMAGpwNCywOgnjtL3nnf99FUemoHrITFO4r/XnRuDFB79qbLT9enEzZPInl8HiMoi
	q5htgxm326nekPmE+gEd21q6n6Q8nxVgCszZyw0U293QxjMkBFHtm1+ck1Nf1jvZCKkcy3cckiupU
	jZlnjSfw==;
Date: Wed, 13 May 2026 14:59:26 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Arnd
 Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
Message-ID: <20260513145926.2dc4d037@kemnade.info>
In-Reply-To: <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
	<CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 11 May 2026 15:34:39 +0200
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Thu, Apr 30, 2026 at 9:31=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >
> > This converts Nokia 770 to using real firmware node lookup for GPIOs by
> > attaching the software nodes describing GPIO controllers to their target
> > devices.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > --- =20
>=20
> Hi!
>=20
> Gentle ping, can this be queued now for v7.2?
>=20
So any objections from your side, Aaro?

Regards,
Andreas
