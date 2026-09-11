Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FC945DF45;
	Fri, 11 Sep 2026 21:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161609; cv=none; b=db49TqpwS1kICTfklO/A8W9g0jtV1Gpjdi6ZexQzFy9cyG20bdacuzDV0Al0KWog3JBApBNl2vbKQyaR0KK+RKH90a1Z8cXFFLYTk5m943t/PSkwmNzCjVFGyH9zTyZEjjbxOyUmkbVDcizLlIbUb0BR9c9PrsI6lK1KLoMc5Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161609; c=relaxed/simple;
	bh=lxs7Y8a3eV9m5CAMc+3Qaxg3o8XbNYsx2bz5z5MwpZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvMJ73YLintFb0zzzjV2DcR03YPHFxp5JeC7cwUhOzOTTNWBTzEjQxpF44PDLXwd0JSekxPN+eZGc8rViq4TA8LGgCYK4CfiCjhPA6PX2I4+Z/FDA2E7c2AUMI6VD+MmFGhue8riHcEQ8xe2nFB5aIEEq3KHJZi41dSqbpJPCwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K454jKYl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K454jKYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286F11F000FF;
	Fri, 11 Sep 2026 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161608;
	bh=3yKil3U+JdBDXxsdEY5x6vIdTsd2VMxvj1/lrtEdUEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K454jKYl287ImjAB2Ux7qNUb8PoI+HDwzc+Ua9T7DIButuZ4glDFtaWmCN3hvDiAw
	 FNgKSv8GOTA02O0FO4GYgFOPEgQsprzX4EfmqBShuCMZ9W7ENsPZeVOZbN1zmg1OO5
	 mOWnb5M1Xb25NN0m0WEj0IQdRv9hm3GE0AccBRRKoI7VRyg/GAhW6giw9djI7j2gJa
	 5/XEL+sKT0FNX4exdzidQPjcKdsURoB5vhwwa86zH29VW1jIuWzXQMHODwjJ1jB1hk
	 Sn0UfNHGouZcg2rm4iGTpkdwCSVlwZAesmzFQpQHC36H2hwzufHDHZkYXeGSfe5OGV
	 7RDheEsmQCUrw==
From: Danilo Krummrich <dakr@kernel.org>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	Yohei Kojima <yk@y-koj.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: don't warn about uninitialized debugfs for an error parent
Date: Fri, 11 Sep 2026 23:20:03 +0200
Message-ID: <20260911212003.1581033-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903115135.63210-1-mikhail.v.gavrilov@gmail.com>
References: <20260903115135.63210-1-mikhail.v.gavrilov@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  3 Sep 2026 16:51:35 +0500, Mikhail Gavrilov wrote:
> [PATCH] debugfs: don't warn about uninitialized debugfs for an error parent

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] debugfs: don't warn about uninitialized debugfs for an error parent
      commit: 77be3641f3e3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
