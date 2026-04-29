Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54342E175F;
	Wed, 29 Apr 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471136; cv=none; b=oI3g1Ow0nfmVe9Fgh+I4VqPBi0ChDD5D3J97QtXiKlW5qI0rgALjDj6a1atCDCq/jYX03932yjsiYD7XyEqWzH0ReisItSwP9N9G+0LggNVFDPufpeQN24y8/+e65izckW7iRG3l+y7v14a0m5EcgEvQdNRuJs7nY18zcpHH9k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471136; c=relaxed/simple;
	bh=CkAYCE/5j2/fp11dlpM312pzX8TqG3LYxtTmYqCQDEw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=kMRh4joerF2EEWuShypeErFZVPSI2313eZpYd5oSEhXB9jejVjwO5V9XugrhRRJaqp5kVHnbsIShasYNLrlGZquExqZ9MdqTyCe4I+/OMeYsZHCjA5G42F5KGtfnjirtlR7M1cyjyLed1zmlEowR3hyOGG9D4HefMKwHSETpB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HETBOgpT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HETBOgpT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6167C19425;
	Wed, 29 Apr 2026 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777471136;
	bh=CkAYCE/5j2/fp11dlpM312pzX8TqG3LYxtTmYqCQDEw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=HETBOgpT4IB8anE+gnU48PwtidV02pTBWMj9U9ARp8btM0k9xFdg5IXUEd5znKIBF
	 UPYG3+5uYUUdrDNU+zayIzr4tyYNETQdktT1ve4s2qQvU82F6YIhJTVXBbk16tkm8U
	 cDH9/GRyh77Of520Kyhijp1QdL63lV4SB6SEAMlEZfCVa+Ym6NBV7PelQquUb5xY3H
	 k0mzt8XLmykgk4rEN+zzHE0FShYYpqQKfRYE6HV1f5xE9kRxe0dec7K9WRSnj/itys
	 ECp2NfQsAxotUQVrF7xQ5gUW3qXRLNnU59OCVGL8lDaPdvyVR6m1DTGk1v2Uovvwmc
	 aazSBOhiq0mNA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 15:58:51 +0200
Message-Id: <DI5OXGXY5IW4.281BBJHGITWR9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust: auxiliary: add registration data to auxiliary
 devices
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <aliceryhl@google.com>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260427221002.2143861-1-dakr@kernel.org>
 <20260427221002.2143861-2-dakr@kernel.org>
 <DI5LKWS7J1D7.1O8GCHRV28QZ2@nvidia.com>
In-Reply-To: <DI5LKWS7J1D7.1O8GCHRV28QZ2@nvidia.com>

On Wed Apr 29, 2026 at 1:21 PM CEST, Alexandre Courbot wrote:
> I'm wondering whether we could avoid introducing a Rust-only member
> here, either by just allowing the aux device private data to be used in
> C as well (which might be as simple as a rename, a couple helpers and a
> bit more documentation),

This is intentional; if this pointer would be shared we loose the guarantee=
 that
the stored pointer is either NULL or of the following form.

	#[repr(C)]
	#[pin_data]
	struct RegistrationData<T> {
	    type_id: TypeId,
	    #[pin]
	    data: T,
	}

This is important, since otherwise we can't check the TypeId independent fr=
om T.
Of course, we could store the TypeId in a separate allocation and use this
instead, but then we'd also end up with a Rust specific pointer.

> or using a wrapper type specifically for Rust
> drivers:
>
> struct rust_auxiliary_device {
> 	struct auxiliary_device auxdev;
> 	void *registration_data;
> };
>
> Although I am not sure what the implications would be for e.g. a Rust
> auxiliary device spawned by a C driver? Is that even doable with the
> current code anyway?

You gave the answer yourself with this. :) If we'd "subclass", there'd be n=
o way
to distinguish whether the struct auxiliary_device * passed by bus callback=
s
stems from a C or from a Rust registration, i.e. we'd not know whether the
"upcast" is valid or not.
