Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9132B124
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935382; cv=none; b=HuiejI8yPHkl322Ts53yfbPgMjUw5crsL/q0YsRvW0UgRbUwzlVBIhHSLDtd6RdfKxdQyyQEpMikp0ktjdObuHlGRATn00GdQbIvXEpdC6jGxfAQHn88r7rz/AozD+zRiNjL8UArnFFbobEcJG7eMaDkj2KncCcYfXa5F7kaFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935382; c=relaxed/simple;
	bh=LuAuDPS2cefO9msY2v5Pfkr1UDB1Mok0w0xGu74ON4s=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAHFoowH6aVIisc14I6663pHYu0mNbFvqwoOYlZhsb7ErVGm+HwINnFa4W9FyHjM9A2AM6HO0wlJdw2/iDTpOzCLc5JT+9tFH84EnolDOrb/9w2nIzHrTcZKsdNTMtpbKzsahG6mig6I5E6wRJVMUF5p3AOPvs2Tt9SdAmnfYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/LkLCuY; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/LkLCuY"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e053987001so44135877b3.0
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780935379; x=1781540179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufh2a1IBnVjLV88sQqOB01oSzKTb2+dLoZi3jebbixU=;
        b=D/LkLCuYsllDKND7In7Kct10sPZk/+agbu0Rm4Tt5OgUwVhVGO8DM/UVuzrYz1kFJl
         8hhAC5ISmPFkyIFZ8i+bKiO12h3eVFdQdcjCx0L2I9E6GUQtEcIa8w5p1yRBcp1pQvbH
         vBgfAlVlkXiPFS9g3GBQrXI3DZIMNj79tFkTgBtPp8YsCKYJ7+pDovfXoW7RGWWKk0ug
         iNixqaPudP7ea6O1d97EJj2Q4ZryUagdg5irVUmK29YuDQ1WBkXWNY8q6cWQzU+tsuA4
         64cSscRVv5Y15EKNlWLBr1MhDkkcpZ0gd7fgxfwI4ARWmawpuXCJ4/tkYBWSaXYvREXp
         XV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935379; x=1781540179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufh2a1IBnVjLV88sQqOB01oSzKTb2+dLoZi3jebbixU=;
        b=U4kVkZhYsjae2Ra1RUFfa/p4LVUKZuYiaZ7QzTA2ECxDnOhWrvfilauauZWYBMZsnK
         D1LtwT8wfcYkCDlMrW53ihDYKE0G3ajP3r9oZAk0k5uvJCFYyZxkWgSFgSxtnbe4Ulj7
         DdsB/XI7q6OfXvpfVFNP2EAKicifXsZqLSU/2m/c91Q/6Y7hum4T+YVoOYfmV/BPsVY9
         tDiWaXJoAJr7ldh/eyhjD2I9czcxZi+PGzaVbajZE+0KKaGxo5p+rta4WMOaBopevWMJ
         begIRgZccI1EXwO1DqMsBXSirAtym4xh4BzFTWP5EByXHXNiliwcae18SI8WQzHPe9Mc
         uqvw==
X-Forwarded-Encrypted: i=1; AFNElJ/9o6gJ9efrX4W20ua0hCnFjbbv57rgJgvtAFCDfaDpMteUD0zxy/3nWOXlx9Uu6zUGIBbxgFu9UU08uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YywXvHyNcOWRomMxdJMWlwMiu7skcE6kWRErPySOKzG3/2WzNJf
	bL0MQMAqvCjQtsXzHBsj9ezj8wC8K0kH791wkbhM3CbgFRrXzWeR8/FI
X-Gm-Gg: Acq92OHCDJpTR0jciwXW5Gi5pFpC+uPslEP8Jfl0DEXq438JrNw65/Jxj8PkQx5wAMj
	u+WSGF5p3A4IYjIQ2rHQuyQQVJmtlv9MM9Zj/ZhirK9dPGfaTS+8nWtQZkl5PM1DscIavb6/DI+
	MsN+v3A6JYko+I7EhncFYqbef5Rf7tzkvRjI/xXa2/PXQ/VTxeTnpNVWUMGQNCkltEmgjsxfHVu
	/VVbsBy+vnS+8VeW6ZyPfzBR3m8yJvxWfwkNcLReSD2xP7bNQ3NOARmuYkVGp/WWqOQfLenyzrI
	KZlOeGAj2TFYUb25VIgsYfAzW+pWz0GDw4UgGToImQ+9qNNrtOo22tYGeLol7iVAac2zzhySet5
	CQTy8DcR5S+Z81J5pLHOUmox6t56vel6NbjHqwASiwpjJgmg6DmIPkUHd7y0s5qDMPNd50ifqXb
	pqdDkyGFAdnGGRVJg/zYqwU25ieltX
