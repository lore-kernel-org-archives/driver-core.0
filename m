Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7026047ECCB
	for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152756; cv=none; b=SY5QFZxEY6eqj8ARLkaRI8T4HjfAE5/eg0XHkoxoUJB82FhQlj0tBE59FjNzg4JEb6a8SrHAGUt64ARBCSUzmaqx/ghyk+4vsbTG0mnPh9QRm9fWRR7xLkN7ydLj/96jGxtdJRtHr77iFWnRjW8v87yNjm9zur5RzxlL671GJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152756; c=relaxed/simple;
	bh=NoH99aicsFlriFvr4iO9OOUEPgUPA3yDZM37SVANJLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AW8pQRB9Kv8d1QAXIRFv27c4OwNVCURFxh05cPjblOCzYQ2a6YEU/TVd0fBFSe6r5RbEcvFazgQFdzuAshOZnBj4fTLJbWu+PSJ3rp/2PRtRcI6HUMmo20KTkdcMR6ba+f02o4Y9UoB+bpI1iepmYeTnTPZcOIGNLCILX1gV29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gHnRs6kq; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gHnRs6kq"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0761224e1so27965755e9.0
        for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792152754; x=1792757554; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcrR92pfRDgRPvJUR5cNdBc0H4+TqegTvgg+s0NCJZM=;
        b=gHnRs6kqBXl7z+kAfPnKYxUFSnwAoKS5BkrPZINd3jMF6OxY6hJxFSxvhQGVyQH3t4
         fS3NWpuP9kWAdewMhNX3bvG1DOpr3yYMb0Yt2B+cDMhmt2a+cH28155oOaUWS7zz3Xts
         yOTEpO07662RA6Pmzg5FvQTglXUEutwQ7oJ5YSB6YaZHB73Dzrv39N77cs8o4TaG1CfQ
         5bz80YNgnnMNjRM8s8ZLv+cyI8IcTiCKAtREC1uOg7oS6n8eSMWgr0qozdlUSuQDUzss
         yqsae7AOumOD/nqC6r0oIEkyKsDL2XzLYRdOaVo+wmjQj9OkQAlOWVURR7Z3gthwGWqi
         jlbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152754; x=1792757554;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcrR92pfRDgRPvJUR5cNdBc0H4+TqegTvgg+s0NCJZM=;
        b=eorSax0sbP3uUp1mI4q/5PjftsSZfXXPasd3bwoXGbCl/c1g9EGkz9m6E95apXj+Zj
         R2YM4ss+FOkaaT75QIwU8/cLFuKTvtCI3ov6VUcIqoYFeu68reyaXmyzqDi0FE9yuzsf
         SHTj/NuexFV54A6wgHnJswn/tEOFIqZKyaZmCWwJ74j+YKn7tTVKrKOCAsqEVfGDDlPc
         6N4qUkxOvAiMfvygQlbak0PfuhDWabdFKziUkqMQt6cF4xDgdyWmhySEg21scYyemAHi
         ppttmZ42iWMNunSlzUcgMQmaLa1yBWvCpvtAR+B3BhkTNakSJFCJnTgqvhAE5zXlFH/S
         mYxA==
X-Forwarded-Encrypted: i=1; AKwUvBwtEB5v1WzljI/5NeaTsPKPgMeNI9p3uwJZLouxwZuJ4/0W3McAAsj4pHMSmzeLV/tWa2Nss9dTrS3BsQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKLm5LOsr3dsmyqASMY0X3IXYg3UmMa3ueVJoy4dCTzOKip8zra
	jvaOX+izJGCyLaxtuquyLuAHUI2rh6EbhG3rWR82ctHvuqDAoxwAKt+8FmMzGvuc3Z0byOWUm/i
	r0lKFrKW1amQ61cv7VQ==
X-Received: from wmdd8.prod.google.com ([2002:a05:600c:a208:b0:4a1:787e:6a00])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr446361805e9.32.1792152752925;
 Fri, 16 Oct 2026 05:12:32 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:12:30 +0000
In-Reply-To: <20261005133857.1572243-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261005133857.1572243-1-beata.michalska@arm.com> <20261005133857.1572243-3-beata.michalska@arm.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016121230.3724323-2-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> @@ -223,6 +225,14 @@ pub trait Driver {
>      /// The table of ACPI device ids supported by the driver.
>      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
>  
> +    /// Provides driver's PM callbacks, if any.
> +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>>
> +    where
> +        Self: Sized,
> +    {
> +        None
> +    }

Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated constant
`const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>> = None;`
to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?

Alice
