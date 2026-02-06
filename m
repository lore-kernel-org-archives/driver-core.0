Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C970381C4;
	Fri,  6 Feb 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770381247; cv=none; b=dp5i1rzKfboEnqVZyfmxqeESjqg21RL0gHrJULoDtIlwmuLqusO0PQ+oJX7uBKP4adV/yyk79EzZGwdSO8QSE+RI1D4QHrrqV/b+sqrq4eaJXLeXxgPqQGnA3k27uPrxxBke/HN3K4TlIhEkTV3ttaTFQMw6U1M1WTpmLVChhtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770381247; c=relaxed/simple;
	bh=L7GO+7hxlbNsEehvJLHHxVOtR9I5ct5agXWAjnGnJ/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVqTzqOEfjMGiLTvrlsu+nJjIxi9Cq2EuOnk9D9wfDwSyeifEV67TMNu39N6YRffiUFOAaLxPGzmaVAtbDQlXEU+mMdy4oBE3hSMku4ZMYCC3veqeOeKn0ecSb9hA98ycFMNkrF05974w7HG8b5iHILnQUVWXdir2E1dcmhF2iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GpnzLkKr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GpnzLkKr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1563C116C6;
	Fri,  6 Feb 2026 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770381246;
	bh=L7GO+7hxlbNsEehvJLHHxVOtR9I5ct5agXWAjnGnJ/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GpnzLkKrSy3EfPAKizLcZvwzALMOC+Uce4K5wzCvT4rwYoL9iiEhH8Bu+1mC+kNFl
	 xfy0k/EauSLxCKKI3mdsgPRJBuGDrQ7h9bnFIzCB8a6iKXm9Zy959gf+GY/yDuNrTJ
	 Oect3adFq/4EOHE30GCsFyHr5mS/NNU+66nQ4cfs=
Date: Fri, 6 Feb 2026 13:34:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Message-ID: <2026020642-consent-showman-25a8@gregkh>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>

On Fri, Feb 06, 2026 at 12:34:01PM +0100, Alice Ryhl wrote:
> On Fri, Feb 6, 2026 at 12:32 PM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Fri Feb 6, 2026 at 12:04 PM CET, Greg KH wrote:
> > > On Fri, Feb 06, 2026 at 11:43:48AM +0100, Danilo Krummrich wrote:
> > >> On Thu Feb 5, 2026 at 11:31 PM CET, Danilo Krummrich wrote:
> > >> > +EXPORT_SYMBOL_GPL(devres_node_init);
> > >>
> > >> I actually intended to use a Rust helper instead of exporting those symbols
> > >> directly, but forgot to do it eventually.
> > >>
> > >
> > > I don't understand, does that mean we do not need to export these?
> > > Shouldn't the rust bindings just export these symbols are rust exports,
> > > and the C exports are not needed?
> > >
> > > We "only" want these symbols to go to the rust binding, not to any
> > > module at all, which is what this patch series does, and is probably not
> > > a good idea.
> >
> > Correct, I just forgot to replace the exports with a Rust helper.
> >
> > The Rust compiler might inline some of the core code into modules (e.g. due to
> > generics), thus requiring an export.
> >
> > But, instead of adding
> >
> >         EXPORT_SYMBOL_GPL(devres_node_init)
> >
> > in drivers/base/devres.c, I actually intended to create a Rust helper in
> > rust/helpers/devres.c:
> >
> >         __rust_helper void rust_helper_devres_node_init(struct devres_node *node,
> >                                                         dr_node_release_t release,
> >                                                         dr_node_free_t free_node)
> >         {
> >                 devres_nod_init(node, release, free_node);
> >         }
> >
> > This will automatically create:
> >
> >         EXPORT_SYMBOL_RUST_GPL(rust_helper_devres_node_init)
> >
> > behind the scenes.
> 
> That doesn't work if this option is enabled:
> https://lore.kernel.org/all/20260203-inline-helpers-v2-0-beb8547a03c9@google.com/
> 
> then the helper is linked into the module, so it still has a direct
> call to devres_nod_init.

That's fine, because the rust driver core code should also be built into
the kernel, not as a module, right?

thanks,

greg k-h
