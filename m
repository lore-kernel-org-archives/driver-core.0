Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573964;
	b=q34LKvIBZG1XpfFuCgxTHbQqQPvBrLr0JoMGn7Rc5peM8XsHbR1M2aqgw//BsX5XLiAs
	 LRaNgwwZOnsPFeu9p3Jlh7G0Wja9iZE8L/0DJKAZn7kV+5/Q/Qfoufam/fn8t+hKw+w6h
	 Wbb/T8UdneCEHBnmTgbMIxjdZMSzXdnNZTNDeljDsKqDdEy+SjBOA5ws4WvXrxq+ypNnC
	 JdgCjjSe+PGL8PjYElati5BvVsksW9gdBbvU8mAzSBtAb1l4RNi0/KeUX144O7zn1g+mf
	 71pFGsiZkzLMqx2fcifzbyOx1f6Hhmt0nCLD9AvAzAS68a0+QuHKSJyi2Mr+Is9/88w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
	b=S/5w5Spp3dCPIzlu3bC6cD65qWD4MH1GwqWEqHXJ74xJjcOvunE8Sb+8NaZigThjboy2
	 nCbD0Rkyr4Xm4TE3N0VhCAhy1giWGs/E40/BIvN7G7gryQA0jfPALD9RG+YGuUOaRMr4d
	 mtoWjkoa755fdKJNLioxcJa5xt4NJHtc754Uwj/IO4E8UTeHLwQQdd8tWFyDmNpgstCSP
	 u+RU3xPZnHXp51OV4O5zGxj5uZcIOFQNzIUQYe98yJvM83rwfpoekcQaPT8uY/Lo2lGxJ
	 fcUTHco2XJPpraoKurpkWaYuX1OliXN6lmCMNQvBOx2/nIys33oqD2mlq3s8ULrV6sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WB4mjqMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EC606A327
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 02:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 816EC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WB4mjqMN
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so41634021fa.1
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 18:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573963; cv=none;
        d=google.com; s=arc-20260327;
        b=Xc1esp4c27Y0Z3q2fR2FZK9eq9sY1uvlcdbSPHIHFMRyWHL1siram3cJr4FAthwLGK
         phNpyVexJhJ6ElOxB46QUNyB0P06dh1LqdVfLg+53WAGhkpe4MVSLVGu5QtZPZZ3KOZx
         LEeFRmPstKCeRBDKhX0ynWthSzfXIdqCzMPAXxzPrBUP5uRKvx9eUTCIUT6QRh6LsFGb
         r92Ly1abcPL60Suh3o0yq3aEfwB7Ub1Q/hRY9B7Z/KQxgDjQSX8HF7FAxnfVrlPFYvNY
         o8HmJef13TRB/jf7MV/8sAkHw5JwX5/2T0YpwF+Tbf1MUS1UpLgwAOhsPoGhqrX2sXh3
         fBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        fh=2HdLspNdcM/a/fguHAEkQzKyZHr0Wf3a0AgS20S0P5Y=;
        b=qI5Sqds62ljSI4XDG538okAGQ3c8Z6cQsFCCcpXKkEfejzoq69BAJeUqt1DCsC5PDO
         qew4vP/7RQvsTUD7B4MtQh5IbROis7z4hw5/R0llYMgqNSQuiYdrPDDR1amd9xPzfNsx
         T9OycJsDnRfZmdM94wLfYj75ibVsKQti80yLbManb6rnQYxrXXe+MnstVWwGLZKEIol6
         PxhEBSZno8/DFive6lBV0id3WWABIX3v9LF4uGn6bxpOYNJMyLamCi1SRIWMskAnH2rr
         Gs7G64Ueq04gPj/28G/0CYCccRorR+f7nAEktn2zs5IujXrTRgvAD6Jz2lpf+pZ4I5oJ
         JscA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573963; x=1796178763; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        b=WB4mjqMNpWnVX82FGLvxmZPBBMFu80si7lANj2FqPTFpsJB6E4cYB53ymd/s0vAzLV
         AeVZYDzkqN2zgmLIGkuRLae+g8vfHPAVXroqcnKTsjnCs/5B4HWWX7dK+IA/CxZN47gk
         PymfT7T675CyG7r96PSo5tGu4DbgFidsO8j0cYfapOLTtYm1DoU5ky6ZSuayaidL6bQX
         clTE1gSUd9UjdX6cNwPMPsSP3wEjQrvimhhjXm2M9DsvBnQKekW/O8l9ZVFCYx6f5SvG
         pkUhLzrLIKWV+5Jr0wKHtmndWXsXV4jeRvrCRpl5HkY9HzHTJTfnZLVOoVutj07qfd/1
         rMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573963; x=1796178763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        b=fxy0XT2hF2EypORFqPk1FWVeTvwG1nXKRamv2ZQKh0f9TTx7SoN1hLAN6YWX/iIRmW
         CSDVnX0Cly8V6sOsr9xQ1r7s+eg6e/Q4GViukehT2wbK7Ygj0BqV5wHu/t8XpNuwQ1O/
         7xcWkcEsfFQV+cM8VuUh6Vd1IHyJcLizso7CPsvonC9KUGSVN4e84kFAx7rospT1Z/BZ
         /jxKG74kp8uZgEgvmocW8PrqCfOdn8wpsVFhVODg4V5YplK7gpQlb0xo2i8yHZMtyNFr
         BdlH9FCiGAvR5RCpGfexnAiBjriGY05jXf30wBZSGp6WSD9G2PDW0VxGb87iSLGiMWp0
         zR7w==
