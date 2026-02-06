Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0174C33A03D;
	Fri,  6 Feb 2026 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378367; cv=none; b=O8RBE4/iszkisvO1Pu/eoMDBIHvyT1/uRBxLXyFqOmiQxUXJ1/44vqHTnmsIbUUm5xTmFAx2P0wvvoCc8aXE5dn4ZXgCvg8I0J/3BbHYKCj0V3kr6SSjNwXtUXMbWqHItmK6dKeNYgYFWrYv+OtGp70u8+6pl5zsW0AkNvVgVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378367; c=relaxed/simple;
	bh=nzJzwhkigLHXhUdeR0t70T43gJ4lihZmDuIdfXJiBGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=hgbgOrqn1YkSriqWLlJuDZJsO5Mq+HwZFEBoUmU2K1mc0alVCEJPZSYSxbQ7tmnqyQMUwakyRq+uhVpj3SwGIokYXpJcIOiHYC73nlFVfJxcxcQhxfhYDRjrOIyviSWkWjHdi+mIuNIO1m4A6xWes+2uWCERkEj8B8ZKdS7fmWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FY1lKD40; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FY1lKD40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1037CC116C6;
	Fri,  6 Feb 2026 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770378366;
	bh=nzJzwhkigLHXhUdeR0t70T43gJ4lihZmDuIdfXJiBGk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=FY1lKD40HlwnBM885OInWkh3b4vf+51ejpIUeVHx2eqhfuQQkQRz2BZw9vZN+3nT8
	 prui0LwQF9V/6TkyMqwlRb3lpcpVUfHFSCSLrZvWo1YxtKMjCmqDzSGJtZpDL0FZXl
	 rm5MKzwgPXYliZkOq44jWdu7D4ZEeInkLkJK0vRk3cjIj0pCe5KsVNFJWkmJ0YG4hs
	 3vSJcW33dwvL98suOyeU2D0M1PDWaMGO98vXCw+DuCvkX1iDy6qocwOE78QA6ME0vP
	 IkS78zyqzlHjhD11l9wlbuqy3zp+ExQ0s6jI2d7LXSkIA0fY8GxolIV+KYFhmDUpPr
	 hoZifh0AaidOQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 12:46:02 +0100
Message-Id: <DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg KH"
 <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Cc: <rafael@kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
In-Reply-To: <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>

On Fri Feb 6, 2026 at 12:34 PM CET, Alice Ryhl wrote:
> That doesn't work if this option is enabled:
> https://lore.kernel.org/all/20260203-inline-helpers-v2-0-beb8547a03c9@goo=
gle.com/
>
> then the helper is linked into the module, so it still has a direct
> call to devres_nod_init.

That's unfortunate, maybe we can leverage MODULE_IMPORT_NS() and
EXPORT_SYMBOL_NS_GPL(), i.e.

	#define EXPORT_SYMBOL_RUST_INTERNAL(sym) EXPORT_SYMBOL_NS_GPL(sym, "RUST_I=
NTERNAL")
