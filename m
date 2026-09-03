Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FEC4B0C82
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442143; cv=pass; b=Mil8Dy2f9kj8uaehE08C5NaAcdiAQIY4OmcIxLUFyUrjwXVvaKKzQajqVbx7H3cw0YvTY8YANdPRYFw5dXPpuPa031HGo24jnTeycqc1/h8wNVDudMw+UYf8YavlGtbeoWcs5kurzdgLxagB36SrRYLb/JpfV/UU3uViXd57E7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442143; c=relaxed/simple;
	bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcn+HTz5ah8uYjQcrB++apJxVAduUgkNUtG2yxu4EFrphHVG9op1aA59ykR5XBMS0w3QygRQdqO+6lhoVyHuu487ukB8AuLL/cQlP5/YHIZctCUXNzIbGa/OdkljBxmF+8bQFjQLxRl/JkfJNTFJ3jlEG1Vhc2RTbLRgbvYSnfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCM93Wwn; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCM93Wwn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84e4efb18c9so319367b3a.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 06:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788442137; cv=none;
        d=google.com; s=arc-20260327;
        b=SbHwwYZXWlsz7+Hxx7v5/ArDfOD4j6z3M4s7zHXzQqCL/Shhh6Q1dm1ZhGOCLghJx4
         jAeg04c0J475fhssFFeXcfLBfD3oDjTsGcBZh/i8EJrU+dLDoDwrGQia++mjIqmuYWje
         kPpbd1e4/8pHsnwkzW6a56h8Tbf9AUgZZfJuyH2RNeDP3pvnoXU6jrmbA0yCIrp6OIlS
         k27stnJjv/ruDiGI33IfNhu2TA3ztomydWcID7Dkc7A/EHtHzhzdip7FZVaJuTI0MV27
         MR+H5kvOgfl9YQootFYE30NtveIISACxiGgOTlsHO1dKIZEJ+fNUr6zxK0k8PEOCnn1x
         MoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        fh=mDNBn85Inp73OgWKHlxLhPYQjtwBE8oYPSctmvxabK0=;
        b=lSdyOOD911CmiJd6I3DyjOKatrGGsfUIzmtycR8QmjmYegcq5ICESNOOwCpgfIQhEv
         1xC4M9sd5V1kxOwh7Tmw2pGIrZRlGBzlzjadUWslYhbbOABIT/tBfPCr6wAM8OTXXmHM
         tvdbc+yUBVuxiFyYUU81OpQt6sZtFFxghsw5i1FL9gZnDPAVXun+5o53HA5KtJX8DqO7
         vsn6LuYUJnl5awu0Ci9OThEbnPZH34+Bz73W4/wb2dN/CuGvgDNIXUbvJj/uI2aseUMx
         yscAgAge+J/3WlEgJAEsjVkNlfn1G1MKOuf2n0HcuunCGKHrgHmna2fxXMmo6LoUdFmz
         BxHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442137; x=1789046937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=MCM93WwnZ1wYk6DI09VitUjEcM3/OxrzlNn6iPbTmfqrcbG50dsXw3d5ClSMkjq8Be
         x90GayxBvbXgnHwIrEkTLQPdd5phEAYcQARpJgHlAg0O3yaCxvVzuhZJ7JHz+Dd7lXJI
         MAY72hkSo/t1MY35dUCig2NCY/90NogHfZ5Ll1x4zxy6av3lQ22fqwO24c/BArHR4Gx7
         5fMyGxQZaG1yd9box78hDm5SagPT7y/5M2h5zBXj5/ZSUswOm/Z8DTCWAVNz3iuwTbDy
         5yJ7sbTX9pC7twv5oQwpALnqBIsnYyCSTHHv3lwofhOragURjPHG9Cvi6UnzdfzC2GS3
         0ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442137; x=1789046937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=EpCbLPVRUaDyubxbYhVEGubOErxb6zPCUzHaRACZ7THwt2oCHDTNRP4x6tYI+AiEZf
         SRBJ1JR9PUNk5xM2hduuWViRWtGq/fDZYX5jyjXCskTWSvJWstMyaVDygQ6MCOzLdTT3
         c+EOfMpGyZ9FgrrblqFOFH9yTPlWb2l1YZybIdL5Q6z3q3FLuglt0z2E/gm8Eb6bDw5F
         F/Rrji2A8a0/Mk2gCH7chO6O95oP15Nq4mFttfMM7G8kXza+cGnI5s1MTIXBCp4CoWgm
         cnX6MaqJBUm1/fZRSezzUslRJ3a2VkKNASUooN40jK4OOmFcN/U6C74rYbwCkwWh/mkY
         eSxw==
X-Forwarded-Encrypted: i=1; AKwUvByVPots3K/OnvfoSnYVP8SRDivvPDspHn4Z62cNzG0+qf9W+CT1hKDTZ1QtY1yMwQ4xUPkD7xPXjmLYyw==@lists.linux.dev
X-Gm-Message-State: AFuF++noPl91puTsoNlmWTDqbfa6nAwpV+nbu7X40mNcw3uWbMpnhdLt
	XWvCaQ7uJr2kwnOf+xiw7J3dwI4V7WD33+r44TDLrAN6Qbeg9q7HTGu4m3UwVOz6WGjfJyOuLph
	ZdDxizSZA0Ukdu1bxbD0lwxQCvU8qskU=
X-Gm-Gg: AYBFou1BJ1s0t68AosfZxT8NeCz5Qtl4cFabNPHgw+tcI43/LcoNYVxlkze/fEDHytL
	wImwz1BCsX+Vuwd+idvAUpnF9duiZIeTMalQ52MxHclPs2SG+rIQOPWxS+f5A0ridiCxF+05V3k
	lwoenoM7P8npHUwWDEZHRLlKdljpJBABVVEWnRJDzlb12w9K0kYGwWEb4qtajJYa2U76IZNN+z2
	vTetC1Ewuz9Gm96JyrhhG0ewzFjLNr1CODF6mxBUwYMINXoJcdnVgJ5aWbmaw8ND6z3hdg0sH70
	73n/Y4AVTUaA3BvRq48MF3/WnL4pP0D8LjT/Pix7hVubmDRaOxZ6JaBIevge0DFIpxiNzux0GT0
	EaOCW/A5PXUzwSnztwgfMShS3zpcPactY8J0bTT6WCqLDboWUMqg9HfxGRtvI
X-Received: by 2002:a17:90b:1d0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39aee0e6ed8mr12609481a91.3.1788442136905; Thu, 03 Sep 2026
 06:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-6-490735672187@kernel.org> <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
 <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Sep 2026 15:28:43 +0200
X-Gm-Features: AcwNN1XsmuEPyO39jqyvRGfAMw_DGGPMkiDRHtfg1ZEoNlBhpVDCHnmjvBP_pa8
Message-ID: <CANiq72muo8SotJHJQhEe=2kiprbrQTvrEMqd1Uw_7yNSfA3Gpw@mail.gmail.com>
Subject: Re: [PATCH v20 6/8] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:29=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Do you want a link to this issue with a regular `Link:` tag?

Yeah, thanks!

Cheers,
Miguel
