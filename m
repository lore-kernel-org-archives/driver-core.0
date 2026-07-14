Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17FA377AB4;
	Tue, 14 Jul 2026 18:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055485; cv=none; b=FG0a8CU97z+cWdYpYEy9eDx7BiKXxy5jYHrr/E5w+JzuIiaiAaMfeikr8SmVZQbG47rtwFzRoH9yWhy3fICp/AIUEcobGZybMDteotwQrdJIzo7BX2wHzJb6dVeGi5Npq8ozKlCoEIyD7yI7aRROYA1F2pW8kHl6m8wp2+RzV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055485; c=relaxed/simple;
	bh=8QnLKMJTb0BaoNd3LZ/kg0lldXZADKQy/ehAaTqWQGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kuRV/jzWo30ssoCM/9kbms/nTIx/XzDakQ2mmrFYcVXj3n8nUrrhV4bv0l2moGdz7dIjte1xqJZu1JRi4y5uk8QCsb+s5JGQWLOmbJu75BHJXEALwfzLjdttIWkBsRso9et5vz0dlIUZjYeoz/xNFImYPgEEHUJk0hDOhf4utFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjBSyw3W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjBSyw3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B31F1F00A3A;
	Tue, 14 Jul 2026 18:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784055483;
	bh=8QnLKMJTb0BaoNd3LZ/kg0lldXZADKQy/ehAaTqWQGg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=bjBSyw3W5Vr1udvBdO1zXH69HXbUIbp5D+eeNohhNwTkY2cfw1SiKO4kvDfe0fIWC
	 +ty9aXMclaqj452VsgXY1y6Sor1W23vZAmUkJBfB1NpsjlEQASvR9UvmfDbewaL4yk
	 ThGHuIS3vfZzMNtR9ni91IGZ3/SKmA5KP4BnXoFUc+DbSG2mlud9hPCcWdcaWgNYZf
	 kuJTW3RjhFnmc9/FIU8N79eW5hyGlN1mcubdW13M9EQbA05PtLhOlnQZ2MKpAd/cSC
	 1R+WOoD7CpwW85geKJoviI7oIg8QN8obYyWClGa79q3OQPPXfY/GT65NDBifXPbyWR
	 7Qk+TUw8bs0Dg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 20:57:57 +0200
Message-Id: <DJYIVVQAQANH.3GIU2U9D08BKS@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Cc: "Alan Stern" <stern@rowland.harvard.edu>, "Colin Braun"
 <colinbrauncl@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Mathias Nyman" <mathias.nyman@intel.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-media@vger.kernel.org>, "Colin Braun"
 <colin.braun.cl@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <driver-core@lists.linux.dev>
To: "Oliver Neukum" <oneukum@suse.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
 <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>
In-Reply-To: <018687f9-a7ba-4e30-bb3c-25ea6b8f172b@suse.com>

On Tue Jul 14, 2026 at 8:48 PM CEST, Oliver Neukum wrote:
> On 14.07.26 19:53, Danilo Krummrich wrote:
>
>> Many APIs rely on this, as in they only guarantee valid behavior when ca=
lled
>> from a scope where the device is guaranteed to be bound to a driver, or =
IOW
>> where a driver can prove that it actually operates the device.
>>=20
>> Drivers must only acquire device resources when they are actually bound =
to the
>> corresponding device, and must hand them back before the device is unbou=
nd. The
>> devres API, for instance, exists for this fundamental reason.
>>=20
>> For instance, we can't have drivers manage IRQs, mess with I/O memory, p=
rogram
>> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not=
 bound
>> to and hence are not allowed to operate (anymore).
>>=20
>> Those device resources all have a lifetime that is tied to the lifetime =
of the
>> device being bound to a driver.
>
> Understood. Unfortunately this does not map straightforwardly to the USB =
API.
> Usbcore tells a driver via corresponding opeations when IO has to cease
> (and other operations should be performed) and when it is allowed again.

Everything regarding other device resources, such as DMA mappings, IRQs, et=
c.
still applies.

Regarding USB I/O APIs, what you describe sounds like an additional constra=
int,
where the usbcore tells the driver when I/O operations are allowed within t=
he
bigger window of the driver being bound.

This additional constraint can be modeled with additional USB specific type=
s
that limit the scope to those specific operations.

For instance, it could be a new type around e.g. a usb::Interface<Bound> th=
at
implements the corresponding accessors and is only given out with a lifetim=
e
spanning those operations.
