Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09647CA9E;
	Thu,  6 Aug 2026 15:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031255; cv=none; b=tHmBP54CbeuGefkrEOK2L4BtNVJys4oS/A6BxpnZvnegyLZw2hGOBxa8wTcm9sB1z2TaDbD6+YSULNl3IcoOmlF2HWflXnvSKhiV5D6nAQsWtyqaePzlub0PjhRN8aPV4ESobCYt6Kpk93Qdwy6Ydwbyw7aXUjcyeq22uLtaz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031255; c=relaxed/simple;
	bh=muDwzzn9UV/m6uBLB6bapZR7YmEITPaEzs60CwRPK1o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cEZQNBvFwJorDAONFjWnLJ+tHXBLWkbJUQ+Gu9lwTy8ax1kfIc3c9vz+XvJRkeFshOxivGlw6qxcoIWyd2gr+OImYqyuqtAQ+GwVWnpKOKPL/FougnBsKUOQMI3II48crvaG7FAHm0SimQbdSxLyMATNPB+bigpRu54/TEFZxKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YV2A4LQP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YV2A4LQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F0F1F000E9;
	Thu,  6 Aug 2026 15:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786031253;
	bh=z1A3EmIIWJRb0d1uGxhHbE0Quaai0/yh/grVQbttDBI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=YV2A4LQPx81u0J/lp+6T7yqPT2VGRhug2TsHjfhvR9xlc6gCRfdO+YLvMwuuSzTnU
	 Zqu3mdKi8ljXbf6yjGC+vr1vvq/9artgRjGLNjpK/dt6Lz9fxGa3Pik5rNDISGseha
	 CGqt9ynh8KHFF+EKdW/OaRyhFNDTYwvpk6aJXqZqND6Y6i+eOHlP/8GE1oFBv4tG5h
	 iKRMt8968tP5nC+SugYa/9TjDU6z8z5ImFY/GBW3eTFeIl5azhdjPTx+1PiFOZy+Hw
	 bxb1nPvzAR2AT9xyT/PX8/U9cNx2NfUtyyGPClMp5HijDbRu/OPVLF1Nbc4Jr4Voj0
	 3jqpo6apFapow==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 17:47:28 +0200
Message-Id: <DKHZ8KNRT5WY.2GPNFMJGZVEX2@kernel.org>
Subject: Re: [PATCH v2 1/2] rust: io: gate ioremap/iounmap on
 CONFIG_HAS_IOMEM
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260805212920.1996937-1-dakr@kernel.org>
 <9fbff830-d1b3-428b-b7b2-205eff41b6d5@app.fastmail.com>
In-Reply-To: <9fbff830-d1b3-428b-b7b2-205eff41b6d5@app.fastmail.com>

On Wed Aug 5, 2026 at 11:39 PM CEST, Arnd Bergmann wrote:
> Can you also hide the actual I/O accessors in this case?
> While s390 without CONFIG_PCI still provides the asm-generic
> version of those, that is technically a mistake, and it would
> be nice not to.
>
> I'm guessing that there is enough kernel code that still expects
> these to be present for C, but if all rust code has the correct
> HAS_IOMEM dependencies, it would be cleaner not to reference
> since there is no correct way to call them without ioremap().

As things are right now, I think something like in [1] should work, but we'=
d
also need to cfg-gate every single doc-test that uses I/O primitives, which=
 is
slightly annoying.

In any case, I'm not sure it would be a huge benefit anyway. Unlike in C, w=
here
I/O accessors operate on raw void pointers, the Rust primitives are typed. =
So,
users have no way of actually calling them without being able to obtain a
mapping in the first place.

- Danilo

[1]

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 1edbc274951c..29120ea9d7d8 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -19,7 +19,6 @@ __rust_helper void rust_helper_iounmap(void __iomem *addr=
)
 {
        iounmap(addr);
 }
-#endif /* CONFIG_HAS_IOMEM */

 __rust_helper u8 rust_helper_readb(const void __iomem *addr)
 {
@@ -108,6 +107,7 @@ __rust_helper void rust_helper_writeq_relaxed(u64 value=
, void __iomem *addr)
        writeq_relaxed(value, addr);
 }
 #endif
+#endif /* CONFIG_HAS_IOMEM */

 __rust_helper resource_size_t rust_helper_resource_size(struct resource *r=
es)
 {
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index d4063ee41200..d91fc2e4ae9b 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -728,6 +728,7 @@ fn io_addr_assert<U>(&self, offset: usize) -> usize {
     }
 }

+#[cfg(CONFIG_HAS_IOMEM)]
 /// Implements [`IoCapable`] on `$mmio` for `$ty` using `$read_fn` and `$w=
rite_fn`.
 macro_rules! impl_mmio_io_capable {
     ($mmio:ident, $(#[$attr:meta])* $ty:ty, $read_fn:ident, $write_fn:iden=
t) =3D> {
@@ -746,10 +747,14 @@ unsafe fn io_write(&self, value: $ty, address: usize)=
 {
     };
 }

+#[cfg(CONFIG_HAS_IOMEM)]
 // MMIO regions support 8, 16, and 32-bit accesses.
 impl_mmio_io_capable!(Mmio, u8, readb, writeb);
+#[cfg(CONFIG_HAS_IOMEM)]
 impl_mmio_io_capable!(Mmio, u16, readw, writew);
+#[cfg(CONFIG_HAS_IOMEM)]
 impl_mmio_io_capable!(Mmio, u32, readl, writel);
+#[cfg(CONFIG_HAS_IOMEM)]
 // MMIO regions on 64-bit systems also support 64-bit accesses.
 impl_mmio_io_capable!(
     Mmio,
@@ -843,10 +848,14 @@ pub fn relaxed(&self) -> &RelaxedMmio<SIZE> {
     }
 }

+#[cfg(CONFIG_HAS_IOMEM)]
 // MMIO regions support 8, 16, and 32-bit accesses.
 impl_mmio_io_capable!(RelaxedMmio, u8, readb_relaxed, writeb_relaxed);
+#[cfg(CONFIG_HAS_IOMEM)]
 impl_mmio_io_capable!(RelaxedMmio, u16, readw_relaxed, writew_relaxed);
+#[cfg(CONFIG_HAS_IOMEM)]
 impl_mmio_io_capable!(RelaxedMmio, u32, readl_relaxed, writel_relaxed);
+#[cfg(CONFIG_HAS_IOMEM)]
 // MMIO regions on 64-bit systems also support 64-bit accesses.
 impl_mmio_io_capable!(
     RelaxedMmio,