X-Received: by 2002:a05:690c:6612:b0:7bf:1433:8f92 with SMTP id 00721157ae682-7ed5028e59dmr109118667b3.7.1780935378548;
        Mon, 08 Jun 2026 09:16:18 -0700 (PDT)
Received: from localhost ([50.221.107.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7efb9b99e2dsm21305947b3.20.2026.06.08.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 09:16:17 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Mon, 8 Jun 2026 12:16:17 -0400
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev, driver-core@lists.linux.dev,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
Message-ID: <aibq0WVkvey9C4_W@yury>
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606-bitfield-v5-0-b92188820914@nvidia.com>

On Sat, Jun 06, 2026 at 09:43:03PM +0900, Alexandre Courbot wrote:
> This is the continuation of the `bitfield!` macro which started
> alongside the `register!` one before being temporarily integrated into
> it [1].
> 
> This series extracts `bitfield!` from `register!`, adds unit tests for
> the new macro, and replaces the `register!` macro rules with the
> extracted version.
> 
> I have removed the `nova-core` patches, because the Blackwell support
> that has been added this cycle (and thus not visible from `rust-next`)
> introduces more uses of the Nova-local `bitfield!` macro that this
> series intended to remove. If these new uses are not updated, then
> `nova-core` won't build, thus to avoid conflicts and/or build breakages
> I think it is preferable to merge them during the next cycle.
> 
> This version is based on `rust-next`, with [2] applied.
> 
> A tree with this branch and its dependencies is available at [3].
> 
> [1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidia.com/
> [2] https://lore.kernel.org/all/20260417031531.315281-1-ynorov@nvidia.com/
> [3] https://github.com/Gnurou/linux/tree/b4/bitfield
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks for the work!

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> ---
> Changes in v5:
> - Squash the fixup patches into the one extracting the `bitfield!` macro.
> - Remove the `nova-core` patches to avoid a conflict/build breakage on
>   -rc1.
> - Improve the unit tests per Yury's feedback:
>   - Use a consistent test axis where each test focuses on a single thing.
>   - Rename members to generic name including range for readability.
>   - Add test exercising `try_with`.
>   - Add test checking that unallocated bits are left untouched.
> - Link to v4: https://patch.msgid.link/20260527-bitfield-v4-0-e8821d4efbde@nvidia.com
> 
> Changes in v4:
> - Inline private bitfield accessor methods.
> - Fully qualify types in `bitfield!` macro.
> - Rename `RUST_KERNEL_BITFIELD_KUNIT_TEST` to `RUST_BITFIELD_KUNIT_TEST`.
> - Link to v3: https://patch.msgid.link/20260501-bitfield-v3-0-aa1076c3337d@nvidia.com
> 
> Changes in v3:
> - Split patch 1 into the addition of the `bitfield!` macro and its use
>   in the `io` module.
> - Mention reserved field names in `bitfield!`'s doccomment.
> - Properly order fields in the KUnit test.
> - Add a Kconfig option for building the KUnit tests.
> - Document behavior on non-covered bits.
> - Document support for signed fields and storage types (TL;DR: not
>   supported).
> - Move `nova-core`'s `bitfield` module deletion into its own patch.
> - Link to v2: https://patch.msgid.link/20260409-bitfield-v2-0-23ac400071cb@nvidia.com
> 
> ---
> Alexandre Courbot (2):
>       rust: extract `bitfield!` macro from `register!`
>       rust: io: use the `bitfield!` macro in `register!`
> 
> Joel Fernandes (1):
>       rust: bitfield: Add KUnit tests for bitfield
> 
>  MAINTAINERS                |   7 +
>  rust/kernel/Kconfig.test   |  10 +
>  rust/kernel/bitfield.rs    | 862 +++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/io/register.rs | 246 +------------
>  rust/kernel/lib.rs         |   1 +
>  5 files changed, 882 insertions(+), 244 deletions(-)
> ---
> base-commit: 72d33b8bfeacbfdccf2cda4650e8e002def036f8
> change-id: 20260408-bitfield-6e18254f4fdc
> prerequisite-message-id: 20260417031531.315281-1-ynorov@nvidia.com
> prerequisite-patch-id: 403e34bb92b42d3f31ed972e11896d18902585e3
> prerequisite-patch-id: 42ae775aa6762a9e28ff31c5f69a0b65a7b40dcc
> prerequisite-patch-id: 19b3e535962348f7627ede57ea829b34abda08c7
> 
> Best regards,
> --  
> Alexandre Courbot <acourbot@nvidia.com>
