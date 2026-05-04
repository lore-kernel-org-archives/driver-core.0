Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7173A4F2D;
	Mon,  4 May 2026 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777890651; cv=none; b=cya8vRsLOzs7rKXsYkOme4xHRTTHVnjDTP7VjWfGLT3o5x6azm6+F2/BsV20/Hg8/A91gyr8TnGtZbdX4PXRfQk22Z7DHX6EjzRw8SBY/BbGWSKj9KJWUDQVp57w3sQFNZep1oRcZXy+kkCU9hQp0wGezoU0CxyRuEP9bQ5cCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777890651; c=relaxed/simple;
	bh=dIpfv5nK0CnkLtz9AB+C1wtrS6WvhVHQ7Mv8bvMbZdY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Bk0hFc14fxcp+BsettZ7SmmpvsLdKhDwBRgkyXdbPOLYsqJgdM1lPAKKdSN9BFSckOZ9xNsWlHBnLNZ/mRkKCh2Y0epAhBYfxSLqtEvkGPmnECu+vrqdMMqGpzHPLYibn9HSa2z4TkUU+g/rEUZI3bEwCJz6iZFIGcdQA+Dav2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7RG/Xf2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7RG/Xf2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18377C2BCFB;
	Mon,  4 May 2026 10:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777890651;
	bh=dIpfv5nK0CnkLtz9AB+C1wtrS6WvhVHQ7Mv8bvMbZdY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=q7RG/Xf29qlaGJ6QMvdsVmOHYj00+ZeDLsVp8z5WkQ+8tBysG+wXr/a2lu+Xw510H
	 imHyXkb6nyARfj0ZnZ5uhayYANvTU8BPX49UF4Jf4bS/ImVgrJKROhBCVpkBwISX9t
	 lgNVOZJYpJDCN4T961mDOBGZfPt+/2jv+b79Cl1X6qexbfFHUWXnyZ5hn3FPWBJ2WL
	 WZoRUIAjZEQ5w++5ZoX2x/sZH+1iIR/g5wNuc3Lxyhi8YsBoUzvvigs9pnda63c/xp
	 KqUk5hgVWG2WtUScTxBPl4z9ab6wCoHcxOqBHiWeePI6MlmOJ1+YtN9eIXMtQJsvzl
	 JiQEkOAAljC3Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 12:30:48 +0200
Message-Id: <DI9TMWIP69JZ.3LTL282WBVCOT@kernel.org>
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in
 dev_has_sync_state()
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, <gregkh@linuxfoundation.org>,
 <saravanak@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260418162221.1121873-1-dakr@kernel.org>
 <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
 <CAPDyKFo9wcxLnCdykwE9J_vevBtjq7UVL4Yq3M=MOZ8M=j6LCA@mail.gmail.com>
In-Reply-To: <CAPDyKFo9wcxLnCdykwE9J_vevBtjq7UVL4Yq3M=MOZ8M=j6LCA@mail.gmail.com>

On Mon May 4, 2026 at 11:49 AM CEST, Ulf Hansson wrote:
> Apologize for the delay. Genpd needs the function [1] when it tries to
> assign a common ->sync_state() callback for its providers.

Can you add a revert of [1] to your patch series, so it gets (re-)exported =
with
a user?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core=
.git/commit/?h=3Ddriver-core-next&id=3D9db268212e0d7c7e3c4aef3494e55afbc169=
5b1f
