Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4758036D9E0
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783979938; cv=pass; b=RlP0RvmL5tjMQHfCgtID91F1C5RftNMNeDv7PtpBb9OVxFuKbnOKzQt4aB2RZLdIdt84IhBXLr1SDUvoFvVX8u1OR2xRr06/EhpJUHgpAdLQcvuAl7CQdFFtprwPduEsEF66ifljaSV1frHow/1eBew/4E8+EcB6h+peR0v6Wb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783979938; c=relaxed/simple;
	bh=WIUbZYJ+309w5zla7jZY6g9HS7Pxv1dZoyASymn4cIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLmCEh+b3dujUJ240Tfbw3HlQg40MhxyLIdlyuoLk1CG3CkxeEpnqwzX4XvUWMDqAOqcHJkSJNzvzfZYDhGb/MG+TEUBTwkbUDnXEMHptX6og0PMZXTmdmwuPi+Ckzj5JJO+RdgZJ/2Jtn+0k1/t6iP2DbD3l88s3MRkE3qbzg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X94SgcbD; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X94SgcbD"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-caf45fc5202so1316405a12.1
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 14:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783979937; cv=none;
        d=google.com; s=arc-20260327;
        b=c+2LcD5+h+uVdej8DXKx8pjwqo+a8jklRqbg8pxu1SYHu/R09RHggQ/uEuDujiBwm6
         cWGg3Jpe7FzuQYnWcAPVkgJjSBk+xkRA1GObMagBAbldb9GG72+Qdk4h18oZDN9N5ZK8
         5smeN1tIusTVlg8U1hLDOQE6Zyijh4QniQuWNggfWaff6bnXHhBf6bI91kyeDUpZAfei
         syRzqlGt7aGGDMkZxFbB33rqwRP60tGy409J18Fq8XPlkRnhuI54woEnVVY1liUyHYUD
         1vjV8b5szxF3UqvG0TmhgUQ8Temw8Mk2ngx8VIxeMHyknsDxvjN2gJHQfXSUnBnaM5I1
         w5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BOi6bjVo+cOAeW/LV1mZ6Z4AcBCaZONBPZFEyu6/DJ0=;
        fh=qVQUWK2tjGQGbuOxxDXW8gII/GlTjajJ0h5ukWAJvbA=;
        b=KuRRK27/YZ72WTv/C9zhQq+laf+KitoKdr3JpKbF5m11FU26hjWA1nWK0hW81n51it
         PZMpbGEewXv8W70/xqWEnt3GWluLOhOHXNphgZOIbFx8OxF8V1t7GHY4rpXIOUGijjJ9
         yZ2KExaq3FbJ9Ur2TEZZgQMfEzgRSu0BEochgXDjX5pD+R1DHQgeirwi3sY2FU8ieO31
         tgOW4o37bWkc47kyC2uheYhbNQrJHq/uuirkmWDrchVBF7NG5PAxXjbCabiQHFjh3msu
         9I2TkPJsUQzfDaA2RvgfQcmGDkoLLrLqjoU2iOjfFQijQYXOsA5EehHYI9udIPqoo7kG
         ak3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783979937; x=1784584737; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOi6bjVo+cOAeW/LV1mZ6Z4AcBCaZONBPZFEyu6/DJ0=;
        b=X94SgcbDSpZZ8tFXsI71Z8dW1Kh/l9FkcEkZPSMDJfTvlCxblGKH6Nr+EVtMP4uaVu
         hwM3QQg+kMrTDrSHrpi6sMklcz9D0YeWPgY1h8wuCF9Wk7tGkWYS/kDS5xAGxFHZlv3+
         NHItl8H+id4HAcadA/qCbIWVLaTTl8iiSGp3jZdr/oh+Q5ISrh4RRwBdFv2R7Srf+uea
         4GtSjTveOjcz4/2qohC6QYnIVfUW6TIA4HGXOzskfLulHH/z1r4Bcc8IbUl7YfjPJHSM
         1Y7xM4eiX1is6CTqWW4YMyrYXnn0HO+Ri0pjKCDIZAGtxdUP650jJJSr7dsjrEtN38u/
         4ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783979937; x=1784584737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BOi6bjVo+cOAeW/LV1mZ6Z4AcBCaZONBPZFEyu6/DJ0=;
        b=iFTvjWK5legdumwmQ/ti3N7gDzfg9rYqFHZkzYjVVpt0FliRHk4Es5xgC2NpJ8/brG
         kXE7STxIchJrR0FpYzBPwelKqa8XaWUyTkEeRditdg5leY6S1NHSVMI5kqrzQtXiEYJM
         8o1/OurFXunpIBUvbdQf/YhtCyzf1gtqHvq+ksHkK4sfQCiipPfW1I2NCzMEqOVYy1cv
         P8CE4Qvk/uRp9HpjSLGgzotOPvupUacDrXAhGareMRtj43BIfo4+FMFi2dj1mLo1tEcp
         3xcvc4mAj+zV3AwTUaNMIj6LTWRMiK4m/6qjc/fPQjPi8cwdC/rlOrG5Bzkxlae6+ctA
         X9lA==
