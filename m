Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878042DAFA8;
	Fri, 23 Jan 2026 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170705; cv=none; b=H7FW1piZgmFAre9Mkf+vkQAwVHcBojeKDY5m6y2yHTlyuNmIrlOfuKTHxZSDdkGNdPrq3UZTnrAj69KPvtkTgJxauLxwuPubEAqA0ugFevUefCM0w9u/uOvkSS+eRN22lyKM+3bswEJ6MvFDoU1qkp095yf0sAhGiyuJQDf9SU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170705; c=relaxed/simple;
	bh=0zssdsDWSLDfjn9qL8LcYXVN0R1cWtiU3CrhFBRmXas=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=FfyMQ91yGALdE9dgYBPMaarncUo35G9CVvnIYOAhpNTm/0ULlwb0EGnHs3J6oZ+Eyz/LwBHTuOLGIzjvSoCzNz4UvXjFFyGA4Az2PkjcKE9G6YwdhLwkmSNKZA+ty0fEoELqniFfJq5xXniKHF/QKB6eiCUhUIDe7gltYgy6mvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHapZ76Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHapZ76Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3708C4CEF1;
	Fri, 23 Jan 2026 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769170701;
	bh=0zssdsDWSLDfjn9qL8LcYXVN0R1cWtiU3CrhFBRmXas=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=aHapZ76QTLkZG5ctAOtSQ7w/gi0XPvAeRMk6XizQUu+1kO7kprhL2e6jiUtVTLssv
	 v53NABCFkkpbMr1u1XQ/Se4kHQs3CqERFRWmKIa4A9FoVCm3qk0jq9ADcnpCpLCwQX
	 gQS96o4G97ZRhDacy4Y6tHpXmidiYOBHVPX5IEyyVadX3plzMxmjqyhepFZqHyLZps
	 TgiIOpgCEt0sDiVKlevJfft9XX/nmZ6iS2b3aJfAF/+T8kkC4YZjphmoupDkB7sw6r
	 KHoMkzaJm5nblQpnwpaBKzi2js6GMKTeYoyAio9cZNu4ee1xEHtwJwklRhFiu3cotm
	 2nBZ0PbG3YjcQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 13:18:16 +0100
Message-Id: <DFVYO5SPRVRK.WS82HNO2ACO4@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <abdiel.janulgue@gmail.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <russ.weight@linux.dev>, <mcgrof@kernel.org>,
 <tj@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Add driver-core mailing list
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
References: <20260120123925.28267-1-dakr@kernel.org>
In-Reply-To: <20260120123925.28267-1-dakr@kernel.org>

On Tue Jan 20, 2026 at 1:38 PM CET, Danilo Krummrich wrote:
> Add the driver-core mailing list for all entries maintained under the
> driver-core tree.
>
> If existent, replace linux-kernel and rust-for-linux list entries, as
> they're automatically picked up by scripts/get_maintainer.pl.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!
