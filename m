Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947162;
	b=MfV5xErYU0e3hw6OnT1jRu7C4c5gtG4L4mTDDQYLr7pbXY/TfAxD4UvgO1FSzzvLt6Az
	 F/uqdqBP6m9WwvgQKzQE8GAbKDEs0MyFJ5/ZA4nwWTNadHLS8M+bJDRj3Klk5uDEK5xSc
	 BcdAbPa8AKw44sfO15kZND8TQglMJ5KrR5jBX9VEw1wRegTOBlKOQ3YsQMGXp871AvKE2
	 t4DEeA/Y6I+uithdwpUtlFPKzlqB6vLptoIv2aQdCr/d5Mrmt48x5SrnF52EBETdrvLua
	 g9Cz5FpITxkJ3lfTW5A+TLREhW29Nj+Cn8fRTV4bjyzi0iDfgfiY8fIvuBYL+6YSuSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
	b=cAkHM1Aqo7Xh0Yr6RXy9zSZK65HEABj7XnhHLWlOBP9RfhKQGrL/rmdMAEm9Az8Jfq0I
	 Hk+VTUPTZo40dsFvIYCOL+K2NDM80kQKyozayUIZ8lZEY3NJQHa/ev2bagc8qAbW0E9j1
	 Ae+ps+ZHrvTQHNdXURz13mIIb2hITpS2+x4xZUfQiF/eXLsG0nfLML0xSXK+haVyURZAi
	 4gsw2s2sdUalk7TVUw+Ol2o3E2HjIdnJ1Wbs2aGNpyVagza8DaxTzEDlOdvyX39QTDilL
	 aDR92CrgOuSaq2ZRzv0tyeDdYF0xDXls4kOJyPVE+KqILq8d7sUj4HQdrIfQTRZZKSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJBjEaMu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831C6606A31C
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 20:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 831C6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJBjEaMu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so55791cf.0
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 12:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947161; cv=none;
        d=google.com; s=arc-20260327;
        b=PJ05efAvtAiVrfnYlBH76b7OxNOGTWfdIpXtDkWrmjZEi/fkd8/XbV5u0LSGYoQ26z
         ODe/4B5lXZznhTm8yaK9YXPxg6UYQovs1KgGGwgX2nAl3wCZlMqhcy69lJfwTGnf8I5d
         b5lmZsswg2w90qSq9OeFj+eARuHN7EYPqGaaLafHGR12+j66YBzQ/lQrIFGRL6onvwxu
         GLvjysgHBMp7XczMAA5SrwrI+K/KBh7gzWjMJiUhpe1GyxCmmS/2MhJuxMKRns9uZRYj
         jnpqPaWjr/qgr9NaDdVnBffV2dXzDDV9AUTaff05zKDuvJjCXfDbXf8bnIFqEY5MuhG2
         ogEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
        fh=3bW8Bhk/Qax1hVqF44X3zov6zm9u39RBazAW0AJSATQ=;
        b=EjYuPZTbz4uAL2+g0LH/+N2ip4NhpiEWGS4L04tKq+ZlgruTYaVOj+XP5nm888X6ab
         vun+I2n/3XDaH25xa3QsoU5pPdF2jwSCZLuRY/QamCiqClFLe7Ase2XnkmbMkNsOfeX+
         P3dKKQ2rp5qFX5vJcUkUszY7ZfItAD399N9FSqiWs7UupJq3gDm3uCjEydeGAnFJGm+L
         AF3K9nOgc0w/Vihm9EysibLByr87yNJ9nORp8lePilwT1IldOKSSpSe175AaM/E8cc7j
         cHT1rBMPCC20zt6N4FxLUqAzKPY2neBp8U1eK1wJAFxXALINN2ZK1y9KF2vMzfkM6wP+
         Up4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794947161; x=1795551961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
        b=IJBjEaMumlPnXbq+9oKevAek9R3yLyh1qdklQtHp2eZ7v8STBeBZRVoWoI1FEa+rJv
         DxoeFdckc/711iVgqogeI1Bv/u7O5Qvv7HqDIO/9sEzc1OEBHwpUPzE3LULDUozxb4Zu
         rIsWOPgHkv2m92XQ0fVpQS3fCxWg+h8PJV/rfJAvdTfSdC9WiKC12LUxiGrEZFxNcOif
         z/zfY7w8hpeEk78FuA/5lWBLeGSBkK6Kjv6LcUPjtrriPmaeaRBgV9YNQ6Gl0MYKhDIE
         m/nUiJ6lcRjvAUGk8wysiSuXEWu66CIxqK0rN8oiPse/jrjl1bTaCNUNSygTU41j294Y
         wQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947161; x=1795551961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
        b=fjnJlKKjEElJ8U+IBa07UOXReoA0nNx8izlEG5maWSXP4+LXThIrNOKQce9tjNyf5E
         i+Q2YbmsR6ZvtWiINs3bSIJ5OUQMA4FYaAEbucdQPnuFZakLAsYoYMvKM7Bomxsm4W+2
         1F7fjSPehcZ78Mw1s+vgAIaTEkLZYB7Ub0qJR53ZEbkFfV/suDVDcIpBuD3MDMDZLGGa
         KsU/tbHyEHCnUt5bwPyoX0J/Q1tOe8INdQCLGMikNLn+Dm6yX0sn0HgM5+YuhU6gSfP5
         Pka7NVG/4z3BzxS1k/aS0ABPBjhqMHWQDqijgWD2zhiWM74C9uu+J0ItAKRhaj8Gi6wQ
         Lvyw==
