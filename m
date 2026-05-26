Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF323BF684;
	Tue, 26 May 2026 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807145; cv=none; b=P13BskyqoJdmIISsuN4xWVYYwAu/5ntkxe5YNlbgzoLu0Hs8BWhWf+MsWFSb97XX1i8kHioBov/OjVDUnAyEgOtklZU8AQTtoKsdrr6RHOn2wmewtj0rYJH3h0W7RoLhE2Ms06WpYNXKzC0Ijen28IfL8o5nvm3Hy79uRXb8GzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807145; c=relaxed/simple;
	bh=AK4AMyt21kSTNJVYo9MbEbu/IkiICfaf2sVsliFaefk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sqS9/1QxcwDy/R1wZ8PZddE9RRlAPXO/Gl4wIgHCPqPjwOopnXoXr0YLN5eXWxb6O416PeAl0bUNUJgkBpmFaBtp9sEm7pcHPWWSir1yYE3N4Ujb7YXQyCm4EzvbJV0byBHVMpQ0JmT+iRrfAexRkIjyw183c7xDdb8w/Hl0EKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KfbWAjF7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KfbWAjF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14A11F000E9;
	Tue, 26 May 2026 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807144;
	bh=HM5YVNG5Vj0YRAKpPRVJg8xQxyQSJUj6sq1nPB5Jts4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KfbWAjF7VaUrjO3LT4Xaqrlg6wQWaTWDnt7jKJHLc6E/SIEzpbP+f+qDi4t9rB3BD
	 I3z9C3MWlDAsNs5pWbznCwqxLEgebu6eINWxaS4JVclRkfqYmQYXbkKeSnVuoaGf/R
	 tE0+k3c7hBv9M1GPkRxxp3xtyPza97qVTJ7IuepXiuInai9EQDsV1GTF2N161I+sX8
	 +4KT2rVru0btt5GkixGjC7xfp9YrQP0Aik9BKqI9nhHT2dkJwOXNJPKfbQddgdT09z
	 dLs7q6yTpVRvTsiiwvOJisNR/kfHY1negXKs03CSE+JPysV9tyQhLbBu4VACUnQQ5y
	 eZj+Y2kaYWG3A==
Date: Tue, 26 May 2026 15:52:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] driver core: Allow the constification of device
 attributes
Message-ID: <42a1555b-5d98-4601-8699-eab86aeb115a@sirena.org.uk>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
 <20260512-sysfs-const-attr-device_attr-prep-v3-4-cb7c17b34d52@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2JoZJ2qKfgbxfKZX"
Content-Disposition: inline
In-Reply-To: <20260512-sysfs-const-attr-device_attr-prep-v3-4-cb7c17b34d52@weissschuh.net>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<


--2JoZJ2qKfgbxfKZX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 06:39:14PM +0200, Thomas Wei=DFschuh wrote:

> Allow device attribute to reside in read-only memory.
> Both const and non-const attributes are handled by the utility macros
> and attributes can be migrated one-by-one.

I'm seeing NFS boot breaks in -next on at least the libre.computer
tritium which bisect to this commit.  I don't immediately see what this
commit might have done to cause a boot break, but I did get two
different bisects going to the same commit which set off my alarm bells.
The boot grinds to a halt when it gets to the end of userspace bringup:

