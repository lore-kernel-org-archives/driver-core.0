Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5379E35A39F
	for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789829085; cv=pass; b=WJFOPvSb0usSRuaCt4q6Gq6NQoPC+A2IPYA6FN1Alt/jRWtbqEX5ZlWhlbivNnDdnJs1mpVw5M5oEYhI1gb7NLafqkf2lACtvTJuSMq0p+TnRODTanRtmgPK3adF7AiFvpdV+05xifpwkYI3gq33sE/Fp93BcnwFI009XLLX/z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789829085; c=relaxed/simple;
	bh=SEEDrnoYh0mOnGCpCP8AW5s7jRnMWmh4+4NV544y7SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+mMLz0HJZh4UfKka/w1M8vd9RF3REkqXTt2LicOzM86MSauh7QiP3jggE2vlhsPDHXWowXUTi9zFHDzypmdMFD3Hqlskl+KMIHK/L/hUDuVUbrOkFiU7o57i23ShfZ9MbPRWeEGz9AxFbiq/JfNPFIjq3Xf0xMNwalNbv//qcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=UV4CTKdC; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="UV4CTKdC"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-85e68bdbcc1so11522327b3.2
        for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 07:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789829083; cv=none;
        d=google.com; s=arc-20260327;
        b=iZcDsbEcybVENvU3iv+Yi1xmX+RhM2SbG4hsmGKBZJ1VEkCHlqk3rIBE3SWzGDtPtj
         w27bEeLyi2FUGdcI1794wWSdUQdHCHauGVuDjj27LgZsndCt2WD/FUnUCQVEu1CqK3ur
         tns1mPlBtoAGRBUeubgREzoS/o9P08EHhqBEMGvGMm1/OCMQfQduO33MEaWGxHxomOvZ
         zhPYKNXJMUG+q98E1nGTzhb2NI7M3xUCQ1cozahWfK/YMl4oJS69XVRt4ES4fVjFqJEE
         XODBkCxGhOJQiqX0VhfbWCnoxLZf5+N/g4QOSuzXstZE57uuA27uGIYOeYDMksVed1Aw
         Q2aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        fh=VuqEhOLbXpUIsugseQ+Ir06daoFTtkQARDl3VMx5uL0=;
        b=OnHYym+URYprmYTaagzQk2OzBWd4ODGwkzql6vChRu/cO+DQ1cueAt4dP/nnUCESHU
         5d0+wEr1FR6DHn7MfzjYAEH+Mw+RnxX2xPI4ULCs5YzNB61JogKpq6XRSplZxHtNWmUr
         mqBjG26U3h6bDwerHnjG8JY1dsiPL2ZsG3hTO0TihckQARSRy866xuyYfeDODsTLrCxZ
         shrAro/iLUPNS7y5UsSHFfwGn3pfsEOiK+Unak17+ULMCOvquRewiuQwwyDNIxXGgbdC
         VXhoCvCX7eQKsb3XkGgHJWi6EcoF2JlaQ/+JHs3gXQgRnolyxjUkKzT/dn1kMvkqBPek
         DUvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789829083; x=1790433883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        b=UV4CTKdC+qkcrxhYrGkwwIFyGUe76JBV+Vz1AKCIbdvCOOlqKDTKJZlHt1LWtOr0+Y
         5/AAn2M9gZoMALqc0D2yQhuL3ovTsF3+Yosm9L+ooUzycB8O7GvFJB9k0I4GscyIHiAl
         knedbI+yHvE2jJ5CUXHdQMMsxIkYE+Ml1TDRziwxAOLrQVn0k1k/MwvJabqnf+jUyqiB
         dxLEJV4bzts1KJ923Qpvsu1Bf1q2z9GRBtayaTiJDZf8ZD2Mu2NHihitevW5uTPXml8I
         40gj9//mc0Z3e0zkhU0NHB9ogHbtFUmdeandYldBEG5HZvDxrdu2a4UyGtx3/Vr3ZLAk
         PdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789829083; x=1790433883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        b=z2kWOXpoFpUF7VqA3h21rqiPDmCx03puJGIpRzFOMz6oOvA5Nm16SdtnpNk6uzW7+1
         PCHz8X06P16rYxvVS6Lyerg5VOd+gZP8r7Nu5SHexY5zHIbOIboGHvJEoVcucweYJVht
         lYD1G5o13DUlydQ8qtHET8lNovOmTUxdFx5V6q6RV5AvFJeDosTCLYmzuGT7j+gbg0aN
         Gpg2cYr0fmMg40qYRu3e+xEiUHf97Y+jxFSsY/Tu82KqpFEV0wNunaLq0CFhzisiec0R
         Q4zEZTfpUdaZIY2X89oI7DHZdwCIGoP3rAQNi1ngy9LHfOlGVVFhpdj7yOwp1HLVSoz3
         01eg==
