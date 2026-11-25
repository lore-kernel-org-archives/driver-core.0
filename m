Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795597999;
	b=D2zGLTd2ZFGCTicRY1D9PFtF3nj7l//JiE57Jjto3/MBheWF8ddBJbRPIh+colYDCVao
	 AhPs6zp984R+hnwAHRMqJPS+v0KRs5RQ8yQYAPNI8x7EYRVZDjxpmRmM3L6RSvOBdscSK
	 ZjGYrJtk9irrP84pPrSWIUUDqHPl7MbhP6FgRA0UJzdnnE2RchfRUZR9VIadKk05ZWMkR
	 Fs6RHM/BIr33rEZScX6zZg7bKCjc4N8vYoJ+SrMiRGCVaxbWm6qLddwy94CMqi2hD1keZ
	 HOYrHhGJJzVAP10PXjJDN44f9GmvT+DzKU+pv4cI9miDMz4WGV470micMzBH9xBLK9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
	b=g7R2N0MvYrAR+ak6v+9JWjUHuwX6Tvogq94dz15WIh2RyTn7pF9r9/uW7dnyRuVxAvg7
	 W28sv+i7UAx8O6dnBF13EMSEQfPGMfnHlqufa7OeBofuqqunOMdzJtliuo4dlkKEBOJgt
	 RHw/yXpMQ97N9Xqb8mJyTvORdaJUn5ZS8SNHf/KI9j7d/BseoJlzTZQNOMlsm6646ARLq
	 1dVNVvAScqluId+1g+aIuqAmmXixPsy/Fv+qmmbtr8lM0Sdv5NJwuoK/UIIVy56b/8gIU
	 /JKgB+2LdGKUUcB9oqhDOwfUhEgpnt6lEw7wyBtQe68k8Jr9A7q8QcZlHAsENiO7lBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNGtQCKE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAB3606A333
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 09:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAB3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aNGtQCKE
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53634b8328eso52841741cf.0
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 01:13:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795597998; cv=none;
        d=google.com; s=arc-20260327;
        b=JUraviWnEvm3RSxpy55EQm/GePNidT/PRa1Njhi/OjDP3ZC67ZdM4TSul61JUhE8jj
         /4d8f8u/wLyYaB8DI72hFqXyBq/xv5IwWQOcp9PhCbf0WL21sWCb0k+/+HEwxautRddG
         MtuTCEK1JTAFHJZLsxjVzTomSUh9lFmi+9cDSCM44EhY2vF8yAprIHsfGGmESNpY3v+v
         mFloi+8bl5rWh+f5mBmqG4KYwEM+H1PpyhEKSKHnPQ8+dhdMq3B8cBXtvl5HgY9pznay
         5veXPl6xbLYZNucCmtxIJ01TSjGjDfgFr1UqqcBF0Upeps+1DmyLdSOWBUnEkd7SjNlI
         7i6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
        fh=qJBQES9xU0MV8nmBdu03P7N52MAvI/l9Byj/hozWqBE=;
        b=nrpmBd6Km5k+g7MYSNh71EdCjalCLBtzDDmk0etTNHTi61VdV01qlwzcqvGbmtsDcR
         vYSQMpT3NvLUqVDh0lRotCtGT5gpu2DAOJqk2QhAuq42a+tWaiNVdgWmObVbMX5AHMxO
         q9EpxCLa9tEEAEjlT+GfJJdqJQJuphwmqhd8ROeGWZbSODVibGmfa8ZKkPDuHqBKBmCj
         DEznPw7/lVfe7OMmbWW3tdLrBjdoaziPMI7ulP1Jxmwjdonvo92e9SwP1zQshauMy8p3
         VpU8vO/UUi7eo/+qLx/pnCtHRRSLWNQ0ezSnulK6/flUyHa6yJ3R1EmeLcc3Nq5vgWnM
         EN1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597998; x=1796202798; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
        b=aNGtQCKEAJN0ukxXF8m5uVg5C9ayXxLFcM3kLuUZVtcrv13WH9HxyLcDh8e2jqllo+
         5pdTBB8GxlCcNBD7rOP/HEpbaXX93W3Q014TL78yCdqQM8lTB+v+FyvpewtFfBe/CGCh
         jek2qcvK3rp8XibZ6sdblygwuf7iuwl5pH4EJB3TFse9Ma5I4FUM6QQDchlti/XaRbuE
         ehJXvuzjQTNc/qNziaee9/3yzCWubhPhYHwwKeejWZ7XqDNNP3wTvx4vT5s3xbKUUXLq
         hLpYiONmrSzZtDUGW6ESL08LPXw0h665kr0F+bjjpwoQBdWdFhi4hq1h57EerMn+RVOI
         GTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597998; x=1796202798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRz68tdfn4TGisWgdo2hcs3mIZ3ELB14oWICAHVfZ0g=;
        b=j38b5CBFmLuf+Lspk/+Ac8S+30gfjn53Qxke3dm7VmBUSENMksiP+6N9+PQYfHN4T9
         uzvHBNC3MsU7eGMcfG53ICKRU9/Wmd05bhobWir/Fk4qYYbpZ3TT1M8uDjbA7VIet5pL
         uwaFO7GjX7zZP0WJyxUP03L5zu31OfsUBnPOQk9EJpKYf0GR4a1BaOdS71Ifz5jsNFuw
         7SK9U56pqBmVGuUhdhYGd4JAMk0SMyh+wU0W6/n0vXAv6zWPZTQbYLurXFCGDbq/a3Gg
         3k3PCz7QipIM3s6gxwZfygZoj3zzbKQd3IL3Xx6rJh4ZdmnyVw+E0OQr6xSPF7V/u+Lz
         +4mA==
