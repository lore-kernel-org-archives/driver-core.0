Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801BFEEC3;
	Fri,  1 May 2026 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777672510; cv=none; b=nSQcXe6teYkhMOf0QQV0NKttM+TPT0chVCRKqZEEaucsz1ZzW9E+qqQwAivxEQGmq6QTep1uzxRvjHbGoqO8H5gNGhnF8r1Zp7US0nB5xvLJNa21UUnYsG1O4lZySdY12IBp4v1DMjc8pATQHS1rxLowg/LTWlXc3cwrOzco/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777672510; c=relaxed/simple;
	bh=npVLHTp3HaBB29ZEo+gfYLsriFdiRAZKrjWD65BzCBQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TBz5K8cIqxvyeh7GFDzQ7FlagasaZakmG44VsxZ188IzovRAZH35n4IFFZO8hykDzE6croU1cg6FC1ReQ/daCIuCJHtpbc1T4Apb/o42K17PnfcGx5v3Qfy6LoiMX6CorU7ChkVlZykj8Ozy6i0xbP7IU820KwO9VnzZbKh5TMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dae2O1ac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dae2O1ac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7623C2BCB4;
	Fri,  1 May 2026 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777672510;
	bh=npVLHTp3HaBB29ZEo+gfYLsriFdiRAZKrjWD65BzCBQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dae2O1acBXvxmiYZ1WzRGet/kIEaEZ6s65qFt4rwgc3ui2q3gwIe4IObsmxMW5CYQ
	 bx9mAXG31FBZrpeod8d9IiSlnRTyhki2wAyigNUj1H3gQg2rOrqgbHqX098LFgXsG1
	 ecfldtCvGXACgbQ+D+rtk888xiBhwnYmPO5bvOOqQdVCmg0eO7wTXsCncVPZeGy/tY
	 oOcSIHUbYWe5Y0xwew4rlMnjlq4RHIvhnpP9hcsY8uQIEfdkRMIwCVlFHhbnTj9aSp
	 GnI5Z+G4hggsxwYZtkGBAtitgfyiEdtQTCu6cK2Gq3OHEaWjeRhSU+ihY3cAJgkaam
	 R9HhdiuCHg+Ig==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 23:55:03 +0200
Message-Id: <DI7OB6BEZJ69.VM54A4U4P68A@kernel.org>
Subject: Re: [PATCH v3 3/5] rust: io: use the `bitfield!` macro in
 `register!`
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <driver-core@lists.linux.dev>
To: "Yury Norov" <ynorov@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com> <afTnQ1KCyybUE3pH@yury>
 <DI7JQ529XI9V.QMFHCU2HMGSN@kernel.org> <afUP9laA5xYWBuc2@yury>
In-Reply-To: <afUP9laA5xYWBuc2@yury>

On Fri May 1, 2026 at 10:41 PM CEST, Yury Norov wrote:
> On Fri, May 01, 2026 at 08:19:31PM +0200, Danilo Krummrich wrote:
>> On Fri May 1, 2026 at 7:47 PM CEST, Yury Norov wrote:
>> > If it comes to another round, maybe split switching to a bitfields and
>> > getting rid of the bitfield_core? For maintainability reasons.
>>=20
>> I'm happy to take it as a single patch -- the deleted rules are dead cod=
e the
>> moment the switch happens, and the code is local to the same macro, so t=
he
>> intermediate state doesn't seem to add any value, or structure in terms =
of
>> touching different components etc.
>>=20
>> Did you have anything specific in mind when you mention maintainability =
reasons?
>
> I only mean that if there will be weird regression found in the new
> implementation, it's better to be able to revert just a single patch
> to restore the original code with no side effects.

Indeed, but by splitting it up that wouldn't be possible anymore, no?

Am I missing something?