X-Forwarded-Encrypted: i=1; AKwUvBxWnNrLNzZ/jEBs0SIiT7g4x1D28PoYjjjlJ5TLyG3NFeo0f70vkCKn0bx7CqacMVsnMAJO8K9jtAqhEQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kIfARfQL/InrHlSCszXeLsQcArOq8Mrkams00jnCBq8ZmgkrS3
	WrWRxTmcC6UWOuVkQ3e6ny34abQ9MrHkq9uOyfNtBCu4h6OIMa0G7jDNoQck9lUNeSQHV00T/m7
	3M8TuvEYP7czNS69bveiymxLmXqJgfFoAhVQZeAlQRiM=
X-Gm-Gg: AYBFou0LSqEMzPr/OFfgzuCAMD+/1P2w6a/Yx8tZ+C31mp+uXZoRas+LBBPSx/ZOEsM
	DPQ0zdmGdQ1l9zmX0pfNmu2MILtLIZyRBkAnE5HfL4GAolJzlOcY54meL4+gTY3j8ahj245PfXr
	/zNNtQx7P5eaoX4Oj7vhfAdM6Bo4Sd4U1J0TJrE2ehoPxO6btVs/yH4p/FZ8D3EK95wHit+glKi
	z9jXHtKb7Hrg2n/6XssgtWzaXTTjQr8oTEo444B0y5pmh4tv1tZL0L8AhrXi8XiwfOhi2z7qx8+
	UV24sLNNqliXEPswPwdkz6Fe3hR1aROcZEKzCV4eT8QmPWzUV5tUuVrWs9TzJ+yWBl0dLktnKsC
	c/wpUC8QQ8OJrZ3JQ/vHGQY9CCBenGeAHB9rFLDZKMqdAytJGR9q8gGZWYJWv0VlOIjiCmxulWA
	0n8R7fpOKm1Hzo5kU=
X-Received: by 2002:a05:690c:e685:b0:89a:63da:cbe5 with SMTP id
 00721157ae682-89a63dacd4cmr7313797b3.43.1789829083163; Sat, 19 Sep 2026
 07:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org> <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
In-Reply-To: <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 20:14:31 +0530
X-Gm-Features: AcwNN1VVdZq_i5--e-uskgSmXVQpAASq_eAqaNA9x5LP_XOGGCjlgNcTays_lsQ
Message-ID: <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026, Richard Weinberger wrote:
> While we're here, maybe it's time to add a decent configfs interface to
> this driver instead of configuring through module parameters.
> That way also multiple instances are possible.
>
> IMHO testing is the only use case. I use it regularly.

I would love to look at this if you think it's worth the added
complexity. A couple of design questions before I start
on anything:

- Does configfs coexist with the existing block2mtd=3D module param
  (for early-boot/cmdline compatibility), or replace it outright?

- For multiple instances, would a configfs group per device (backing
  path, erase size, label) match what you had in mind?

Can sketch an RFC-style doc once I have a sense of the above.

Regards,
Chris

On Sat, 19 Sept 2026 at 19:58, Richard Weinberger <richard@nod.at> wrote:
>
> Am Sat, Sep 19, 2026, 16:22 schrieb J=C3=B6rn Engel <joern@barelysecure.o=
rg>:
> > I added Adarsh Das, who also attempted to fix this bug.
> >
> > On Sat, Sep 19, 2026 at 07:42:25AM +0000, Richard Weinberger wrote:
> > >
> > > While we're here, maybe it's time to add a decent configfs interface =
to
> > > this driver instead of configuring through module parameters.
> > > That way also multiple instances are possible.
> >
> > I honestly wonder whether this driver has any production users.  It is
> > somewhat useful for developers that want to simulate hardware they don'=
t
> > have.  But beyond that?
>
> IMHO testing is the only use case. I use it regularly.
>
> Thanks,
> //richard
