Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D124C81;
	Mon,  6 Jul 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335034; cv=none; b=LMC5DEnqK7g5rWeJEGBX+o7qIh0FSyL4LDdTqEI220KqgyT3shWTMwyiXNosnKF9RLDbC5wh/dpTJpXf6Zni3mtXz6MsIhYtkYqmdrzyqhOFXFHMGGPfFh6Y5ShWJX9n0HH8pKFDAS6UjH+xBiLU9Qy9UJ5Uj0VZGOGhkENQK1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335034; c=relaxed/simple;
	bh=kLIyhELqxm4iU9Ghme1DZaNMQcbKQbYTWzMaqovhY5E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fhSarxCRTcwCviB/aXuiXeo48vMqDXQZtkh+SB7zYUrGCZfp38zO4eyVrDQVPNl25j6FZmzhcJFDnYeZub7rI7J/J9rTkOA0W98PTPDmw1pC63p2UzphjKiiSEM0/AiO8570csueDY+Q7RX89wGVxukqzeCCyZICqRknyW8HDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSBoAXCd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSBoAXCd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084001F000E9;
	Mon,  6 Jul 2026 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783335033;
	bh=kLIyhELqxm4iU9Ghme1DZaNMQcbKQbYTWzMaqovhY5E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QSBoAXCdmTd3wl5iJRArYtK10kVSmuKew53+tWCCBxBHkXgGZKFRfxgrqcsJvP1WZ
	 RsFwCiOEhtpPAKnMdr921aFyPxUY4PgVqA4u0nDZXkk1wmGwpyWJ1YeJgKiSCiituj
	 ev6jqce2q5JoM6x/Nd7W6s/efelqqBl3YCPqh9f6mhLulLRgkZ3XeaoPsW3AiengG3
	 kQtFq43pwiRzlPtLkscqQQI+/5gkJnW1Qf3ZqfN8ESCznRq6xqA03JwyFNann9nzmz
	 MSTa7xNtVWr1i1+9oRi5JRhBAsSdQ0W48KRk2s8gn/AZOtM/nLZqvQjULKWKga++NX
	 B1ViruoAbLviQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:50:29 +0200
Message-Id: <DJRFIANMW0AM.2LAQJ114NJQYH@kernel.org>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Cc: "Timur Tabi" <ttabi@nvidia.com>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-2-ttabi@nvidia.com>
 <DJR9ZKFB5WQQ.1CGI0N3GS1SFM@nvidia.com>
In-Reply-To: <DJR9ZKFB5WQQ.1CGI0N3GS1SFM@nvidia.com>

On Mon Jul 6, 2026 at 8:30 AM CEST, Alexandre Courbot wrote:
> Sashiko is correct to point out that this doesn't return the number of
> bytes actually written into `buf`. We might not use that information in
> nova-core, but this is a kernel-wide API.

Returning the size only doesn't carry a lot of value, please see [1].

> Returning a `Result<&[u8]>` would take care of this and cover the
> general use-case nicely.

I'm fine with either this or just Result, as we don't have a user for the
former.

[1] https://lore.kernel.org/nova-gpu/DJ6JV2QQY0QD.1ZK1PRRBN5BRP@kernel.org/
