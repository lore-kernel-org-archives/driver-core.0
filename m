Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE25741C2F2;
	Thu, 24 Sep 2026 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270519; cv=none; b=Bk2LJ8UCRjfD0wpBr4XZjj6cdMaB7sQ265Vjhyq2oHm/jd/mViusGWOiQIeLwf8pfmBr6U6qfOaFznEAHsTqbW6KgReiTmlhuytvWsksAf2wyuAp0e6NHmP6V5dC7iKvlN1IEMsa718YJG9f3DJUnju5pZ7XmAl+k6ZF1XZVarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270519; c=relaxed/simple;
	bh=HBC3YtGwOS/hrQSLCFzW0giR+SP29nfbPT/65wjTmVA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=XUC8jGV1QR2ZSkQx3ts8bLV/6ok1XPswRPVuRq1ERQP4pj+Za2WZeIBsAiWfJt0B4bFwQRk7se1J9Ela42j3tKQiyakwEnEXmbSbOGREnVdCTrmRq+YU1H9xv9a6+yPp+IkSKB6NjlboeOqegsJuwCe1AwpB4UIqdKgozXbgoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfWJgHjt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfWJgHjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488BC1F000FF;
	Thu, 24 Sep 2026 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790270517;
	bh=HBC3YtGwOS/hrQSLCFzW0giR+SP29nfbPT/65wjTmVA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=lfWJgHjti98TQemT6CHMxITv1UlfN1h+FF2he8rd4Q5Ic4jxUwIFecS0eOKr40yQ4
	 YHBo5xMEnjywMrKcrxgGss1rotB9Dhh7WBV7B+7YmfNmjkzupCxcxlWV4qtNPMBb19
	 NCcQSAH1WjA1znQLZbVRkXRxOvyd5i6qrtjxshOqEzYugWHh3F8kOquEoipqlTSjnN
	 RczjE7Jl5QLWCaRAZQ0G6EKGllepLt1WRUw1R+cBfuqVwi9sW5/Z7Sa7fkYZK84djZ
	 HIIieVSQvMEryHL4lEbfZ80JF4ueoeMSfCCZV1b2KFlWj4heNIDwsJyFLkpPtxJ4ZM
	 PhPwumnfqGC2w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 19:21:51 +0200
Message-Id: <DLNPXJ4WPH4L.2MBUGV1TAESYY@kernel.org>
Subject: Re: [PATCH v3] rust: io: convert ResourceSize into a transparent
 newtype
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Robin
 Murphy" <robin.murphy@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
To: "Lorenzo Delgado" <lnsdev@proton.me>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260920-resource-size-newtype-v3-1-9451444e83bb@proton.me>
In-Reply-To: <20260920-resource-size-newtype-v3-1-9451444e83bb@proton.me>

On Sun Sep 20, 2026 at 2:13 PM CEST, Lorenzo Delgado wrote:
> `ResourceSize` is a bare type alias for `resource_size_t`, so it
> inherits every integer operation and `as` cast. That allows operations
> that make no sense for the size of a hardware resource, such as mixing
> it with unrelated integers or truncating it with a cast.
>
> Wrap it in a `#[repr(transparent)]` newtype so each conversion at a
> boundary is explicit. The representation is unchanged, so this is
> ABI-identical; only the spelling at the FFI boundary changes. Provide
> `from_raw`/`into_raw`, `From` in both directions, and a fallible
> `TryFrom<ResourceSize> for usize`. On 64-bit, where `resource_size_t`
> is a `u64`, also implement `FromSafeCastArch<ResourceSize> for usize`,
> so code that is specific to 64-bit can keep the conversion infallible.

This looks good now, but it makes me notice that dma_len() shouldn't return
ResourceSize in the first place.

The length of a single SG segment is bounded by max_segment_size, which is =
also
unsigned int.

So, I think we should change dma_len() to just return u32 (I'm also fine wi=
th a
new type, but it might be slighly overkill).

I'd usually pick this patch regardless and leave that for a follow-up, as i=
t is
a separate issue. But if we change dma_len() first, we only have to update =
tyr
once, whereas if change it after we end up touching nova and tyr twice.

Thanks,
Danilo
