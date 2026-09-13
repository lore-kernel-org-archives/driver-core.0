Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B573403E9
	for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314426; cv=pass; b=C9+qXVZCRDLNMZo5xm5LEJFMvlxgIShNxX9Kkz9uwXb1dSKeG+XtQH+OGTUDgH8qcebZh4PjVIQTfqnlm8XRJ/H31G+c4kv9bcWCbTSY1NtN3eevciRp6+uU1Q//GB3MSkbyyKYjoeD9bhfTDhM7NZw0qRqese4Zz5j2fSFCkoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314426; c=relaxed/simple;
	bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7KU+n3wS4x++ofxBUhl1z2UmwBdwq94kRBtlQ55RQ6kqlzLOVxPTPDudp4Kv42mPqLGE06ZdGuIMevmKA2RGOiTNI/Tl7Ux8seAE2zwWOGClH0y2+Gw4qjfaphUg1Chh16J+p0BNzVcYbhYLac9mruhYk1mjBBpraUjKSG5SnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQAAOqj4; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQAAOqj4"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49a10ee5aso7710731fa.3
        for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 08:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789314423; cv=none;
        d=google.com; s=arc-20260327;
        b=LTZp+4bCc5w4xoK4S/Gf326kkTirliJFocEupUsD4IIrmczqcYvteEHfchQYMbMup+
         YdFIGP0Uo6rcal3Ksr2liCvPVV/X0JE2DZB0cNBaL5Jb2YI2TBuvS71JKhwiSyvrGh3N
         XOgoOU0DzpQp2loUcn8KslGITG6Pu2lOOvpOpF6tCuU7/D3KpUhWOiUfAu1G6/zbe8CZ
         t7tNHYugkEiJQzrbnH1wQ2d4oO3VtIYlGnqshBer1E7WDtTurIQdNd7Pe/F++yYvubuf
         rsORT6RpMTFrjj7PKH+T6BrcL3pzpvLrHbqzfVJuNS7pFfZnXGAgGGc04V4qofnf4T+V
         g0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        fh=7HBV2VNjcN/ECMMVotgWPBSDhMfRj6b1qIXrda1wL3o=;
        b=tALVVQB+iHSNimvIdPU8gNEGfWmZPSJb6PQ7LQdgt1RixritfrMHc4vr1moimr+PWp
         YLsVivhEWrXXyovfmDsnF1ld/SiZmykOlifQvVETQu1XZv31qg2tkmRSSgViVmYfLK2w
         0ojSI3/oyL6LVzwuivPDfi/bhn0rZrdfMqIhoqONrHthC5a94XFdJGQnLodB9sb0InUG
         9Heyh7OWhiYijosbe5tGY5jjKxRzxOdVo0zqbaUvE3b9lMkbhr7lHhwb4tiuu9PWCOcs
         iYiR5ltcmNOHyj1IH8UlaJXvHxEWHnlTIV3ha2lfRQWV5BAfSTXNHXdRoXM1Lhj0sleX
         f4DA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789314423; x=1789919223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        b=UQAAOqj4Tv2foHFQLO/haUYNlMien6xTIWUSlHRh7KUONDcsR0MgJ43F18sPcnPnbx
         pg33lHav69AjJl1FFDCHAqhOZGzpjPg4NHAUbdEBJo19LC0lMCgnAwz2zPLOOcXR8Lko
         35iEYfaS2TeBEm8xXrAnwFXjhoyOhGGeqI7U3vuALRSmdlw/RIwkYTXQcZUWesXAr5be
         PM2KwXN6ToLI8EFK97OV3bevT0BvcIhCAILZgG7KwKNWYbbHdEJaSrd0aR5DYbfPPyqe
         xOHS3WxHaZ4V149eJGSzfnZk4IoKlY7mA4y1ZBjq/I78NsBtMGkgQzdBfbqEN8k4r6gY
         MrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789314423; x=1789919223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFkEvrKDNmPhRyOa4UUB93A5JAqNiBMds7vZAclPLSg=;
        b=V7DZznfehVpdA0ttqvNnAWBhEJ8tlZi5m6ivCX3/rff4JAC9u3QPu34SQ5R5GsPTc7
         S7be0lKQ5jL6rk/YDeqbPxfwi6sEXaqFUZFTgPGZGL8TVE80t3ayO5FNIm6ngyJDF0fc
         MITgRgzmkxAhFRgxk6HqpnqKSgejCM+Ai5Hv6T7ualaKVr+QNxrDJYsY5DOY0HOdW/zo
         hp7zxaLAAZbpOmQMlvZmOx8fivgEad9xnE98WsfUQV1Otf9SJ1RbW5kT2dThCXBExmVp
         oqYa0K6tyfGR6Z6eJ1zcyqLJAF5mcjgNjaj5mGIjFGqNNsYbH9N63zTrsp4kQFxy2ky9
         wjLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQEIcWzQ+hVsLUyjlYb7ozDG4B/UR+KqOWUMhQVotncZwDd7OH5pva8ag+pQnafigYaV3UCjKvFZ+aFg==@lists.linux.dev
