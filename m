Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D63E556B;
	Tue, 28 Apr 2026 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371522; cv=none; b=O3heiGt9sCSBNh1/W0p3FacIWp6iH3RAvkuFdNf7ua3iJg/5bOP2x5JwNtfynV0t1Sc5LcVr5sIfeMX640yc3CtLY5EpwjlKQx/4NvWIC8/lAnYsRvBlWGrbb1Q6/LpAqlrUSR7Bsj+xTVmLUazNQmZmBlZzB5stP91q/cbEiSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371522; c=relaxed/simple;
	bh=uHPyZdCkzCI448zeZqMv+wyuQZjfNzjXPtc17YEXI8U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Zz3J130BuP/32b95A+Dvigpb8xkTJZHKq1XfEl/B7R0rtC+fY3A1HgE+AKE6b3huzFjya967ETCL1lUe6zENYGHMXb1sPAMjTjEENOKmewFrQ+0BTEhFbeWflPiiCEMZRCJmlC5RUZkSQ/F8cL/zfcHxvkZ+2ALr9JxAhEX3Wbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahaIUlJh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahaIUlJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B305BC2BCB5;
	Tue, 28 Apr 2026 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777371521;
	bh=uHPyZdCkzCI448zeZqMv+wyuQZjfNzjXPtc17YEXI8U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ahaIUlJhSg632TunX/r/O68Yo4SbmrVt4yior8VLXk69Jba9ibkONUKWZOOfB1zWw
	 g7lXj77kVrRSt9fD/KiW2ddFAFXjjNUIaqfUMW6xQIGGKxz2tef00LA/dZ+edSb/Pr
	 kw/fkvFY6ff6u01bmbSObWtJsMXPQmyWnWXYx7twjW6YKwkYsJnMURdhIkx0pVlG3y
	 sFdExSiuJ5GgR3VM3L4CoB8LHm4d6YDqcUzR3ErHcOdV6GkKK/gSPldPTm/h+p2pwS
	 gqc5J+9EniuR3uZ+DB+9ohQN5ibMQ8YSf+7EwVrzVZ7rkK2cJnj5DGy9yk1S8+EzYJ
	 AwwMdmK2nYdqQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 12:18:36 +0200
Message-Id: <DI4PMAG5RHC7.165W6MJA3R4TQ@kernel.org>
Subject: Re: [PATCH 1/2] rust: auxiliary: add registration data to auxiliary
 devices
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427221002.2143861-1-dakr@kernel.org>
 <20260427221002.2143861-2-dakr@kernel.org>
In-Reply-To: <20260427221002.2143861-2-dakr@kernel.org>

On Tue Apr 28, 2026 at 12:09 AM CEST, Danilo Krummrich wrote:
> +impl<T: Send + 'static> Registration<T> {

+ Sync
