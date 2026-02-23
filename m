Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918B3783D5
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882056; cv=pass; b=hXfzIfUngCKKE+Rovb7kgNSIEM6A2tWWnkNpsIIriT64yjPpxsUQp6b5DlOJkuaDllNTWJY48sIyK7OX4r0NyL/XaZqQUA3FV66RmwMTSMB5oPqbw88lQvg2LPCTHwAhas1jw7UTBCTLaiouHeCHoP80dOfK3Ko1IV3Kly8m4eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882056; c=relaxed/simple;
	bh=didkkmMeA554Dxj/ZdCbtum+QUKQIqmhPv1W1r9HzYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9AUfmbrzNvBXka4iNIHG0siCDqpAv7Zd38LAL03/XWhkUQgp4ukG+DbKrkzowNsH/hqWlt4DfMY5bZLf0bWO/3w+YKygtHBsZj8oyl0nczv9kOh6Qx6az2Kg5CqaBXIDJXCPhD2cxxTwJM8ypg84QDcv1p7ptVHhA0itrvJ8+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t47EGx2d; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t47EGx2d"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4376de3f128so3439178f8f.0
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771882053; cv=none;
        d=google.com; s=arc-20240605;
        b=N1m4RqafFgRqAyrmntSDbygEUo9kV5vTBjDR5hrR9KUzk7bVxUmKwN48MNC1szxm5u
         +vYUSwOWMCp/1q+fQdAuOPGHC/TboSBPMF/UoQy0nCZJqc/5+MrKa06VZAq8YXFazDS2
         QYu9vTjEF+lNOFlps6is2XOq6Jc991sKRyhhb6VXfxtPSrSbkJF9C1vgHXeSh8V+ysEb
         vUV5di3Og0c8OC3HCp8wcy6zovj0+qmtlTRk6Zq3QHQblgganDNKi4AEG7js86VihzuS
         sw3+2q6/A4GxODejRwBseUetaWfqL5v1L75dNBzftCTS8mMrEZGDfcDa5Jh4qtmw8SqL
         eeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TLtkDhp5yvjNfBzirqBO5/FyIhc8TMr7bRoRTvtMt0=;
        fh=XHEc/d0F45IdW0Jw5l0QWfIhnnSw7WJC1SAzIeDj/qQ=;
        b=XckvY7UXar+MpXRZQGMyBRdC9qO2p3uG2BuUzJg6/SzQzXu2yRbsyRhnitVZ4zweBk
         SLkAF2pP60KcNrgpnGpz0VjF24u/ovB3kjDy3YZF0jcRXzhjQn2QV79YLOMwgFg+NxjJ
         Bva6c1e71XvIs3n7VtT3esXXe48fbiKs6k3yMIFxM4TBO6eW4Cd53pnSPpzM8es8Lgad
         aryve8cekE+GH/gutAYuymXNx9CyBmuqS6GglrpSPotn0UxWjZPmTky+ghNrbyZFHFvz
         g/f3g2/gTK+7YVwW0u5w1HAISNgiLoIL21abeTRP48CIAKL5pEfYwjRpYMAOFTVvyeGR
         Kz4Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771882053; x=1772486853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TLtkDhp5yvjNfBzirqBO5/FyIhc8TMr7bRoRTvtMt0=;
        b=t47EGx2d42cDAfX6q9ze3hzXF4bN3AaYR0s0tDrf2k4xlrvrIg4EdEEtTVzDzQfSvu
         DJwoj8bPuTqz2s+Thwd4spmavDT6XiekfqAjKDRdcvPJbss919bD6QONFxv38dyO3w53
         jpK6sc4sT1ZcZTsGtyo+ar9ZA0HH3b7lzgY7uwoyy8kHHJiH/xPDXiBBSsFBnpCfIf0K
         nIeDkzHu/pgZtj3+znqA6bLhlx4GzV82LD6nH8uZ5tconhf1iaDwlQl5+GJvV39UlI5e
         3WBC+iiwP6DodJbaxwKP9C69sBZfdp+w1stKk7LpmzevDA+sG3W4P25cxHojA+G6Gr2W
         lvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771882053; x=1772486853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TLtkDhp5yvjNfBzirqBO5/FyIhc8TMr7bRoRTvtMt0=;
        b=mePBwTXAjQM5ZTFFO1zVt3AlqUecdZ+HSSwvILMeTb/V7i4MX31tD9Bsq54gNObaw3
         jDRzuXacWZHEfARilQyPRzrDtjAWsVLFnDPb0YLWKz9R0rsCq5dp8PvNgeJYvyM9t8rT
         43O3aVFiusq5Z9RM5Di6M8EzxrDXT4L0qaSD2T3TQ8QhGlSSAu+Mnt5n8bnPo155oAGi
         XS3+/Au2+FqsBmZduabiiHK+4vwfcTUXppySncgEve1ClUgOWOm/8YocKrtx5XUFpG9J
         Tboo4Mj77tP3uwvc8ftu1c4PtT5BDlilxu0NbU2MFV67Eso6F/X+8310glGyPKzNTkJx
         9ohg==
