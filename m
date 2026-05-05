Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55C83D811B;
	Tue,  5 May 2026 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011495; cv=none; b=X1HKxziyke6DTr4oz5uu+SK/bvKPpiLi7Q1pqA7UOBOoE+8Pry+BUwKcgEcStFxrjkNxG3iau7x6ESpIf9VzDOT2dEfuhpJazqDWuej48ohOCJzpxIyYoxBuX8NpqUOkUMOylZzFKNyiQ/vNCMO5Ay44NOj2bF3nyJu68xEuybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011495; c=relaxed/simple;
	bh=rWPKB4bZLjFCeMSom22QRVBLTFkyMwURrfqgJpqRbK0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=deSphIKieD2Vk+O2ERdPNNL03cNF/EcvVUHlkRkOUvx83QqiwPIzWDE52WSa1cfOaYfaguGbncCj7j4YZk7N/aAT0dO/n6sWEAaO5LCCD/r3FBUbeAYMrl6fm7mDXtS0Y0gdkI83pJn8rPztgcLPcpBrKjXArnoLRifoiL3dmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2LvAKyW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2LvAKyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3627C4AF09;
	Tue,  5 May 2026 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778011495;
	bh=rWPKB4bZLjFCeMSom22QRVBLTFkyMwURrfqgJpqRbK0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=g2LvAKyW/y5VZs9zrTWgXkxBExnwtuhI8PmFhEdxeYGEE06tjpHwTc5qZP80tEnr5
	 Da1whhBVflJZIEuTJAfG8UXLGBUL2DsWL8TPS6o4uTzHHK72TiweMvRDYK4gjqL/XS
	 jZaPga/HxLyD8BJZ0+BzYwHkUE1lFNdkkNbAcZ+/+GBAXuxNt1/loD0ntKTQRL8RHe
	 yYHYgbX10XRyH3qxlHYOeVAeYEl5WmDSIk9UDtppd79WoEP133YmD2RM1FRDMsJyKd
	 RjtrdwuedpLWRY4xg3FfCqML9RjTcBKZOkCZEwkWeIIfIFnr0/fM2aWRrUB1TaIDHF
	 F9KaqX4GKXEEQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 22:04:49 +0200
Message-Id: <DIB0GYCMV121.2VPS75GHH082B@kernel.org>
Subject: Re: [PATCH v2 1/3] rust: alloc: add Box::zeroed()
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <acourbot@nvidia.com>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260505152400.3905096-1-dakr@kernel.org>
 <20260505152400.3905096-2-dakr@kernel.org> <afoRXrwKjZAJuMaQ@google.com>
In-Reply-To: <afoRXrwKjZAJuMaQ@google.com>

On Tue May 5, 2026 at 5:48 PM CEST, Alice Ryhl wrote:
> I suspect some of these imports can be removed when you add the prelude.

Yes, but I want to convert the imports separately, so keeping the change
minimal.
