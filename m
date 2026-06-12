Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CAB36A022
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 07:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248035; cv=pass; b=EyCndMOYcGEVS55HP1p+KnsgFvMr4tpusSvglsZguR19GvOp3bozKuNtt3T6RrpBN7eycgdhujkAj1bhXwW5Pi4JF5JzpE5GIXx9qfapVYgQA931e+r1RNYysTnN6NOKzeC1kRv5yy1+IJ12fZqYYDS/7fHKZWXeCZMDXTTY1cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248035; c=relaxed/simple;
	bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BX/3yTFXUujDzOUZMj9TqxhS3F4QyRU4jOpkL9SCaTx2jumHGZLBlRqpshfjUlXlMQMCtV1z30a+f3OyVtgZuLEYiArLkSFEeVH6glBXidHqZNF9qsPrfZunJPnuBUQIWqP/7JlDr3knqzwKoM9wDXeWoyh2Ok9XmGkE+WEzH3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gYxIfk6M; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gYxIfk6M"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7e2f3646c10so6960527b3.0
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 00:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248033; cv=none;
        d=google.com; s=arc-20240605;
        b=cV6/lPfIOHuKtRPfoLHrqzQ4BrYySxILppapEdd2RHCTGE5496mVW8r297rrySD1F7
         clt11tK8HChWnrxW6/D71vYdMw2475Th7TvUja5HF8uDJ1bg3O/1FMG8f9z/VicNKOof
         bgZQpOaJ2DE0D0uC6CBXpd3EX84ip0T5ZBCjlR1t1Al81MIsKs6NQY9yppX/llE8eq+s
         UN2C5Qc/LL8H4o2SW2zzO/aGEgGgVE2QwZU9Goq9H8AZvDwCoN8zTc+Wo/+U4/u49UMO
         XdEuzndQ11eEdmu5wZzgXkVBJCqJLSDllfP8Tuz8vAw8OrCVAHdV4r0c4a1WlA39jpcB
         8QcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        fh=g4316es1eMl9TOXzxghXd2lTt/OpPGTxJPo4uM31Bp4=;
        b=CWp2QCHa6SHwHJoE1Vs0kDHt/q6H5z+uv7rMj17iUwa9Y5Ehhdfurci2JONg/VN3ug
         9WWtFB/2NchqRk/NGhflWHmR6p4/R46udxrqH/MzRqV5np+6Y68hvDT7iqYpiT2yKeJi
         HaAApZBQWUb0me/P6z4IedYATzCLsKvR1kflhUOatRB6I1wDkmx61Omff3zwkpSyxdog
         EwscZATQTwX4B7dILq1ye6tPXcPZhr9fMSP5L25ML2EjQU8SjA9uCb8al3N6AhU2OIpG
         Kut4qxaxoG4+2u4MCCOy6V/LXtz1nAZorvlzWPD8O9SJicr6mJkOTZkKRewJZ4Ii6D+q
         biYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248033; x=1781852833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=gYxIfk6MtLEfYhygsJu/IviuL2jtjjnvZtBTpUW4fnp2SnEsidRUxIj1wZUB35gl2/
         bwKZ5sR9N9TmdoO684YbmQeHYXic5RYfbiwdMoRWLTu6eq7fXLjMXxZ+4NNDzukhyRYt
         coI6OWMgxq8LSP+4a3LAzjCerFNVEvD7r1H84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248033; x=1781852833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5d9WCaKRJWtKyrzyOLIKLSZnATYEhNsU0US0PNVOy0=;
        b=fRvhRv8v11aKiqIqtFpD8sgsNw9VKuyfadeIz0Y/LzAy4HnGsQDtvH+gvqBMYwbDPw
         fNY0hV8YglVn5rCHTILKs49TsPQ758MI+lRc0pK2b/f25MpJzvRKWLOAlsDAfH5sRXo2
         O5jSEQOVnZHUiLqvAIec3C3o48QEEImfwyWzJwc/6Njs0gi0dixMSGu6HQmWklRnuDHK
         s+9tpHb39SqdsgatRDNztyyywxCtfBGe+PHfWOyuOMgbrHDhUrpcfZlxWs1D+532pycg
         DHJPLD1kD4QQzjROaGn1IwxBEGGjINtynlvcL7JNAgi2mFYBLCrrImO86IUbUjOcaRzM
         iqoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m5zegQEty21aMpo3cVGlcPPbcpz7kDXM+1ZGeE5MYgnpHAMi/zjtTuD1DMKeDPHN1lyt8h1fv77ZSzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH8DicHlF4kVtN4QXJ9AYiavfMuby9ePllmoH/SQXQx5e/oMM6
	NfYtTx0qtAdKipDSCPAHNlqaCl6a7Dc/6cixd+UxQQY2mcTjvvWvvKX9xdEx2HuURb2tzS7CvaX
	U0Tbhz0VkV3TofcFsRGth5o/2beCRWnmo+zJHmire
X-Gm-Gg: Acq92OG2lczuShZbtlPvkSb/4p9SuFu25j66qLIsgjSWwDgQ4QbrRix8wlxCxj2ztBA
	SlLA+sl9GhVdMfjNYvVBwYaH9hKNgjm1XFL1xvdSDrwvCDx8Wz+WEpI+VL6xyGo81KNVLvTuNR+
	+Wn8nKNBxRnHMYfPCZhNf6hjC5Gnu0gGZ93F528mLpgYdrWy5Lr9GPkPTY8YOeD387lBUxLlvit
	3UAHZ+AtBI1vexUfiKH+eq5FAm0nmr54fkFJwjDhNgyWxCJXpMK56GvTmqYLe7WWabCbIRZANnY
	Ydi7xrvQ
X-Received: by 2002:a05:690c:e3d1:b0:7d2:6b8:6e4a with SMTP id
 00721157ae682-7f7b6448b2bmr14221767b3.18.1781248032935; Fri, 12 Jun 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-2-wenst@chromium.org>
 <ailtMyYhbkOgaZWw@ashevche-desk.local>
In-Reply-To: <ailtMyYhbkOgaZWw@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:07:02 +0900
X-Gm-Features: AVVi8Cewi0jX5G3AwANJfv_JfU8wtj5jI6ryJrZRjeBtUWWvLVEyokylnfzsf8o
Message-ID: <CAGXv+5EZp0KvTqMde9da9mUWJyg+6X6Eon9Sqxx0VbikfVr8fw@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
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

On Wed, Jun 10, 2026 at 10:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:35PM +0800, Chen-Yu Tsai wrote:
> > In some cases the driver needs a reference to the port firmware node.
> > Once such case is the upcoming USB power sequencing integration. The
> > USB hub port is tied to the corresponding port firmware node if it
> > exists.
> >
> > Provide a helper for this.
>
> Okay, if it's really needed.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> > +/**
> > + * fwnode_graph_get_port_by_id - get the port matching a given id
> > + * @fwnode: parent fwnode_handle containing the graph
> > + * @id: id of the port
> > + *
> > + * Return: A 'port' firmware node pointer with refcount incremented.
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer.
>
> Note, the Return section must be last one in the kernel-doc. The last par=
agraph
> sounds to me as a better fit for main description. Basically check how ot=
her
> kernel-doc(s) in this file are organised and follow that pattern.

Will fix. I likely just copied it from the nearest function which happened
to not have a Return section. I did a quick look through and it seems many
of them are missing this.

ChenYu
