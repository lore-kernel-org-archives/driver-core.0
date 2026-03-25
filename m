Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395C3CEBA5
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439068; cv=none; b=PlFeHBsi3v68GOlLWtA+G0lEy81sJHm1JojTNLiJybzRk4Lb8jgUmwBhfvH8cvIemA2Tx0rxhP3uAQ2gAdz8AKZSk6cPQ87cuO0nDrHVbEMUadmmKRCxEWVt9Ow7gnzpi/kGdg0lcZlrGDLMS9kcduia+MB9zHkM6UVBAKflgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439068; c=relaxed/simple;
	bh=QpeO54ZMy+zY8vE2iN9PG22Q0G/v6tjmzjfrkPN+V3A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gdFffVc43y4SyR/TqArpJWAou1BYw4EwZaYFzLnp9vdtQHaDM0VdKHzUO55b9pJmtgsjxUAkYeo9exg3J430HMKP8LCBiOMCzS0vvK4zUm/2O39bBW8YyasQd6ZAGdbqv3d7yNphpJBXztv8Zr119hwYDSIIzSPnc6FAaoAUyN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yektntu4; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yektntu4"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-667d8f30c50so7420834a12.0
        for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774439065; x=1775043865; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
        b=Yektntu4B95ft/5qmu8ficN0ROIaNxjpJDmzT+M9Zigs3Whae6Fq2GXWLqo0sgfaIf
         7/Wbe5jrMeNyWHf90SjVQW8ZqH74CB5rpXNvQpH3H5I7xWUtmirkbb4eiTtwTPCjUJ9O
         p9XzblCUPCewXxQCEP8lkkdoqq6ex886Rh7nER2ZdXxUxaTjL+/pMztp6t8v4ct+yRH8
         j4zML8fTZ6nK9600/XLD8h7uCQqqCHyqEc5J03ty7e02y9Tc7xRzz3IHxh/xQMfqecFY
         LtmgfNEWx8OYktIqi3buj2LZVFtiv7Jpcr3Ci7+kp5YtHyhbBAJYIZAgcspeGY/dv9/a
         H2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439065; x=1775043865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
        b=CfSHnDbiHtDh9zSwI0pGVOoguAlt3V7x4IMh22teulYc0AmO2JtLgn1/w9z6h5vJGE
         R5iOZBepcqNcCLje17PDk4DUuVE5+TZk5rvc53eJL+rcC8pSgeOBefwqsrWV+x4AUaVx
         tprYIlKzFOJLQC4l+KwVQEkZhR33h7VNXnlrtZDNJrBQ/w8rXEZDxso/u3o8QLnp8xig
         Nty5Q23YlsLvthuTkqo/wNYtIW+b827vNIVjZPzssCzrKJfk6Pafanxn0jV6N4Vk0DMo
         OhHVS1JRJYcx5JknHspj9Cf/Hcy0xM2F2YbKaKx6bISjlquU1vQXgHV/ud8r3W7SjtHe
         f/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2F0nhyvULDRNYpBPnbWjmfU4EoZfu9VuCFFfc28+Yi8W9x6AVgmweLw6CJratuAsdsnFqDJ2Y80KXzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+Uteofe+7awaEMvNqyjUvfN8b1+V3mRIjz963TL/HMFM1geLP
	/TFWBaTmQviZ/+abilwyAMaQS0XL782kO5hMant/3lSWwgUiHuoJP3BBlY65YL5vBebCsbxjOvf
	a/qMI1cVplPgX4rQUrA==
X-Received: from edgg21.prod.google.com ([2002:a05:6402:1ed5:b0:668:8a5e:6647])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2116:b0:667:7fcb:3a2c with SMTP id 4fb4d7f45d1cf-66a826b30b2mr2152133a12.24.1774439064945;
 Wed, 25 Mar 2026 04:44:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:44:23 +0000
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260325003921.3420-1-dakr@kernel.org>
Message-ID: <acPKl5HXwd6e4Sl2@google.com>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any Coherent<T>
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, abdiel.janulgue@gmail.com, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	ttabi@nvidia.com, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 25, 2026 at 01:39:15AM +0100, Danilo Krummrich wrote:
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
