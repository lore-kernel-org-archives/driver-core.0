Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496E44B693
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804485; cv=none; b=M2/9BPs7UMrvPwRBl5CqhQGmxsbXL/mpdvwMCT//wxkuQoDuFxnnSymOc2XtUk/ycW3CrfIasN7QUt6B2qUW4CCTO+I1FurSfjo1Ly8VfxoNLhAbHf+h6EVeUIC7n9uSb0B34kSD1c7OSYzGHb9pOzW7yumfebj33pg2pfHTbFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804485; c=relaxed/simple;
	bh=uRPXyog4cbok1rh/frWnC3pgODHYNSvYUNNlr/vO9xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXwMrHZzKK8EeOvH4ZbpUVwxrd6pXzu/IKeZQ1RxRCGlFKrMsAeSd8L5DJqECXbHjEL6c8IylbQeFW8UxNDd7fELLhLVOaYM33u4fjELh97/Ylt6Xkd5nPuwjTDJRH0ZgdiihHJnWeQroZswPesUccz2JXH06jxBFn9dGm5yCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nFjmVXQ3; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nFjmVXQ3"
Date: Thu, 23 Jul 2026 13:01:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784804481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oWSozt3sBOqlnIkNcGnrfrqysXqsisZD4CxuNmHDbc0=;
	b=nFjmVXQ3dbFU3sg/DUD7S4bCt4bbn8T7LAf42nmeUCvevCdjOSBVGSYyOYY+aQlZ+QJu3d
	e+XyEalqW7mp1o5dy7hzH4s+dAmhj+0izVK2gwIvAfxDkcnzy4T1rofUpKoOlRnTLd9b+o
	Q8+fRJ7nev5zvBgvvTr7vGM12cufTLw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Mark Brown <broonie@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <amHznORUaOnUFyS4@bombadil>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
 <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
 <amD_vkMOrtKq5NvX@bombadil>
 <20260722201622.GD648629@killaraus.ideasonboard.com>
 <amEvJBOE3Ja014Ap@bombadil>
 <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <525338f4-cad3-4acb-94c5-a4b71cde9c02@sirena.org.uk>
X-Migadu-Flow: FLOW_OUT

On Wed, Jul 22, 2026 at 11:03:09PM +0100, Mark Brown wrote:
> On Wed, Jul 22, 2026 at 11:58:46PM +0200, Richard Leitner wrote:
> 
> > @Mark: I understood that if the fpga really intercepts the I2C bus, it
> > should be modelled accordingly in device tree. But what would be the
> > preferred implementation if both devices sit on the same I2C bus, but
> > one is messing up some register reads on purpose?
> 
> I think we would need to have a coherent understanding and description
> of the actual issue to know how to describe it.

Understood. I will try to figure out how the hardware is really wired
and come back to you.

> 
> Please do not add random characters to my name.

Sorry, I didn’t mean any harm.
