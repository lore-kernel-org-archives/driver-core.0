Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111396;
	b=VDsorStOqhagF3JepEmqV8I3PxkcUfaOgdvLg5J/xWyKu/jEVMbCC6Iin6nFx/bX9PLc
	 FiQSBbxubRaW4tfO7tNpndkRM0lLkqnE3I2l5GXzPNHy2mO/Mq2+HnJ3McrCEiUFPOl94
	 VT61VQJNVcJ/5Swi8PRZxTSC/6kpVPSP60zJDhWIEO/Q5E9SzNbTob2hIeR5cv5RV3Rqp
	 5OC7ogH7SYvI8zlVJ1m68vpYjOH0QAH8dNHKp6qf1sSDZUvZrC0SewyaHZEljvUeSD5GG
	 9b3GfK3FGf/dO2ZH3d+QSzfe4Qr8rtqeuHhWH+Xu1qOVM4ewp8iEGygXC3bJiLxEwUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M3aTvEzquBrOiSj2mlzWhSxH+izz4607hFK76/YmCDk=;
	b=ZUXFX3FnF1KfgTkolJ+ip0vM1yPnJbKaFrdPf7ecX/duSK2Lovn/6FrQ1RqinhL98Mjf
	 wjaq0npWCYRwgbSEcoqZ85voDOb+C9z39JU/7BG0ZDmR4Bz0G5/RHDqQsfN2oUh8W8QPS
	 w9ciHpQzsMWYpV0GCQ8AMBbUxOXzYBlxZeyYpYqc2+HKD6harZH7bqentfQ6ndWanRFRV
	 MmCT4N0WGQ4abyJGP214UAKwFQaw58wVDQQtf2xLK0eJK3afMPIsixIi4Xm2FGVtVHGWA
	 +lfovL8wq2b6RwaTO/IwFigxolmJ4mGh9OnF6if8AZfad4ejEpB5Od9o8mbKr2wFhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aD5OL+TA;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6BD60A260E
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 18:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B6BD60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aD5OL+TA
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1725838f8f.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 10:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795111394; x=1795716194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3aTvEzquBrOiSj2mlzWhSxH+izz4607hFK76/YmCDk=;
        b=aD5OL+TAXCKrI5E8P67ES2rsjZZfk12YtCCFCD3gW8oE7ijLMBrDng4gmhLz6R7T+l
         0dzhpVJuBjUy21gzjiweAtDneaygOsiAHYNm+8OyODoVjQfKR+z+aTlZQNW3XkP35HnZ
         8VCexqHvrxaee2MCLJKPpERIxVAMZQ4iHZSzq4X55ddsoq7y4LgqMnnTmRfqLPcTub4v
         QrCYgYmuxD4jEKSQXMIyX52JznIbaneT5Fc6w3LuFKusHXfUrZSZD6Droa8niVN3TkWJ
         cRcaraov1/d19lb8vA3BeLNnHyFqRCbIh/km0Iw5iCmVpE5cvZrMzSLElC4ZlnrEX4mi
         2M9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111394; x=1795716194;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3aTvEzquBrOiSj2mlzWhSxH+izz4607hFK76/YmCDk=;
        b=qZC+v6cy29KyiO/GK9QSg3RX/jyiTdU+raTTOHhE9yJEkQJEIzPDsNVPiV30JTVx28
         tVJkrt1H3KYNAW+J1vqhPRTF1Ca6zS2yhTt53edrk6poCLT+Rgk8V3apkTna3jxiEArs
         PaP9mO39jhAuwdnijA1kSN0M+YzQdRFotzyL//kYMqlqKtmjDeWnhqu2whfxeGMqRdTG
         sAdJuRjmmjgQb0eioJL3E4FpgkSCJGw2ZYq9yLt3ayPK4KNoGHT2x+mHycRUhSp4SaDx
         Xstq1E/l3AOQtmlp2etFcfU7Annkp2vlbwLimmvlisJW4jXK5IfAurDgO08xZV3dYUCs
         qDxw==
X-Forwarded-Encrypted: i=1; AL+hErFyzmHllub6mPD6m0jqf+b5hX28t9C/d1iFH0ASQzd3wDwJjP4mbBwU16nJg6a/z8JFlokCGqvxNRL0Pg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Yy/IhxnHj/X35sN9Hxtp414U8k6Jp0kCDbPIfYxySgsPmSOGY
	vlF7OhiRIVJZ3/U9WkXKceCZZQGZ6R6YyySHVqyOx2b93NZ2kLNH2Ev8EzZN/56LOmE=
