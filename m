Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B423DD528;
	Mon, 27 Jul 2026 20:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184710; cv=none; b=VpsXcnLYILc1wzUN/7gBuRqWvBZ3JJeGEGVZcjJwD4kojhNTaub3I8LboB9vxqMbpuXGYSn3XVN7ezVNpySG4A8BdG+vQKpc9HOmKSDYzaXlzzZkoJDmVn0u6pTth12Or4vFNmuCxdVM9cQh3NK/pTaazadlmrBu5TywmL4Xagc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184710; c=relaxed/simple;
	bh=J6kpKucTPJls3KIv9cmkb5XFFuQuRbXnP/koQovhLLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+FQSse3fVeGVPJfR5HJ4E+9AYKW31hr4YKtVnYvebTjAw+wWEbJG0POm7t8BAbSE8XgDP1Hm+kor89ZnmAW8eF0408cT7KUzY0GER5pnGMBskEoshgNpp0m4b6cl1Q1zb90jKxRjb5HVfvV2jKEmFNzZHzbzU5scUnJYkYxJRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVJnPvim; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVJnPvim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3E41F000E9;
	Mon, 27 Jul 2026 20:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785184708;
	bh=JtaPMrfbKaN822jr5+QMPprC5cstfuxnBDZV9ae0WKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VVJnPvim4+z/5KfLroZ5EI7zgdEyWrEArfgo2+bpnCMgicT9gYyb8uixL6vhimJd6
	 oLYnwFZYap0c9ZjLrXxoUZI2L4S6LFm5S2EJ2g597PLW90zI6WHz1Y2syT9PPl5tDt
	 ZfB5GxEkcDA/ivfakBdV/KYziqfhmLppFYeifTqXgQztIX7GWIfS9Z4qxZr7yQqPnF
	 mzIOYNTdx7aeJNX6CrD5we9+xAmyxVzlxrH+RMOn3/Hnn81207UXQ0JD6ayt+VFNdU
	 OZxmdKLzUv25UHFcP4rWU7r7inzZ2WhCbTge9I5K028hWuOT5qib4EkjMRq1SKWrNc
	 uz0diS2Jlsv+A==
From: Danilo Krummrich <dakr@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] base: soc: fixup sys_soc.h kernel-doc warnings
Date: Mon, 27 Jul 2026 22:38:25 +0200
Message-ID: <20260727203825.2274950-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723214118.652616-1-rdunlap@infradead.org>
References: <20260723214118.652616-1-rdunlap@infradead.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 23 Jul 2026 14:41:18 -0700, Randy Dunlap wrote:
> [PATCH] base: soc: fixup sys_soc.h kernel-doc warnings

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] base: soc: fixup sys_soc.h kernel-doc warnings
      commit: 1c2c8484b9de

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
