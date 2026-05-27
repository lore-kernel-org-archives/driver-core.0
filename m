Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A053B19A5;
	Wed, 27 May 2026 19:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911402; cv=none; b=C+nbF9j8eRBLbea5KSqsYAb1x+D65gtoAgV4q0VkMUOqXebNzufoXD8ZmRGh9QLBfZfVyFuuF24r3DbXJ4Mmqd7jnU3v4r38oksZMOct+jQwTEZZouRNu22IIoplzoKIVrhrdHbQr9EMzD0OM0XMZgMMAfvrHrJwMSMvgjVGucI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911402; c=relaxed/simple;
	bh=IjwkUMsHIxWRb1TiqmbFVp6pLmXMPxldHStFIsrvxPA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tB+P+Fh4QHRc/Yk6fTcx0av85v2MOSYjMSYRhE0r7f4wLcrdna9yzncYQHKzZOFepQ/mgjDo5s6kJmKcwP+E89ytgAmWo+v+bPcB/aL6DO3iFNSMi84O+INq2ST5ohpugGG4pTyuqzbFSqFMEC+6ybvGiL8IqBbsYRNavxRgeGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLznmKLN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLznmKLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C8C1F000E9;
	Wed, 27 May 2026 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911401;
	bh=IjwkUMsHIxWRb1TiqmbFVp6pLmXMPxldHStFIsrvxPA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=DLznmKLNblVjoKWsRfQHibtz8kGMoEfRP1UZEUkOru7q+CNb6HnN8KmrznfpPwRuT
	 wqWdxPs22LmhVgWOvcTwDkzDeeGcfq+6P3pne9gjB+ZNKtOf+ZoqrJINtEfB8Uk9pc
	 AOMULdYrVh4EH5UOFzUTvDkfoONb221Ny7C9v+3Av6jShySow5sFRaSf+2jk6ZYD5g
	 rBBdWH33BRZOTZxP+Xqzqsrgbo3cQrVWOGB1pHVcXZNzk06hrAoAaH46aO+lwHGL0f
	 bpdIGnpoNzbcy3K7W/kCZklrYwyBd2FXQV0/mVTA6bkSnzHIwL7f1fcDss8LsuQMMb
	 w8Eloi7Tq6gZg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 21:49:57 +0200
Message-Id: <DITPXJNEU74Q.2D56FQAAITBVG@kernel.org>
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
 <DITNW1LVAJ16.2V0QUI6JAGKBN@kernel.org>
 <DITPEZ9TLM8F.3I808DKPCW4LM@garyguo.net>
In-Reply-To: <DITPEZ9TLM8F.3I808DKPCW4LM@garyguo.net>

On Wed May 27, 2026 at 9:25 PM CEST, Gary Guo wrote:
> On Wed May 27, 2026 at 7:13 PM BST, Danilo Krummrich wrote:
>> On Wed May 27, 2026 at 8:07 PM CEST, Gary Guo wrote:
>>> On Wed May 27, 2026 at 7:04 PM BST, Danilo Krummrich wrote:
>>>> On Wed May 27, 2026 at 4:44 PM CEST, Gary Guo wrote:
>>>>> On Tue May 26, 2026 at 1:04 AM BST, Danilo Krummrich wrote:
>>>>>> Add a 'static bound to prevent storing types with borrowed data in
>>>>>> Devres.
>>>>>
>>>>> The bound should be added on `Devres::new` instead.
>>>>
>>>> I did consider this as it is generally recommended to minimize bounds =
on
>>>> structs.
>>>>
>>>> However, a Devres<T> with non-'static T is semantically nonsensical, n=
ot just
>>>> unconstructible, and I think type level bound represents that better.
>>>
>>> Technically `Devres` can contain references to the registration, which =
is known
>>> to outlive the bound device.
>>
>> That's technically true, but how would you express "outlives the device"=
 as a
>> lifetime bound on Devres?
>
> Just having the lifetime would mean it outlives the device (lifetimes tha=
t
> cannot be guaranteed to outlive the device cannot be used in devres).
>
> In a world with registration data, I would imagine all lifetime parameter=
s on
> registration data are also valid for `Devres`.

[...]

> Resources that depend on both registration data and device resource perha=
ps?

You'd still need a separate constructor for this, and I'm still not convinc=
ed
that this makes a lot of sense.

That said if you feel strongly about it, I don't mind moving the 'static bo=
und
to new() too much.
