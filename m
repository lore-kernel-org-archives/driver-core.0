Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EF30C162;
	Sat, 11 Jul 2026 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795660; cv=none; b=Ed8xOyhIcJ88m1PravAtKUUfaqG0yDrisF4zPerTHl3I44Kw9C2etA/7nvNOMINY4hpFcPo+mARMall7hGcCP92WU/fvaV13hE8tbILU7u6GhH/zaxlfiyP9vhlAoUN4npb9LUrVkgQ6g2gQleRGEYy48lk6tTB7meZ7eDMyXK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795660; c=relaxed/simple;
	bh=OnYnbWsmQgxU8IicbbL97shFaOciAzsbnlmYeExUv4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a1/v05KDUCDsYDHY5y9nc29iRqMJKPSN0hN0tL5fzy3e7quA2CzZGSP4iJeF6qFFiCStNp/My0EAYIzKFuXrFk0VycbkJxznRRVMicfU1WyAV9vFQ0yPRqMkRd11E414qJof3BMvCeqr6kLQpO+OnHMOL6jGKDIVSU7jt3cr9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbyjC1w4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbyjC1w4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBC11F00A3A;
	Sat, 11 Jul 2026 18:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783795659;
	bh=DkOXzlor8Qo9slEpnI81iFrbNyUeVkVf4+a5zhq/mFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fbyjC1w4EcldrCcAHHr/kYEFIbd9ho7yNiFlE81uUfexwZWhEusLNiMtEpOA1/cHg
	 e5TqTLjSzYAqKWvFRC+WrwSvmnKJceHe8WbK1TfVYRmTxFsukT/EHDGxTo3+yIHvd2
	 X/rGVAvCwx4tulrshpFGN/D2ISCwmxpSvKKnZmQDiTJKutQEc9GoVIUYkkULPoDgEm
	 hd0BGXOij3307e2iaBnrzXtWrPLY3pJSSo19pR4202bYaJDrvHjf3a8v8BMSxeh735
	 Rfxa90tqF5jgUm3K1RexT+3wvOEF7hEtJsH4l7UDGVAPvUgLRh/IMpHnqfp34rEu4I
	 MveYdhfWAWDWg==
From: Danilo Krummrich <dakr@kernel.org>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] kobject: Allow the constification of kobject attributes
Date: Sat, 11 Jul 2026 20:47:34 +0200
Message-ID: <20260711184734.576567-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
References: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 07 Jul 2026 18:56:31 +0200, Thomas Weißschuh wrote:
> [PATCH v2 0/4] kobject: Allow the constification of kobject attributes

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/4] kobject: Provide macros to initialize 'struct kobj_attribute'
      commit: 418a74d106ef
[2/4] samples/kobject: Switch to the new __KOBJ_ATTR() macro
      commit: a3a9c7453fd5
[3/4] kobject: Allow the constification of kobject attributes
      commit: ed96337a5bae
[4/4] samples/kobject: Constify kobject attributes
      commit: 584afc86a1d4

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
