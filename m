Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795067159;
	b=ELmjOTsFihcq0oCisvSFOwm60/TvD2vX9M6boiJuCsCJwmUDl3WbdvC4GC8F8DX/wcZz
	 Vb1ym7TR8bjYVzwSNVvOWiluKMPlNUgN2rWI/sQG2wZ1raICzPxiaF53TnGzjmNPJvNcs
	 5HOoU5Ss5AwXRX4mhNameCOjGod05GzOV9b2tqweDv2GV1NBaDKNeLFtHwDldPGWI/cIn
	 P9KNdJCUlx/kZvYqCjGdLX6r1jJsRa8w0rHIQdp3qcHYhpYKNrv5YwrIiLkH14GNOsaJ3
	 UZ87gMtqAUGzzFELFej+c0hpp6zsoL7Ey9zqR/EvRHG4mSHQEOe8OeIcIYwyeIPyl3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
	b=ng2638vvRpIsbSPnWqLK8aZMGCuIqRzM33grhxIqnMM+7VGlauZbb/blRJtJiwjbioOA
	 k384AOQA+GhYQbkkVSP2m7j71oXGPeZUonM1+U9iRvGQXYyD2a4Nv/+opDUkcqgZYOWWB
	 9hHeFeVhNGlg/mSibZIJ0e6E3FOlxAKesvPq9321igNWc7dsGCrkVS2CVLgd8nnQLjQ2S
	 THAONhlQqiMLGdl6+G/UJOU7wLSH82idypwdxEszYtA7qelmqRIU6D53n42caSobs5T8q
	 1NFzVsdx1cwcfkBcUjrPYm+Y0IS4GnzAV+oRLSMm/EqPRoKgx0AXZnQnq8yoIGndJoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMxj3yB0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85B60A2613
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 05:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B85B60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMxj3yB0
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55be673e029so117481cf.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 21:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795067158; cv=none;
        d=google.com; s=arc-20260327;
        b=PuAivbpYpnGI/36isfxs4XTqnS6rwZcD3kDzndN3F91+8QERPicrRg7zltNLqM1NUG
         0ATZOG1cMZZVR1svZXis32iZi241Wysq+HtRuJmWm9ggYggrZlI8dMMPbjThoCBAFWV4
         5j7AMx09G1W2WO1kSPrygvCI0tb45GWNGq6vxUxrNIL+evOxaHIEml0AO+CwD8WUIpc8
         C9EFyDUUwC6Wcnli/9oUPzICHCRDD0DbE1AJLpGzBWKu6mEg1tcfH2FuBh6VeRz3LUt6
         EP0Fr37GCRH6IFbjXsTXE2Sx3znxSghtA292W/UC+UXcLe+iOAX7TQG/xXE45+4pzeOd
         DTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        fh=UNHKQZWD/lZ+zYncbgDdajK0PybyQlQcoy6b+2cJYUQ=;
        b=LVDRpJFpYu1yhf5k+Q6omltOxg3zDtMJYbq9t0IjMCN7kM1jPJj9fGGtmJ32A3/DWR
         ZOHLCnNGvERxNMX47SffBS6UtQSSNGuRkawPuhBI/otRwNmnvvrDIvPuNsWsj4X4hB0g
         HS7BV29B7+Y3FaqCEZtBuF4dHFfloAjV/qoMQu7sdBF2ojfmbozmS9us5NVwHDYTpG3J
         ehz6qdmIlFltXA7ZAIwKwDnilrRxyZCVucQbgMNbApW5ps8bvIvKDFlGy29+KMKVm51J
         pRnLkRyo84qCx8cEGPNQ5bAvVZXteG1S6GS6B88jMD8BbXSuPqwRFcMPV3qX/VwIVr6P
         UzFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795067158; x=1795671958; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=JMxj3yB0SeAUHokTprfYVnrnmnS+Nxo3cczjmq3QQAOfFY6+gBYpfkzGSioGQ8MaaT
         9TcLPVQlTiiyLAcy5HbYgpaobHdwB4yb0nz9em2z5oxEKeLyVSIRtRD7ghLlVQDpESVp
         lbR5yGUGthueo8blACsDc54Ri2ML+0/lKnEgpTq7abthTw2uTpTi3VjzqOC/LMOvbPLc
         vbAjnK8Dp4ACS3bC2jUL8Yqi9Ak/QCMLL97O8cXzJ9g0FkzKoTefmYLT07Vmdfj/nSgt
         nTrKFZhlhf77LIKhdWcpjHZB9XGzJHjtgon1nmhQ5YDlKWjMjgcw0gIACUFXFgewRZLP
         Kgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067158; x=1795671958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkoHsOVRZS7gIowPl6xkao6tH+bfcK9X/Z+HF8PGU0=;
        b=fpmKkA9+WLgX388PEpSEwAUm3qLBns729NTqJ1YWts/UpVR79+WMrslZD0eyuXV633
         PWlpJktbpUfdV4dGTj3/+f75oMncwidSI2WFkfXGX9MJvUp+3b0/JB4Pj5/nc9CcFOGJ
         p6ifRQ3Kqhwc6oide1M+AjN260Cle52jfLzyzxX20NEMFLeUZrRji7Z4yoCjOIc1/1xs
         O9E0xw8gygWw9Le5NmZDIsj0mKxEM9n4HJpsuDY0WzEW0CQlZEbMlPrA7VReJzyQFIDM
         hKZe3O7G7QEqJfH2b6Y0AEp1Fw1tzLAV6cWZgzZycgoefBs63YgMkRfGc/zTHVQHRr1V
         wGnw==
