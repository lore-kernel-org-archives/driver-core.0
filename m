Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365298;
	b=Q1DS5QBo/UBrfq0z83LYuuYTCK/wvgnBam3kgr8IeOvde0invSvW2VZdBI9PCBnVoafg
	 f+XE+NEFRq0XkCGu6uuSNrFoOWScxjiJKHiruQ4M0IIGixsZ+TLyO10hwBcUF69wvlTSV
	 4+uoC/kgsIJBzpF73hk8TzhnxfZDKP33ZyVP5xVpazqr86F86gOpqTRmBqsmbp4aOpnym
	 cy8uw1jVuKZV8UdZKmZSWdLhWxLKxEMothCSzCsk6xjPrvgew3wiH7ATeZ9uezgLKvby4
	 D1nTzR/ZmV0HuCrIKff2PZ9THTjItrA/1VI0WApVO19ETfEs0YHsJ2t+Rqs4ksWoQ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365298;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=frqLSKxdb4TD6+ImaJKDNUJhKNAv5G/KX6Pf1cnjYIk=;
	b=PksJqtxfPvmsNkcF44PLH/8CZEcUgQQWdLhTRlCHZ8PhIaVAe7DE6grYroW1GXfusYPs
	 XPiLO75fe+kQJGYhfsdRFw6vaFjWRfH2bXbBNJCs36xyLjjVgtRjdpQBsxBwFRpD5Aypl
	 VbPBdKTauN+tf2BOjyjYWwCnJiBkvi9g7L5Kl1EUrbnnrUoW/mnBiq9ZWQuRHfCozZgr8
	 qgQTJ0iRpCn/JA4cfphprsPYYu3L9oejmtgOhsiqsrs6Z7RU+LEiGZf+0o9ayMuNxGSgv
	 R9Ncnwko3CfvMnPCoyax96ebWvBD+/az09PNi+VyzOnwpsYXHORjF6NSyeWD5kg0paA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZuWbp7z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8F606A32A;
	Sun, 22 Nov 2026 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZuWbp7z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538FD1F000C6;
	Sun, 22 Nov 2026 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365298;
	bh=frqLSKxdb4TD6+ImaJKDNUJhKNAv5G/KX6Pf1cnjYIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KZuWbp7zHOTaHce3aX8HCT+nYzblWSjnop8TvVDgDh9Z3fgKmHY6C6cGtgt+keq/O
	 hAskLZs8J6d9+Fvmw91DrnOGAiHcTjhHromX2DRA6QeQI3bYCqVaQwd8ijnh4LTquk
	 MbY+Q29TuhB7v64uiI17NAdH37QUjkIUtMjSajcxHgzKYWdikCaCxCX0vCprt+kmYO
	 qSuewqezcSIfxIYq/8TUJOeoS8o0aHPBiAYT+ZeadGy4juSllYpW619Sf5P1lZHzd5
	 2Bn6ggpDEWtvrLZE7kVXLnpKS9rlkYGXQtD+PbzABMV8UCv+9y5affZnHFdjJz8Dwl
	 ci0GPNAk/SKhQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] rust: scatterlist: tie owned tables to the device's bound lifetime
Date: Sun, 22 Nov 2026 17:34:52 +0100
Message-ID: <20261122163452.927512-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234324.82387-1-dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 00:42:53 +0100, Danilo Krummrich wrote:
> [PATCH 1/2] rust: scatterlist: tie owned tables to the device's bound lifetime

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] rust: scatterlist: tie owned tables to the device's bound lifetime
      commit: 0504beeb95d1

      [ Remove stale documentation. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