X-Forwarded-Encrypted: i=1; AL+hErGMg5BEQD4pmbPk33QFottkY8/ynt7vltonSP+GNxWKXzre6uMkVFbVBZZ5+39io2U3r+9uQinQc3XTbg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/aUMwo7ejaGI20MepNo98iRvS2fKfB3KNhxI68isL8qlqX1nE+
	Sw0ZvDHOIxAElaNRsyCKg0zQZdwjFFAewmyHHEdGY+/x3/K0h0lyCyEMJFQpY61LE7Z90Krp/fH
	xaNUWiQOpBs6y5euSOFkgvHIBqdPGe8U=
X-Gm-Gg: AZFdTZdXG8k+xOTVH/zMuU4pNYSQRDuxYYUQ1TZVy7y2lsf5tCA0gtUksqmqdVCHl4O
	IMy1BynVgQH4+C9SLVlFd169t0SOsqvfRb1wE+d6xOYK2cHrHSa6YwxxASC6baACvX3LKCI3rOx
	2HmczDFAnQbuUijhWgj0wN/Zun7fmPafHe9sizGhxmmyI58nYqjddwte/T31ki18QJ2Wa5MmRiT
	J6xqBbj6XniC/ZZpahhT/vw6rLXWoFhQROCwWF/GMqs7wqt6k/IaswKBAvQaOyH2gHNMF7pGC60
	rwTcmZW7I2tirbeh0merbo2tCIBHO0G1KtghPJq9JH6kKRdm+Z+M1wqOZC4iVuYY3K2he81fkU0
	7QvMnWpJNde4BqK8AMWKxDEcs0cbIoey2a/+RHw==
X-Received: by 2002:a05:622b:283:10b0:55d:846f:ca79 with SMTP id
 d75a77b69052e-55d846fd63dmr196434691cf.55.1795597998017; Wed, 25 Nov 2026
 01:13:18 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795426787.git.caoruide123@gmail.com> <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>
 <2026112301-jingle-multiply-c72d@gregkh>
In-Reply-To: <2026112301-jingle-multiply-c72d@gregkh>
From: Ruide Cao <caoruide123@gmail.com>
Date: Wed, 25 Nov 2026 17:13:08 +0800
X-Gm-Features: Aa3M54o65lMpJ4o_dEHDRpARkVHBRUf-4JdPMQgcl94JF9PJoJIOfS7VpbR3FMU
Message-ID: <CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nMSxYQ@mail.gmail.com>
Subject: Re: [PATCH driver-core 1/1] kobject: reserve an envp slot for the terminator
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ren Wei <weir@nebusec.ai>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rafael@kernel.org, dakr@kernel.org, 
	johan@kernel.org, akpm@linux-foundation.org, kay.sievers@vrfy.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

