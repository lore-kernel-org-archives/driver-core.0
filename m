Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295561E5714;
	Mon, 13 Jul 2026 20:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976122; cv=none; b=dFcEFDvC7FBfC0DdWgiQeP1QXzL5R//Lffj4LJ6V6WWevEmVhLomXrdNPqOfoQnDStv7K8L+tgnpvFriIp6eCPzAMjxQP99ToLu1uBeNzQZ/ZjN+DH4m2JhiQ3pLzX3quvEaiMWpfIg3XF7DKfNr7JP0vPc5u1IbVtJxtZOUN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976122; c=relaxed/simple;
	bh=2akodtkTAZQfy7wlbDYrvvBZDGFGBcbpeL4Zo3N4Czg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bGzKlp5Rh5JXjmwOuHlCRB1vTGkzGvTfCIUoVgXnouDHFXv3BZZNxT4yiACcPsp73WQmC+7dDwp9O7UC5EvtInxgvBcICFoLeV5jbaQ6yVCUejOm6cwVi0opKlt1PeuRYlIrM0b4nyCNEG7Gmo8pBRDTEDxR1LRYK11zmbulqCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ab/KX7/3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ab/KX7/3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5AD1F000E9;
	Mon, 13 Jul 2026 20:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783976120;
	bh=2akodtkTAZQfy7wlbDYrvvBZDGFGBcbpeL4Zo3N4Czg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ab/KX7/3kj6eSu9yd0+Yr4p9aGwZK9wqIFjFfXu6gNwAfT2fSzGJtJ/g+jre9JOe7
	 GZ2bpi8HIWxeOehtyEa3KOs9uXTYg06NJpWP/FLuS+fGBKqWAEw13KC6WAlfXui9Ad
	 azkONarL8pI6YC7sB6X8GN8m+0DjQ36cGAwSz2wKV53iZp4hFU5JHlNWb7EdRiajOS
	 CnD9nfFerpJP3iRgDCQxwaPyepyCOzFPwpr6mWpYM8slSscTJoNHSPgec5MAq1wz7e
	 m3UZ0k3YMRVMrwNN1xkbkPhU9K0vufjHt2j3+zQA2/F+umqJi3aMw4Akxs7e1O04pg
	 EqWlwgQabQlfw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 22:55:14 +0200
Message-Id: <DJXQR57LG8IY.2FG6YY420VFYG@kernel.org>
Subject: Re: [PATCH] rust: device: make lifetime on `Core` and
 `CoreInternal` invariant
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Eliot Courtney" <ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260713201455.640151-1-gary@kernel.org>
 <DJXQ32PBP5Z8.2ADOOIWKYOLP5@garyguo.net>
In-Reply-To: <DJXQ32PBP5Z8.2ADOOIWKYOLP5@garyguo.net>

On Mon Jul 13, 2026 at 10:23 PM CEST, Gary Guo wrote:
> Actually, a more proper fix is to make `Device` invariant over their
> context. It would require touching all `Device`, though.
>
> Danilo, let me know if you'd prefer that approach instead.

The bigger change is not a concern, but requiring every bus device implemen=
tor
to consider this is a bit of a concern. If we can enforce it in the driver =
core
code I'd prefer that.
