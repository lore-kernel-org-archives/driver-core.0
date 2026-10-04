Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D945419FCC
	for <driver-core@lists.linux.dev>; Sun,  4 Oct 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115434; cv=pass; b=cpR6+w5QrA3DF7tMa9I9EacFNg261NK/Gx196LbU++MT43h07TNo5e6ZtE+Kae0qsLrZHY7t9VexF5SESMos3g+C6Xes7MAoXwX/JxjO3fTNK07cW4qJS1tM+iYfXueqNU3QMEzMqcPbsk+ntrGo15XvzKGxebt5BsHe/ZfpT0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115434; c=relaxed/simple;
	bh=xclsxU/OKlyZxe04QWb2jLBYOc4h57dKWedu3IwQS38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gM8oO45YLDbNJD78PLECnaDssCFXkqiQBxoJZ+fb1O+BDAzNDt/c/V09TR67gRndrR1cRhkEqAVW8d+PHL47g2qGU6WkUke3Sfh0PxV2XlzlIuC36a5vyu33zNBf4CyImoYttnaAx2rtfTks+ZThS6VSsGHkNDNRF2+wHjz/u24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BThR/Lid; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BThR/Lid"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so588569d50.1
        for <driver-core@lists.linux.dev>; Sun, 04 Oct 2026 05:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791115432; cv=none;
        d=google.com; s=arc-20260327;
        b=ceMzp2I0rHe6ERACCql8xMuLW0bakFYIWxud0UYAhdkkDgSoXMJxJU90QB+jlN8wfx
         HgdJNex5Ns4UMEWO6LHSqpSTo5dO18MYArtVVwMlpsWCobhT3GnCZ1xs12ucENCPzNfT
         QcfLw6R0Xlf9bFoFO5e/gVC0QkB3JMlaaN7tiM1wbc3s8ISjEcV2vPkOC3Pm6pFPxLZ6
         lTImPUkzJRt60EgDMDeBpHrf/ZXmT6OhdqxnUWiI7fA2bS2i7aZ2HAtkoHyI2cNjIq0m
         rN4cDDq8f7DYtsjYPqIZxXR6TcNNP9fd4kzZYaUw1H+CiGwuSVFVZH2gzTJ2rr3bLVAt
         x7Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        fh=+eljVjxtGpXWlPlezQTkWkt/zY+GytQ0l8MLyYFg5/Y=;
        b=e09rm1t7aO+h6pf1gJZNF9LGYV5AmGPD57CpvqGn6oZaHMhyfCtRUPGfhfkkEvj69F
         +CNQKd8wmZVNnH4ZgS2TXmDyXKjy989VSiHRDINHDd3gaB5dtWSx04CBwVaZU/AYh6Tj
         e1Zhhi8IBVvpcXCNlGe2cBOTpWhJ+v79i+FVFjmdxwprB5jl2uhGF2P6tRKNq0qdPJnu
         dyh92cVWys1Iz2qgEgejd4Pyz22UZfnzTwFap9xxrJfbhzj8HI3QEsPnvM0/sRvUslrr
         S14m5R4XmM/z6Gxuoc+P1MXY0yBRoD1IZOjrNyOAKHbPuwF4XGYCaZh0Ab/CmcdL5FCy
         WOQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791115432; x=1791720232; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        b=BThR/LidShSkTaIygLYsR+8Ro5M9RvCCKCeafHheeGsCPpgFwMVi80YkpW3FazX6Tw
         Mfs1+kQTB9Oq0FAMh0jN7hHhw0E7GhCietHuMBQyFKdRKJHMwcr3yMENcGreolJDsxk4
         HVi1deiYRbLDN5ZFawv7Op2v5+zAGsDuvzljW9NsQILfaiFt6VEKM/LnzkL4fMFkHKJv
         o086pjO5KHrSKXG8HdtvZsaD+hugCG9AnsxU14X3daLh36vACgMef5zMt4kWrGqxKEZL
         MLW1XuUICypt9viZ8FT9gD52dnJPqSwykVzbOSCPyxw+2hggyAlNTPcVUiWRiHMiKFZp
         8fwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791115432; x=1791720232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyfE5Ooll4Dv6ZWZjjpSfjmGucLTfXxPbcQsu3baUfU=;
        b=TluSGUZOJFJpke1CHzK0lCGBeXWQqUAjX5ZLCjyhSjiZH+GcJD+2SVTwvsWkr6OgAr
         Nm4IXb+SR94olXruj51ycy0AEVTa7n8xreRZizgJhkSANGXalaDurgG2wD/wPfWK/Dkm
         DDgl9i5b2Alz7O1VINtVeS/BZSbeVajlSoLgLraXP1bEqduubyzUUNrAUNFDldA6Atji
         B+1yDUwya1ZoMLOL3w8rC55YqposVH8sE9o/CuT97IQzK451kpgBQozQjOkppoFMHccw
         rGQjuP51/x0efdiqsEnF5rW+kDVIIF9cT1CMVWkeXLV2O2xsUoQbB/4MjWTX9Kna+kX3
         LdNw==
