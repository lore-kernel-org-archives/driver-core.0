Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C83DCDBD
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 21:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966011; cv=none; b=RVhwyKZEbfWpUpne8jzmAGbjtLZglMFNKZVEHgs7qHbKfWa7YDI85cHGWgtou1S5cy2yDUD7ajq8ct2bSIrYIrJjLd0hchNeclDdXiwtXfLsaq1OPu4S5vTUjuoIkf4ACbqAmpkKMaioOQUeqXDBmgaWylylBpX6MhrHsdtromA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966011; c=relaxed/simple;
	bh=IH1mds9i04KMXx1v2FBvcb/ofb0ez7o11nT1Dg+yRqA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jVvzzHMpfh94Dz+U+RKUO1g+GD3CgMMwLfxzmdwGZQCjf7e32vSXg3goNngy9XpGa6UgzCYT+yVp+Aa/W08xR+QFM7rRPVy9V0cRCSPbnRNzuueEF5HGDkDBa+siP84uOnidDLU0BNIdqvGIEaEYTAmIQbwb181btw8BmCXxKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=PmTZCmOd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iHBtt4xu; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="PmTZCmOd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iHBtt4xu"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2D6927A00D3;
	Wed,  5 Aug 2026 17:40:05 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 05 Aug 2026 17:40:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785966004;
	 x=1786052404; bh=oYApZU2ZObPMUCR6FXXUpKhTnmwws91LKg3O/fOuaXM=; b=
	PmTZCmOdhsjVlstN+u/VLJfX7+q+NueJW2Gxg3M+dXpAAx4WFgOQNaanTVFlzSnQ
	qlICIt0EVLO6PDUA10ngQ7TTrAGH7K7qAWQAqQQMm4o+wu8VZ1LeLEnaLUGKt14v
	0EjCW1LpjGfp45o6TsiUxdNZUxfkHJ4xzOaQorSA9Hd+38WDaIXd9VsBwPOmTQU6
	mcXypBEqVZw6Ufu/r+yWpBu/NEcsw2LpIlBIn5V92TH6mdSuhWVUc0v0iAduTbJm
	buj20hBorwbXuIf/pj2rvmewh5/3mfo81K2bOe3T+cDtZWmtbE2elXpzu2IwOlwW
	M6kEX8Xatdaqrvr8AXmMMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785966004; x=
	1786052404; bh=oYApZU2ZObPMUCR6FXXUpKhTnmwws91LKg3O/fOuaXM=; b=i
	HBtt4xuKs0wXV1TDY//b3D7nFtw03iFpN5JM+lnNDhKHYHIrz8I4JpQlTOeoYNR5
	WNYTEs2WxQB4MbHnaDrXTnxYsEQ1A1mYfZkocVCbiJ7kY+pN/BWtDgxE5q03NxOG
	r4P1Q6eM2XCUbUIhgm8FlMOxWsDZkNhxST4YM3/Xv4Uw7hjAbCDBG2/gXtH+HhKy
	yi71B4ZtDgIrgs7BjaFtNsXfERDVBZhVHxJs8JnhTv6Qy8hXi7DRxlYu907deZhX
	2zKhJDoxMuwK74MriH3W/xDWb7f7Qhk9MJ/ouuPWms/1pMTL+WkrJiPga3kcviML
	KJOoeyAB5s1eLvoxutk4g==
X-ME-Sender: <xms:q61zarl_Wp0CvnAgUT2U2LWmQ-C9BzrT33oJ5W-1qgvtgNHIRf5mkg>
    <xme:q61zapprY1ZE1q048KtZrvpHqTzYJfuQ07sBigA9TtypzIJkcQzrEfFi1DDAmvEjB
    3ga9t2JtV4DjeOr10isRRjwRJ9RX7ESnxnRjMZt5SVyslBaFH1XhGo>
