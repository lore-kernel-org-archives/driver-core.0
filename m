Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702678F2E
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776322791; cv=none; b=uP6QdRaIKoR7a/9WphYe4afPHqv48EdDz23lKIZ+0bSfPVBAWSbbeGPABReu/JDDCAkpEF8mYFJt6lDKG1HcNaRmD/pFT/o4rMTc3M0q/ZuJLhsMnnnhXpKtSGtW9xBzHkmF9U97eko+4Ty1tGl9FWV6SlkpXcwLqLdU1fYkczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776322791; c=relaxed/simple;
	bh=osa/wtOqVSu/A+mS8MJxXf1eJNAapoVRgn26WEjvBmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MOcWmEgq7wpcp8xtxIy+qShZxDkohAarHct2u+LUK1zf5T4P4Roc71gTLCOYjFT0p6/IKDbSjxYbGdzLk5cIgZ8AIXAxDEjyrbWT7nYBnmAtJh003uMYKy0Qyist77F0gebSu92ojgjBl+5ubCCvL3Zub7QW9A8C6Xt1W25vGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VS1vImd9; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VS1vImd9"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d00dd913cso9058845f8f.1
        for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 23:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776322788; x=1776927588; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5aFmDnuvFPblx4c0gjd64DFbv9jYF68Xx/BpImY+Xk=;
        b=VS1vImd9v098JbVspeLpEOCRzMCf6ycpeE75eCUtvl0/nWIF4OxZciR6EjqoSnv7TW
         1CeeS7KGPl/Xjd/LBErG5BHvn35nE8KWIcn3wgzaX2wFdyfu+WEKxgwCGfE9MGl7zMbH
         224Ug+rrDl0PLFRAcSGMzYcaLbY+UiHNXju6OxqNabXpCwmfwA7kcfB3veP3ahUb2q+k
         uU9zqMo1UxKZDg1iWEnoq71WgiNKPf7+jllZF73ckBAAVptqpRgYJGUNLyJ+/jjzfwYm
         HQKbuoklqR1AWJ2IshO7yp1UwS+URgarDkwFBvpG975oCBej1jGBu9BFnr+APRf1Q9jg
         snTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322788; x=1776927588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5aFmDnuvFPblx4c0gjd64DFbv9jYF68Xx/BpImY+Xk=;
        b=Tni2eEIzxxmPx9OcHLM8AV13MK/BUFcWTAdvY5RiT2bA/uZOXnMHdza/hdI9tK9sJr
         udwlbFUeBoJyt5coGUBSmsu5/6JdP0x//GHbFCQ+hh0w8VJAY6QQ5ka6TCKcuhn/5A4a
         fj7HlnAwBzJrh055j0EsP31mmhQHRsyu+1mi+dKc9E0Sz2beVDEWfqIFJ+TyXWyCPELP
         3nxmE+DFafDnBcIf+nE4297+amZyk9VKOxXDpTG1XhlkoMuobEukfCeLHvSGDGG96U3x
         7w3HHvrh+6jNNQSCSCV0uD+60N++EUVVJf0p+IlWBhGJW2oqro27TIGg0fL7jB+icqZ7
         mlNA==
X-Forwarded-Encrypted: i=1; AFNElJ/yybRWvduYjDoGgskD62l88hdAdpPqFC+PuRzsO83vRD/RF02bUhWenBPmFk4J/ZKOrg6SEAOR/sTFiw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1AKXC+q2jtIoupxrQyEWBUzc77CO58VpMYS6DFrGlhKSR05HQ
	tQMgVsshhU0qzJjX/FPdZ0y/P/NPVsapxJ3TURmN8Tqtcvfr0Qz6UhUQ9ivCdjw5PB+txLyEoFz
	MmIZyvqZkuMcE2PQj3A==
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:488:e127:aca1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a415:b0:487:1108:48af with SMTP id 5b1f17b1804b1-488d67bf7c7mr256452475e9.4.1776322787516;
 Wed, 15 Apr 2026 23:59:47 -0700 (PDT)
Date: Thu, 16 Apr 2026 06:59:46 +0000
In-Reply-To: <aeBM8fTW46H9RNg7@yury>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <20260409-bitfield-v2-2-23ac400071cb@nvidia.com> <aeBM8fTW46H9RNg7@yury>
Message-ID: <aeCI4giN1TEL_uJn@google.com>
Subject: Re: [PATCH v2 2/3] rust: bitfield: Add KUNIT tests for bitfield
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 10:44:01PM -0400, Yury Norov wrote:
> On Thu, Apr 09, 2026 at 11:58:48PM +0900, Alexandre Courbot wrote:
> > From: Joel Fernandes <joelagnelf@nvidia.com>
> > 
> > Add KUNIT tests to make sure the macro is working correctly.
> > 
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> > [acourbot: update code to latest bitfield! macro.]
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >  rust/kernel/bitfield.rs | 318 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 318 insertions(+)
> > 
> > diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> > index f5948eec8a76..9ab8dafff36c 100644
> > --- a/rust/kernel/bitfield.rs
> > +++ b/rust/kernel/bitfield.rs
> > @@ -489,3 +489,321 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
> >          }
> >      };
> >  }
> > +
> > +#[::kernel::macros::kunit_tests(kernel_bitfield)]
> 
> Reading the Documentation/rust/testing.rst, and can't understand how
> should one configure it to _not_ build the tests? This should be the
> default behavior.
> 
> There's half a dozen already existing unit tests, and I didn't find
> a mechanism to individually control them.

If you want this set of kunit tests to have its own config option, then
you can declare a Kconfig option for it and do this:

#[cfg(CONFIG_MY_RUST_KCONFIG_OPTION)]
#[kunit_tests(kernel_bitfield)]
mod tests {
    ...
}

Alice
