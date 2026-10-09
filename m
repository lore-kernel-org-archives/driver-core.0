Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2E38E5F9
	for <driver-core@lists.linux.dev>; Fri,  9 Oct 2026 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556013; cv=pass; b=Nh1//2zgGsAmOkcLf+a5wx0OXZILwxasDQ+0GpycqMO6JUku6bZsl1/gvytBhCuDd+YlpHWPZNSvxa+iC2geCBss+hkBk0bu1kaqofTv4TtoRHyS7iDfoEA85RUo5c5cpt7kt0G4H9S1nRsfh9tBzNxte5gf6+CIJNLnEPw0AGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556013; c=relaxed/simple;
	bh=aWOXbCnrbXIfWgAxqDYZ65Pw4Fe4BDmnTG2Q4yp2qHA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=op5Z7DEFZBfEIyHduaPLhiApcmbJ5vZfKeEhyDeZWOp0JZRuP0+WOlQacRx/VJJ/aUGktPabadDQ2ubcKvBi4HJI5R/aaToeMD8ZO08y+hPMsh1jAmAuooAyXoaF04/0frynMlUl1neE8HNthi7yGweprvfvvJBlD7it9tjO9EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=YcE87iNS; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="YcE87iNS"
ARC-Seal: i=1; a=rsa-sha256; t=1791555993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dBZkp5Twe6upjrDeahwfmMMf6SZsdkvvuBGuZc/tJAxKlYvl+hFf8X/3qeSzkHQ2c5V0SvxZasCUQzsihzbOaxGbfpqYxgUyiEB150jfccDhvmq1txyfWPSVTaUwW8SizmbNROo1IcNilN528uV4DUGueX/1PhTUGRpum91YYEg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791555993; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gxWCSlibUcjBFAFiXJUyGxqXSZ9QJBB0cw/YBhKRUoA=; 
	b=Qd+lCKrL3H7XcXSK9bG1COVJCnfrQN4nu20agVINopo5rdfaTUV3WlVO4CN/MldMvwpnWDg90P52kI2eu0CdR0Fvy72PD55CC5pLp8M7AYV2Uiluxcmx3K89iZqzE3Qgs8w69gc/5CNbZ0SSAU7INBXZ9Or4ACdvRLTSATXvT58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791555993;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=gxWCSlibUcjBFAFiXJUyGxqXSZ9QJBB0cw/YBhKRUoA=;
	b=YcE87iNSJx7kkyAUaSZ3oWYWkBXicUCZhb6cgpKGTc/+5rONc/ZUbDhdKdlATZu5
	YHlnuhBzVFSn1s4SsGntDngeKi8zf833GfbG+LPfSBEfY9O4nNp1f0QkXBf8mHI2xMO
	b4JgVsxH0c2xCV6Hc90bu0gVzPTtCKATJz3SzrK8=
Received: by smtp.zohomail.com with SMTPS id 1791555990345422.0007315319667;
	Fri, 9 Oct 2026 07:26:30 -0700 (PDT)
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
Date: Fri, 9 Oct 2026 11:26:10 -0300
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
Message-Id: <DCB87F1B-30EC-4EE8-A8AA-32D3DA978833@collabora.com>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
 <20260929-tyr-ioctls-v3-5-26955fb111d5@kylinos.cn>
To: sunke@kylinos.cn
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External



