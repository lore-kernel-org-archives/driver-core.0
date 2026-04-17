Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226533988E2
	for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776425422; cv=pass; b=ad9V9sXcikTMsOqIUdflmJcTLLvp1T9hnpzxCLI3bCJqG3pKs9ekq2sO5PGbnArwCrKXXC4gBicFUcrdTUu31F1zjmTqyOMaj3b/v/2tjptNw/jF5Erxv2i8eFo5nIreXyV1RvQLVa/NBKP6AZAc80YCvhgga3m7wEOvqyHEcuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776425422; c=relaxed/simple;
	bh=+w4/KXt+hm0Vj0pgDAsGThhssV/L9T7ThHr4lXgEK9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3L2S2/vIq5Al/3JTTkDKhpcA4x1s2P2/+htkcr8hcapTE05gLYfPQn1ivpNNGBulbcsgxCxUEw37Tz5iHGDxL2JOwFlKQvJF5BUfVf2vyGtxV3pCiZtwLiFo/eADcfk7KTce26aP8Uy7wnlLpNomO1CH3E0Y+VWDj/hZxuTTdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bShPcvqq; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bShPcvqq"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-651c3212b0bso386803d50.1
        for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 04:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776425420; cv=none;
        d=google.com; s=arc-20240605;
        b=ji31UkDbS2ve/MN2lKhw6ZdvLFr5SdSD7zzc2EBWoDiZh71V5wbOnNRjg/w/jW3PEQ
         mrrLv5x/nzpQgKkd1fS1jllEEYTN1lYwLSUsm/tYcCvlp4dl0yrXyYrS9mftZVMWziau
         LisY4tz/9D5hoWwT3PW8s6R4GbUChFKXxsZUQUWPJO+f5Ey/pIODlCenq722H1xhGQtb
         +IpPRYuoLnp3aBAO4QAQB81A9+oTL8Ezu01TaRkLVe8IBg+N7Agekzslfpiw7gxqSCaQ
         mCUG3/BZzxxDHWMY+OiKXxLOf1VLXY44V8hzH60yBykl8Cl6fZ71DChgurcCnLtg7L/4
         NuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UrUlnaPeUu3AWGIaZ2F//u+OA7Kh2XfeqIUAuZofzZI=;
        fh=MMnzBVsz7M7gYKn2EqRRmOkSsat8MxU1ge9tEHVWEDQ=;
        b=Ee/ZUgTzImwI4hoLGWFvj9LkBlAlvJtKH1aIIAQysY+n+eAKwbjHvY/7XxgThl+4yZ
         uK4QBEnnq3CbtWFguQu1UPLg4vGvq+lKl0OKN5iej77lW7APqXLwxWLvg2FR5w6e2ttK
         UXYxkwRlNDJCcjzltvgMjFgL2NrSfi0FexW7QOhrmV4q7AoorL4wwHf+h7gT4RFHL5j7
         zu19SLCzMhk68EqgqYS3Mhs4A2YdIIUH47/omohOFzNHhCGe6lwAifksX5VKv1gL1Kim
         hFqz7pAAls+Qp8VpSPFSKNrrQOi3exbqnqBA7b6HBg+MpctIPJblcTfHRAqyLua9mpzM
         oR4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776425420; x=1777030220; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UrUlnaPeUu3AWGIaZ2F//u+OA7Kh2XfeqIUAuZofzZI=;
        b=bShPcvqqjoLxcREEMjbjJN/F/mzGKZ4A/verGYqmvbNRReFMYrqnBvrTAZd2X5rC+H
         u8UGPZ0wWsfQppSMzpNV9rxamQVxi3fDqFGN7aCzy3KTn0E+tyatPCynKqNd2KaGO0Mm
         kO0l/ILKYJSxk3D1ngTAsgOaUkUSB4elTliF9K0h2tBMaWVRNzMwEPqOyCXjs6EXe0OO
         BHB6vGlY5mhwog1P5X/kln7b1bXiar5gO5B32/H0uuiGxebiyVZcXh8zIOnA//7ehGkr
         BSQs0NeGaukm8AoJWYVezY9q/+bEeXqxf8Xqn9Bf7nAeDgwk4slzfmaNQW42RRloExzv
         t79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776425420; x=1777030220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrUlnaPeUu3AWGIaZ2F//u+OA7Kh2XfeqIUAuZofzZI=;
        b=MycOS4vdFue7wwrDO1tGoIYPYjRlinTSKsBigRJfhJJl2yKawShlpubZi1LxrFJUuN
         mTNWKu9z2pi7rGBREFqi3QgedA52Y8NguouN9V6QqMKpysyigaRALwE0C7u4Gj6H6PYy
         Paso6wLclgYZLZo+HfYncbiN4vGjoM02iPM4DPdk9Qqewhv0rcZjOcTiX0AzcgkxGpqy
         ZYBGEVhu4orzD8/jnxqLroDLQTuwGoXHKLLxFvKBcpcrYCZpHt9T4+567kMkgg9+pBtO
         WrSO/OqxzS2rM33qLkXDfYqZJsYV0/cfPFOjwX9cqOsTIbIyhcchFcOPRGkH+tz53dOG
         jlBA==