X-Forwarded-Encrypted: i=1; AL+hErHHcqzPQGib/ZqdsLmpgC2GrjpkXSQ/gimuqPxndDkZVvIMBvGmWo2O2HThycpWlGNXX+HeJ1Bz4xs00g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8UNCRn1j78n5RmCad7McEb31tQVYlMKStGYbVziX1q794t+/NG
	Vj8nWJhW5OTnAvqlN0xYbA4r4B8CZRRVjb/KaOeaguQbPhiq4GRhgdlXJsFIRRsh047gOAK2Q8p
	dWPPjc02u6zOT07dPwJ29FZC9+fmOIMf74C6tS0Y=
X-Gm-Gg: AZFdTZefwBmUUAvSPrPQJcx6E/IuiKQo14UpEThvJgsEaOg7akN1doRYcnryi7R09BV
	1tuBzoiTtczH172yOsw8qk/t4/2Rsy/rZBjlYOc9H1sfFw+mzN+sWvL1TmWIhlvx7aetDV16def
	CIXHzuJr4eYQH+CoZaoMvHxx+HhMkqIqfYA8GrJ6ddtxULlVrKPiBMI9PHXNmKl9FUDZIGKSMVG
	KUdey5UBKbYRPbDi0GI/J7mVPjzfVhFBSM0bogHsn3ELtxi1ay+Ah51H1lPexKyM6QZS4LVZ2K6
	1LcLbBNSu4NVOzqZflxpfqi0K1KYhG34NGg8Awn2l8xdh17L9El+Tlmi+OKtgQvyAzDZCYLGjf2
	+JAe2k8A7VLPP0QE8vUxq9TkwbH4ULUd4A01I
X-Received: by 2002:a2e:a98b:0:b0:3ad:f236:a652 with SMTP id
 38308e7fff4ca-3ae7fa6ce1cmr44004651fa.25.1795573962416; Tue, 24 Nov 2026
 18:32:42 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-3-muchamadcoirulanwar@gmail.com> <947615fd284c416891ac6de5d16cdd00ec5267ab.camel@posteo.de>
In-Reply-To: <947615fd284c416891ac6de5d16cdd00ec5267ab.camel@posteo.de>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 25 Nov 2026 09:32:30 +0700
X-Gm-Features: Aa3M54rr1ufHp2-DDunLUXvNfYN2DvOkdEG5zZTIMyDI3WVeYzjwx6EaEbPlUvU
Message-ID: <CAO26r3QL4R_h4DGWE9CpYE_=6PW5LXo_qy+xKgxZndSUcpbGwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
To: Markus Probst <markus.probst@posteo.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Shuai Liu <847807867@qq.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 20:34, Markus Probst <markus.probst@posteo.de> wrote:
> Hi,
>
> please add me to CC.
>
> Could you make `I2cClient<device::Bound>` Sync in this patch?
>
> `I2cClient<device::Normal>` already implements Sync. Functions exposed
> only for `I2cClient<device::Bound>` should be thread safe.
>
> I will need this patch (including the change mentioned above) for a
> future driver.

Hi Markus,

I added `Sync` for `I2cClient<device::Bound>`.
Thanks for pointing this out. I'll Cc you on v8.

Thanks,
Coirul

> Thanks
> - Markus Probst
>
