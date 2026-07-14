Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0202EB5B8;
	Tue, 14 Jul 2026 17:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784051592; cv=none; b=DBnqP6rrPqm0TfsB9ZTKbap6BPaeMpm2bHKHgMrIlZo3lWBjCLQ6/ZRKJcvwcKL5GxPPPAe5LogDWr3Xj8rUFf0A6MK3TvX9p7dFaGGz9GfleMw7DZm54P+zByUV+Et1jmMpp9vl9D+0pf8xctHGjYkvRdP19TWvLaJGDlXE8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784051592; c=relaxed/simple;
	bh=tAmRuwe4iOiZT6cYgNdW2yQayZgtadz1k07EyAMjkzs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=bzEqVeUUKMbi3eE47a0PmjhKZpH0JB+39u02wmxkREAKN+iEpnG75uaRneRPgGhMSjm7XZkclXsEIaJ3a7OoLA1DI+Nz+60AGQSoxlmY9HV7NZ5aPmlT8hKFIUoc5VabOMh4R1+7HvBtZnhi08GRsqYVrW8Twqqj6+zBgF1zf+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKLP/USo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKLP/USo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33C71F000E9;
	Tue, 14 Jul 2026 17:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784051589;
	bh=fo4ZCxgBFuMzvv8i+e0hgQz7BHe+qOPEpLPG7BxIRjo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QKLP/USoaDZQRALN2GqyPg7rpQJZEJLlGfakooKdTCqcfJgRnsFVZZm5ffeC5wBIu
	 FwuUZpuM+hr6OGA5Ltfsg+Js7hrmu6CQAqHMobIpgc1Y00Nucqf5Dm+Ip9ZIpBUWyQ
	 7ZmKsm8CE60AygzxIZkzp5k5u2UCRcS6H9BaYY2ivLecPdovJzsdqzalBfLE0t5G+t
	 dccwmjPP1xdmB8eJYiRPS/5skhlXjezkI6T9+WIrBbgl9hbPUPZ7Vi5DF8rw/BYJuk
	 r74Nf0ZwCX4FqoHL27lsky7LQQp9hh2tzBnABa/fy0iu8Ory6c3vh559LoZ64yjcHz
	 1kt1lvN3FNJlw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Jul 2026 19:53:03 +0200
Message-Id: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Cc: "Oliver Neukum" <oneukum@suse.com>, "Colin Braun"
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
To: "Alan Stern" <stern@rowland.harvard.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org> <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
In-Reply-To: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>

(Cc: driver-core)

On Tue Jul 14, 2026 at 6:26 PM CEST, Alan Stern wrote:
> I don't see why Rust needs to distinguish between a USB device that is=20
> bound and one that is unbound.  There isn't much you can do with one=20
> that can't be done with the other.

It has nothing to do with Rust, those driver lifecycle rules exist regardle=
ss
and they are present universally, including in C.

The only difference is that in C all the responsibility to enforce them is
usually on the driver -- e.g. by creating, destroying and calling things in=
 the
correct order in probe() and remove() -- and a lot of drivers have bugs in =
this
regard as a consequence.

With Rust we can enforce those rules with the help of the type system at co=
mpile
time; device context states are a part of that.

> Similarly, I don't see why Rust needs to distinguish between an=20
> interface that is bound and one that isn't.
>
> Even from the point of view of the device core, a device that is bound=20
> to a driver is the same kind of data structure as one that isn't bound;=
=20
> the only difference is whether the ->driver pointer is set.

This is a huge understatement.

The state of a device being bound to a driver defines which entity (i.e. wh=
ich
driver) is in charge of operating the underlying device, and thus defines w=
ho
owns the device (associated) resources.

Many APIs rely on this, as in they only guarantee valid behavior when calle=
d
from a scope where the device is guaranteed to be bound to a driver, or IOW
where a driver can prove that it actually operates the device.

Drivers must only acquire device resources when they are actually bound to =
the
corresponding device, and must hand them back before the device is unbound.=
 The
devres API, for instance, exists for this fundamental reason.

For instance, we can't have drivers manage IRQs, mess with I/O memory, prog=
ram
IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bo=
und
to and hence are not allowed to operate (anymore).

Those device resources all have a lifetime that is tied to the lifetime of =
the
device being bound to a driver.

Consequently, any asynchronous scopes such as IOCTLs from class device
registrations, IRQs, work queued on workqueues, etc. must all be synchroniz=
ed in
some way such that those asynchronous scopes do not access device resources=
 that
have already been destroyed on driver unbind.

Or in other words, they must be synchronized against the "bound" scope, whi=
ch is
exactly what the Device<Bound> type state in Rust represents.

So, again, all those lifetime rules around the driver lifecycle exist
universally, it's just that in Rust we enforce them through the type system=
.

For instance, tying it back to USB, we don't want that a usb_driver still m=
esses
with a usb_interface, e.g. initiating transfers after it has been unbound f=
rom
the interface and hence must not operate it anymore. This can easily happen=
 if
e.g. a class device registration is not properly synchronized and the drive=
r
still receives IOCTLs after driver unbind. In Rust we know through the "Bou=
nd"
type state which scope provides the guarantee that the device is still boun=
d,
such that mistakes like this become impossible.
