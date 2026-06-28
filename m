Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F33559F8;
	Sun, 28 Jun 2026 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782688309; cv=none; b=GUtDVXEnzOXbAxcprYlRHtQ0dCM5VHdmPQhVzzgX7KTH0cG8rZ5aM5zFRJCCi160/hrf3S0WKaagOmFj1pvLuOlHNQuzEJsx4ZnOXVLLElnvYQpZCYs7T0Wg20w/fTn2ChX0atuNbEV22ce2ISH1hfrztoeqwRwxukm7+j7eVXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782688309; c=relaxed/simple;
	bh=DmXf5Ci1HOPuDy+PYQEDTrmHcR97sSbEYbhT982Ri0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/5PVblPkaV+98Wn4fYdbCLoxm72OQ2whxNLxiFH/nhvbdHTS3SzI70KLvDUZH8GRzjpKqVWIZZ2fq/sBna/Z8NxrxyYdtci0/Fr9Y6g5SxozFZDxO5/tKP2DaboZDChed+CckWezd1xrRDlAokr6olBOHFFKqtYjGIiZL+5OUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nT3Ct5Ql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nT3Ct5Ql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BD51F000E9;
	Sun, 28 Jun 2026 23:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782688308;
	bh=MP8mqO81IIjdZm6OwCnBYs/OoGEgMcq3mDVbFYcfDPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nT3Ct5Ql45PKq1a/KmqS4W+GUZh8Bit6PZHtnMqbxp+lLdkL7uu/zz2YalA8jhiC6
	 +vMqvDKs8GVgrOLS0FijduQ5ipc52tOMwHA5slJjpckeBTV6mJDnQ4NBuOpHN6ZlTn
	 czm5hAnjSNDdUIG1SpMgv5W2sfpSO35bnjeFcWqUlOO5cIEnTqHMmOzFK8ADn8zL+Z
	 22rH6giG4dsAFzN6RZkikDTqCqOYugKKrY7IbJwli09ODXnCuIThmUa+jCSv5U9fSA
	 ApFs7MdzwIjEc/afSyWXW6by22FiYiIbEa3EFkXLXF9teucfNRugwFzkDT6eboWmCB
	 1C+5O3uvo+pPA==
From: Danilo Krummrich <dakr@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	rdunlap@infradead.org
Subject: Re: [PATCH] driver core: fix path of /sys/module in comment
Date: Mon, 29 Jun 2026 01:11:44 +0200
Message-ID: <20260628231144.2702439-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621075239.11330-1-zenghui.yu@linux.dev>
References: <20260621075239.11330-1-zenghui.yu@linux.dev>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 21 Jun 2026 15:52:39 +0800, Zenghui Yu wrote:
> [PATCH] driver core: fix path of /sys/module in comment

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] driver core: fix path of /sys/module in comment
      commit: e7e09a8546a9

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
