Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376D375AB8
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599780; cv=pass; b=fU6b8A5kvLGe2dsEN0GEAgE2HHx6HMSUhQzGqjpl3k/jeXheki73/u9p35P60som0z7+HkYQrICtxVakkSppz4nsUf5kH3kzVgspDCsFG70PPmhC8DUP5M6qzozHXXIzM6PuBukCWdzJu2UV1w2sc2qgZxRNxw4VwEAptqHvn80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599780; c=relaxed/simple;
	bh=nBOsokuQTzbairGbsW+8mrF8HggOp9/BLLPnZTJwHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXI7iOZ7EQ6mmuAAYTiaqFAaKVjklWYIJDEzsdypS7oh/qe/0X4ltjEDjqcC5zYx26swome1wH4wN8omiEO6VKwHl5eJLZQdY3nuhOly0O5U/2Mk5F5DAU9F+bRjGiJiPTT4cd1pwVuf0neNMyIBQxdNotbZ+fgDLRDJTJsbZJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKg2opdK; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKg2opdK"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38be5e86918so71419081fa.3
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 08:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599775; cv=none;
        d=google.com; s=arc-20240605;
        b=Tfut0C+B5bTzjjE8ukF74MrXpiEioOspXzi4yIXRfNtujBlxFGufGiABhG+32a1NWk
         JF6nNSuc7L6dRxP99HJZxpmRIDwG2wpyGqj6JNr3yYmLt116RPrW7vZB+cN//boDHU5i
         RGulqdAN3aCs6ttmnQiKr1s3sXxJWncGZkVTt5gagARjCr8GoTucbXbq/Pil6o+nkr33
         IV9pdW4klntrdW0n3nmKkgblyPXtQR7evJIeyyFkdDzTqM5Orv2kTKsyijqPfc3Sqs9U
         2F25Vd+kxGiZh0xKkxeEqWxbHX3XjkGV1GUJjh4SjbK4PA+FOff7VXGAWk7mL5CgwvbT
         23yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        fh=sHUpO4UZvFMmUkEmqioBwAcqLMrnEx+4qNQo8br1zY8=;
        b=MTtI0yeSyQMV/hpGTGtkD0PrvrFz9drPBLXaufyoh5/S8js/nepA/qOQjNVyVFH2Yo
         G1FpEujybGjAQne4Up0vZCmkZpnONkwVm5Rql1VEjVFixEEAwBoknRKHSU3V0rUAEBBd
         iheugmuyJ0VaACp/CcqCeUkZtkMotZdKrM5cYISvZv4YnDh7+cbewuwmtCqUxLATDdPU
         lAWjF9m2/OQm8hD3Ztz39CTo08dEpnDBoWC0tIBBMncsFbk/+pYQGLx7X+2+exxwVSdu
         2tlTczcs361st5Bcdg6iSVpYtniquMAyXppbxXZJNuWfJZxjlZBGFeDbSE4r0h04ic1l
         +Bzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778599775; x=1779204575; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        b=jKg2opdKLF0rsNfbULfoh3Ok6u42BWAx+pGMvKuOCHUhSe9a6d8DNDrH6iD2d6gg1i
         b2iys/o1Qe+5CBgd5h0/zYI2wfxfs6uUBiG0bKXvbX2ZxGm0VOpv136MBcEKo10wnkZm
         PWlN6WR6KX00oKLI39GEArihDxavN2Vm1wJl1lmV7uQ0CcjZYPLFDl+EoUzNywWCAqPx
         hwau3Jk5d6NyUOBWpsKaxnkDzCQmo1qyr65PzFm5/T6QdJgrlTq0F7JcrH5zNMEC2vRL
         zWGWcbiZYxv9KkcVp4ua3nEeor4SXkdTw9c7Q3NsnnA9Ni0DJi7u/To1+uei7lYVUWME
         ufFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599775; x=1779204575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        b=jsOF77D0AEV0vPTVLa05t7OkO6E6A8hOW9IATNkZ/5vOITdOHKBNCbPRuH9jN6ABUt
         0n4ja0nhm6+aQEOhjxUF0CDB6J6IE37Hj+lLqBA6fBdvT8glE47n7x5LougVHMF3pqQb
         VFoDufTnTcUblY/K55jCHcgOPV8Hqe1KQ4oO0zFdvvhloxeH+1b/xrNksTMV7h92hZWX
         kG5AJ/3QV6wTp7qehJrVAbX+gutkDpCGOjQj4hUybjPrX63zJIk7J5eHuoK1hwUJfwYP
         bXwzG9MdTVvoyFyUP1ZPp14DYTtsBYxFz43Ra3ilSwUZq0AIuTOfsJSZilwIyy8kmfp6
         eM/g==
X-Forwarded-Encrypted: i=1; AFNElJ/sH/H55EENzpGc6G9BqBqzUHzxWJIS5ndR9HeDdvMqxO8Jfib3/Ept5A+jC4W9W4RinF3k9UcUe8lZ3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIq/Nj2eLdrCZvnMkdbIib4e0J6I4+yFpmLrBbZnK/7r837bAS
	8VZDnF3O59m7hfh1B8GTtTyFjdbgzCFG6VVF/VzLzc0JJTthmcHI4ftGPM+udm0j1Cq/5L8OPM8
	k30b4IaGRqGU2XBJ2BFzx74mbFBODfyo=
X-Gm-Gg: Acq92OGawxfhum5Y/TNfX3RTeCAfKNH8KdefG9nCTd7zYPcShNLNy7Vnki168ehqneo
	iCKieCqeYMSDSZN91ZvW5upYtjZYZVbYOJFcD2ZfSfaZDI70k9Vnud2CRfwOnsKY8NKH9sYTq8D
	8hMCB6ffBtFiEF9MEHX7b+p5jcXLqAOUlUpil3/W998eLWVOUUgwl3t4gAfLSuBRya252uLtSFc
	T8xVN1zhO7o0SfBz+bxNJCRAjyaT14XVpHHpJzFszRJnbcf7xO86p0La2krjRcTQFn843CtQs3L
	+73eaQlJq14W/9NAOqoqeyO/WM0gkET5ZG08ue+5ljzhrC20Q/8XhWXor/FgQ2Ior+EqiDSMC7Z
	4aCpF1NYDaunfkNrXtg==
X-Received: by 2002:a2e:bc28:0:b0:394:2b8a:234a with SMTP id
 38308e7fff4ca-3942b8a5e7fmr31619441fa.25.1778599775037; Tue, 12 May 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 18:28:58 +0300
X-Gm-Features: AVHnY4L1_zJHNRi354c-jkblkHr8hmHJHYehCTnWbdMU5vf_KkUdHclsjlbuBjY
Message-ID: <CAHp75VcdbpY+DfFh6b61U61X6or0KoVs_akygnAgW27XmmXo2Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] kunit: provide kunit_software_node_register()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 3:00=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Implement a helper for registering kunit test-managed software nodes.

...

> @@ -10,7 +10,8 @@ kunit-objs +=3D                         test.o \
>                                         executor.o \
>                                         attributes.o \
>                                         device.o \
> -                                       platform.o
> +                                       platform.o \
> +                                       fwnode.o

You may put it after device.o, 1 line less to change.

--=20
With Best Regards,
Andy Shevchenko
