Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183842;
	b=jb/KrE3NP4RpSPAqYTZpiyeu0MxMNYlxlj4ltUwBUCaMd1aObQNGnHkq7OqvCI764zDT
	 x7GmsnSpnvs0jKkQRnGxMpCdz+XvFYBgdZ4MF4XIq79OJ6NnO8nXsObw45Hs9uvY1Dqmu
	 z1iXKclwBqViCPkLB8gb7UbQFBSLiOFScG1p47jV1MZLjIkuIWuM1QoTiIXH1R8GK42y/
	 zKPWZFU95QSd1qBef0EioaT+Fhqmo7P6U2Ya2KDbOqXeJ3Su4N8AU3xT0f7+vemCkYfpd
	 fLw4gQYZDpLwtRi0uCxqPHP+jgYLlGazefDIhcb6q92UArLrBVsmkzHCSY3raW4kDmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
	b=TkMpxjbBiqQzi6eCpTyof/w8IQvD/KB9gO4ZA85IhsgHXOpGk/3JHi+c5H5WWhSvmFLy
	 fjXvFuREeyibDEgP3dY+B/6fijsfAtWRN+JGq5wmtGrViQl4JUJ78S0fdn/gQd9qIAfRB
	 Xh2oJtSRlIKuObK/2Wx/+4VSTo83npKNUFo6rz5MHPLdIGy7FAwF7+oFemMTyHbiLi0uc
	 J0wNKisBoqK0wUZNVgaEMHVMBHZ7NQp5Q32egL3F7zm+rK/qp+rnStWwOAUI2/uSsnsak
	 gEktbkisAjSpyxjHTY/pNOdWSxl6AJMbnph+DHJlqVzOkMlgsmLHM0c3uAs9ZGvAR3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bYZsFo8Q;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5678606A332
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 14:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5678606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bYZsFo8Q
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so7147775e9.2
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 06:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795183840; x=1795788640; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
        b=bYZsFo8Qxn73GrJwPeBscB//SiOf5PXvozmhKZmGuyrptyCY3L6uhd5lhU7UAEoey0
         pR1HL+0q9b+/CwTBf4eLtIKhBInkaDfj2GuGN3KvA6HE/g9nC5LL+d37i863s172nriF
         DEzqenvju8xbUgy665oBpQAW0LpmkBjMXcntUf7TcPGNNBpyAMimZ8lKOzI/aQmtC0SY
         u9XVdUk5JyP1tuFp8PteXfMn7nXHg5NNtjPfTOCwOu6KidDhwgG8OmeYqcuXI3L7XRMq
         qO51/t5p+zJHvngP4Hn03m7GQGyXBit2F8SBYzslAMshwoFd32x/e+3ck9ZIVllKOu4q
         SCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183840; x=1795788640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5S4P9EVhrzfLBPEUlAs5RhZwbxTfoymelcBjiUJ2aGo=;
        b=lgisCRJrN4J5RMBzviBZmgYynBWinljq3fSQV/wTs56SaGHNqKpK/Lc8rm/QV29WIe
         xx8rOqo9985/6gW0ePtbMPpDsvFTywrIJjldhkfCpi4s06LMh8AJ68M5qh63WRk0RWzS
         Yv1eljgAWUiSwvAK8vmDFwriDe+2P7bWM1nCdjHoNX0nhBN2LJwoPR4DUKEPKZu5ADpa
         +yhr/dWQgf54O3MJQE8ty5g6Nslx2A0Lyk59v4CpAZRHj+L+Lg2t17+mT9jp8kGQavFL
         y+hYJ0RuNVe42JElcRoUfFyh/qf8eVX+szMsDB561tF9yz4Nd0zjz0Lt0kBlYCfkcxOR
         Ojbg==
X-Forwarded-Encrypted: i=1; AL+hErH/qLivvtY9bF4m4l0wjGtlz27RqNX2HH05gnJGY4QCR33TwnT1bAiiPlZvrTVd3QWnE43OTYJAV7PdIQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9X6DluZU5//JsXgCiFtMvkQTNHiUwnSh1/g4FSUS7h7J/ZTJvD
	sIMzauZJCpqnYKKY/MibLa0WRYhDKSSUQpgvFp9zC4h6hSgwGhdSngKzuIEC7/EfLs4=
