Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F31BD035
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377655; cv=pass; b=ozqwyHPTndJSSo8pRUxav09PAs/60Utv0aSCLdPx/lNPbvTbtpLx0EfJdq+pmeRi0+mRnRe9J1SexIBbrcwB6mAzV6qpj0pRlnmrB8UAWY/O9XAKP0HZIJuQMuhCudqIzftOdB6gYXzGKQSm2391mMEizu268SCnAjh/XZJKvMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377655; c=relaxed/simple;
	bh=7YptLQBpjuElodXPfHFJhvjhJeTpEuDwKWcN0fXNy5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXjrQpwHObNRj41y9GdtE9GnSI3r4T7dbMRR1I6AiJ1E38aSKnXIoZ1wz/6EenUv3wb0YYoC2O9Dyb7/ulbcJwuZ41fE37pmAOvPsomqtMytw2F5tYEKWMa669dss6kLaF4KP57GmgwZvNcuz0bxUKk5Np8LhLu1SBfPyIcPuUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mO8Uiekt; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mO8Uiekt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362d4050c1so320326f8f.2
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 03:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770377654; cv=none;
        d=google.com; s=arc-20240605;
        b=bPe/A7gRTodVukA7fXtjs506d9X8lyTcXBKv8tFxS1zDTMbu4ZD7Y3VMBs18ORSaf7
         5QxNxL22SQ7E0M4jDVeDU1b8ScM87xqK+7lQXfSD5WIEEcyFK4xplk1d2bdGJHSzyFRL
         HX+ezfOvVIDLZx6LpMFkjoVG3tgVHf6bF5RHQaDZOjaR8uh61bAnKeAIR0isTiBU5fdg
         hxXWMzCu5/oEaaCpA1TO4AYbETc49gVru36fCsCByln9Ead372VoPrLrKDdkLhNhvHMw
         0qXnrME8XDY2ZHXlSJpXKjYd6Q8nW2QiU5H7LympKhwelJ26/0JW8Ixue+y4u5A62eMi
         PzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r6VdpjMWDqzoZZNgJcZKDl6I3KU1j7FPhrEM3id3Lik=;
        fh=wspJEmqAIPkRrqnKDPw62Gqokd/wUw3Eohzl7goJ18U=;
        b=Te+5Bv9vAma+0d35CiTML/q2T9f8utQ4UrEgocKqSHbnqvwCpn2VXRuAp9iXOZhBCs
         d/j8CvMmi5+dn0G9uH6h+0zAHBuNSMrbd3Ly+fKho5uAMnb3T9hWFEHOTt/JUxps5HqN
         hS+suX4RylqpYv54vCg/uS5GUgZxa2lsmBc5/kxu+Dqon2Nn4XnhgoPvqAmk+vcLJlky
         f2nSA7LNkGXTCmF0fl6Sz8L9GAy3l3VZNT9E6CjJnh4BHxUxvdkCQx98B7Csudkt7slx
         aCyqgKKHiZIZ7hlBUkevZLTBnKBNes78vHdgUFe+/mzXbZcqQAgPzM2EHdWlIdYW/oCm
         pJQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770377654; x=1770982454; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6VdpjMWDqzoZZNgJcZKDl6I3KU1j7FPhrEM3id3Lik=;
        b=mO8UiektR8X2m2oGp0dA1N6Y0MM1/ecR1u3HSVA4Tc5aEJukXVzsUkno0ST4LJXlZN
         l0gUqJsceErQizQcbATH5t1yNLqhSAxPkDpRivs2kJloCjwJRaTryjNCVLk330KdHVpz
         ejBycsBGBL1J2aA+320qQ9WV21Cyp6+R+IqN0JmgEXN+3eQOEI5wAxe6rDlnc6bU8kLR
         HejxgMqi62BTzNOmARtUl8BI5o2exlgoWCPd/G6LppE3+os4zl6+t8TwBC6Htcaj3+fX
         tHGdMyU3QKAEU+2UfO5Id9s3a7+GKpThJ/eN8ddlqRjiZgepnoJTtxgy1lH+vARCrRPD
         d0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377654; x=1770982454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6VdpjMWDqzoZZNgJcZKDl6I3KU1j7FPhrEM3id3Lik=;
        b=QQoHGdk7uWdKZ+vC8a0p6BVO05ACl4v2Sn9Wfen/n3xSkZ2ZdXM7Utqp4VpFY1AvHy
         1GBXJzKEVIXUiADLbKubG4nQI/X9SEoY3UMv7cCAnSUJk++R59YAxvuFTSfAoUJK+NGw
         kKuxRygaqgCq0cO0BvIkpI3t9HMJF5oTWZPTvmfsGw+Xj3+iPxbHMlXD5smdw/nJh1pa
         XZeUPJe78GqWY2/KRfc+iefV9S9sBP33Mra5dKqUiREfCmgljhw4m8sZ75cSx+mPoB2+
         KkzED5zdeT7T5l4Awe1rVnZH9BkTVHyM0hCyE2pqFm102BZ0T4OCE2g1XMA44rp67HVA
         kmoA==
