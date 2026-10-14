Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B470B4FC8CC
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977350; cv=pass; b=BNyMLP9uStA2FituJsllOotrCIMLZWaUKWfgmH/bNMfKeDD2VxPluFyncVxEyXQXeG4S9gHvsm9AIz1LktExhVuVY6a3Eux9mgtgvQyi9+pDwGJq1hGMJGG03FqUfQTUI+EolUrU2+GqlhykXxL7ecpjHUNGZuW2CTzxuNCHHgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977350; c=relaxed/simple;
	bh=Bm8IXeZCCjjHRHqufoiH0uSm7tIaA4fZ4x02DGLBDgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NNLC6ReR1O5O4XtSoKpg0aKEKDX851ovlymhTDZqSBmijfZktP6EnG2PXR+rTrHKxFUv71BMl+iaeeGdzoo5T+WP0Y0s42TXJNMCeMngINkYd8ZtNV2uBEXP+hhjRHH9zqR78uZ64L92AjpRhmZQoQfGz3iPkPvumYTDAqKSILM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLbPmIoL; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLbPmIoL"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35179d0747fso306970eec.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 04:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977348; cv=none;
        d=google.com; s=arc-20260327;
        b=XIB698tKWAG2+7dodn2oTh9YZXITan1ozSgciLSfsoTQ5p7Bd6C0nXG3M5orqvxd4B
         LoWu9+3Ps+PPi3qf8B8yWiVV32UKQxuP/MWBSOuJTPUcdAgEiM/1kshHL2dqcNveHYrD
         wgLDm+CeoyiZpF6Ky3r7DNRSf+xI8Hp/e+s0lJoHKW/nwBcGqyN/TNutFCXzRJc75ml/
         qy76mDKBoq2KJ9m2wvg1s0QqE7DM+CX18Y7fZxS/zDqayotRw1WkBpYcbbvwMKzJK0id
         r/9t8XbH0Ifp9IOaBPtm5c+UGyxRzEmUH7PCmOUZUwUW8MzmuQ8JS+gZv1OtS9Dc4Qyp
         8ENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        fh=dGcSuv8S6V+83kcPNDGe9G7SX2liCYhZegfaj1Ne93c=;
        b=rQc3YDszv7JL8t3GvIcoBM6sfWDYq4LGe7kwk3SN7s7Se2wZnZeHVpBpxtVZnpSWn4
         qZ+BYn+C8otrp/skHx9/YAoAn3VZeGnunszezd7LsznqFJeUO+GfNJoqAZWB78/7OTW4
         EbXsgqU3wsK/gLAcUeU/xGFahQQiDn0PBXqX+OJGht39ZevY0Rj69tEoic7rc3TyswFG
         QicDGcq+yqJlNmAj8al6rsxBCmlfxg7ZxKixbtebx7QgDetYs6rKjz9nxf7GQTwPmNrn
         IvMXoGE0N2O178I8dNtgI64pt/jvBlcmkT8nTAUKG+uuPzs4wqFVEK8p8RzGKqIoQMeY
         /CYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977348; x=1792582148; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=SLbPmIoLauM1g8rEXO7a+x+nNVHrDaZgKcHl6ue405vowb/MnJ5zaXEmtCizeCPpbq
         2vMzWDo3Gg+bIVKxZQr9u+O4X9oxi7JIr3iJlGG0RH6OQDmN/zKQweSXoR2fqVgDgABO
         CVo0sZO0YQdXbzKYy566UQXdcOL5EnU2eL6bxGJl5t9xeZ7vH2Bu40IOu9wBorkOVVnl
         reur63f9XcBgwUABd4IS2VqgaWIig9qTPdx+AQZ3/N/rrAJn0X8PvFJrY83CYTO9xVxX
         wY3MyJX90m4WBvId2WpRBNFCFCQ1xEC4EBxrfDoN56t170MYuo01X3TJ59B3Nw8SSH3h
         WB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977348; x=1792582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=epBiTtanXdxL6eLKlkwy5saiYTaa6Ob7kmo5tIYDK/w9sNfLg0vZ0lHK809Pgbt+N3
         Bi1tjmNTakc4u2zbASDGxRa7RDBR0DGiS3mKMIL5+nk6N/YvpdXzys5s/CaALz64LJqP
         OaiskWFh8ICS+KIEoYLDHEA5j2b+1pmgrhPhlWtVpeQA2iCrDOUCNB568hcV5u0O1apx
         1p+X07cvoJYH6y+lxAtalAAVC26I0qwR0F3+wFXewCgAQQHO6TPj8Us0aXx3D7R/3xjX
         W0Z0T2iZGagyXQVbTzmt4YhlnxZR9aaxL5uI6dlAXV+IJrIlGpVoqHHC+Tl0dcThjQ74
         MXrw==
X-Forwarded-Encrypted: i=1; AKwUvBxPSaPI2LAcnY5FqeUsUiPDt3NRhbv2uCFXtDLqSN5HuvaceAQ4HArLU15Qwf0SimQx1g1pxxpMClr+ZA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3gt/WkiqJKGDLObDiD9NfT7u+BStv+KR8VyOILvtfqMPEWY6v
	5D37P18Widwktxh1x07lQkSKUQt5+2V2TljWXdmEyKbDtkRhJdbreJFDW1GHVKtQwaGoSQjJPnU
	/C/Sei3Vxw3DM9ml1v4gcKTe3iRs8jHA=
X-Gm-Gg: AYBFou0tDj2R7ObdskRtPx2r9w60DzYR0tONDh97k3mhna+zNZsnkFfZNvsYqb1Rm/B
	qXuGZwZtWv3O8YhmsOV7PFRmhJTRvsn3dKqJA38H4UgjC7aQIb+SnwzgW0AMNI8SHFp4MSOzUib
	mukFN35/ekyFjjOQljTE2I4YbZQPtKGq4kYwTuFbOMCYWwCNfXrLZ/YxtiJiKy55J50duRbdFpZ
	8xQwmaHZBQz2EQFltZ7jdbDlge98lxo+V6CS+jBkrqtxyYln4BIuLT67h9Z+QAGk8mBXZwDKdH4
	7JWK9+rat8mlvwy+FGZXRA8w0phXB/CPh8euzRsEoy9+dS3OdvL4YtDooRhYhXt3hRvWLpM+TIF
	1+Jfk2ujGFICKaQ4Qp1joCa6FiNfNWZZdjy9C2C0GoaYyl90ffeIeRvvJ0YAMLvxqwKx6+UYk9c
	OMV9bRUw0cANBW/pgzbbnj66OWrF36yfjEMFXjLjYOrV3Afi0Bsxk=
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr14326600eec.1.1791977347656; Wed, 14 Oct 2026
 04:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
In-Reply-To: <20261013223946.1836757-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:28:55 +0200
X-Gm-Features: AclHuK8qVHO7HVQy6LgzcUgjYcQf3EimC6SJcN58PVqcWVdOf6T45eXZNeTLsEY
Message-ID: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> +/*
> + * Optional: not supported by gcc
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#require-ex=
plicit-initialization
> + */
> +#if __has_attribute(__require_explicit_initialization__)
> +# define __require_explicit_initialization __attribute__((__require_expl=
icit_initialization__))
> +#else
> +# define __require_explicit_initialization
> +#endif

The LPC slides mention Clang 14+, but from a quick test in Compiler
Explorer and a `git log --grep` on the LLVM repository to confirm, it
seems the attribute was introduced in Clang 20+, no?

If that is correct, then it is not available in all LLVM versions we
support (LLVM 17+), so we should add:

     * Optional: only supported since clang >=3D 20.0

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
