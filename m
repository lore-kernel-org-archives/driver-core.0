Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9268411A04;
	Fri,  7 Aug 2026 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103372; cv=none; b=FtP90fUOWbuOljU3DQuUs61pelE1dntiyGjxu0WjQ+l2mgS1dJTvCCpU2qKW7HYigGENpsGMSKFH6pHu3f/Ri1HZXz43/RkF5KbJiySvg3GQDzcdZYHPAlA7tVorDAKxuRXfH265hZECCOdD8ZExsmRWxhnsB/xg99b3E4xClos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103372; c=relaxed/simple;
	bh=U1F2ObVA2bJc5YqPymc1wZ5iHvFvTa6cRpg3+uThcpk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CkPKA2Bos4pafOrjQIo9QpzXeMQ5KNRigrNx8frbF58zyDdS1b0B7aneE81/okh8LeEcJwC5oMCPBRRsszISf5lxKE7igAu+hBlm5rhV62Lb7hjJ6sCvKCaYnoD/gXT3uayCbedxDIhQX9vJRhqKmVUUAKKrCgvo8opHh4QLWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C02aLkmS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C02aLkmS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3520A1F000E9;
	Fri,  7 Aug 2026 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786103361;
	bh=U1F2ObVA2bJc5YqPymc1wZ5iHvFvTa6cRpg3+uThcpk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=C02aLkmSTkSNWq5jNQaPkO+AmOAd7CHSdlfkWXIVZ4u1Wdhws8eUxsqqrWSqZN2WO
	 MnGUIG/A1V4cVG2dYzhV5OytxfG+Lmf4XoA7V09U9GyBed9ufZwICglq/lcmxRg35U
	 J8eWiEqm0MUhDO3q9aacyEwLyAF3f5Q0fC4qr+caFK8gKTSMMRuMAih7Oe0LnhtwzS
	 0kI3TwcdC/SdbCsyvWVHhk4j57ZQ7yn9SoEakzfHBMIYM6p5xlIFZcw9KRUAQnHDMv
	 1QMK38nwCUukTJKSehqkIs6b5M2Yne7tXrVVo3M7YgQcOckm+PKbjj+X7ZGjycolQM
	 nCIU31KfUCgGQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 13:49:14 +0200
Message-Id: <DKIOSPRHO8V1.286KQFRH751TE@kernel.org>
Subject: Re: [PATCH 6/7] rust: workqueue: add Work::cancel_work_sync()
Cc: <tj@kernel.org>, <jiangshanlai@gmail.com>, <aliceryhl@google.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <daniel.almeida@collabora.com>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260804195248.665636-1-dakr@kernel.org>
 <20260804195248.665636-7-dakr@kernel.org>
 <c5fae595-2407-42cf-8040-384699df537d@nvidia.com>
In-Reply-To: <c5fae595-2407-42cf-8040-384699df537d@nvidia.com>

On Fri Aug 7, 2026 at 3:37 AM CEST, John Hubbard wrote:
> This seems to expose a way for driver writers to leak work items,
> doesn't it?

Yes, I forgot about this for a second; this should be on ScopedWork only (a=
t
least without further effort to make it work properly for Work too).

Since you explicitly mention "driver writers", note that unbounded work
shouldn't really have any (valid) use-cases within drivers. So drivers shou=
ld
either use ScopedQueue or ScopedWork.

It is of course possible to use Work with a ScopedQueue, but at this point =
it is
unnecessary; the requirement is already that the Work must outlive the
ScopedQueue. So using ScopedWork instead saves an otherwise unnecessary
allocation and reference count.

(I also noticed that the run() callback of ScopedWork should pass
&ScopedWork<Self> instead of just &Self, such that self-requeue is easily
possible; I will add this in v2.)
