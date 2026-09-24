Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FEB4A43E0;
	Thu, 24 Sep 2026 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265097; cv=none; b=s0wh7SBO24tMqlBlSeU9H396oHnq0IUNyRE6ThhHNu9PJEyqa4fHRX0xFVEU3RwPlFk/A5dZzkAksh02CNg5o0ZbyFNZATtJbRF8Tis2OyPEr5mT3Hm+rBmGW74eZYLrJrj4bYiX+etc/Xnab37dHnx7EvKJ2TJ/oWCUZ3iUq4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265097; c=relaxed/simple;
	bh=g8nqpWtSdRFFA7zC1/NnTF3asdU7qapypnaqduZYaYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJhNk3N03Hkxpxj7XJxgQ9TCYqu7eBMz1YvHsNu2MwP9RKMbc07e2LUXuZrslRuiH2+ggvFli3yYZNVoug0WKilp92Qewksc4Z80uk9woMeWDWdRpQQ571V3ABQmBBe59BqOw8Yas8BuLueV2tpEwWmuF7jmb9hWQbNFdmWAVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDR2bj4E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDR2bj4E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA371F000FF;
	Thu, 24 Sep 2026 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790265094;
	bh=3UvAeCPkumitIVweVNw8lQWGNCzkNqkC9oqTuxhecZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iDR2bj4Emd18d4ZRFVP7SInUoSNDbs0E2W6YM7La8ufGrBspNrvprqm48RIbA1xb8
	 k6rWXRzcCMsR4xBZ2SQPiGAB2WMBQubhv+ikZQaz5CexlPw0VEN7TGiZMxnlMOVe1R
	 kVCg7L1eubknEiL0VRNbci92eU//NJQCPt7t8eW0tjTa/gPaeh/JJWHeY1pE0njWK4
	 hDxBmumdJ/043wjcbEERIBfdqO/OLZOndjhR0/FakY8e9GYPZIVqx9Q0vIa99v6ved
	 g7Au1m/4GiFI7Qx+qVpoQuOiKc/PQo+g/y8mx2sSlVcD9fQNMmApURcOaAw26KY0Qr
	 FB9Stu7SJge7g==
From: Danilo Krummrich <dakr@kernel.org>
To: Matteo Kloiber <kernel@matt3o12.de>
Cc: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] rust: honor the maximum DMA segment size
Date: Thu, 24 Sep 2026 17:51:27 +0200
Message-ID: <20260924155127.96245-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913210828.125655-1-kernel@matt3o12.de>
References: <20260913210828.125655-1-kernel@matt3o12.de>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 23:08:26 +0200, Matteo Kloiber wrote:
> [PATCH v2 0/2] rust: honor the maximum DMA segment size

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[2/2] rust: scatterlist: honor the device's maximum segment size
      commit: c15c5befd6d6

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
