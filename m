Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A33FEB32;
	Tue, 24 Mar 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774364617; cv=none; b=ZPsK0VQoeW4kKdP0SR8trjBpIgqKBLvMgh6IpehsND9WgMgl6JL4BdOHbtiIJUrxkmVgZIW45NdYJeFWAZ17YYkh8EplG/pmqbbXNKrfhp2g+/pBll2x8GTyG5wx0sQ4QCXSCN4tL4IWnMh4r5SL0RCRyNLJK/WWgZLkobIrA3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774364617; c=relaxed/simple;
	bh=xiTNI9ESXiY/gIDionTm8i92obzoKVc4cZW7D08FQrI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=PVJCZVppvIQ27ZS5ZpUzBIc54LvmlYEm9Gb2Dq9J/3IERCZkFaWTPdWjMjweav+QGH0NPnbJQHY0yq0RAGKeuDMiaU85M5L01eJlm/NTt/xv965TSrLG/VO+IOeFeIbOujV+qcB7+nxfMn+QMqM5u2YGH1r4KlFhVOsrn3aS0uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz2mfMF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz2mfMF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 916A4C19424;
	Tue, 24 Mar 2026 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364616;
	bh=xiTNI9ESXiY/gIDionTm8i92obzoKVc4cZW7D08FQrI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Dz2mfMF+MZN7ixyg7Akx23BQ1U6iqlTQhAc5HVNp+Dhxrz1sK/DDm/yUJgLij6kvE
	 Qdln+9UIL2JwthJyfq234PrdCE5gKKEItlQT7CdHVXQD+evdVAD7N9I5H7zPnL5xgA
	 qCprtiTRfxyNZ7wUThBQ0a8HiAsOjas8HWBX2KiLeAdi0wu+BvTu9nX6fW1PK/JW3d
	 RH77D3Tg9EPVsOFE9YoKPqinCgRKNLteGNk5dj0yzRFE/SmGN5BsOUPbsJ5rkKmTnh
	 ifIO1XmXcBbxUGKLVn8CJbLGg8s7dpAsJnctccV8UZUWnrfuAv6lq71J8gDLWaiDb+
	 xpBBmMQlh/LXQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 16:03:31 +0100
Message-Id: <DHB3RDNDS08U.A75EZUOMO311@kernel.org>
Subject: Re: [PATCH v2 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
Cc: <aliceryhl@google.com>, <acourbot@nvidia.com>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <4yknLBbwY93Ty2ltbpxjHgto-m99xkoTgDlKv8cJTK2tbFL0_V6eQDjwbbXI70M6uMKT6RLRxBoYR_XeymmnHA==@protonmail.internalid> <20260320194626.36263-6-dakr@kernel.org> <87y0jhpbsp.fsf@kernel.org>
In-Reply-To: <87y0jhpbsp.fsf@kernel.org>

On Tue Mar 24, 2026 at 3:00 PM CET, Andreas Hindborg wrote:
>> +    /// Same as [`Coherent::zeroed`], but instead of a zero-initializat=
ion the memory is initialized
>> +    /// with `init`.
>> +    #[inline]
>> +    pub fn init<E>(
>> +        dev: &device::Device<Bound>,
>> +        gfp_flags: kernel::alloc::Flags,
>> +        init: impl Init<T, E>,
>> +    ) -> Result<Self>
>> +    where
>> +        Error: From<E>,
>> +    {
>> +        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
>> +    }
>> +
>
> I think we are missing an array initializer for `Coherent<[T]>`.

This method is already compatible with arrays, T can be an array type itsel=
f,
e.g. T =3D [MyStruct; 5].

For instance, the diff in [1] should work.

> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks! The patch series has been applied yesterday, and the branch it has =
been
applied to is immutable, so I can't add additional tags.

However, the Link: included in the patch still points to this conversation.

Also note that subsequent review is still valued; we can always send follow=
-up
patches if required.

Thanks,
Danilo

[1]

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 129bb4b39c04..3d3ffc21ea77 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -22,6 +22,7 @@
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
     ca: Coherent<[MyStruct]>,
+    ca_init: Coherent<[MyStruct; 5]>,
     #[pin]
     sgt: SGTable<Owned<VVec<u8>>>,
 }
@@ -76,6 +77,15 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo)=
 -> impl PinInit<Self, E
                 kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.=
1));
             }

+            let ca_init: Coherent<[MyStruct; 5]> =3D Coherent::init(
+                pdev.as_ref(),
+                GFP_KERNEL,
+                pin_init::init_array_from_fn(|i| {
+                    let (h, b) =3D TEST_VALUES[i];
+                    MyStruct::new(h, b)
+                }),
+            )?;
+
             let size =3D 4 * page::PAGE_SIZE;
             let pages =3D VVec::with_capacity(size, GFP_KERNEL)?;

@@ -84,6 +94,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) =
-> impl PinInit<Self, E
             Ok(try_pin_init!(Self {
                 pdev: pdev.into(),
                 ca,
+                ca_init,
                 sgt <- sgt,
             }))
         })
@@ -98,6 +109,12 @@ fn check_dma(&self) -> Result {

             assert_eq!(val0, value.0);
             assert_eq!(val1, value.1);
+
+            let val0 =3D kernel::dma_read!(self.ca_init, [i]?.h);
+            let val1 =3D kernel::dma_read!(self.ca_init, [i]?.b);
+
+            assert_eq!(val0, value.0);
+            assert_eq!(val1, value.1);
         }

         Ok(())
