Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263409;
	b=FiFCCbn708EAyDWqdYdMnADXLIZbZ5dCZA2QG8jODBWJCrdO+Q2OIfa+RTUh4Zc0ckaQ
	 8Y7XaNod/5vTtnItZ2ad0MsL9CMsvP3RQMnhAF4VnbrBDL6+tSaMAKUEaDDFqnXtck4Ax
	 apMHHlsIppkCQwzjyAfgP23UKWqgIWJvOfzbWwHSo2oWOgoc0xwJB0ldHKwhRG+JaONQc
	 nH5RxPdoi+XqgK0AZDL6LIZyIf/kArKP0NYb80NBbUwhgy7IlDzt7GVfA5MlkH6lFmqfO
	 ogcUYHifGLbY/35bYTqcymMtAMRU344OjWTtjRHYwrxwSgGmoxXhkO4iSoDaw84Q3kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
	b=vg0rwG8yhQSMqUTbjS9Ylf9FknuMdZnLbSEcSGsXKfJcYmL8dByVPv0dMW/f1YEP+qx5
	 AmqUMM2TLkNLj+3w0hrlT2OjP9ryFH0Kc7874ZGs2WFhIPEW8W02aKVmhgn8K6N4Pd3k9
	 RndKSlpkPpUs2CvesNAaWLpIOnJgLZKUxAua/CnmxpAuJMFw6AmFjnw+A/G24fA0ia8I4
	 chuCr0j1FW0AucbGQOlD7AgxR1YpRywx8HCs41N1vl24s+II0E5vDZZF4RgkFN6k1lq1Z
	 vQaBx/axBafTypp5ZxL9WzzQA/yeXwXMCkocm6c/MueixV8Vpa3XgbCnv4B/j/62DEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZP90t9oh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C314606A332
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 22:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C314606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZP90t9oh
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-535f598d126so39621cf.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 14:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263408; cv=none;
        d=google.com; s=arc-20260327;
        b=YuyrLSEcGSHvSfwGoTP96flOCozDBrUr/T3zeR1uLLrPln4Bin1dU+SMwIL/L0R04w
         KGinbrT1mV/4KilT5I8wgqpgdzoKHIaR0pYLg1O8GR6IOI7XsR/3BwVKGj+3GGmQinh8
         f/IuEGjAeaXoEz0PEc4pFShOz2e8LgPapAa5q4DalyCMGcSrYfrzAEG2F3d1pYTLzWyf
         XkLd7aarWY7ta6PeDyIOon/DZE3GUua25HPL1z1+elkVdtbzK64+kn+koGJ3MAHBWFTY
         9+htmghHamRNPd77Puja8rMY6b6lFiWOgaHK0wfVB9clYwo+EA4VK7I9RKbI95kB0P4K
         HUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        fh=70M8FTkMwjeKyTJ8PAUEFAD2ysfE3hkpC/4OZSP2NRw=;
        b=RF3cNXDKrFibXAfC+avn6/i1nClgBy00+t9qBtzh0t1S6R1gqzPIpbjOH2aMofyHxq
         GjZdJHcXbM065X8cv6TQh7v2jkNcNTaX+zCT/XM8ldeq3gE83QfixRGoGJHWUuRiDT1o
         KHNDcoPqy7w4zMA99OEvQxkTg250Lddz+h+DrgX4YFssoxCpcrieFeaszrDk5IdFWrix
         nsdPAP6GrdZSMW6PX8KXT+txycRQDYTxv3fmUbwJ+HQpNht4mv/ydzYSZWf5brYRnM5c
         7VjD+QqrEfLQB0QdfkQsvRBZS4TxIHPxA35U/+8sNa+R5Wa+aMxxZteDjoklMmwRAKAh
         o8hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263408; x=1794868208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=ZP90t9ohYibqkOp9Ohy3ox8XtEh149CAjReevbDrcEGSs7rdWPli/f26c+TCc2ar41
         7Po2ccGGcka/LYJu71k+QmIf6Vrutw7FTWWW6EZUryewggAsDLhDDbw/HbTJUBioynma
         weamWxMNU3YSowEX3kJlnQKFzpR8zFsHVd8fgvlEcSez5YHCYTwJ51HUIyZO0Ilh32Z6
         HnMHgvWtg4zv7yPqxqutPGfmtCobQFKY/NbtrPbG+NXWqLRwcVqCPyToE1w8Gedy7Jkc
         dmLUY6g06mye5MECRaC+ZFebseRoVBGZxEX8ESPvlox5eHTAQSdv/41DIFfNTEaEQTbB
         OT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263408; x=1794868208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J9qhUwfhfejNNDnNi/t39zME3R/+tshu3QmKCryWs=;
        b=rNCXOaCF0uOvg5Va9V0mSiivY3mDyF7RObfnpooydWl7dif5qa4N6lwqkJfOPIcOar
         D5RRx2NUEdmZYv6YJ9wy7IYuKTvtvowW/z5uOTi2Y3D7pJJD1w+QGdyTQkVetFbO1f4K
         +/H7LqA4y3gtmtCTuBHhtNAdAJQQVoJ0Z1XgL/HtWLIWkW/peMGMPuc2A3KwvqTnZO8N
         vh9Ltj/gRt+KvCDdFU9PXyeyEQKQ6hdR/s8ru0BRdCt1HPeyStJi45pkbt1kphvB/+4q
         xGkTPQn1+MgJHL9D7MpbyftlIeReJLCQVFMoVr0gsuvGEGAJwfR/cjHAmmHI1bgdEO1n
         tbzg==
