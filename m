Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627896;
	b=tPtb5vOrFSnyVNR/eL8Wz02AoF0s8XF1Ic5e9FjY6qyUAj7TUfGecpHqtbgEfwKudPIf
	 bEranyc05ELtX5od8tc3/sQ9+s+RNlh8gvvmnIuovr64RManUF+DenKLGfnAa7H1oNLiC
	 UT9IaiQSS3HMXOvdrtdTYnUU/YcoUqix4edgGtnEV0/rScAh3PXVCqBihjttPILOxQRRG
	 uV65jXtgLl5cSfaokj+IPbNtZYYPTK1Gp/HTeGqCuZT38jAnHTs6ETss1UU0n+N3ZkIAR
	 K205o3gkHtciSl0po4DN7TGN5Z4dPxlHVWvC0PIk4yiLDsewkwvH7w5+35pFJmRC4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627896;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=d9+3y1V3gU5fVb5luQ3W55zbiGKPfI1GPY0R8ByKx9U=;
	b=F6OPPM5YEXK+1IKyXYPcZLCsUpPLIlw01c8/DWdubfAKQ5DzIzg+HEz9Y4JD4o96dafW
	 C7YcV/sxza1HNP4b4ms7abl2lppgMNSD9nFaFoR5k3N8/Kx/FCh9b304op/ipR5idHwW5
	 n2SgHbEK6vVXUXoPl6Kb/iRqM7ChxEXEEPHTiuC2O54gchzNEP1beAvO/r1kQ4RP4MKAQ
	 +4ubLGFsyrUECD6hlR7ld5Wckb0QVfLdVphXnX8J2NBfJTjIhI4m49a9hnB48ac7NK2pA
	 MnffIP3vgeUD0qjs1hM1qBSjlmj3HhRyZqXLcnAha2wv9tlj3BPz1rhERJGADLtw84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NF8S/TWJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0C606A327
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NF8S/TWJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAF71F000D2;
	Wed, 25 Nov 2026 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795627895;
	bh=d9+3y1V3gU5fVb5luQ3W55zbiGKPfI1GPY0R8ByKx9U=;
	h=Date:From:To:Cc:Subject;
	b=NF8S/TWJmVZXddfzWd2Y3rOzp2jC++JuNDRp1Z2Gp1VSwikI1ACgEFO3KJKyddHwY
	 WeXRXhMJ2iKKZqV2ywNXXSFbLs3e36sKq85N1n4BnPN5m4EPCzp9HW69qT3OPSIdbQ
	 mi8MEGCfS96gCpYncL17EIN/BBn6qiagj6VukVJP0IvXeUxv1v5VmE7tMqcNyfS8p7
	 /RHq9h6zrvBBAkzeiPx/JpWE2zhnZX1yRbrwP4A4J+92txEoqYUjC++RhNApTdhEla
	 WWLR7aJgCiX89A08MU5Mq3vGl4SmAz1sQ1WWOiNiglDWfau1/vE1WTBgNCF435JhLy
	 CZSjyjqYIxKdw==
Date: Wed, 25 Nov 2026 18:31:32 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev
Cc: Alejandro Colomar <alx@kernel.org>, 
	Gui-Dong Han <hanguidong02@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] driver core: Use strcspn(3) instead of open-coding it
Message-ID: <fec2c9cc06751e57b48b5df83d0ba3881991eeae.1795627264.git.alx@kernel.org>
X-Mailer: git-send-email 2.55.0
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
	protocol="application/pgp-signature"; boundary="r5l72j3tvjahao2g"
Content-Disposition: inline


--r5l72j3tvjahao2g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev
Cc: Alejandro Colomar <alx@kernel.org>, 
	Gui-Dong Han <hanguidong02@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] driver core: Use strcspn(3) instead of open-coding it
Message-ID: <fec2c9cc06751e57b48b5df83d0ba3881991eeae.1795627264.git.alx@kernel.org>
MIME-Version: 1.0

This code was an obfuscated way of spelling strcspn(3).

