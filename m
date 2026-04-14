Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FE3164C7
	for <driver-core@lists.linux.dev>; Tue, 14 Apr 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776191969; cv=none; b=Fg/lI5PxpK20pttjEb/UODW65xAw6pFeFrXi3wlWK0+H7l0OlZE55iaoOmcU5HGctKZBEFea0TUS/O3UfITA56uEiPBrpMO1vBBMFxgalQ3Pws4QZZ+VJh9uA2hbKlWWSJdnQp0je98EpFVMBSYrAlzwbgdECz/+e67CU/Z1Q6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776191969; c=relaxed/simple;
	bh=Al22eCsPrDMWwuzUlQzmULHU1hnnVnLvohxy1An8XkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlCHHZzmTP09/SfDeWPm05UGLXLrW0htu9MMorpqHRK+bcCa81XoAJnVljVT5DVc4mnAln6iku9hZdMwG4eJr7Ty8SMpsRQl9H/VCFaQr8T9TQYhjFWfcpxrD1TZmLbWckgh7KAHO7T5Ko/klBXBg42kbrYtJc2hjwSCzb4bjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=oE9noJwA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="oE9noJwA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b00ed86fso61491795e9.3
        for <driver-core@lists.linux.dev>; Tue, 14 Apr 2026 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776191966; x=1776796766; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QDqOVJTUyVa1BVmErQMnVWTnNiaUpnAIeTBw2pAF2g4=;
        b=oE9noJwAEULs4s5oonMhjtb03cbiAooI1ELXgN3y0tN/5uA7fqvMvBIdDGHxtpSLQF
         22X55IOrzZkUfte4piUVtWifKOp/Jybc7hzbmZUeOvpoNWDdSPBcPw3zDwW52+BxVspW
         uauvJWcQ4jfhx40nhz3gSWUvFLNKhoD8Cdoma2w1+YUlBOIR93wsMH6swtzYneZ5O2LZ
         yLfVvi+ZZqEvOCbZRtY1jG7zmi/kOahsxiKts6SGfbboFRWBHbY8i9N5hl0zkan2FMdT
         5cN2iJ5q8wwNTykOUkDO6bDbtBCvGXaxY5VtceONxHmPJ9liFQDd+fr0sr50RqqoFFEZ
         24Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776191966; x=1776796766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDqOVJTUyVa1BVmErQMnVWTnNiaUpnAIeTBw2pAF2g4=;
        b=J5ONAidwdxOF8u0wUDClOqTYqi6zNjvmQmxIi1w3KPoyj9pJ7Wh+9kB8WziKurHJbg
         Mq7udv3iXBdEBQdJ0EkrtLUuok8uSX6RmUAVAFFlcBYVbo+tZelfRzKMLszxio+qd9sN
         E+ZzoVr1rvV6+tvuqnzwncpgLP50TKisUXS7pkNxBOtsTADi/rqK1b9sAodoSCB5FFd0
         Fcf55UKplTmQA+47RpyRFDXYspSh0ddTeDs4vRWvu46KxILWLw6oFGWWh8IfCqGxKgdF
         UmsTIFL/TalSr8Q2L2XkodGKsx69C79He9PQkjx8JVmNIECioESU8DELGB7IGntwDiaz
         9tcA==
X-Forwarded-Encrypted: i=1; AFNElJ+cTZXfdO/JJnp+TpCQ1XFqwVc6DQn5CBOxnuDkdJqA8Ial6+sgwUXGuhH05+JNcQTKOzP3cuzQARDd5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEMFLeCN3Kfpyk+smde094kPEQdIyaZtVrzWIF/cQE2EYmno9n
	+LGEkeO30rFW9cU7mVJBqzjQumBywqtTa+WsdgkCj9uC1QzTknKjU59d6K6QfYoiiCM=
