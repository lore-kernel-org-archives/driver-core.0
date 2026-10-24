Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827178;
	b=ywubjJXZoXkR6JlEduQoQa7PSBv6Sp7Y1BkPhPD1MGYUAieH/5qQt1NQ9sdDvcF0iXvi
	 PZQu0EiXuykU681Ldohcd0XF8nq3sQ9k3A81WULDJ73vt8mTcx1wzxA9aCocI7kq4lrWY
	 kAelJB5a42NzPeXZbr04t2twltcrbVon7qaZ3MFfWXm2Ji15sUucxtq5N2Tn1QLGI5zgD
	 dbvmo7u1khDmWZaWr517746EXeKeEICvs189EwvYXpY52es3T7K9c7PiTDyVphgizqA08
	 wP9W6uhn5thxsjFs/ETV6Sv6Mv69+D+Xg9LbR9WLUDa+L1bE5dB0fz90fA2SGkmPaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
	b=ywH9HsznMKOsNANaVBH2NJ1KHbqIt+nu6fMy5c3kEfSZPNuK6bnj9UlNa3qhlXjxcI4J
	 meB+Xpoq9rZxJbeNdhm8EFnf+Yk/7mRci1jtjETa0yuHmMunpXA4pXtsxUERIXHSWTTsX
	 nuDevOCn4P1aLw0BlkpGok6DJixG7Kz+QRb2kxWwLdMJL7efBN+WsRVi+gVyev9xpvAcr
	 aoBLBmH80ZCFU8hSRQt/OoRpS66DXaPKHRWnFZ/h5VjLEV0aPYiTy605ayOmx5csJG1wx
	 x+9H/N2QtSVKfrsCMNsi7IBki6pMQ923DHI6v/zR2WOZEaVXebgy/xENFuEtP3+NrFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CD0606A31F
	for <driver-core@lists.linux.dev>; Sat, 24 Oct 2026 07:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40CD0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b060ec084so956503f8f.0
        for <driver-core@lists.linux.dev>; Sat, 24 Oct 2026 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792827174; x=1793431974; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
        b=MOl+7MyEoooJWR419oLp6A9JlpGnqpfAJ8EVieON83qEWRre99VV2vvlFV/ORPSfDZ
         8ftt6D5wC0zFz3IWcKxiS8+ImJpBl/CnPPb/IEDWDBkIu54+VM0oygNr2YomSl9uxJzz
         M4yYBT4YVJ5Z9K7FmFAo6XCxudPHkJjcStPh8kgZfvZ6SRe5ipLL8Ezc/NTAyapADdxf
         4cFV64uVzAsEF0pRKdMNQQ9n4xg0D5+HQgA7y25u67eBZ6946CjPxPnCpitrkB7Q0cPI
         icSpJ+jeStU2MWHsY9RwIn13xrDpVRZXk26E1ftoYXw2b5IOZq5gfGQ8Z3wEIEaUBy4h
         pLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827174; x=1793431974;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li2QB09lPsjXluSnSfXMvObkOrNnmZZOmi28fPXekeo=;
        b=jP9j2JgYj7TgeqCwidmWucfKZ0aipH0a3jUnD9dzr4Zd8iI51MAcfV24hmvZBoPoLQ
         lrVDbAQsfbHNnbvFKfrXzXu5jmdopBzPXGTDMFbYix7by4tTu1XelBS+z4X+R12BWWpA
         DUgCjJ0zhFIBu6n8+7S7jKCucB5ovsf31Pp8KXr2cG6827GOXEkz2KEHQFMLwlmUafop
         rNlv1xDNZcI6U46L4MtQ8g8w96pLPwQMUcT52qIW5RZ3zbSMTsGJyVp5O/HVmi+lFwf1
         bqqL/WIWT2JopZ7KMHgyrSFiVrfIwf9n4gLAB7qzarKL4RsxFyT6Lp7t9E943F2y6kIP
         BPFQ==
X-Forwarded-Encrypted: i=1; AKwUvByCsh06+K8bILIUEDC8IK5LU6G3pHco74cvTH2u0QzCz73DyekDwvOrEaEh5E3/XoR0fsoojx4Rox+A7w==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0+nQej1jvjaIMlsr2ZLDs3kP9WAekXrVaeQVGNqWqzOXDnIvg
	6PszITo2LzhZn7iaGW70qbA8zyeUXOOrQZUPisBo59aciEEkyzq+51Y4K4x/68gorp0=
