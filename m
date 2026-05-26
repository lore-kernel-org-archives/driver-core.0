Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35C23F7A82
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799080; cv=pass; b=JncRWCYqrr3Z0dywiXmY3HkBvHnB4VTET7v2URbGzDpGVIjNPuErVOceGvHO5ewW5mQibfgBWOGoG+dsdO8b35hQBFvBKdq7ZjFuUvuq8/tKxn7xnO/u4KcgiM+Nvv5XQMet3MICabTJOWLbCulBHohOmAwpIiM5GMG5MiV63jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799080; c=relaxed/simple;
	bh=mLnNy9oW/G+5ymzh/2kNXsDW1h67qK+6LVHU489oQIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEfZdFmSeRiEZkjHPMxDmbuGIlwDI+UUoH/EOW4mztF+bWOA9egbk8nEtxHaVrL3czb/9LOh6yKw0uQ+3Om4cAg5zBRuCDz/ejEeCnH2TmwCvNsIgM6ky35cv9dxvziBwOlCtKkj0UIviaaHuGXPLHBgO+nI/9XnA4JkMygVdjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJ6wm07f; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ6wm07f"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ee34d7e55aso1236956eec.0
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779799078; cv=none;
        d=google.com; s=arc-20240605;
        b=leHSKtCyBhEnr2Zn6/f+cEEF+I8OzJg2EHqsAOqwgjfBNt1WalZ+Vu8KuP1BTxA2x2
         5ftbj4AXJJLMj2nBg867qpjD/UK/spbxMOJAuPsHX+aCeyqbXLT4ja/VXZR5hMFoK2T3
         6ze4vm1gSs/ztcEdkyQPf57bX/Wx/GvmBOH0mJibXqVRRiSdmT64zDVPYylH6BebMcXo
         UkBlojL/DqlTT61ui/Npbxk++PasPe5WXEkAIrIlzI2Z4H0Vm+lDs1+YnZEKl1l+OokW
         WbSFhBV7n+hoWfSP4p1MtZaSMnsVPh1bFoFo5ErmftvTfnFlpsqtCy2IFWQ7/LaPNCMg
         RVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLEYxxo1EJ6dECgeEvUHoxB7lK2wiKidNtL5g8UvMak=;
        fh=fTloXpIQtaBTSgnR9rGNAeOwRnB2AYir+7tV25gM54g=;
        b=iJIciAFNQkNmCJZ8rrs6RVYQ+T0sKfuAMCsMf+ArsYNjH2lM+yag3kUhUNlP88lUaz
         Yv0ygpxlP3hFp9Ecl+yPoLdivu/p1uwBXUrnsfrKzxL/m+AEak0MiWW0C9+98K2wzzQE
         L/lg7695zW5FdNfc4rRmHHdMTG/4xkReMC7xu/scNY4LCIg0HG6iYxPrK7CgQNtQAyt6
         aAY3QIjdr9X2wkLD6AmzUjIz5+YQTVEAc0GtuXNWNsSL61MC3ZXp8Yw6/9cbgRYkoQY/
         R4y3oKMZ5/Vd4r77BkBy+jPndi+76955ML0rSHG8H8qf3Bot2+Wxy8nrXUNlG2gi9mWs
         A9oQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799078; x=1780403878; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLEYxxo1EJ6dECgeEvUHoxB7lK2wiKidNtL5g8UvMak=;
        b=XJ6wm07f37PB0VVLzyoSPqWYY9Tl+uF+IAARZzteEPE/SlRaX/lMuLLSHD86ZDeidV
         yH33HAccziDdU0JtOylvZCurNTXabUKn/zQJQsBhqQdRed5MciBPdBO2QJq2T4NpeTlq
         FxIyhM9BBbPcbcNyKBrZ+CjuYaVXWjxxgFzI+0BtSm2UsSveQQ1WqcqjXabj/YISj7em
         pHBPZdnWIwaG/J2CC4kcUeGvsqAeAgQoyOfsfbuf39vvYuAGDY8gRdcKf+dh4wNy80q3
         XmXh7ZHGBJ9sn13nCWJWqvd5AHhhYE06oNQscXvCpXkDAzixd9M5LH0vDWts2VBqsN3b
         uc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799078; x=1780403878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLEYxxo1EJ6dECgeEvUHoxB7lK2wiKidNtL5g8UvMak=;
        b=YMikDCMhqNbIwQqbxj4Um89D6Yc72yF8lOZQAKSqPG4v9IJNk0WVBWEsmCOKZwcx9d
         7KeO9rOMQcLE0KxQV8TS2xo8F28AxsUnZMlxSaWUlvgccTZnj3LM0qLYUFMZelgE35gE
         p6WFljEBqbshStIbTvzOVXxxEToS48SDg6Pum3h7aFq4zpLRAI0oyhUDIirpfSQjHv8f
         /jWOe/85mrkIHaM2Oz59cSGhGkHKaIKVBkNPR6D22OUtPp5i10sEpGHLOtl+Hpn20inv
         f5E4cDKLJaTqdbDxGyecwQ3CxAHtzJ1lFuayF2wj20Faiyig4MuyHnhvdzO3mO/d/QCV
         Sp/g==
