Received: from mx1.mail-out.lima-city.de (mx1.mail-out.lima-city.de [91.216.248.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CF325B09D;
	Sun, 13 Sep 2026 21:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333702; cv=none; b=qfzEfxQ1lwwDO0iJKerZEtGHRcs56bpIg0/vhypSM8xFzQLN9vRX71jS8BkmUBArR6AnqB5rZMYxez3vXPQFGon36FO7bY9Cve/6HNLIGUSEWPZE5pVDsCVFU61Cn6GHgfe1zqBIYbbOn3cwEmISrFAvERVuurraF0CIOR0yUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333702; c=relaxed/simple;
	bh=1nOAV41JRiEkn7rHromEqYHd1MBILhut8xZP4SO300o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrJ5znDq725Es6b5VYEGQuKxNUhVTHXyBEUuWwiOebKIW6arQSyYRQVFx+e++2zgXP33oUWqYu0rPv9CD4uVwgyMz5a+OJfnBpqoH3HeEtN0qqnayySnNJ/R7Yrv7mmNx/r6aIfA0MfqJ2u7XKzxBmHagjROGNVO/bDOaTUxPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de; spf=pass smtp.mailfrom=matt3o12.de; dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b=BXef/1Tp; arc=none smtp.client-ip=91.216.248.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matt3o12.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=matt3o12.de header.i=@matt3o12.de header.b="BXef/1Tp"
From: Matteo Kloiber <kernel@matt3o12.de>
X-Lima-ML-UUID: 9c5bb7f3-3e9d-46dc-8fa5-ceb4fbd37a3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matt3o12.de;
	s=securedbylima-20230709; t=1789333698;
	bh=1nOAV41JRiEkn7rHromEqYHd1MBILhut8xZP4SO300o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXef/1Tpn9tEOQ71hlicYdSa9GNetRhnazrr8IzSC0hPFio8yIOHVRZii8jjGlGKA
	 uigpdKC1FkoDDrAgALHIT+zDfqHCE3FoUNu9unVqYTnt+YHqdDrfjSw0g+QnsQurjM
	 HTulRh93xlwRv268q8HDF0M2H0WFaAQ/yh8DzI8f+3t2jhPln8+GMoMfZcKM3bDI9U
	 70ACkYfs9D0CWhanETkOTFPxKyPpFXGS4aTi++aH4qE3qR0l/0OS8ezVtgwssFYgJy
	 rDlPJOtXl3hfK+Ja7Tmuu29+uNDMkNuNOh5mymZbaiDe9E+cZy50YuEAJeM0MzY7go
	 NtGp0P+H+4N3A==
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	ojeda@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: scatterlist: honor the device's maximum segment size
Date: Sun, 13 Sep 2026 23:08:03 +0200
Message-ID: <20260913210806.125589-1-kernel@matt3o12.de>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <DL8QLYLQJEL1.3F653J67DYZ47@nvidia.com>
References: <20260831233215.287881-1-kernel@matt3o12.de>  <20260831233215.287881-3-kernel@matt3o12.de>  <DL8QLYLQJEL1.3F653J67DYZ47@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon Sep 7, 2026 at 11:43 AM JST, Alexandre Courbot wrote:=0D
> I guess what this last paragraph wants to state is that no user is=0D
> affected by this patch? There is another subtle user though: the Rust=0D
> DMA sample.=0D
=0D
Yes, that's what I meant. I missed the sample, but it wouldn't make a=0D
difference anyway. So I just removed the paragraph in v2.=0D
=0D
> nit: if we rename this variable, let's name it `max_mapping_size` for=0D
> consistency.=0D
=0D
Agreed. Fixed. Let me know if everything is fixed in v2.=0D
=0D
> It also means that without patch 1, nova-core would split the firmware=0D
> into hundreds of 64KB SG entries, which is not breaking but still=0D
> something we want to avoid. The correct fix is to make sure that=0D
> `dma_set_max_seg_size` is called by the driver, and while we are at it=0D
> we also want every driver to call `dma_set_mask_and_coherent`. Ideally=0D
> we would use the type system to make sure that both functions are called=
=0D
> before any DMA operation can take place (using a safe interface), but=0D
> I'm not quite sure yet how we can do this.=0D
=0D
This sounds sensible indeed. Should I open a thread regarding that on Zulip=
?=0D