X-Gm-Gg: AYBFou2FdSRWBOWJ9d2xX9sW4/dPEhqCUb5pYg+HX036IIpdC8VfQbLjVtx6VphU/8+
	V4pp12xqCytU4rZ4Xg1e0SntOIhhMCab9i8noPxQ1Fashxm4vcE2h5wLwuIBxik8uMrkuadbI39
	NWiWwA/+Ga7YeqN6y+G4kQx5CaKjsWP+Wx2WwEp2Z3Lzqgcx40qoj8JsfX+aiuk4Auzwe8JvNvc
	gYxaVYpej2/kx3ZYy+s7mVBNaeE8kMDRo3GOH3BWKVtb6keb9aFgC88/32cUmAdHPnqUindaiyU
	JRRt7IztoMvZrOXqAMyNVDkLgSHRQe67BJUF1BlkI2FPuqRfkI8595V89xqQqpw4+4RWf84CMJw
	VPIw1yVHxyTvI8GEqAYFTc5+ZXcpxxgSMkc5hNBUcl8RoqjiMBmfC8vNqxe4Ia3z1dgZ3akM9+t
	jC8FG8gNxn2TW0HrDALdCbJF9e8U1buFBqVvjrrzJvCUvcVZnd2/GaJZq8ry+b6+Ew/Q2yV1Ex9
	bAfY9IgC4Kn7leBU2lvUVMmhoqJaAW/1f5zQQHEfQKYvLZb+VmSwB+fUTPs6tJUUXhTfeU9dvRY
	q/rgjF2v+lBjbVZiOplJzCz7r284jJz2ftY=
X-Received: by 2002:a05:6000:40e1:b0:48e:932:aefa with SMTP id ffacd0b85a97d-48e3eb9263fmr1987532f8f.26.1792827174053;
        Sat, 24 Oct 2026 00:32:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecd35c2sm2752126f8f.39.2026.10.24.00.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:32:53 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:32:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Armin Wolf <W_Armin@gmx.de>, 
	David Lechner <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Bradley Morgan <brads@mainlining.org>, Aleksandr Nogikh <nogikh@google.com>, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Thierry Reding <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <atxdQ4vfh-b6GD0B@monoceros>
References: <20260914-bind_taint-v4-0-eadf8a090903@linuxfoundation.org>
 <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
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
	protocol="application/pgp-signature"; boundary="snd5d5o342ief275"
Content-Disposition: inline
In-Reply-To: <2026102437-vista-unsoiled-b089@gregkh>


--snd5d5o342ief275
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

Hello Greg,

On Sat, Oct 24, 2026 at 06:56:34AM +0200, Greg Kroah-Hartman wrote:
> We have real problems with random "bind/unbind" attempts that this taint
> is here to help resolve as it was creating hundreds of false-positive
> bug reports on developers all across the tree now that the fuzzers
> decided to think this was a valid action to take.  Without this taint,
> people were being forced to add hacks to all drivers for this which is
> not an acceptable solution.

Why is it false positive? IMHO unless it involves a driver_override it
is a bug to fix. So have you considered tainting on driver_override
instead of bind/unbind? You did, I'm sure because several peoplel voiced
that approach already, but unless I missed something, you didn't share
your thoughts about it yet.

https://lore.kernel.org/all/cover.1790612298.git.u.kleine-koenig@baylibre.com/
would be a suitable thread to share your opinion.

Best regards
Uwe

--snd5d5o342ief275
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrcXyAACgkQj4D7WH0S
/k6DIAf8DAU1k1OUjt0oOb7bxXYD1+h/zw0y3dtkGS8G+zRTS/qzzPPjfmqRP0h9
J5L7m6Y88ojmkEkaTuZykFHJjTD0oRB1HPOJTgCW6xGNMm2ZWeh0nTUKgD9H5GY7
w2HgqDafsFSbrwjrivGi8AGwp3WErwD0r+kOCr0MrPDA9d4RxztnKRXgDPP79VFz
52dVyEVot3hTvhqxMfO0yLVcwGhQaO5VnfAGO3zqb7oOJoL3MzMUVk3Qo8NuSz6R
zP04L1Pg9uTjUgCUKeKGGkzd/2+nMfGXjUGnId1rwsRI7WfBXP4t0r6JIOZsSNIY
RuU/lvGyyvYfTEwZjc1S5kWfcRrIdw==
=5xdK
-----END PGP SIGNATURE-----

--snd5d5o342ief275--