X-Gm-Gg: AeBDiet197AZ9EZpKJ1QfCjdmRs9jdK8E7YFQZ5Q69Ld0j5YYRR5YHij1Vnj42UUiIE
	wA5376xsONepR96eBf4loAUF1PRf5U6T/5DKIZWQ6FZQoKfxJFyq07SwgLyd/C+DMrLrglgQVji
	QXmppUUEX+y5rJ8ki+fVCSLEMb01o5YN7wIbHayodnPfIEVhUmhRiBlZxFGOl5ofslCnxjHGT63
	zBo7iq9tksHm2AwMONSWTUl+zhtLy245KEnjGxPtZ5qY7eeoD43I3C+JhkcWi1JJbt6Iqb1A1l6
	ytePtCYQfYnhpMXeSPjbTB6HY3urOmMqKuD25eFs4rx4VWaQo7gOe4/rQ+FV1HmOdyUljTqU1WQ
	i8YgfQnMpxgFNRfnra14iDXnGu/b7DWjtuQ/3z5U9Mm+md/IpjKAe0xBcZvwlUGmj1ON4ts1JrG
	RuownKsFvRZ1hMLPkLm//233Idwg4dmKuJsKdnv4/FgyUZJrk3j12hxwV5bVFTyKavSZmtOt5NM
	tlOzsjRSHp9qA==
X-Received: by 2002:a05:600c:46d0:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-488d689dbfcmr264013605e9.30.1776191966269;
        Tue, 14 Apr 2026 11:39:26 -0700 (PDT)
Received: from localhost (p200300f65f20eb08ef305da4f44807a2.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:ef30:5da4:f448:7a2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488ede15694sm118371645e9.3.2026.04.14.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:39:25 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:39:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
Message-ID: <ad6IJwpp5AA0-fAW@monoceros>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="blufdf4hg3r3mn2j"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>


--blufdf4hg3r3mn2j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
MIME-Version: 1.0

Hello,

On Sat, Feb 28, 2026 at 11:44:25PM -0800, Linus Torvalds wrote:
> On Wed, 11 Feb 2026 at 15:04, Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > Driver core changes for 7.0-rc1
> >
> > - Bus:
> >   - Ensure bus->match() is consistently called with the device lock held
>=20
> So I'm coming back to this, because it turns out this sounds like a
> horrible mistake in the end.
>=20
> You document it as being about consistent locking, but it appears this
> change is what made the "firewire oops at driver attach" turn an oops
> into just a silently dead machine.
>=20
> In other words, it makes fragile drivers go from "you get an oops" to
> something much worse. The oops becomes unrecoverable - with typically
> a black screen at boot - because the probe is holding a lock that then
> makes everything else come to a grinding halt when the driver fails.
>=20
> And yes, this obviously only happens for buggy driver and doesn't
> matter for _correct_ code, but about half of the kernel code is
> drivers, and that half of the kernel code is also the typically the
> most badly tested and often questionably implemented half.

I have a machine here (stm32mp135f-dk, ARCH=3Darm) that fails to boot with
dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()"), but doesn't oops on dc23806a7c47^.
(Fails to boot =3D no kernel messages on console.)

I didn't try to debug that yet, but I wonder if that is an understood
problem of said commit. I know that the commit was reverted in the
meantime (and the machine boots fine on 9de68394a615 ("Revert "driver
core: enforce device_lock for driver_match_device()""), but does that
mean that there is a driver involved that somehow violates driver core
assumptions and should be fixed even without the consistent locking?
Hints about how to approach the issue (if there is any) welcome.

Best regards
Uwe

--blufdf4hg3r3mn2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmneidkACgkQj4D7WH0S
/k7mDAgAj2QD1GrgaK+tSN/eZXXN/Qh33Q0fcE5ECUYjXCEQOQ1/Q0PENWiMEJcD
1JcKF8Jak0kMclC6LLwAc7RiVYQR5DZJ78BQlqh4ztLmBpVBr5SOiUTIyL2MvyCX
xcuO3DWSQkpoBCzBxLHaRyLUkg4lpkI+YG4iasQkeia77K+wwr3CHzcLtUJmPuJM
hN/GwawWf+pCjemuKj1tDv1dzLcXfA7LKVfqG8cGiDj6YXzAI3rXHvAjRZlyYde5
+4ajajrBgskzGi17QNymTyCwO4+5i+lOvyio54/wW/C+zZuzKC6e+nKoGdhEonFZ
xuh+AtnOD5zUXWOPg4Xsmk4tqnno0Q==
=0NgR
-----END PGP SIGNATURE-----

--blufdf4hg3r3mn2j--
