Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D0D32AAA0;
	Fri, 27 Mar 2026 20:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645113; cv=none; b=ijQF9oQSV75RYeRNDrr658UDeHEnWhpA8L4LWFd8LOrsXsi1FSSNn41zu6dxomKDnU8d6GPkHuTTY6wRLlEpMqwqP2jD4hgCKb0MPfvdWr5IHGNyLbUF/kTaj4e7F0Aa8xb2o6YJ4pm2NsGdeCzelYR13Vh2mFlrD/YFk7fJDjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645113; c=relaxed/simple;
	bh=roABbtNrEE8A25dHU1WgsbJ86mMwEBW73hbxmy0umcU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=J0L52AkzfXQ8eX4hBCK8394mFztikjKqEfTyZId9O+jJI1YQAROT6JdBrwpal9duSzlvXptfpXR9OkLmDNiQyLj5D1c5KQHBUZ0+wTljd3k4iSlB69KXRpgheFaIEMYbZ5SJYIxTu2fKvGh5rFfEY5Hu6/EBhgmP9liZYnR31hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUszrW5j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUszrW5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BE4C2BC9E;
	Fri, 27 Mar 2026 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645112;
	bh=roABbtNrEE8A25dHU1WgsbJ86mMwEBW73hbxmy0umcU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mUszrW5j/RMyayjlk70PmmPBSyQO9a7Fu7fL0GcdYRxxRvyDJphb6mAhBzGgA1pAi
	 6ISM6kKGU3RUI3Fw8doTP5dHgNSkoYH88AsMIxqMinxHH3sMJhhFB3AXSeP65ZIzlj
	 HZEr5K+rDnWqlyJoxjfOIcNqY0kpX1LuVIBtkZONi6Ic6IrmH1MIctOtCOcZDG1lBp
	 ktD2/mEsErY3x6j3wxi66vaRFQM1/OFY2trbR2XG2B5Q5UzIMKIUI3jOU0ZN0xeZlB
	 4ZbH8ZsGakL3VTLRohjUZ9nlrWW3xqNxFBvMddMGA1w04Ntz26gdOsVmVJl1dSy1t3
	 2TXsNy04uufHQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:58:27 +0100
Message-Id: <DHDV6RFKI785.8YH8VOWORAC@kernel.org>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any
 Coherent<T>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>

On Wed Mar 25, 2026 at 1:39 AM CET, Danilo Krummrich wrote:
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next, thanks!
