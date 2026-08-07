Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC76472777;
	Fri,  7 Aug 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103510; cv=none; b=M8AL/BEgCYNsDj7acf+G63ZQDB4amrxcXBgjF1o9CNY9QCzlrhTlZ7x7/kd46iYsWCCeTa5BVn4CgOvE4C6vmB54vb0LkkWMnGBr2LodxLHaqwN9a1W2dzEvHR0Si8Ct/RJdTjJDL3jEaPqwjhE12HsZvmnXCnEoed1fcxi+YE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103510; c=relaxed/simple;
	bh=K+1q8qW0waVXZ05MRsqhjARrzUMgH/P0qodILad7qbg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Nu1AnqZclBSLWtcptnfExpbXxSBCLx7xTsDMeotOVbmEhElz+YSoRRamnkn2xHWIR6EbFbtKdaA8gpz0PotbWQmn7JcPAYtNueCwWcOAY3ky/+Q1j2yk3gkA7dX2RNFirq9zCBr/QJoOX6sLQAwxVgE/kEVpRO7PPPY7Nmu39tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/zXjtra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/zXjtra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B101F000E9;
	Fri,  7 Aug 2026 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786103499;
	bh=K+1q8qW0waVXZ05MRsqhjARrzUMgH/P0qodILad7qbg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Z/zXjtraqEfogZGkz/lWDBkp2FpphDy+JH7KlNkmZ9yY9zFxTK9SKw97b+Q3hE+Dv
	 a1PLVntlte4A2WVp0MBYJ/8ZQSuuE4oMVfR6GW34soTRfOftq9z2i0n718bTWbqLEz
	 aWJIfDrlNOGjfPVwrBeqWdfi5cOCOPa8R2xOCr0vobwJ3pcTEfaw7iDg/8AcIWiYiu
	 XHd34Vha15ltRt9uKwg06GxmawUDEvnAm6BHvQLDp7U/r7eO+AwOAy9drApcp1t8SF
	 /GDavOnchL44o6qx1A9+rAS9/tiDGW8z3ZpoNE5s4ZGWA8rNgi18kHxgKYfK/CN6Hq
	 23hPohUECKVdg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 13:51:33 +0200
Message-Id: <DKIOUHFXA1F7.2LO5DQA5XGBNG@kernel.org>
Subject: Re: [PATCH 6/7] rust: workqueue: add Work::cancel_work_sync()
Cc: <tj@kernel.org>, <jiangshanlai@gmail.com>, <aliceryhl@google.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <daniel.almeida@collabora.com>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260804195248.665636-1-dakr@kernel.org>
 <20260804195248.665636-7-dakr@kernel.org>
 <20260807075141.9294-1-work@onurozkan.dev>
In-Reply-To: <20260807075141.9294-1-work@onurozkan.dev>

On Fri Aug 7, 2026 at 9:51 AM CEST, Onur =C3=96zkan wrote:
> Perhaps you could pull the exiting effort for `cancel_sync` support [1] w=
hich
> is also used by the tyr reset implementation [2]?

Please also see my reply to John [3].

I think for your implementation in Tyr you should just use ScopedWork, whic=
h
should simplify the implementation significantly.

cancel_sync() for Work could be useful regardless, but it seems to be an
orthogonal effort that requires a separate use-case, so I rather not includ=
e it
in this series.

> [1]: https://lore.kernel.org/all/20260617131731.145337-2-work@onurozkan.d=
ev
> [2]: https://lore.kernel.org/all/20260708114358.957305-1-work@onurozkan.d=
ev

[3] https://lore.kernel.org/all/DKIOSPRHO8V1.286KQFRH751TE@kernel.org/