X-Forwarded-Encrypted: i=1; AJvYcCV4mBUafmkjLH5PnIgalH0U5/W8gD3LE6HIIa7eRq14r1I1xcDrIQLlYbuCXBSXJQir6wVCdluZ9zd7Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGUKUTdsdUlOEztUSnOdxiyX9t80ZMl8myriZFtOcdkm+yV8L4
	lSdXLBVKeCEW35rPAxdn8jQuw2ZZUUu5KGcwMTwobjKvND2sl6u3+WHHL814V/UjnQ65AMd1Dmc
	ZG/K6sNhwQba4mrzVRDH/zL7E3XP9PNEBOjifK/bG
X-Gm-Gg: AZuq6aIHENZfu7TKxAOnJk1fd3wD+wNlnVNB1eqQw1vtYBRDJcIyyqY12cYoo+jT1la
	95Uk+QEo2gg8g80eORAYWskRLl+Zk5vrTW1xKMGY8V5tQ3J3gTjbGXCUyqnBi+7N+8oia0D+Vlz
	lJIzwbDYgwDlvXxapqxu3NkX9BAs/2w42Cqxbf405RFQZCK42byjxlZK7FflgMFaK80pRqhgT1s
	L+WsoftehzvV81qrGCKECGuvCztW5g3+PF/bq0IQykyxTo8N0OARksyypPDAyPbgoEJkYqV4YUh
	XABrjOVbUeksZlgvB/KrcneHjg==
X-Received: by 2002:a05:6000:1ac7:b0:432:5bac:3915 with SMTP id
 ffacd0b85a97d-4362938b240mr3694852f8f.39.1770377653424; Fri, 06 Feb 2026
 03:34:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
In-Reply-To: <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Feb 2026 12:34:01 +0100
X-Gm-Features: AZwV_QgJME1Kspjjx-OC11f72D4HzejOVCq7NwRJPxhLlFNoLtq63JefHlgoVAg
Message-ID: <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 12:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Feb 6, 2026 at 12:04 PM CET, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 11:43:48AM +0100, Danilo Krummrich wrote:
> >> On Thu Feb 5, 2026 at 11:31 PM CET, Danilo Krummrich wrote:
> >> > +EXPORT_SYMBOL_GPL(devres_node_init);
> >>
> >> I actually intended to use a Rust helper instead of exporting those sy=
mbols
> >> directly, but forgot to do it eventually.
> >>
> >
> > I don't understand, does that mean we do not need to export these?
> > Shouldn't the rust bindings just export these symbols are rust exports,
> > and the C exports are not needed?
> >
> > We "only" want these symbols to go to the rust binding, not to any
> > module at all, which is what this patch series does, and is probably no=
t
> > a good idea.
>
> Correct, I just forgot to replace the exports with a Rust helper.
>
> The Rust compiler might inline some of the core code into modules (e.g. d=
ue to
> generics), thus requiring an export.
>
> But, instead of adding
>
>         EXPORT_SYMBOL_GPL(devres_node_init)
>
> in drivers/base/devres.c, I actually intended to create a Rust helper in
> rust/helpers/devres.c:
>
>         __rust_helper void rust_helper_devres_node_init(struct devres_nod=
e *node,
>                                                         dr_node_release_t=
 release,
>                                                         dr_node_free_t fr=
ee_node)
>         {
>                 devres_nod_init(node, release, free_node);
>         }
>
> This will automatically create:
>
>         EXPORT_SYMBOL_RUST_GPL(rust_helper_devres_node_init)
>
> behind the scenes.

That doesn't work if this option is enabled:
https://lore.kernel.org/all/20260203-inline-helpers-v2-0-beb8547a03c9@googl=
e.com/

then the helper is linked into the module, so it still has a direct
call to devres_nod_init.

Alice