X-Forwarded-Encrypted: i=1; AFNElJ9fKTwerObjPRMF+s+Aj3zRD8tFG5zBCef2vc4pqOgcUxDJ/q5UDFCbJ7xkpJiCFuoj6EYp7sJier0Ngg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzoor6lNfeVnankuxYvQKj9r5+1oOA1IX2b4RRUS+lYAYJW2B5p
	bh6xMd/opCFKLqGRerwyqipZH/RkTkiGiuaZcQqnoMdOmpKtb1xA1HizQHoIbJjFRqgwjq6WqRw
	S+i0Z8Hm4w2pz3hOKhJEI7S1QS7k0DpE=
X-Gm-Gg: AeBDietUMHHwLD5chiKFwprUCBlk+0CH6w2FQVQkyAmZPaSyPVJCC4JdplUZh9ZtWuj
	E0GgGuej2hpjbQQocEhPBzCeceTx4yYGLv0lHlLU3etLnNd64pNuHpSVOByE5gXiFDkx/p6xhCS
	D3/8sfoOAkhznkSkujPiRj4AFCdWR0CUWK6DlxwGcJpMHWYWhWyvy9M6VarhB4WfeyMFH5fECD5
	+2dInXtRZsOLYKRgp22p4NYH3YL/sPlBX415N6IdLuV22gvbBomWahso6pG0Ms/anM+TVtPej7M
	1t0ytGCuHrrLjJTBgTd1K9tIivTH0Q==
X-Received: by 2002:a53:b170:0:b0:652:e57f:148f with SMTP id
 956f58d0204a3-65310a0c660mr1603840d50.30.1776425420102; Fri, 17 Apr 2026
 04:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415193138.3861297-1-lgs201920130244@gmail.com>
 <87h5padnof.wl-tiwai@suse.de> <874il9eu4c.wl-tiwai@suse.de>
In-Reply-To: <874il9eu4c.wl-tiwai@suse.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Fri, 17 Apr 2026 19:30:09 +0800
X-Gm-Features: AQROBzDDzGNvRJBgnW8W7zJADqHBlVY51tN2zZShoccwUBirx_IRlwOcg0eZv9w
Message-ID: <CANUHTR-CQT9WHbuzedY545Jgt_HwQcp6npPBsnkcNVXJEq6Q4g@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcmtest: fix reference leak on failed device registration
To: Takashi Iwai <tiwai@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

Thanks for reviewing.

On Fri, 17 Apr 2026 at 18:52, Takashi Iwai <tiwai@suse.de> wrote:
>
>
> ... and now I looked through the whole tree, and noticed that the
> majority of callers of platform_device_register() don't care the error
> cases without calling platform_device_put().  There are over a hundred
> callers of platform_device_register() while only 5 or so are doing the
> proper cleanup at the error.
>
> Judging from the numbers above, it might be better to change the
> behavior of platform_device_register() itself to call *_put() at the
> error case internally.  Or, if we keep the current behavior, at least
> we should properly document it.
>
> Greg, Rafael, Danilo, what do you think?
>
>
> thanks,
>
> Takashi

I agree with your observation. Given that many callers of
platform_device_register() do not handle the error path with a
matching platform_device_put(), this does seem more like an issue
related to the core/API behavior, or at least something that should be
documented more clearly.

Also, the underlying issue here appears to be related to the
platform_device_register() core/API behavior. We are currently
discussing in another similar case whether the better fix, if any,
should be made in the core/API code rather than in individual callers:

https://patchew.org/linux/20260415174159.3625777-1-lgs201920130244@gmail.com/

Once that discussion reaches a conclusion, we will revisit this and
make the appropriate fix if needed.

Thanks,
Guangshuo