X-Gm-Gg: AYBFou2JfbZJgaoOM2iUMdVw9ZpE18RiV4Edf/6hSPlIR0plkgrMS05vnBpwizwdr0I
	UMypkgO/0s/MEcRS/mxU7nMRdjZ5hIx7kiwXimNZaBFFJTn1uBcKp0PMXkNBmDhUQd6kdMZ2Hjr
	NQgmMsFOaQChTvezRww3QN1tolYsg0Ut10tFMrmxVEWuC91rGsZaNcF3xbNb4/EF289xiWsnWaK
	JaKA40/SkWLgCivfLKKvhbsmBbEvQ+zrONsrAdJ8w+Wqh520aQVCDUcz6vVI7BoMdF1T0SxLQ/y
	AF1eQ2mg1oSluve8Q7VzmWCPEqnEpUh1pjaVvkcXTQ1O7Ci+O9fgCEdnWFkP7qKSTtbEIWez/kG
	KWdl3H97NZGmYRIOA8uvJrWMUlULmT2jDkPIn0eJramepDi6FRg0PlmEfUYgr/ITm8CgGmOblKC
	qhj68zgO4iEK1I6QFTmtqg2x0uKfX6/c87F5ZzywCazfCnJ8Shpmv7ZogosmlTkKe7ZijVNo6sc
	TNEcd0NGJfGrSxDByewNTJnRzXR68YDVEo6k5G8E9j9s9PslHo/4qVGzFUwyu9NWJmk1ZRDqZH9
	kzLO/xqPf43GYncdtZGMnEW6qv1iXqBr+pD4e/YeB6pHQp77ePveY8x9cGvOhsYJ/HzZkkFqlju
	FkJU1ch+nmT0tuA==
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr7335575e9.29.1795111393609;
        Thu, 19 Nov 2026 10:03:13 -0800 (PST)
Received: from localhost (p200300f65f19a904994d80f004b20d71.dip0.t-ipconnect.de. [2003:f6:5f19:a904:994d:80f0:4b2:d71])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6c340df4sm1143252f8f.55.2026.11.19.10.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:12 -0800 (PST)
Date: Thu, 19 Nov 2026 19:03:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Anthony Krowiak <akrowiak@linux.ibm.com>
Cc: Alex Williamson <alex@shazbot.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	David Lechner <dlechner@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
Message-ID: <av84kUIYQ_Idt889@monoceros>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261119051507.3306075-1-alex@shazbot.org>
 <aca4e70b-3a8a-475b-b2fb-ad9d1a44f254@linux.ibm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnhi7e7twhetgmlw"
Content-Disposition: inline
In-Reply-To: <aca4e70b-3a8a-475b-b2fb-ad9d1a44f254@linux.ibm.com>


--rnhi7e7twhetgmlw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] s390/vfio: Allow untainted use of driver_override
MIME-Version: 1.0

Hello,

On Thu, Nov 19, 2026 at 07:14:47AM -0500, Anthony Krowiak wrote:
> On 11/19/26 12:15 AM, Alex Williamson wrote:
> > diff --git a/drivers/s390/crypto/vfio_ap_drv.c b/drivers/s390/crypto/vf=
io_ap_drv.c
> > index 8e69ed286bb9..2d47dc643269 100644
> > --- a/drivers/s390/crypto/vfio_ap_drv.c
> > +++ b/drivers/s390/crypto/vfio_ap_drv.c
> > @@ -62,6 +62,7 @@ static struct ap_driver vfio_ap_drv =3D {
> >   	.on_config_changed =3D vfio_ap_on_cfg_changed,
> >   	.on_scan_complete =3D vfio_ap_on_scan_complete,
> >   	.ids =3D ap_queue_ids,
> > +	.driver.support_driver_override =3D true,
>=20
> Does this really belong here? Shouldn't it be in struct ap_driver
> since driver_override is supported in the AP bus?

ap_device_probe() calls device_match_driver_override with
drv=3D&ap_drv->driver. So I think the assignment is fine.

Best regards
Uwe

--rnhi7e7twhetgmlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr/OdwACgkQj4D7WH0S
/k7x+gf9FZVgAr7FFBlDRjq6odYeaqNCOaCFNVlsdz+mmeuvFoiyhQGlFuLA5fBI
RI+cAKOjVw6JQLaNWU56WyXOjyMbZ9rX1X2wiPj4dx6oWxUQ0G4oyTpMx5M9e7yX
JKEEMhBjk2hmDBDO8qTnVhrPzy+7pp0orXoElqEDT46+aZRSeBMRcSLzripwP5P2
0GBczvM7k943oKVhZ/4VuYKxowT7ALpC+OTDKy3ALqIuhhIvTY0LGjWdrDU7XBx1
NWAf33X/vh9oQSepjVMFnBaOEpOdIayc4ILJCCVuX6stvlriJCTtFBVtzja/AGZ6
BrG53U8a5eWfIY/nnztu6uaaw9royQ==
=LHa2
-----END PGP SIGNATURE-----

--rnhi7e7twhetgmlw--
