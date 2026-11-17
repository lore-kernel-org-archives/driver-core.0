Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947299;
	b=v+Q1ee/b7tSuI9lkQhd6kX8EQix82eY+y04T/FYkx+djYCOyzAGpjvN/VJjRiXQKtmDB
	 JT7Jex7t5oAAP3LUg255FTXd7yGNSKfnRtBoCoDKsdENOhRDCoNpafnDwwzmJIYiNdLo7
	 T2lSymE7gIIjn6jhH1HmZIpqVF6O0AVD4bGFHgCqKONuQtpoPHHXyy/1prD3+nI3VkcNa
	 wNFvLPBFscvOR0B5xeDFbHdEu0K/XSn9Hkv79mAH8orl1DOLxiH+fI0pSyTN/Wj+iSsLW
	 i7VXk3aK/d2pFemaOqZK9kLlGvMrKHKsd6fuosGqST71vq9df+Txp7/0/3fKMcoM73w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
	b=dWpZ8RslYE9988nWhNrfVpJLtBVlkkUI5TPwpbksWOfAtqxrqdJGvs1iHkUTqo8th0p8
	 XQujrLyd9R/awvnRZjXaqprNdLwlKjovzuQYvVNqM/h+TpnLnTu6iaKM9PgU31+DXSbyn
	 gVHrg9dgv+G+jK2qSUP7SXmx8pcE8uyA2kFZPUj1a/HkjnkO/l+d40w/q4qntiUqUz/sh
	 iC8J+NrV2KZZt6p9L4Kz/KD2Ukl9xyTSNUhF/FAHZt/5/5mDRA3OZEaiSZzy3hs1fb2J8
	 QtZYi/R0NC+oS2mjGjxOw61+LI/CRspxKKHKr20C3lTje1/jSdpGrBFSFDZJG7PRDmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KPAy0dGI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967F4606A32F
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 20:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967F4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KPAy0dGI
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55c7445cf85so2281cf.1
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 12:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947297; cv=none;
        d=google.com; s=arc-20260327;
        b=lhG3/UErybfj0p09AU5rGwckGFSe4SzaJeEIU1XfaKA+givX+DmudZfURCzn9Dt8aH
         Gdq2W5M39sf/EWrQ+Oi7OUrhvvqDCgDpFzKRujAGfT9L3kfyNWagtS/73qf3J7kAWJB5
         t6x15UxQWXYP+wonYWquU2Ywf5Qnr1lSeW78gFFYmFJ9r1MZhHG2ulq5t17fd+0IDIlq
         B/PWL/+r9Vz8jikbo3PBPMvwIbzbG6JwOLxH3OyHGkPNuxTupWzqoObLwI6sqH+2W+S9
         lpM4ANHvFlO+PXnzXDM3OYc68Xf2EXQ/UJ0Wv6zkTeWbBcjDxSaz7qjb/TARa3QAUjHx
         XfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
        fh=Pce9SWwrDD/hzFundtFi1ziFmcZ0oaGnVddtIz4VL+M=;
        b=MZeoajFzFfjFZlvIhDVSFWW4I1gofbAC2SAIP9qk6c7kLxSGkDySL/CF6cWYGUMzcE
         ARjNiH9BI7aijexjsyJNYYYclQD1W+QVWspMwaEiMgChLdjGBzN0trFCh/D4FsxM0wKW
         ZS5EpFnBc7R/6EQD1uSJKAWCj2xim1X4NTalJY9rClYPEHRh2FknSc3yMTooh/3HfaJ7
         kQQ501wdtttncriphb5vL384VPXIhKuEvtk1AF0ZQ8BnncOy6N9is277T0dLrBVEnZFg
         0DEVI6m7dusK/edpNAbNQmqHOZr9nw8yrqZFZWtoYQrxqMRg0mNqoVfj8DEhGXt5pS1g
         /0Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794947297; x=1795552097; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
        b=KPAy0dGILpsVBdZuM00BPOwMu2QKjFSWPV7qF0stSo5MkqMk0xAIeL9Vu1y+KXLKUZ
         XTcCvFM4afo42juKG4KTPQBp4FJAaKzCtD3E2IJT5iUpaCNX3At13oz1+KVLyMTUEVRG
         RrkvrGB78cYiJ/8BOYpls7E9UiovWM2BNTOilBUXZteCv0yM0MbeKlXHhA5HcbR8AlsF
         9cxFU7KF7xKzXIiGf8nMlEqQV6ccPRv1z6/TVI/8MBslanwR9jdAGeAgzEKRF6iCq9D1
         RoIs1QGNprqwfrbmCcIL2ouwDIAR1KiCvAo/xSW3oAxmJvHN/HTJlQ0UVn7tNEYT0Bp9
         xUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947297; x=1795552097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVQoF4RBBvw/4PYTHk8rllYWT3NYnQtky5aIjcCOwqM=;
        b=T7a5vnaxhzlAX5lW6qS5XNNLJ7Ww39bt3491vO63TyWAj11RjwnZ2tfPPwOJUlhpGN
         6Z3rWHbWbvhhzeSUIcfAcV3c6WU4kpZbWurRUKm91E0/bqqaq3E1M7Z+V9Hwyjs4nEZl
         hRTBl3lQAEajOF40YH3tMJ2+JaX8mufzffho6I2On/XMA9fnrVLyI+CF1C5GNVbaApoz
         fs2LYxAmNsp0bPuYcJPeqQ+FEompDbShIWWgfYwMjPu7Cg0MG1vVUY3FSOB4bsIJGeIR
         48/h1fpNZIV7yYj5p8AL9vDat7uqkUk4JpaUhLLfxkalRgK39a/Ol3WM8ZvjmfmJrCVl
         1GrQ==
