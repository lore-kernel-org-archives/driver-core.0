Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6727707;
	Sat, 14 Feb 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771063520; cv=none; b=lJhJ1gQ2MGeQ58r9+Oi8jdRxgqJMobDaOMtHD4M5epN1/ge7tc+JfdWBLsv/ejbkYTqJkGFrr8OWy8TvQIPioCuN9xZmR1hVCWGbBH2cKjD3tqtMtFhP5MAYg3riYuSB3KkBAs6LHAbZroSkslbqsGw/QolVjJuJNDyu9aC+TIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771063520; c=relaxed/simple;
	bh=RM+6xBHGsYTnhaIdeefLHg91xTMkbWgu2YMvREWp6MY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BPjCBFpVLYKE3JHIRtK/WfFyFI3bqT0VJcVk0WuXLR643k/1SBzE0FwcRglRREDOtIqh+ICRaJMvlYala8nwIFZCgrnoCryMhtgKxSijKCiUTksX5omThaxp9xiGXYxPjXU54ttD1YzaHoSxvZqljYpozbYLnqk2GvJJr4UiGq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoPl9cND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoPl9cND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACEAC16AAE;
	Sat, 14 Feb 2026 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771063520;
	bh=RM+6xBHGsYTnhaIdeefLHg91xTMkbWgu2YMvREWp6MY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=HoPl9cNDnZu2uRxI+TfBMln63lH6iIi35uwlBFNdv+af/UtDYHQJLyITXT90gaJp1
	 EGSgIllc8+rB+qkDCU3Iq3K3lJFfh8Id8cIT2e+32c5GyS8Jk7wK3BiknEuyAFteYa
	 6dg8XpNgGN2BBKQ+OmywrykqrPHfyTwjFsSiiK/+ZXGhWeic6IRHIogYHohY1MmgoR
	 rSI1vmrPpvhc52sEDqmEeN+0p1XF70jEKDSdOBJ/+FLNfcirA/3XHJX8A8bkDyK5kr
	 RR4TTG/NfKdvO9QrUeRzjdmfVvuiEkIyH7tA98UM7w+JOy93E1MqCqj5Qoen5uRssK
	 ecNKcu2nmgoeA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:05:15 +0100
Message-Id: <DGELMAUKREUC.1BZBHK3DX9CCN@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] rust: dma: remove old dma_{read,write} macro
 compatibility syntax
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-5-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-5-gary@garyguo.net>

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> With users converted, the old compatibility syntax can be removed.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  rust/kernel/dma.rs | 20 --------------------
>  1 file changed, 20 deletions(-)
