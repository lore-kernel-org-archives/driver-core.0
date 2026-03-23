Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D9A1F03D7
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774229945; cv=pass; b=HeyREgQD8fkVnoa0CbrJVtIl5O/Q6upi29hRVGwLEXE6bQJnis+tk/ItFUyJG38YO3/3kPAtEEZqpgVbRrU8b72cKJazceAUGJhmrssiWwdi+4hIOiQr7p4/mbu/Gbolw05JzRUbOrJKSjAjla/Cr9STY6OT65mhUctsgWk7LeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774229945; c=relaxed/simple;
	bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdk2L9SVe0YlHUIqUdc0wF8Xrf64wdCFq9sDgFYYBeUL59af8zC90crGnHulE2y6H2xmjq65ZchT0E8GGl1NrFAGVfOKwwLLBK7xNIVm1OqLfRd6bJCqTwmZPVrLULr+5hdlQ+8pjbnulXPQYhwBPqdJeu7vMm/sDeXF1GlYb04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBkumWp9; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBkumWp9"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0c4194b2bso130594eec.2
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774229943; cv=none;
        d=google.com; s=arc-20240605;
        b=HbiTqLUDIt3cczcPCiiJvd/tlzCQAsP63ka9HlWUoe8/3e00RcQfEZTWp7HnDDfHEN
         YJRNU05dSU9GDk7laBax8xBOmmxjCJqE0SJcfQjy6W5Lixozxkubw9XgxpajClIo93Q8
         VzMod1wqjzW4Sqp1OgNZzZRFZ1ACIDziJZx/ntRBWS4C4SBIYMqfQoD0GTDllJe6kKAd
         3tp8J7+1qYgEnSnua15yixkB6QN4e52Dq5Ducb1Pb+sYCUMp0kkAJNz7e21dZqRnpGbS
         Nh0Q51KRuDs1WJMS9NBOQz4VshsHI01oqGO+1MyIeVPMk5NF4ISzCduQK0eIprXiKRo2
         BgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        fh=A6wDXUy6BFk46D7kDrH9DzmmW6fMJHkyv8kvDLEUBgQ=;
        b=DAJFVJcSQ51Mqnr6ZVE+BQ8lrpFbFEMY4JcxDOesKxou6BCm008HvCFIPLMankGcyL
         OXggH7QPo1hdmo3kmkd4w9rWAIymJX7Cm/CASxK49F1PtCZJCI0YOThBOnEqJbz7QadT
         B98kGicQl69rtA5q4UMwEPi6cKGzqeaJ3g+iZQF1DW9OgwTgw41+XiLzHQuLax45AYKn
         arI8Ok2kiwMWfs3+SXuenLk3R+NSB3O+3QCL1jhYyby9wzK4VAW6e95GNPAFqre8ZMAO
         qXBM2Ph8H8k3VAHG9GlAbWpkBuzCmt3fb3n1dcYjjsotCdyHVc8i2ia7JTvdnSW3AaxZ
         fsUQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774229943; x=1774834743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        b=hBkumWp9q/8laUpUV3+3dowg6MmXO6ihkryTsCL2tYksWmbFhEtMb9i5FcG6L7NPsx
         US17y5EkwG6gVIPPtKypV/rxpA0MsgHfYbQ0mvRsOjo+c9Bjyi/u1Qw2EEus0tuYW1BT
         thDZcN+Du9AH8zFv/otCa/BcfRPr546KMAZXvjzCCFOzDiOjmrSrFrUHM2YW1sc81kh4
         +5eYFDeY+KrvCiurXUZ764i/xi1xgCgUMdM4dFHRnVEiaxi/J3b+o/3XE7x2KBe5dvut
         lluYUOKF1b7VX/VEZ/eGlqiS0w8q36TXA1nnjkgnQrHaeeZaT0LSW/jDEwuXiotFTE57
         tmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774229943; x=1774834743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWe/PWDzr8joF6JD6nQ1XEA2RrWXW/kkJAS+Kk9qRGI=;
        b=iivM9GbCN6R8Tc9H0/USBxqI+IbjIsH0Bo2fsarFMrfnA9hoeIZ0f9GUIy4b9BdjHC
         isQZzdLnUbSjKF/JnvxhZDLGwYMvEwpSO5Js8X23LDvF9wlsGFtTzCsICadppuTRMYvV
         GTIyRSyqbO8GdFr7APQjs4ntP+XMb/I61ZOpODlTKX53kwapKx+WbQqAm9+xd9heavfE
         ywoMb4lc+nKP0ERB6BjSgJwJU5eaeGFQ7HJW+1KExdXjzbFc6ISIwCSwlfMaDXlFc26Y
         /VsDLOWAZHpK15vdPCHpOtmkpnAxS2AhSUa4vQXyRXKkwoNtSr8iSXlFMklrkau6Gk5V
         1C6A==
X-Forwarded-Encrypted: i=1; AJvYcCWi1g/BxegjSIVYh0sSPPB7gj8pbSldglLiI5GR9WHtpBe6uEt5rDmZZQa36h2xMUDxan0nQpIuRZX28g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYp4KMI1wt4mX1eoKuUTPlHo/tc6t4GoxTfXgtgilNZYA4nBc0
	BX4VzTIVko2DqYyEK64/bFQKy7cDK27ZZX1kOrUZeCRwf6yI8gK3VjEdARBQTcmF3fXiF1zEJNp
	kk9BQ/8yRHjlU7K659mF0PiTUCndllm0=
X-Gm-Gg: ATEYQzxD9Af7lWJfonAiPefw4VRHl5G1oa+3Ex7OT12pNNKXZlpcrDOnc/Q1n2dUJ+z
	6dqevHzYjICftRgKPN9dhu8wCdS8ZN7kMs712R6OZy3GJCgT+IUUojyTBwf3rS5K3mcC+LLvYj/
	+zcuvsfJvAKu0JnIiFbqdYtSTaoAb4lzFgJHX+FwuqQD/8yCtwNvMrn2CFREanGFKIowl+nuslv
	NsHtiphdGLX7s1VSXR1JJJB7rzbxFiefHdjWIC/nI1wo525+QnrTTXoXgZSVpKQtVjd9YF/FnuR
	ERdmaGLrbloC7jrdK5ndveASs6CRFoYCzyCkC1i7fwFxy6cvlyM5b80F/azLx8w0Z+Onpv0VImy
	5wiWftZQ4D0WRXaX13KiVIro=
X-Received: by 2002:a05:693c:3118:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c10973f6e7mr1912078eec.5.1774229943149; Sun, 22 Mar 2026
 18:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com> <DH9RDC77E3NE.3F8BURMZ8INBX@nvidia.com>
In-Reply-To: <DH9RDC77E3NE.3F8BURMZ8INBX@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 02:38:49 +0100
X-Gm-Features: AQROBzAdgpVg6NMG5khS7OAHwybEFX4tptApRBIZ_6EE7KPQ0oZWmoN7Dzb4nwM
Message-ID: <CANiq72knM0_w_eHbu1qV2Ps8KbST6KcAZRtTH9FEd_5sRMqWdQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> (sorry, assumed my Reviewed-by carried an implicit ack as well)

Ah, I saw your tag for #2 and #3, but not #4 (nor #1).

Did I miss it/them?

Thanks!

Cheers,
Miguel
