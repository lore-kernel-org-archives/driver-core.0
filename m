Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A656E36196E
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502789; cv=none; b=RhnXUAlRDpDFHS41z73AMdbpf1iejMYFcTUYpJ2qcZn3gIshrppsEzE9P4O+tPYUj1SzHa0me345I7I3cpE04PwMey5NcHfqbk9tlS8F49HWJ5OklgDumohKPLj8AEmSYQXOPUQyLKr6jD8tnusZUDu3k3l3rmp4QRu88jSvJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502789; c=relaxed/simple;
	bh=TV4S6QcoDp9i3XvYMLYR7XmivYO8ZF+r2apXG+G/N38=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WnWP5mENGuBXb8oEPBpLMyT9yFuwfiUHLYOefgQ2SvzpcNc8pS1t6RzzXSNF4K5Xv9OuP/1D1m5GCN2da5DfyE8eZc4DKE6NfOPhSckHidtfMBi3nS0XlQziC2lkolsQn1M+lpaPTYN8llqZevOowY/a4SjO40VYTa5KwHbA1Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r8bcG+6D; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r8bcG+6D"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f83999cceso1120855f8f.3
        for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 05:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502786; x=1786107586; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9eJPXgMx/k8Zzskbe/ENfQg92M9fVEFYQJ0hF5Ni8Q=;
        b=r8bcG+6DGXUjd0IKpkwFj26ULM68Bo0NoV0aJg0Gy+Ufnbc4Ont+no5U9fp9F1ihn7
         xH/tPyhrBI12AYrT3IwCSGXl92vWI9MErN3xqHQcch/B0AKpWc2t/lFJ6uP6Svy9XAqy
         Yd46Xm/2X8byvPf0vNyl9He5AnGzrgcfeqt1R7AYVdyT9p7LT6ZUWX3cICsq/JMafFio
         NVSNZPv6/2CQ5RT/rmZSUBnVcABUQ3jaxGcH8PgYmTBawU68U3wq0/4IDXRc3ZZ0mYqQ
         x2LGSD5wPOhf1o+d1+VntNt9rQIzabnWsRCtuPh352laNC9uetqj0d/IwY0vRePu++zj
         xhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502786; x=1786107586;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9eJPXgMx/k8Zzskbe/ENfQg92M9fVEFYQJ0hF5Ni8Q=;
        b=g6AXP4loQ3QCHQQ9ytRQFXvlFAMGRD2Fg9o747ON3RtHy99lG+03yBMdBoyypZEEuK
         GWrD8nMwfsEMQZFJVy5Qu6vVYvKQYcwv8TEdDEC/A2sW/jXVfAwEu37cv9WLQ/iI/Rka
         v1MlthBxyTmkDAciMh9vXjp1iOMs6Ernd8eJVVQ3/AXpZXHiyI9FIlRzwG05LFmHejX8
         y+QyZ/Esuow3P9bp0jYJcBpLKvjjzSb4Kv2/1XU5aWXH6bSgHhJowZjWeT5nTrtRWDi1
         cq+yb/36s6eNUFBcTcpZkk/YaSiYbrw5VpmM8cqnkktjfLLKbDELVttG9vk/4wg5FE5l
         5zJw==
X-Forwarded-Encrypted: i=1; AHgh+RrjvG5KQQ9/tqll6uWZeqD1VULKh3H8694r7HEhUa3KZ0/U64u+oq78PhSN+tOsXB+1dz/EUQw1l1rOFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJQXGAGKGIA8WErpVbgZjCwyzqi2E6kj/RCwwQSc9o6mOQy0nT
	l9v/W9+pRlfHMWAaLk9ptpdZklStZVqnpYTZBRJs0GBdeF1zquaq5R0ZBIVldxj0R2JrtecgKp7
	SjdjNeemOPF90p6dUWA==
X-Received: from wmbdr14.prod.google.com ([2002:a05:600c:608e:b0:493:af1f:8829])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40cd:b0:47f:6d9a:d7a6 with SMTP id ffacd0b85a97d-47fd2aed4ebmr4411247f8f.25.1785502783123;
 Fri, 31 Jul 2026 05:59:43 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:59:42 +0000
In-Reply-To: <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev> <20260731-tyr-debugfs-v2-v2-8-aea19eccb996@linux.dev>
Message-ID: <amycPnwWUS1qwGs9@google.com>
Subject: Re: [PATCH v2 8/9] drm/tyr: add gpuvas debugfs file
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	"=?utf-8?B?TWHDrXJh?= Canal" <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, 
	Wambui Karuga <wambui.karugax@gmail.com>, Eric Anholt <eric@anholt.net>, 
	Ben Gamari <bgamari@gmail.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 31, 2026 at 01:05:46AM +0800, Alvin Sun wrote:
> Add a gpuvas debugfs file listing all GPU VAs for the Tyr DRM driver.
> Collects VMs into a shared list during firmware init and renders them
> via dump_gpuva_info on read.
> 
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  drivers/gpu/drm/tyr/debugfs.rs | 65 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tyr/driver.rs  | 16 +++++++++++
>  drivers/gpu/drm/tyr/fw.rs      |  8 ++++++
>  drivers/gpu/drm/tyr/tyr.rs     |  1 +
>  drivers/gpu/drm/tyr/vm.rs      |  5 ++++
>  5 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tyr/debugfs.rs b/drivers/gpu/drm/tyr/debugfs.rs
> new file mode 100644
> index 0000000000000..d381b1901bd08
> --- /dev/null
> +++ b/drivers/gpu/drm/tyr/debugfs.rs
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +//! Debugfs support for the Tyr DRM driver.
> +
> +use kernel::{
> +    alloc::KVec,
> +    drm,
> +    new_mutex,
> +    prelude::*,
> +    seq_file,
> +    sync::{
> +        Arc,
> +        Mutex, //
> +    }, //
> +};
> +
> +use crate::{
> +    driver::TyrDrmDriver,
> +    vm::Vm, //
> +};
> +
> +/// Registry of VMs for debugfs access.
> +#[pin_data]
> +pub(crate) struct VmRegistry<'drm> {
> +    #[pin]
> +    vms: Mutex<KVec<Arc<Vm<'drm>>>>,
> +}
> +
> +impl<'drm> VmRegistry<'drm> {
> +    pub(crate) fn new() -> impl PinInit<Self> {
> +        pin_init!(Self { vms <- new_mutex!(KVec::new()) })
> +    }
> +
> +    pub(crate) fn register(&self, vm: Arc<Vm<'drm>>) -> Result {
> +        Ok(self.vms.lock().push(vm, GFP_KERNEL)?)
> +    }
> +
> +    fn for_each(&self, mut f: impl FnMut(&Vm<'drm>) -> Result) -> Result {
> +        for vm in self.vms.lock().iter() {
> +            f(vm)?;
> +        }
> +        Ok(())
> +    }
> +}

This code maintains a separate list of all of the vms for access from
debugfs, but I would have expected that this is not necessary. If we
already store the vms inside the driver's private data, then can't we
just access them from the normal storage location?

By having multiple copies of the same information, you risk that they
get out of sync. In this case, you never remove vms from the list even
if the vm stops being used, which seems wrong.

Alice
