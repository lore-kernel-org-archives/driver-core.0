Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595733D648C
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084817; cv=pass; b=YHQw2hRkUHH/zlvhNCtqWGh90DMalLL9SVRkwCQ6FhNwgO98dAdJ8laIf+1Acvtel5APh6HT3RM+Cp2ZTrZepbIt6fNv7zSrm2V4mg/AEksDvk37zhNjBCbgdMDRy/lNJcaWHhPbSkrfoluS9WS3qCgVLUymz8o+scaxy7J/ySw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084817; c=relaxed/simple;
	bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJLfb/VIBqaBK4JN8/pNbe8Qr0Z4ZpUkP61l1vM7MKWja7rvNL4L++fG9jgw9m6AyVuGqdFoqCSeaQ1xnDfQrK1ktv1O9SmFX6Ph7ffrWtRSj0osjfUvtw8alX1oR1iJb/OF3AI/T2X48F+HI4lmQ9ZgyVDH87PLw1gqOk4fuUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N8j0RqXL; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N8j0RqXL"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664b3831a20so757187d50.3
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 06:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084814; cv=none;
        d=google.com; s=arc-20260327;
        b=eWmgMGR1LCeYfZLc2UVg6P3bN+g95YTHbtbhWnWvT1hu0lVKv5XTDoRLL9YOGD4EWb
         KJL5taZk+BahyPdxgFi3v4Siys7FJAM5vUsmbq9cuxonth7AhqBI1+QqwX1pmx7sEvMJ
         iKWYg2yQ4cFrJ84TsdwWW7+mhEgtRuMjTIX0FrJNIISQMlvfGinVSb46KB/qAcfWpUAK
         1P+8eCJer1Y5cOqXHQdX3M2hwzDrSq0yTvA0vs5bviM9eY8T3f0I5q6rFGAspYoEFa/R
         freBD1Iq9PYlP7tRNI0Eq0qcSFFjKr+5EqhA61GYweQcNgvsGJTVhFz15I/RmuguE0Vb
         7Gbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        fh=DKdrIODH1oFLvznEGzfoeBrMW8uqNg6LKx6d44dpaVY=;
        b=r+gJ5YtMdrSL3+aTVjQeLRSNF1LrD63hUGNxPV9WMhSC4i1RN1vVm12UbpA24fE+Gk
         OjSyl5XtVR+q2khOg8HOucR/NELtetFzGO9pmiwkuyYe+LfSk40t8gaKvuEHHEg9zuAy
         sz3ocFm+vS5YzHhhGrapwJ4mbBwwiWmqAvxniwHvhf5lDz7r+T/hYCdseaj9/6g3wcCy
         Dp+FQidvF2r/+WRpEWqauhDbu2iPXKe2+vdUD7YrTKbxZPcvtXY7M1ynpIIw0onCNQGM
         2KjB8jXHqoNpAxovJ8xhomY5kGT7wegOLMF3EbE6Ci3VHo5zOkbSB6korOBI+f7ZUKAD
         bZUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084814; x=1783689614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=N8j0RqXL9QNHN1AC8CppxwWeaOYHdt8P51zw8DYmocQKKIFv5W1Qx8f4q/Ea5Mk3Gc
         KykQgE77DYyJ1efACWdbluGh80UUUYDmokirYR5zHerwEaPG1eXjy4fx6azjy6o8XD1/
         QxMzjx0czCZuez+DXZFWsdOV4h2nLf/T3M5mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084814; x=1783689614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BQD5gv36YoN9ZGBbl8CZ1ceMTLNRoJhvy7PP72AjYTM=;
        b=VUR9EFahn/cX98O8NI4Cj60bvenUcN+duEwOJAyXPTQqy18HuRVsXRyTKusQ94ju8h
         MF0Zkohx0F8EsULyJnaDkvFcA8Dx4RmG+j57uHKBwiDeUEm6FpljKjCRZm1IHidDH/x+
         Pf5VS2zBsaI/KQpdr7iBLedV+PKVOFbDOkoirPENmsD2bqz8oisEPeOpxIDo/Y2i1rOe
         8LFju3Y4nDygJf3E50b+2OXUr93J3PVZV1NDeMO3tbpV3+eaXoTgAfC8sHMbjSRibuCI
         gJOd/wBlisUCmnl7NXePwqI+NFw9hu270Ad+gENB/dNCGcoBPwmA+0aCYkY6FWdN+vSk
         mfyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1sbbkrVh+pxmwf1sZfQTPiyO/bEuJy4IskhZjKHJyNaymqfnxRiXsdtqzM3auGxW1qKZ/1T4rEj2uTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNyg26PSJ7AxQu5L6EQAsjfDdp8X0x2sPCaZVcROhuzRA5alJ1
	aYOywiuPq087/n00IDEzElVW+4i8rEDU1GNoi8GPfiQbcbr8NMw4PczzDBHDB8i22ZvtaB+5A0z
	RjjFmQmQwLKWuPOnwo1YNFdr7ysz2EvO2R/yt+UoH
X-Gm-Gg: AfdE7ckDFdNKXzmuYxCkWUZmsdBpTFn2H3fbgViQ90uLWhmZA5soo1BFuudG5wseEoK
	Z3ODba+fVHobILkr+PQc1wBG5WFbTGtZEGk96Ruosifl+N6qLR4yFxmyJWXNr7n5La/0f8Y7OUc
	XJjXHVkfwHlHHzqNs9oMvIhSNT6QJIKsdiI3DDqs+mTWrjTbbJyXnmuBXBC1Yd5hWh0IAu4l248
	X6bX+KWuVThQMsarbaTr9trvSvqE4lz7ElAv8yutvTyZ8Cd5dlhr7KNOT3SKrYckHULlCY5m2k/
	PB2YCDhUBk1NxQ8piB3w42JzGMc=
X-Received: by 2002:a05:690e:418a:b0:664:ae6a:e9a5 with SMTP id
 956f58d0204a3-66521d54781mr9923763d50.75.1783084814296; Fri, 03 Jul 2026
 06:20:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
 <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com> <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
In-Reply-To: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:20:03 +0800
X-Gm-Features: AVVi8Ccxmi-jSFxGKDTUuToCDHyjKIoBrT_lajnjop8tp06Df09KPZI8Is_qoIU
Message-ID: <CAGXv+5GH3navtUC-V--dJOEjqiDtOauXf_TKxzdQ_T+bK_v9gA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
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

On Fri, Jul 3, 2026 at 9:16=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> >>
> >> So this is only needed to not have to track the state in a separate fi=
eld?
> >
> > Correct. Reading the field is not the problem. Updating it is, as the
> > fields are packed bitfields, and Sashiko suggested that locking would
> > be needed, though it may have been for the peer port, which has since
> > been removed.
> >
>
> I'm not sure if it is. The user controlls the handle. We could argue, it'=
s up
> to them to provide synchroniztion. We only assign the target and pwrseq f=
ields
> once in pwrseq_match_device() and only change the powered_on field later =
with
> pwrseq_power_on/off(). Unless the user does something weird, we should be
> alright. Maybe a small note in the kernel doc would be in order.

I was refering to the status bitfields in |struct usb_port|. As you already
explained I think the pwrseq stuff is fine.


ChenYu
