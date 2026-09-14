Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51D63438BE;
	Mon, 14 Sep 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379890; cv=none; b=ioPtxw567Q1UfyT7U355c26hLxRbpDEVDsWzqvzTSC0PvMloIQCEUJIC4jp+/QuG9KnwAU1JuM+/r1iwJ7MGy427Jq2HIPjdReYiFsc+d2GQVv/nCbC83FaYu4Y+B+iEGplLsv+cUtwfwLuts4hzKDmWVKALMZeJy6Whc6K4iH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379890; c=relaxed/simple;
	bh=b53VofDGPRM1GBlgP66ZMJ0fkJDmyWLK7QstQpHO3rw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j92YqIJbduMWAbMaIJx6uFQW2+8/Qv0sWBJveknNH8hELxZIi46tOqrKC4hfNSDYX0+rFj+y1NAEClLXVrFnOp+ahX5+nr0xOmuTuzS93QhgnvoUzNMEahWZ4V5YNwkK4iatCidxku20/bVvdNSMcr8+7alBmrgmQL6s39wIor4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCse/liL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCse/liL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF0B1F000FF;
	Mon, 14 Sep 2026 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789379888;
	bh=NV5ysSYUzr7wTam47Xgr5BpP0ObkoK7ZWem9Cub+zLY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OCse/liLHwkV5ghS83TJD0nEEp3k/7NCtbvhQpsWjEHvSX13i3c4WIlqNwyrkiN3n
	 bNUu0o7vcMjxsIly8au6ZzJqUCQ7hhKCZeGJtmOGYoJGdkgaYk196+JKHelCepjJOo
	 y/eWwie63/vQ408vRMnBnzEAuP8BvOJof92ByeDwp86warvGOzDD5r1loM0OS1juaa
	 hA9FzMwU44A9t4WjW7bld8O+Q3NCEz4+LdunqtSDZbtEmrEkJ4XIfy3i5tPhtbBejn
	 wbXl++57n9Ybwf+JSsRuiiFfuhf4yarwOAPjZgV1KF+6sc3yEe42d+HuSAgLLzj9ft
	 ayANgIx7PCmqQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 11:58:04 +0200
Message-Id: <DLEY8AHWZFCQ.QUHP2NHJW1QX@kernel.org>
Subject: Re: [PATCH 2/2] rust: scatterlist: honor the device's maximum
 segment size
Cc: "Matteo Kloiber" <kernel@matt3o12.de>, <aliceryhl@google.com>,
 <ojeda@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260831233215.287881-1-kernel@matt3o12.de>
 <20260831233215.287881-3-kernel@matt3o12.de>
 <DL8QLYLQJEL1.3F653J67DYZ47@nvidia.com>
 <20260913210806.125589-1-kernel@matt3o12.de>
 <DLEMH1X0KQA1.D1PYVJD0E6SR@nvidia.com>
In-Reply-To: <DLEMH1X0KQA1.D1PYVJD0E6SR@nvidia.com>

On Mon Sep 14, 2026 at 2:45 AM CEST, Alexandre Courbot wrote:
> On Mon Sep 14, 2026 at 6:08 AM JST, Matteo Kloiber wrote:
>> On Mon Sep 7, 2026 at 11:43 AM JST, Alexandre Courbot wrote:
>>> It also means that without patch 1, nova-core would split the firmware
>>> into hundreds of 64KB SG entries, which is not breaking but still
>>> something we want to avoid. The correct fix is to make sure that
>>> `dma_set_max_seg_size` is called by the driver, and while we are at it
>>> we also want every driver to call `dma_set_mask_and_coherent`. Ideally
>>> we would use the type system to make sure that both functions are calle=
d
>>> before any DMA operation can take place (using a safe interface), but
>>> I'm not quite sure yet how we can do this.
>>
>> This sounds sensible indeed. Should I open a thread regarding that on Zu=
lip?
>
> Probably not necessary, the mailing-list has a larger audience and is
> the right place for this. I expect people will jump in here with their
> thoughts.

The problem with those is not that they must strictly be called before
allocating DMA memory, but they must not be called concurrently with other =
DMA
operations, such as allocating DMA memory, as it would technically be a dat=
a
race.

Now, we can't really have drivers define them statically (e.g. in the drive=
r
trait) as there may be cases where it depends on the runtime state or prope=
rties
of the device queried at runtime. Sometimes it is also defined through OF
properties (which from a kernel perspective are runtime values too).

For the same reason it is also pretty hard to invent a type state pattern f=
or
those setters that is not getting ridiculously complex without much value, =
which
is why we just kept them unsafe for the time being.

The best option to get rid of the unsafe would probably be to use atomics
instead. It would however be a rather big change, what makes it a bit of a =
hard
sell, given that the reason of this unsafe is more on the theoretical side =
of
things.

Theoretically, we could also optimize the situation for when it is statical=
ly
known, e.g. some dma::Config trait that can be implemented, such that the b=
us
can set the before calling probe(). But we'd really want this to work per d=
evice
ID table entry, as it may differ between supported devices. But that might =
not
be quite straight forward without associated_type_defaults. The simplest th=
ing I
could think of is some callback, such as

	fn dma_info(id_info: Option<&Self::IdInfo>) -> DmaInfo

which is called before probe(), but that's not great either. Maybe there is=
 a
good solution for this, but I'd first want to exhaust getting the setters s=
afe.
