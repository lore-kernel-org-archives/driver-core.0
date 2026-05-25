Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C606733DEC2
	for <driver-core@lists.linux.dev>; Mon, 25 May 2026 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716922; cv=pass; b=k/AxlbDk7sbedsoPbVyoPHkHIWjkVF2Vy6dUcwWM5ipUEMWDpivYS758CndTg7izALNvIwYWQeOvsFnprH8X8T+WBB0axEd11uE3tz5sdwbdlw2GT4eIOSwwnuZSPVzVxq4WyGHe93c+ujCuIAPFIAhxGZqbdHn5d2l9iJrSzfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716922; c=relaxed/simple;
	bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqNkS3Sc50MiRFlPWzYFE12b54ur/peG/Yd6YFuhdynmVqrHNknsXoXl4OzBliuDtbeLPLHiIvRspJSKGLunpqCkElef/nXgSYzdLoy0vmh4qXl4weRZfcINr1jCz2fEYef7iylcHkDplecWJ5lByl9ixfAXh2phdAkjnyymszE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hri7vKMG; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hri7vKMG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30436e8f582so429141eec.3
        for <driver-core@lists.linux.dev>; Mon, 25 May 2026 06:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779716920; cv=none;
        d=google.com; s=arc-20240605;
        b=NkXw4mwhvzqZcgKAl9PkMPFxvZYdDzHb3zUIKGcgBJuDMJDzOqbsZ8I4oTe8xaBj0F
         EjSr3LcYim6+sNOU0rfl9MzCA49kXQbono4LPrqwGEWFl0mouxFPOz4frzTLjyqg/HPk
         KLG2Fmen73nbAq3SgYkanuly0bnh+kgdNll+WGGcXYPaJf4w6WNvM8fPhc7mJ6uohfN0
         O63WU1mJqMYaG4ErhtxVipTWtbkeho2pS/G3MTZKha0IJ+4jAadlYvb4j+JYGvodDFo3
         MqdceviqO8Vl8Wi/Yv8VUAn2XDN6d/KQHaYMUG0+7RzcKOm3cb2vI5ljccgQQG7pQJFn
         +w7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        fh=d9h2p4bxQRmYRUGJ7q+j6JdCk3WRxpQbzD8a2OMJuVM=;
        b=H7KK+dND8Ra7QKStfVYHIQnhnT6gLc7RsUAemZo/5Uewwa6mk3czQDVaFbywHnyDHp
         VFWJm0iymvVeKod2V0K24CMbMXSOPEgiiztOel6uRV8lPaMt0+YTZUefT1RoXHbS4cVa
         XUZsZctqJRuMTyfyepCWaqP/N73vH/iQLpgd5QG9XzuZ6Hq/tUrJ0ZpQSXH+2Q5wf/na
         6jvKHWshkWIqvzaBbPHuuGYHQPQAyMb7klCJgfLNyC6cefNdLtVsLQOlcBl2M6i9yDqu
         64r136i5UahrRjmz9D0d2sk0UEASXUKcD5Zm7t9vyq7CCj28MMgl5nK/vomNLoEs/+Hz
         RbXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779716920; x=1780321720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        b=Hri7vKMG5owLidkH4RymEebmpQEiydVSL2fUyl8M9yOyRuiELDlb5J304W7hhAPeuf
         qHQAK4dZQaXQ77J9lNcfHZ3Io289StlA/W5vImRCF/eoAE3AjFq5ReBzJY7GSvhjXPzA
         LO//h9kG5D90ZUUsMIWoCTEbLEZBcFDQNkW2ZOLkbNW8DgpfHvUBMElx2OhL4a/uqnwp
         ycHSfZiUjvuv6+o9ZvgtkO9lrtzN2XHRSUQE+Q74i1eXIjwexNNvkHT0ZZiN5P/HTByd
         7ssBJpzSkiRQ2OdEogbe8yI3SGV57JMlBXFnqVLzxhrnktReehoH5Gi5ulgtK902kFrW
         zdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779716920; x=1780321720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=85tyixWPRhyVYE/wRe58MC4SnHyYAkG3RgjSss+fQEQ=;
        b=WQFJICDU9RftuIEBb6ayCBkhRxG0cEbJTvG2jVJssjpywgpS8gmMohANxEnxPnK/tf
         eioKQCR187+HPRl1UJORr8uCc0Z9DeKUfSnJ9pjOz45cReiuJv+8gPnN++CSLWIRkAL3
         IlpufWYTiIEg5FyTUbYwo1O9wP7NhQti7As5D163E0fcYxz4DbISQ/sriqVD15MODXXB
         a4m4nlUWJHChp+MisakYbrLbwMUGI/NBSZ9DV6+bICoiNsUsqcjf77/5RA/12pZoF8n8
         lM1dvB5sjTy8pmugP+SkexhoR4zjj0VpF9CkORsyFMNOz4sN+YhGwN37aL2VQfjDMyL6
         ym9A==
