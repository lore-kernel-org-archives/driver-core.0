Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802711;
	b=bTsHNpsZNBFIvUJgFpdsKnN8Sbb9fhGH4zjeHcyDupqfTVhofigdNiLl9JtGATVNHISW
	 AJ3Q95NbaCAFeiYM0FlxMrm1xkldUNKf6B6fr09r9oTfEOMuAJpXAs6cYZPk6Pim7A3cU
	 itJdvgpKEeFbw/RoEyUVyBmSX4YHIBTiggw3mG0cSn8xmr6BBN28sNmtXPlT2NWx3ecGQ
	 cvvb84BwlkAd7k7ibF0BV9CuVR8kOrAU0TPw8HMTUAVi1uoMKcX5RM8VvyLDET0DVtBX9
	 kfwGPh4Ly0I7GrbmLaOndGYO7hgOZ0wThBq6ME+6SacGpxt+pHwvdwKP9kEhmkzFCBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802711;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P5XLAaKIkscCwZ6c9zloBpdt8j8gnx89KvwjeGIRZ5I=;
	b=KhHx0oHnnD6soXoR0TTfpPzPps/a88kOpJPG5VA/W2d1wYdIeyKNMppVbUs8NDxWc2PA
	 vktg5Jb5vGkZJVgOXKXzLxcvs/cYSIUem1L0deEkobWG6B4yJi04XdRn5HTwi6ZvpKyU3
	 KSgMncZY87S9oaxWrXostIlS+3friCWVl9ekJllbzfg50tMm2ABddcvUfvfHw8vY8/3gw
	 sUKddVOEbSKrTUlzLpn33KVJ9UnqC5uUiNDa6XtMd9SGqnp2theeAALkY4lKV+S2fJCds
	 Vaazy4zV4gBpGCf+HkW/eNWLYi5CsUCDBqKJC4kcg9ao39Z7dpgr9n9i45CTASUWHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exvVGEYg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE3A606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exvVGEYg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A531F00A1A
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802710;
	bh=P5XLAaKIkscCwZ6c9zloBpdt8j8gnx89KvwjeGIRZ5I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=exvVGEYgp84sROMnw6GjJXbOgr9MJrHEsYlo4klmoFSe2Mp6COnea1qorXXU05WoR
	 M7V4bRoFcEh+SESMfWUaKB+NCKGbbL2DlhmPcjzdcZzCCSLMutssLfmd+aEHJ9c2zu
	 MZ0k0UvcusPLl2kgl5YUyuirMA7ljFF0nH/fAGeKGtntBQH9WjDePcZDGfuVtlpaGN
	 worNrbj9vw2HtJaaEzIClwQmC3zxSyyboMErkdgApiVBiTfnoG9drPHqVxSarOed1P
	 T2QI8I/JhX9H18BctNPwrUkpnm+QeLT67qpz9pP28qd+KFzydJAXY01XkpaX2b+VMz
	 0DlOoZ5kEbB0A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so564991e87.1
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:31:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxVxD/+ottfvUaVUdL4KMdICoRZoAIYu7+DEyNOXyt7MH/ZsdkTAn212JAfe2h6k2WJ3VCdLBxw1Ai10g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XQ1qr0XZ8mdDd7BDIzS8JWSsNa5l1ikHHLOMFkm0DtQ5ef6Vr
	IzAgm2dvFYoeKPiT2tNQ+P8iOUKk3ASJ7HEHLHqc+YidYaS82Q89SgernoKxbiI6zLq+n1ggOxD
	gXD63J/J69f92rNkkCaGAotrv/4d+D74=
X-Received: by 2002:a05:6512:31cf:b0:5be:54ec:67bc with SMTP id
 2adb3069b0e04-5bfd951d6f4mr5251169e87.1.1793802709192; Wed, 04 Nov 2026
 06:31:49 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104115641.2682786-1-zhouminqiang2@huawei.com>
