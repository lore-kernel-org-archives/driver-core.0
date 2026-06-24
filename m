Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A53BB10C
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309790; cv=pass; b=fP8XdGw/08GNsRBNXip4pjBoc0+AbRTyAyud88Abn4JPOTs+D861X7AQuERtacSES3zE6f0BpfOBzqq7x7d6onXtiksRmCJpUA++pK2qYphGw4RDHa9KnjqOasK6ntdpvMepxa7RB6xcWPLCWg3y4s7EP4B4qjZNxFoyte3TCH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309790; c=relaxed/simple;
	bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNEskCTdSN6BFzS6D9m7ehguj8CcMRMMWYP+yMwpQl9r+UIbWppMyRnOC/lRJW8DyIMu1GjrhElOyll1eOv0u3xWbOSk27Lu6e8cPQucsJKRt8KXHFryMpZkiMPtioXuoRWVatgb+PP7Q+6XrL69Vz/+ENZbdZAzb8wgMw4m0DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAXQoHab; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAXQoHab"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bca8ef052so95369eec.1
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 07:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309788; cv=none;
        d=google.com; s=arc-20240605;
        b=GHYgq7xz+kO8v1xRzEzoBHtLfHclQ18H8ZoAIjaLCxkNdzc85yc48DTvLe2wulxo5S
         5bAMLIcj4BNgSDB5KKhpAhA+Pj6S3dUZUDIu21raZ2sAOUhvZwb2h8+Xmaq+zYiWvm0P
         EWdpcGc6Wwg+YPflD3F82FKs2kT/Uca0bCVDOYASLFkQtXgS0NEGEYkIq+LHwtkg/TPH
         gVU5tyHulqln1YHCBJlXSHHOWdCIohrYl3tF4/rzHRD/wOQ1TokdsAgmf8eyj0SWBukU
         XD67+VdW5N2A4JUSuuUBbzHrVklIXlcUGPAT4R25hz77bIpYTqvXH90ySVa7NBHE7BKs
         4LMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        fh=k5a4OpCROLKR9xAm3xiKT5x2SRlES9yTGNxcfSAQu3o=;
        b=fo6KV2fx0tVBhV1KFwRJbPiDM7F/Ip5TScAzBk1EU6fRHOrPD0Q0fggpYppdspg+iH
         Y1cC7AfGrXTa2/gcWmmWM63F9zvYIM0iyWjP4XAoS3GaWoqhJYPecKGyrogEX7h0tgAX
         TTW9WJrOwo4IKeHUV+lMzM+9rWeNGHZJTA1zA2lT56OlYhoO1QGFfu+tC2wFLm4q3KiC
         Qw6ni+W6TajjzGJ5R6DcsPkyG0cxc8s6cNqGr6v8fhic0pzf+aiOtdtLYUNW78S2sE5H
         VnlRJ4MTW+o7i+RzUmgKRO8wQykFx0difMNt2lJM92olMe/3oHkCP6XyL4zJmL42n+Of
         9TlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309788; x=1782914588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=hAXQoHabp2gNK2S3fmUGePB34xpQmc8OWTrKiOiSRoGI7kLOoDrGWbcASvxM1Qewo4
         6B8KC2QjeIvuciLwbxffkpgmuKZJwLT35L3Fqq5SYpSgdYhBairDx9afO6gQOsfavi7o
         DbBgfn33qIsSwz0F5n0f4JRGzpuMFDOWMqYeVSbIIyERtoYt4xc25kTrGCNPUDjJT0bS
         OQm6Y8wTchVmxpr4HcRrEY9kOqK8efT34epsF86bEIi7k6CiUH2kV5elx1uyH8xDz4Wt
         iDXQZOiEz91jABLHcJkv25uWe3A/C76TuoJ7jDbJG6JG7U7zaQuBV21JgVip2AgZ8ni3
         bvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309788; x=1782914588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=piv1QB8f0AZICR4TfkUKLRGBCJYP1Vwxi4TZVwNlVXdCodhN+liJ08JFFvxO46rgbe
         7BjfQbWX12o3RitUzdKUP74AnYq7GNggMpcus0h6Z+Wp09HchJWDE8D43INeW+Z0QiVP
         o7UJckoPyrgda/YHqf4uXUVz9sITUWpIOo5mh9B/QUE9kv1fA0Cmsj842Y7a7eCgmd0/
         ppHdEmTWxpkU6+JU9NdSEmvaXNtXTF9Og+mUskRRYTrf2qIduKAUqq8I+XVoz2zByVY/
         laUaCK4wVnYPUqvcIoppt/XkM9zmoWeAC3nUzV38dX6++Ug9Xtr/XmhftTNca0Strnu3
         FTIA==
X-Forwarded-Encrypted: i=1; AHgh+RqBYcMW3rB+yOSkxpTtPBg0Wz3w6V1inh5gyWB/TtlSLvpL3EVDLP4fs5kLmnO3LAZZM98MmwVVm2yL/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuGgrtU5CGw0dZvgC6w1HFY1QNlAA6mkdOY7F70VYwr/cfWGGk
	622avtptOfRl0MnwkY6Bw5P3YzVoPbBbQoysPW7tuqTQbKqV0Qc++zEwPWIT3j3wZ8qKOMiLyLl
	ULnhnropMYyUcBMrahxtRnbuT2vtXLpY=
X-Gm-Gg: AfdE7clR3nELUKD2XzLdk0FM9aAP/T91MJPMTS6VcPQI8u+Cwd0kz++EYtunS1GHWtd
	9Z5ewFo9H9IwGYcEmWijfhmy0bWkc77Qz0i3OAeGbsh1+sL+6nTmpilaaD/vuBIL8jdqJON1bgU
	79jAUv9PfuJJMD9z01cuHOWqZSUznXDw/Mk9L/gAKeBObGYypnAaVXjxc2kQxbFqERCfHGPJ7Z7
	3LfGPl7c1H+TwdXXwjFElBDWEbOIQ/aEwtmvYsutbq3zaiZUXloVOpEsrrJehtkafHDDCfzf3pg
	S88lSHOCWcp6/mIUjUwsJMrvLjo1RSR2zA1E8R9Lw7AVAJ2CYTZx2VNYEBZGfK4YVNXy6+17/dY
	znKbBfKZbyZPv
X-Received: by 2002:a05:7301:658a:b0:30b:c8bb:588f with SMTP id
 5a478bee46e88-30c5240f7damr3538472eec.5.1782309787929; Wed, 24 Jun 2026
 07:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624-fix-fops-owner-v5-0-aa1cba242f05@linux.dev> <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
In-Reply-To: <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jun 2026 16:02:53 +0200
X-Gm-Features: AVVi8CdZJD474qdF4GDgFLlfJ_vD8WsFaomaTI3YSRH6pluhcoRUR51gh_iz4VE
Message-ID: <CANiq72m_LakPxHt99+3eBn2rXokr3vZbdJf=Wk-Yi8_ufQ2mvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Fix missing fops.owner in Rust DRM/misc abstractions
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

On Wed, Jun 24, 2026 at 3:23=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I would only suggest adding the new file rust/kernel/module.rs in
> patch #1 under the MODULE SUPPORT support entry in the MAINTAINERS file,
> similarly to the other module-related Rust code, so that the module
> maintainers are emailed when changes to this file are proposed. I think
> you can change the existing 'F: rust/kernel/module_param.rs' to
> 'F: rust/kernel/module*.rs'.

That would be great, yes -- thanks!

Cheers,
Miguel