X-Forwarded-Encrypted: i=1; AL+hErEN34FvWcyoNVrsuSwikPxU9sRpBohL6V0GHg3SJ2mi8QLjk8IYrcwJqkvU3QHuOHSGakx1vFCvjXf1Uw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9DzPNK+qefOAALs6x291LP5S8sFZkhjB4FmSP4QIwKIPjFCn0Z
	0yWclXerjSOICVbzXwl6UOWJ+kwihECWp1axUBcNva7jXfHciH4SSDorimxnx8ivdUXuHYCkzcE
	lrCTEV6mOAJ8mejOdcc1fNO3K1WKaxgmgH3917uAy
X-Gm-Gg: AYBFou2V0xwN3fC84oM7eznFPWHVXvX4S1zkYCxZMJmUqQTWqND35Ohr5Yn/l1NjHg7
	0XYTHDIyfYf9c6C1MOfLp+bPMxeHprGln/9syTaHAKiG2rRW63Mvdtp40Uhdd2U0qRs8gLhNmpo
	0vZmjgmhPErsrTxJ4a42G93O6H6eQwq5YERpy/Qsn9YD2KPwOuqbyW1XTJwBEAWAKvrEI8cNYkO
	ZTR1sr6gjrmrYh0J0VUnY2d9lRxK7gnVVjd2PoTSeYZQqz+DYAY79W+52DNdHQN6MqPT8FqeZ9J
	5FICg5n2pWT01e1uhlblTJCMvu04SlzRWMWENYrj2nT/GhjXb+j91zZgH43ivqg4rsP53LUVZas
	VmD7ag2n5w5cnon/M9a46/3qCAHUjU8hf8eaJlX/XTNiAipMGWBEZYq7+tF0Cmi8Mmw==
X-Received: by 2002:a05:622a:4c14:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-55d5c2cee39mr65141cf.13.1794947296716; Tue, 17 Nov 2026
 12:28:16 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-4-irogers@google.com>
In-Reply-To: <20261108223913.3624571-4-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 12:28:05 -0800
X-Gm-Features: Aa3M54pKTQsa-oflH9hUV5D2o7s2OGZET_t0xpfakeOUoS7f9VMMcgCU6TwJrv8
Message-ID: <CAP-5=fUUatDonEFfc4bFAPKgOokjn8vEOPUNEKV185-g16U-8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] sh: sq: Add missing kobject release callback to ktype_percpu_entry
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Rich Felker <dalias@libc.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sh@vger.kernel.org, driver-core@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> In sq_dev_add(), sq_kobject[cpu] is dynamically allocated with
> kzalloc_obj() and initialized with ktype_percpu_entry. When
> sq_dev_remove() calls kobject_put(kobj), the kobject is never freed
> because ktype_percpu_entry lacks a .release callback.
>
> Provide a sq_kobj_release() callback that calls kfree(kobj).
>
> Fixes: d7c30c682a27 ("sh: Store Queue API rework.")
> Signed-off-by: Ian Rogers <irogers@google.com>

Gentle ping on this patch (moving SuperH maintainers to To: in case
this got buried in Cc:).

Danilo offered to take the full 9-patch kobj_type::release __must_init
series through the driver-core tree with subsystem ACKs, and this is
one of the last two patches awaiting an Acked-by. Does this look okay
to go via driver-core?

Thanks,
Ian

> ---
>  arch/sh/kernel/cpu/sh4/sq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
> index 908a8e09113b..f33864958487 100644
> --- a/arch/sh/kernel/cpu/sh4/sq.c
> +++ b/arch/sh/kernel/cpu/sh4/sq.c
> @@ -331,7 +331,13 @@ static const struct sysfs_ops sq_sysfs_ops =3D {
>         .store  =3D sq_sysfs_store,
>  };
>
> +static void sq_kobj_release(struct kobject *kobj)
> +{
> +       kfree(kobj);
> +}
> +
>  static struct kobj_type ktype_percpu_entry =3D {
> +       .release        =3D sq_kobj_release,
>         .sysfs_ops      =3D &sq_sysfs_ops,
>         .default_groups =3D sq_sysfs_groups,
>  };
> --
> 2.56.0.455.g6c5a503b38-goog
>
