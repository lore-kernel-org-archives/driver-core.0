Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61258242D62;
	Mon,  4 May 2026 20:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777925036; cv=none; b=AAz2pqzdYMyFjwa2HVQwNmlv3ry/p8TMBSKNWsc/5z7+vlzAHohqJ8R1QDq0UpQJsp0Li6cVkbLrk1jRmFOkt2kcJd6nppQl0jlXhn1lBxwo3lRYzT0F9QnkbtYwGvd0e3+1Z0EtpmnCqAk4NA48QqM4XwTwUuFDXHg/q5BBSO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777925036; c=relaxed/simple;
	bh=z0uVJt3+9OUqi/+lCaBkIBazGvK8yY1Ag/AQ6SorCzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbScIbuVyuNUjIBhgCEcEU8vyJKIs1mEw+ZfLgx/O16fVwCpHqxsA8qp7osZHR3WYW9cPGct2kecW9I9JULvKbGKcrfBrJVt1IHTyay2DVOMwnQ562RlBY+5TksdFKxqqXzlN5At9EsSsiN4EGbGnvNdDQBo/Ytlz+0kcjPQXKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKXueyp5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKXueyp5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467ACC2BCB8;
	Mon,  4 May 2026 20:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777925035;
	bh=z0uVJt3+9OUqi/+lCaBkIBazGvK8yY1Ag/AQ6SorCzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CKXueyp5L89obt4hSInOL85xgo0O7soTCKzUSAnFghdUDmVlF2uEJe7A3akC/BGdO
	 us2zFc2ZfTyshCgU87UqPBCVm2uV5l8mCb3KWnnkGrf4V9M3s6bHJce/mj030kL0Mo
	 gXwNQoG8idnYyqhkdR6UA1TZ6hVhKgpP1+BlA+Slt0YRW2E34WItCWU27UC/lEIrwJ
	 lmYp0L3UrnM/OU9OXllyszTqrDXM8c/BuneL5FRIl8T4qLVgTFRCvHrEBjCnmQ2sxE
	 unA9hLcJ38nyjhGxGfIllOeB0qvd8JGCotNBBXhVY/EdaNJ2q3QlDrVfeQUu0oce5k
	 Rs6SOCq8dAqfg==
From: Danilo Krummrich <dakr@kernel.org>
To: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org
Subject: Re: [PATCH] driver core: class: fix typo in struct class documentation
Date: Mon,  4 May 2026 22:03:50 +0200
Message-ID: <20260504200350.2818974-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503141826.27462-1-prabhudasuvatala@gmail.com>
References: <20260503141826.27462-1-prabhudasuvatala@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun,  3 May 2026 19:48:26 +0530, Prabhudasu Vatala wrote:
> [PATCH] driver core: class: fix typo in struct class documentation

Applied, thanks!

  Branch: driver-core-next
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: class: fix typo in struct class documentation
      commit: 627e28455578

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
