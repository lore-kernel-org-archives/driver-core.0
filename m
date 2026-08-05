Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8A3CF1F6
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950464; cv=pass; b=pHMsggnz9eN6EApSweKPHtKa2CqDc6HJI0k2Ke1GW/gfcEYPrJUjWe+f0DE9PNUkCSUqcW5cqKmXX2UJ3cPaFLtfPnSj9YFbS7UT/pLbcs/R1KwL6p8g9dZDL39SgzyZWUaNNRVRVAHjM5/UtPjegWKn7IN+lDO2wHDKqqdOX/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950464; c=relaxed/simple;
	bh=f+1hgjoLe+9OAau5GDXmSyjb/F1lcu3rz3NObPtffwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T32vmRCrDLJV6WaRHZwdc5gEuUlsp1GWuwo0WMWgdP/FT+sZXd/2e1Zk82aMxv8W7fpXeMzoyoKjYAEwa79kYANlthfkTFmvG3lDptpF8QJGw+ae64Tt/dyPaBbahi4g8Xq4VnlG+4DaUDAp2uhYuOGr9sGlemjsvxPTyjefPso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J365pTNp; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J365pTNp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc8311c6ddso1672335ad.0
        for <driver-core@lists.linux.dev>; Wed, 05 Aug 2026 10:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785950460; cv=none;
        d=google.com; s=arc-20260327;
        b=KL1/BuHz1sjOfNVClrhBjMKC8FY+e/6cwZSAcJayVtf+FNeGvVvgW+e92t7MG4kIM2
         1xZ6cHXGENLyS3DU9VDAOo6YPLWqBAMQUgD9DB2PFNikGdfeROOtP7owxi0o+XACD2aM
         mO7yYl1HyUEFG8WWrzrYZziPludG2dl9XPhm4RRvTklXPXlt4HAvacVgqLO1mJjfwIDr
         RDcK60YoumUuidN/kbWtGHWUeLVmk0cSRP7XHPemrdXBWv55x5Eu2VsKXFmfZGX8j6oz
         cP9IW27YMHSpS7iLVUMrhkKSjMpTEk7yixTpDXTGlDFt64B2rKVHzYqtev+gnRAJWSo6
         blGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cz1E8dA+nCFkDM0OHZhKzEI4Qib+t52DoabszOc2ICI=;
        fh=afViV6Y+5Tq1g5kZTkxyGxSUKXPk0qkySGvJJ0ipfIg=;
        b=TRUpQpSX0QBvGIt/VVVmxI39n0ETT0e6RCxRmr4/7eJKK7YTioamu+533/+47GXrz/
         vphSniqyOrjlmtqbhwv3WYfRvzKoJrqG/whojJLEenGM5AveVek0jFVNBOnh/05Am1an
         fNMkku0FAHA2adz+YONhrZo4Ve4LJTSv5FaHn8i0aB3mqSINUkY/lHaiAACJbQsU0PsH
         uV52E8ekvCdoxTVQaCoc0VV7dAjOMiVasBV1CSywtdujm82ZOWOfCVJSzhwfzk9uOOgM
         3QeeaZALU1tDfs1E6jvr+X7WYv78biy98OgFWWjmcY5fCy9bcFrDAjdGG/m8N1ZLEGo3
         jbAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785950460; x=1786555260; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cz1E8dA+nCFkDM0OHZhKzEI4Qib+t52DoabszOc2ICI=;
        b=J365pTNpRsuwybnLxjwkT6D8QlmwRzKGCbN3De9Womd3nrKeZDcKQH5DxMwfR257LA
         WyqEhco7Gs3sgZApLrSvddJLaLA64W0k3cV4sZK0j65wnjWSjbRTxBcmnzs0klwsSUlQ
         BPdonTDxqts6wKfhBUeE7xEWfNO3deNEcIn8c4/ZYPUcOitL8liJ4+6ogNGlQtS/Y/uM
         LILB231nXJlHpTcuRjw/MISv/z7OJRDGhLfKm3F7qXMaCMefI4mz8MNTggq7RSUjB8u0
         jeQe+pqk4cDPS6UhJzxMaOyQI3rVbUofz/6ZGus2qqjgcctAK+X1PqR0mPxL1cBb5mD2
         hZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950460; x=1786555260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz1E8dA+nCFkDM0OHZhKzEI4Qib+t52DoabszOc2ICI=;
        b=CA/Fc2hH6Mc/tymno1q5lP3/C44/KD0Y5bwa/MfHtcHB6cyn1D4RtuNd2XXul35H/K
         mSgJfsjnZZD1VUn0k2288NcbcvVAw9XPcWVM6ExD+LxhnlwC3w43OxHL9Vud85S4Yvrx
         Nn2HT4l0OXB754cd9ln+6O+KnWJ1qb7TrzsqRHgKzNgsvG314DorlRcEGXOYvfX5S/U8
         a5S834K4apESsCQyyh45GmGz/U26LxgQDQ1Dwrhk42/3w6zn8UZ4ILUAdF5bZociZ6hP
         upKkyBKpuOtSoVgoB9GyJgw207yHjHn8BSFesTj2OHRm6vbYkyq/X6c39eYHM0k0670a
         ZRkw==