X-Forwarded-Encrypted: i=1; AL+hErH1Wqs6KQFJoqJ4z1OdUdkMdFP/a8qj3t71JAUeXLDsPHOHHCqZf8LZATp3YegLgVw29iU/E3Q9lhduRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9EIXi6MhIt6aCT5g40jx803MQKplURjhfLl93Ip9ht905OgMq3
	peZ3wXlZC5Zt+CyksXTC8N5fWMVqb5+tKR3jpdQFvXHonSvHTNDPlorXRbFxkLors++zAedlGJS
	UHArdEvF7pdo9OeUSFROusXb4yqIo+N4SHNVaCId7
X-Gm-Gg: AYBFou06ATLwdgyVRUbvIi/MOgcogjWm4G2KwydAGBRU7kp45JwB8aOtr/lUnbQbO6V
	gRmbYY6bUWvsgwFh+hM2pmeDoMz6r+0o3UbnO3jnYUElZonACnhFnWDTMN793cr5RKIOQeEH0LP
	YwL1Zf4DdfiEe7gNqvps0yL/8/1CA9gHcRzPFP7o2ZFOsPvYzwJ1sKx2c1jAcX/jPCGNI1+EYSF
	TqO3xASaOGaemVegYh8o5DSFhlczn8NoVwJDCh5ExHz4jAGEXsqLAHcnsdNIna/qGr+XxzByq04
	fLGKrj8sZrRI3ywErOKjYijRnEkV3kpVSnV2C5S1SbpCSPaimhxUY7jMhLME4xkig/jjiry3gm5
	9FDvthD5zpjBz8iTe91NCjEkK7c+iCyZJNeu3
X-Received: by 2002:a05:622a:4808:b0:536:934f:7da2 with SMTP id
 d75a77b69052e-55d6c7995f9mr6557911cf.2.1795067157461; Wed, 18 Nov 2026
 21:45:57 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-10-irogers@google.com>
 <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
In-Reply-To: <DMYN979QJFNV.LM3T6O68OHW6@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 21:45:45 -0800
X-Gm-Features: Aa3M54p8GzPfKDPQ_HJcPbdLHGq3vwK7n9VGnVvnVB1ODjbFHeHwrlgOfVCaaEo
Message-ID: <CAP-5=fXrMyfLFXq6CiqwWMSbtYVRNESxuDo-ddqNwDmq5Nm4SA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] kobject: Require explicit initialization of struct kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 1:11=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun Nov 8, 2026 at 11:39 PM CET, Ian Rogers wrote:
> >  static const struct kobj_type cpuregs_kobj_type =3D {
> > +     /*
> > +      * Pre-existing: info->kobj is embedded in per-CPU cpu_data;
> > +      * cpuid_cpu_offline() only calls kobject_del().
> > +      */
>
> All of these comments carry a =E2=80=9CPre-existing:=E2=80=9D prefix, but=
 that doesn=E2=80=99t
> distinguish cases with broken lifetime management from those where the st=
orage
> remains valid despite the API misuse.
>
> For example:
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_xcp.c
> > index ab14079d1c42..0847134a1391 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> > @@ -797,6 +797,11 @@ static const struct sysfs_ops xcp_cfg_res_sysfs_op=
s =3D {
> >  };
> >
> >  static const struct kobj_type xcp_cfg_res_sysfs_ktype =3D {
> > +     /*
> > +      * Pre-existing: xcp_res is embedded in struct amdgpu_xcp_cfg
> > +      * rather than freed individually by kobject_put().
> > +      */
> > +     .release =3D NULL,
>
> Being embedded in another structure doesn't explain what guarantees that =
the
> enclosing allocation outlives the kobject=E2=80=99s final cleanup.
>
> Could you please drop the =E2=80=9CPre-existing:=E2=80=9D prefix and make=
 that distinction
> explicit? For broken cases, describe the lifetime problem and mark it as =
needing
> a follow-up fix. For cases where the lifetime is safe, explain what guara=
ntees
> that safety, while acknowledging that omitting release() still violates t=
he
> documented API contract.
>
> Also, do you plan to follow up on those cases?

Makes complete sense, thanks Danilo!

Auditing all 17 files in patch 9 with that distinction in mind:
- Only 3 built-in sites (arm64 cpuinfo, ACPI hotplug profiles, and
s390 sclp_mem) have backing storage that genuinely remains valid for
the lifetime of the kernel.
- The other 14 files either free/zero an enclosing dynamic or devm
allocation without waiting for final kobject cleanup, or are tristate
modules that unregister static kobjects/ksets on module_exit and can
unmap module memory before delayed cleanup finishes.

I've dropped the "Pre-existing:" prefix, documented the specific
guarantee or FIXME lifetime hazard at each site in v4, and yes, I plan
to send follow-up fixes to the respective subsystems once __must_init
is in place.

Thanks,
Ian

> Thanks,
> Danilo
>
