Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572993;
	b=kNy96QLKxy3+XG8nZ7H7I8rNajtgIeRMiSmmbCvUvwloRTbTnL3huQ9tbX88UPi/2Had
	 y5uQWp6M/NFv8JhD2TavZOBS/ywmeeVUQXu4o+j1a03rVFjI4OjFS4VOjUWQlqWzXiEUP
	 KAw8Jcm23L8Jeo9FB2xTg1LfIyuV29k+YkLEkU4/532iOOxHgopmmn9qCkK+DFD9tYNQp
	 NJP/Y26oFyKJgHG+Ls+nQGAB3DiyyjPd2LCSh9GHocvTdfAwmNcwrCRBdsO0l3FuTF9QS
	 lZHyYtAXStOEA0gJo5exM/Ma+H0tZL6Uh0Cweqv+qyxotUgRPMSVipPqxR7ma7Q9Y6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572993;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VLna3m1PJup3gw6ZeZRQ1OZQFa8SVHWJAPHsEWs7xmQ=;
	b=fheledpnFl8X9s4EOJay4oR7ufd8uZF19M3lPdc7hWAVBHrYN73T4M3Z4VdAeQ8wLwpA
	 OYPl/0JwaIEiiBE1oOkSyYXtb7KIe/+JrosPgiOIQYv14ym6b5spxdIbkrQmjfTzck5nC
	 mctzpXf+e5VwLub4STwguyu+fDC33Jcxuw+z6mA8NYRSn+PRoIo6hf9wuMKeURs7XfjB5
	 McANxE9v+2QZ2jIYkwxvcd1Th/QqhSSGbDBCglmOrWXoQIbIbpJeIcNnfv+S0B/flbHkn
	 6TbGPigRk4NweG5aVdj9ZXC4IO2YAEPZ5I86aOyaprKkf2plA15GJMPo0W0DuvOYvGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPqnOoa+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19184606A324;
	Sun,  1 Nov 2026 22:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPqnOoa+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BFB1F000C1;
	Sun,  1 Nov 2026 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572992;
	bh=VLna3m1PJup3gw6ZeZRQ1OZQFa8SVHWJAPHsEWs7xmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VPqnOoa+zBiQa5BxRC5N4b1ufoN3d9/DOGepIo17/ywjnX5G9y6LDsf10ake1Tt6i
	 LQKVhMpORFvQ6WIWUnhNHlz1kl8Jvz1O87kJ+oYnsu+Kbb8dW08CeTnRuiujoYk+v9
	 qCgO69QCzOiAQ6sy1dq7CfIhauL2B6EbTxh+K/tQFB8Eufc36UJRT1hpokl29Dg4gO
	 YXgrjLAPfu2j5U8gnBjMADJnEJ26Qjke0aAN136sgj2lMyJsD0pGOwQ31Ty2R//dzw
	 VtNr+W2Up0cGFFRl6bq53x1FR6z8z5XQHVTNuJ611Py8oecmv/7pz+nZpawFM9ZVxe
	 PZA0kjnr3S5Og==
From: Danilo Krummrich <dakr@kernel.org>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rust: io: fix unused Flags::from_raw warning without CONFIG_PCI
Date: Sun,  1 Nov 2026 23:43:05 +0100
Message-ID: <20261101224305.2470088-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026-pci-fix-v1-1-a6a69ee584d4@nvidia.com>
References: <20261026-pci-fix-v1-1-a6a69ee584d4@nvidia.com>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 26 Oct 2026 12:53:20 +0900, Eliot Courtney wrote:
> [PATCH] rust: io: fix unused Flags::from_raw warning without CONFIG_PCI

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: io: fix unused Flags::from_raw warning without CONFIG_PCI
      commit: 14098e496671

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
