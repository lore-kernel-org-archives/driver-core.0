Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617973;
	b=sburl/1/MDWMF+hl9ST6Fz8cwilRy1KduVwruOP2r0W/0N32XqHM62J2ufbqdJoiivXu
	 9az37XOjR6wUnuvi79NOPhvFe9apQqv46zpd7aybqNmF/zxHaVXvLOQ1xB6eIxr/0ZNdY
	 PM0W+Ka7nyN6jmeLkd5dstTfJgRGBxAt3sbQQy18I6Mqi1R7xg1lE2OGWtMkk0t9nbTur
	 mbeve+W0zNuRyx7BwrlBji5mS/QDSQUVPfoUUx+LvbZb5bdpNREMj1ofBWq9xV14sH5c9
	 PYac2oRXLIAJ4MMC3JaR67EobaMFCp10khNuUMTJo7IZ3mIoMMssWOvRjONQ+fJGokA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617973;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=gecQT3QLi8h5ZT5ZD/aRrNShcev3mt0RHoczYfYtb44=;
	b=1s5bH78rP0FElqK67N8Bs6qdpg2nP1CrZS7RiOMra+eW1VWAYi21dylGkjMvtUcAbUGw
	 O4PvpYxLY0ynEziwooXL2FnJO5j6bVLXIYQjdiCwsVnoSYPTpjHceOB3HtH36u2b7UMCS
	 ff/d8F2PQArPBG8mJWshbH3LQ4q3fKjoKZkN8glpopSa/Bbsm5I9hG3jzhsxio5Qqm4bB
	 l1CSZbwWkeJLhFxhtsRzISSw8Dpp7iNbHhOb1Jt3P7JOk9q1LzxkY4sq7RtwRziFNWLfU
	 BxN56Qjelv3qZnvIoRapHmwJQWk9X0/q/8waNLCOpcz+oTb+uFEzVPulK3CfrpxwjbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=K9AfYPfP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94432606A321
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 14:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94432606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=K9AfYPfP
ARC-Seal: i=1; a=rsa-sha256; t=1795617952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WdFZ7dTQSE6DloQWRHknD0sHffPMBtgWIXFcwAGszfKcB9giPTleHE+3x2TaDsOpkgxZy4ywugRKioGaYy0KjdCyJYP/+JLA4bi+lWCwwX+KOepigOUKA/HfeV96RA0ZXxTTRqX2BS5yukkCgu3VL+l9Gwblnq2IOEDkh8XG/0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795617952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gecQT3QLi8h5ZT5ZD/aRrNShcev3mt0RHoczYfYtb44=; 
	b=AI9P4+hGOhqE+eLF6V1/AFbKTEqg04X7e4hLxipgMsvyv8gmIXBMOAUrvyvQorXEvpMScn8dFiFvLBf90QWhvnA7w/sz0ssmrBaqnQa4fp+GzBhczF+0XsuxDGd+Bd2hiMFT/gTodpQ1zjIA0O9Zv/7pEsJdjWtBAD7hOsa8ovE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=K9AfYPfPCP+VPlWTakRCodr/whi0V4yvFOpTnpk8xvcmzNssrcgDKZ9Gs0kBe4omEQ8n3SaS1RvoOOT+XANCtLJSvoWRKPVmUicpbOQEBMcxlUP429H1dS2FkgCA1WXee9rMG/Zg4xepyn86F8t+gk8jhkld3JEE1yIcTteypQ8=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=gecQT3QLi8h5ZT5ZD/aRrNShcev3mt0RHoczYfYtb44=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795617950182446.68809450599986;
	Wed, 25 Nov 2026 06:45:50 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 02/10] rust: task: add task_size()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-2-3a2af624b992@linux.dev>
Date: Wed, 25 Nov 2026 11:45:32 -0300
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
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Ke Sun <sunke@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <332FBBF2-CC76-4A2C-BCB7-DCFC296B035A@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
 <20261122-tyr-ioctls-v7-2-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External



> On 22 Nov 2026, at 09:50, Alvin Sun <alvin.sun@linux.dev> wrote:
>=20
> From: Sami Tolvanen <samitolvanen@google.com>
>=20
> A DRM driver that lets userspace pick GPU virtual addresses needs the
> address space size of the calling task, so it can offer a GPU range
> that the CPU can map at the same addresses. TASK_SIZE_OF() is a macro,
> so reading it from Rust needs a helper.
>=20
> Add CurrentTask::task_size(). It is bound to the current task because
> TASK_SIZE_OF() falls back to TASK_SIZE on architectures that do not
> define it, and TASK_SIZE describes current.
>=20
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [ Add the <linux/mm.h> include, needed where TASK_SIZE is defined in
>  <asm/pgtable.h> (e.g. riscv). - Alvin ]
> Co-developed-by: Alvin Sun <alvin.sun@linux.dev>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
> rust/helpers/task.c |  6 ++++++
> rust/kernel/task.rs | 12 ++++++++++++
> 2 files changed, 18 insertions(+)
>=20
> diff --git a/rust/helpers/task.c b/rust/helpers/task.c
> index b46b1433a67e8..b49bd40027154 100644
> --- a/rust/helpers/task.c
> +++ b/rust/helpers/task.c
> @@ -1,6 +1,7 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> #include <linux/kernel.h>
> +#include <linux/mm.h>
> #include <linux/sched/task.h>
>=20
> __rust_helper void rust_helper_might_resched(void)
> @@ -13,6 +14,11 @@ __rust_helper struct task_struct =
*rust_helper_get_current(void)
> return current;
> }
>=20
> +__rust_helper unsigned long rust_helper_current_task_size(void)
> +{
> + return TASK_SIZE_OF(current);
> +}
> +
> __rust_helper void rust_helper_get_task_struct(struct task_struct *t)
> {
> get_task_struct(t);
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index a733816fd5dd4..1978f54fe5897 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -317,6 +317,18 @@ pub fn mm(&self) -> Option<&MmWithUser> {
>         Some(unsafe { MmWithUser::from_raw(mm) })
>     }
>=20
> +    /// Returns the size of the userspace address space of the =
current task.
> +    ///
> +    /// This is the first address above the userspace range, so it is =
smaller
> +    /// for a task running in compat mode than for a native one. See
> +    /// `TASK_SIZE_OF()` in =
[`include/linux/sched.h`](srctree/include/linux/sched.h).
> +    #[doc(alias =3D "TASK_SIZE_OF")]
> +    #[inline]
> +    pub fn task_size(&self) -> usize {
> +        // SAFETY: FFI call without preconditions, valid in any =
context.
> +        unsafe { bindings::current_task_size() as usize }

Do we need this cast?

> +    }
> +
>     /// Access the pid namespace of the current task.
>     ///
>     /// This function does not touch the refcount of the namespace or =
use RCU protection.
>=20
> --=20
> 2.43.0
>=20
>=20

