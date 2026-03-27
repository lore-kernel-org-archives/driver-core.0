Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864D436920B
	for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598544; cv=pass; b=PTCaDCOocolMoTa+jtkPD/Hygs1S8OWoffJd8+5h4+g3FsutMR8kZPyogd2MGWXfbxXrlzcWL0lLvWH5/u1nGsnaEoMevtoe1OI6wOCYNr9RMxfl4jSrf/ag6B413FjlxtLD2P9lfnRqdiwPkArcOHcTk7IuOR+CXI11pJ4IpMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598544; c=relaxed/simple;
	bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8r4HiLBGYn8yoCSVg16BLAmbJ49eM1xuzAYJYuIRDpy/Ma8kwo4fJGqyFJylICHEDx37M/AT1dZ7otIsLtmhAway4Wo9taZpoT32Rd/bMKHLqFIJZvQgYht/u2KKWYBMhz1BcRR3sPHHNWUy66p1C6DjMWnUq8d2xbrdzeqDIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cf7/pcJT; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cf7/pcJT"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12714f01940so143328c88.0
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 01:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774598537; cv=none;
        d=google.com; s=arc-20240605;
        b=abCCfV31/bP32FqY/5efWtxnXxf/VjA7fC+h/IlB+Af6wEMCuka/7NF/W6zcz2NrRg
         6kFmOq2nQ2zh7CKh+wzzUjR4Cm44G6VtRO9DVbU8hc4tNI9MJaO4P+nALfZ+TLKN2QVw
         mFeNGXRQ763XowKnpKnSi9ZVEV5+scKIzkH6l570LdZihwKTu7fA+IWgzR0QIgO7CWv5
         uar/eGGDPfwVJYa7Mq1UUT4wO65ub7yfYQsd1Z8nh47bE8+T3mJz8lFTSWjqOLu0Nk86
         ofypuYePkj19aPwr68kZ04yVpPAXw7AOTMOpKwc0o4Jd7Cs94ACeFm017MPwVs25r87s
         uyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        fh=+F/TWNLFGeXbvn0Hiz4TinvxeG95wRh3FKY3HY5uumI=;
        b=C2AiobC0nXoe7FX72KgSwipjASv/4YAi7ksLLGSCJFXhIVOttqS+qfE9rGnBJpvOaB
         okE4q3tN3AaO2SzOXGrRiuI+vGVTjaN1nkoK5JvClvklWqGJcgiP0V/qsBaCvzu5cHff
         rgONYepf2CkgKGdw3mnjGDP4TFUG9isDSWkaqL3qAqNaBLFMiLMkO7/Y8cqYXtG23nf2
         wtzvUpnjdptqOecWcTTijzLI6gdrFH2uOPEJsNMSde5WYRPb9lGdF/eznOUF9IgZjmkJ
         ixCDP5GMhB8WVVF0y/BF+yAFbiTmt1gvXkgK244tCrgTjtU9KhlpCkPm25rYd0U1J0rW
         eXnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774598537; x=1775203337; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=cf7/pcJTCRtxfUCm7mWEO/UTfux5dofKFj+84oo2oTmSWia0zNPMXFv9XZoX79IcK3
         wRCzafTxewp00sLKT4y24peNM/GL9kAnfj0H3NtANDadUeitx8yuKsBeLpSyHEEvcUIt
         ifytY0jeruEMhmUBuAIg9fZyAV8Gz1yzTJYzCUM4QMqXftBKCSHAL69KkKL5geFaKIyo
         6MKvdO1tRU7sKOPRtP3QySIiV/BAbs1h85bkCZPj0qP5+L0fx+H6YagmldP6OYwO/oTw
         bW/YbYZXV4TdcWXF2Prb8isnRbUf1kQPxtV7jQRDhV4uORqWBAY9/CfPkYwOmxB1jRlf
         +9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598537; x=1775203337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ep9g2m9wnZ/qw5uP60q9XJwKT04QFSPHpz8SR3TFGU=;
        b=rrarW/mKsJJxdZEdoidlfSQp4fXupcFSpMNXXPxuLNKm6k59UOy6OWExSyYmM2KEp+
         eUSQ/8MZa3TQgGYuTQrjw2humNjE8bqUx5buagrA9ZomqpdnoKXgybjlDlbYDPHLO3HQ
         Uvl66M6Ya8MH9kuxPkGksPeL/oILn8rHRNMcP3lJOOWdWU4z9264ZF57E08mQKDjRI2p
         1m6yf2pJ4k0bge06ZHJICK4ogniewfRKOhtTi8VBOkr+XQCRvA6KvNAUnxVglvux/VDV
         oa8GGG8UkDOoQu0QACfgW+1lF8Ngslce4Y+h+/qvp04TG2MiHE2qbYMgNdR48tOuw6YA
         Rigw==
X-Forwarded-Encrypted: i=1; AJvYcCVKwdrOSjSVKq/OtexJfma2blFDDBPUEZSZ8wYBIi0jhAPuPBEpbQsXTKJ59CZMVgQZzRqvWB1/STyI6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKiEHK6jsRKJiAnzw6IooNS79Sy52QFjWhmmds4Um87IiUTtZs
	ags2zSb/8Bl8Hh7foPHrHx3UWg9oCtEpWTWS53rnOZl9Gom9nVgNlNmBOjphiP0pAaNhnjuk9Av
	uhfoGz9vCXFidudi+t+TBRfbvzCnJ2lg=
X-Gm-Gg: ATEYQzz/wNXh9aIHF430E+anM3hmlnI4bUaYH+CIX5ShEnz8KdkXTaP+3T300OKYNlb
	VrowGKan3l66iaJEAL6tJXT6+FQxAKpDHkuj1SfEZGIG9RjtDFdLLCnnqo9VzjoXw+wzqJMVs2G
	BlTgaaQF1WWdL1QmpTp5O4I/tg1VAw72FK76gsXUsO4wzvAhGabdITN8YlxU9VuGKylpqqI8nWW
	6DdGBRLQ/P0L8upqqvIlBLJJef6UBjC5/XZc45BXuG9rSZtJ7c+l3Dl4CvZFv8ZVEExmqCgmUQ6
	TWHLkG+97dXI/zUiwLiU0y75Q/NCQvz/NeIeFDdjabn8ruzrahtEBUa4K46xnQbG7VcdKPsgk+P
	MHfwBuhTW7gsc74dLkKrvUjw=
X-Received: by 2002:a05:7022:618a:b0:12a:6cde:fd0c with SMTP id
 a92af1059eb24-12ab2906c98mr371178c88.7.1774598537022; Fri, 27 Mar 2026
 01:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322194616.89847-1-ojeda@kernel.org>
 <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
In-Reply-To: <7ad8bdf9-5eff-4443-ad15-c05355d793d1@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 09:02:04 +0100
X-Gm-Features: AQROBzCrGdIlIe2CkDWKMkYFmP8XiqVc047zlhYRt_gjOqAGZtEWFJuOGnDO47I
Message-ID: <CANiq72nz6zB0jGahw4Eh-i-Rew1kQ0g_qcZ68Whw==MyjhYaJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	driver-core@lists.linux.dev, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, 
	Johannes Berg <johannes@sipsolutions.net>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, Russell King <linux@armlinux.org.uk>, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 10:13=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> I have an older patch to drop CONFIG_NO_DMA entirely, which
> may be better here, since we know that nobody cares about the
> empty stubs.

In case it helps / for future reference: the patch I sent to Marek is
already in mainline: commit 2cdaff22ed26 ("dma-mapping: add missing
`inline` for `dma_free_attrs`").

Cheers,
Miguel