In-Reply-To: <20261104115641.2682786-1-zhouminqiang2@huawei.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 15:31:37 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jQPSZCm4AkG4NGqjwDozCMNYqBqZfVB-ARvoOLDQGtow@mail.gmail.com>
X-Gm-Features: AclHuK89ctrRee1WXlR909UHC3f9KN36uXNGEkj0eWd7jhpP0XSbWOPOSUP2fRc
Message-ID: <CAJZ5v0jQPSZCm4AkG4NGqjwDozCMNYqBqZfVB-ARvoOLDQGtow@mail.gmail.com>
Subject: Re: [PATCH] PM: runtime: Fix check_flush_dependency warning from pm_runtime_remove
To: Zhou Minqiang <zhouminqiang2@huawei.com>
Cc: rafael@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org, 
	bvanassche@acm.org, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chengzhihao1@huawei.com, yangerkun@huawei.com, 
	yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:05=E2=80=AFPM Zhou Minqiang <zhouminqiang2@huawei.=
com> wrote:
>
> When a WQ_MEM_RECLAIM workqueue (e.g. iscsi_ctrl) triggers device removal
> via device_del -> pm_runtime_remove, the unconditional flush_work inside
> pm_runtime_remove can trigger a check_flush_dependency warning:
>
>   CPU1: pm_wq worker                 CPU2: iscsi_ctrl wq
>   --------                           --------
>
>   pm_runtime_work(starget)           pm_runtime_remove(starget)
>     spin_lock_irq(&starget->lock)      __pm_runtime_disable(starget, fals=
e)
>     request_pending =3D false              spin_lock_irq(&starget->lock)
>                                          (blocked, CPU1 holds the lock)
>
>     rpm_suspend(starget, RPM_NOWAIT)
>       status =3D RPM_SUSPENDING
>       rpm_callback(cb, starget)
>         spin_unlock_irq(&starget->lock)
>                                          (acquires lock)
>                                          disable_depth 0=E2=86=921
>                                          __pm_runtime_barrier():
>                                            request_pending =3D=3D false
>                                              =E2=86=92 skip cancel_work_s=
ync
>                                            status =3D=3D RPM_SUSPENDING
>                                              =E2=86=92 enter wait_queue, =
sleep
>                                            spin_unlock_irq(&starget->lock=
)
>         cb(starget) =E2=86=92 0
>         spin_lock_irq(&starget->lock)
>       status =3D RPM_SUSPENDED
>       wake_up_all(&wait_queue)
>                                            (woken up, waiting for lock)
>       spin_unlock(&starget->lock)          spin_lock_irq(&starget->lock)
>                                              status =3D=3D RPM_SUSPENDED
>       spin_lock(&parent->lock)                =E2=86=92 exit wait_queue
>       rpm_idle(parent, RPM_ASYNC)        barrier returns
>       spin_unlock(&parent->lock)       flush_work(&starget->work)
>       spin_lock(&starget->lock)          __flush_work(from_cancel=3Dfalse=
)
>       spin_unlock_irq(&starget->lock)      check_flush_dependency()
>                                             =E2=86=90 WARNING!
>
> Replace flush_work with cancel_work_sync in pm_runtime_remove.
> cancel_work_sync internally calls __flush_work with from_cancel=3Dtrue,
> which causes check_flush_dependency to return early before the warning.
> This preserves the use-after-free fix from commit 29ab76827761
> ("PM: runtime: Fix a race condition related to device removal")
> without the warning.
>
> Fixes: 29ab76827761 ("PM: runtime: Fix a race condition related to device=
 removal")
> Signed-off-by: Zhou Minqiang <zhouminqiang2@huawei.com>
> ---
>  drivers/base/power/runtime.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 335288e8b5b3..31537b745c81 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -1895,7 +1895,7 @@ void pm_runtime_reinit(struct device *dev)
>  void pm_runtime_remove(struct device *dev)
>  {
>         __pm_runtime_disable(dev, false);
> -       flush_work(&dev->power.work);
> +       cancel_work_sync(&dev->power.work);
>         pm_runtime_reinit(dev);
>  }
>
> --

Applied as 7.4-rc material, thanks!
