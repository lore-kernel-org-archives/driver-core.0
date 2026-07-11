Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687D2F1FEC;
	Sat, 11 Jul 2026 23:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783814310; cv=none; b=eLReTjilniMRtGU4/mNRaQtJa/Zh1AA3Pyiqg88ogzrR6EjQRr9a/O9pws9tiN45G6b++N90/Xjeysa+Z3r1GhmYCSV+rxQLApQZkABWLga4Be/jOfeOyN0ZydfWSaHDTkWxZpiJgN3a/3sfJNS+1cgWyxbFrj3dwMIZDpm1Aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783814310; c=relaxed/simple;
	bh=RKukBuLquIHlnuBjPLWH6zWAGPo5LVl9KxagkhZRJYw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rNWi3Gz1CBPn+NF97Ih8WFN15T1rU+ft2zeWT9Ndly4V4xCCwXbXkPtdop/Z+9DWR1JsQ4sW3wewe6PQ7tQGPyfPLy5kVWDYoOnOuIc22WCLVgva1BV0gfycziISSa2h9jMBeb5ajiABFv+0G/8Xpvfcl1KOpYlFq7PESbejzWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lz5oT4QQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lz5oT4QQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E081F000E9;
	Sat, 11 Jul 2026 23:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783814309;
	bh=9i6EK1zfSxWdW1t4pcJC/6exj+j8G86l8fRJzqpPWTY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Lz5oT4QQlVHN/COXRhKOk4ioe7ggACqQPBI1kDRfDGcKuvrML7o2CdXo7uH0lftFL
	 SuHZneJ/0bCWzBYlNrrkWBcn10W01fiXpzNjdqrTHwEjO/TQymUFg/lYfHSaeN4c4A
	 s9tLs/GPVx/Pnu6paUoJL7nTyR4vZPdeo9J1zAtisuiUss0RcVQkFHp0YMDCOS1HpE
	 pyEho2px2S+j/TbwPqZseO68lFqc3bhmvqCYVYsOleoAd0NJuJsIG5LricTtQ+0bGk
	 eG+XQmyqf6pIQKfKuYqoihG5OoaueJJYW8vik0M/VYON45aByDuj1vQgQhUHhnvzHT
	 WnsRovZMf4z9Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 01:58:26 +0200
Message-Id: <DJW5EBHLCXO4.PFQOK4M2ZZ48@kernel.org>
Subject: Re: [PATCH 2/2] firmware_loader: builtin: fail build on empty
 firmware
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
 <20260426043041.649202-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20260426043041.649202-2-dmitry.torokhov@gmail.com>

On Sun Apr 26, 2026 at 6:30 AM CEST, Dmitry Torokhov wrote:
> +	if [ ! -s "$(fwdir)/$(FWNAME)" ]; then				 \
> +		echo "error: empty firmware: $(fwdir)/$(FWNAME)" >&2	;\
> +		exit							;\

Shouldn't this be 'exit 1' to actually fail the build?

> +	fi								;\
