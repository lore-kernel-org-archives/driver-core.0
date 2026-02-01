Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25A029408;
	Sun,  1 Feb 2026 21:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769981629; cv=none; b=MspPUl7KcSP0dONYLWJJFKL7i2Bf00lcxCVMNxuiMbzsHZCgXTYX/KtfHcZxtEm8LwnXoln9bORbsZs/fxxOhcFo6h75AOKeht1JMMAMSYrKKA93YZotVbgjYCe0miMhtGTCGkS582vU4cUqsDU7W6bBbiHJFdRaH3qsklL53XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769981629; c=relaxed/simple;
	bh=BhG/nbZrUnKB6ru24dvd0W7KauSLAsUDhQNiBXQ7NWc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=OHQZf1z1hMtpIpnD7zhHcCVoDe+oZZ0f6jNy/7PsyUR46Q+vgf0435qfLlYTvgX6/nCUTVs5STwziIRmNkZeMfWY/H5/r7u7vciNmGv02xv01oqDFXR8IBtVsVXCW884mrML5qsJLDYCdlez/H7eyZF5RkgF59llOUxjFTZ+ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2hPEQAk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2hPEQAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3A5C4CEF7;
	Sun,  1 Feb 2026 21:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769981629;
	bh=BhG/nbZrUnKB6ru24dvd0W7KauSLAsUDhQNiBXQ7NWc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=e2hPEQAk28jnzoiWYYRjkM/gXWblORpOvyxsX8uXRwMHsEjfG7KEX3PAL1LanyhaT
	 GpkLN6y/9XGhfA2t/U8LlXagHu1KFUZejZtLU3iOQgnMVGzrLi47Np8/3fNd/M9D3K
	 vyknIqD/eUcC1Pq0zNxFMhXV7UFcrS3vBHBnS5Lodhs3WjKkC15rED0oEdbZ5FwXsV
	 Mb4nqJ0ocs0IL2MJsxVZNlRHg+HJxxeDY1hkOep3u8p6fdN4GcAmmUUW619qFIgo+l
	 s2bEC9sOUnoPhlEHf0J+swW5kkuTF67P1IMOcTgxYGbY1dNSeRSmqr48jw6nQakpvS
	 R8DE0Df9c0JRg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 22:33:46 +0100
Message-Id: <DG3Y4E41QIZA.3LBI0AN3JIDCN@kernel.org>
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: fix inverted "locked" suffix of
 driver_match_device()
References: <20260131014211.12841-1-dakr@kernel.org>
In-Reply-To: <20260131014211.12841-1-dakr@kernel.org>

On Sat Jan 31, 2026 at 2:42 AM CET, Danilo Krummrich wrote:
> In the current implementation driver_match_device() expects the device
> lock to be held, while driver_match_device_locked() acquires the device
> lock.
>
> By convention it should be the other way around, hence swap the name of
> both functions.
>
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!
