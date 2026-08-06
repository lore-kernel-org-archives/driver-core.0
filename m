Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D22447DFA4
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032610; cv=none; b=eBZ4FjaklQXdSIREbKsgvX7V4Nfk2yLGsgWnaThoDQPn3S5n2tw20Xq3qQwNDzwDZ6wkrmW1XMKGW1lMbe5MPjwaT2WJCiKlBNQEEONa00gAufi02qyZwT668v1kyzd3OavuKSuFQ6B006/qrnwxPvSobZ9rZNsZqBnA2iM9V0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032610; c=relaxed/simple;
	bh=Mma0pkeBxt/K4Sb+TOs7o1mNjjNsqi/Vt8o3AhsBlTs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ja/ENiVYUfhxtbtvjLgXElhyBVLlabnG4zy5QukumlbIbk8ser0JVG/s/7u5bNlmlSwbpGxe/PljOucn4+G4SmhgiHrgEl05t2FRLWmn+RhpwiEKqPpb0NwSBQLrIoWPL0TwIw4r+7irFIzumgMW7PZYe4SoedMiAgidvQ9DbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YQveg2tg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=anreLZLl; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YQveg2tg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="anreLZLl"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CF5937A0101;
	Thu,  6 Aug 2026 12:10:05 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 06 Aug 2026 12:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786032604;
	 x=1786119004; bh=femWfvOZsQ9kjRpouwPyrWwThkheUH0sdgrsZoynmN8=; b=
	YQveg2tgaCqvN2bawYnrwkuNbxeOtDM3km5AuvLmprijs/p4PNqzL2k1AIOW4E90
	LfZkHxtj5V+Xo4rppvmUKmnuH/4R5U07GZheJiehvx27hbVG52c6R1lgehoMsIXQ
	JBP5Bvu77ipTtnfiNo3qTYyb42tqitREaTF+KMoqoBQfITdupm66qMbvRua2ejmn
	1la2WuzTqhMDVFA5lB4fwKm0PLW/SmiLs4uGC7srxAipuJ3QcZ3TV21yndekSNTL
	VoYqA7mExU0OuNkDCBcMc2Joc4NK+xaWV769tAbGa6vqX8TWZ/dcWuKfvNoPrZAM
	jgitL50M0eUTd4FKypy2iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786032604; x=
	1786119004; bh=femWfvOZsQ9kjRpouwPyrWwThkheUH0sdgrsZoynmN8=; b=a
	nreLZLlfLB3GBfwvw9cK2xnXImuHMq5zCakRsP2i0b3AZ0EUT87ZLG4KtOeLIeY2
	I/O+ZEBT+Vdugc7i5sjtxukrSixJdtA42kFE8+n9/J1nGPfeESN3ShmwaWvZjRav
	BQEfEUW/nK/wyqkc/jL1maEFuIkZes4H8NdKjuwulBMwulBKNN3Kvm1GmJTmfIXe
	0dPn4Ehwyu05iXLRQ41qRZHq050cRNkGNFVR9gOUgNTTc6y6/0P3OZxQrzRm22/G
	hMnzqGcEhcVpoA6GoTv1HfLxHhHEgQlAsTtPE8oY1sGWNMnB6Aw6EQOMlGu149Fy
	04Yf3W4bvrI2Bix+Sggbw==
X-ME-Sender: <xms:1LF0aqFTsa1I2LTW3zHjqFTRdAVEMIX5f-ihXE_8cmCcljlQdPxl_w>
    <xme:1LF0amIVnte04d5x00j0-63akRPJBpgR5arI7HwFAQTFbpQE_Vyy2lB5_Lvq4TYY-
    4iiKOs13OO4-49NaxgZWAkUzoRmLkGjOGVVoSHupNUszFZzlQct74O1>
