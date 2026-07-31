Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD9B3074B1;
	Fri, 31 Jul 2026 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488971; cv=none; b=k+VU3TRyZYSvhXRPeAjPCrfCr655nIbAq1hob0HWKlAi8MWAiPJsHDdyce0I9ovht8KJ5MWC43SPdXA3DFJnK4thkxZutgiv6mHzEqqMl48zaoi92K9/yut/eSmbipek58iTd/NaNWHVDwevq5zvj1EMkiowt1l4rv1LF1/DQlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488971; c=relaxed/simple;
	bh=4rens0ZA/T+JhkrUp6nNTkIJm6944i7ZbJ08ctXY5aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LETC/UwhQDSMchhqj4rdP4q5RCCMFE1zAMc7Qhhn62CBwEAkePAwrCLdJ8EDM9NYhdcsYO3z/R+6ILcRAfJRvQmK7vEF/b5nj2pyAeMy1BXXQlJWvL7V4I36PpO1WVfGjOvgq6ZIeKAx8iPgVu+enxE2Ss6HYvmGMKvomR0q8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o3b7BR/z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o3b7BR/z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3811F000E9;
	Fri, 31 Jul 2026 09:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785488970;
	bh=zX+z9dcrkjO1TRmNkSEn1GHLFbN+cb+XoGq4s1FWV6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o3b7BR/z5kX5fdXwpmP9UEwqkfX1d3Bk1b27fV89peS9Alg8Fa6qHiGCWCGH1lZkd
	 IeZ8J9nkpPBJevb6y1IxnLL/3BU4cqERYIUQosOAHE9VunH29iIZbPCpr5r0zr4r6O
	 roDLfmBEOH3fMRqvn2PqBj6xazaMuj0nZWBm0Vrk=
Date: Fri, 31 Jul 2026 11:09:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: josef.ippisch.dev@mailbox.org
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v2 0/2] rust: debugfs: migrate debugfs traits
 requirements to zerocopy
Message-ID: <2026073158-action-prissy-bf5a@gregkh>
References: <20260728-migrate-binarywriter-to-zerocopy-intobytes-v2-0-0a4ec1d3ead4@mailbox.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-migrate-binarywriter-to-zerocopy-intobytes-v2-0-0a4ec1d3ead4@mailbox.org>

On Tue, Jul 28, 2026 at 07:31:18PM +0200, Josef Ippisch via B4 Relay wrote:
> Migrate `BinaryWriter` and `BinaryReaderMut`'s default implementation's
> requirements on T from `kernel::transmute` traits to `zerocopy` traits.
> 
> This is part of a bigger migration from rust/kernel/transmute.rs to the
> zerocopy crate, see also [1] and [2]
> 
> [1] https://github.com/Rust-for-Linux/linux/issues/975
> [2] https://github.com/Rust-for-Linux/linux/issues/1241
> 
> The crate zerocopy was introduced with
> 
> c37398010a05 rust: zerocopy: import crate
> 
> This introduced among other things the `FromBytes` and `IntoBytes` traits
> that, when derived, do better checks on the actual requirements of the
> types they are implemented on than the existing
> `kernel::transmute::FromBytes` and `kernel::transmute::AsBytes` traits,
> respectively.
> 
> This is my first kernel patch so please let me know if I do anything wrong
> process wise or regarding some other aspect!
> 
> I noticed that we could probably get rid of the `BinaryWriter` and
> `BinaryReaderMut` implementations for `Vec` altogether if we implemented
> `FromBytes`, `Immutable` and `IntoBytes` for `Vec`.  These are already
> implemented for [T] after all. What do you think?
> 
> Suggested-by: Joshua Liebow-Feeser <joshlf@google.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/975
> Link: https://github.com/Rust-for-Linux/linux/issues/1241
> Signed-off-by: Josef Ippisch <josef.ippisch.dev@mailbox.org>
> ---
> Changes in v2:
> - Addresses Sashiko AI review's comment about also migrating
>   `BinaryReaderMut` to zerocopy to not bifurcate the API requirements of
>   debugfs/traits.rs.
> - Do not `use zerocopy::{FromBytes, IntoBytes}` as they are part of
>   `use kernel::prelude::*`.
> - For some reason sending v2 via SMTP server did not reach the mailing
>   list.  I apologize if some of you receive this twice now.  I did not
>   mark this RESEND because of the email never reaching the mailing list.
> - Link to v1: https://patch.msgid.link/20260719-migrate-binarywriter-to-zerocopy-intobytes-v1-0-27ed30512e75@mailbox.org
> 
> ---
> Josef Ippisch (2):
>       rust: debugfs: migrate debugfs traits requirements to zerocopy
>       rust: debugfs: remove unsafe blocks from traits impl for Vec
> 
>  rust/kernel/debugfs/traits.rs | 41 +++++++++++------------------------------
>  1 file changed, 11 insertions(+), 30 deletions(-)

Always nice to delete code!

now queued up, thanks.

greg k-h
