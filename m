Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D14C3D8105
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085170; cv=pass; b=Pcs9DQp6ue3yV8OpZojAog8ddTVeZMur/so9fJJ7jvuRuitAYC3mZjq+J9j+XOiEQd8v133F5IDrKSyuA2UeRhm2h9n0k6Y/00wz7O6yi/u8rfLs/pDzbrp7GffcM3d1Tn6Nhr64z9wq1cx9WymF9RCzewNoPT0zn/eElrXUAL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085170; c=relaxed/simple;
	bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q95s6ja7ZB8SGSx92IAmZQ8IxUr0zeVNHdIV+2huIhAVXRm8XmS2g2E8VPLHNHtbANJnQZXyHzm8JNaeu0Xwby6HpgdyGaXV0EwwFsMCQej15prXiGMziEN1/XUudZeOwJWF6C7p0gOaLwL/KgALhI3Ebe/yurFeYqsngxAsvNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R9bZh+57; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R9bZh+57"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664d35b4777so659804d50.3
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 06:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085167; cv=none;
        d=google.com; s=arc-20260327;
        b=dI1fwudyfqSsQycvcarKOD1cQi+Ms8QkZkoSNOyw0iXMNhPQJtRoxN23lZDhHNSYDC
         X0OpIutG6agUdX1NfXEkYl9uho6Kp0JoaGKZSgqfAJDnk0Tfexbvn9r1sxtYDy0KXx/4
         qIhZYpXObXzPvBeYWOrOsnD6/zmdGMbMQwlkMwA1RYDj+DqOSg0EbBPJbLpFzxCN2lJl
         6E+pgJnHjM0KUM8zWbWrV5x7dUPzbHrMd987NBlUdCSqYhcPLeuqpix1vSe++c+QYGWa
         nnC3x2FY7tksHOWuF6OLMedF5vw6+gax7QwLsKC8dshb079CjDiRmtDlDwAK2OsO/be2
         J9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        fh=5+KI1KvrtQXZA/xh8gyUE13YRH/j/mBlSJkW2UTe6Xo=;
        b=i7Ukjqfs2jRjcaZuRBdj5wq7dcJkewj+2RK30TpR5ficFXemILas1L0xDvEuZdozFv
         lhqUWTvpCMryxtTdwsjknhhmLqwondONvdWjMUG+gVlJOk2hS7I1raahgST/dG6Tx9ry
         3cs0YIqYREAKDIYUlzvLG6cEktLkxxvGulNXYTmcRCQ7IYdmIOu0a4RZ7gxEsGV/leda
         Tyu1dj5GF7Donz+R8h6vUeGuEVxmpcj+INTnTKDopULM/g2lteX2bYUkthAaX5P/nwR5
         fso7o1uz9BUACkwX21o8qz77+f6EmKRov/P3zExP8IR+LiaRUbFQEmKUJLoUrTEEb6IP
         hDoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783085167; x=1783689967; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=R9bZh+57/+xnNvQeBrmthUf1WKrEgsSyquLi9gj2F+7qBqCEwxVVeocD4dUpIlW2z+
         keDQzFeOqIw7OjWTQG2O6I6qfl9OdXqruBpXboEQF3lW4/m3pFcuZQ7umxBN1nInmF6E
         0pdi4XC/uGcxHPc1a9nax0AMXtqjsSdCqJSTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085167; x=1783689967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=SBg19nJ9+ONHlupbRwr9o8xztw5lk2eHhppG6VPDpv5ejD2kbpvY8CpzqBHowzshfE
         YTXqoCARSpHwac0iaFDRhjM/pcTQXhwHNjB8p1zv6cx8eyw/OnQDo2TBg7LhRPciONDP
         obb0WWKKsv0XrrjUZmwIxZjvgxV32ed+iBUxDFq+Jmq7oiOp+T8T+fweMvMVZ8qgjVpz
         SxFVNF6TMIfXS7tWnYpT8dtzsB3JjxlbZzpGQSgZvGbo34nNV+IWRlym60FXa3DTceei
         5PF67LwDZvHFXQyrqGGvYARJSRhfayrvhPht77QgeBr5dWfconA3NPF2/6rbKzGMEkgA
         Nuvw==
X-Forwarded-Encrypted: i=1; AHgh+RofKsDcp1kS3WY4ifTOesYQX0RfgQ0ZHO2jsB1RpJq/6P4JtYIas6hf7KGjjNCK9EhqwoQaOhlj4QU46w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysc2/uoxm2SxG02Db9njJ1dqdvBEgTvlvrrH3G7PTUsNzQqBVd
	hRgSq9lWHXDEDd/GIYyQ9IGBqrV+OrtR3goRLMqWlIbh8dHDftc4QD0EICCWmTWgvuufPGQDEO9
	zE+gcuLKYedG8SfENgM0WfMTtIimRXs9cEwmhx1wc
X-Gm-Gg: AfdE7cnVucp2HlTvn/4jlp067cJ/ml85uA0SU2bjvGS4tyhi6oel54iIC5Lzlw3rV7G
	xntHEwqHjgVqLzEqXgwYXK0vMqpvaq4U6+/NqxH5/JC0NEbaLFaJpoD9NyScyshsxA0z+bNcjKY
	4P5h5yYqQjeRfCB9NQPQmrJ9mcy6J0nJc3eExiyWE42vMUjhdoMn1oXiKyzEV3v9CVtq+eilzt5
	kKpaAf0oniebSUcHIty/B4cidJXVVctalSljuSkrBInoZnCxvnizoau34hlhtUkgTRA8ntR61tD
	zKMzVVtfcAv33ys1zeu4zZb2vUfLNghQw84Oqg==
X-Received: by 2002:a05:690e:480f:b0:664:fc22:36cd with SMTP id
 956f58d0204a3-66521ad34dcmr7426372d50.43.1783085167252; Fri, 03 Jul 2026
 06:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-6-wenst@chromium.org>
 <akeyxn390mVmYo83@ashevche-desk.local>
In-Reply-To: <akeyxn390mVmYo83@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:25:56 +0800
X-Gm-Features: AVVi8CePOG6OpnrlSpGFhkpL2GOtwCFUk_NB8IIc5qFTOLO5i-BW3OK69XKCfdo
Message-ID: <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> Now I'm more confident that it does not mess up with ACPI case.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you and Bartosz for the reviews.

FTR Sashiko pointed out that this is likely leaking a fwnode reference.
I will add a fwnode_handle_put() call to usb_hub_remove_port_device()
in the next version.


ChenYu
