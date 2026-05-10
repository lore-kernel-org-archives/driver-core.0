Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13B031AABF;
	Sun, 10 May 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778449193; cv=none; b=o0XBvWnOiV7GUPtCMrjGifBGUgn5Axgb9R98LuKCegWG2f2cCwReyvcSMi6Ab0crqeIbObA0gYpzGUfKGUXZHmriErAuFIu4d91+oYtckLziM9s+SVYaMGvdIazTIM+82FkEq0GaUbf9Zoul2ILQ9fwhW1bPW6WA1zuG0xO3kS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778449193; c=relaxed/simple;
	bh=ivkV5xnwxUbw7dEEK4h8FHKMAW8JZ/SVIXnsE04kiFg=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=cl2TOZKW8pJ2q9MUvciKnpSEh28hh4pFsxT0WjM5/q6UNNbtofCmGAOFEc62lBVkUJWJV7mEJCXbMJf40Ns6MBlurlOWNlExAE3umTVW5Ge9e5bWv76Q6/i+ejUAgXsDpEWM7WJqnq1yv2kqbgYjPRE5qr/Fhd3GzJCjpoCh9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6CActwF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6CActwF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B477DC2BCB8;
	Sun, 10 May 2026 21:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778449193;
	bh=ivkV5xnwxUbw7dEEK4h8FHKMAW8JZ/SVIXnsE04kiFg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=X6CActwFWhZQQB7j52NkscIqvVWA52kx+SKHaT/RFXi5vQHULWcsgGQgtx3UmwdpQ
	 6dhlivWfVvYAzF1tO0yguda2aRj1PyB/IYFHoyxjW383bAk/5lwL03HIAKf98NvSAF
	 j1Jt6mh1QuLVpuA1sO8jx2LhxpW8qztLemhn0Q98yB18jCMMjY0875eMMUBpbp7YOL
	 gNh5+vFA2LlmDxh7hUgYlfVPWekLqbRmaHVvnU2An7mUt9b44+p8uAJHYiTkY1orxX
	 1lRTJQVW9Af1rSbqHWnghSOc6IzPDjkTqeR2csdBMCmlTM2CCVqYhQOBuxkSDv20n0
	 n0h6spSBgDxHg==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 10 May 2026 23:39:48 +0200
Message-Id: <DIFBME3GXDC0.14UHJTPD6TTAE@kernel.org>
Subject: Re: [PATCH v2 2/3] rust: auxiliary: add registration data to
 auxiliary devices
Cc: "Alice Ryhl" <aliceryhl@google.com>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <acourbot@nvidia.com>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260505152400.3905096-1-dakr@kernel.org>
 <20260505152400.3905096-3-dakr@kernel.org> <afs3Mz8J9oOeqF34@google.com>
 <DIBMXPC3ZKIA.1UQORYD223AY6@garyguo.net>
In-Reply-To: <DIBMXPC3ZKIA.1UQORYD223AY6@garyguo.net>

On Wed May 6, 2026 at 3:41 PM CEST, Gary Guo wrote:
> On Wed May 6, 2026 at 1:42 PM BST, Alice Ryhl wrote:
>> On Tue, May 05, 2026 at 05:23:08PM +0200, Danilo Krummrich wrote:
>>> Add a registration_data pointer to struct auxiliary_device, allowing th=
e
>>> registering (parent) driver to attach private data to the device at
>>> registration time and retrieve it later when called back by the
>>> auxiliary (child) driver.
>>>=20
>>> By tying the data to the device's registration, Rust drivers can bind
>>> the lifetime of device resources to it, since the auxiliary bus
>>> guarantees that the parent driver remains bound while the auxiliary
>>> device is bound.
>>>=20
>>> On the Rust side, Registration<T> takes ownership of the data via
>>> ForeignOwnable. A TypeId is stored alongside the data for runtime type
>>> checking, making Device::registration_data<T>() a safe method.
>>>=20
>>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>>
>> The change itself LGTM.
>>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

>> But I'm not entirely convinced that this is the most convenient
>> user-interface. I'm wondering if the auxiliary driver trait could
>> specify which type the parent driver data is using in an associated
>> type, and whether you could eliminate the check and error path that way.
>> But then again, AuxiliaryDriver does not appear as a generic parameter
>> in auxiliary::Driver, so it might not work.
>
> I think that's similar to what I'm suggesting in
> https://lore.kernel.org/rust-for-linux/DI6L13A5LMOW.DU7ZTHXZYB0K@garyguo.=
net/.
>
> This does still require the type ID to exist and that probe of auxiliary =
drivers
> need to fail if type ID mismatches during probing.

Technically, this would be an additional driver match criteria, i.e. the na=
me
string in struct auxiliary_device_id *and* the asserted type of the parent'=
s
registration data must match.

Given that drivers can match against multiple entries in the auxiliary_devi=
ce_id
table, we must consider that they can have different registration data type=
s
(depending on the specific parent driver that exposed the auxiliary device)=
.

Thus, I don't think we can solve this without a runtime dispatch (over all =
types
that would need to be listed in the ID table) anyway; and having this dispa=
tch
in the child driver - essentially leaking an implementation detail of each =
of
the parents into the child - does not seem to add any value; quite the oppo=
site
unfortunately.

(OOC, I hacked up the statically typed version -- I think it turns out OK,
despite the fact that it still leaks the parent's registration private data=
 type
to the child, which I dislike, plus a few hiccups with the generic device
context infrastructure. But as mentioned, I don't think that's an option in=
 the
first place.)
