Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8043FE67E;
	Mon, 11 May 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511233; cv=none; b=DQITgXEkSFNOgGYLGMc42lInLxOZkyerw1EraYVbs3X88CIhJcev1/alLClj5z9Yizh/OxKfyhhjKPpXDBlthcK56J0evpKbp/wkpFC2gJC9izH5hP2cI4D0xAAp0L6obcM3DXH9tWfIKXv1ubIFPD0anySU4TO0uqWQJX2hGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511233; c=relaxed/simple;
	bh=QFH8ARnvfJankAjYcrDqCNJo6omkviJqCENnR8GjxG8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kQwfTcaMo4MvlPk0vRQSLff915jHYO1Bfisq6fP36ITmEAb6c0wzbCs2xDHMoGCNhsU54E3UkuWvlxgp3sXWHRszo4hLs1CvVJqjhaAK7J190Kd5f31/RLaoarA0D3XeMEYnoEFqbMK3QOf8n7/Zl4yvDAizwFsKcX7GBrX4h+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsEBOXHA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsEBOXHA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBC2C2BCB0;
	Mon, 11 May 2026 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778511232;
	bh=QFH8ARnvfJankAjYcrDqCNJo6omkviJqCENnR8GjxG8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RsEBOXHALa2gYD1SWhAMTlHgEZRsZL4qXtd29GUyhP8R/GaHXc8v+HKkjNxqNd5xb
	 Ky1TVvn5qoDfHWrsn2m5n9FuD7u1xm+g62f3Ns41ZHADDtPWSeJ5QaDesvMfY8TUdg
	 RkSAmUWsWiEbouIwV4ScE3llj8YNRUDazjCdpJ8YrGJ1fgziJSGjlmBbqmVAq750va
	 NBApeK8MNNaph0487yUNFR/ydMbswKOhft2Z8KkLtWkF/vXSXI+ENKEtDEeAwRqshd
	 QtZjroi7lEBnxMWZqVqwvJF8XH+EtskxHnrfZNC5LtEGq7rHz8Avt457Mh52Jx9qi4
	 nqNwL+l8D5Diw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 16:53:47 +0200
Message-Id: <DIFXM2N21Q5J.2RIYLU11C5FR6@kernel.org>
Subject: Re: [PATCH v2 2/3] rust: auxiliary: add registration data to
 auxiliary devices
Cc: "Alice Ryhl" <aliceryhl@google.com>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <acourbot@nvidia.com>, <david.m.ertman@intel.com>,
 <ira.weiny@intel.com>, <leon@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260505152400.3905096-1-dakr@kernel.org>
 <20260505152400.3905096-3-dakr@kernel.org> <afs3Mz8J9oOeqF34@google.com>
 <DIBMXPC3ZKIA.1UQORYD223AY6@garyguo.net>
 <DIFBME3GXDC0.14UHJTPD6TTAE@kernel.org>
In-Reply-To: <DIFBME3GXDC0.14UHJTPD6TTAE@kernel.org>

On Sun May 10, 2026 at 11:39 PM CEST, Danilo Krummrich wrote:
> Technically, this would be an additional driver match criteria, i.e. the =
name
> string in struct auxiliary_device_id *and* the asserted type of the paren=
t's
> registration data must match.
>
> Given that drivers can match against multiple entries in the auxiliary_de=
vice_id
> table, we must consider that they can have different registration data ty=
pes
> (depending on the specific parent driver that exposed the auxiliary devic=
e).
>
> Thus, I don't think we can solve this without a runtime dispatch (over al=
l types
> that would need to be listed in the ID table) anyway; and having this dis=
patch
> in the child driver - essentially leaking an implementation detail of eac=
h of
> the parents into the child - does not seem to add any value; quite the op=
posite
> unfortunately.
>
> (OOC, I hacked up the statically typed version -- I think it turns out OK=
,
> despite the fact that it still leaks the parent's registration private da=
ta type
> to the child, which I dislike, plus a few hiccups with the generic device
> context infrastructure. But as mentioned, I don't think that's an option =
in the
> first place.)

One additional note: It would however be possible to support this as an
additional special case (it is special implementation wise, but usage wise =
it is
the common case) when there's only a single entry in the match table, and
otherwise provide the option to fall back on the existing runtime dispatch.

That said, I'm still not convinced about exposing the type and whether it i=
s
worth the extra complexity on the child driver side, but I'd also like to
further consider it as a potential subsequent improvement.

The draft implementation I mentioned previously can be found in [1]; it is =
based
on top of the HRT rework, as it provides a much better picture of how it tu=
rns
out eventually.

For now, I'll pick this up as is.

Thanks,
Danilo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Dpoc/aux-typed
