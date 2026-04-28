Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6562ECD3A;
	Tue, 28 Apr 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777415913; cv=none; b=a1PA72a46PW6dOabeIV2OriLV93B/a58FmHgRLCBM7wxPdYxreTo9uR8bcPGfACzPViMbotKBTL18rEuMIH+3pLenu3UoL3j5v5f4NsNgiqv7RGMukkq1g/4NBbiS0JEp+52miyYi3AuGQMRHxBcTQseHKB95bG4GLsvelPnEWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777415913; c=relaxed/simple;
	bh=bNfDr8iSLh5e0YNKj2qMvxEGn4w9HtP7G7v01gDIP/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l2XZoSI8Ulq98/xsquwPyC2SCW3Fz9Fyd+e12gbLKK/9Co7fGlR86Je938MYrjBfld52Hjy+zSrRoExbyfCoA5IpeNim1BUaeEfr4cBa/8QouhrKBY4Xmc7lhl37RnYsavYWTedd1FX7STpLZSgvN8iVKuBCzSl1QdKoY1vLAmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gk/gNzQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gk/gNzQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7172C2BCB7;
	Tue, 28 Apr 2026 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777415913;
	bh=bNfDr8iSLh5e0YNKj2qMvxEGn4w9HtP7G7v01gDIP/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gk/gNzQB4AsDHWU2kLbTImy/tG7FjkZ0SxbEtLmf6SVWOjmnXpvfu+1THc3CQPjzI
	 vnairQHbKS/7zrZsUhv4O2pSl+akpaABATPLL7vwhYZpmm/X0d2qab/7Eiu+nhkuGI
	 XlC9997uQ0WXgYsytW8C6Ph1Nduh2NZFYSeQj1jSkyJFtU4MdSKLJfUWJZYjiT8l2L
	 NGIYDlQ+lQss7ElnOomDi5oigWCc4LoLexAv83QojPD5caplvwvX8CjOWusEYzEWr+
	 9aykeli3pFr0SaiBfT0zF7O5DdJeo+BqLeAokOz2CDqNRXMvhMdukYq1km3DZO/zCb
	 WJh1Igi+D2KQA==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	saravanak@kernel.org,
	ulf.hansson@linaro.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
Date: Wed, 29 Apr 2026 00:38:28 +0200
Message-ID: <20260428223828.2713705-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260418162221.1121873-1-dakr@kernel.org>
References: <20260418162221.1121873-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 18 Apr 2026 18:22:18 +0200, Danilo Krummrich wrote:
> [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
      commit: e9506871a8ea

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