X-Forwarded-Encrypted: i=1; AKwUvBz10LJvLl59VXgByfyg2Iz2f+JDXCdN71RVoL8gRSRggpbm4XihvqcQCCe3aOwRQlOeI0pDMsSzyZg/ug==@lists.linux.dev
X-Gm-Message-State: AFq9FYKbQpzbLCGQkTC4mninIgneK03X58ShhFmYHmpKhNQtqXc/DaPz
	7xd2No1Lnk7WfSUAxGkUez7T/uicsBHkm8HClpA08XfL+wgAAqVP0/k3EF01bMUGK/RfuS6RD5q
	G3s6wcmEZAh+SNvjMlLMJV1CEPPZIzkU=
X-Gm-Gg: AYBFou3WCFPyS6XilsGCRxPfaF9ZIlG1SYM5I0/FjDiIZRqnRtPojhKuNfIHWyv+AGz
	aRn1XUgbtqRQby1E1NVAZbGPlw9b1M37x9CmU6Rfo6DApIFOMRb1CJP3S9kUe3Kb4O56Zu9ql4I
	9yUesgzFyD0gZ4GrNxLT8ku8efM26sWKA0BwtCxINWqp4pYknqjsWjwVZfsyHZCDj+ICdfy2/Ur
	qZpUyYbry0D5OnI4fvULEzR1jTcR8OFkPWzK4Rpwglq6zthxx7MmPuo8jPPoSWJ8N1qrTH/NwPM
	Ew1P+tK0aU6dSK5SJ+NaAO7mkRlZIm/KfFaBpZG3z8C/015o8vt7vNjZP5hxnMEu/l317T+Dkxl
	DKb6qxBl3pxQwp4b0Un76ej/XCSAZ35Tcg36iefRYBrX4
X-Received: by 2002:a05:690c:c50f:b0:8a8:31ad:3eb5 with SMTP id
 00721157ae682-8ae398af9c7mr32497627b3.28.1791115432330; Sun, 04 Oct 2026
 05:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com> <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
In-Reply-To: <60c791d7-10fd-4019-81c2-69057002ac83@sirena.org.uk>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 4 Oct 2026 23:03:41 +1100
X-Gm-Features: AclHuK_AzNA1kHsdQJK4JzjMKX_G4POoldRIESfIqws1tUYpdz6muZxIlnl4ufw
Message-ID: <CANpmGNuD9mvO7J3g9gG9_cA6ZDKRweGubBb=yQ_51Ojtx1Owag@mail.gmail.com>
Subject: Re: [PATCH] regmap: Drop map lock during cache init and exit
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 10:22=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Fri, Sep 25, 2026 at 08:43:22PM +1000, Michael Reeves via B4 Relay wro=
te:
>
> > Commit fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and
> > freeing the cache") added the lock for Maple tree lockdep validation.
> > The current Maple tree backend uses internal locking, and cache
> > population is now separate from cache allocation.
>
> Do you have a reference for what you're referencing here?  The issue is
> precisely that the maple tree does it's own locking with a spinlock, if
> we ever use the maple tree from a hardirq context the use of the
> spinlock in hardirq context will be tracked and then on removal we'll
> get a locking inversion warning when we try to free it.  The maple tree
> locking is entirely unneeded and forces us to jump through these hoops
> but there's no way to turn it off.
I was looking at 94a3a95f0315 ("regcache: Add ->populate() callback to
separate from ->init()") and ed5d499b5c9c ("regcache: maple: Split ->popula=
te()
from ->init()").

I thought separating cache allocation from population meant the map lock
was no longer needed for cache initialization and destruction. But your
explanation makes sense, thank you for pointing it out.

I think I found a cleaner way that avoids that issue, I'm testing it now an=
d
will send v2 shortly if it works.

Thanks,
Michael
