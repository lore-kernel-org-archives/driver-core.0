Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678570;
	b=O3sju413FxiojEOay22SeTfTzQ1gsG4ucgkfFSnmXMGEFQfxu3ICxy56tnPYAvucElY3
	 OD+QpaXNj2qcVQVNCh98oDf4FgBvJ3sBOxeXiBlGClFxbqF3ht5uILpu3Z7wEBnCAXsjF
	 dL2EWZmCxBNO/Y0b54U4nJoncdEpLwH6cRAJjwzGDsu0x/5N/hlpzOXANqwJWqsvY18gw
	 y0f1bs32tdAX1hIjRrM8iyS0CKsXUaqI6DIseN/GQtvcldcu5fEiCvfHsgjFzKM0HTuOe
	 aGwij9O/pbAznF9GZf2SyvSh7g8d64pTtjXAj4O+pv6ia7TChAEoID2cg+AjNCt/jTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678570;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lpl3OE4xi+emQnd2ymjWmYelonGod8M5Db2OfAC4qJ8=;
	b=afqeoerz5Xo2drSRrNjJLmZiKRG4xIHtl9CGVMQvW8Xa3iMJHXzSK3WsE4IfSGMn7e3J
	 2uOsHBPXgJZII4RMHp6/UNibxSEtLILiwAMEx5JxtifAZ/S4GvWICh6b8isG+nQQ2PgYL
	 c9TDqKHQZ020ppHRPWMHEB/pfg788YRhl7GUmR5NKRIkH8XCzMCu1a1eLVNhT1hsmARsr
	 Lw9QOQ5ejQtARW/yef3Hc2sB4LPiiAvNjj7SJ9PHQ4KkqH5gLr3VF+ceevYC7VG4pxRQj
	 keMDBvbvaZe8JpGB3Ct9LGr6vmWnc3SOYt7xnBMdvvkgZ1UuLQtsDUPdIKap0bw8GaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WcbDjYJQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A96606A319;
	Thu, 22 Oct 2026 14:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WcbDjYJQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAFB1F000C1;
	Thu, 22 Oct 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792678569;
	bh=lpl3OE4xi+emQnd2ymjWmYelonGod8M5Db2OfAC4qJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WcbDjYJQs86qA9PomFj38c7a5wcyWNxS8e8Lgr2wVebLmc++NFi/FTAwOFNNzeBf4
	 ltTCbDa47gQvwW8g2Foh/oOhx6Dcu6lrF4pcTFqjKZ/r7+PN1/BmUN0fjlXTAluk3w
	 sifpRKXyyLSztMu6PNxAkP2ApIwxYT+pW8ZJbHeeAd3igJjzr7T00Mjt4FHWCHC7E0
	 qYXbBqYfqMDWEWyeQbhQ/1jWaDLXX77JkHDboTEtvOeeyYvcwptnz6yh8hcHr84NCc
	 SO4/pOpDr9WCYH09sC+h4v9zEfK3NGOtlCyL0QzCAVrrYQ2NyE85Zdd/+c1Nt39YIp
	 at/SJcNwJJ04g==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJtaR-00000000Oep-1Dyh;
	Thu, 22 Oct 2026 16:16:07 +0200
Date: Thu, 22 Oct 2026 16:16:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v1 1/1] regmap: irq: Get rid of duplicate check in
 regmap_del_irq_chip()
Message-ID: <atoap3uV702MXAjB@hovoldconsulting.com>
References: <20261021205036.1013622-1-andriy.shevchenko@linux.intel.com>
 <atnFxRi4DSKL2TWr@hovoldconsulting.com>
 <atoPG1nCj9yF_eEt@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="T+2h9DrZ05msVl5e"
Content-Disposition: inline
In-Reply-To: <atoPG1nCj9yF_eEt@sirena.org.uk>


--T+2h9DrZ05msVl5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 02:26:51PM +0100, Mark Brown wrote:
> On Thu, Oct 22, 2026 at 10:13:57AM +0200, Johan Hovold wrote:
> > On Wed, Oct 21, 2026 at 10:50:35PM +0200, Andy Shevchenko wrote:
> > > irq_dispose_mapping() already 0-aware, so there is no need to
> > > perform the same test outside of the call. Get rid of duplicate
> > > check in regmap_del_irq_chip().
>=20
> > > -		virq =3D irq_find_mapping(d->domain, hwirq);
> > > -		if (virq)
> > > -			irq_dispose_mapping(virq);
> > > +		irq_dispose_mapping(irq_find_mapping(d->domain, hwirq));
>=20
> > This just makes the code less readable, and for no good reason.
>=20
> Is there intended to be a benefit from the error check?  It seems like a
> microopotimisation that just removes robustness from something that
> really should not be a hot path.

The code as it stands is easier to read and obviously correct (and
matches the preceding comment); you don't need look up the definition of
irq_dispose_mapping() and parse a ternary conditional to determine that.

Johan

--T+2h9DrZ05msVl5e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCatoaohsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQC8XNwux9ZQi7xgEAoG/MQUBgsWVQh0ctgBTb
kK1XLypu2Wxx55RVb1f9picBAPNT7gjy0R6isXAG62hFS0ziGZlMHUxxIEeTS5FK
y2UD
=ymo5
-----END PGP SIGNATURE-----

--T+2h9DrZ05msVl5e--
