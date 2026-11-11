Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386658;
	b=JHYGZ6t8VHpxF0g7AAJ3MgUxrUXjSxtJL1FByDZyjmv/FyXzjwBiWLHwncgsvZ6GVksx
	 x91DK8hys3xCyEl5jHcKDeLSTf2lBRdRX3JWQssKL4Mt796y1bY12jkhkTeyAY0KS03xr
	 9TVO+vXqb+yucI/wrsRJFyOdye74qT7zG4rMLU4iR83Acmg7OkSkrnv9np5/QUctSjVeg
	 Xi7HuUFlfrRKMZ2hAEgVy0Qu6Bj7BsNH/XwIW6wamnTFbfmam5ONlXVwe7bDW6KdLcMfq
	 qgU3hBHTIXfsPSAb1+3CsqH16LYKm6nJpTvdQCT8mlwF5cpA/igCLAuzYSzn43dHCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386658;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=kj4d2juRbTUyjRObk5lhKiw8KbvGP7+NJHQ2SToNLJA=;
	b=IZ//hMYJt4bMxIWKWIxyHoH7GRhybWoo/lS7Iaa6Jpq8+6tndUvyijVBirtjZQXDJYXe
	 vVDK8zV0Db0CIXX4ZYd351IrBkJw3PUAQG6x8GXZmOpZlmhdyPRjinYjWrnAp0nQYrkWW
	 SFF1eIlie31SfVzGJ+P+Tl+NWui52AWuwov0ByLsGTN1IzMbICLoOIsdnl1fDEdpJPeQz
	 84dbERATyq+xNJgNfgrrKcBFZmIAB6aEaoOydbrNFuLyOk17vbo9jpTGy2fJlRcw75A9G
	 OWxOVA7AWede4qyHtn9wBmCSoIGqnxwzfSIGurQK07+XLymFUZ7+YfImvLb1VTAcIkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b="4q/KfQgV";
	arc=none smtp.remote-ip=216.40.44.17
Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D760606A321
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 08:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D760606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=4q/KfQgV
Received: from omf07.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id B1896A794B;
	Wed, 11 Nov 2026 08:44:13 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id AF7D02002D;
	Wed, 11 Nov 2026 08:43:59 +0000 (UTC)
Date: Wed, 11 Nov 2026 03:43:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Andy
 Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel
 Scally <djrscally@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>, Johan
 Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Len Brown <lenb@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Linus Walleij
 <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@kernel.org>, Tom
 Zanussi <zanussi@kernel.org>, linux-acpi@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/5] string: Add strprefix(), and deprecate
 str_has_prefix()
Message-ID: <20261111034352.5c45e30f@fedora>
In-Reply-To: <556766412884389a7cecfe6affcc9fa3a78f9807.1794323750.git.alx@kernel.org>
References: <cover.1794323750.git.alx@kernel.org>
	<556766412884389a7cecfe6affcc9fa3a78f9807.1794323750.git.alx@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 9reopibxfacub77xym1aj6ezurap8jk8
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: AF7D02002D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/dz/mQgZDwHS78NvaXBjDCWjyDcEshuPI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=kj4d2juRbTUyjRObk5lhKiw8KbvGP7+NJHQ2SToNLJA=; b=4q/KfQgVhXoeg8xxMeWFbqjrWg46MH1GvbRkZIHunPPEhGE2FUz3n26rVbQKu7mQEd3oLUVEREy1FX2Z7IQPxf5GoltXzV/840+Y6haIl3aFDHw3C1e6iwsAhmkyrsa0rV6Ud+cjmoPNFR4DjsrldCCabHIkWJ2YSuSlxaffT/k=
X-HE-Tag: 1794386639-904136
X-HE-Meta: U2FsdGVkX1/C781zNDqzzzHmIbqsmLh06ijPMbUYTNeFmEftFAzWFbEeoukyycUuSbCaZii994t1DsdsTGSfeaDSTYrLJIKWL0NXbWbZyZRqYcTZtA8hOGedLXB25zjW0dUgWN8qmnqKDkOX1Sa+103QOaHyhExVRadf5Ttml/P5URtJEB+pEyGY56v/iWfRffSuoBC69xXt0ioMcQUxW3ka6yhxD7p0Hfg2UVzA87r1+YwE0GTPH4nQCr6t5z4DBNkHW7EAKQli0TZEiqo8Bq+Bdd73SWVl5pWGGlU/u6CSuuEuopC9IQKy8y0kS4BKyg7ajHjxBP9sI1/eA9aMLuoKckNRCBTB

On Tue, 10 Nov 2026 16:33:23 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> +/**
> + * str_has_prefix - Test if a string has a given prefix
> + * @str: The string to test
> + * @prefix: The string to see if @str starts with
> + *
> + * DEPRECATED: Use strprefix()

I'm still not convinced, so NAK on this part.

-- Steve


> + *
> + * A common way to test a prefix of a string is to do:
> + *  strncmp(str, prefix, sizeof(prefix) - 1)
> + *
> + * But this can lead to bugs due to typos, or if prefix is a pointer
> + * and not a constant. Instead use strprefix().
>   *