X-Forwarded-Encrypted: i=1; AL+hErFD5ueAcPcL4U5UroJEaE85D+TNMtpnZISvcZxWqxcErSp1efeAiDB7ri/CJrEeoG+m+adQqll1lxRpHA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ypvdxySfC/SlXJqiYAOsrkrkGkNkk9Iqd4mxsMAdleOzHEO5Z
	xtcLDuICvHLtNcpPIEhd8QX5gFX1RVAV2DJEppZjcTWMqI7DcwHhxfR7TZDy9NpTm/eS4R0UR0y
	Wi9eXpjo5PY9K2hDOw5a25NVGUcvRYB+7g+8bqUDh
X-Gm-Gg: AYBFou3lYpsb54q4SnpWNLSXgex2kEsxzOCQe6fDl7VKpa0Q7m6C166jmt8xRGdeBxM
	hguRAk/ImELT6ptTHVgRB64rB49HPDJwiHjAtSEXkZmCk60fp0fqJqEdZ9xhmBcz16pFykujbBL
	M7aLv7GIs11Fw1X28E5XyckwRKvF7Kw4b1ZNAWi2lOYbUDJMsuGmgXlKcATEhHyuQonTw15dWic
	0aOne7WH4NI4pg+4F6YeURTm3vpuiqEJz6uBf6s+LYTsuCQ8I5hJ+xuMsDGsQVgXw20ENLiGCYo
	j5BVlNmndxyKMrKWKPypR/WvVCe0oE6NvwK20ekvUDHJAeieNh3M34FFnM+y9iJYU5FF2hkLTDf
	KKytocvkuuCZVClJ+YDwCgrk5gqSBziVU3sX3LOrixULK0Hm5GEDLOGOiE898n4I1xEcB+P4BPm
	p8F8aaQ9ailHg=
X-Received: by 2002:a05:622a:4c11:b0:536:6ae9:f55f with SMTP id
 d75a77b69052e-55d5c25ac0cmr168991cf.7.1794947160746; Tue, 17 Nov 2026
 12:26:00 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-3-irogers@google.com>
In-Reply-To: <20261108223913.3624571-3-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 12:25:49 -0800
X-Gm-Features: Aa3M54rgKc4_PudcaM6yszp5Mdw4isGgsPgTnvL2ClaE7ml053-JZnxk-RQJF-U
Message-ID: <CAP-5=fUQvqpny1CrYVUqg9SQo6VpOuUqfOK403BxK_vWCDU30w@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release
 callback to secvar_ktype
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, driver-core@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> In add_var(), a struct kobject is dynamically allocated with
> kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
> sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
> However, secvar_ktype does not define a .release callback, which results
> in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
> when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).
>
> Provide a secvar_release() callback that calls kfree(kobj).
>
> Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via s=
ysfs")
> Signed-off-by: Ian Rogers <irogers@google.com>

Gentle ping on this patch (moving PowerPC maintainers to To: in case
this got buried in Cc:).

Danilo offered to take the full 9-patch kobj_type::release __must_init
series through the driver-core tree with subsystem ACKs, and this is
one of the last two patches awaiting an Acked-by. Does this look okay
to go via driver-core?

Thanks,
Ian

> ---
>  arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/sec=
var-sysfs.c
> index 395399bbab2c..f3f6ac25ea78 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_grou=
p =3D {
>  };
>  __ATTRIBUTE_GROUPS(secvar_attr);
>
> +static void secvar_release(struct kobject *kobj)
> +{
> +       kfree(kobj);
> +}
> +
>  static const struct kobj_type secvar_ktype =3D {
> +       .release        =3D secvar_release,
>         .sysfs_ops      =3D &kobj_sysfs_ops,
>         .default_groups =3D secvar_attr_groups,
>  };
> --
> 2.56.0.455.g6c5a503b38-goog
>
