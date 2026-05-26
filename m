Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4104A0C;
	Tue, 26 May 2026 00:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779754173; cv=none; b=MCneZdLk370kGXvAlhuxWcU2Jgw7Rq/RToAGI6ah8rj6esmQy4M3WqiVHYjDWsZhS/wSGjKMq1cfa2BGYxgKz7wChi+VZJH4fjNF5nOahOgqssYQ3VzsYJDH+MuDopMdKkmjn4zwxjZ3QCOqCWYtAFg/fWOOe3Cxz/bd3sajgtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779754173; c=relaxed/simple;
	bh=CWdlphKI9qWp/n4z+GrhKVt67scaW1f1zD7P24/6r8o=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=aUH7kA6ssezfHBQi2hvGqZUAQ2Lh2D/afQymTnAJvaNd3XpZIMBmdEhi9Lm7KaukUbPqavxNrn0JSOffu1KI1OXTBQyD6W5X6bnCUyQDXCzKuKK/f1aBtAcDPsn4/kupnsIOKEODSSc+lCbKZ07HTW4x//4afGwQ31hVZ7MEk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NxYPSGyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NxYPSGyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A34C1F000E9;
	Tue, 26 May 2026 00:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779754172;
	bh=CWdlphKI9qWp/n4z+GrhKVt67scaW1f1zD7P24/6r8o=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=NxYPSGyK+scSwCvYSQ83YKclQFBszPVoyk4p3QQeevLs29TGudUyGQxQ4J+rXoPgu
	 KJPCdfhEoxWkzd6hLxpU3diHOC+qrKiLWiyukoUUJ+QE+iHDqBMtPdu5DGQnKQ69yk
	 23Ap38q0CnASiP3kHS7C2KWYq3md8KihdibzpZ7AWCDYT29ZmRf6kT32j3Xnp+Ruo/
	 usCG5cfF21Ku7czvS/oekFoLeTr6JgvBKd3oPKppANW7waCHDWvVFxXZxqdl8i+xFr
	 qNJilkPHxAcpLW8yMmuo2s5UBWi8klM+mhPtg4lt9Z0Euef5/GPrTnETtOGhcb0+DD
	 84dEVD2FZJkXg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 02:09:28 +0200
Message-Id: <DIS675W2MEZL.1WSYBOKK71BQ3@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
References: <20260526000447.350558-1-dakr@kernel.org>
In-Reply-To: <20260526000447.350558-1-dakr@kernel.org>

On Tue May 26, 2026 at 2:04 AM CEST, Danilo Krummrich wrote:
> Devres::new() registers a callback with the C devres subsystem via
> devres_node_add(). If the Devres is leaked (e.g. via
> core::mem::forget(), which is safe), its Drop impl never runs, and the
> devres release callback will revoke the inner Revocable on device
> unbind, which drops T in place. If T contains non-'static references,
> those may be dangling by that point.
>
> Add a 'static bound to prevent storing types with borrowed data in
> Devres.
>
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Cc: stable@vger.kernel.org
