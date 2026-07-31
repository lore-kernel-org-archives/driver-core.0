Received: from sender4.zoho.com (sender4.zoho.com [136.143.188.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A79442B0F
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515434; cv=pass; b=BL1PzsCYPxWh2m89LIYhsQnLMM5ro6EiZpJK8aGNy4jehaoXK35gefPonLN7tesyGjRUwYM9ykqv8NiKg/VZ4L4IRdy74ChPasaZot8WvX48Zen4CVKv7PCeALgz/WouR3Inbm3xXZp1l5JszGAgN4qD+DG3W1Cs9FGoOJ3Idnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515434; c=relaxed/simple;
	bh=7J2FlyYxuEKNxeo+fHK8baPwDJWuD/TchjguUdI4PtE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UH6E+yGivq8SWmBQ4yJVz6Xmunq50RP1FrWlQlYoqyPTCvxygmr4GfuASbHfTkyjAYe4A6x7Pzu0/aVfEApWaXq5F+Jp+zVRZZXkPP/yv3MGW+jdrUQoH0CJ1e9FfNn/8f8sNlqyBEzo4EyWRDxCs6iUczw34g/dt+/N0WUPt3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=bkycZpoF; arc=pass smtp.client-ip=136.143.188.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bkycZpoF"
ARC-Seal: i=1; a=rsa-sha256; t=1785515391; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BnAvaKmRq2RyR2IItLBnECqoMu/K+JFBJoIMtHsxph/ZHlu84d8LKCnuu9J3H17xE63CVFeCYJ+w3dTFFvC+MA66Di9ASwLZoQn2Zq7sxA+LY4E6f6Uv8pFYRv5TozSZhh+AS/R39wWeZFEiprty9++p+pUCGJ+b/IUaEl7lZwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785515391; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ty2Us3CSr4duHioWtKFDmBPTA9uycF2Ft1Lo5esOmzw=; 
	b=VqbdE8lO28seeCfnH0WndahOcXPxieysULj90ttG3TEuCGXNiC/8dUFAdegJTbVYby/Uo1PlNjIeH6wicEFVtDpaDJe7uAhjoQF3T1p067/7q+k/Ed93pc0gMPIB0xRqOxYm4qIvZARYYcdQBtxsNWSm+kAtGKVSFFVvOag0IRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785515391;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=Ty2Us3CSr4duHioWtKFDmBPTA9uycF2Ft1Lo5esOmzw=;
	b=bkycZpoFSwuPEfFj9mE0BFLRmuFrOkp79oDiImZR4lMPd+SMQaLExXHTqE7teuaR
	pdY5k6GPIELKrWFIOvoubtqbmtTO0iAD676+1vkxHqlw8U9MuiA2cv5R29AbCAy7aXk
	JU+piG8sndXbI7rAIDrVh8WnWiHRk8PbM+PiOpqE=
Received: by mx.zohomail.com with SMTPS id 1785515389919883.983345609444;
	Fri, 31 Jul 2026 09:29:49 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 8/9] drm/tyr: add gpuvas debugfs file
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <amycPnwWUS1qwGs9@google.com>
Date: Fri, 31 Jul 2026 13:29:28 -0300
Cc: Alvin Sun <alvin.sun@linux.dev>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Eric Anholt <eric@anholt.net>,
 Ben Gamari <bgamari@gmail.com>,
 rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <065E32DC-303F-46A5-838B-203A38502F8D@collabora.com>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>
 <amycPnwWUS1qwGs9@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 31 Jul 2026, at 09:59, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Fri, Jul 31, 2026 at 01:05:46AM +0800, Alvin Sun wrote:
>> Add a gpuvas debugfs file listing all GPU VAs for the Tyr DRM driver.
>> Collects VMs into a shared list during firmware init and renders them
>> via dump_gpuva_info on read.
>>=20
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
>> ---
>> drivers/gpu/drm/tyr/debugfs.rs | 65 =
++++++++++++++++++++++++++++++++++++++++++
>> drivers/gpu/drm/tyr/driver.rs  | 16 +++++++++++
>> drivers/gpu/drm/tyr/fw.rs      |  8 ++++++
>> drivers/gpu/drm/tyr/tyr.rs     |  1 +
>> drivers/gpu/drm/tyr/vm.rs      |  5 ++++
>> 5 files changed, 95 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/tyr/debugfs.rs =
b/drivers/gpu/drm/tyr/debugfs.rs
>> new file mode 100644
>> index 0000000000000..d381b1901bd08
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tyr/debugfs.rs
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +
>> +//! Debugfs support for the Tyr DRM driver.
>> +
>> +use kernel::{
>> +    alloc::KVec,
>> +    drm,
>> +    new_mutex,
>> +    prelude::*,
>> +    seq_file,
>> +    sync::{
>> +        Arc,
>> +        Mutex, //
>> +    }, //
>> +};
>> +
>> +use crate::{
>> +    driver::TyrDrmDriver,
>> +    vm::Vm, //
>> +};
>> +
>> +/// Registry of VMs for debugfs access.
>> +#[pin_data]
>> +pub(crate) struct VmRegistry<'drm> {
>> +    #[pin]
>> +    vms: Mutex<KVec<Arc<Vm<'drm>>>>,
>> +}
>> +
>> +impl<'drm> VmRegistry<'drm> {
>> +    pub(crate) fn new() -> impl PinInit<Self> {
>> +        pin_init!(Self { vms <- new_mutex!(KVec::new()) })
>> +    }
>> +
>> +    pub(crate) fn register(&self, vm: Arc<Vm<'drm>>) -> Result {
>> +        Ok(self.vms.lock().push(vm, GFP_KERNEL)?)
>> +    }
>> +
>> +    fn for_each(&self, mut f: impl FnMut(&Vm<'drm>) -> Result) -> =
Result {
>> +        for vm in self.vms.lock().iter() {
>> +            f(vm)?;
>> +        }
>> +        Ok(())
>> +    }
>> +}
>=20
> This code maintains a separate list of all of the vms for access from
> debugfs, but I would have expected that this is not necessary. If we
> already store the vms inside the driver's private data, then can't we
> just access them from the normal storage location?

Panthor also has a similar concept. I agree that we can reach the VMs
from other places, but they=E2=80=99re scattered, and this type buys the =
convenience
to do so, which we will need for other, non-debugfs-related features.

I wonder if we should move the registry to the top level in the private =
data,
though:

i.e.: {
  fw: ..=20
  mmu: =E2=80=A6
  registry: VmRegistry
}


>=20
> By having multiple copies of the same information, you risk that they
> get out of sync. In this case, you never remove vms from the list even
> if the vm stops being used, which seems wrong.
>=20
> Alice

I think this can be solved by having vm::new() take a &VmRegistry =
argument,
same for vm::destroy(). This forces callers to provide the list so it =
can be kept
in sync.

This is just one approach though, perhaps someone has a better idea?

=E2=80=94 Daniel

