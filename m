Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732033;
	b=dlqfiRlrBL/DHtQuBSh6H5w4mWWNRI7TWTIwh0CHjBXfiKR3zA4zNl0B5MEFkaYBjW84
	 kva1u25gEhXVXGMud2j7w+Ehw/XVcxkV8mR+b8xkq6WnTEVFYfZbZM/6igWzvUFPeo70Z
	 F3Uo+ChkB7GFYzKaBLxdkR06w5lpdYB7eHkFiA6FX0Z1oM+r/U5NwLNi645ThXVWSYUue
	 WW5oJefcX+1ntHVjitSWfjOikQg/2hefB24evKJMwAml1BGcbuKaDvWjgil8VXjiffOW0
	 PHOE9unpX3GNou7kwLMx0A5XS8vyLVKrp+vn8le3vH6BAUwq3hteCd6ZRuew/JDKUmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732033;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=T+fK409TTSCRU3hvVxVjVbDaGx/0i8r8HBFh1M/tb10=;
	b=qf/NLb1l3dR6okfAELyG6QmkYZjVf+htZH4P1R/tFMsArV2peohwgfRfrtPG8Q2RZNNA
	 x6foiUTGzT2SB7z92ykxiyriWn2NYaAWobu73kXB9Kto2VYZ9cjDmr/3TL9c1FjrkxXK4
	 sCj4BNUWuuzppEzYCL9gAbvnnySghsKB8KeH3l7xcvuOXXWtwi25VBTlf9x5xppR5YP+e
	 IbSl071uox5xdFx2DdCEvcY4R1ShhCqbxiXw20nu9ZL0A3bknin2ix6WHE2+pqd4x6bVp
	 d5qqSV5JzRyrZKebduSSH32m+w5JPeobp2Jf21YS4f9eoqB2DzR1fmYcxufHLPjjlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddt+bK+o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219B606A31C;
	Thu, 26 Nov 2026 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ddt+bK+o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F86E1F00893;
	Thu, 26 Nov 2026 22:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795732033;
	bh=T+fK409TTSCRU3hvVxVjVbDaGx/0i8r8HBFh1M/tb10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ddt+bK+oMGDEHLLoF6ovDMeeC5KyIzT5F9DoG3ji6XECOwkfDfQ7VPDdjzy23qJ5+
	 GEu6licQqRrFWYwPZsfA2x9MGEcGcbUp5gm6B2JFdPFmbQUibKJogk0ncSegPzugdo
	 2Cc8SaGqe6zdOKc6oK/wfY4iSjOMxyMifL5uR3zBsEnzBHeoicVywqh/CGt+ZP5fCN
	 JfbxzpfA7ZiiCg40oC9rLw7YgUIOwZsimEKA5FdHAWAwbiQp01M2R+PQZcf1bPgCCD
	 wiCyx1MUk4GksWpiXhW3XMSFIh315ZpMkTUeLaUTq8zcL4g+ZBAWXzHtowAtXNmHzi
	 hBbOO3kR613qQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Ivan Borovyk <saref012@gmail.com>
Cc: dakr@kernel.org,
	ojeda@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] samples: rust_dma: add missing newline in dev_info! call
Date: Thu, 26 Nov 2026 23:27:07 +0100
Message-ID: <20261126222707.3824643-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123230618.375172-1-saref012@gmail.com>
References: <20261123230618.375172-1-saref012@gmail.com>
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

On Tue, 24 Nov 2026 01:06:17 +0200, Ivan Borovyk wrote:
> [PATCH v2] samples: rust_dma: add missing newline in dev_info! call

Applied, thanks!

  Branch: driver-core-next
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] samples: rust_dma: add missing newline in dev_info! call
      commit: 0f36e896905e

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
