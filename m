Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFAA311C15
	for <driver-core@lists.linux.dev>; Tue,  1 Sep 2026 00:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222057; cv=pass; b=BO4Y6/shXmfv+E2f9uahCR1Pm+MbH+d8UGolSOokPFjsDM9O/3559H28t1VKozDCxIbsD5npWngl9lAKCNXldT1sAs7PfBAORKtCsKWs5jcJq1gC8ppcK1MSuWtR8gHi4mGLJHVTw/kUuZd9BMqrLhi8aA7PKnchFuCcNPaeLt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222057; c=relaxed/simple;
	bh=yKxhql/Y+4NXkktL9/Mk4ryjp/LtyC/+Dj6BrfX5aDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AS83IxaxZG4Y6NAW525xf/ozCGnylWno+TIdxTFfM2jd46YpPvcpqLuUdC7pSBIgBBThAxWj4D/uFGInqZspFJk7xe+GJiV/MhRO1Z8gMr7qbuFpUpNPq0VrTlTS0huFx1nEypnVfs8n2+G0fg5IPH4CYFkTDypTZj/UIRa6e1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pszBXjic; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pszBXjic"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedaf975a3so727096a12.1
        for <driver-core@lists.linux.dev>; Mon, 31 Aug 2026 17:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788222054; cv=none;
        d=google.com; s=arc-20260327;
        b=DfymSGPcNoHEux8gfK7YQLVwCebDqtXrQ0Z2DbSmt8oOatrU+b8V1DuQC5uDwB47TC
         kTp5uNHPz7RDEWNuC2OSmz3hL1PfOofaK4b4wVkw+b2TuUQ8uq3Mfxhj0ETdtaaI8RW0
         Fvn7tt/uDn7gn98oPlqLtmexjf4lwu3tfurOM2g2I5j8AbBQPNne3azh3pOFXLd8OtdD
         DTJ1VB/TqrPmwfZ48MS4DReKFjhClOKscA6R3VaNVIItpFvsqSofcoNTWgKuiRUPQ4DK
         1gLtrZKf9N5IZTKzFaLyI1nTr0glATKJmjjuHw1bDemkKLUwk5bQdWMeNnwhWSWZrG6H
         2MdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        fh=Q2HaIruSD6wAvYpBhE4ZuGr2tsvTWTkHIp0//joNnmA=;
        b=mXeHR4rO6myNK/B/6yX3Xaa7vFYzvg9LLK+F6h6/02J0ueotbJmt8GGTTR29Iyh276
         p12ENUjTaemSJvA9jGQnoWsU+0dS20W31YHy4tGSGpoR9maaKlbs3WVdbWyT6AeYw/gt
         2JwW8qU3sbDf8A+e/nfkGQ53qcHRuMTe91XdheHvtaxtDkPqfUIW1KxCmEcPUl4sQye+
         uXXiZR80iV6thBuMvRk3JlqY0DT2b2Xheq1VzLkT6RIrPf6zmo7Enti/e+Z/4myEqfK0
         B75R0DtQ5HME9v8NR5AfDimh9ZNtx4rHkqjNW2wcXPQLVZ1nSD6CEt4nZk0bRgRErTwx
         0FLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788222054; x=1788826854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        b=pszBXjicbkP9J2Uz2pqlBegw4Ic26BNGfMZsB1siCMOzp/CYVjeaxAV2evcdAadvGz
         qkqN6vmMxROAkSFKPjE1JNCjpbuSPMXhKYFLX46DM1+UecTz/wzANmwHFDu2A+vSdk6p
         mewYyiHZuizzySB/XKNAGPyQnURpcg6jz0ndo6i19dv8NpWqeC1Xy1WyFxJ53DyqY95B
         wpWffyDSv2LhwCZ06CSY7+Cy6C1QL2HlVhZK3jOgKc9iiTRK+pXKR9KQmQmHasvCgxD9
         nKCPxrR6ZpdEpUTwayLzQBD6osPARYigDrlA+/EzYoOPea0U/TuNOUdoJPKSwMvPHfGp
         fWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788222054; x=1788826854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        b=DjR93yQmk9+UVHazQM7iLfdtAFboiXj8FMptke7pCE0EraZh/TFsSB3xEghgPsQx0w
         +w8hXDobnHJn94w8AGf5WYoXxrs6PfOReROdITSVl9SZoSDG7ShhzL5T9CNy2moV+BzO
         esFove2S6k+uANHprcJzQYoAYLAhlIMQ6eSnmIEQSCmz2ASH9HpcpPSQxH1y7Psoe2XG
         ixbqLSbGjnIzqzYkg9Mp6D6slVIx0d9F4SCpo1Hrkour5COu7dpZf5E6/Xyygteeifzs
         +tLDc/WN+SVdwaKBT+dolLh4q5XaYeGpMiW+tTkB4Re2JYcytXJM5RKCvfv0xDhK6ZsW
         d6ew==
