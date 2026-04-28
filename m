Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D1935A393;
	Tue, 28 Apr 2026 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777416084; cv=none; b=AGLkyjw+L128XT2Om634Zre8vATbq48RfNOWICft56ODEthL85eksrSJA1EA94EFCC2chOOM0mUkTqLrJp9vq2h/HuuK8bvUuUp0LwBJ8tKhteNkdPzcCzgCy8ytQlLVj5NowWQjj5nOEruXt2u21YzuvP6/5Jb6YAGQBmdtFAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777416084; c=relaxed/simple;
	bh=894KP7uVDQasDSxR7Z4NTlupcvWoaSM9qjYWeIWI2/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=izz2WrXsSIABltMGRzheE1XvstWG2VceZHslLwEelmI3M9F95MN9VjKDKAozXC4HmlY/LWkDvzUFWYXYMCZfnSKaPSEjV6BRfrXJoKyhdWHKk5TN94gJdTwI/arsiGHndsadGI9uYrUTAuyLh0E0JkDM8U+7cgf/TYDI6dTJWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1pgIpMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1pgIpMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4892EC2BCAF;
	Tue, 28 Apr 2026 22:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777416083;
	bh=894KP7uVDQasDSxR7Z4NTlupcvWoaSM9qjYWeIWI2/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1pgIpMSnQWdAJYBjZHCSR0v1+4N97AGM7G95mbGoQoNojIuaspKT6JtPwdKt9x+i
	 j06gv09eYP0yFqA2d4VueDYGl8I++4/np3Zoz1oVG6Kb2P2u2qGT+HWGdnRBIQSoFM
	 tH06RKUkNY/gr0BUOSI05DytkNa1F8GTW2/qr0PPdWsfTaXNPkawU8F8QQkSdjQIvV
	 sLyAUCvr/xvYcQ4UoFWqG7F0T9HtJb2PLYvSXzwJgS5uyz8Y4UTSMFg77YU2dw6zEp
	 eQDS0KJo+A4bjT6W23JEFn9n0M+9xFlmJ18Nx3KmMdmMjOAnSFvoiJIll+IzdZEXUn
	 tmKlhZ6SPPbRg==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: move dev_has_sync_state() to drivers/base/base.h
Date: Wed, 29 Apr 2026 00:41:18 +0200
Message-ID: <20260428224118.2729980-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260420234153.2898532-1-dakr@kernel.org>
References: <20260420234153.2898532-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 21 Apr 2026 01:40:44 +0200, Danilo Krummrich wrote:
> [PATCH] driver core: move dev_has_sync_state() to drivers/base/base.h

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: move dev_has_sync_state() to drivers/base/base.h
      commit: 9db268212e0d

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
