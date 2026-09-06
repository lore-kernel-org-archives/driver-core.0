Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D0119CC0F;
	Sun,  6 Sep 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709081; cv=none; b=P8vXXwkfPlvSMNJ0q+/6rS3XjeQHeDfgXEF+rvQu9CfUL6bzXe8KFc54n+DpZAVpYFoatsMwOnNWXqVzvFuFVQaxZIEyJ6Bj7bv80uOxDTGMdY9kCjvuujP1hD79wHYWM8ppoCxGk834iy6nIptj0eyR0gR7GAwFzu/HTjFaNm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709081; c=relaxed/simple;
	bh=0JSTTZwHiMDFTFAwfh9HFbnQ1oS4DMHDDR4AMKP56Qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=id72hGFHTNko4/I3PrdVt1tu4QARN7LOkoNuF4IXX0qexM94EsMMldXnVUHprxM0YHhiQ0Squeq0njG+ATzMJ5Pms7Plp0qv/w1uqhPZpVnIHVp4h6Us2YC0Z8bnSqyMFtr0OrlChG9y56w3k3lpcFm2NMApmgOD25bqDAb7RZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzrt7sQu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzrt7sQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A361F00A3A;
	Sun,  6 Sep 2026 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788709079;
	bh=qujTTAenY66iMBvpfF/wGhfpHa/+EVc6m2bRgKRS1Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dzrt7sQuiawS1ShvEX7c3FSn2ooe75+eWPwy2HBqP4pkoMwnUcqAbEhguTMz0VZCm
	 11TRp8LSMajjJGz4m+PS8eA0lSrDQs7Z6qjh4GU3jCixw5wswRil7VE7/Ex4cWIpqi
	 KYwy2xzIwWQZ+166H2lou0b3nohO/FnzVztmIDXMNyBz5cHNl/kl8FClCdO7p+2NcG
	 CxBZh8ZmyldiV/5CpoJ44aJswJA4CIlF3qCI2ss4jcLmCr2JaQ0hCJ9+5gMOQW3wu2
	 KUS7qv0TSg4jdkBURv3acDeF9SX65q02/gUMJDPqwMWlUbqd+o+W+iYoB29zHiTp9F
	 Cy0wFSwtEImlA==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	mmaurer@google.com,
	driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/4] rust: dma: tie DMA allocations to the device's bound lifetime
Date: Sun,  6 Sep 2026 17:37:53 +0200
Message-ID: <20260906153753.3207797-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830193824.471089-1-dakr@kernel.org>
References: <20260830193824.471089-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 30 Aug 2026 21:37:12 +0200, Danilo Krummrich wrote:
> [PATCH 0/4] rust: dma: tie DMA allocations to the device's bound lifetime

Applied, thanks!

  Branch: topic/rust-dma
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/4] rust: debugfs: drop 'static bound from ScopedDir file creation methods
      commit: 9dc6cedcd971

      [ Remove unrelated change from Self to T. - Danilo ]

[2/4] rust: dma: tie CoherentHandle to the device's bound lifetime
      commit: f6b56da8e1b8
[3/4] samples: rust_dma: separate driver type from driver data
      commit: c3d4fd0e9d27
[4/4] rust: dma: tie Coherent and CoherentBox to the device's bound lifetime
      commit: bed87375f90f

The patches are in the topic/rust-dma topic branch and will be merged into the
corresponding target branch soon.
