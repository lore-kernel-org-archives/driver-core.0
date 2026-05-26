Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549D311956;
	Tue, 26 May 2026 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809153; cv=none; b=orgwTdxrt5TwnRJwZpn2HSgVeo2R162tGjRXOOlV1LmGCRfvikjVK2N9Zk2cD2VrCUWPJlbsTeL92r7zbgIsc0UnvKM0w0MbcRTLIcc+zRXP4vxWFKCLFVeayQpYnnQhqK/F9NW3nOCSqXwQbj/cjJsMvPRPMFvL3WTghX7d62k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809153; c=relaxed/simple;
	bh=OMVuyQcCsu1c06m+XjdzQ/Z5Nm5Gf+zz3Upc8NRHMkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7sHnq3iV1g7BEuEkXzhfdFCBwEbZ9LnRkjEsiin57CQkD3RDnr7Fi+VAwJwsFasnXcd3REOGsT80qEtsDfjGf9K3ldepiPg5XSvszWaSzHMae6XbexNjEh3kyrbv6xbtEPcpO7tLhn5D8LHoj3VmKVhg4mlkMdJiuMvS1zJ3Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZlE9ymr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZlE9ymr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597A61F000E9;
	Tue, 26 May 2026 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809151;
	bh=Xfz4JXDpVbQ2kXHSXCe4ePCRtRccRKd/Vu3DGm47XpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PZlE9ymrdOCdp69zz+i9LH4IKGzSztPhuN+jIhUe9ffKf0ISLri41rdtX48rNxNBz
	 os+ZgTXzoac3Ryu+uyXPTz3HsYw8hYxZyHSP/TD+yAtqSPXtcYbRMdp92U3NMEaiOO
	 iaz6UfugL1wMIunmp5k9NZzadyOu8z2LqKVYRCIQjKDWF65v1+GJ9BiC+wkXoYLoNI
	 1MNildwkg1j8b6mUPOUgDAzis1USnbJlc/bOVSa3CFCdCLs2pFF2rIABDgGx//Ek7a
	 aJTe70SFS+Hw4GCTGrUqMhdIyyzOoH1ST8KCNaxcJCGwVhSA8pJdZUqYpeW+D4aYGe
	 wBQvhUvUx43ig==
Date: Tue, 26 May 2026 16:25:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Zhang Yuwei <zhangyuwei20@huawei.com>
Subject: Re: [PATCH v3 4/5] driver core: Allow the constification of device
 attributes
Message-ID: <874d9889-1a2c-49b9-8d7c-f963fc21dae4@sirena.org.uk>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
 <20260512-sysfs-const-attr-device_attr-prep-v3-4-cb7c17b34d52@weissschuh.net>
 <42a1555b-5d98-4601-8699-eab86aeb115a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xdD+uwJj/zSoiZj"
Content-Disposition: inline
In-Reply-To: <42a1555b-5d98-4601-8699-eab86aeb115a@sirena.org.uk>
X-Cookie: You are fairminded, just and loving.


--3xdD+uwJj/zSoiZj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 03:52:24PM +0100, Mark Brown wrote:
> On Tue, May 12, 2026 at 06:39:14PM +0200, Thomas Wei=DFschuh wrote:
>=20
> > Allow device attribute to reside in read-only memory.
> > Both const and non-const attributes are handled by the utility macros
> > and attributes can be migrated one-by-one.
>=20
> I'm seeing NFS boot breaks in -next on at least the libre.computer
> tritium which bisect to this commit.  I don't immediately see what this
> commit might have done to cause a boot break, but I did get two
> different bisects going to the same commit which set off my alarm bells.

I've now got another bisect which comes out to another driver core
commit 1137838865bf (driver core: Use mod_delayed_work to prevent lost
deferred probe work), I don't know that that is an accurate result
either but it does look like there's something fishy in this area.

Log for that bisect:

