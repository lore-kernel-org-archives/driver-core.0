Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5D03CB2E9
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897939; cv=pass; b=M8ETdH91v/f2zI6NFTE4ISsNJLlV2AsT4hH65YoJVIhKtjgZBqjjpQdSVaMzREw//s4FIrFrUmu6Ps5RArfCMx5xI2G/ubEgSAEZ4TVDCqz3JhZZbw93FucoW8OLxor3JW8oAUiU3kQVMC/zs8UshbfAkd9kCaI6OndqBAYLmjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897939; c=relaxed/simple;
	bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WNq4B1rMUucOpR6Uvf18EOm6Ft2L4QMGqAzxLiSZ7URQiL4BB18NBoT38iyk+wFbRqABw6S1g8qIOwe0e4pcK/enm6gmdeb2uc4jRy8Dbvq8yUOHd2ySfgvW44ArWDfrmPUzzqcEQTyNBl0zrXga86Q5Kl4lgmtN1bT8+mfEdEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiyuuq45; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiyuuq45"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fec3c1adso479925ad.3
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 23:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787897937; cv=none;
        d=google.com; s=arc-20260327;
        b=mTvX2AzEBeIEZ5Fq5fV2zmMHdoixq6LslyKM0KkHtfvz4jNFS4VP6nhPZ6kQjwp5iA
         Xnl4YRE+5RRmFXZsLgwR+KzFqKHwIClDYzIim+FPiSU4HIZYE6p55Q025rL338cJaJD5
         7nUJGQk+APFXP6d4H/18n6KJaq/pJD/Aj3IKfgLH4iVBkoSmEVhhGmempQTGBWuW3cK4
         bzaRgUOkOpfATD74sKmssnBTwupv+v5KY9fM5pcbtXGm2XwpaUpB+G86EFJmxjXhxRIr
         J+A+nU2RQqCny7MqGvYydP2jV396WqtN8ELIsuPHNCqPDR5At0vfWMiijio0ESE18hTF
         Wwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        fh=nsu2Myqb6g8VTEw+XcB5nMSifX4Ppw60zi6Kpb3UD7w=;
        b=nzP9Lb56yUIX+WNp8pJicjqj4BRfKFjlGJszgEvXigQH4wUIRS9qW/D2kGGSaRYYUv
         br22Zdygl36pZuZyltVDi90C3If0MxVcOpPQgCwiSHrbCi7wxwT12FZVx9rWfXaN08TO
         1qxgs61dW+fStCi/8U2TeDEg32JZcX5mKFDhkOaQDYmtOsDktvA3sKuVLmdulWRdg/bv
         hH21YQ2dralWmkwmA8mxrytSoOgmibFfl5iLdhpfBTPzybJOME/ltVkPyqzO5PlFS/NW
         3J+N79ijQgQ1/zML3pcWiUfYiUyciLx5RlRj9YhykP+B9Hha3BP5LdL8kchxdAZW4Jvp
         L4Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787897937; x=1788502737; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        b=jiyuuq45coaZgs+TZ0/QBxAavfIL7LgqZZNCyLNichKCEjYBIb4bPW2TfvgEEt8WCF
         eJJ4vSloX0dWnp0gYuy4qV82FBI0T3v67wEFfk49TBTD/qjOlIf80OhGtcUnwDBuzX64
         q24WomUXoKDCMS8us108qLWKPL4Vqc6eoLmqTG4obtZ0FmH+3y2PT2bHMo2aH68DLOVw
         qQAT2enM9DbC8UIAB3I7nk0D/MhBzLIsR2Pcc7Nsx6hTEaBHOCzeQX5AC5foeP1dp9SV
         wSS7JwUwrqQyE1pLNBECCGXCMubOdbHiBLznDqmqLl058pyZ+eGZhbf3xX++LAH7+G1I
         jiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787897937; x=1788502737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbo+hx/BNCVuY01mnvs0yOHgPXWSzk7RrYEHpl3HxqQ=;
        b=bAvu+AU50J1xyhZZGAhw+buG7zilsTTqwuYyALQIAdjlIvSjqPgTXfhBun7RMbO5b7
         bcBn4npb697Lb9PMSYz9Ar1VP2IJY2m300FERLzNTffJqzooLn/oiumnt9ky5QXp9+5l
         3O0l5QehIQjH8aDEY4u5C9DTiwiD+l5UEpvz5UfswCR7QU6CW1b1NvV51goJpZ7Yi0wR
         fn4kbmWif3Mb6sDA6RtwASMKZJilsx6j8+vUPOFUNprrYbAbAr/5D2RvRYTTiAlKACKk
         NpUJUTUwxdX2M+nDaZ72P2mREKkz7BpkI58VVdrh74cC/U8YQyMM4oxn+IdvR1EfiwT/
         v4QA==
X-Forwarded-Encrypted: i=1; AHgh+RpTX/N64TWGpbeeddgyOzdreWqKcVhmasQpWJOIYbMDLFTl2tw+7wTJE/j4RyR1TYMFQ9ATuzLE1rSv6Q==@lists.linux.dev
X-Gm-Message-State: AFuF++ko9gZ5Ma+XlgR8b4jLNoizjchZyXnlpgtCUs2DBqqU/UkgugHD
	QEkK8pWGa2haBgSS8XH9zJ4d+wWDQKAZtXycfne5V3FB+S+D7MUmXMgJNDazRyNbBjvAcaJGzkW
	hgPdVQAg+a71bQov4oabc1HZCcwBnPlw=
X-Gm-Gg: AR+sD11AL36EX51epwSoGhkJujiqs26ITFZoNkpNwjHZ/YTrt0lEaqkLs3pPh3UoRhQ
	9EXwlMw9dCpk3nbaYQuhd1p69EmU91lOoZqZwYd754mjbvbJ1hw4IXq+tO7Jeu4Hh/F0l70Oznq
	CYDMlbOqQMwxQtwVOunJlzG45NAJ3Ibn07cMhVseWx4ADeoK8iw2O3gz+Kz6Z/BJAkh0cYvi3Iw
	8SFxP6q0EzGDpD+kDlQ0n/Km7o+71G8gHEimCAue++jtaKbtki7ExowAnkv7e+iD/w9Mcfd8jC+
	SO+ywHgejprxg5JBBRkYlsujt7MwtPVeAIDh7SKcDNSgWlLYYOE32Plp8CCMTwjEABCr38+x0pc
	Ha8w+ZZaFOXhAPQA8x+5nrp8Lg7UCJjdSbPWcCaAP2dg+J0cZEXStQOEOw9RL
X-Received: by 2002:a17:903:4405:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d74dc2ac34mr44339125ad.1.1787897937076; Thu, 27 Aug 2026
 23:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com> <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
In-Reply-To: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 08:18:42 +0200
X-Gm-Features: AcwNN1ViDyJ9UsnVnyAiW233fz48dbS3nQFZxVUyoEdNjL9Bfhx8up1zdVsAHFA
Message-ID: <CANiq72k3D_zyfsJ7aXRvpdnRTznRkLJNccYmYEWJt5SeO0r3TA@mail.gmail.com>
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
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.=
0")

Thanks!

These Fixes tags point to different set of stable releases, but we
probably don't care about backporting this, so it is not a big deal
(otherwise; we would have needed to split the patch).

Cheers,
Miguel
