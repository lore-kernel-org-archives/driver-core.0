Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794368334;
	b=rhPUO7AYKxye0dtV73JGAsruQRPiIdY6oBQ+nAE3Wl8XgWLl3K68zCrwtqlvGrOuIDtU
	 WX0nC+6I4KEsjmWj/9X1AB8iZPC8ML2p//WlIo3rs7qSThkUTeurAw1N31q0lRMalou+L
	 g/NLWTR0hv+rDfZPPkKdmqLiqnursT+bvGd3Gc3ihbsIQOwDXoi7HqQntNxzq3rXiHqoJ
	 tV7j3nVlRSwkEmrqIK5T0vdv+T06P2tRfJ75mphZBxuNk5cjDnFNAkPQnnIwEyFCacAPm
	 8n5YnQx4N4niLZYEFy6HFjSsKQi9XrLAcjR3APZYj0wKBEq8pECWj4sEk/35IsJXvNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
	b=CTaEg2BkB0ZKN+n1LfrdZ4xdKvFz+Wvh8171snXMT+czxTUOpO2B1KOukbSjM5tu60/Q
	 pvQ08+VMrwJN/HJ2f4+h6cCwjnQaQHeOXvIXS9iyxZPviq3nvtBIubwYdb+/e2UnvuJT+
	 qVckkKqVjn3Fmi0pAhC5mFKq82MfwaH0e9r1nbMNV/KHDmjiYUoezzR0j5QHITVQK3h6V
	 Xy+rM2z1yyJQSl8zh20TcJr/kTqGYTpR+TjVneJaFklVzwiOf1AzZ6QUQlVsw5dx0Gzvi
	 7oJx45KHVTDxB8BZTI4Sp4QrBWnTZFDkbqEjsXITd+Rtf1oNGmeaMccKAhuwy71PQRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nd9qHQU7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8A7606A31C
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 03:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nd9qHQU7
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c445c95d553so372417066b.1
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 19:38:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368333; cv=none;
        d=google.com; s=arc-20260327;
        b=nxt47c7GE6HI9lBnSeIvg/wkY2RmYBy1HplK9ebfU7CNaX5B8nvi34kZzw05orptnj
         QpyV/v9zANkDEVPysblNvT8pGvwm8TJTB4t1KqlVG4jO83GbEadFEB9ysg8QYlNZvD4B
         evaqm4VsvweAoT7tzPQUrGQ8rxS1jsg/1oQFS9PqdCR6+IfY/UAn5HjViCZnkGx0lnT4
         P3Ev3oRZpwleUyJ5d5TFFM8YVN+9oYXmxTsJ0IsuqanMoBSEB4gdOvmKxjZEbuOWIMKh
         dYrB8akX49HmRwsLGKk/oXFgCoRvVbzAAaLRihGR26ciGYXIQzKePIxnaWX3dvJLxBnk
         Atmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
        fh=JAgiMlAsaTxirhBVhrcN89uZ2noUm4uxAFbcOLM0gbI=;
        b=kf9t1VICNm7p7e19dKZqlcJTly3UGYRX5fFPXz+Viq++ruMfPSfG/6HNdbXq7cAaXF
         1sCH/7pei1pDevLg2GRb9O0PPAbFJr7AC7WK+B5Jc1QZ+jrFMTuXqKQvDoN56xnTDy1H
         Zga4r4T1Zw7QEc9p+lfHVGuQci/IvD23oIq3w9NtLLDQz0N01yYvJ/szUQINb64S6+PD
         Avv7ik8OcR7PTSaPxhfieU8Y8fHeoJ55kuHvqWbTC4rJ1zqHRIzeyBjaMuxn/yWE5EXB
         /m2vgTI6VNiVmmrRiYJVzXV28/wDHUWbCkdhwxv+bHzz7HyBWZF8/Wkc3Ffwj22Io2Sy
         CP8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794368333; x=1794973133; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
        b=nd9qHQU7z2Gc2pH1LFod8d4veUjIYWaRLQEtzh27UQ4yRtUdefmEcZG8tWUVgLpIHN
         GMPwozYWVHKrR0PXXV500GDwrkfkFMr2kpltuWcGXtEVSl1cT/fEYaviIQC8EMX1LKOb
         J/1Lw76uTIQc87eawqR9GJV97/mHqNGqwYkAmzaiYA7RWNj6U/BJ4RNoDo/0dOWMulm6
         BI7SMDIIiqRfhRWK0j69MePYxhLPTTYerHGQI0C5Ji2sCKLYmIKlSJOaf2tlwAKDbnp1
         Af+gG7HYJPKpeqwMs00uzWjK/AkUPV5RJgsMHj3G//BoEzbimNWlPwlr/qUkCE0ksT4F
         C0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368333; x=1794973133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2ET6l1kFZ7646cHbCayQI5WEMFcXf1kwxAiWCRuN1g=;
        b=Rq5CraCkAlWMkaFRQp0bw0zC2mOUYcr6QsQFdknOwmCZnBvTD3McfQjODDV8zdxCht
         m8Gy0AY8boyn3parQWZmqZxommpGoYhLsf2a4yZ/bZgn+OVGCdg/u2/F8VT5ZJ4rKkZn
         Rocl1qJ8D+qEZ6XAl/gpsemRYHi0UDcpUVtzbi8lue3SWvPss8m8woHx7NrhGgfpYrgR
         OP6iZdiOzhY6wJSx/dJ3vlFYyBKqWLopCarm6UXJHSk+VzNgF2kbRZYUr0foOephNAaf
         6s2nv4PWcUuivXRH4mrt54AATVp8kiaapI3ZW8IcV+AJ+TF73ZrVvZZ7ctwG3/b7llT5
         pBpg==
