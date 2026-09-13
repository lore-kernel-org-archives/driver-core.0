Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB5A385D99;
	Sun, 13 Sep 2026 21:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334027; cv=none; b=kFHg/2IbC5xVHjg1h8JGJgbbS68sxUrkf6MKbATPlzQDuSTI4/KxjWMLdcyVNnfHOxOpaCSEFe6qUfzz6f+xnSE9YuTdmBTo78TUNlauszsd1lZLi3GcxPN6jl3VwQsbPG2/1FqxVcAIM9rQL/+KiiZB7a+SzXbWMh29khkybHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334027; c=relaxed/simple;
	bh=DzSFHRV3zOFFCm1Go+rK4cpdDjKv6Cdst3eWt/ksoF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/cRbK+XsVEg8cl1MPYcRuK75VI67Ab7o55oPleupT/e1szmzUYTOT1Ndtrk5N8gZ26vTojNOe7J9eiqOK5bcvM1tN/FKk8aEoLNxvutZaDATWVHvi9TroslIdQmdbZwcKDOabPUSynm13vlEK0Y+41LNGy1/LJmuN/yBI8wJsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de; spf=pass smtp.mailfrom=matt3o12.de; dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b=Kp3LF3yG; arc=none smtp.client-ip=91.216.248.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b="Kp3LF3yG"
From: Matteo Kloiber <kernel@matt3o12.de>
X-Lima-ML-UUID: 2fbc39a2-13f5-4230-8f8b-cc3368733281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1789333683;
	bh=DzSFHRV3zOFFCm1Go+rK4cpdDjKv6Cdst3eWt/ksoF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kp3LF3yGmb2/UWK2NrqqMLhKi+aI+viD6AmyNRJLVSleyYJ8wNr2hmStTlj8kQq4+
	 +O0o7M/aicxnIboJ8NrSVI6t3Lx8owtE1tDqMnHJJS7HLuArlMN5lmdkVJ5q/nXU28
	 kdclNABqJiGznU8ayXUJbp98qtWMakf5Y/cK4sTyeqooGhlX5nfVJk5O0y+M4rSlxL
	 TfoZlRPQO7jsREdWDNtjolBNaqXSi4dGS++O/G+jHQC/mFmAHCILnUNR54L7eAiKsY
	 gNX+1XM/hosKfWCdad4gw1RExFeUbsL79cglDoX2uiMAPPx8+ajPVe0dlkTNwXp/P2
	 acxKXHnARExpQ==
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: dakr@kernel.org,
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
Subject: Re: [PATCH 1/2] gpu: nova-core: declare unlimited DMA max segment size
Date: Sun, 13 Sep 2026 23:07:01 +0200
Message-ID: <20260913210706.125278-1-kernel@matt3o12.de>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DL8PWSOK6S11.3T0U8AX63YFO1@nvidia.com>
References: <20260831233215.287881-1-kernel@matt3o12.de> <20260831233215.287881-2-kernel@matt3o12.de> <DL8PWSOK6S11.3T0U8AX63YFO1@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon Sep 7, 2026 at 11:10 AM JST, Alexandre Courbot wrote:
> Note: new kernel policy [1] asks that the specific model is not named, so
> this should just be `Assisted-by: LLM`.

Got it, thanks! I was checking what other people did and noticed a lot of
mentions of Claude, etc., so I went with it. Changed for v2.

> Thanks, this patch looks correct and I would like to merge it early, but
> one thing about the comment: it carries way more context than needed and
> reads heavily, as is often the case when AI-generated. For instance,
> "declare that to the DMA layer" is obvious from the method we are
> calling. Make sure to give a human pass to such comments as they can
> make the code tedious when they accumulate.

Thanks! I agree. I was unsure about that and decided to leave a bit more
in for the review. I'll just use your comment verbatim.

> Since this seems to be your first patch, this is a good opportunity to
> practice sending a v2. :)

Yes, submitting patches to the mailing list was certainly a new experience.
Thank you for your help and time so far!