X-Gm-Message-State: AFuF++l78HuX3HQVZ74tHzCqjrsAsM3SQVxWkwpDjHthEcrnt3AiDUID
	vWvTPIWSCHe4L6j2g5HwYK4+b4vArbgJfnuKbzoulWPr0zCeQXnVpNxWIeTB5kcuGfeZ2+1aW2d
	nULA1NcGfGGt671ji9BGw0CtmXZ2EgJ0=
X-Gm-Gg: AYBFou3uLvGLKDUXTMHqZlKttz3CIlElKkxkPT18wdmgbmnKozuAqRlUNkoEfAS4sFB
	pSHsGf4pv0JOENNupSCWgcaxmuhDTXZwSHhBqhlsXvzsFG2/pi0chIACKxL63gq+8u8lL1nLU5P
	PH19IDY2vQHzpm7gR5N9LB479AVhMsrjgHB6aV+cYb/iPneaJALq7q01w/sHSdLZuy2EnHCOHkV
	CaXW+NsV0Qtlh7DXXlbTDI/p0K5ufEZqUqxJpB4gQxdiXMAkxeAhtf+3x31YzcphHivSuguoNfy
	frHglGwfpacLIPUXxCWWO0VmFDPdkpuBfZ3wmHCvo8PFrOzextEH/bq8aBo6bK/u+VjsKyJmDCd
	32hgKd4w2rhShdg==
X-Received: by 2002:a05:651c:154b:b0:3a3:7681:6d6b with SMTP id
 38308e7fff4ca-3a5b38161b0mr10553231fa.20.1789314422665; Sun, 13 Sep 2026
 08:47:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
 <aqa7KgIJYGgf7INk@slm.duckdns.org>
In-Reply-To: <aqa7KgIJYGgf7INk@slm.duckdns.org>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Sun, 13 Sep 2026 23:46:50 +0800
X-Gm-Features: AcwNN1U3jyA-1tSNpP-D9guvtV6T3al2eJNkQEtzf0t-dPsWgp_KnaGhqsq7NoI
Message-ID: <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
Subject: Re: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jan Kara <jack@suse.cz>, driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

Thanks. I found this during research into kernel performance regressions,
using a microbenchmark of cgroup creation and removal. This was not
prompted by a production issue.

I reported it to document the added removal cost and ask whether some
of it could be reduced while preserving the fixes. I agree that the
roughly 3 us increase per removal does not, by itself, demonstrate a
significant impact on real workloads.

Thanks,
Chengfeng

Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=A5=E5=91=
=A8=E6=97=A5 23:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
>
> On Sun, Sep 13, 2026 at 10:43:04PM +0800, Chengfeng Lin wrote:
> > I found an increase in empty cgroup removal latency across 507d8ce13f5b
> > ("kernfs: Don't set_nlink for directories being removed") and eea5d2bb3=
4ba
> > ("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext disabled=
,
> > rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%.
> > The result held in two independent runs.
>
> I don't want to make cgroup removal unnecessarily expensive but at the sa=
me
> time it's not an operation that I consider to be a hot path, so as long a=
s
> the operaiton can finish in a reasonable amount of time and single digit =
us
> definitely is, performance of rmdir usually isn't something which is high=
 in
> priority. Can you please detail why this matters for you?
>
> Thanks.
>
> --
> tejun
