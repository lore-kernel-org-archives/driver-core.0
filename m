Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14883244667
	for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784070190; cv=pass; b=mXT+D2nFjbsdlF/f5LGaqJjTRBOM8rnQIf0EIL3c/i54HlSvpFmVfZthBRkERu0bvRyPY+g8Sjvtl56+XzugCaMaUS9wrQWkGgPBfC12yFmPCYh2T27mCuT39lcdrIqFfd+Ham3MOKOSYdfBmfdp0jsgAoX/+APKERf60Sv0nwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784070190; c=relaxed/simple;
	bh=4U9u1s950xa83+e2hk81EMzWdX3cicQZQV59W7tT9NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUw6ticQYhIs0TOJI6PoUDs3RAmyp4xgHMTNl64812yN/IRQoL1LI1U0femuCc6DwcoZ6cD7RH8zPVmqnl/ClaSzIVWXQUKOMSWqoAp0l6dD9aCrmrKlJLS7GTOMObOHqTr++jsi2Se08mAPl4EeC/B7rNaAjSGEjlpCWm9SRN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv1/Ubod; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv1/Ubod"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so14801825ad.3
        for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 16:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784070184; cv=none;
        d=google.com; s=arc-20260327;
        b=TGaXTgMrTgSf+PHUXwJfAf2huUhqkYLS7N4YaiD2Wbzkj4xYIVf4CLisN3uQSvxEjx
         hDTpPNswUNssnoh4MEJm+T0WqamkAhU4EHROvIkHCg4vc4LJhk7bsFzCD7viXm+wRHgf
         SwcqUNVZ8gEjGps6efQkaASt7Ly07drhnjM3AXjH/lhctkm/4m/SM3Ad2weucxed484f
         ui2ty21KAyh229xBPSpQmdYs+mBakQkqU6TLCfTX49opcYy0Dnoi7BdFY0kgiaV+ktF6
         bgorsLmJ8Giv4Lbt1bfBj2LdMA57muZ+4kygzivZ4YgW0A3VmHpSsyO+ud7qPiDWgVmf
         wS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q08tpM3TqmOJonZebvKxkgcouEEPJ+0O06hWAQuuSsI=;
        fh=VcHIeUgoYtQn87OzYMMUAzh+pxoaThj61kG7l+A72ZQ=;
        b=l+9u1AryYWgQPkcMqByPRti8VsjxvAs9ZztXNJHocfD5mjEk0gdjQq1ZgYq9IDeEVc
         oa/MKaT1OMPaFQZBV2Z+2B3Ct8lZmQf0qFv3+HGODIqfJ/0QH7gxJ5Sp+SltohAPV72K
         8RnWYGud1LN89+ymEIuN4lvUmr6hngcUcRreMGXOyPnnbI8nzwq4tFz8BZt8emhfCAqL
         Bk6Ydv0+lonE9ur8paJgUv0u8vtYYk47XTlvryCOzqqB76I+bMkcgclPiQmMvBvkIa8O
         kWwfbA8djGtaLtB/7+9GHUG3UKnF8eGTzy+TSkDa581zsbMyCQ6vXBf+LeC1cG4/l9/W
         NT+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784070184; x=1784674984; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q08tpM3TqmOJonZebvKxkgcouEEPJ+0O06hWAQuuSsI=;
        b=Dv1/Ubodon1mUodgUymhJKVCAyPhjknxrZ35lpJh5x9q5QG5Q23FTjVoND5pKIt+vQ
         d49KFYujpRtWjm2bo+gk7j7b7bx/QHDZ/4IrGlQxwqqtiIKONxDEMD+SxeL+V06TxVlN
         hn86Z0CK266wLirSh0SzRKmod8I9FRNUxPv3pKefHd4Vj43W0rVGlmU7bYJ+d3w1fKOL
         2EgUTUZXQXyL4UoNRM9wr4LqSgcvnFoDutMuuk/liQfG2dAZmkHUyCyvTU6lUO91KKYN
         uTfaad+XBS16y36l6RYaMraXVOg+40kYNF2mLwNzHBnodjYXmtA9Jrok+bvK+WAL8/jo
         CqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784070184; x=1784674984;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q08tpM3TqmOJonZebvKxkgcouEEPJ+0O06hWAQuuSsI=;
        b=FsPUNEHsCJVaYp0VzeDHAjg+92DkUGFRoerxW2tAHw7tgd+viVDxywnkS+06fK1ypT
         PmMHgaTIbuJLzHOYBAPKSqoeYRWv5tvqx7BMiwthaWFYg46C8QmWU3mvV0eRXEh+7qLG
         Vm2ZquKqErtTcuRPi2zSbcHosH6//qClzHS8NoTFi/jvr8NJXyjokY7P/AmLDhOSMTPR
         oBqGLEq4k7zAwhakQO1c6Yh8cifXlekl6LuafsixSAWJx4JBoVYW8BPMrMnbW5Xxhp6h
         uE98fVg+4009ktToby0baaHX+qiPBsSiOaqNW3QzF99q+IX5TU2H3TYOAax4l7QEs632
         W4Rw==
