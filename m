Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80442EEA3;
	Mon,  3 Aug 2026 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785789988; cv=none; b=X3cA2sf5uE7WbKPCn9zlNbayAb47bSxgZRGNBeY44ilXkrHtcWQD+hiW0FWEDMHBRSnmvpZP5hKLIkxYpswfI7uCUpM2BZ3kQMX6jq6FWJBEJz7u45kY+grz1/ckXVKIUhsP0TwIZDA/lmZIDEPzTskd0AY8K7SZNRiu5RP0Xpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785789988; c=relaxed/simple;
	bh=EAGKuy1pjQKvYeth3/E76zgSjPP3DfHLJfU3fM2bmyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EwsvuY3mdxB2u9ztsd9PEdU4QAmZcB9Q/1i1bB75TCbO1SXa+3Uiy/cgt/VOsfX1Hw+ZUu54JTrTj2OVdAGFr4/sXK33JI1vrTUNzYciYQ1Mb2Dh2d0Cu2t3LJZmbrwJXLNb8FrE8hAv8WxgU4X+t1P1/fBAIfWPSqe3ufIk69c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLIrXYCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLIrXYCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EC51F000E9;
	Mon,  3 Aug 2026 20:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785789986;
	bh=CKukr0kKtwGlYBu1PNlJeaKZSMwsaeEvONoBJmI2Ijs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HLIrXYCidf5yZItQJ7euKmQldxLQCaXhOLLk7+CqYVwi1Yk5S5RH9J2C3YA2PLMUt
	 bSPkfUEm5gPFbkguhIFVPIu9XZCmm7FgK2ktiuDnu0xOxMJXp0yHuB4d1fbVJk3JNB
	 xeASrv82DkF5BK8tcWVFhhVeCAgpDBPNHQm39c7kcJ4A0bQs0FETb32ojwjyh8P0lO
	 IWHCRw9xiOobhkmWXvCBveItkzH++Fc4n2ytv58jN3AarfZTFZ7Il5tgYuEkwrSI96
	 xqm80uo3hD4JZTN9Xj3LIQhylOJeblmZjTvJk6ogpHbSMTAVFR7FpYrYyxDvIGJHT9
	 Gw0ke0VgmqAXA==
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
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
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] rust: io: register: a few fixups
Date: Mon,  3 Aug 2026 22:46:19 +0200
Message-ID: <20260803204619.3606521-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724-registers_fix-v2-0-a0fb58b02185@nvidia.com>
References: <20260724-registers_fix-v2-0-a0fb58b02185@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 24 Jul 2026 20:37:03 +0900, Alexandre Courbot wrote:
> [PATCH v2 0/3] rust: io: register: a few fixups

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/3] rust: io: register: dispatch shortcut rules internally
      commit: ebb314763f97
[2/3] rust: io: register: remove unused rule arguments
      commit: 78e9b4389231
[3/3] rust: io: register: use path fragment for alias destination
      commit: 2230d3882850

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
