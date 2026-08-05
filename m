Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3983EC6AE
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 21:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966045; cv=none; b=SPYsX8wcO64tyo0OzOBVic0grp7uuzAhWsbSAsAEjzSMqRDJgny9GerIe7asIpjrWy+3OC1JUqV8cgtet11hAH/6UvPk44keGOeYnv1Q+5Q9X0UK3vzgojxfavxB4q8+5z62T5777mKkXjU4CFbi+bgyyTU6UOY6OoJpJbIteyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966045; c=relaxed/simple;
	bh=50FVSbnkNIAdEySQzi4Vh+rTECIRXhdGcinAlgC9P+E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=j4oa5Z0yG7oU9Wn2eT9+KgXGrZz4QyOU3AJRgSESeLhPQj3IlJG4jhum47+MZAv656y9LFK21htHUeIzpD5q4J4C4zwHkX/dyoNZyuST0yv1gqXNjsPSu5nQqsc5gWM9TYl/B8tx9/7fycavUWSGxaFBnXH1YMrfMP6HjTgj6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DwrM+I+T; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JKexrTHq; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DwrM+I+T";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JKexrTHq"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 0D8F01D000FB;
	Wed,  5 Aug 2026 17:40:40 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 05 Aug 2026 17:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785966040;
	 x=1786052440; bh=50FVSbnkNIAdEySQzi4Vh+rTECIRXhdGcinAlgC9P+E=; b=
	DwrM+I+T3VpXF3mJn+se2QJNGi5aOCOsPlRnbRGIzHg2hST7AJSmu50nIOPVWfEe
	EsXfz7zC6MaPbhFKF88Pjnadqha6AlQGEhIKrQ2YxZQeqSllZB55UV0W3YylkIzA
	V+S3ReZYAumcj9kBddi5AoyexNmR9TlBY8OWCY0AnBo2/bIYuADlDGc83IsNxRd0
	uLYLLHn1DkE+agiTzRc6bea1hKfH2LuTHhTIxdTH96M+4jxuXr9B+KfzY9/H+8q2
	yh3ETCtgh6t0FFVwmx5CiaVu+gW8zK3oaaeFU+8IzTOGIWhRmpmVLt7u76taR+AI
	g5SW1mGCRJ12OE4u29vuYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785966040; x=
	1786052440; bh=50FVSbnkNIAdEySQzi4Vh+rTECIRXhdGcinAlgC9P+E=; b=J
	KexrTHqWGHfBUIJnWpDkcpgLz2Ny8QtvaOyX5QczKAlTNSfzxB4SVF1gMMfLmFZ2
	z3I9TdOiXf1AUfTk7flk7GJzeHtdtgdPven8a1iuBy0H46+zKD+1PgR24cG8dYe6
	9KntWJpF4HKCjvlc4CzcdnXU0fes92VYz0lZrVXmWo/QT1FFs62xKbfrOISRBmPB
	2BOjYlMuckZIrPz9fJugVwH8b4Y4RfhZRsFIwsHqDzaFdidSk81gg721LY+sqbyN
	WvFxZTQqc/CGrRJ83q/QxalBzgyDHjbD501WFAOz4nSFM+0yhpcei0Qlfyd/O9Av
	jZlk+HZCaa0v0jqp8RfYQ==
X-ME-Sender: <xms:1q1zal7R8xgIsMsYTMimmtvWJdrhJtEb79CsyAiC5wfhZ2_b2Ht0JQ>
    <xme:1q1zattsIRDBV0NXaLNvoMSfmk0K8jZul9CYkdLLwUC7nqCG27Eg6j3cP-oVpbEMX
    wS6fh2-jGDo1Gb9XRKF2cCcjwQoS3k9fInBLuLqjbthiTWPGf7-xG4l>
X-ME-Proxy-Cause: dmFkZTFhe6h0hFRbHlU1a7SzTWsS8nNYEA+qJHzFn1tAEmx1gKqaVOk0MpD74mw6eOl5we
    Dng6LmQcx9h6N69pDl39q7jzY96Gy0ujLdt0wDHpouxVNKDEphtd2ENFap+D74R5QFBkaC
    AgVz152O18+7TX0YedDZZ9e9yuooz1CRYoCv2kEqXDs4ez9MMcf6itd+LuMlWu9MLr2NbY
    2IGMmb8hrLCPo4Jx70H/k4DfF0Em2M5lSvkeNS+Wy8PQKuzJk+ykhcHQRuPm1gB2ANR8Fe
    P+dA2I7QjsAxEh0SCysUG2yHjGNSaN1eAYyWkuALXxPEKDZTUm+uQp5q7+xA5kXpx9Y9OI
    lAqLmpUkEF59Zg+50OBRu/+Jt/gSH2QagQ1lV2+ezu/IAd5DjzVxq/dLPscCyimrtAD56d
    N4faajinHtM1IxxgA63a0s3iQ6p1uzCBjLymh74skc/coiqNHeLOR29KcDeskOQJP7McDE
    ZNJ1ftiHlCRCfVGFTy9pXI0GGfhhH33Rkbc39Kvs7a2eWfiCiLJuezLLkftjiph7voKqjv
    AJuQsX+W8C3/iKj3zksov1NR2DZpxJi/VYXRRcCHUdtTrsKtW4Wcyfg4gbkyEUd8eVZ25/
    pBnF9ymsOWfrRv+mXwGRJJqU4GY1NLOgWNNCCowGrZt1yk/5ivirqtLdV9fA
X-ME-Proxy: <xmx:161zameK_KnItgNXt0JWoxebUY-HLLdlyL6y8Irp0ntqzVStYMrKlA>
    <xmx:161zao8T_Mo_Wl1fkByYwx0Y2J69AqFjTmjVZR1XcdH6yK0hM0pxNQ>
    <xmx:161zamPtWTtbobdJi_8VdZVlRpJzB8cgLdn4oQDibCGCrMWDfNsXfA>
    <xmx:161zamWc7yNsz-bGLFSMNvptVeXY4GBP-aPW-S0IRBBzABEYtM6nuQ>
    <xmx:2K1zagx2-vZoEqm8PluAyFyX-3poCQuTQptT78fHEG_FjaYl25YF0Axg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 3BB4432A0063; Wed,  5 Aug 2026 17:40:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AhX0bN9rFHDw
Date: Wed, 05 Aug 2026 23:40:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 acourbot@nvidia.com, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <ca9d0df3-5506-4b5c-9ce4-3f4e6e2aeb16@app.fastmail.com>
In-Reply-To: <20260805212920.1996937-2-dakr@kernel.org>
References: <20260805212920.1996937-1-dakr@kernel.org>
 <20260805212920.1996937-2-dakr@kernel.org>
Subject: Re: [PATCH v2 2/2] rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 5, 2026, at 23:28, Danilo Krummrich wrote:
> The doc examples in io.rs and devres.rs directly call
> bindings::ioremap() and bindings::iounmap(), which do not exist when
> CONFIG_HAS_IOMEM is not set. This causes build failures with
> CONFIG_RUST_KERNEL_DOCTESTS=y on such configurations (e.g. s390
> allnoconfig).
>
> Gate the affected doctests with `#![cfg(CONFIG_HAS_IOMEM)]` so they are
> skipped when IOMEM is unavailable.
>
> Fixes: 3f70ebe63858 ("s390: Enable Rust support")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
