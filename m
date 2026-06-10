Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E23B0AED
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 09:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082039; cv=pass; b=crkWN8dsHTTXUeeEAGnySuJH3fI9Af6zoEUJOJ1IqLE2y98WvDZxz6maVC8zawNGnriGYA43MCo12kSiBofYC8HfNBYaDlMn26nyLYJs+F8rZKLeL9GnXV2EJB2HSz6n/QwIOyfDhhDx8rpND1AyqMwAVWPMboa5EL/wsqAbNa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082039; c=relaxed/simple;
	bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8SIXHwsWQ0yX2GZlW3obm0T1QCGwexqvzoVVYMFzAu5k5jf6bKMm3Zlr1cfrd5Rc/kAHePXEIGAEaYWtnlo0QABr1UqoOX0m4Shrb65yUoIcXqgUb1ROixx3X6cpC4MyQZTrEDXOLz4jMZzma+Q4W7eKUp3lbaoS+1KvHi2/ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EU9t1Qiz; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EU9t1Qiz"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7e1c3f47d78so68716817b3.0
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 02:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082036; cv=none;
        d=google.com; s=arc-20240605;
        b=U8dJ1xSZ7ltYwfa9wKfXQP0JQIjBbTW+6Np3ZgMnf6MzrxnGVA0ztmrsDJss0VY4vD
         7A8PqglM+iT0zwD34rCq/ODVyZGhRZ5sX+szdEexA3/zevID/U8dsf+PGJBfbVXQ3L7D
         yNxDboKrEc0+JwtB1ryjhvhJnJr4ifXKvZA6HazsiiuO9hEIthbiLJVnNHZjB7zVXbuu
         iOfhbQ7kRiFivjqE7Y6DpGSjftOwRDstXdtRS+wjUaUtHS2d5FbqtHwinwFgNbx89qRk
         XIlLQqQZZ32Ic/jH4IdVC0jBvX+Ys2EKDmYR26665oNkBdhM0ckw9W4Jve0uFvD2tEma
         tNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        fh=oNessNTbNTp98c9HraB3fYD850Jt/61sNuMO+6Zm7hY=;
        b=Vve3YORfrnL89SZJdMJ7u/aZm/162eynLoyJqI1119wngqlmL7HJaoHK9WcHkZ9Oy8
         DuRfMFXFFbZ6tKmyF5I90iwMu3Bz47k+Hszi1iDI+5PszXo1Os910AS07bKSXVmhRPle
         I5N+u81iADP1U8V98tgOyhQ7H2NR9sE9hQLWnf3gjilxLIC1MWTfngOUDg6cESQ2CQqJ
         DqsHPXyaM1VwxSBSB0hye4DCsFMVimVJ4F4xvswGT1c2ViFzzE0DBwO+za8KTZiT/uVr
         DrmYnk/Y77wU0tBaog1mbuozvh2ANjJO6940qgEjY5bOcEe0V80ieYO6yC8aX3cpQDly
         8CVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781082036; x=1781686836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=EU9t1QizMFJZpGyNfj1tQwFVQx0qfu2Nt/rmU76nkTvESq8ZYNS32F5HJH1XNyxAD6
         HxhBAUyZAz3fHJWJG3MrEmC1NPk8PvTyRPrykNuArmxWjIt4ncTHZyRPJnjQig/p1a6B
         yMiH5rwkbkUBmdIl6zGmxfKrvmnZ3ivCJE2Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082036; x=1781686836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=PCJ9btR0XS1/D5Ur+j6uJ7gSUmiIsC06cgVhnUs7dGMQFv3tpRUVSevwdqJaMneY5I
         qlI0btxNtCwW0xW3T8tLqkRBd/U6Udk1DGa/2dsGSafsklJZFeuVQgRjsuU4vVv4PK0B
         0WnOxi1txJcG+H4bQxPwLV4E+QvAlLPMBK/dfRIiYhdsr2rP7OZh23QbZ0Yjqq42L1dC
         31VowFkyRfHo0pDYCgZUfilTzD1npTPIdyNDLkZ4Wk9qq6DKp6cBlwLtdqRKeCL2uCkp
         OOyo/ZigtmGbr/fwi26Qiev7YLEgta9Jrxzo4cx+nb7io4fwbRLNgO6kfPatPtoit00O
         c2eQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n6lTloLUqTTiiWBz4gAx+P9aan/EHYqke5b0KCWsJcSTFIvRsJFwRWB4dBE+17JFqq6nU8cxKCzOEvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCvlIp/l4v3TC7hUmDavJg/cHZSpjaFqIo9oUglfA+zkbqISxu
	syyWFw9QD7kF772IYddiKQnS2C0ympDIf1NPCnuW9TN3W2B3itZiSRg6PnGpdNfpD25W+3mdVW4
	76A3ADvf877Km3pYhocdsoqjpfub14KNRjPgg2C6W
X-Gm-Gg: Acq92OE8rtk99UFyr1MdMPhUaun93ZX1ZCKpsh5we4M9/RbZZxpKzcoyqs92MmwCR9y
	k42cxRMy9mCdwCKpmZpQE5UBjifNv9/RSFGLwaSZBbmQBylcfrYCsUq7o50KS9u+puzDCtZaT7V
	QmQnBvKJ2ZR7OxBAM9+EfIy0HZGO6RlLxf49+pQ9XXfUI+TmTGkYKnNp3nN2g0Ee3VAzfi/ELDD
	vM44n6qDr8HzGice/wd9Q1O/+Tu5zxlSu1XTb4J4Uf6hhdUyL4kuf4E6BS+OC54HQONUkIxs4Sy
	eu65QMAdhHuuL4UEMnBG4KwmDfiPZQ==
X-Received: by 2002:a05:690c:6c08:b0:7bd:8d1e:39fb with SMTP id
 00721157ae682-7ed0a4ed459mr225795957b3.7.1781082036496; Wed, 10 Jun 2026
 02:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-4-wenst@chromium.org>
In-Reply-To: <20260610084053.2059858-4-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Jun 2026 18:00:24 +0900
X-Gm-Features: AVVi8CflqNzYUTj7jVe9ENVhBouReNOK4zYnRNLDpQhNXfjJp66LGpOOH45Xjpg
Message-ID: <CAGXv+5ENxq3B63M-HnW95we+2r+WLfCLm5TZ820zWiC8FSakSg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING
 to bool
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> USB support, including the core and hub driver, is bool, no modules. To
> be able to use the power sequencing API in the USB core, the former must
> also be bool to avoid the latter being built as a module.
>
> Change CONFIG_POWER_SEQUENCING to bool.

As Sashiko pointed out, CONFIG_USB is tristate. I was looking at the
wrong symbol. Please ignore this patch.


ChenYu