X-Forwarded-Encrypted: i=1; AKwUvBw8ne0Cg1Nb87ZvZxlkUKS4eGkUtYT7M7RiS5HrL8HwODglZ/RbZGLIyVdC04210iAPU9wfIVaXvsDV5A==@lists.linux.dev
X-Gm-Message-State: AFuF++nyHewxFgmuZllrJZregJgaI5KDdPYNx+zCPUeukT3z8VH0wSTB
	VS7I3ywKO8VcqjpcC26YK+lJuL2jg1/iXLW3+jQUkUWUh4s/VfWUFDyQg+nVW8ICFQ2rKNte4xK
	9A20UsqPNs87hT9xk+NbA6bdXjM0mPDQ=
X-Gm-Gg: AYBFou0YlJUfvgohU6VRE88mGlW8pOOOn9qCkN2bYwtGU4iEZJ+6SNzLp3gr9+aJjB4
	PA5QS/qL0rpwtwTafzrM8ezO07JE0+oukEZOWO0JZWLpdCuSH3i//E3EfrVltfYoin4KU8AHlLF
	RxP3PkmcY0N2k8h8oZgK9fAaSuBpXQyobxZJ2Zbbiq/bf8tmUOSVfn0CQs/0OAatT2Li2LREXQa
	7s4TvtNXKDRHHp+rCgQODv2ohVNYaf/GZbYk2gLMeZp21WZfaWZY7zvxTDPlGl3wBRDvRJmKUKg
	jNzbhAmIMLLPJ2BykEzFadfgHoJ5BOJRrlt3dq+ANBbPk1GcmQHGm4J4Eh43JT3ELe78D1fYFoO
	uggbhhj9cr6RJOl+lSZ3xET7CdaLYf93pjt9SFghx/zhJQ+w7sEVewgCIDNLC
X-Received: by 2002:a17:903:3093:b0:2d8:d29b:c1e5 with SMTP id
 d9443c01a7336-2d8d29bcb42mr138133325ad.0.1788222053929; Mon, 31 Aug 2026
 17:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com> <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
In-Reply-To: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 02:20:41 +0200
X-Gm-Features: AcwNN1X5pai5UixP38pMLxKtm7ztEWzDX6RG0f92oKoJw41G7WeDrbSgeZIxUGM
Message-ID: <CANiq72mwh1XJO=9gDgxhtpdkRZ+S568MZE8LShQ0yDiddOc=NA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:52=E2=80=AFAM Mehmet Koseoglu
<mehmet.mkoseoglu@gmail.com> wrote:
>
> Calls to `pr_info!` in `arc_print` are missing trailing newlines, which
> causes consecutive messages to not be properly line-terminated.
>
> Add the missing `\n` to all four formatting strings.
>
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.=
0")
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>

Applied (this one) to `rust-fixes` -- thanks!

    [ Reworded to fix the description of the missing-newline behavior.
- Miguel ]

Cheers,
Miguel