# bad: [d387b06f7c15b4639244ad66b4b0900c6a02b430] Add linux-next specific f=
iles for 20260525
# good: [c745c46074da99cdcef8c1fc6093030c6f9d7143] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [34808ac8ddafc3e2c2a59e84eaab0a410e7a0fdc] regmap-i2c: fix sparse w=
arning in regmap_smbus_word_write_reg16
git bisect start 'd387b06f7c15b4639244ad66b4b0900c6a02b430' 'c745c46074da99=
cdcef8c1fc6093030c6f9d7143' '34808ac8ddafc3e2c2a59e84eaab0a410e7a0fdc'
# test job: [34808ac8ddafc3e2c2a59e84eaab0a410e7a0fdc] https://lava.sirena.=
org.uk/scheduler/job/2783502
# test job: [d387b06f7c15b4639244ad66b4b0900c6a02b430] https://lava.sirena.=
org.uk/scheduler/job/2796934
# bad: [d387b06f7c15b4639244ad66b4b0900c6a02b430] Add linux-next specific f=
iles for 20260525
git bisect bad d387b06f7c15b4639244ad66b4b0900c6a02b430
# test job: [4c0ea14d8ec6f6fcb94b7ad9248679ffcf747e9b] https://lava.sirena.=
org.uk/scheduler/job/2796983
# good: [4c0ea14d8ec6f6fcb94b7ad9248679ffcf747e9b] Merge branch 'libcrypto-=
next' of https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
git bisect good 4c0ea14d8ec6f6fcb94b7ad9248679ffcf747e9b
# test job: [af3c2d822a4b67034aa47554c178b5ffcf973456] https://lava.sirena.=
org.uk/scheduler/job/2797058
# good: [af3c2d822a4b67034aa47554c178b5ffcf973456] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
git bisect good af3c2d822a4b67034aa47554c178b5ffcf973456
# test job: [2f8df83b202ec7f8080a25b2e9da79c3361775fd] https://lava.sirena.=
org.uk/scheduler/job/2797982
# bad: [2f8df83b202ec7f8080a25b2e9da79c3361775fd] Merge branch 'char-misc-n=
ext' of https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
git bisect bad 2f8df83b202ec7f8080a25b2e9da79c3361775fd
# test job: [6b55dddad1ed45d92eef8046156965f7709f0d52] https://lava.sirena.=
org.uk/scheduler/job/2798010
# good: [6b55dddad1ed45d92eef8046156965f7709f0d52] Merge branch 'next' of g=
it://git.kernel.org/pub/scm/virt/kvm/kvm.git
git bisect good 6b55dddad1ed45d92eef8046156965f7709f0d52
# test job: [6206468c5ba41e14b55d8dfd71af1611398a3399] https://lava.sirena.=
org.uk/scheduler/job/2798076
# good: [6206468c5ba41e14b55d8dfd71af1611398a3399] Merge branch 'for-next' =
of https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
git bisect good 6206468c5ba41e14b55d8dfd71af1611398a3399
# test job: [cbfc1fc9f6d2bd7364610b0077f55f16ff78cbab] https://lava.sirena.=
org.uk/scheduler/job/2798520
# bad: [cbfc1fc9f6d2bd7364610b0077f55f16ff78cbab] Merge branch 'driver-core=
-next' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/drive=
r-core.git
git bisect bad cbfc1fc9f6d2bd7364610b0077f55f16ff78cbab
# test job: [3c15372851403012d068a6f388770ed98dbe684e] https://lava.sirena.=
org.uk/scheduler/job/2798573
# good: [3c15372851403012d068a6f388770ed98dbe684e] Merge branch 'for-firmwa=
re-next' of https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform=
/linux.git
git bisect good 3c15372851403012d068a6f388770ed98dbe684e
# test job: [a9c12b783cc711de3ac7f188bed07d529bb818af] https://lava.sirena.=
org.uk/scheduler/job/2798622
# good: [a9c12b783cc711de3ac7f188bed07d529bb818af] device core: make struct=
 device_driver groups members constant arrays
git bisect good a9c12b783cc711de3ac7f188bed07d529bb818af
# test job: [25025253476a64c186592d952c27f24bc3490e42] https://lava.sirena.=
org.uk/scheduler/job/2798651
# good: [25025253476a64c186592d952c27f24bc3490e42] leds: Adjust documentati=
on of brightness sysfs node
git bisect good 25025253476a64c186592d952c27f24bc3490e42
# test job: [13443fbf62414e42afb1675ab2d3b767c6466915] https://lava.sirena.=
org.uk/scheduler/job/2798921
# bad: [13443fbf62414e42afb1675ab2d3b767c6466915] driver core: Stop using g=
eneric sysfs macros for device attributes
git bisect bad 13443fbf62414e42afb1675ab2d3b767c6466915
# test job: [81e7c6befa36cecdcbf7244393bd67e8f8c59bf5] https://lava.sirena.=
org.uk/scheduler/job/2799138
# bad: [81e7c6befa36cecdcbf7244393bd67e8f8c59bf5] of: dynamic: Fix overlaye=
d devices not probing because of fw_devlink
git bisect bad 81e7c6befa36cecdcbf7244393bd67e8f8c59bf5
# test job: [1137838865bfc9a7cd5869c1dc5c22aa45ec12c8] https://lava.sirena.=
org.uk/scheduler/job/2799476
# bad: [1137838865bfc9a7cd5869c1dc5c22aa45ec12c8] driver core: Use mod_dela=
yed_work to prevent lost deferred probe work
git bisect bad 1137838865bfc9a7cd5869c1dc5c22aa45ec12c8
# test job: [9582485a65eacfd7245ec7f0a9d7e2c34749d669] https://lava.sirena.=
org.uk/scheduler/job/2799512
# good: [9582485a65eacfd7245ec7f0a9d7e2c34749d669] device property: fix fwn=
ode reference leak in fwnode_graph_get_endpoint_by_id()
git bisect good 9582485a65eacfd7245ec7f0a9d7e2c34749d669
# first bad commit: [1137838865bfc9a7cd5869c1dc5c22aa45ec12c8] driver core:=
 Use mod_delayed_work to prevent lost deferred probe work

--3xdD+uwJj/zSoiZj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVu3sACgkQJNaLcl1U
h9B2+wf+JGGDDatL68gXAIjPphqZtH8XrLHNWdq9KdIPrgH6NcMOQS5pMgBcbb64
i8+BZnOx45s9k8XacsUb3urnPD9SnKeTN0dWI7Z7pq7DgR3L3jLpPx2DyefzKzY1
tdGzvfNT1Bz2OeQVPK/Zc38BtHzsjTHLrDquoRhID6PiqW/4mhI7A3eDMqoZecX3
9Tojwmox1whFCgtH0lTLLl1HB/oATh8n39USWmk1tNtTgum7NBa5MB69TjxbmqXR
SVcFLqFgsRwKZ63ABQWGB0LqGXgQgFVdpFd3S37wcDbEyYOTyD/vKiJyi/PJfB6I
iF0EW0UU5KfzAVlYzzRwPIA4M4Shcw==
=AEbi
-----END PGP SIGNATURE-----

--3xdD+uwJj/zSoiZj--