X-Forwarded-Encrypted: i=1; AJvYcCUcSoYaQq+Lh7bbmbIeMipqheykkOMqS2TZb5BmfNFeJFZzBPxmXpdrlUHQoIOlvQPXoevxl9ur8QN7SA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwefKllnhB4PSpU7EXy+F2qksIYfealAk34Ex2wF+K2XwUwAVAK
	xnSjHc0JyxSHF9/4L4kgI4hThqH64U/pmQz+Nmuf2ilrUeI2/7xC3hMmNsFWFyBCRBIJ2/pYZHb
	TrvUV2zvC4IqY5nzv9AM5NoY6CMnlhvnAqd8o6bkM
X-Gm-Gg: ATEYQzxCX+H/dCXjhrav3qTYbz6k6suXhYUxycuu5qnqNfEsHgkgnexkCwqT8x5gYf0
	ukyudGjEi5PA3UinOW9KfTJVrRDtfY9qjGXXOyGzTe0WY5l/H/zK0ZWm7IGH5vYQWcgbGgWFSNU
	QNl+SWuH31CSByie4sTAkVfRbWe53WWoTLtEP0e2sp5tTkH+0DDwjoY6GunM2G9B2QsqdCferhS
	XGCDAEmGtuMvke4Gf7YDTjo0gynMHuGzzTRc/Q4cv5zhqxL06C6NKHmJ8w37nrdkXwECxNGspuc
	z+RIm8acPKp2wn6pere2AMlvHFORVHJ17YTxDQ==
X-Received: by 2002:a05:6000:26c2:b0:435:a8e7:62de with SMTP id
 ffacd0b85a97d-4396f18f942mr16385137f8f.58.1771882053091; Mon, 23 Feb 2026
 13:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216131534.65008-1-dakr@kernel.org> <aZMaFhvZWiknu8UK@google.com>
 <DGGF97AAA3HF.3DSNMFJTCNI9Z@kernel.org>
In-Reply-To: <DGGF97AAA3HF.3DSNMFJTCNI9Z@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Feb 2026 22:27:21 +0100
X-Gm-Features: AaiRm51eKGoP_MuYqn_kp-y0-YSen_uHZo47Hlce9OFpI8_rE8a7FBFjXKSXZpk
Message-ID: <CAH5fLgh6MvjN3AHCVUROeYFWr+0CPxoYcgFfa99wu1EaNJAn-g@mail.gmail.com>
Subject: Re: [PATCH] rust: io: macro_export io_define_read!() and io_define_write!()
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, bhelgaas@google.com, kwilczynski@kernel.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, zhiw@nvidia.com, acourbot@nvidia.com, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 2:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Feb 16, 2026 at 2:22 PM CET, Alice Ryhl wrote:
> > You should keep these re-exports (as full `pub`) so that they can be
> > accessed from kernel::io. Exposing all macros from crate root via
> > #[macro_export] is legacy approach.
>
> Good catch!
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 58f464cf5efd..e5fba6bf6db0 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -249,6 +249,7 @@ macro_rules! io_define_read {
>          }
>      };
>  }
> +pub use io_define_read;
>
>  /// Generates an accessor method for writing to an I/O backend.
>  ///
> @@ -305,6 +306,7 @@ macro_rules! io_define_write {
>          }
>      };
>  }
> +pub use io_define_write;
>
>  /// Checks whether an access of type `U` at the given `offset`
>  /// is valid within this region.
> diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
> index 2c8d7d00e54d..fb6edab2aea7 100644
> --- a/rust/kernel/pci/io.rs
> +++ b/rust/kernel/pci/io.rs
> @@ -8,14 +8,14 @@
>      device,
>      devres::Devres,
>      io::{
> +        io_define_read,
> +        io_define_write,
>          Io,
>          IoCapable,
>          IoKnownSize,
>          Mmio,
>          MmioRaw, //
>      },
> -    io_define_read,
> -    io_define_write,
>      prelude::*,
>      sync::aref::ARef, //
>  };
>
>
> (I'd still keep the `io_` prefix though.)

With the above change: RB