X-Forwarded-Encrypted: i=1; AL+hErFiJ24JaqJ4Y68YVUgD4NlrJOICd5qZmFhWLPtrNq8fyu+7h9i96253nua9DaJcA1dULO1rFsmMU5HNzw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+4/3fe1s4S605bacXftbgvx5N6yS4h9/ULsLE3t+ZPNIU3zZhx
	Jn3dza4QTMqRXJFWUpmeWIHmfYuaich8QfaRUU9lc1e3tnnXtUCU6C3RtpF/Q/bnmaKTbFC/V92
	q1BkfAg3eLAklQOjXM+v6pvRKmkFjoeS+5EFOBvUS
X-Gm-Gg: AYBFou2HsKprw7aaLbkXDGd4RpziFSRgAmf70CKxhdr7zEFd0aMmUIs7N6pSFaCRi/U
	xYsfxAGTgTc5dUYL+a0HonnoWwwwiiS8DvUI5mrH8EZXObU+OVykOny6w98n78DErWNvs1V79uZ
	V1ouAp1adESnv4+EoQIeNHsYluSoO6yChRje8/8A2fMysmkz7xOMF6wcaWcNMN2eUVCdHzHxNfE
	5lxb+O1iPes3FsuSupUkO/WmHu0aT6dJCk1OgOSqHlDmtengXDIN+h/w8caY+fA6ga6GQCDW/fI
	9khACp0k0T6se518ArdMyFGHKtLK+SnpWIq5phbgkv5Lm70pFrFOaUZUiNi6N2nSPL4XZ35dyN4
	2JcAgY0cfW4XTQQsrQobkXqPrq2/G9OgT1CSdS36JkovfXE38J2MpfQ7jO2TJNXg0jLgk5g9TjV
	2K4BFSGC6zANE3pV0=
X-Received: by 2002:a17:907:3e8f:b0:c31:c767:adfb with SMTP id
 a640c23a62f3a-c50662a8062mr90474166b.0.1794368332418; Tue, 10 Nov 2026
 19:38:52 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-pm-runtime-summary-v1-0-12ebf283db78@kernel.org>
In-Reply-To: <20261110-pm-runtime-summary-v1-0-12ebf283db78@kernel.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 10 Nov 2026 19:38:39 -0800
X-Gm-Features: AclHuK8W422emwCtXaoFuChUjWHORL2ljfu7vHUC1vM8aNEtLmFd_5-AJv8NDRY
Message-ID: <CAG2KctpRRDMXR8wG40PeohsTyAdoNC=+4Nc9pHGQc1fmw9AXeQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] PM: runtime: add new runtime metrics and summary
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:34=E2=80=AFAM Joshua Crofts <crofts@kernel.org> w=
rote:
>
> Add a new set additional PM runtime metrics to improve power management
> debugging and reporting (these metrics may be useful to userspace
> utilities such as Powertop).
>
> MOTIVATION:
> The current implementation only measures the duration a device spends in
> suspended or active mode, which is very limiting. We can't find out how
> many times a device changed state or what its shortest suspend cycle
> was (to detect a sort of power "thrashing" behaviour).
>
> NEW FEATURES:
> This series introduces the following new metrics:
> - resume_count : number of successful transitions to active
> - suspend_count: number of successful transitions to suspended
> - last_suspended_time: duration of the most recent sleep cycle (ns)
> - min_suspended_time / max_suspended_sleep: shortest and longest sleep
>   cycle durations to help detect power thrashing (ns)
>
> By reading the debugfs file /sys/kernel/debug/pm_runtime_summary, you
> get the following table describing the power stats of each device with
> runtime PM enabled:
>
> Device                           Status        Resumes Suspends   Active(=
ms)  Suspend(ms)   Last(ms)    Min(ms)    Max(ms)
> -------------------------------------------------------------------------=
-------------------------------------------------
> 0000:00:02.0                     active              1        0        45=
688            0          0          0          0
> 0000:00:1f.0                     active              1        0        45=
687            0          0          0          0
> 0000:00:1f.2                     active              1        0        45=
686            0          0          0          0
> 0000:00:1f.3                     suspended           1        1         1=
658        44028          0          0          0
> 00:03:0                          active             15       14        19=
627        25899         42          5      14811
> 00:03:0.0                        active             14       13        19=
626        25900         42          5      14811
>
> TESTING:
> Tested with an x86_64 defconfig kernel and QEMU.
>
> AI ASSISTANCE:
> Gemini was used to prepare this series.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
> Joshua Crofts (3):
>       PM: runtime: add additional suspend/resume metrics
>       PM: add sysfs attributes for additional suspend/resume metrics
>       PM: runtime: add debugfs entry for pm_runtime_summary
>
>  Documentation/ABI/testing/sysfs-devices-power |  36 ++++++
>  drivers/base/power/runtime.c                  | 156 ++++++++++++++++++++=
+++++-
>  drivers/base/power/sysfs.c                    |  81 +++++++++++++
>  include/linux/pm.h                            |  12 ++
>  4 files changed, 281 insertions(+), 4 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261110-pm-runtime-summary-8dd29a1383bc
>
> Best regards,
> --
> Joshua Crofts <crofts@kernel.org>

What is the vision for using these runtime PM stats once surfaced to
userspace? Runtime PM and suspend have disjoint portions, but I'm
curious if you see any non-obvious areas where these stats would be
insightful.

And is there a reason the stats need to be surfaced in both sysfs and debug=
fs?

Thanks!
Sam