You are right to be suspicious of this one, thanks. v1 was not good
enough: the "- 1" lowers the limit for every uevent from 64 to 63,
including events that never go near the usermode helper. In testing,
a currently valid 64-variable event was rejected (with the "too many
keys" WARN) on v1, on both the helper and the netlink-only path.

The underlying bug is still real: when env->envp[] is completely full
there is no slot left for the NULL terminator, so with
CONFIG_UEVENT_HELPER the helper's envp is not terminated and
kernel_execve() walks past the array (KASAN: strnlen <-
copy_string_kernel <- kernel_execve, then panic).

v2 keeps the 64-variable capacity and instead adds one dedicated
terminator slot (envp[UEVENT_NUM_ENVP + 1]), writes NULL after every
successful add_uevent_var(), and also after zap_modalias_env() drops
MODALIAS. struct kobj_uevent_env is kernel-internal, so the only
visible change is 8 bytes.

Tested on 7.4-rc4 (b6a9fa34ce41) in x86 QEMU, 2 GB RAM, KASAN,
CONFIG_UEVENT_HELPER=3Dy, systemd-udevd 257:
 - unpatched: reproducer triggers the KASAN report above
 - v2: no crash, no WARN
 - exactly 64 variables: helper receives all 64 followed by NULL;
   netlink-only delivery unchanged; the 65th variable is rejected
   as before
 - boot + udevadm trigger/settle, virtio_net unbind/bind: no
   "too many keys" in dmesg
 - unbind with the helper enabled (MODALIAS removal path): envp
   stays NULL-terminated

v2 is here: https://lore.kernel.org/all/39d1eae0d7c8b235f5d4b68d94205b70832=
ab786.1795506878.git.caoruide123@gmail.com/

You mentioned this "simple" change caused problems before. I found
7eff2e7a8b65, which reserved a terminator slot, but if you meant
another earlier attempt, could you point me to it so I can make sure
v2 does not repeat it?

thanks,
Ruide

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8823=E6=
=97=A5=E5=91=A8=E4=B8=80 20:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Nov 23, 2026 at 08:16:37PM +0800, Ren Wei wrote:
> > From: Ruide Cao <caoruide123@gmail.com>
> >
> > add_uevent_var() currently allows envp_idx to reach ARRAY_SIZE(envp).
> > This fills the final pointer slot without leaving room for the NULL
> > terminator expected by usermode helper consumers.
> >
> > A synthetic uevent can supply enough variables to make this happen.
> > When CONFIG_UEVENT_HELPER is enabled, kernel_execve() then scans beyond
> > the array while counting the environment and may dereference arbitrary
> > data as a string pointer.
> >
> > Reserve the final slot so an environment is always terminated.
> >
> > Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struc=
t")
> > Cc: stable@vger.kernel.org
> > Reported-by: Vega <vega@nebusec.ai>
> > Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> > Signed-off-by: Ren Wei <weir@nebusec.ai>
> > ---
> >  lib/kobject_uevent.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> > index 1d29378d4f55..f7aa67d6ee54 100644
> > --- a/lib/kobject_uevent.c
> > +++ b/lib/kobject_uevent.c
> > @@ -673,7 +673,7 @@ int add_uevent_var(struct kobj_uevent_env *env, con=
st char *format, ...)
> >       va_list args;
> >       int len;
> >
> > -     if (env->envp_idx >=3D ARRAY_SIZE(env->envp)) {
> > +     if (env->envp_idx >=3D ARRAY_SIZE(env->envp) - 1) {
> >               WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
> >               return -ENOMEM;
> >       }
>
> As "simple" as this looks, I think there's been problems with it in the
> past.  Have you tested this?
>
> thanks,
>
> greg k-h
