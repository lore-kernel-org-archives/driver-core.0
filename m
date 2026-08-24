Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B863F54BF
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 11:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571398; cv=pass; b=I3hH9oxJ+TxpjmzGqtnpOla2J7+M4UUDkGTWtk+CAyufKUJZfXEalRcBAPs7YZDjY7V/tFS7PbxhkWFPak+xry19OngPzlUwSeckzRdeTvRsPihKQmMsmRrkf5xmUXYFd0Dzf/2gybw+0sKztdOpV6VcGSkNIZPMd6IQJky6cao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571398; c=relaxed/simple;
	bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T01Wj1Fd+gSGubz3WlKxMMwx41I7+tI/fQAPzhpD6zIq7HTaU33lJHAp3jSvtH0rDeHonFAsbZsOZvv/t41BJrBwCmcw0EFfaIO231CqIY9ob291sZ5c5jHidbWMi0tcqOG6NhKF5wIZBG5iaxl4MDYQTV17cf4UDgL1gWF0U7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMSUiRMy; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMSUiRMy"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cecdc24b1cso3229275ad.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 04:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787571396; cv=none;
        d=google.com; s=arc-20260327;
        b=pNnGPGDViB6iubo6heqhO1ngBDp37vGT6LObVelehY3y8N6TjKFipGr4YVM3AINIpA
         cYxoj7js8af55Asw0wDfHy4zNM9W2b4igq+hkySFC8hSSFqQscSsQ+RdlVGFxXrxQVtA
         h6tHiTc2iNCiIGJZKFo4eEeyCW5TtLLL4nZu7v+gJhP/1HutYNyKcLnT4Kpa6EDO3BiB
         WkiB884K7sTs7pxfAJTfpvxi9MYeFDASgJ3R05ACuSOqypoF/34B+lNG4xReUdzGg4iG
         /9ufWWAvasAIaX3jhGX6yvj5V4GesGm1j3r3sVCGd2Ot1C175IfS9aerNcb7ucBI/doN
         nlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        fh=uavXlcwssglpFLBC9u5ejhqDnk/jdDh05WmVRad+7/U=;
        b=Nz+M8KriC5xPlOvL7ACRA+TwKytRROK+12F/vK6rdOYoiCx+rTgCHFTLv6eZ7umeA7
         qAocRHwX8N58Bx/aj6KoIRibVjY7luOjiO8LshXeOyEI4nMHhuM6uHGS88dPR+O87FkS
         OF6JNLmYpZhqTu3A/Z4Oa6zsW3NK6gxUGUYZ0pB95HZvo0kH71ROVgPj3GUiWlXSWxnE
         EQk5UBVoiO4YOEggRYcomlk9oWT8jAEPdofjbPVMUcdrVqk4UyiIAI4QZeKm0gvA4vCb
         K4dOj0eIijRF8KpAhZV6wovzUk1URXYJq4IvZMkRQNjih56CtXLRAp2cE7yQUxn6o2/4
         e7Mg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787571396; x=1788176196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        b=pMSUiRMyDpG6kqkMY2VhfSM/PSTpoYJgbOiZa0lzG/n8XVQZKht0Rj4NzOXydHnW7u
         AnPQigw5IsFqzUMIw11wRuTkaG4AseUYSl+bd7JDfY/yNesk8IyDj208o6akSuw9O2Cv
         0VBF/tW0icI9Vw/sx9dpX2Mi1MDhCmbB0fOPjZ+ECITx0cl8DmaGTv8NvYgg6RbUTzBm
         MfQ2eQbRaT0kjX0C7ZXQxS9EuOjc6BDC3+J7m+7Yms2KOqIcEAaIVio9ETt2S+/qMzQ3
         sk8+C/vJswj4EZ4q0faUC5XNFm72/hq3QM9nsw1A0KRoz1z1Z834MKwK/w30MTLivBoe
         ZF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571396; x=1788176196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLR8gNeFJ9TssEfTR8tSkoTtg4StSpJ+7GNVLjYl8Vg=;
        b=r5z8beCJqwrh5OddatLmnrPU4ua9KhDHi6URowJSYcqbdStGlO2RDkIygxcZIlBzXU
         3ZYOB/yqdPYztkoSiVuVfN2RWcX2VP8Dq+ET98f1J83F3VeH0q3jpHcGzlAtaOYtXgOf
         8vZ4ZZww97ssVI06TeIYYV2gHSzmGlHRXwaZdsb2rUZXs6JDmzvgvh4s8fTUKK+hwHjP
         PuFnaLaG2emOviIkrIwvaRNmLWwHVDBWR6P36V1klkBhW1fp1BRjFD07OHj3b+aHDMgG
         Vaxhmn1JI/BLGozGsDgb+gEtRDuSHMQipZAalv2nyFuSBJdlzCEyk2bLdAuoo3qHDjLe
         1RHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/DwMmafAoeuUojBCsJSiTZloAbmWNBbEuLI3bJ2C7B6VD4F1JyRz+/MFZSP5UhRUUIiEAKJNW5KlapA==@lists.linux.dev
X-Gm-Message-State: AFuF++ns63nimX4rA2MoDzlYEHKYen8SNfEaD0FhHaD0qmv79+8D7xEQ
	C22lnjvrl1CUfB6Bd/8oYrw4SYs+UjQDs/YlQKxr9A6diyPirvsG5YkpiPHBUx8pFFCWs7xycjN
	lg3SmqolmOsCKBmK9BypPN4Fua68CtWQ=
X-Gm-Gg: AR+sD11mwYq2eMfKH50HgRq5IdtPFMyeqtoE4THdDW8Pl7L52gCT4Hsimu5nQx8+mxt
	9wtEiYnGOrgITMH6yUrzl2KWGfIp3PLRwguCJqKdZkpQir7/A4pk0396RSCOmQqOmnucAbXW4lm
	hHisAnVfjBATrBfSx5XsqHGotAkJNGDMUsyOziXAZPCp9apCETuZOM066+u3KGFZd60XUG5TJH7
	QaXITZiwaWag4dJ3Oj7W8n7gp1XrXAKLDYIEmLzttqvXJp0K73iils30+msEM73bl4vVPBOPykK
	ni6ml9h0TESMpb1i9pDUcr/NFNvumz29fPDG/XJ705+mj0i5GVSBaDmDACnTUT9A9KMd6c/TSS/
	G4MHIYuuqHm1HJ+qVuGRx0VEnIyfYZYr4majVnsazj3UYdFYzaoWJXGHEQ52Yvaljh/YcQfM=
X-Received: by 2002:a17:902:fc4d:b0:2c9:e846:a582 with SMTP id
 d9443c01a7336-2d64a9a668bmr222250785ad.0.1787571396025; Mon, 24 Aug 2026
 04:36:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org> <20260824-unique-ref-v20-6-490735672187@kernel.org>
In-Reply-To: <20260824-unique-ref-v20-6-490735672187@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 13:36:22 +0200
X-Gm-Features: AcwNN1XvVB-Mna-bMRr_-WAakhrdmhTEWRag6uYdZi5jKauuC-nwA9j0nxkTDxw
Message-ID: <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
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

On Mon, Aug 24, 2026 at 1:19=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Please see/link https://github.com/Rust-for-Linux/linux/issues/351.

Thanks!

Cheers,
Miguel
