Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C0E273D77
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111925; cv=none; b=Qhwv7VhL+IcNA0TA59hjXHwDhouoMSKFrfEeFRgRSfIBCRSYhh/w9wSaePUbeBlpxPU3SVWuAy+RfRLwQP4zgHHmuqiiQnltSC7Z1ggUZMcRbYpTpUkeJzIYm+s7o1RG24E8HtymW3qyu+o6Ut0VJHylsvZ01P4bJrEQuEb400k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111925; c=relaxed/simple;
	bh=DomrWvlT+P8Yy4YQqdPRfwEPtxQD46IquFZgVuDuGbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDTM2JxkNX4J/LhyBZA3/AjZOMO9SFSXodU0ojF0T6dIKqIi+TIJ9V+ZVcMxCY9XimC0Z26Ok0nwXm+YLIQz37PO7T34x++hqZD6MmmQWcorsFlOgcFBYedaJMlihUBTW362PPr4Ym80+VQ3IAdf9dBA9auoFKz5vjlCeMz8LQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbGh+74C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbGh+74C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CE41F00A3A
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111923;
	bh=DomrWvlT+P8Yy4YQqdPRfwEPtxQD46IquFZgVuDuGbk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VbGh+74CIWVY6Ugs9RN8Gbj9163v88eFnptdONmS5++7nPP2uB7V75GE4DDhYRD2O
	 TVzO2QsbR+NpbbT0q0ccpInlakbbAFNPxOx4rZAZ3RSU01BW/Lrb39Oli1SKBTjSlj
	 V1EHBkTnUphQiMsZ6Tax/FEDOqDKRjdbWdG0Quv8dca/buBQgvf6/Qc5flR4tZH8QS
	 qf9Xi2pNk0wcGfJ1vKJxLXQD9vwLjUA8/QoYFVEypAicp2eROSMWgiTDHh/8SuzLe5
	 /ijahFvkJKVYRukhCqNn7PbGLDjz4fXMHPS0R+30qj5HimwdieyCoqEfhvmUIQ3FlG
	 9ZHFiQr7bRWhQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebf9a50b8so1023881e87.2
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 13:52:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrMoJRqwWdnaBSgAkRuryDlCVA9qMFD3RfujZP14cXtTWKT04e6j9CVBuqmul0u9G6C05wkAxR82eWe1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjgWOSZbbq2eWqjRti0QXykDeb6+ITsc/NT+hSwNvqFVpyFBd2
	4iUXBBch2iCkJP17tIqQUh2i+BYqvm2xisMXAF9vt4iiIRhfCIhodi0rSuDnvAH6+Yrr1fdNcc5
	qk5VUh4X8WUJI+l7vv8u3AW3kyZFoMIk=
X-Received: by 2002:a05:6512:3990:b0:5ae:b88f:311e with SMTP id
 2adb3069b0e04-5aed4f8090fmr92818e87.15.1783111922361; Fri, 03 Jul 2026
 13:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com> <20260702130903.1790633-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260702130903.1790633-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:51:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTJjV-rgCH9Db3cCWi0BcY2M_GZxtMNCPu2Yj8htZXkA@mail.gmail.com>
X-Gm-Features: AVVi8CexkRAwt3JT7JA0ANlKCNAAR7w-QY5g0uaCKxRL9gXGlNRo2lIpYK6UW0E
Message-ID: <CAD++jLkTJjV-rgCH9Db3cCWi0BcY2M_GZxtMNCPu2Yj8htZXkA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: regmap: Order kernel-doc descriptions with
 the actual appearance
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Yu-Chun Lin <eleanor.lin@realtek.com>, William Breathitt Gray <wbg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Order kernel-doc descriptions with the actual appearance.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