X-Forwarded-Encrypted: i=1; AL+hErHdCT/u0EHDLMEiDaWH85diLuR63+x8UBWT/Iras34XVtqql+PD++yLcLfhVcW7yrF5EwV1kQ/feZZprQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+gdrHwVMymk5Pxyoxi5HZoTNzE2VrXi3T0Lyh8vSPEvu+WgY/a
	21IB8Nw2WrBS3GQ7ybonECLUnxQ7SCMLsOcSLJ0pOC/5cZjLA295e/qZjYHKuaHBAyPQFTRQwv3
	yTVFh6L65Wga3Xyzq9DtrfnZeghesQyYDcsaw58fs
X-Gm-Gg: AYBFou0lyGC+TSMKdaq0HQPW0pYNwBwxqXdcxGvd65ydGvFNNn9kpPfZuF1uKOQz9Z1
	DsOt3W4IWV/eSpltmsASNvA808rrgn3dKe/w3jQ9KhN5cP37Isv6H73GXLRVcNutSTIPFoqpjzU
	iji3lY/HlG8smqQCOJ/v0jMKWsjhBzwMHn0Lert7HNIYk31CIwh+B80POp7rdBBEyUvMiE1oKkc
	+x8NWssQldWn6r2//qXGduxkIQS0RT3ZxJlBgCp/LitNg4iUo0wV0hd5O152b+LNcLXqHsuMHGU
	nVwl++MrELPqfyEyVnAyKvFYdiUMNa5OGjvOD8ucy548gBvA3GQcbJUJdUvU6t3vxZ+mTTfyY66
	rBPPmxsiQjA86T/GIQQgHJtQ1tx+vEQ2mPFSBCOqrCm7jt7myr0S3fvhMUslJ/xhvtFY=
X-Received: by 2002:a05:622a:1b16:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-555290bb288mr6464421cf.0.1794263407457; Mon, 09 Nov 2026
 14:30:07 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-7-irogers@google.com>
 <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
In-Reply-To: <b8d171de-52fe-474e-96db-d119840c6240@suse.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 14:29:55 -0800
X-Gm-Features: AclHuK-dlWDp0B4FdK6V9QBR5LM_sA67_T-19O3ovPwDJ5RdBpzojQ18ICzxF_E
Message-ID: <CAP-5=fXd640kfaR+soPdiEV2mfqCPGDANCt04KzaXBphYP4Htg@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
To: Juergen Gross <jgross@suse.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Stefano Stabellini <sstabellini@kernel.org>, 
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

On Sun, Nov 8, 2026 at 10:56=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> On 08.11.26 23:39, Ian Rogers wrote:
> > hypervisor_init() in drivers/base/hypervisor.c creates hypervisor_kobj
> > with kobject_create_and_add() (which allocates a dynamic kobject using
> > dynamic_kobj_ktype), and hypervisor_subsys_init() in
> > drivers/xen/sys-hypervisor.c then overwrites hypervisor_kobj->ktype wit=
h
> > &hyp_sysfs_kobj_type, which had no .release callback.
> >
> > Add hyp_sysfs_release() calling kfree(kobj) to preserve the dynamic
> > kobject release behavior.
> >
> > Fixes: cff7e81b3dd7 ("xen: add /sys/hypervisor support")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >   drivers/xen/sys-hypervisor.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/xen/sys-hypervisor.c b/drivers/xen/sys-hypervisor.=
c
> > index 91923242a5ae..0e8a2cd69fd6 100644
> > --- a/drivers/xen/sys-hypervisor.c
> > +++ b/drivers/xen/sys-hypervisor.c
> > @@ -659,7 +659,13 @@ static const struct sysfs_ops hyp_sysfs_ops =3D {
> >       .store =3D hyp_sysfs_store,
> >   };
> >
> > +static void hyp_sysfs_release(struct kobject *kobj)
> > +{
> > +     kfree(kobj);
> > +}
> > +
> >   static const struct kobj_type hyp_sysfs_kobj_type =3D {
> > +     .release =3D hyp_sysfs_release,
> >       .sysfs_ops =3D &hyp_sysfs_ops,
> >   };
> >
>
> Wouldn't it make sense to have a common function for just kfree(kobj)?
>
> In your series there are 3 instances of .release just doing kfree(kobj).
>
> In case this is not wanted or with using the suggested common .release
> helper you can add my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks Juergen!

lib/kobject.c already has a static dynamic_kobj_release() that does
this (and there are ~15 other places in the tree open-coding a static
kfree(kobj) release wrapper), so include/linux/kobject.h +
lib/kobject.c would be the natural home if we exported one.

I kept them as local static functions here for two reasons:

1. Patches 2/9, 3/9, and 6/9 carry Fixes: tags, and keeping the small
   local callbacks avoids a dependency on a new driver-core export for
   backports.
2. Since kobjects are normally embedded in a larger struct and freed via
   container_of(), I wasn't sure whether Greg and Danilo would view an
   exported kfree(kobj) release helper (especially alongside
   __must_init) as an invitation for misuse on embedded kobjects.

Unless Greg or Danilo would like dynamic_kobj_release() (or similar)
exported now, I'll plan to keep the local callbacks for this series
and can send a follow-up cleanup for the tree-wide callers if
driver-core maintainers think a shared helper makes sense.

Thanks,
Ian

>
>
> Juergen