X-ME-Proxy-Cause: dmFkZTFmmOalGeyZAxQkF392pFWz2qQkO6319c7Ct8kTOPj82jLRoPGlxIdRJ3OC/8VNql
    gNrOSJutsxsocQikigE0zNeE/SUMV2KtQn0+UJUgbtGjql/hlUVF0lIl0GchX7SBnK1zJY
    88KPWOzZbiUHoW8V5gfUWc40d7/QWAx+bP7Vj1p+8VqkBARI0APjqce5nxgrj7+a+zWN8F
    DV5fIw8Fh6/HwSjafcM2bd4t6C0wW2xBTrRLSBaMmJeoTu6N9M1bkml+IYTY60pr/ZPHTD
    s3Xq9LjnsZLObE3uDjfosBImR9Euh9rIPQAyx7DGfwTCLFTeMxUKOgohxc8S8LMv4Rf0jw
    zwoCnhCma/T6h4k6DCGONyClZgZ8CXNgdD9PkNSvWuH6b8JDktafEXe9BTnTZchQWANJ45
    irpZ+NI6Czl9o7YSL9qyfv6+idLE1A2nAMQ+QOVlJHWt/4iMWO9/hAvhjbODa6gpNocbxV
    wxf+nxi68uuGw+FwJrPRcqGksy8Az4fbtK5zQwbrjosE34SPA+nzWipdN738eA/9IN34b/
    9RBOzT7KP0XcIU/m4suVi9itV8D6+DeIdcsltfdJPU/0Y9GIcUAz2PzdkSHzICJKo1qS+g
    +/5Tt470EtqsoBBhchzHPV8tG6P/88AGwRM1t7FIMEMGUKTg8uIhXpTVpgXQ
X-ME-Proxy: <xmx:r61zarLACY34j8pvSYf6QywHMS2f4Bl31UqVsuZkjoufeAJ08XhpbA>
    <xmx:r61zan6Th23rBWF5uHve9xugtg7uUr4C6yv04pooqDBBIW3yajh0mg>
    <xmx:r61zaiYgBPiIB2VWOI5BFPz4MaZrXZdOUk1PMJjUROXE2b2U7_sMLw>
    <xmx:r61zamxrxkcCqyoOpfagNzA1tWzW8ktGvpg_URgXrsHC_pB7_CjtFA>
    <xmx:tK1zaqNQkIvjXT0haaM-_e8bGldx7n-ExMjFKzY9ahEeRQZE7c6hRiTA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C336B32A0062; Wed,  5 Aug 2026 17:39:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A0yYJuUxkgs3
Date: Wed, 05 Aug 2026 23:39:35 +0200
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
Message-Id: <9fbff830-d1b3-428b-b7b2-205eff41b6d5@app.fastmail.com>
In-Reply-To: <20260805212920.1996937-1-dakr@kernel.org>
References: <20260805212920.1996937-1-dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 5, 2026, at 23:28, Danilo Krummrich wrote:
> s390 does not provide ioremap()/iounmap() when CONFIG_HAS_IOMEM is not
> set (which requires CONFIG_PCI on that architecture). This causes a
> build failure with Rust enabled on e.g. s390 allnoconfig:
>
> 	In file included from rust/helpers/helpers.c:68:
> 	rust/helpers/io.c:8:9: error: call to undeclared function 'ioremap'; 
> ISO C99 and later do not support implicit function declarations
> 	      [-Wimplicit-function-declaration]
> 	    8 |         return ioremap(offset, size);
> 	      |                ^
> 	rust/helpers/io.c:19:2: error: call to undeclared function 'iounmap'; 
> ISO C99 and later do not support implicit function declarations
> 	      [-Wimplicit-function-declaration]
> 	   19 |         iounmap(addr);
>
> Guard the C helpers behind #ifdef CONFIG_HAS_IOMEM and cfg-gate the Rust
> io::mem module, such that IoMem, ExclusiveIoMem and IoRequest are not
> available without CONFIG_HAS_IOMEM.
>
> Note that the C API is inconsistent about this. For instance,
> devm_ioremap() has no stub and produces a link failure without
> CONFIG_HAS_IOMEM, whereas devm_platform_ioremap_resource() provides an
> inline stub returning -EINVAL.
>
> The approach taken here (compile-time gating) matches the former, which
> is slightly more appropriate since any driver performing MMIO currently
> requires CONFIG_HAS_IOMEM.
>
> Ideally, s390 should provide ioremap()/iounmap() stubs unconditionally
> (as UML already does), removing the need for any config gating as
> discussed in [1]; a follow-up patch for s390 is expected.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/all/20260803180931.97202-1-ojeda@kernel.org [1]
> Fixes: 3f70ebe63858 ("s390: Enable Rust support")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Looks good to me overall.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

One question:

>  }
> +#endif /* CONFIG_HAS_IOMEM */
> 
>  __rust_helper u8 rust_helper_readb(const void __iomem *addr)

Can you also hide the actual I/O accessors in this case?
While s390 without CONFIG_PCI still provides the asm-generic
version of those, that is technically a mistake, and it would
be nice not to.

I'm guessing that there is enough kernel code that still expects
these to be present for C, but if all rust code has the correct
HAS_IOMEM dependencies, it would be cleaner not to reference
since there is no correct way to call them without ioremap().

     Arnd
