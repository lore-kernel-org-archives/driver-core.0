Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794019375;
	b=dFcCRaXJCy+9jq6QQV/5Aq+jzYSeSv1BCmUiqa658mqChxS3rMLHVky2QsT5NaFEi+0o
	 Xe1UoOACFq4ictwy9m7/9WkP57BPT2cbLEDyIeTTAvuoY8iy1Behmv2KD4zsMODgGFg1Q
	 TzqAdRDH9r03Wm5jiF+B3zP98sLH9AG0/0+eGcTkQQzCcJ+/9k97UFtGAGXAvcbmXtl6u
	 Q9pKu6QQi0/lQIH4OO+CVyFruOAEVQw5Ne2VkJvbFPli9OM9FAxUmDgtIOvs+39ASKxcq
	 TmHUCJTL+UiNSBNhmCnXNpyohNcX8E7GLvT9qR6Z1Av0U5dOdmFYV7/OJPiIWZza0wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794019375;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=MffxbctNv2bCdVZsb9rc7DcML5n2OMFxNMjPQqh/vjQ=;
	b=dJIbDZtIg/Mj8XACtbNkQuszDvToV8ZxTRXHwcidr7GFW7PtiTG6CFmn/j1zPeto3hW2
	 hx6ttvUYFQtwObUlOkizuAgtLg5WeJlFbql+FFu+hN2yDF0LqHsrf10qlLS9yc9BR0Bjq
	 2B3qgQzwPppdcLvRbvKazNr6osK9dnIHR3pKZSTt1m+QhOKYDp9swrSM5TiSxrZpF7qYR
	 ydzZPNw+0ZHPmeVMlHfBNLmyNJuKcGxwegBpJygqZDYgWsZ0IqhZWk2gEHg+R0QWo6bzz
	 EhVo0CcV7ezydcfQ2Oc0/v7zr+P0j+79lR6cAbsICciQIq7s+G+Cwh7hnq5g3ykFQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49564606A32C
	for <driver-core@lists.linux.dev>; Sat,  7 Nov 2026 02:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49564606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 133DF92009E; Sat,  7 Nov 2026 03:42:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0F88292009B;
	Sat,  7 Nov 2026 02:42:52 +0000 (GMT)
Date: Sat, 7 Nov 2026 02:42:51 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
    Bartosz Golaszewski <brgl@kernel.org>, Alejandro Colomar <alx@kernel.org>, 
    linux-hardening@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>, 
    Andy Shevchenko <andy@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
    Danilo Krummrich <dakr@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Joe Perches <joe@perches.com>, Johan Hovold <johan@kernel.org>, 
    Kees Cook <kees@kernel.org>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Len Brown <lenb@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Linus Walleij <linusw@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Saravana Kannan <saravanak@kernel.org>, 
    Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <zanussi@kernel.org>, 
    linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
    linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add strprefix() and fix a bug with it
In-Reply-To: <auyV47xUCr1EJ7A3@ashevche-desk.local>
Message-ID: <alpine.DEB.2.21.2611070239050.17804@angie.orcam.me.uk>
References: <cover.1793876837.git.alx@kernel.org> <cover.1793882260.git.alx@kernel.org> <qwpovcqznx6eltou4inmj3v62qhh6ouvihqnze7bobnd7lmcbw@rcri4e623icb> <auyOkL1Vb1iKicS9@devuan> <auyV47xUCr1EJ7A3@ashevche-desk.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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

On Thu, 5 Nov 2026, Andy Shevchenko wrote:

> > But yeah, I can send them as separate threads, if that's the preference
> > here.
> 
> Yes, in Linux kernel majority of the maintainers (a bit of speculation,
> I haven't counted, but it feels like this to me) do want separate threads.

 Cf. Documentation/process/submitting-patches.rst, section "Explicit 
In-Reply-To headers".

  Maciej
