Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51823ACA51;
	Mon, 27 Apr 2026 22:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777328099; cv=none; b=D7cTevcL8oA2soZfKJcjp5ZS9cNox8b59QwmFJLuGhhfBx4UOyd7zLgmEMMo1UOdio4LNVIeXvOVsRjDnK4DPkIXntKFmoJLtZ3OKR2Kxp8N+DPB9t3o7VVlyA5sBU0mbgVn/jOqS6NkMvZ+PEs+ORSC3jCGAknMw4IJAx3kUA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777328099; c=relaxed/simple;
	bh=jKCbYSmsGSQtb8z472IdJt0wtsbMXXU4FOygbGFvB9I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mSlIqp6HYutzG3DDp4yJ9QwaAlZO/Idztq0EAf484dMKS2O0ue7hIOlddUu9I6MpHQ7wPN+n2MamXnkZn1ilH5GkD+hzWVOZBQhqJJNfTx+EXtZfu++2tdJSvzeG8FLAsHRtTap7oFsLTErruDQbA7GKLcMUM9MbMpuW2/8GbWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jq/7jo+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jq/7jo+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8302C19425;
	Mon, 27 Apr 2026 22:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777328099;
	bh=jKCbYSmsGSQtb8z472IdJt0wtsbMXXU4FOygbGFvB9I=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=jq/7jo+ayvGw9P4xqGszsECHGAmSYk/Y0GbzMSiOfaNV1f520wAdrEOggaW5pJisY
	 ZzXAJW4LCoyAOzIO5JJp+aqLFu6tXyS0jUXNiB1kXczf20busfVnrRv80JeUDTOLDC
	 lM6YQCmUnSoH8VwyS3iHhc1/ysFWsLE6qI7rVNBG5grV42DMTMlm10RcfKeSQvQpU3
	 2F5b6mpX+vSdBI3GNqXygFOjJyHHoOebj9vr3XlMOWFPCQ6+Ri03GqQx5IEihteT74
	 kZhAUWer7UwyImNSJy3aSGFmICbze7ulG38PpUIN/DDKwOVVfBHHkRfyziFEpxWNjT
	 izJEtsuA85SMA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 00:14:54 +0200
Message-Id: <DI4A86QOY8BW.10B14POU8D2XA@kernel.org>
Subject: Re: [PATCH 0/2] rust: auxiliary: replace drvdata() with
 registration data
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427221002.2143861-1-dakr@kernel.org>
In-Reply-To: <20260427221002.2143861-1-dakr@kernel.org>

On Tue Apr 28, 2026 at 12:09 AM CEST, Danilo Krummrich wrote:
> When drvdata() was introduced in commit 6f61a2637abe ("rust: device: intr=
oduce
> Device::drvdata()"), its commit message already noted that a direct acces=
sor to
> the driver's bus device private data is not commonly required -- bus call=
backs
> provide access through &self, and other entry points (IRQs, workqueues, I=
OCTLs,
> etc.) carry their own private data.
>
> The sole motivation for drvdata() was inter-driver interaction, e.g. a pa=
rent
> driver deriving its bus device private data from the child driver via the
> auxiliary bus.
>
> However, drvdata() exposes the driver's bus device private data beyond th=
e
> driver's own scope. This creates ordering constraints -- drvdata may not =
be set
> yet when the first caller of drvdata() can appear -- and forces the drive=
r's bus
> device private data to outlive all registrations that access it; a requir=
ement
> that causes unnecessary complications.
>
> Private data should be private to the entity that issues it; bus device p=
rivate
> data belongs to bus callbacks, class device private data to class callbac=
ks, IRQ
> private data to the IRQ handler, etc.
>
> This series replaces drvdata() with a dedicated registration_data pointer=
 on
> struct auxiliary_device. The parent stores its private data explicitly du=
ring
> registration; the data is private to the registration and lives as long a=
s the
> Registration object.
>
> On teardown, Registration::drop() first triggers auxiliary_device_delete(=
)
> (unbinding the child), then frees the registration data. Ordering constra=
ints
> are structural -- the child's lifecycle is scoped to the registration by
> construction, not by convention.
>
> With no remaining use case for drvdata(), drvdata(), match_type_id(),
> set_type_id() and struct driver_type are removed.
>
> This is a prerequisite for [1], which builds on the removal of drvdata() =
to
> enable Higher-Ranked Lifetime Types (HRT) for Rust device drivers.
>
> [1] Posted as a reply to this series.

https://lore.kernel.org/driver-core/20260427221155.2144848-1-dakr@kernel.or=
g/

>
> Danilo Krummrich (2):
>   rust: auxiliary: add registration data to auxiliary devices
>   rust: driver core: remove drvdata() and driver_type
>
>  drivers/base/base.h                   |  16 --
>  drivers/gpu/nova-core/driver.rs       |  10 +-
>  include/linux/auxiliary_bus.h         |   4 +
>  rust/kernel/auxiliary.rs              | 208 ++++++++++++++++++--------
>  rust/kernel/device.rs                 |  60 --------
>  samples/rust/rust_driver_auxiliary.rs |  40 +++--
>  6 files changed, 180 insertions(+), 158 deletions(-)
>
>
> base-commit: a7cc262a11354ab104b8e55c21200d099d141bc7
> --=20
> 2.54.0