> On 28 Sep 2026, at 23:15, Ke Sun via B4 Relay =
<devnull+sunke.kylinos.cn@kernel.org> wrote:
>=20
> From: Alvin Sun <alvin.sun@linux.dev>
>=20
> The MCU and user VMs need different VA layouts. Give each a dedicated
> constructor: new_for_fw() builds the kernel-only 4G layout, while
> new_for_user() splits the address space by task_size or a =
user-provided
> size, rejecting oversized requests rather than clamping. The resulting
> user range is what VM_CREATE reports back as user_va_range.
>=20
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
> drivers/gpu/drm/tyr/fw.rs |  19 +++---
> drivers/gpu/drm/tyr/vm.rs | 170 =
++++++++++++++++++++++++++++++++++++++++++----
> 2 files changed, 164 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
> index 7edb5eff17077..d790b54e373e6 100644
> --- a/drivers/gpu/drm/tyr/fw.rs
> +++ b/drivers/gpu/drm/tyr/fw.rs
> @@ -52,7 +52,6 @@
>         KernelBoVaAlloc, //
>     },
>     gpu::GpuInfo,
> -
>     mmu::Mmu,
>     regs::{
>         gpu_control::{
> @@ -223,10 +222,10 @@ pub(crate) fn new(
>         mmu: ArcBorrow<'_, Mmu<'drm>>,
>         gpu_info: &GpuInfo,
>     ) -> Result<Firmware<'drm>> {
> -        let vm =3D Vm::new(dev, ddev, mmu, gpu_info)?;
> +        let vm =3D Vm::new_for_fw(dev, ddev, mmu, gpu_info)?;
>         vm.activate()?;
>=20
> -        let result =3D (|| {
> +        let sections =3D (|| -> Result<KVec<Section<'drm>>> {
>             let (fw, parsed_sections) =3D Self::load(dev, ddev, =
gpu_info)?;
>             let mut sections =3D KVec::new();
>             for parsed in parsed_sections {
> @@ -256,18 +255,18 @@ pub(crate) fn new(
>                 sections.push(Section { data, mem }, GFP_KERNEL)?;
>             }
>=20
> -            Ok(Firmware {
> -                iomem,
> -                vm: vm.clone(),
> -                sections,
> -            })
> +            Ok(sections)
>         })();
>=20
> -        if result.is_err() {
> +        if sections.is_err() {
>             vm.kill();
>         }
>=20
> -        result
> +        Ok(Firmware {
> +            iomem,
> +            vm,
> +            sections: sections?,
> +        })
>     }
>=20
>     pub(crate) fn boot(&self) -> Result {
> diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> index a2857820570cf..625ec7e95790f 100644
> --- a/drivers/gpu/drm/tyr/vm.rs
> +++ b/drivers/gpu/drm/tyr/vm.rs
> @@ -8,6 +8,7 @@
> //! mapped into hardware address space (AS) slots for GPU execution.
>=20
> use core::marker::PhantomData;
> +use core::num::NonZeroU64;
> use core::ops::Range;
>=20
> use kernel::{
> @@ -44,6 +45,8 @@
>     new_mutex,
>     prelude::*,
>     sizes::{
> +        LargeSizeConstants,
> +        SizeConstants,
>         SZ_1G,
>         SZ_2M,
>         SZ_4K, //
> @@ -159,6 +162,103 @@ fn try_from(value: u32) -> Result<Self, =
Self::Error> {
>     }
> }
>=20
> +/// User VA size request for a user VM.
> +pub(crate) enum UserVaRequest {
> +    /// Split based on `task_size()` and the GPU VA range.
> +    Auto,
> +    /// Caller-specified size; construction guarantees `> 0`.
> +    Fixed(NonZeroU64),
> +}
> +
> +impl UserVaRequest {
> +    /// UAPI boundary normalization: `0` -> [`Auto`](Self::Auto).
> +    #[expect(dead_code)]
> +    pub(crate) fn from_uapi(v: u64) -> Self {
> +        match NonZeroU64::new(v) {
> +            Some(size) =3D> Self::Fixed(size),
> +            None =3D> Self::Auto,
> +        }
> +    }
> +}
> +
> +/// Final user/kernel VA layout for a VM.
> +pub(crate) struct VmLayout {
> +    /// Full GPU VA range covered by this VM.
> +    pub(crate) full: Range<u64>,
> +    /// User-accessible VA range. Empty for MCU VMs.
> +    pub(crate) user: Range<u64>,
> +}
> +
> +impl VmLayout {
> +    /// Kernel VA range, reserved for future kernel object =
allocation.
> +    #[expect(dead_code)]
> +    pub(crate) fn kernel(&self) -> Range<u64> {
> +        self.user.end..self.full.end
> +    }
> +
> +    /// Compute a user/kernel split for a user VM from the full GPU =
VA range and
> +    /// a user request.
> +    pub(crate) fn compute(full: Range<u64>, req: UserVaRequest) -> =
Result<Self> {
> +        // Minimum VA space reserved for kernel objects (heaps, ring =
buffers, ...).
> +        const MIN_KERNEL_VA: u64 =3D u64::SZ_256M;
> +
> +        if full.end <=3D MIN_KERNEL_VA {
> +            pr_err!(
> +                "Invalid VA range {:#x}..{:#x}, kernel VA min =
required: >{:#x}\n",
> +                full.start,
> +                full.end,
> +                MIN_KERNEL_VA
> +            );

This pr_err seems to be removed in patch 7.

> +            return Err(EINVAL);
> +        }
> +
> +        let user_max =3D full.end - MIN_KERNEL_VA;
> +
> +        let user_end =3D match req {
> +            UserVaRequest::Fixed(v) =3D> {
> +                let user_size =3D v.get();
> +                if user_size > user_max {
> +                    pr_err!(
> +                        "Requested user VA range {:#x} exceeds =
maximum {:#x}\n",
> +                        user_size,
> +                        user_max
> +                    );

Same here. In this case, just don=E2=80=99t add them in this patch to =
begin with.

> +                    return Err(EINVAL);
> +                }
> +                user_size
> +            }
> +            UserVaRequest::Auto =3D> {
> +                let task_size =3D current!().mm().map(|mm| =
mm.task_size());
> +                let candidate =3D match task_size {
> +                    // `task_size()` returns usize; widen to u64 for =
the comparison.
> +                    Some(t) if (t as u64) < full.end =3D> t as u64,
> +                    None | Some(_) =3D> {
> +                        // If the range exceeds 4G, split it in two =
so CPU and
> +                        // GPU share the same addresses (SVM).
> +                        if full.end > u64::SZ_4G {
> +                            full.end / 2
> +                        } else {
> +                            user_max
> +                        }
> +                    }
> +                };
> +                candidate.min(user_max)
> +            }
> +        };
> +
> +        let delta =3D full.end - user_end;
> +        // Pick a kernel VA range that's a power of two, to have a =
clear split.
> +        let kernel_va_range =3D 1u64 << delta.ilog2();
> +        let kernel_va_start =3D full.end - kernel_va_range;
> +        let full_start =3D full.start;
> +
> +        Ok(Self {
> +            full,
> +            user: full_start..kernel_va_start,
> +        })
> +    }
> +}
> +


With the changes above,

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

