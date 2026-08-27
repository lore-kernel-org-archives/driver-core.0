Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5089D1E5B68
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872062; cv=pass; b=BSOD/wA8bmYenEZInjT5RGLeqmS+vJTycIovGecut28xxNQpj2S03WZgk18e0BN1leu/UlxFkwWh1v8S7mEW/pXgUVy8Q3AuylnsFEm/AweWG75XkdOg8Oby6n/J2ikXua3zBrVDAN/c1/Bon+A0wzULm4QPmwXCvt+yS4Ad+7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872062; c=relaxed/simple;
	bh=JN3rSnKGqqfDq/eQLtVOB8blkZVlaaGIGUYSZdLukz0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WcdQvnejJvZIPMP0IppePP1cClNI/HjuNiAF8FAcK85WcM2lr3wZBefYaGiU8fn1/YdFV6kySWu2eCF1+KUwasIZ4E04vTWUCs8L6uzuxGYERYlV5OhcsyBmeiNS5nM+k0XYFQR5vHG3zZWoDUSAR8n2RMPZLtnNYW8j+tPXuUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=a5WONbZ9; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="a5WONbZ9"
ARC-Seal: i=1; a=rsa-sha256; t=1787872055; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UB0UsIC6SHTKqP5ChI+TmVTJV7ZOcBxq239G2/ARTA0WIUuCaU4GVOyR6HlUJXNz9a02Qagqkol8ndI2ZnmR3nTMuO8k60vtSE/N/1d8nUPITWkbwPtDg3PgtLBOgGQrflbNZRhb+IuhpxLB/64MKKqgO9fxCH76kAOV09+Q1Ns=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787872055; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iLWnyVnmxOQ+B7kTcDs1wmKhTGpUrtmBx77S2Imtshc=; 
	b=dhVlQAYSvC6TfRk1EXpzr4dhlUs0AlwmXVQ3MtHhwVaCHw3UHjXYaYqTCrHuhXqdWo3kwd6Bg65RT8JwcByjxv097+O6XWDCoJwNArUNcTJNv81gx2pC8SRgLZjLigzsq0NOi1iYwdYzClK/cUVjgJ4Kt+n2f0JViS2brmcWFsk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787872055;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=iLWnyVnmxOQ+B7kTcDs1wmKhTGpUrtmBx77S2Imtshc=;
	b=a5WONbZ93sBitwOhLCJyJmHS6qGMS29PFxJ6lNjDP65y2zWGXICSEtJq4eBosL8S
	TAqO83vJNgY5qfmCArwCiggttp0f/XBdwMDwz6I1X9uvEhB0OIaTIkiHuB58aLRAZEi
	h8Nxjd7ySHpFMPlXu+13CniTxjwhyt2o/XiyeiBg=
Received: by mx.zohomail.com with SMTPS id 1787872053915579.0836722582136;
	Thu, 27 Aug 2026 16:07:33 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 6/6] rust: workqueue: add ScopedWork for non-'static
 work items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260807165252.3849875-7-dakr@kernel.org>
Date: Thu, 27 Aug 2026 20:07:16 -0300
Cc: tj@kernel.org,
 jiangshanlai@gmail.com,
 aliceryhl@google.com,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 acourbot@nvidia.com,
 work@onurozkan.dev,
 jhubbard@nvidia.com,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <62F91620-6211-46BD-8095-4655726D52A2@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-7-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

>=20
> /// Creates a [`Work`] initialiser with the given name and a =
newly-created lock class.
> #[macro_export]
> @@ -283,23 +289,39 @@ pub unsafe fn from_raw<'a>(ptr: *const =
bindings::workqueue_struct) -> &'a Queue
>     /// This may fail if the work item is already enqueued in a =
workqueue.
>     ///
>     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> +    #[inline]
>     pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
>     where
>         W: RawWorkItem<ID> + Send + 'static,
> +    {
> +        // SAFETY: `W: 'static` guarantees the work item remains =
valid indefinitely,
> +        // so the `enqueue_scoped` requirement that the work item =
stays valid until
> +        // the work function runs (or is cancelled) is trivially =
satisfied.
> +        unsafe { self.enqueue_scoped(w) }
> +    }
> +
> +    /// Enqueues a work item that may not be `'static`.
> +    ///
> +    /// Unlike [`Queue::enqueue`], this does not require the work =
item to be `'static`.
> +    ///
> +    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the work item's destructor runs =
before any
> +    /// lifetime it captures expires (i.e., the work item must not be =
forgotten).

It seems like this requirement is due to cancel_work_sync(). But what =
happens
if the item is enqueued with enqueue_scoped() on two work queues
simultaneously? Would cancel_work_sync() wait for both queues?

Docs seem to warn against it, IIUC?

"Cancel work and wait for its execution to finish. This function can be =
used
even if the work re-queues itself or migrates to another workqueue. On =
return
from this function, work is guaranteed to be not pending or executing on =
any
CPU =E2=80=94> as long as there aren=E2=80=99t racing enqueues. <=E2=80=94=
"

> +    #[inline]
> +    pub unsafe fn enqueue_scoped<W, const ID: u64>(&self, w: W) -> =
W::EnqueueOutput
> +    where
> +        W: RawWorkItem<ID> + Send,
>     {

