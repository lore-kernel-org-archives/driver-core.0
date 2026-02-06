Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C023242BA
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395467; cv=none; b=edvscxLylzKnxpeXenEOAeufP6FAwBCM7dyau/v247ZijLVrN0mfArkZrU3xEt1Utb9//aO1r3utT2X1HMrF+jnxE7D17kPK8c/7aBYZI6g25G2GvjHynCzyaJMVSP2ADRj0qjO4GpzK+HgZCVcZv0izqwQYhz+CaWWb0uhi+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395467; c=relaxed/simple;
	bh=2wwgwWCzkU1/uJtgqBNz6l48jquoQD3I3uL/trcljCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZXk+ybLPvO0buamwSXClzxgzxYSIotKkEoy4vGMndePx+bELYRdY6ixTufJ6WoT029uMOztfg5JMu4pSUYYEu/zCu0xjus2m796V4rd8/h7pQALH8Quf+n6KrAoDBf/1bdXkhFZ17fkWWwMR9wTMgOf/hwKtUE+U/gIXXeqtJnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B6wk9aL6; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B6wk9aL6"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4801c1056c7so15559205e9.2
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 08:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770395466; x=1771000266; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ExqTOkqsO8eK7E0o5abiZmMLMVjxuERqrY13GtOt0ak=;
        b=B6wk9aL6t+OPMbfE6lkzCg2pMBlJfF901R7CIPP+Ifbvl+pCwW/RGYKu+6CQ8cMTk3
         BsHHsO8LNab1H9iKqPmiO+0Hphb3JasO2CcgPjzrhKJNO4y51j1Y1qpUP7xr8K1X+UJC
         umaS1IJEO9biMt5tJH38zZiUs6Hn+T9ZJOjvTjZH5L77NVDzNyZXWK8zX3ECJrNDyfk2
         i9tp0AIjQ2BtHBOJJ7ttEni2I8i7NQBxRzEcWtaIqx8npMspwtUlyhoVgQRQVz16dxCj
         1aTu3hcIAt4oN+2GT1QlKVHnxiQtwVaz034e0bzd6dDSHSSQi9kVjnFi/uOF182cZyhW
         RW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395466; x=1771000266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExqTOkqsO8eK7E0o5abiZmMLMVjxuERqrY13GtOt0ak=;
        b=XXY9zlDGxL6mgutyADkEELTz1csmwv5+2q82YXluhz8RqdbTUL8i7QsxGGOghnXJdh
         Xuk9Bki38dZRSfkBIODjQmkX2nshz1o0LBR5OJd0FoSF74YQnuuIsnvpGBRKOnD2Hovc
         xVQFiYIaUnlejQ1a2Dwglwy/WUNt6lh2w4Vi3ES4AnfUUPzipamF5cYUmleaCRXAW90n
         hGPNeA6voSZE+tBPHpgt/NUOz8oEzXiV6mX1ZRj+dynTcZiHGOuwpuFx4R5UYjeGxXnz
         XPZKlPZTsZf8ijjFppSrwA5c8SzC4LvI65nG3nMpWGUGYuFkrYcXSFm8Juh69XY3QIRa
         yb2g==
X-Forwarded-Encrypted: i=1; AJvYcCUiQtvn2SG7CFPWkVo+9RSEVxdEdGwtGz37zPBCDNiN8Tf8xBqXn6LrI8BC51/A1afqm1Alxj5G6G+Rag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi676ZlSHIA8WaO3fN+1/X7Ih3UqwDneMLRdpvvvNgA3+pDbfB
	iMsK/sTI7u+6473yComPHGklyCY1jghEQfdF9B8T6ks3Tq5uesOGCCZUr+Bk6An5PdzBz4LYBXt
	skQaML0M1ky9t+kvXMA==
X-Received: from wmjf11.prod.google.com ([2002:a7b:cd0b:0:b0:47a:8fa6:6a57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8489:b0:477:73e9:dc17 with SMTP id 5b1f17b1804b1-48320229cdamr51034695e9.35.1770395465775;
 Fri, 06 Feb 2026 08:31:05 -0800 (PST)
Date: Fri, 6 Feb 2026 16:31:04 +0000
In-Reply-To: <aYYEFRwotF5AL_Ch@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh> <aYXtwXYAELSIoxXE@google.com>
 <2026020633-foe-etching-e464@gregkh> <aYYEFRwotF5AL_Ch@google.com>
Message-ID: <aYYXSPtndNSPZDH-@google.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rafael@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 03:09:09PM +0000, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 02:55:50PM +0100, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 01:33:53PM +0000, Alice Ryhl wrote:
> > > On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> > > > On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > > > > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > > > > Hence, we could do something like in [1] instead. I don't know if there are
> > > > > other options that may be better though.
> > > > > 
> > > > > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> > > > 
> > > > That's a start, but still messy.  There's no compiler options to prevent
> > > > this "lifting" of the code out of devres.rs?  If not, this is not going
> > > > to be the only problem that drivers run into like this in the future.
> > > 
> > > Because of how monomorphisation, as-is the code actually lives in the
> > > module to begin with.
> > 
> > Ok, but again, that is going to cause all sorts of "the symbol is
> > undefined" type of problems going forward as a developers just "assumes"
> > that the place where the symbol is exported will actually have the
> > symbol exported from it, not that this place will be copied inline into
> > somewhere else.
> > 
> > Think about the interaction between module symbol namespaces here.  This
> > isn't going to scale, and will trip people up and cause us to be forced
> > to export way more than we really want to (like this patch series shows,
> > I don't want to export any of these...)
> 
> Hmm. I don't know how to reconcile namespaces operating on symbols with
> monomorphisation.
> 
> We should probably think about what to do about ... :)

Matthew Maurer pointed out to me that behavior-wise exporting and
namespaces behave almost exactly the same as how Rust handles unstable
language features.

In the Rust standard library, all functions are marked with one of:

	#[unstable(feature = "feature_name_here")]
	#[stable]

when you use a #[stable] method, all is good. But if you use an unstable
method, then that's a compiler error unless you have

	#![feature(feature_name_here)]

at the crate root.

This seems equivalent to our situation here, if we consider:

* EXPORT_SYMBOL_GPL symbols are #[stable]
* un-exported symbols are #[unstable(feature = "core_kernel")]
* other namespaces are #[unstable(feature = "namespace_name_here")]

Of course the way this is enforced is through an entirely different
mechanism than symbol exports.

Alice