X-Forwarded-Encrypted: i=1; AFNElJ/4x4S6Sl6Lc/2sx3itQTxgFdQYOriFF6xxHm9BiZil9mZoxmJ6S09ZF2Ls1oq1ksaJ+qapJK5J5d0IqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbQewHk2GVk7Qs5AcugghqaqnpUZWe4o3kVsoAJDnajmgj6n+w
	8nbMyEqSGwc2F+Lrb7XFLO82tYcvAWCHF3U4nU8kJaaEya2enMqL6PA6tdF/0Uckrp6uBP6oUAc
	4Iweb9Eb1G9LGbAfBGiI4mZLeWAdxLKI=
X-Gm-Gg: Acq92OFjleVPpYOa6e5qZAsLAbmfp6e3ph4P3KGmEodEi7AUyVqZuYGCzmkqeQ8BtZ6
	mxtroQjca9a9ZdPqF1GOrlR9EC1njrfM/BiRKIpToXiSBUOvB/nm8DyQjH3v3/CfVedAs6OO7zH
	+6VU+SV3CM86nmquNMUZm5xC72fCxHbTVKRK64YmoyYCAvgHt7xYMAMDQhK+dKKL4odeVgZaNB/
	Ked97FjWjwi7Us4wY50Y5yUM7c/UuS7o+OLWsJk/izcf8xHFNXQgn0hDsRYTE1UFWMaqOD0ZZ6t
	kB5jdOKqy3t8PS7WjZv0O6J9npEREThUmqjr1gc9fb6TFgJlY/qNRwOltxcOC6GzI62mTPrprAW
	2Boe4x5AGgLZlDAOvYf7G4Uo=
X-Received: by 2002:a05:7300:cd97:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304490ec25bmr3233212eec.6.1779716919856; Mon, 25 May 2026
 06:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org>
In-Reply-To: <20260522-strict-provenance-redux-v1-1-0880b65fc17c@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 15:48:26 +0200
X-Gm-Features: AVHnY4KSxYqiTdhQ2JGDTcNoQ7xW8opRoeLvLR7fidZtFguYw_peTCo-of46_mI
Message-ID: <CANiq72kwRam1yk_w+B2n2osXLEVdofDbisBs+FYoukZ7GYNcog@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: use strict provenance APIs
To: Tamir Duberstein <tamird@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 7:19=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/all/D8EIXDMRXMJP.36TFCGWZBRS3Y@proton.me/

The linked suggestion seems to be about enabling the lints, not using
the provenance APIs (which we have been discussing for a long time).
Do we want to enable the lints after this? Or what am I missing?

In any case, some of these are not equivalent to the `as` casts, so
they are not a mechanical change. Could we have, at least for those,
the reason why it is OK to perform the change? (perhaps as separate
commits?)

Thanks for cleaning this up!

Cheers,
Miguel
