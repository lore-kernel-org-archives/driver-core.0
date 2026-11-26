Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732338;
	b=syd7R6giAUrNvFPmXfjA0MkylNoqM06bvWvZwxdkjjzgZOGOZ2jEJ2iejiiO6g29E+b+
	 dy/dgliov5efsctHI8/11wg2dPbnZI2Oay/9sBe0g6M5cU1aybHXjBeVUQQgx2wtymOV/
	 mJe/Z788wyiRo77+mgx/BA8fYl5u0zTkXhts8aoAEWEtjILlAKJ8/iacxUBf7ya9aAeOF
	 6gVK+mLkW3wTYXr1p8Vasho7v1JZ7lmdHU+3OXt82Xe2gD83hotPDT63MVJjdc6rVGw4x
	 vYsJ0/cYuSr2tUkCLQm53J2h566wY6kfcvyq2vuKcUrisRUc6jppOq0Vdz0X67nchNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732338;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=r8cx7FzswGhE87syke+yfvM8LqqsMTI6iDBgEAypfls=;
	b=fjovke7vwCbvn14yEWWI5ylpjHmUonxxotsgxFHySKeQnFVasfL7/gB9B+6r4E4CWSOF
	 pb8AXZ+//+bNBZ8j1zVzSJUelt+j4H6HV0L9IIktaao8TixznC2vNasYbNH7EbUxrvA+B
	 GLlE771wWER+sbHNyT+onPWzStHUgRzA6+NZAjfAGGIgnJYLOhyLuzVs+fGHmuFvtsf+V
	 AseCaooniesXi0L3xhpdOFAHa2usdYEVN0XJpOminLSMOZApajd4GSDUpOxan3kDZsczB
	 yvGf0GhUJkLhe+1dFf4/9scJprO0xTAhyy8q64Cdm/HUa9S+jmduwz2fBaUn7pP5QjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PewU9hlF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD1606A31C;
	Thu, 26 Nov 2026 22:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PewU9hlF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B911F00893;
	Thu, 26 Nov 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795732337;
	bh=r8cx7FzswGhE87syke+yfvM8LqqsMTI6iDBgEAypfls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PewU9hlFpj4WAcKfYhUGo2yGDuRngKqZFBBhvEgPLEYgKteKyYahz3H8MkVfdpCZU
	 8wgGYHsCTjrCqO8W9tIaSA3nUab+G/iFmjY8pqCYX5MXdTYxXxsIrDrz6TxW4+2k0c
	 WN6S7FSH2hKHYiewvJdFP4SSSOvxvanc3b/3L07Ob4jLreKgZjNM5Prkk0gZ/qiO4X
	 T0LZzjZHp03hRTgTGJIQetpDeIjm0ldSDDyKZcfnIxK4eXWE4DOCNZkYc+iXo6uLVv
	 vhA1VZ5nxnKO8RvVpU7DnJpMuULD5jIl9aJTpwMuFC8kuQ2Wpfi0wQ9qUgjheuo9g7
	 gHzdGEGno0KCQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: rust_dma: construct driver data by value
Date: Thu, 26 Nov 2026 23:32:12 +0100
Message-ID: <20261126223212.3842853-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122171610.967066-1-dakr@kernel.org>
References: <20261122171610.967066-1-dakr@kernel.org>
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

On Sun, 22 Nov 2026 18:15:32 +0100, Danilo Krummrich wrote:
> [PATCH] samples: rust_dma: construct driver data by value

Applied, thanks!

  Branch: driver-core-next
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] samples: rust_dma: construct driver data by value
      commit: afdbe7816eee

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