X-Gm-Gg: AYBFou3kuzTvKhCJM20xhcXL5AyBz231I8l8i1yZT6g4LVIsWM4YmPzvqeGsmNYfroM
	UBodUFmDNJd48G8yKYxKJdC3x4GfQN8PTRH79EVWP9Fe77mmuQHNOs8Ymg3Yn4c4hJC4ubkf4U/
	VtBsBE/fmtgMIJ9U5DZ34Xs3Qa6rpGKaLGJ7RBqLNWeYMXkIaah49t+P4U+piptk8DLZmA/7Fdg
	R1tD8A2MyJXcLq2HLWdn094cjJPyyqo2m5S3PHZa5aUaUSWjNy7oT6alEMAzXpSNM+NOPV7lHm+
	PVQfmlYuxcR6PHAmte6gNNIPXjRzHJcavNJnH5lgSwWZyU9AQTNd7cQe0FbLqGOTUDPw5OVlNND
	eNUW6+TYM1dPmrxTo5lUW4A8Fsem0sHUfPEttu1dtjpU6NtyOCkz3TE9vo1RjGDkSQzV4eZW6Dg
	E4j8HARgmZJ61ytCRQS2PEw9H6Hb6dUAoNVxNMaJu3CUiPyApqsanQ0nROUKQpccDqDvah+6Ykj
	zlCZL47aDk/MdzyEf8JsJHhDTuale9Lo1O085mmgmmc1xBg9GuUewclnUMCoYCSkHYsxEI4faac
	m+i5rrBpLe1ELVOGA7glzn2qNPg4Bxjmc1qDHhRJdcQ2iwTrJhGQmvVFIrPGY+LoWDxuH1N5GsA
	O6chBE2OmXNr5/NPd
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr71087005e9.28.1795183840190;
        Fri, 20 Nov 2026 06:10:40 -0800 (PST)
Received: from localhost (p200300f65f19a9041d3eb07d772156f3.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d3e:b07d:7721:56f3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb895f66e1sm37012445e9.0.2026.11.20.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:10:39 -0800 (PST)
Date: Fri, 20 Nov 2026 15:10:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
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
	Yishai Hadas <yishaih@nvidia.com>, Longfang Liu <liulongfang@huawei.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Brett Creeley <brett.creeley@amd.com>, 
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, 
	Julian Ruess <julianr@linux.ibm.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Eric Auger <eric.auger@redhat.com>, 
	Mostafa Saleh <smostafa@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, qat-linux@intel.com, virtualization@lists.linux.dev, 
	intel-xe@lists.freedesktop.org, kvm@vger.kernel.org
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <awBUG7-QzXplEiUT@monoceros>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261118235645.2907908-2-alex@shazbot.org>
 <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>
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
	protocol="application/pgp-signature"; boundary="76ybofus6n5n73yb"
Content-Disposition: inline
In-Reply-To: <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>


--76ybofus6n5n73yb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
MIME-Version: 1.0

On Fri, Nov 20, 2026 at 10:17:46AM +0800, Yao Yuan wrote:
> On Wed, Nov 18, 2026 at 04:56:44PM +0800, Alex Williamson wrote:
> > Driver overrides are the standard mechanism for binding vfio drivers
> > to devices.  With the introduction of the support_driver_override flag
> > in the core driver struct, it's now required for drivers to declare
> > themselves as driver_override compatible, otherwise driver_override
> > bindings will be denied or generate a kernel taint.
> >
>=20
> Hi Alex,
>=20
> > Set the support_driver_override flag on the driver struct across all
> > vfio drivers.
>=20
> LGTM.
>=20
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

I missed your reply when I sent the next revision of this patch. I had
to trim the recipients of the v2 because gmail refused to send it with
everyone on Cc: who was emitted by get_maintainer.pl. So please see
https://lore.kernel.org/kvm/fb0df5c89336b77a373ae0f890f63427e4adbb28.179517=
1088.git.u.kleine-koenig@baylibre.com

But also note, that if v2 is picked up using `b4 am`, your Reviewed-by:
is considered as the patch didn't change.

Best regards
Uwe

--76ybofus6n5n73yb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsAVNwACgkQj4D7WH0S
/k5TyQf/eHBkTiGwub1DLzfSI9Ji/DkzXua0OriEhTmok4cd+2dbl8OfLn0CXg3e
B7W5T3PuQPmIapUivPRGpIJ31hN6+UScHDdfNvj1Xbret/ZoqA+0l48dqU/ikpgB
X4WK2ENvhE+glZpB32rPkpeMadqauuBUmh1TjWnpLKn4QmgLyf+pHIJSnUmH7XkQ
BV2i7AIctyUc2PP/Y+URhj62+6B5pxn3+5BlligAvpjkpg98TxVTctcCEgP4apyk
TI6uZtnd9maFMXHbUJHEArWhVKI8FLAzZySY9/E7u4+tsY0gz/JMib7RngFR2IY4
MPZB/liFV473f+eDblZh9CKsu8DAJA==
=wiOu
-----END PGP SIGNATURE-----

--76ybofus6n5n73yb--
