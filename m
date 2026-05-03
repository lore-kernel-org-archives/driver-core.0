Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783337D108;
	Sun,  3 May 2026 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823420; cv=none; b=X9jBCxUmb8zguXyaXfyvN5kue6yzWvFot4lAxZMZzYuIjikpIJSe3GK096O5uWdOt16KJrcASlzycFAGwHX2ueIQ03hFWoMbJC7zBiKFb3KuVvF+limBd3o665El3EN/5KsOp4xf35hamgj7KUCUd0XZC3FvUHd0Rcs5Pr2b0EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823420; c=relaxed/simple;
	bh=C7OB9Jq+EWkSrUBdaMbaM9bKXUpW4EOac0oQ9LTCep4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sTEXvSkzp/ldFctcSY7wPGIXTTjQnXVe9Y7+Ek6RJ/LpTA3dgs79rbfvvxKTV4pEcoYDQ3aNdsewNhe1AZEFvGqRodS56iLw9YSL8Jq6+ttP6sfez9fsDf4qGeqp5NP+LgpuOaPzeI7NtjPSsxlNIcQpta13ird9YjNPxJ51tbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=risga1NZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="risga1NZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E354C2BCB4;
	Sun,  3 May 2026 15:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777823420;
	bh=C7OB9Jq+EWkSrUBdaMbaM9bKXUpW4EOac0oQ9LTCep4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=risga1NZyK0D415f4CCzKtKeUsll30AotnLdOf+n+7LorpOBULLetUGwaJ++H6H/a
	 5bYpg3xdp3gjkr0MdSFM9aFrdb971fSz0VqW8gw0E5F+83z9/xeKf8YKb8hctfbR6t
	 pXkPW8yAYEqsKrrzCqnszyuap45MnX1SSuXK8SHpoGy4SSGTx4Vdqa5PaqdGU4LeJB
	 0T65OUsTdTbuKKFRdjWsEtg6A0r3/3gLPZF3zBfEAZzCxb0RLFlkPMHY/m0bP4tJiV
	 MuA5CkiUGq3fgbKU4ipnq/5nZhFpA25k+z6uACzsmSPxqPn15ra95O/RcfynkddQaZ
	 Ruf+eGu0pGcyg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 03 May 2026 17:50:17 +0200
Message-Id: <DI95SZ1X7Q2U.DG2BN03FERO9@kernel.org>
Subject: Re: [PATCH] isa: switch to dynamic root device
Cc: "Johan Hovold" <johan@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "William Breathitt Gray" <wbg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260424102400.2615677-1-johan@kernel.org>
 <20260503050801.427989-1-wbg@kernel.org>
In-Reply-To: <20260503050801.427989-1-wbg@kernel.org>

On Sun May 3, 2026 at 7:08 AM CEST, William Breathitt Gray wrote:
> Would you resend with a Fixes tag

Devices should generally be allocated dynamically for various reasons (e.g.=
 I
recently had a case where adding a dynamic lock class key to struct device =
for
debugging purposes caused warnings for all the static devices).

While it clearly should be improved, I don't think this causes a bug in the=
 ISA
code -- there is no "real" leak as the device is static anyway and there's =
no
spurious WARN() as release() is never hit, since ISA is always built-in.

I'd assume this is why Johan did not add it in the first place.

That said, if you mean to add a Fixes: tag anyway to indicate the technical=
ly
wrong usage pattern of struct device, that seems reasonable to me.