X-ME-Proxy-Cause: dmFkZTGjUh8gYbVMB34OIfke8GIs7ASnpl+d0mBM2XHcKXmnr2SnZk0TOtalaLiNeWHYrJ
    KHXYLXYEeZ4lwB3pnoajBhlZFhLU+oyn1EKun5Vd2uNNhDF9WJ25k8OTYfv39kNbKNF/vI
    C8OGSGTmnUAUDb6cM89+ar1wpr0wfiRl7dUdoVKk9NbIvpC2DRWnuAFArFJb4Mm68lNNT0
    kHCPNolxMbQbGewZ+iJp/94pKK7K/lIDUKPJry4OP2ec18yd06sAFdYsyEKAw63IZswlUd
    Gh/PlOkH0yQP9GcJzmgKVHBGRSe32gpYcFYKsOyYqi3kGJPlilFqbLwqm2bopO37XBpyC/
    tx26jgdY5c4zcDKbSBH6Tz//e2g7QLJTukPnsbbn7j73D6wjU3QXJUiDEjfkAr1oj63Q8y
    5eSYhI+2V3E1YrBHlA8uZrJn1UDtKTxMfzLOm6deZTi4+jydX+GFsphciE7yW1rHHnFolI
    kA/RCT6abXPW5/3FCJzHRkB7XOeEU1ZMyGeSds8bN7N88VVhEfrzWp+EJvBkBoyT4n8qJi
    9LJyG09Zc3iLkx3dOZsebt38V5UPBEgZZmhz0gYWCYjbB/OIWgWqtC6fKaNZpM1RbmJUUq
    IEptbgbUuPAoEnje9pT5ZpMwPeuT8w1U1lr1405cIlabHNIG8XYmi6K1glQg
X-ME-Proxy: <xmx:2LF0ahpRPQTx6j3uY80oJfJxi-UtdJ5KPPWqklIIhr2yubkY3AKDNA>
    <xmx:2LF0asZ_GdKwuCDRApneJi39XTeyssNYVdZxCqAPJltRuUgv66lJ2A>
    <xmx:2LF0as5qzia5PCa7vxUAaRhmiaRTXXnrDEM4PlKai29h5ttheSZUEw>
    <xmx:2LF0avQk23VHVoFA6WZFigF5Mx8lnVriJxLzuVg50JqNM32xRLOkmA>
    <xmx:3LF0aquRuC33Qz0eJ5PXj3TwEVrYwvbimhsBNhyuoR9N9f9S1DerVBts>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BA80732A0065; Thu,  6 Aug 2026 12:09:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A0yYJuUxkgs3
Date: Thu, 06 Aug 2026 18:09:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 acourbot@nvidia.com, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <eabcce4b-c292-442b-9eaa-5b6ed32c1462@app.fastmail.com>
In-Reply-To: <DKHZ8KNRT5WY.2GPNFMJGZVEX2@kernel.org>
References: <20260805212920.1996937-1-dakr@kernel.org>
 <9fbff830-d1b3-428b-b7b2-205eff41b6d5@app.fastmail.com>
 <DKHZ8KNRT5WY.2GPNFMJGZVEX2@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 6, 2026, at 17:47, Danilo Krummrich wrote:
> On Wed Aug 5, 2026 at 11:39 PM CEST, Arnd Bergmann wrote:
>> Can you also hide the actual I/O accessors in this case?
>> While s390 without CONFIG_PCI still provides the asm-generic
>> version of those, that is technically a mistake, and it would
>> be nice not to.
>>
>> I'm guessing that there is enough kernel code that still expects
>> these to be present for C, but if all rust code has the correct
>> HAS_IOMEM dependencies, it would be cleaner not to reference
>> since there is no correct way to call them without ioremap().
>
> As things are right now, I think something like in [1] should work, but we'd
> also need to cfg-gate every single doc-test that uses I/O primitives, which is
> slightly annoying.
>
> In any case, I'm not sure it would be a huge benefit anyway. Unlike in C, where
> I/O accessors operate on raw void pointers, the Rust primitives are typed. So,
> users have no way of actually calling them without being able to obtain a
> mapping in the first place.

Right, makes sense.

     Arnd
