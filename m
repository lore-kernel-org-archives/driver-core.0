Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BE43BA23F;
	Tue, 14 Apr 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161562; cv=none; b=MDUyqju8DTiCOntA1XsbGuqKbpxNIwlHgfLbYxmOMHvy63iNfOp636gVdUQ5wYqmt6XErmtRXncwGQu5cEo2Q51/5UXeGfjpvVGyJ1e1cEGqG2ddUhBBifTuWr1VKBeTj9nwmER/07FmD6hLYszoraokqBySPFcP9PtOp/QJrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161562; c=relaxed/simple;
	bh=MDv3kvOucv/YXk51Y2Sp+gdZSV17cZk52IrUWlDb3JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n+cSjVQJuGb7hUW1PRDNf2Zkb8ztao/3oWvNzPl/FJelTjxGftUwrEiCFByL53KVlzCzB+TVIj6Pf6faYw8rpFBLyyvl6DiqDINdy0yc0uokC+mFrIi6jEq3pc+nZXyAhPlFRW0gUA7W5aCqhTzjNA5S8qa16K8wZnQSOqzb7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDi2M+6e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDi2M+6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AC0C19425;
	Tue, 14 Apr 2026 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776161561;
	bh=MDv3kvOucv/YXk51Y2Sp+gdZSV17cZk52IrUWlDb3JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EDi2M+6eRbgJiOqSqYHi+2wlBdbvLYPw6BFqTDpRZoJHn35t5jpEPS1vlhuGZiohH
	 xDlg9JwwPKFDsHDWDxNUhXvP6vxeQhhIdPiDhk+LmgG1Zo2f7MSM8z+3E0yKsNtYtU
	 eHe2OEcE7zuzMEfCsxnP2Powi+vDxp4GaQK9jwXBCkUBB8U+8rcVxOggY7ANgAt1FR
	 2acifGi/DtjlSJEJd/VFnVwUubACkoJfiJL4eS3fpikTyKs1DxY0GpHXr0u7w4LxaM
	 lFt3J6UCSzQkpriFVbOQNDUqb9TXG5OHkiTB/5IVKMs5zjR1x37q71UN64hDukPKbh
	 uvZV1x0JuHteg==
From: Danilo Krummrich <dakr@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	driver-core@lists.linux.dev,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: Add kernel-doc for DEV_FLAG_COUNT enum value
Date: Tue, 14 Apr 2026 12:12:32 +0200
Message-ID: <20260414101232.1699643-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413195910.1.I23aca74fe2d3636a47df196a80920fecb2643220@changeid>
References: <20260413195910.1.I23aca74fe2d3636a47df196a80920fecb2643220@changeid>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Apr 2026 19:59:11 -0700, Douglas Anderson wrote:
> [PATCH] driver core: Add kernel-doc for DEV_FLAG_COUNT enum value

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: Add kernel-doc for DEV_FLAG_COUNT enum value
      commit: 5b484311507b

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays.)

The patch is queued up for Linus's tree and should land in the next -rc release.