Signed-off-by: Alejandro Colomar <alx@kernel.org>
---

Hi,

I wasn't sure what to do with the existing comments.  I've merged them,
but feel free to suggest something else.

BTW, the strnchr(3) call was superfluous.  It would have been fine to
call strchr(3), and it would be faster.  Since the input is required to
be a string already (we call strlen(3) just before, so I assume that),
strchr(3) would have been equivalent.  Also, strchrnul(3) would have
reduced a branch.  And given that strchrnul(3) works fine on empty
strings, the outer conditional is superfluous.

So, this is really a multi-step simplification.

1)
	-		cp =3D strnchr(s, len, '\n');
	+		cp =3D strchr(s, '\n');
	 		if (cp)
	 			len =3D cp - s;

2)
	-		cp =3D strchr(s, '\n');
	-		if (cp)
	-			len =3D cp - s;
	+		cp =3D strchrnul(s, '\n');
	+		len =3D cp - s;

3)
	+	char *cp;
	+
	-	if (len) {
	-		char *cp;
	-
	 		cp =3D strchrnul(s, '\n');
	 		len =3D cp - s;
	-	}

4)
	-	char *cp;
	-
	-	cp =3D strchrnul(s, '\n');
	-	len =3D cp - s;
	+	len =3D strcspn(s, "\n");


Have a lovely day!
Alex

 drivers/base/dd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 7cb770656fa5..43b2228539eb 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -396,17 +396,10 @@ int __device_set_driver_override(struct device *dev, =
const char *s, size_t len)
 	/*
 	 * Compute the real length of the string in case userspace sends us a
 	 * bunch of \0 characters like python likes to do.
+	 *
+	 * Handle trailing newline.
 	 */
-	len =3D strlen(s);
-
-	/* Handle trailing newline */
-	if (len) {
-		char *cp;
-
-		cp =3D strnchr(s, len, '\n');
-		if (cp)
-			len =3D cp - s;
-	}
+	len =3D strcspn(s, "\n");
=20
 	/*
 	 * If empty string or "\n" passed, new remains NULL, clearing
--=20
2.55.0


--r5l72j3tvjahao2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsHG24ACgkQ64mZXMKQ
wqlIxA//ToMhUF9MfsR1jywTp6zogql4U+epYzYgo0j5fd3Qnzz2BITbNpv58SAG
XYFDo9v6pcfdZX6R1/f82lJR9LhYLLXtEol9YNDfz5PC1HaqPrzo+IDaeqvQaOxp
iiJzveKIQVyFJ6OGMnoON6Ol2NrQLZVH0mJtWE2QfpSzHbZAyecjB0vzdQt9yPJG
XODPW2KTjpY19ojPYqAoCuwcx5ryMKgqvyVQi8HPbUp1whszm5iwMSSBoQ+xQiLs
9ToZFzID8nFp5FAxkbmSM1cL6UkteE05bWsw8V0DobtqDZJ1BODLFE1OeAxId6j5
hOzsGaXn0CWIrv32FzMy/jJLhf0RSE59KC8onlmIwTiT68EB5jAdPcZq9yUXgcVc
Kh/ST+cnjjOLaHYxP0nrVbvtufMg/5pk67hBlL44wtMDLNwZdl7Op1S+tzmkUoVv
h0ZVlexwIuHvebGVSGu3eWKBlRYSKjH+FQx7UukvrsDaXSdb3dGfBxKS4K2AnTGe
9YggC0FkLdw0XI+bmG3gmtToIcH5HMCW6L+bgao+G0FeCFMaaIP5qWOczckBW5IV
9E5CUdqFtby+pU2n/ZAm9a3dKfWI6tIIUET/m8n2NUl82O7NqcqKFY0IyAafKfxk
ti9UnWTZeZjDetdRwfk19JvJuwArWEeUXZfjbe1IItN5gNLRsBU=
=1eE4
-----END PGP SIGNATURE-----

--r5l72j3tvjahao2g--
