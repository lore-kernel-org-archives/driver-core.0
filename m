Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1552F6571;
	Fri,  6 Feb 2026 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377560; cv=none; b=ilxDeR+MkLjVP8Vviy/OHaBlNDAtrPw4I1vnxv1JELZXQdZvYoiTCF5Pd6ghfaaYJzHAFB0/7uzyxuL35KuGHN0N4PA4ijRU5JwrRpdmvAOn/3vg5l7QBrKrwpojSErRdFUBWJ0XULBXLpYvTCWKkir67AdO4KfKXT52IOgwN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377560; c=relaxed/simple;
	bh=Kk+At2ZAyeTKwNIy4midXTbIDcMOwv4slEp+up0WpqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=gcnxqCdKVhdit1YpmdPoNF1jOOm75KYKqDKVOqO6Y6dT3MnjN8FEELHVUjA1pu1FUun2TC32L7Ktr76Zq/kaabSE40rrxV0YlJnFoFwhPDY399losddecb33LRM5Xwc0k9WpGHRlMXhawVEcR7kJDhbvzS1RBkMSs2jpdvpZVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+OwA1VV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+OwA1VV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E157C116C6;
	Fri,  6 Feb 2026 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770377560;
	bh=Kk+At2ZAyeTKwNIy4midXTbIDcMOwv4slEp+up0WpqE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=s+OwA1VV0+Zj6jhWorkLQCqgZEDlvz1rEVysnkS6lCRO2SuLJIRKRD4XQghqQihyv
	 um3PmUiJy5PRmSbfyu4CWfV50TeF42YTRF9040AKFJAO2pIMFrgGNa7a2TUuOz2Uxy
	 akw551+ED5WdBhKCqXlvY3TlKJESxTfRGJHP0m6iG5cSQQKu3Q77i7354bl0ASamP/
	 dyqxhGdxNQTfesn6mhVweLmzZxQO8nHUjewaK/m+tVZbTh1v7zex9MmwVBWjDeaH0b
	 DpU19l/hwxP1nu6gx13gTUpWSXP9IBOeghS28MYUsXddmj89I6QINExJNjVgF4phBx
	 ZkkIaTlVQ1Phg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 12:32:37 +0100
Message-Id: <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Cc: <rafael@kernel.org>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
In-Reply-To: <2026020633-democrat-moisten-631a@gregkh>

On Fri Feb 6, 2026 at 12:04 PM CET, Greg KH wrote:
> On Fri, Feb 06, 2026 at 11:43:48AM +0100, Danilo Krummrich wrote:
>> On Thu Feb 5, 2026 at 11:31 PM CET, Danilo Krummrich wrote:
>> > +EXPORT_SYMBOL_GPL(devres_node_init);
>>=20
>> I actually intended to use a Rust helper instead of exporting those symb=
ols
>> directly, but forgot to do it eventually.
>>=20
>
> I don't understand, does that mean we do not need to export these?
> Shouldn't the rust bindings just export these symbols are rust exports,
> and the C exports are not needed?
>
> We "only" want these symbols to go to the rust binding, not to any
> module at all, which is what this patch series does, and is probably not
> a good idea.

Correct, I just forgot to replace the exports with a Rust helper.

The Rust compiler might inline some of the core code into modules (e.g. due=
 to
generics), thus requiring an export.

But, instead of adding

	EXPORT_SYMBOL_GPL(devres_node_init)

in drivers/base/devres.c, I actually intended to create a Rust helper in
rust/helpers/devres.c:

	__rust_helper void rust_helper_devres_node_init(struct devres_node *node,
							dr_node_release_t release,
							dr_node_free_t free_node)
	{
		devres_nod_init(node, release, free_node);
	}

This will automatically create:

	EXPORT_SYMBOL_RUST_GPL(rust_helper_devres_node_init)

behind the scenes.
