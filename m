Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85CA30594E;
	Sat, 15 Aug 2026 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786828619; cv=none; b=jKwa0Z4f95I6SRvDDCM1FPErrBxDJPpUKCnEUetbKNWunWpyH5gz0fdDGuC4ZWa4YHcNuApn44YM5iaJOXwfpw2UScCkWRlE7Zri9dgzKMhKuu/aSA8vhW3BgoulgKz1vgA3ANKjTtob62MjVW07LT9zSnU+FlaTJTJfNTkG2GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786828619; c=relaxed/simple;
	bh=xLoC0w3+IrEYemjqzW2P+y6AbEhn8khZMCmuwD89G30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZPJdV7enjjEVjknfzweXlGrGCOwmDPGtvKLlowof0Oki0uFl2EI2pp5VfRk+LlIvJngbJe114+pOBr2cG0nJhh2XMiVPTxeh7n2dag200wOYYVRwMP2UO8nv3OZttnzMdRi21FtP+N2RjPUFqudWkUNOlFh0mNyGSM0U6GT99AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZDcts1pU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDcts1pU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E651F000E9;
	Sat, 15 Aug 2026 21:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786828618;
	bh=irdcSiioFKVhsMGCKFGPV8EKiBsTR4yL76UfjmY+uHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZDcts1pUwYGCoujWn8jNAOuMC+vgR+Fn2dOv7uVqNhx105vns13H4Dc0URLco+CW8
	 WYdMi1pNHTUsL4AkEbtJDtenMhgEYIl7QB8dsotns4Tm9y3LYawIwtzimecbk1zKeR
	 3dN3bN0h321z9y5KSJlmNemmgwB/eix0oQn+v2099UQSC8Le/3fISY7hiM0+f4r0Is
	 CBZlI98GIXdN8UzBn+XqQ/6KlFY7WaoSJHDbr6QHhfee4EhF3IWpiUVhowE3DeAaTG
	 IgcQbiYw9IM0EAw0blunQilF2amPiwgfMDQJdwsVG31qaHlxe5nrMC2xYJEd86U9yI
	 HOnzUWXvw4MMg==
From: Danilo Krummrich <dakr@kernel.org>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: gregkh@linuxfoundation.org,
	tj@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernfs: avoid iattr allocation in listxattr
Date: Sat, 15 Aug 2026 23:16:55 +0200
Message-ID: <20260815211655.1392205-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731120554.630147-1-chenyichong@uniontech.com>
References: <20260731120554.630147-1-chenyichong@uniontech.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 31 Jul 2026 20:05:54 +0800, Yichong Chen wrote:
> [PATCH] kernfs: avoid iattr allocation in listxattr

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] kernfs: avoid iattr allocation in listxattr
      commit: d5e81a5650b5

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