X-Forwarded-Encrypted: i=1; AHgh+Rqr+haIMwvTRQu8nzSfZox45btrT2w5v9IYiHZJwGbi7Ln9qOYU/NWwsxKiJGFdWeh+sj1+XmQcIoVreA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkbfWlbD1r7MVENk9xvIzI4+5t6yJydS74PVgCdYpGIc13pU87
	lpSlHyAZ111ka3oAqu1vGB2U2/jlHSJkERU34RsvBCL4watHtojIm0KzbvQJRWVmoh5uyfVWlCa
	9NDzSD0hCHbMjtTfN7kTNlU0O3ISYFT0=
X-Gm-Gg: AR+sD10RsQvhFtd+z4+x5Qh0Y/25KEEfE/pIXcTQCInKEKw48TY7dEqyMLRv3igdS51
	DKi9HE/56upkanN/nrj7zpDHBY//Js9YGq7zLetlV3lckh66Qirtoj9p2F6uIciI95OH2vnb0pj
	sIAUbe+7sTob8sAxQOieDupdncBims4kyprRoSx/AUqjOZo6mX3gIx28s624+wNBAODms2P4o4X
	f7wsOURCyqyhOErvdNxyhabaX6VA7qHvtNxdwdj/E03g2E/PppoE9nJMVUYfK1MSvXgPj+8CcP2
	giNtGhCQpc93BYPLWZGHgcKg67o+XKEnUPGXdUvXw1nea/ifPlojReOwbNL3plqi5jPcpxZWVq1
	KhkvkPR2FkrwBNb3kdmvkgI3SQ1qjHbUWUFBQX8E3Xy1r9nmdUKTmzGI8Fn2c
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr73522915ad.0.1785950460122; Wed, 05 Aug 2026
 10:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0CoR7Z5B4-PH8GYYbWlZysVJpMnNLTFzTO0tBlOpJQNFiQ2CPrhdjyD4-4jQs4n0J_1QqovCd_EaYpclyigEKw==@protonmail.internalid>
 <20260628095132.47753-1-trev@trevrosa.dev> <87pkzw9aut.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pkzw9aut.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 19:20:45 +0200
X-Gm-Features: AUfX_mwN2wRwvmcNPuq0EpEyS5qgayFtXbsdflDPhbgmFxUJf-YMOIqJTLTJEvs
Message-ID: <CANiq72=wo4LOfa3hrJhTFr8UzkchW4QQtUespCTq7qRJvrr6CA@mail.gmail.com>
Subject: Re: [PATCH v6] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Trevor Chan <trev@trevrosa.dev>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, ojeda@kernel.org, paul@paul-moore.com, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, igor.korotin@linux.dev, vireshk@kernel.org, nm@ti.com, 
	sboyd@kernel.org, m.wilczynski@samsung.com, boqun@kernel.org, 
	gary@garyguo.net, axboe@kernel.dk, daniel.almeida@collabora.com, 
	shankari.ak0208@gmail.com, lyude@redhat.com, j@jananu.net, lossin@kernel.org, 
	acourbot@nvidia.com, markus.probst@posteo.de, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, david.m.ertman@intel.com, iweiny@kernel.org, 
	leon@kernel.org, bjorn3_gh@protonmail.com, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev, sergeh@kernel.org, 
	matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, jack@suse.cz, 
	ljs@kernel.org, liam@infradead.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, ptikhomirov@virtuozzo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 11:26=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

In case it helps, there was a v7 of this one:

  https://lore.kernel.org/rust-for-linux/20260628100731.64885-1-trev@trevro=
sa.dev/#r

Cheers,
Miguel
