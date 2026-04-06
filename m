Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9043939DF
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503922; cv=pass; b=ZAhBe91kRqvAXQiO8l/7pPoa/fKYBpTwRAS/suNq/Gta2CkPGXhBvKqeTYsiaUbCmarR0eanG1TsLM/OfghNzM1aObvAnPqRdfMKQn8nb1FJr+G3HfZMcxnpRmaYRnO+VLrfs8rQgvXTwuIbI5UAWm+kQtjP4TfYd+QuIoptGsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503922; c=relaxed/simple;
	bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOvThVpup2mwtEuVoQxA3JSlSMk3ygV3FOe8omfFfxYfv764XaAhy0YHMA5bHqSl0L0UUHCTlNTC9hdLp1dixpHpJZisBgHTYPahvrZQndCFi8skQGrWZhG9AapxrpneQhXn7QODgV9tJFejlDFMKVvHLWYtgj/Z5WT1rdVUsH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7PJSYqW; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7PJSYqW"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so7826469a12.1
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 12:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503919; cv=none;
        d=google.com; s=arc-20240605;
        b=S0oYf1azOldz28HCmtTEg1ZbtObIgsZVT8KJhrPEVzs5FXyik/Xufb6W6dv3vx/oRu
         8NC/hzpGMYCxb9IrpCJScBQqNK/s5WvSDLJG8n/0t0W1DBJQOgKRRWTty4/jE1NACm8k
         OHCtED0Od+tg4YYC6hQdP3OoLxhrehszfzWMlsFbzTKLQGxkDwEIkszVapw+Zek7AHrm
         PSoi3+khlvUkq8WJ7t11EEG1nQnJRpAluqJfwKyqc2vP4oHUmOiQrMZBVdGTPBoBxG1j
         Y99WNth/wEC4hdj09knRUHYy8T68I2/Ltk5yPk+/BUXkNTxrJ4QkZIwyQ3V/XTxd3LSM
         Z5Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        fh=topCS6qBg4YRrKqsTN0PhKDgnuOKXs/A3WbgxB9uvKA=;
        b=WuQ/EAk1D3F/a5jjsOMacVyOReDjXsP2neVQ72mjTrmak1SmmkvjXMSuwclIT9zhZU
         9frHHd1BGp2287PmNIwd3aGUswDQZHDN2SKWWklajShiZFUvq7P56nIuXZgB0WDsXTgf
         DUZvJXMeJnBKvBrNVOoxdeD9Ofn37OG9lg0Xg/Wqfb3d9Sn17Ulyyrkc1Imbzu+HTZMu
         wuRjbIF+Ahe2Is95NXbTvkJZwqpsdTG6l+iZz81/ugePMfdUs068EZ5XlmSRKdOWJmqp
         Ik0TMOXojxo9ccPlgsWm3Fh/zX2T+nVjmVaR0evTqkN1PWQYqqm9CHT2dmlN18Lmj862
         AQ0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503919; x=1776108719; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        b=H7PJSYqWZ8+bZEht+HNB7uaf2a4aaZgWrxPws9qXsVszadT5KMNtdSM+hSeDaM9Wqk
         r/PTqi0OvNgmPXftzC6P2Qvez3oPEnIcqdVy3ho8f4VOQCrVwIz8bJEgM4B4Y+yad9+S
         F/NnT+52NejA3M5GlY19Z+bnIIfQ+13p+Afp/J/LlSWKaxLmP/Ewdri+jtGtbOILrNxK
         DbDLree4dyafXZADC36vOi9P8F3B3/sNhdYJgtwfVO/GCfYeGo8n+r5uMee1vrGT920/
         ocPa0o/Ml/hsYVzY8e6OqxBaFNyPw1dabckmXrdPtiHFWUj2lW2scu/MV/kBQxXDteu/
         dwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503919; x=1776108719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqMLT0sthcKy6wznYkh7Sc1SM3oGMGeO98F9LvQVTXw=;
        b=NypUWPm2ArPs8Df8ILC/uYyVhWFYobpsjbk+BytIdpvV2srge5q3oVP8ikpMSer9Zq
         ofKcSuJyanaLQpOzc2ncYs+ojNSwViy6uzRmiJF7mnEfk70QtAMyM4frHz7eczVGiVSd
         MlDopfSdOsyraNuPDy6kUPBHvIEt/60InKWzjNWkMA3GsEDPghGYFCbHmjqnZmd6IN6F
         OeBubm/tTerF7bTdwvoQaXX9K/I9Cn6Nh+AQDs9zo8M+UhEjUTitAhccypN+IwVlA7KM
         2h40/r0DrB3gdpPda4Hsfc7C67v/uG4MugIcpVNEwzeBeS9YdThbZEtitTNtya4YmqTu
         WKng==
X-Forwarded-Encrypted: i=1; AJvYcCVgeFlAmp9EOn973zx1f5Sxdx0rB42z4ObkGPeoYDLqjU219tCQXicACalj11b0oXs5Ca0n1c39kSidCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyiy0+ZBOU3DmGjpvVLSge+7cqDsUK9SIb3oqbhAdTdrWDJuSEe
	/JH5PM0lat3VJPdah04X52AIBLk60ziXW1YimMO5GlqQM+e0XvvXWggMQ2lHddOK+aUsswnFKlm
	sqyPd21JbTXYM96UWVd8JEps0jVZoqwM=
X-Gm-Gg: AeBDiesgILwyt3UNCxPIDnDaTwyOP5s4o4Zf+87dEpQZcmynBe92u9YAOnAk+7x/a1z
	laNAXsmz5ksMyLWnPTcDtis13uQ9bfjUgYZudNz31zQc8nl21E5ouIa5X5O08q0cX9PsTNYeUk0
	Yth8aaE51JNrFjHzS/le0+fTfNV/JW2F9TnA/P5slvai/xKYsrR0ZLfJkWc44/zB4819RbMPmS5
	0czQADMIgjh7YpD0yOi0wnOESsTx8o7sBMdojEldd9eV20UJz7HB17QZoxXLPpEWkbY8G4ElKVq
	Er6GM2ekN3TeFU5edZp6OKxZ0IQ5oK7fTbP5MT8C/I7Q73lGU8lDLJ82DXC+PImeY0b5RuRBGEH
	4ToOXEzg=
X-Received: by 2002:a17:907:9407:b0:b90:b959:4c72 with SMTP id
 a640c23a62f3a-b9c65596656mr612539466b.6.1775503918392; Mon, 06 Apr 2026
 12:31:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com> <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-1-7886092b28b4@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 Apr 2026 22:31:22 +0300
X-Gm-Features: AQROBzDF6KYTnuyhLB-pMUEmLRfSC888lHdfiDN5w1084rUmzr9JPBFEahloXWo
Message-ID: <CAHp75Vd7cs8tF1vRVFNmXsO0X-cgTJ_Ua22+KigdsN8Kpf-Tyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] software node: return -ENOTCONN when referenced
 swnode is not registered yet
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 4:52=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> It's possible that at the time of resolving a reference to a remote
> software node, the node we know exists is not yet registered as a full
> firmware node. We currently return -ENOENT in this case but the same
> error code is also returned in some other cases, like the reference
> property with given name not existing in the property list of the local
> software node.
>
> It makes sense to let users know that we're dealing with an unregistered
> software node so that they can defer probe - the situation is somewhat
> similar to there existing a firmware node to which no device is bound
> yet - which is valid grounds for probe deferral. To that end: use
> -ENOTCONN to indicate the software node is "not connected".

Despite being mostly for networking purposes this error code also be
de facto used in other contexts similar to what we have.
Acked-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
