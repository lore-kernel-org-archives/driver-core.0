Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B388334C32;
	Fri,  6 Feb 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770374632; cv=none; b=sSpjKKAW5zW4iJmZG1MfpWW0fNiXGQ7HYzvMABPkLWhZD1haY76eucS6HkauepyoXLK47hiQmFsOl4xosa2wX33UjsQmHAFVjwNBJrr6kB/lXUfmmyWAwkhGEwyEzolIHdDL5Tpkao0YTCZDgyR+5oFH6ejA/ajXpi/OTcTwLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770374632; c=relaxed/simple;
	bh=tWWvKaavEsJgihHShddt3StHJA5GQEr8QXDTnqb4YuQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IpqfB+MqEdnhHjywH8j1EsueewqcjS2xujdf/xvPnmL3QQ2IYlcBwG3ARbJo0P4kUtm6qnjz/9O4u3T3gFpuKmZJWP0VIfcM71VNNSeESIvAHtlkzZeGL9575m3Q3diZV4JsY8kGr6+QO+QsyMBErrTbvvh28dxse5k/AmZPwZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USzxqkkp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USzxqkkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6990C19421;
	Fri,  6 Feb 2026 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770374632;
	bh=tWWvKaavEsJgihHShddt3StHJA5GQEr8QXDTnqb4YuQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=USzxqkkpWEHOY7nuP9dQwnwlQ8GoFGxvVflVt57C/WeVCtEZJos9cHO1ceC3su3vz
	 NWqC0tuaF1SfeW0jZZjpFIQ+NjAh/Ve7QJI+xLGygE/tm+3N25J0Qvnv0dkYt48GNr
	 pdZJdChTCvKFcB840wrXIpBLrHHABhJ9O8npquO3sGTQCijrAjBX4UzdT2SbWAEe9m
	 tYUWSTorw7XtF85cclCcgNnrpai+1yA7I3h/8wSXHB7kVOA9yGW8DXqMEGtsQtLD6X
	 CvsXYx/5Xoa1I5S6E3eney2Fk7o2CKUAuv8nlzTsV4Rk6EzESIS7hMDK6GDSajXRj+
	 oloU25aRfUdEg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 11:43:48 +0100
Message-Id: <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
In-Reply-To: <20260205224706.91996-4-dakr@kernel.org>

On Thu Feb 5, 2026 at 11:31 PM CET, Danilo Krummrich wrote:
> +EXPORT_SYMBOL_GPL(devres_node_init);

I actually intended to use a Rust helper instead of exporting those symbols
directly, but forgot to do it eventually.
