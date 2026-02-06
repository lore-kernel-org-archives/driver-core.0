Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565932FF164;
	Fri,  6 Feb 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770386938; cv=none; b=lOJx8B9sq2YttjkWn0y+abG62jALNvV2ORTTchR/h24GbsrCPgVe/TP2q9dW9oDH0tPR0UCVYOyRqQs8fv9RQ5/sPU+UwomVRwLvvRjN0JXFR164v6LOU+usYYcS6EhltwQLZ5ICnUmdcJNT+kQNz3RMyWlBMTYq18e4ihPgEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770386938; c=relaxed/simple;
	bh=ihqUWaIxEMxGhChc0YKeFMkqg2LvL2uNC1T6KGdTj2U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=k1RLKacVtMeJ0LGcaNIy59NqwBwcvx5uE+XuY05w3EgVfJtXaKQCUjvPZzUkL5P7kOoohCXtMN8Kw04gWwg2OCPYBUs5YLrpd4l99lDGslhnNTRg96ndjSJMRs4+1BQzZvYtyzs+V4cDQK9l5Mzn4H1zhBqPLIkSouvv2Ebre9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NN9UVqYS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NN9UVqYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6383DC116C6;
	Fri,  6 Feb 2026 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770386937;
	bh=ihqUWaIxEMxGhChc0YKeFMkqg2LvL2uNC1T6KGdTj2U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NN9UVqYSlyEF3k5l+zQk4vYXQm/ylb1flYuqCuPF8JD8qC4zZkVpWLB1xTbhHOHar
	 Last0xDZGc5tHV+47eR/aMb2EOV6V8pq2illegQl5EkZov9CevJcpJRULxuAntOGuI
	 QpOepAwlJ22h9QxZ0wKPGCMmqthQIA9uhDytj/T10dJ4Ui5WAxTIkrCz5FMfl09cZ9
	 25GKnwwO32HkkqWqkE0JdNoluuRKXRm4Zn+0082VG6/FP9kml0Mg2GgxC/cN7SvLpI
	 1mjh/HdK+3TsRyBs+Cj8cGEl7a1tIFH0Iavz+2dH+W7MmnTnK01+Wpr11RhDPWM7yR
	 dH5VQzDVx8apA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 15:08:54 +0100
Message-Id: <DG7XSHZ4G0QN.1T6T20R4GCF52@kernel.org>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and
 devres_node_add()
Cc: "Greg KH" <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <ojeda@kernel.org>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
 <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh>
 <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh> <aYXtwXYAELSIoxXE@google.com>
In-Reply-To: <aYXtwXYAELSIoxXE@google.com>

On Fri Feb 6, 2026 at 2:33 PM CET, Alice Ryhl wrote:
> So you'd need a non-generic Rust function with #[inline(never)] in this c=
ase,
> and have Devres::<T>::new() call that function.

Then we should probably figure out how we can teach bindgen to apply
#[inline(never)] for functions that are not exported. Because I don't think=
 we
always want to write such wrappers by hand.

	#[inline(never)]
	#[allow(clippy::missing_safety_doc)]
	unsafe fn devres_node_init(
	    node: *mut bindings::devres_node,
	    release: bindings::dr_node_release_t,
	    free: bindings::dr_node_free_t,
	) {
	    // SAFETY: `devres_node_init()` inherits the safety requirements of
	    //         `bindings::devres_node_init()`.
	    unsafe { bindings::devres_node_init(node, release, free) };
	}

(I could probably abstract it on a higher level, but it would still create =
quite
some (unsafe) churn.)