X-Forwarded-Encrypted: i=1; AHgh+RrfZ7nnU61nnmm/hf+4hz+dLpGHwkemcha3nz/J1Z1bd7eX6JzKoapkkeUU+UzyQRzAJEFdk6iIDZKfrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnE8GbrPg0rP6HqLZa/s1Jc51I3MLk4XmvolXEvPzKB+iA3d2m
	CaiNMrjfA7lhyqNc0dsZ1oxq3KjSvJyAEgFnbGkXI8J73NxlIAXlHP/6BMV4sJyZyW3mNSgtmIw
	ODHaOZvsgwhfZm/MlWRzDC3Sp+zXO+9o=
X-Gm-Gg: AfdE7ck9GlZtjwU24QP2U8/1gtrLctY1+2tDyE17yptqRbBVDLsfQ/dafrJFiYgMCTp
	uoCYMJhrJIc7eKx5gEw0DTTTbvJPspZpJmZ6MJc1gjYc6Er9XU+wEvRwOdqwwknKE3A3iyT3qDk
	naR5J1Y/mX5dLs7Aga0zy13qbncDQWnU7Xr+kNQiEDBFUtEFYKPfEEc9+4i8l+bOi7nWC1R9YOK
	o1SJ0U6lo/Aybye0yzK/4xtEQndy6J0u5ZIIgXq2K4HhjysmPEOEdx/Ktbry0TGetLLu++tCroZ
	syfwOFnRczMmFQ+Y3Hqqy8ci6zcejtaGQXlOBLg5eDPrwpPIhlOQRozMSAKsfQ==
X-Received: by 2002:a05:6a21:3116:b0:3bf:ab4b:2d34 with SMTP id
 adf61e73a8af0-3c110ad50a7mr15927611637.53.1784070184288; Tue, 14 Jul 2026
 16:03:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713073059.47914-1-phucduc.bui@gmail.com> <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
 <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
 <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk> <CAABR9nHWV_qMWaYOeWroU6cPH3n3pDjbafHmXMeMVfiqC562Aw@mail.gmail.com>
 <41e52d6d-8f91-4685-b659-94d3844fa959@sirena.org.uk> <CAABR9nH8oMXpp-_RFxFWWOWenaZ8XoD8Yr3KDh82RmffKWZRPQ@mail.gmail.com>
 <6bf54da6-10ce-46dd-aea0-9e7fc64e7006@sirena.org.uk>
In-Reply-To: <6bf54da6-10ce-46dd-aea0-9e7fc64e7006@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Jul 2026 06:02:53 +0700
X-Gm-Features: AUfX_mwt6Y_KiHdFe33o_LPTGbTh0n7X2SpehWIKG9NQR88h7RC9rdO76prro_Q
Message-ID: <CAABR9nEYXpoj+7kr1JY-OMjpoiJs_M8bbLNCW7oKHn-BEVgoBw@mail.gmail.com>
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging registers
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for confirming.

>
> > As described in the commit message, if regcache_sync() is called while
> > cache_only is still enabled, it can return success even though the cache
> > and the hardware are still out of sync, with cache_dirty remaining true.
>
> > From the caller's perspective, that seems like a successful synchronization
> > even though no synchronization actually occurred.
>
> Right, we didn't explicitly add a check for that - I guess it never
> occurred to anyone to do so since it's such a nonsensical thing to do.
>

Just to note, the function already warns/blocks against a similarly unlikely
case right above:
if (WARN_ON(map->cache_type == REGCACHE_NONE))
return -EINVAL;
Calling sync with no cache type set seems just as unlikely in practice,
yet it's still guarded here.


> > If that's the case, then it seems that neither of these approaches would
> > be appropriate:
> > 1. Automatically clearing cache_only before writing the selector register.
> > 2. Making regcache_sync() reject calls when cache_only is still enabled.
>
> Probably 2 is better.
>
> > Would it then be correct to understand that calling regcache_sync() while
> > cache_only is still enabled is simply considered incorrect API usage,
> > and that in such a case the responsibility lies with the caller, rather than
> > regcache_sync() itself ?
>
> > If so, would it make sense to document this requirement explicitly,
> > or perhaps emit a warning when regcache_sync() is called while
> > cache_only is still enabled?
>
> Yes.

I will prepare a patch soon that implements both:

1. Returning -EINVAL with a WARN_ON(map->cache_only) check at the
   beginning of regcache_sync():

 + if (WARN_ON(map->cache_only))
 +       return -EINVAL;

2. Documenting this requirement in the function's comment block:

* This pushes cached changes made while cache_only (e.g. suspend) down
 * to hardware. The caller must clear cache_only first, or writes will
 * only update the cache.
 */

I will send the patch over once it's ready.

Best regards,
Phuc
