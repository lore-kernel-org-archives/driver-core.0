Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA9429CD9
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784891398; cv=none; b=dfcV9Wl0tO7QRS5AbzaRCcR4DKqu48cj7yCwOfxkFn6F0QG0cYHtgjJ2IbqTHKjIvxxdEggv98azSHpJvUeZ0kwf6BWE2vexUIUqeIMVvK1w57AGKlpJzYDnBc6ygmHMgAOa1fGtVbymruIuPZbZbahr3h1udurQjsjQYA0dIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784891398; c=relaxed/simple;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ae9wE6/R+E2W3DPVqWS+kVFJy2jY0IO303nnMreiQWvYAjkZi57/LcGeqprSLk9nEk5D+uKX1FRX41Rrb9Vyona0V2i8RLUb1ySM3Vrkt+lbKLMNEWDpg9iIEmrXJyjjoZwk+WPNoqJzt/O4walxm1LpvAV9cYEIhI+DFPMtRNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK4VjEOE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK4VjEOE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC3B1F04280
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891397;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OK4VjEOEjWaFl6QyeCRrAWRB/E2uSmQXs0d/YZuPmaPkAHEQjL4a71DGIy9siCthN
	 iJ3KRck3bnKt3HKVj3Rc+dVQ4eFqEPeL2OC54YQyG97pUX82RqvdSEq1HtecPH89MV
	 OuvofpKBDiAv5jG5vrSiwkydGRe3dCtuC4Hx4RJlyqaImj7GA48Kg1BX86/JLQJ9Rg
	 dY+YPXTahfqcenyJQL09jeiVfkGtJLThWpkQzSsPW1QpBt3luLaTZPnVYWd59AP5ag
	 9Qh/4+5bso5yqWdT8wYI1cEdcBgUVct87o5i1vvXrXP7CnA4Jd1hvuggoqXHSFScB0
	 x6UV91RdUmm3Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso332904e87.2
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 04:09:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpr4MnIJCM61hQpwRFJIbjZmlai+Pp3RCsRUCP/5+QJ7+wYrjSDgY/GHgP5ZwKaoPjjR8lqoXgPGjXu2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWf1EIjuxoI7EXLRh7sd4Hc0KBad2jWs8ayCPsKolTY2iw0W1C
	oYVUPt+8iOX7EiJ83jjDJyPWyH9faEeIGKNE4hjwjyH/kynNlf2OlSlB4E45/pg7hxbNXvr0I8i
	od6tZ6/WrKN8pKTDhsJcn3v4LXVDs9irJ65WSEpFj0w==
X-Received: by 2002:a05:6512:128a:b0:5b0:e14:777c with SMTP id
 2adb3069b0e04-5b2b2f667a1mr1625122e87.22.1784891391963; Fri, 24 Jul 2026
 04:09:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724084328.3943997-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org> <20260724084328.3943997-4-wenst@chromium.org>
Date: Fri, 24 Jul 2026 04:09:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
X-Gm-Features: AUfX_mwiB4kLYEiWsY_exPz74ryChUmU7NeF3R9wpx0QdX4G4TNw4501T3DhVLY
Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
Subject: Re: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jul 2026 10:43:12 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_get_state()
> so that they don't have to reimplement it locally.
>
> Instead of just on/off and error codes, the function can also return
> "unknown" state. This is in anticipation for "uncontrollable" power
> sequencers (such as GPIOs left unconnected).
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

I'd have dropped my Ack with a change that significant but it looks good now
so:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
