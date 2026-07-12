Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A3222083;
	Sun, 12 Jul 2026 00:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783816201; cv=none; b=ioRuT3xoEZICC3reCL8u6tCaj2nXfsnGiSuRmK5Jb5lIAxw3kwkg+CLZ0z9YkXusvE9YSUvRxoo8Xi/F3FSrXQVs4Qgcm6c1E8aIz3tY7Y2zNsdifsj8L3CpmDuEv5gvZi+1xxiR0dqptjKQhFLvVWWdsAmLpiDQCxAu66AxGtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783816201; c=relaxed/simple;
	bh=R/8bHJU0K6l5Pmfvcx4vBa91J4Vw3e+jXc4U7+MYuY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dalsWTd3FhI3J/7B966QE1LKxd7mfjUjYaomLaIg4hlmDHoPW0v8Y+9jvi0XPJKLrxTjH47fb5fKLHKmyq6wphCBxaFVYijVCV30ryEKx46R6aP1ex8WkL89OgE2oMU2Jkrg0Z6STXlMzFrO2kQXDXmD2uzyTBuxx/84S9wfHw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/mw8SRr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/mw8SRr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B871F000E9;
	Sun, 12 Jul 2026 00:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783816200;
	bh=p+nzMPJIGtDi3AbPcBeXcFEjb5KIKDujiUZ556c0+7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k/mw8SRrKW4EjQn/bRiQKD06UHw/slK+WIKZm8729kS6z5hAGdNXhepJww0j5C6TP
	 iAw5YrRBZq0dMfYR6Jv68A8mCFLQvV4dyxpq01GxACC1aKJjhsHWC0Prx9WPBoi9sX
	 0WzwQ1pW+h9ydr4GMBmVugH0c9AJeHSKmY1eCngVfbKqnYeQrQHjcFg/oRcgHoKykB
	 XyKwzjTszKGGUJssyoJVsM9r7y+Y5h/clAB9MgtnOHO39oPc9QL8A3aA1pb1uUWh6T
	 BNL2m6he+zrdBBUM7htJCmpvFIxqVe4EjcB/EeueOo8S7bRj4ZRH3uGZdlgPVmi178
	 39Pw9I+sVwZMw==
From: Danilo Krummrich <dakr@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware
Date: Sun, 12 Jul 2026 02:29:56 +0200
Message-ID: <20260712002956.772581-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
References: <20260426043041.649202-1-dmitry.torokhov@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 25 Apr 2026 21:30:38 -0700, Dmitry Torokhov wrote:
> [PATCH 1/2] firmware_loader: builtin: ignore 0-size firmware

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[2/2] firmware_loader: builtin: fail build on empty firmware
      commit: 1160c2208fab

      [ Use 'exit 1' to properly fail the build. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
