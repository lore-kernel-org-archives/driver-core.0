Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA246AECD;
	Wed, 27 May 2026 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905644; cv=none; b=TtKBJye6aVLZ9+bVHsOixDnYclJ9jGrIaDOylQ0MMFG12fmJUZkwGVUH7xMTjqEnw6r3LiQDreA9LNIgdphwZZVVDXoe9Tp9cNX2kIdRav9xCLrkPIC3+GwpA+ClxEFu/rd+LDlFcI3OjYcZmMd0nc1oHIWZ+QT1WwBHj9yDFg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905644; c=relaxed/simple;
	bh=vUUbST2ZS9EP4ypz3cFFqO4V8ydraD5BKQ4QQdOqfvE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eb+iOa69p0K5ZAvU7MBCXliJuugTIactfMRuGkxSAju8v01U900vVfLKPBkTwG2/V/fTQigxcpIJcpsEW/6UTd07kJaC/Fn/4WsU3Yv6+gflONU0vlJosSpVmqL9X2yZz4jz4TqA3lhrWtGiNzR/A7i1jxZnn1kibh7xUoqSFi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzYAdJiH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzYAdJiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01531F000E9;
	Wed, 27 May 2026 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779905641;
	bh=vUUbST2ZS9EP4ypz3cFFqO4V8ydraD5BKQ4QQdOqfvE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=mzYAdJiHzob5R5HeAuweooMx+E8EkVZkslAXjLXJL5ya+tNg6wKn6KTl2X+ybI39E
	 B4EiduH0uisiGPVGG9NO5US7k+3WpzormccBpCn5wWMEQttCZOcYDTAGKQXHdV0Cqh
	 ftGdvML6UTpxHfa7pYWEIab88I/2uo6dpnViCFGKHlKJGwrk242aErqcE51S6eUbNR
	 +Y7LU/fS69awHQrDt+JIt+YUWrwrIu+OyTdbQdj9Fk188ej7EEvnhkVoXLiBXlfZNn
	 C/m7B9YeGgiyNPIXxPc1cPs0VmpKaFXqmexasp3DgVnBAvDRgMp2fyOGfHmcrL1JXU
	 Dz7gZhehrGNVQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 20:13:57 +0200
Message-Id: <DITNW1LVAJ16.2V0QUI6JAGKBN@kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260526000447.350558-1-dakr@kernel.org>
 <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>
 <DITNP59XG4H8.VYHNILHQV05G@kernel.org>
 <DITNR1QTIE1L.3MTG2UJJVGFAK@garyguo.net>
In-Reply-To: <DITNR1QTIE1L.3MTG2UJJVGFAK@garyguo.net>

On Wed May 27, 2026 at 8:07 PM CEST, Gary Guo wrote:
> On Wed May 27, 2026 at 7:04 PM BST, Danilo Krummrich wrote:
>> On Wed May 27, 2026 at 4:44 PM CEST, Gary Guo wrote:
>>> On Tue May 26, 2026 at 1:04 AM BST, Danilo Krummrich wrote:
>>>> Add a 'static bound to prevent storing types with borrowed data in
>>>> Devres.
>>>
>>> The bound should be added on `Devres::new` instead.
>>
>> I did consider this as it is generally recommended to minimize bounds on
>> structs.
>>
>> However, a Devres<T> with non-'static T is semantically nonsensical, not=
 just
>> unconstructible, and I think type level bound represents that better.
>
> Technically `Devres` can contain references to the registration, which is=
 known
> to outlive the bound device.

That's technically true, but how would you express "outlives the device" as=
 a
lifetime bound on Devres?

Additionally, if the borrowed data outlives the device bound, you don't nee=
d
device-managed revocation for it in the first place.