X-Forwarded-Encrypted: i=1; AHgh+RpgGwwy38dL5wp2oBA4XTtoXhIsMJ09nPFA5yY23Zw1Zokj7yrZqx1V5/WAZHQeqSSgWF/ZzD1yVPMKxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN+uFTi8sP8UJUJqsePLQiGN+qKU85YKX7qVRU/VXAwCJvEy2g
	C8DyliyNArS8cUgkNDarqK7IzUGlPBtJGQ4/rM/6zSR2NfbRzxCSUY9qd1pc5YX8uioXPkBGKbF
	8QfnFvCRzb8I3+Iaj/J1eYORLnnBx0WA=
X-Gm-Gg: AfdE7cmduy4yE2XPSFPFdnenTHoBEXxst/tSvAShgbVVTKG204z0Pe96D+cJB41yC+w
	H8JZFHmkvw4Zp7ujT5u1az0kJuARDkSZvPTIMTZwIlYR7RpgIyCUz5eO5fkC05nKhISlFxFgG0h
	FE4PAKpqPqQwsUmoe8rflYT4ZutzfcOgDxfe8roQx8r8znRBsl5ej8kj5xmQlbvy7ZL0mz5CDL/
	Bohw11H/37lmgIAq+7qD3bACTq0ADkCIhMTX78xtpdeq/DJujy/ahWDUibUut91W27fw13xS1Vy
	HUFl6ID5nnFU+z+xgEjX1kVNH1dGQSYyP1003q0cbpwK1+DnOL0xJno0wEx+cA==
X-Received: by 2002:a05:6a21:6112:b0:3bf:aa1a:d2ef with SMTP id
 adf61e73a8af0-3c110e43a53mr10691389637.56.1783979936619; Mon, 13 Jul 2026
 14:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713073059.47914-1-phucduc.bui@gmail.com> <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
 <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
 <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk> <CAABR9nHWV_qMWaYOeWroU6cPH3n3pDjbafHmXMeMVfiqC562Aw@mail.gmail.com>
 <41e52d6d-8f91-4685-b659-94d3844fa959@sirena.org.uk>
In-Reply-To: <41e52d6d-8f91-4685-b659-94d3844fa959@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 14 Jul 2026 04:58:45 +0700
X-Gm-Features: AVVi8Cff59Ge3ElQCY2MUosoZA3wVmmfW7BXxvdhKXRwHgJgsL8QQPHqIDCZRX4
Message-ID: <CAABR9nH8oMXpp-_RFxFWWOWenaZ8XoD8Yr3KDh82RmffKWZRPQ@mail.gmail.com>
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging registers
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the explanation.

>
> You might not bother setting cache only in the suspend/resume path if
> you know nothing else from the driver will touch the device until resume
> is completed, something else might block anything that would try to
> write.

Going back to the original motivation for this patch, I'm trying to better
understand the intended semantics of regcache_sync().

------------------
if (!map->cache_bypass && !map->defer_caching) {
    ret = regcache_write(map, reg, val);
    if(ret != 0)
           return ret;
    if (map->cache_only) {
           map->cache_dirty = true;
           return 0;
    }
}

ret = map->reg_write(context, reg, val);
----------------------


As described in the commit message, if regcache_sync() is called while
cache_only is still enabled, it can return success even though the cache
and the hardware are still out of sync, with cache_dirty remaining true.

From the caller's perspective, that seems like a successful synchronization
even though no synchronization actually occurred.

From your explanation, I understand that some drivers intentionally do
not use cache_only in their suspend/resume paths because another
mechanism guarantees that no register accesses can occur while the
device is suspended.

If that's the case, then it seems that neither of these approaches would
be appropriate:
1. Automatically clearing cache_only before writing the selector register.
2. Making regcache_sync() reject calls when cache_only is still enabled.

Would it then be correct to understand that calling regcache_sync() while
cache_only is still enabled is simply considered incorrect API usage,
and that in such a case the responsibility lies with the caller, rather than
regcache_sync() itself ?
If so, would it make sense to document this requirement explicitly,
or perhaps emit a warning when regcache_sync() is called while
cache_only is still enabled?

Best regards,
Phuc