| getty@ttyS0.service;invocationid=3Dc161395710bf441d8427be13d54aa849;type=
=3Dservice\P+q6E616D65\
| Debian GNU/Linux forky/sid debian-testing-arm64 ttyS0
| debian-testing-arm64 login: root (automatic login)
| Linux debian-testing-arm64 7.1.0-rc5-next-20260525 #1 SMP PREEMPT @177972=
4722 aarch64
| The programs included with the Debian GNU/Linux system are free software;
| the exact distribution terms for each program are described in the
| individual files in /usr/share/doc/*/copyright.
| Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
| permitted by applicable law.

then no prompt appears.

Full log:

   https://lava.sirena.org.uk/scheduler/job/2796935#L2638

Bisect log:

# bad: [d387b06f7c15b4639244ad66b4b0900c6a02b430] Add linux-next specific f=
iles for 20260525
# good: [c745c46074da99cdcef8c1fc6093030c6f9d7143] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [34808ac8ddafc3e2c2a59e84eaab0a410e7a0fdc] regmap-i2c: fix sparse w=
arning in regmap_smbus_word_write_reg16
git bisect start 'd387b06f7c15b4639244ad66b4b0900c6a02b430' 'c745c46074da99=
cdcef8c1fc6093030c6f9d7143' '34808ac8ddafc3e2c2a59e84eaab0a410e7a0fdc'
# test job: [34808ac8ddafc3e2c2a59e84eaab0a410e7a0fdc] https://lava.sirena.=
org.uk/scheduler/job/2783529
# test job: [d387b06f7c15b4639244ad66b4b0900c6a02b430] https://lava.sirena.=
org.uk/scheduler/job/2796935
# bad: [d387b06f7c15b4639244ad66b4b0900c6a02b430] Add linux-next specific f=
iles for 20260525
git bisect bad d387b06f7c15b4639244ad66b4b0900c6a02b430
# test job: [4c0ea14d8ec6f6fcb94b7ad9248679ffcf747e9b] https://lava.sirena.=
org.uk/scheduler/job/2796998
# good: [4c0ea14d8ec6f6fcb94b7ad9248679ffcf747e9b] Merge branch 'libcrypto-=
next' of https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
git bisect good 4c0ea14d8ec6f6fcb94b7ad9248679ffcf747e9b
# test job: [af3c2d822a4b67034aa47554c178b5ffcf973456] https://lava.sirena.=
org.uk/scheduler/job/2797090
# good: [af3c2d822a4b67034aa47554c178b5ffcf973456] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
git bisect good af3c2d822a4b67034aa47554c178b5ffcf973456
# test job: [2f8df83b202ec7f8080a25b2e9da79c3361775fd] https://lava.sirena.=
org.uk/scheduler/job/2797983
# bad: [2f8df83b202ec7f8080a25b2e9da79c3361775fd] Merge branch 'char-misc-n=
ext' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
git bisect bad 2f8df83b202ec7f8080a25b2e9da79c3361775fd
# test job: [6b55dddad1ed45d92eef8046156965f7709f0d52] https://lava.sirena.=
org.uk/scheduler/job/2798041
# good: [6b55dddad1ed45d92eef8046156965f7709f0d52] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/virt/kvm/kvm.git
git bisect good 6b55dddad1ed45d92eef8046156965f7709f0d52
# test job: [6206468c5ba41e14b55d8dfd71af1611398a3399] https://lava.sirena.=
org.uk/scheduler/job/2798075
# good: [6206468c5ba41e14b55d8dfd71af1611398a3399] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
git bisect good 6206468c5ba41e14b55d8dfd71af1611398a3399
# test job: [cbfc1fc9f6d2bd7364610b0077f55f16ff78cbab] https://lava.sirena.=
org.uk/scheduler/job/2798512
# bad: [cbfc1fc9f6d2bd7364610b0077f55f16ff78cbab] Merge branch 'driver-core=
-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git
git bisect bad cbfc1fc9f6d2bd7364610b0077f55f16ff78cbab
# test job: [3c15372851403012d068a6f388770ed98dbe684e] https://lava.sirena.=
org.uk/scheduler/job/2798558
# good: [3c15372851403012d068a6f388770ed98dbe684e] Merge branch 'for-firmwa=
re-next' of https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
git bisect good 3c15372851403012d068a6f388770ed98dbe684e
# test job: [a9c12b783cc711de3ac7f188bed07d529bb818af] https://lava.sirena.=
org.uk/scheduler/job/2798584
# good: [a9c12b783cc711de3ac7f188bed07d529bb818af] device core: make struct=
 device_driver groups members constant arrays
git bisect good a9c12b783cc711de3ac7f188bed07d529bb818af
# test job: [25025253476a64c186592d952c27f24bc3490e42] https://lava.sirena.=
org.uk/scheduler/job/2798628
# good: [25025253476a64c186592d952c27f24bc3490e42] leds: Adjust documentati=
on of brightness sysfs node
git bisect good 25025253476a64c186592d952c27f24bc3490e42
# test job: [13443fbf62414e42afb1675ab2d3b767c6466915] https://lava.sirena.=
org.uk/scheduler/job/2798847
# good: [13443fbf62414e42afb1675ab2d3b767c6466915] driver core: Stop using =
generic sysfs macros for device attributes
git bisect good 13443fbf62414e42afb1675ab2d3b767c6466915
# test job: [314537a0cd78d7a07f6e7ce7dcc0ce340e41fb2c] https://lava.sirena.=
org.uk/scheduler/job/2798892
# good: [314537a0cd78d7a07f6e7ce7dcc0ce340e41fb2c] Merge branch 'for-next' =
of https://github.com/cminyard/linux-ipmi.git
git bisect good 314537a0cd78d7a07f6e7ce7dcc0ce340e41fb2c
# test job: [024480bf8d75bd16894c5b0eb6082b6e6dae4970] https://lava.sirena.=
org.uk/scheduler/job/2799135
# bad: [024480bf8d75bd16894c5b0eb6082b6e6dae4970] driver core: Constify cor=
e device attributes
git bisect bad 024480bf8d75bd16894c5b0eb6082b6e6dae4970
# test job: [434506b86a6cde84a0ef19daa9e3b1926e2f96a9] https://lava.sirena.=
org.uk/scheduler/job/2799464
# bad: [434506b86a6cde84a0ef19daa9e3b1926e2f96a9] driver core: Allow the co=
nstification of device attributes
git bisect bad 434506b86a6cde84a0ef19daa9e3b1926e2f96a9
# first bad commit: [434506b86a6cde84a0ef19daa9e3b1926e2f96a9] driver core:=
 Allow the constification of device attributes

--2JoZJ2qKfgbxfKZX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVs6MACgkQJNaLcl1U
h9CXOQf+KXNpLbPP9riSp9bjBrgDCBOlMLNmNV3dCUhKTPoTn4vXKz3bPTMt53r8
zvBG14CGUV1QlC56OvDRguVe+zbweYlvFS3HXqMVoCl0mJ9o7N/C0xO1aJdwDKU7
9OZDIkwsTZFQ+mgE0tRCCXM7+sguquyORDZqhSNm5VDqNqQ8/B87JnZD2feoEe8P
lEWQ6kDmEyW69fodaRhCSw+rEa/NHASn7d1nhvM2mi7IxMOqp4ptj+i4z5fK6v/H
MUwhDaRF1Dgb7Rob/hCNNPmjw9xxQVCmengEz7aAiocTdgFv6LtdwV+7SzylDsfW
2YQyRtoa2rtpeHSaz8wuIdbgq2f+EQ==
=Q26C
-----END PGP SIGNATURE-----

--2JoZJ2qKfgbxfKZX--
