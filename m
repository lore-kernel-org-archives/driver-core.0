Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C062E4E36C4
	for <driver-core@lists.linux.dev>; Fri,  9 Oct 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556128; cv=pass; b=SnTrNC0BAvng1xupC/IediBOFjo7rQ9VKKo+TWG+MR5Vmnd0YEZCqicnhJYgyXbJqv89Zy1ni9cI97GzLBCIi+0ofVRRl4bO8+AIvfmVybUbVfmYAvabtnBUdKAeWYyaliEzLwn4RhYehaU3Bmz2z4qWKYFqpyyyNsbAJnbEFAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556128; c=relaxed/simple;
	bh=qWzIGkUtyKb31Kv8Y/aUVxiTqCUW3kS34Fe3mwEbkME=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HPyrDwISnSfxEhGaZJ6RNFrdiABuADLGvoxv/BPwOsphW9q8u4cQPWVqpoRLddLBSGeJ3Kebdo4KzJ1NoG0Eud4bWT3qGzPraHo1dWRYXWne4QnSy0Nxlq3jGzRF1xBCByqWxk+ogMTg54Zb6zLBLHTiCPG9ps1lKKvWjm3fUgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Ud2kTanL; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Ud2kTanL"
ARC-Seal: i=1; a=rsa-sha256; t=1791556100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ieJhTY1/fVTNNenBOIQaRrSR1EtiO7w/SD+0eL9tYE6G3zIU2cdAZDef6XnH3cXW0ypI/8LRRD9qSudw6LI1S2pvOX8rwrt/KHM9nKYtfZ00SEqBJhJ6jT6xa3aVSEpUufbjDgdWcnqa1kqcjcI9ULMY7bOReNknEGiyKopkdtc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791556100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WIa/8inlxu6owg1iy8GQek7mIHexIT52zxxTW0xBXtY=; 
	b=dZ5t4WDrpV3N4ENvaSkR0mSZUmLbQ9FcQBhNlXTUogb1nZ+E37dHPCyz+OPmzEH2r5tfi9JMO40jwnhpmnbCp1LnB4L8H3CRLAwfRJEgjSiRNftKTgNv0AfKjWF8RPavTe3CNY3h8aix8xOkc7BBL3tUfd/KYnMDKD+Gf1d0EPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791556100;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=WIa/8inlxu6owg1iy8GQek7mIHexIT52zxxTW0xBXtY=;
	b=Ud2kTanLnTn70V47psbhImXgfgyN+noPAVAOTSEYigdMG9RoQ/2kaJFJBuR0yroO
	9MBibrhidvG2R90atM8CMRh1Hmi5+8qUWoT3YNOBuFaVQB6qKx4IvwrdQ3eR6DxqgSb
	FsI4TobHjlrFuqxzo0qg0aF+oFw896Y7eGzlJufg=
Received: by smtp.zohomail.com with SMTPS id 1791556094666375.33121900586843;
	Fri, 9 Oct 2026 07:28:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v3 05/11] drm/tyr: add user and MCU VM specifications
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260929-tyr-ioctls-v3-5-26955fb111d5@kylinos.cn>
Date: Fri, 9 Oct 2026 11:27:55 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Alvin Sun <alvin.sun@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <76CE11D7-94E6-4352-B2CC-F20DDDB451F6@collabora.com>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
 <20260929-tyr-ioctls-v3-5-26955fb111d5@kylinos.cn>
To: sunke@kylinos.cn
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External


> +    pub(crate) fn new_for_user(
>         dev: &'drm Device<Bound>,
>         ddev: &TyrDrmDevice,
>         mmu: ArcBorrow<'_, Mmu<'drm>>,
>         gpu_info: &GpuInfo,
> +        user_va: UserVaRequest,
> +    ) -> Result<Arc<Vm<'drm>>> {
> +        let mmu_features =3D =
MMU_FEATURES::from_raw(gpu_info.mmu_features);
> +        let va_bits =3D mmu_features.va_bits().get();
> +        let range =3D 0..(1u64 << va_bits);
> +
> +        let layout =3D VmLayout::compute(range.clone(), =
user_va).inspect_err(|_| {
> +            dev_err!(
> +                dev,
> +                "Failed to split GPU VA range {:#x}..{:#x} into user =
and kernel regions\n",
> +                range.start,
> +                range.end
> +            );

This should probably be dev_dbg.

=E2=80=94 Daniel=
