Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85C2C11DF
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775323504; cv=none; b=oU85fcD4CLYoROeGJQ/z7tKUHdWWEmQcZMH98j6QNCL8oZO4sLcbYM83Duj/DOHlvGbDIWhDFTIRre7N+6yEwUw1Vgg0Ml6w8nc89juDqH0oJhxInijbEjDV3y5a7Qif5lfvTInYN1L6XacmJnqxcVfuedSnbRz07bAiKKDwQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775323504; c=relaxed/simple;
	bh=jmB6NcLAsc1+UN+OCM3PMKOU1PmeCf5hHjP+ltB0FgA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L1lRZLr3w83wy7EMXtnYOS4fKcnGw8cGsFUnQYdojZFsVnDqtBBhaOK8XIls+zdN0PsZpAEcziR/+LdEXbyrDRaSemEQr76dyMkeA5YPcZqzcdOQn5PwFfrG39EE00Ejy7PTLk86ks7Q7cRcesB8CJv0zu2Q2zjsKvMRkUvlECg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQrv9/Cy; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQrv9/Cy"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so6861773eec.1
        for <driver-core@lists.linux.dev>; Sat, 04 Apr 2026 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775323503; x=1775928303; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmB6NcLAsc1+UN+OCM3PMKOU1PmeCf5hHjP+ltB0FgA=;
        b=NQrv9/CyR6IT62IFBoc9sHZ7wUVh2htWCTSVZwHiTsqJUJoBXas/ict6tLzgD9raqK
         qa70gInbx9wp0TUvWTiy8uBPcsU+qhzen4bRep2yKsxxwNbRriMAawA/tgjCgaC875hK
         lRXp53okTJiTLqVXtEWTHbMHG4fN/jaFI7uBmmQSIa52csP4OLCJkq/t6RulrZVovvx7
         4QzNJycNdvhX+476xwpcoAyKSF2Q7ZT9NwMiIPqxCmo1+AnYu1vfW2oYy3QjyUUBJ117
         lZUrG+ELMTJ0wVc6pt5T2CuIvyc5NwZqLvKCTsh68X+AVdDQN0TxfVQts2wmdGDYcbWG
         M9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775323503; x=1775928303;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmB6NcLAsc1+UN+OCM3PMKOU1PmeCf5hHjP+ltB0FgA=;
        b=kFaDLfRSWrPmfKiFK3YSX81c7usuQ3Nbn5GjUnC8z+d8rIe6DHtAEX/nW4s+jZMWLT
         55mhw3IQWn1qpvAW1Zry8MQOpdSgVYMd0TyJu99GQlOBEYnsW0HLGcainOcnHnizyJGh
         WA22O19G+/jZ82gfUnm0uKDvOHEsIQvIijyUGLydAXiKezx7AG9ZLWQxzhGtt8lhPVZG
         6BfFCGbHA82oKsnyoAxOOgNzN6C5BR5yd6qbccJwjpjuFPTJzMjYQOVuJktwP30uMVV6
         4T9HLchjJqf+pZ1U57o2wws+0xXIErrPQrhpn4V1WUa9wx8KGxkE0L937gHXi74m5zl/
         Sp4g==
X-Forwarded-Encrypted: i=1; AJvYcCU0+VwG+KyXcrrF4pzGIPCvPIkW4rwiJJU23dymAGMKtqhXYNiFKnuWNm09y7kQ10LJtGGe2KRwxiJNAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdYEKlkLx0yB72J+LhNUWaBVBIbX78pGsLRezGd3Jc7n7YV2bi
	yrcHfsmzNzSLvEW5jvO+AUhebpYiwMAgQRN2V8nckzEc7GMI/zCdS9Gh
X-Gm-Gg: AeBDiesODglO8q6AAQu69cHHNkCnkb8yOwcBu0f2gGvPTWmw3CaN6h8GtYxeTmm3DfP
	bm4GjbuotksOmbkWz9GzNpDoFXaLpcQE5IdZlq10z+LsZ4ER48duAR4CspN7CejswnlpG+4YWPN
	0bu1bwj5ntRuSvQ1rTa/3tUNrfx28ta80DI7W+yqT4fXhr5hbKQbH1L23ruolomj015v//7xaCs
	idXtyB6/vNg24G0wzJBQT3hd4lsZfIsrUp/BbU/6MQiwxfWh3erg/aWcxBxbbF+UFeXOlj0VR1q
	z+5oHu/ZNbNzNBa/4FlBgitRb+tPUZmeqnwsaN9+fzxXrtHiaI7ePK1N0uSoGJaxrIJ/PH3d0cw
	EVNvy7REhZ/pJbrgJDjgBgUwBIxXhKpt6v1RXRxJ3b0eitMkjkEHfwPkjY99Tqeclw3CzRj+49t
	dR4lfXwd7+NhLbQ7As0Q/HaG/xQd/CVnOy34If6vLuehm0TofW6uRoC028g5KQ7w==
X-Received: by 2002:a05:7300:641a:b0:2be:8216:57db with SMTP id 5a478bee46e88-2cbf99ec1bdmr3767503eec.3.1775323502804;
        Sat, 04 Apr 2026 10:25:02 -0700 (PDT)
Received: from localhost ([2603:8000:bb00:9b3f:5094:4d4:5bc0:f9f9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca793eecd1sm8003832eec.10.2026.04.04.10.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 10:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 10:24:59 -0700
Message-Id: <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
From: "Aditya Rajan" <adi.dev.github@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <dakr@kernel.org>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
 <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>
In-Reply-To: <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>

On Sat Apr 4, 2026 at 6:15 AM PDT, Gary Guo wrote:

> Thanks for the patch, but the behaviour here is intended.
>
> Neither our `KVec` implementation nor upstream Rust distinguishes between
> allocation error caused by array size exceeding address space or running =
out of
> memory to allocate (`AllocError` is returned and it converts to ENOMEM).
>
> `kmalloc_array` also just returns `NULL` when overflows, so arguably this
> behaviour also aligns us with C side.
>
> Abstractly, the system is indeed running out memory because it cannot all=
ocate
> something larger than its address space.

Hi Gary,

Thanks for the reply, I saw at some similar places where EOVERFLOW is used,=
 that is why i thought we should change this error code:

* In nouveau_drv.h, `u_memcpya()` does `check_mul_overflow(nmemb, size, &by=
tes)` and returns ERR_PTR(-EOVERFLOW), it is kind of same multiplication ov=
erflow on `nmemb*size` before an allocation. Similarly `mm/mmap.c` returns =
EOVERFLOW for arithmetic overflow in offset calculations, it also has a com=
ment `/* offset overflow? */`.

* Also I saw existing Rust kernel code already follows similar convention, =
see `rust/kernel/uaccess.rs` it uses `offset.checked_add(count).ok_or(EOVER=
FLOW)?` for the same kind of arithmetic overflow check.

* For `kmalloc_array` i think it conflates overflow with OOM because its re=
turn type (pointer) can't express distinct errors, maybe it should be impro=
ved as well ?. When the API can distinguish (like here, or in nouveau), the=
 kernel does use (or maybe should use?) `EOVERFLOW`.

IMO two failures have different semantics for callers, ENOMEM is transient =
(retry may succeed under less memory pressure), EOVERFLOW is deterministic =
(the input will never work). Using ENOMEM for overflow could mislead a call=
er into retrying a request that can never succeed.

Thanks, Aditya





