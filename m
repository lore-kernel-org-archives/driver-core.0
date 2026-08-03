Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B8340A52;
	Mon,  3 Aug 2026 21:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792183; cv=none; b=HqArFWLfS9qy3FwH9PbQkmTxd899bCE9KhYp27Ei8pRoyDhfnEcD+xJJJFKfUkRtcrub2o0IO01YkHOYXEJrCGzssAkJOcqChMcVDlsrSlYYhUr1xh9YTItSDEKjxu65e+48iiFFbzp2B8snkXlL3+pfmE3juJQrsw0KV31t8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792183; c=relaxed/simple;
	bh=91QnTcVnCcXeJN1gn/94qG/nj9QI4OVayfvGMpBpMu8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=P+P7Tjivk7+8XD/C6jp+RVzMsQvMTVvut0xCKD08IfTonWS3bo97N3u8MPz9FfspLLxnZi0sd+QsNgb/oTWsYAZA+jtQrjam5Si+Yzrtx6IRIKUZ/eKoxEHWKeSzwJHswttjYfGbgNgkHq3EpRWgK9zcDpYzUdkmtfbyed10DTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6eiwpOX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6eiwpOX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12731F000E9;
	Mon,  3 Aug 2026 21:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785792182;
	bh=91QnTcVnCcXeJN1gn/94qG/nj9QI4OVayfvGMpBpMu8=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=M6eiwpOX8eA76O5pbgKffTgrMc5ywa7x06cvxSlbJTg3P7gOIlmN84jvox2NAMELw
	 a826Po2toxSRju04uKWBACRPvoJfMn1O3B+4NGBYqXOdyPRwOoPurL8AbbmKfZmEwc
	 bwTeBMcmEAdDOOqPQ+lzHfzz7EgVuN7zG5d/HuCbaNfEv6NPU2psTIUUnVnUrJBWuF
	 D7P+OiDLQxadyqXSGl5j9Qbyd7b07S1qu03NEJ9hTTkNhBGl6rU2OAbUHr3jLWaUvP
	 hKVRuJQGlth0tNmD0y3YxxOzEci2zjZHcIk7r2iTyyiXtAX/X06YPPHE5l/QsP/zHX
	 Bw9ljq6e5YSEg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 23:22:58 +0200
Message-Id: <DKFMHT3EVE5A.32YX8D9Q0XMJ4@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Gary Guo"
 <gary@garyguo.net>, "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 1/8] rust: alloc: add Vec::zeroed method
References: <20260731201017.2580713-1-ttabi@nvidia.com>
 <20260731201017.2580713-2-ttabi@nvidia.com>
In-Reply-To: <20260731201017.2580713-2-ttabi@nvidia.com>

On Fri Jul 31, 2026 at 10:10 PM CEST, Timur Tabi wrote:
> Add a constructor for kernel Vec that allocates a vector of a given lengt=
h
> with all elements zero-initialized. Memory is allocated with the __GFP_ZE=
RO
> flag, matching the existing KBox::zeroed() pattern.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Since I provided the code for this patch:

Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
