Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8D314A60
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 19:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797744; cv=none; b=qmXfdfik4bhQJRHHIliswjGdGeFGCRWOuVnmszDr/h/YP8VMSlbjSuXcNjuO155PD/PMExy4NUqhf+J34fMVXa+f0cs6a/2JXzFpoWJDxW501VCj38ZrMNoAkQnxdlURTM2D4WxkI/5gV55ym+eAVXHSfUc6NhxQC4X6BFcAgCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797744; c=relaxed/simple;
	bh=myQqBieHiWKiOjMnQIC0ziq72zmXUUPZFf9RyzdeKJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUeMz0yNHWYInEmHNTcsYiRk9pek9JMZWpT1BQ2GZ98gSy8Ho9jlHnTgfPwKymqu3GuZYFSUpqpr3Wzh3+DRuvlFMmEdnyJj2dvGh6AMylVXvg3pg2AveEyIwvYsfpajaH/3M2uZ+PhAT13l39UKacU68HhuWMt7+0RBZL0UmJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ6v8ZXq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ6v8ZXq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F171F0089B
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 19:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790797741;
	bh=709ZP/ZOeKPQAyWNpel/jI0FKMQWx87Cu/pwLT9LTAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jZ6v8ZXq69oNgakWf1hdF/FkURiv5tiMG/EbqbFI3XUmNrcsJLaOQxI6+AAE7Cm+p
	 ES1ma1y3oUqa4oNBpuCOE51Cgf9Ps5TDN2NKOTY329VLWjKx+jzSTuK/Y+3uAOaoe/
	 1cu1wkaJ2N9WmYjMXfl/rmi2qprrw7lvlzCarU3SbO4TOFz+jj/96FMgnFY84LBY8K
	 MKL+ABu2vxwVsX/nnzewIrmbfi+yktGXsLI7wrXoZYxDbGlfb+UzW+9/VohUDUFpLO
	 /8dSO0Ysd9xpBVsLa04BHkjxghw6sbCxhRhZSVIUKiRoSTrK+r0tYPIMMtGPcahOab
	 HZcTuKs+APfrA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba44044ff8so56662e87.3
        for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 12:49:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFDHdDi22+QPYewzXYs6ywf/a5onSB+JkNpdgSVib7RzhNzq2HqWXWlKa3utyi7B436OK1q1u1Y5ugTQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJwgfxJNE0pv0cCn2mkESsSJ7qdEQvFaWNkQMGkEgqLubX6I3OI
	iyT52LEELq1/LGehF0bAEEuflCisew5ryaVm/IXZGmthgVWeMjN3SorRZRlqXfvExwCvz7lRIj8
	PYXzhMywLXEs05+Q2QuyTwI1y/Th5vZ4=
X-Received: by 2002:a05:6512:31cf:b0:5b4:7d9d:16d7 with SMTP id
 2adb3069b0e04-5ba405fe2a7mr1006578e87.11.1790797739431; Wed, 30 Sep 2026
 12:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926225555.2916525-1-mario.limonciello@amd.com>
In-Reply-To: <20260926225555.2916525-1-mario.limonciello@amd.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 30 Sep 2026 21:47:12 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h0S1vBBpmwzdR_cOJrYPCAYZGAUDAnGtftyJtq6_3jSA@mail.gmail.com>
X-Gm-Features: AclHuK9Ps7GYqYQfIKz69y37zF1XWPcN95R_tBi7HKNRISplJrjhuorL1ZGcubc
Message-ID: <CAJZ5v0h0S1vBBpmwzdR_cOJrYPCAYZGAUDAnGtftyJtq6_3jSA@mail.gmail.com>
Subject: Re: [PATCH v2] PM: Add resume event mapping for PMSG_POWEROFF
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: rafael@kernel.org, pavel@kernel.org, lenb@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Eric Naim <dnaim@cachyos.org>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 12:56=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> From: "Mario Limonciello (AMD)" <superm1@kernel.org>
>
> PM_EVENT_POWEROFF (0x0800) and PMSG_POWEROFF were already defined in
> include/linux/pm.h, and pm_op(), pm_late_early_op() and pm_noirq_op()
> already dispatch PM_EVENT_POWEROFF to the same ops->poweroff*() callbacks
> as PM_EVENT_HIBERNATE.  Add the matching entry to resume_event() so that
> when a poweroff suspend sequence is aborted (for example a device's
> ->poweroff_noirq() callback fails and the PM core rolls the
> already-suspended devices back), those devices are resumed with
> PMSG_RESTORE and their ->restore*() callbacks run.
>
> Map it to PMSG_RESTORE, mirroring the existing PM_EVENT_HIBERNATE
> handling.  This is correct because both events suspend via
> ops->poweroff*(), whose counterpart is ops->restore*().  Mapping to
> PMSG_ON would be a no-op: it is what the default return already yields,
> and pm_op()/pm_late_early_op()/pm_noirq_op() have no PM_EVENT_ON case,
> so they would return NULL and silently skip every resume callback on the
> abort path.
>
> This completes the PMSG_POWEROFF infrastructure needed to support
> differentiating between hibernation and shutdown sequences when
> re-using callbacks for common code.
>
> Hibernation is started by writing a hibernation method (such as 'platform=
'
> 'shutdown', or 'reboot') to use into /sys/power/disk and writing 'disk' t=
o
> /sys/power/state.
>
> Shutdown is initiated with the reboot() syscall with arguments on whether
> to halt the system or power it off.
>
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  drivers/base/power/main.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index e130da4281410..2ed687e3e6b11 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -1471,6 +1471,7 @@ static pm_message_t resume_event(pm_message_t sleep=
_state)
>         case PM_EVENT_QUIESCE:
>                 return PMSG_RECOVER;
>         case PM_EVENT_HIBERNATE:
> +       case PM_EVENT_POWEROFF:
>                 return PMSG_RESTORE;
>         }
>         return PMSG_ON;
> --

Applied as 7.4 material, thanks!
