Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925037DADE
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518526; cv=none; b=WdKuRjSzcCtem6tIMRzbmUT2JZN7Qy3gdF7FZi4vNp5QN7rTvz6Y1LX2KyIJ1pKKwLSq93SH7HHWVyb8GyAPkoOEtzA2hJQbmMYlpMT0JpcfqxxpmhYz4tdImrhG+0opzrwqHfu3DJpVnOu3oAhuzsz1jzMgGO0f+rZxtjhLgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518526; c=relaxed/simple;
	bh=HRpbfYi94SgnlAPxJxXtY8AqbVnyCTReGeanHcSFrmI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=p6R258jC2lW6bSyRcgEPNEw2ZSx4rJq543yJCCrh5RTTtdF6/I8QzlZsW5CRTT6ieUoIqcSqsXzz9j+ii/WCMPk9gofrjO2wm5YjcaXe2lz241p8nSd6hJer2/jc3TnRJW1VOnU55PGwsJs1WO455IGGJjcqHqWPdywvJ25mI1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMHS6PSF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMHS6PSF"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so312213e87.0
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518523; x=1784123323; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J+0mdBAgPT5Lu8N0Tz9pyH/A6lc2i4NyL8yHI0E97ZM=;
        b=dMHS6PSFSz6uDyPRi1Rp2OVBGZlFaHs+ZAHPGnQy7sZIFshxO38MvpsqJnjJaxpHBf
         oOlBhW0L2IxcJoPWvdpY896bBc7RkX7SCQb36/h43QV4dmOV8BHbh0PuKdtteDtNWiQ7
         iODiKvjt130LuoIptW4XlDGcRqFWXTAN27QLcY5W0/wNDK4s8R5vkE46rfJc8X/6ct5v
         KrCeAzrF5MGI5d9clTlnlH2WBnV4jA2GC+FpthOmXF5I7dVn89BP0b97/ZemVSRP0kSn
         VoAfiD7zMfOKg/e5uVOGfc1BaRuE2RNeKHrkxu1X2ZU5JaK0eHs1OmyKszAi67n5gQsT
         EdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518523; x=1784123323;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J+0mdBAgPT5Lu8N0Tz9pyH/A6lc2i4NyL8yHI0E97ZM=;
        b=g+H1ONI63Shr0iWt8UjroWSFNAzeHXZA9jGgE9Mpb3QZpvK+x3T7SXcWYX1TsRdTWQ
         njiyBfcuvlJKoQNaC3DdOqoF2kV++Vmjz8VJKtJwh57E/rE1nzyeUjfX/ZZ+Uhfo3L/v
         9k0lORmAgOWB9iwViBRO2O067Os1uKC7w6FI/vqmWQEKpNox6eIYhyKPsA8eqN0Rh93c
         FKMFFG8rjXFI4rNy4e8pEom/lUk4DiCtdqinCynHT3ETES45U+xzLiVgACTmuyKfegeF
         6/+y5JpTMt/5e6cGWp4jGEScOMUKnPYa1emwr4MGesIeHrbb6TGJKbZow+l+Nw1JWlNP
         cNvA==
X-Forwarded-Encrypted: i=1; AHgh+RoOCAenOjmOuZSshUQS+8AlpsemQLPJ7guuECh6GMkQqpUoJiEd84EZAuoBCAvJ56DF84W4UXQBMsyskg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq06PJVc9UQSALE4IvoVdeULTlyftHRQGKJOB3hTpJEluqjYf8
	Q0EDWzHwG+2nDi7dy2bLfNnb10waiZoK0tXRJdUP8IOL9Mkw0mCi1aRA
X-Gm-Gg: AfdE7clp7l9mKip6HJXBol3+jOYyEfBLwMCJXpaj+1IrlRrN78BiaG4aI+LdG6dcIVH
	5MGKLvV1S20J7GVBN2wmwdgblwktO3wSkOnwpafMRtE899oeKkK9dF3frgXOqzkKreonUtKCrc3
	CX4xJfXI5VZ+JQBIKSX03YGWLEe++xEMlECoQs9yEkFl0hi+kD8ndHSubUxL2ruBKSpgt++t0ml
	SleIgoLaLj4XXxojbi/Y1OFcZfBajpkVI1Hfb5mTgkvum63XEfejXQSW7UPBGDrjNaGZPlsSmB/
	dbhSmNvxCLjD8mDEPFBl7X2YxqNaEYeSjfDX3t+HrRayaEz3888P9qfN0TjceGNgxZ2OD8Ji4TN
	kIHshB/xpxEc6cFDceGAAZGv18xgcsI3rzuTrNPqUktN6jcqqQUkBASLb0Gbj9t9FvMJibetHAq
	LL/lWxqUzZLK9TSpUoet3vdUyQ3I5gfA==
X-Received: by 2002:a05:6512:1417:b0:5ae:b4bc:9109 with SMTP id 2adb3069b0e04-5b011492e79mr609428e87.10.1783518522775;
        Wed, 08 Jul 2026 06:48:42 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:eccc:7ea2:9458:892d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm4522878e87.4.2026.07.08.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:48:42 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev,  linux-pci@vger.kernel.org,
  driver-core@lists.linux.dev,  ankita@nvidia.com,  Alistair Francis
 <alistair.francis@wdc.com>,  Lukas Wunner <lukas@wunner.de>,  Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 01/15] netlink: specs: Introduce multi-message blobs for
 SPDM
In-Reply-To: <20260705220819.2472765-2-djbw@kernel.org>
Date: Wed, 08 Jul 2026 14:23:42 +0100
Message-ID: <m2pl0xboo1.fsf@gmail.com>
References: <20260705220819.2472765-1-djbw@kernel.org>
	<20260705220819.2472765-2-djbw@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Williams <djbw@kernel.org> writes:

> diff --git a/Documentation/netlink/genetlink.yaml b/Documentation/netlink/genetlink.yaml
> index d3f3f3399ddf..4caee7d55303 100644
> --- a/Documentation/netlink/genetlink.yaml
> +++ b/Documentation/netlink/genetlink.yaml
> @@ -153,6 +153,13 @@ properties:
>                  enum: [ little-endian, big-endian ]
>                multi-attr:
>                  type: boolean
> +              bloblen:
> +                description: |
> +                  Marks this attribute as a variable-length blob that may be split across
> +                  multiple messages. The value names a separate scalar attribute that carries
> +                  the total blob length, and which is sent ahead of the blob data so a consumer
> +                  can preallocate the full payload.
> +                type: string
>                nested-attributes:
>                  description: Name of the space (sub-space) used inside the attribute.
>                  type: string

Can you add a schema constraint so that bloblen allowed only when
multi-attr == true and type == binary