X-Forwarded-Encrypted: i=1; AFNElJ+pMiKeFddgqDi+L4AkY/1YDjnkZ7ffJW+f0E2+Y+TFu17aO8GwoVxoZLwDBeplu9/zDcfxrM8BZRweBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmH4aXhVhnVIQPUNv3CIqr4LKUUEEh7eOrZvEpcSQjsnd7FN2j
	wNc55oBrrObIfJw1uIkmJyUHF2rOzBukQUpLZb14Mso1PvnV5efyiEHZRu9MH0+GTPlJj4zQrqo
	0MaQZrwn/FXdsL0uI1Af161k8lys5Kp4=
X-Gm-Gg: Acq92OG1KVVuVQMD8sMEHtI9ALJ2wFb2QuUTHHGRt5QCg3ZK30X+GzMQfjhkCsnj6ck
	SnWPc/oC6c6vefyYnFJaqPhEV+si4HcDMToNOjRpEMig/L/IQMAmyPTd7Qux48yCuFeWn36+J8l
	uFJLIPtCdfttfdlsAdZ7J5b31B8r+4K2bae0qDjMNRLHIGfaYfzgO79n+ac5Wgk5yKv+Bap2kq6
	zBZcpj99tJWtEjS5MR0y4iVLJSXT86SWyIe2pyR8eNy6rqccuN/025jwD+L2+WtLUMP4glxyTWt
	3MCKG8nwtQe0S2F9KGpHUPjnLVJ4Htc8GcUInUhMerL0HTM4q1a+r7f9hX9PpiPh3gcLkU/7MMs
	AUoKO+MW/eC3pbfjUItjGfzQ=
X-Received: by 2002:a05:693c:2c0c:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-30448d4f1d8mr3832711eec.0.1779799077956; Tue, 26 May 2026
 05:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526094329.533943-1-kingeaary@gmail.com> <20260526115825.1480768-1-kingeaary@gmail.com>
In-Reply-To: <20260526115825.1480768-1-kingeaary@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 14:37:44 +0200
X-Gm-Features: AVHnY4IMrQS40rcLTT7RSpFMrbA_h5z_ANArJ0tzJY7YSCk7vcZX8k5C1QuNlOI
Message-ID: <CANiq72m5MnUJRJTH=Li-GCYEDoHLcPbKKNUQ=hJUKxB=tNLQaw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: devres: optimize type name allocation and fix truncation
To: Aary Milind Kinge <kingeaary@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 1:58=E2=80=AFPM Aary Milind Kinge <kingeaary@gmail.=
com> wrote:
>
> The unconditional 128-byte const array allocation for every unique
> `Devres<T>` caused unnecessary .rodata bloat in production builds,

Wasn't the string deduplicated?

> terminator), the copy routine now appends "..." at the end =E2=80=94 copy=
ing

Did an LLM assist this patch? If so, please add a tag:

  https://docs.kernel.org/process/generated-content.html
  https://docs.kernel.org/process/coding-assistants.html

Moreover, this should be sent to the right maintainers and reviewers,
e.g. at least to "DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS". Cc'ing
them here, but also please Cc all the "RUST" entry.

> +        let mut buf =3D [0u8; 128];

Why is there a hardcoded literal? Please use constants where possible,
deriving the rest of the literals from that.

> +        let mut len =3D 0;
> +        while len < 128 && static_buf[len] !=3D 0 {
> +            len +=3D 1;
> +        }
> +
> +        // SAFETY: `static_buf` is promoted to static memory, and we ver=
ified the null byte.

This should explain why this is all OK, e.g. why it doesn't go out of
bounds (a local-only reading of the loop above would appear to make it
so).

Or avoid `unsafe` altogether if possible.

> +    #[cfg(not(CONFIG_DEBUG_DEVRES))]
> +    const TYPE_NAME_CSTR: &'static crate::str::CStr =3D crate::c_str!(""=
);

Is the name not used at all under `!CONFIG_DEBUG_DEVRES`?

Either way, could we move the other `const`s inside this one, and
remove the `cfg` here? i.e. reducing the number of conditional items
and avoiding to repeat the "signature" of this `const`.

>  // Expected to become stable.
>  #![feature(arbitrary_self_types)]
>  #![feature(derive_coerce_pointee)]
> +#![feature(const_type_name)]

New features need to be justified in the commit message, with a link
to the tracking issue:

  https://github.com/rust-lang/rust/issues/63084

In particular, please justify why you think it will become stable.
Usually, we need to double-check with upstream that is the case.

Thanks!

Cheers,
Miguel
