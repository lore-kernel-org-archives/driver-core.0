Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ACF599A33
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161130; cv=pass; b=MU2of26dlMIzetIcp77/3u0yeiPx66uZiBvbkrtRLRop70C7TH7GdhhommOYbgvc+9Wmk/u+wiRq2dwnATjKdEn19pbnYyhWt3PAkOooLTHe65YI9pynWXpaG2FHHwspbZUuBDHEHrNrbXNqSbftuYw/gAdWMRDtN8t5aY8BQ8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161130; c=relaxed/simple;
	bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQZk/OAtfz3ALspfSS9+xmuPLbf5CO7gvo9JnU8qgzu7s8jIh8ci29iqisvpUC7polHZdChJqi6h63a810b0e7IzY3XA9iAkFU9Ta0/i5E6yCv/3uOMVk+pok1j9hD6/uoGEZa6f2ynA3yL1erlgwQ8oiZLen5qv1DJrD3gyHG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVKY2Uum; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVKY2Uum"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so74772066b.3
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 14:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789161127; cv=none;
        d=google.com; s=arc-20260327;
        b=BcUa2bZLgA/JHlXovo8MHKrYg0eN+rdsIkzLa5H4BgEW/OOy/5u44cCqL0jvqE0Hyh
         1zSS288KT9ukVSogrWmyUPcBlSYaotWFDRR2vopPfOEXRjF3qgZvnSLxNW4L9obypubW
         CRtHOIf/nqFgjCcyXrzHLX3z5MA+x7fs/R/E1gggOTAerxH58VmKV0FOO2kNp0+1tiHV
         3XfVPVWnyP3hCEfgPG332Cbay/37nCgq6dG+5GH8GpDsSLDgSsVgQbWA0BcMf8/RzYoF
         +O5OCtVmjeDB3rKiyZsK/z4o/GPjbBWXB+LrqJ63ijYvX1YdF42CXw87Yvo+9Swhqb/0
         Vp2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
        fh=Ekw+bjkyfhiNtLWtpgflvwV3daeUeTKLFXtNDaHASUM=;
        b=V1uVDfOVIM3yGVwOyNSAJ99xoT7QpP1VRxDQ2ERmmmy6EvbrsLR7gELeQ2tWQo5uPl
         xTBhj2tI4pWxAZwYzUDBFbsCgTY3p9dQsytMIHxCCOUn6OK6xSnOY4rrs36fhB+OStJc
         rMKyr9g5DpwCHVMzxECvE4OlSMQ5OK91/GqGO1QnhlwFVH8P4DWve/tgWKCOFWwz2fqy
         Bbp0PEfv/Kt9JI/m1EWmZeAmhcHkoXIYJsIpziEiyW+rS3T1RVtbP912ZOjkU1y62DMv
         93iBvBTFRrV7ZomaRC4qR8myEoc9tb2l7ebjpgzPqEtETe4RayEOTRPfcou32gLLfAU1
         ExJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789161127; x=1789765927; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
        b=MVKY2Uum/29JOSqum7Gb9DoOVfesZhJh+M1IHpAdQood71u1W+PyJ0m4uCoDPaGBQD
         fFt1+P5Z3ku2ecHhMvNgj47XXYtFKi7FjRa7qehN6tcdXIrjgm8tHeOtSe5I8L+5iTEy
         mmvW6HXdaRHssDzGKXxMYSgkp8ToNdQ3GyiNrTddL8tNSac+uRgXoTZ4cnHyDTiWyJo/
         hi7gY555RnIyPSG5R6dq65Segh1F8JuIKDHtkX9tlkiIF6IBh7k2SzcRvTwV4hePlusc
         qGJQ9nHC8l3pft1zj+SDhVGaeJjlnSjBSm4sv/LelSPg1Ht7ZnCJuOWjvPP2JZ2ae1Km
         QKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161127; x=1789765927;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=euBz/ciJkJSclpUCQrD/ca+QSNLN9fjMpZ7nLoA7Ujo=;
        b=niYv36vJXtV1LukDhvPFrDf4+UfSarBwTOEEGpGtSMFfyqmpac2pixhHy+7Y2kD4cJ
         1f+o5yPWr6/meH3LhQ5vEi+KNSUQVgJMVci9bkh6asB/x3sTjOQ0Gq5NDPYZwF+X8E+q
         UAdfGPrlj41ra9K95b5gGovWag8D4/m1o9bdAbbY6nzm+02/GNK40yD04jzaWl0CZ/Ok
         i6hacQCGu0XBw7s1gfTw/bqDu5bzVPpB0ftFekCa7dxkVIdw38pbJ5lshtZosG4CPYul
         o1o0N2O2u4D6eM/VBplNaEGKYLcOnyppNam7y/ntYfaM7d1FRjEt4YKVT8j4QI9Os7dZ
         prIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5D7NbTvtFSPGXNLc/1FDoWfPLag78pXtRMzaHDGeo6S/o6w3MKxZbuyJtNoUEtEB4+PiQNZGMllPmnw==@lists.linux.dev
