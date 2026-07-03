Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7C9321457
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 20:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111955; cv=none; b=DlUe2lhZ2ptGlg4R9zxzW09jFu290TqK89W7/8qfd6ekB8sbfFlpOq+nRGD/ooYzMQG2HXTuxPplBCYg/V590oFEV7jUL5ChTlCkxE3vNlHmB326dIAJstVx722UcWK70OTmsFZbKTmXDPP4xYtkFwNawdCtqObUseMz2zAnLpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111955; c=relaxed/simple;
	bh=wt/Y/VBm9jQ8oZX05QzsWI0VN0tfpEpyiUq27wvdn3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUCCI24VEfBWvd+8w0cW34hth88oxzsTxncC3JJY9fXqerHvCEVQK4pxa6n6+ght14q7O+mJ98qlQg9pKvLu9vstz+N6D4zMraEugG1or1I/LrPT982IFOZ2L7XoLg56aCGRFhz1XkD+LeJ+q1IkmHCh2hjYZUyhlVLj3e5aJ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQqbJ/YG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQqbJ/YG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C9B1F00AC4
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111954;
	bh=wt/Y/VBm9jQ8oZX05QzsWI0VN0tfpEpyiUq27wvdn3I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VQqbJ/YGUszFi58UHxDRg4+gv/EeVD3b4/nifpk+ZcWTg8vvTdFywW/SEJbXkHUBa
	 pc39pjtcW5oGImGPPQVPdAIhc4U0J/0Yz/KrCNmqc+irf08F+bNcCfb95jh87IElCt
	 1BhYtgBqvqfni7ppV7QDC6C4fTJv++6HAWYFJuMneDRmB5V/IBk8qc4JNGBqR4g8/o
	 OSccClfsd8ZrfBQ7v4+c2pEdsf0mCV/anK/uqWxwT8/FliVLzg6QHeM8jsbzgm6iKC
	 VguTeR2z3AFhmb4nj7bGniokps0VlBMm0LmOozO6g7wdf+K9BPvBs3qmRaehxhS4FJ
	 uaRFsJzP7fF0w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b1eb7bd9bso8228211fa.2
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 13:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoqcbRkuRzPAagQuePsCvCG8nVaImYLHn8J5ji3gP7W8qTpOSmdESiBrP05oN4jpUYLSZSE0F1nBw0KUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKSKCYcwueiTfnUTQO6kja5D/uRQBqOrA53fyClyhFAy6eGXc/
	8IpAIse9VgfZc2WMhHX0Uh7xfZvAPiYN6EOKiVREmEH33S/A34FbNy3TzCQOQXmYALBayyFDihO
	6TYPNgvWZdny9GjCwG/QTXdKaOPa19LA=
X-Received: by 2002:a05:6512:39c8:b0:5ae:addb:d657 with SMTP id
 2adb3069b0e04-5aed509e880mr90216e87.27.1783111953486; Fri, 03 Jul 2026
 13:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com> <20260702130903.1790633-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260702130903.1790633-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:52:21 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6+WzWD6BOMN8eMX1TpSQEDerWbFZ3NnNH5rJDDH-zSQ@mail.gmail.com>
X-Gm-Features: AVVi8CcaFsE80zYcabnTKlRzOWP_CGfHj72Ym9koD8-F2yo-TYXMGjIKbc9_z5M
Message-ID: <CAD++jL=6+WzWD6BOMN8eMX1TpSQEDerWbFZ3NnNH5rJDDH-zSQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] gpio: regmap: Apply default resource callbacks for
 regmap IRQ chip
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

> When GPIO regmap creates an IRQ chip on behalf of the user, it also
> takes an ownership of the respective callbacks and driver data.
> With that being done, apply default resource callbacks that keep
> tracking the IRQ requests and releases.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
