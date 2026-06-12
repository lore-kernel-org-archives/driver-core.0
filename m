Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69EF3955CB
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255537; cv=pass; b=n5ps3s51mP80OGPAvg4Uso5Yiak/a26J9fqjyhjM8mC4cWn3zmGrujwYA0UFbL3tf97KWxOHvM5/7NqWgwfP3KjH2vnTjviTqaD9nhASOWgIuTgfsIEHSUOf/LJvnKKsUQBtm/F4Mx89vsjtYaQdPk6S9Qdn3DpFoJehKuwMI+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255537; c=relaxed/simple;
	bh=V9+QmrpZdZ64QkPAYEa/J5l5l39WRUXFgGRxiy0LOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8qAAm8VH7gSVshG8gh3Lo7Hy9SniscpVeGkMiRYpDsAED65YUwzYU2xBKOOZtOsmMwPFa5bEqeYW53PRGGl3rA/VuimtRlUA7IRyRt/L/R1HZ1+gJixywcjKL+J7UDX1M1Z0LyGuUPQPgh+ERpCqxJ0rsUF6ODENvJ4Y9u6gt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aTL6HxCs; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aTL6HxCs"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dc67a5e102so7168087b3.1
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 02:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255532; cv=none;
        d=google.com; s=arc-20240605;
        b=PuVRY8XDjv/IB3NW3d8AAUXdKyK+22+diAIL/U3B6+Svyl76ws/1ksNNgRwE7gdiql
         ++HhTfe1hTAef64mb/FL53f2ZCKaJzUFPPc9WK9S+WKrnRVGkEfDWexzM/E5CXjYrxe+
         EeUBdueIUQakxPOVbWocbm0NGGzfANWRP+RXGJrxWWXXgOI4Gb09SFqZg1iUC9VQ1Q0V
         FU36vixzbj7axxHI7G6Rl96ruoydwG0x5EhmhTzbPVAc5zwNIlsP4x5zkisLNqIOQH1Y
         v650Q5/GJ2k6I9tzw8PWBks5dWTPRXeE778y+a2tia04eCcnBKeJwhsQb9juupvseOBO
         5qhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        fh=yZEc8AzjhuaLjsHrBBd6KMyZxZW1aspKjTOYjrAufSU=;
        b=fVoGuzoOPkeddwgdtY+z8ERq5rOVNiD0rqCF+ZbF6zzDqO22L7uyt0JfvWWcM19V1n
         FxwYRTcU0YF1AwIRqQ+7IcFsFGy+189aKasDvyA0xNAsf/PlzMiOnULI58UAmolqVt04
         CC6oEtuvsSkgRQXY4nhyP3LSk3jUHQI+ry1PNwHGv81H2H4ZaFQ7t1Zljqp/S6DkA9L+
         mk431P3YZNW1YYJidrECGoODj8JU2iGO88qj4aIrOmolALXnaji/mSMdryo80qHoQD+f
         IWAZ36UmNgRSYwoclJhO8mg6Rn8bo+hxDsq4YE1UPKBzWwAh3R2RElA3QxxsSMz1RgpR
         Jomw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255532; x=1781860332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=aTL6HxCsdFIgyJfZwS6eiBugCLDYcqqrS7fDjpoMCi0M2Rx/wVDbdl2rCHb4mRe46j
         MFMQ60LV4wjK2JTEPtKGcqjPNICyfBS5+e4RLp2sezqUkricnW+0u7BP0Yj2hWknH7DS
         XU+XNiVydK7imbehrPIrUkWTt7KBGalZ7slbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255532; x=1781860332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GT5k7NNhpJZZ3Z4dV7FccQcGuRptRglhhV64m8hW5dM=;
        b=hhvyL20kMveR0GGM1REeOOZM8h+aBkuWBAl/+oVTGjpqGE/ykUzeop16eJMTFBtrAg
         da2oTlC+hsakT+/PrhaeCP9DvrW0glAU2UgkZ/b87LINR7kpUqdJyB29Hq0RBztd+/Tu
         OdB4xjQE7W9piBjsvaz331s+isWtgKmtSnhdSEt6drROLWrs5NcNCMi5wtHLZ3vkPy+W
         UoxypaanKidMyOWMlJqUWxc8TrYXwgWG2WR5jZuD8Z86pYfgBlEzvRhhvMuwAQBFerk+
         4yqx4unRdmY18kvEekGI+vUmMCApG4o/NtUVGFdS1llichyUJSsAk9gvEwCrCqYGzziz
         HibQ==
X-Forwarded-Encrypted: i=1; AFNElJ+I6In9UKLka6HR3+F9OcT68lZS/az6qjz1y7iyZlGqHPCdIgVN4SRzJ27+fBHcQTEh58twWamlFCmXfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzENEt4H/M1Nv1wVTHvkCnvufK2QZ46P9RSrxoWIbaNIorxMaZ
	NNvBSNll9kqQiaP+1hpTuFTwSYOfsPD27iluf35COzpaZcSEhdr1a3Pm8ODQNeG6s8kwbmtEKis
	xGV+XqG4LEJMCZzKgQlRphW6rw8faoZqFYQtTQcxU
X-Gm-Gg: Acq92OE8yt30CsiaKyO2hEUdWfO7l1J2YOnILH6bfnDj9U/B4M4GEqIj9lWjdOSg+n4
	4N0OjfgLNZi6xzXZksN62Fc1ViiwEHFTIQZiqZcLesZb+wmkZL6Zhf7T/4mCgg7rsRxY+yLR4mF
	UZNNqvkFp1O6FeOUEh458l9xedd6EZO2LdMZprCkE01ypcE/U3T1EvnS1okr/U7KK00PyaR+MvE
	hoz2vNyiDnUe/KKuW4w32EuOPnjpJoqS8LlUmltrejWc8MTXETG+LF1w7gTiAReuntV35zvDPEW
	pnz4z3GI
X-Received: by 2002:a05:690c:f0a:b0:7ef:d039:a334 with SMTP id
 00721157ae682-7f7bcf0d73cmr16871217b3.22.1781255532401; Fri, 12 Jun 2026
 02:12:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-11-wenst@chromium.org>
 <ail1sAxgh5Xtkj2y@ashevche-desk.local>
In-Reply-To: <ail1sAxgh5Xtkj2y@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:12:01 +0900
X-Gm-Features: AVVi8Cc47lUt9lrnuGQ2TayhjSsjO0Ufug4-8BS--usEeOHUYmKa3VTCiJvbq60
Message-ID: <CAGXv+5Fkp9R3i+WnCunbydJpn_rjxX5Cz9Cb=auS-cR1RE=R8g@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on
 remote "port" node
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:44PM +0800, Chen-Yu Tsai wrote:
> > A USB hub can have multiple ports, and this driver needs to
> > differentiate which port is being matched to. The USB hub driver now
> > associates the "port" node with the usb_port device, so here we can
> > use the remote "port" node to check for a match. Then fall back to
> > the remote device node for the other connection types.
>
> ...
>
> > +             if (remote_port && remote_port =3D=3D dev_of_node(dev))
> > +                     return PWRSEQ_MATCH_OK;
> >               if (remote && (remote =3D=3D dev_of_node(dev)))
> >                       return PWRSEQ_MATCH_OK;
>
> We have device_match_of_node() IIRC the name of that API.

Ack. Will also replace the existing instance.
