Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39B843F4A3
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609162; cv=pass; b=oyjFaG3yXYKDb8tHzhraUAxoaVcnZWyrtc1KFskdKU58cGh/2MZurmMQdCc1IWWbp+zzzYbVLylKvrYrvXM+GUra4cby+N2MwhvjMbRGuQNOJzzsJvQ55dF3G7EmeEgexWsTFjiqsRWjzzKpnG5EQBo5LRddaqpE9xjFG3S58cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609162; c=relaxed/simple;
	bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z943N3QTyd0axtMj/2oFKKXVqPpKHeM/ByBwoLMx1WlhiHhvbN4jadzV5NLI4J9znahE+Gc1xDcnQzWuGowMm4HsCDhF13hq89EawOOu6VAXR3Neg90GLGE+E175hykYhg7a7feBjGuiyZOHc1ad6Py9vZw4NQ8DaY6jNnQWYTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jziny5VG; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jziny5VG"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso271708a91.1
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 01:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786609160; cv=none;
        d=google.com; s=arc-20260327;
        b=YGev/M76pR+DKuoVramDcotgIV8WB1aRHduPhWStwYjJ7LLb6nD4t0fqcqn9+Nespn
         wZklcWysAoUY1m6RiTWB0+7gjZ8QdE46epHDaRl3lXBl3zUF8HMgSHnU7GNFKR49otdN
         lZUqvzl8RH5iDCmxpJayuLhTSHl0+WDOMfoaLdViAvmNhzUTIfbPVsNOXcUtE1/xntBY
         Eo5q2Odzdg63HLnpK0ehlUu/K+qkJDr2ISsCRnS42QenNoDux+3exnQCiNhdW2dBTc4f
         syY1JpEohvSRQPBV/u2DUH5PZ+8HsXyswd/2L+wCtKTTJPihy7veHO+d8MV5wb+MK997
         /FHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        fh=g0O8rN8Mw3lkMOQfOlEM0ORphwp7Yr+QEyCY9FsG9K8=;
        b=AaXDFUQ0a/0o53JmT//mb+jEMwHUNRM2N+9hketpOYgwW6WTFgKlffj/8+TfIvidZp
         hhaqtOqSlB0YvUKrxufzrducYE9MD5m4yRxMUP6OfTCKqaUHI6Uec5608OmEgw6X5sin
         ODa9a3ag5EwD1RSDwxrdxl5cQiRGvnCVnMHv4vKrlkjwINFiOdYXTzI6UvUpX+NJT62i
         MFPjdSZGlgHaHXx5+/mV3B3Jrq1wRfx+9IrgtXpSlPOekckh5avtcXTwNplP5zlGcfZK
         25UCzQyu7Ll6+TwqcdJ0UD1s09F8FUDn+QvsYd8WixqmDnX/uNVGE9KrYxFCqYjgLJDM
         Foxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786609160; x=1787213960; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=jziny5VGnsIQvdKTfJJ7/M+xc1PifpW7XG+rcxBFm/mdBFt0BmrEk/n978xEb0Bf/9
         jFiIf5YSmBuXMjJmgx1sxWp1QfNUGZ2KoMcMAYiF20HRfsHWLQ3ux/+5CzqcWa2XWGQD
         T87yO/IYXAg/yQUuFJ7MQsHdfin7Df6Dv8qbeZ+VIHGcRNQ03SDMH8Oa6gTpXU/YMM1m
         V7BQNFi04+jwBjI5eUXcTIno6KiWNT/rcL0Bk4nrG3q24woeoA9mnDpOcOSXGJ+ji8bq
         cjyvrk/iCu/nUh+xQicvG9em7LTziDDaSlK48z7UzbTe7dFvL6Yrq76TPKQdHN3xm199
         zpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609160; x=1787213960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVrUSNzIYXwmMA2xnmHjPXifoomFAeIS+si0eytqGMU=;
        b=YyiHYUAbJW/sG1C94mO1arz3Mxx5rsiieoIwsgfAI5w6OwEbLr0wLgbgVjyt5vIj/K
         rHBsko+Lvo/fo6vB1cC8DRbUOooJsUaE5y6E01uVDQLA14bOefMPD1sI4DHhsyvH/jkK
         EkzHcMdRmb/vzPcgtKpLGI3PN3nwpYlsCHLdFk7Td1Qr1u1GGkdjBOPiek9kVCsPWOi4
         0j8y6ug/YjH5sDLyg2zUIifsedg3GNcY+u5cZfKXlfFOBhuMSqpwcmdL9DcInFN89cQY
         UWhjk3vxbCJzfVMHx00ZNKOqLY4JyXPKALmCJd5/Z3TtyEEtwX3Piz9fNBKC8Ejg5jhl
         BjWw==
X-Forwarded-Encrypted: i=1; AHgh+RrJaCF3m/PmEW8kYErjD+dPK7v74Ey8DbpEafBcAMmwA/5BbjKezVFqDMHBWvIIXy6lEkRHTDwE6AfYFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAJyXW96fdfIX3EFRW0/Wbww1I1L1QVpKlfKQbgEaJReDPBumk
	Sl+RAIIgJWd5YBheQMw66pe1jogMoZtxgO7eIUv0TQ7NQydSAMo1wdifo8fN75UQDw8E+lsC7uA
	m+A2qTFBYXunMBdOVrqEGD5eUpMYbSYU=
X-Gm-Gg: AR+sD13tnpOCDDifrlrHEA5Klh8Qc8sLzLHos0wkqzDlLTv8X4XkXW3B3/haSFXK7F8
	jh+Fao9ChiyUlQ6qCaao5NhR7ofmCLi7eA+Vq6u6oS4esmLhs/Qj4U5WwSvhF1cHw++W7kxHImF
	tsfoqRjiwU8lDkEA9jORKHG1Dyuma/Eg0jqw/Jy2frwGpbWbvNxIS0bvDsya1wLmPt/LWRRXhXU
	oXGDhSX0MH/UImz/4H7mL40OFn9lBo7R94P+dF4mrmGU6m/xQ9cYWSHA6yV3wlM6hllubnlACct
	A5nK48f8HbC+fsQ/kFwwWMXjH0rpqepmjZDRV+5yX02ex4let6mv8FbrlWf8yd/DKuixinKonzL
	d8OEu+IPIIJvJC6XX4F5dS9abCGpcrqirezyJuWeIiWxd24+siFp6IizfOtvhk9xpaZiNugg=
X-Received: by 2002:a17:90b:5807:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-3931e2aa828mr3336244a91.3.1786609159836; Thu, 13 Aug 2026
 01:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
In-Reply-To: <0102f153-154b-430d-a3da-2c8423fb3f1f@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 10:19:07 +0200
X-Gm-Features: AUfX_mwh5p3w0RKVhg92eH8jsf5k7VluJKRFIvAAaH6tiIul7a7G8q8L9_4Mlig
Message-ID: <CANiq72mcFp-MODPkNGPcufxb0YhPDO_eN8J-ZFVzkd2-W6VK6A@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:15=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
> Thanks for applying the series and catching the stray Acked-by.
> It was a v5 series-tag, from before the MAINTAINERS patch existed,
> so no need to re-add it. I'll be more careful with tags in future
> submissions.

Thanks for confirming! :)

Cheers,
Miguel