X-Gm-Message-State: AFuF++lvWf9sdhmqeJYYzYkjrXCgkpzYuZ0XwQlRXQFlTUZ/smJ2ptmV
	cWuQ4TCrsEIxV11LXeXwzp5mWCdbrGHcv5frOP+a09ep97Jp8FUDTf7CoQp4hOz5fGKuhO/ZW7X
	KPp/41GkwfQVbght8qp5CGUl8MKz7lpdusK91GVa2
X-Gm-Gg: AYBFou04E8ORskE4/n82zbMgmqn7FN7QjNTinqaWCputLY3sUZPkTif1Z2wehXYz1Xe
	C6bkzE1681WOkkMw3fM+GIQ/Bwdv8yIUfkvdD7QY7F7HmUP3Q0iXtbJ0pqnDF5Ao5d4NM/4aTmm
	ZuXpbJmyslS6zRorCp8F78wtBcEVyX24wJ4CAtCpjVg9VgZYTU1Hz3WYYKVlpf8zqP97BiZRXAs
	M5TJhULNEuv5dHtZfxGAO4/JI7yeZUzvKTh8ZhQ7DSBsiqdHGdunohOQXNoHotqhK/WtDC+2aMn
	n6Q/s/N89jMcnYZrV+mOdyhJfvqNzpYXumrotqYOjMHGx2tOq81O2PRi1vKI4POpx+wQWPZVV7J
	ZzVtKcak1LkqLCgPFD2U2
X-Received: by 2002:a17:907:9619:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c29667578e3mr499344966b.21.1789161126322; Fri, 11 Sep 2026
 14:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821050507.2161607-1-shakeel.butt@linux.dev>
 <20260821050507.2161607-5-shakeel.butt@linux.dev> <CAB=BE-QMyzKT-o=gbhdp3g8JSqQgRiTFzxTX9vEBmCttABrmdw@mail.gmail.com>
 <aqRWuffGKczUhegT@linux.dev>
In-Reply-To: <aqRWuffGKczUhegT@linux.dev>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 11 Sep 2026 14:11:53 -0700
X-Gm-Features: AcwNN1Wh4xneWSvMXksn88XWYdkFKLDPGlOSXkSUkMRqjCCaU4JFTl4RQoJGSwA
Message-ID: <CAB=BE-SjW76gWr0kZcPnEjXOwt90vCV0TJeFuYEGV1Kt4Y1HWw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernfs: Remove kernfs_rwsem from dentry revalidation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, driver-core@lists.linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Hi Sandeep, thanks for the report. Do you have a reproducer? If yes, can you
> reproduce with this series?
>
Hi Shakeel,
No luck with the reproducer yet, and reports have been sporadic.

> I think first we need a real reproducer before considering anything. I would not
> add a check unless we have proof that it is really needed.

Ok, I understand. Do you have any opinion on the suspected call chain
which makes dentry->d_inode = NULL; ?
Partner report said it happens under memory pressure, and userspace
component was reading the CMA stats through
sysfs [1]. So I naturally looked at the shrinker and suspected that
call chain, which made sense for my 6.12 kernel call stack.

Thanks,
Sandeep.
[1] https://cs.android.com/android/platform/superproject/+/android-latest-release:system/memory/libmeminfo/sysmeminfo.cpp;l=545?q=sysme&ss=android%2Fplatform%2Fsuperproject
