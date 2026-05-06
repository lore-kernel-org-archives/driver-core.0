Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC44C165F16;
	Wed,  6 May 2026 23:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110607; cv=none; b=Q4bjERFj0cXP2+MJ7awhw7XG6VWeJBBRUfjMoltfDkbMv8zQ6JCDhp8qYsf4wqCoiELWqXGHC++jCVcdDnKQ4ZyQeVM17xIUTATSiPBGCk4ciw8Ui92Uzopq/hYd7wVlsa2SFdZYckwbEs4KQWst0BKCniMzs8R7+puYaBQaix8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110607; c=relaxed/simple;
	bh=XFAVbGyPQARw8H81CLW/cKoRyts6as4/OCvcUDvq7vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuqHn6fs2bKmIyBAeuKvlmm4l8yIbyxqB2y4z9TaCNndhAg+bIrAwKIkY0pCbmO40G7pW8Sf/OVPr673Pu1tuRRY0jzkXr0sP9pI6Dfo9853hsRWiugAjvQc4lpXwCdNueLyKnWw4g44KfG3a7zn+mBCROWFG03PPeVYvvGSJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwYV1NWG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwYV1NWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66A4C2BCB0;
	Wed,  6 May 2026 23:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778110607;
	bh=XFAVbGyPQARw8H81CLW/cKoRyts6as4/OCvcUDvq7vA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kwYV1NWGFtHb+ZKT029dcj5dcUel0ww71ZfCXoqtlhuTp6ecS0b3xjA+HmApxMoIC
	 oQE1A3UFgZrKyoY9w8TjOtiJGwRMmMSw7tHuc8uqo56Acozqp4GoL7Sr0Z8wcGL2uJ
	 bhBJAjriCn5YKYG6OVIyPiwsYrq1MNArG8BMw0lxrvOpgHfZlr9C8LXfFGhL2Zi1PC
	 Fqs6PLJEL90rtt2hnQPYzeYE5fFdz8J2WTqCelTyssUGR6WzHW1NcMyzBWFWxb/H7q
	 5bNz0kR06teZYs203N3sQdESXpQHdYQF21GUwVLeypRnGlapJnIKhyV6chd3GuiMrN
	 0WE7CLzoJ9SOQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tianfei zhang <tianfei.zhang@intel.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] firmware_loader: fix device reference leak in firmware_upload_register()
Date: Thu,  7 May 2026 01:36:42 +0200
Message-ID: <20260506233642.937159-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505091231.607089-1-lgs201920130244@gmail.com>
References: <20260505091231.607089-1-lgs201920130244@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue,  5 May 2026 17:12:31 +0800, Guangshuo Li wrote:
> [PATCH v3] firmware_loader: fix device reference leak in firmware_upload_register()

Applied, thanks!

  Branch: driver-core-next
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] firmware_loader: fix device reference leak in firmware_upload_register()
      commit: 896df22ee576

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
