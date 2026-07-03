Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADA3D093F
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081053; cv=pass; b=k+NDtrF0mw+doSmNzix2xPafep9rVxJE/3D0pYNWjh/8zadBo+UQe3iUbbAppqQkgxyjH1v5oMJaiqYZsu+h8iP6nFLhp/hUjE/+CTzcIqbKtWHV3uhXtcH2SYmOgqg0XOjoiIK6GL32ZF9QxUl3FiW0hamwx9JHcnel9qlZGLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081053; c=relaxed/simple;
	bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfYz5ajsFrmvU3GJo4VoABHj5z7eSiUk6zSy8ZFhirCPK7/V01DTTTpQAvJVMf9weBFQ3JinWTPEeJ/rft3ZFTg+9mFbHsWGIGTtDFb7AL1wzmHYx0FGtRLaFIFS3WCpa17f7hGcXC6nBQXVcQYr+YBj4TjLablGQc3wqv/WLk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V23mh3Ez; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V23mh3Ez"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6662551100bso682488d50.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 05:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081051; cv=none;
        d=google.com; s=arc-20260327;
        b=bFoMGkFFnNca+495VzwjuwPcnht++cAi3i8eAmXxkyxV4ChlN6dEex1dWUmDPWf/Et
         xQX77UVebdhMMroWmpikG9dUJssrha3JpoyPsXCU6PY+3F0Z+hemfroQ50V99lg8JvVm
         KROu2VVWngafTT+kx6vy95Pww9q/XU1sqVYdnDndXUPfZKglWTYPBJLa3vM3MLwAPOh7
         L1F2UGNGasMl7PtTKsBiHgBeHH1DP/6hOXqKR2E2VTzjqXQjdXHEaZSsIb91/pdPSbkA
         K7LoznhUNDuGjaxmS6ABdYe/AhfuE7UAhZqX8NALfpPP69/i4UPnD1Bs+MhvRRpk0KEu
         2joA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        fh=k9GLQL2b4r4CPF6l+nI4q/eQeaKzmkrWG6lMAY1ftVs=;
        b=l/KwCxdAexKwwV+nopPPz2WPE60FKazCYOPmuq7cgtmJCrLDK/uOQ6cvI4HQdetDgh
         8x/yY9c92mUyPqyKB3l7ZntLcQxNLdfiYX1uJZSk66LyiHqY7n2p7hKcGOvNH6SPQxmj
         g5pzaDAbVzE6V9FXk/wuGXvX9yP3JA3vpNFNbGkpTmqWnCkuE/PuH3ciPZmwM8ULOhc4
         2FtajIWReyNyefEmwlhxtq84+rEDipiq4YH3IW+taC2FEvbhx9xPTJRxVCKCelqG6uQt
         7y2/odwwIqm//BjkUfmSyBcexYoLnj8QLnvE+fBMts1oLa+UUXtWtHhLW76ZhxO2AyTo
         tZLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783081051; x=1783685851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=V23mh3EzvGMt3ZU9nHH0RrGE1vs+3wLEatzWxQaCw2Oii1YwIg6eSKfy4Pf8I8MGaC
         eyJ8m+uz7yLn909Bmw7rB5gFUjUAXcZ4QITRNdn+VOyqGvFyTdGra8ZEhtb3nbch+Roy
         NJeohIgGdle/iVKx1iNDNFU9Ah6ZuUs03iWJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081051; x=1783685851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=ohOjAyJCrru5f+ECZJ2AhnB39Soav5tQdK37aqyZ5m857h+ZqLSgHOr+lAdNNbXSXq
         g3YhnJvvDoOXf9Hf8/3oN0JCjfgzfRJHUeyQXLBHqy+iVbOCL2Gh2fBStn+9J61dzNnJ
         wBnwN9xxiQ6r+Antj0b1ETrWWbzCMVC5vv6Tl6/tgGJVahYm84w1idj/kjHHfS2nD929
         lJTYWs2YnReDGZCD/5O5g6dU7QnBETH9XqT8TNLuUZelYG4rm+hkeVhJAFyfyRftqyyh
         7jr/HqF25r8Z6KJEAe29eKewN6+FaSRbI2G6Yso0L17dGRvuDK7UKcgXmgd3u5ZiC07u
         BJjw==
X-Forwarded-Encrypted: i=1; AHgh+RoW6n+iaUGh64idye0LlZOyAvjrXrwOykN4++ObggWIZQTZvN46qIyYqdy1unuwO+FtTIFSajFBh5w6vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYBypuWHyba/aTBuFLeFJQ4N4iEQMnPw3pF2pgZvusR2BS4nn3
	oWcYCXG5f72UeCmM7/86EipSDQfxGiculD/VOyWDEj7kPpXpk6+fl+d7K2KxVes7QnlJ6xM1xyA
	9uBufaxSIjQmZDzQky+h16Dlh1JT3QplCWPlTgfMC
X-Gm-Gg: AfdE7cmI0CLy9T97vifVK1pei1TYlFzGAfWkMdA8vb1Wk2bW2h1brUnpKIvnR+daFa5
	cOS58UuYFbb9sukzL424Tar/yyGOxxCVumbNnDGdmqRu5Ahm7XSEKv1rPtXVigv/NnBIZ5PnYXV
	ZRPr6avPeHFsOhLPtjA3gzRp6JJuPNiKvHXs8R5S3y0qkYG18r2GNmuQpShu71r5P479oJljLd9
	N35tDZA0eJn6AFs6m5RRJxRffOUCf3Gp+/cfe1dZLIM3t6vIL9NxiqRz0VywqVFUpkX85MPZmJO
	N7/nPtj7nrPRbPHwOY61yphDJA8=
X-Received: by 2002:a05:690e:bcd:b0:664:ae03:524e with SMTP id
 956f58d0204a3-6652195244emr9486423d50.6.1783081050982; Fri, 03 Jul 2026
 05:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
 <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
In-Reply-To: <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 20:17:19 +0800
X-Gm-Features: AVVi8CdRG77FVnl6YqrCOnoh5pU554e35My8Xh7iayyOJ32J-OMwjYcWxPxxPu4
Message-ID: <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 8:07=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
>
> They wouldn't be able to do it as the field is private to pwrseq core any=
way.

Which is why a helper is added? Note this is returning the requested state
on the consumer side, not the actual state.

> In what situation would consumers need this? Typically you know what stat=
e the
> handle is in if you control it.

Mostly just to avoid extra tracking in the USB port device. For the hub's
port power feature flag, the hub driver actually queries the hub for the
current state; no in-kernel tracking is involved, i.e. the consumer doesn't
actually know what state it is currently in.


ChenYu
