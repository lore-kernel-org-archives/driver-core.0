Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C232A3C8
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 14:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014276; cv=pass; b=eRsobMybREKBwU7fku+1Msf1GgDNASmdIY4Z79IgrxPNvZGMR5ptPZNS809SxHyCKZUspdclDIXlOzc1evRVERT8sclUGxHz4RmvYQlPbUhIZoBrSAysicNdqm2+ZhavOU1XyfN9cwSzh2qezmOAmSuIRcB4rhBr0DgiAbOtkvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014276; c=relaxed/simple;
	bh=O7/vXOHmBuDEN6iYoEcXZX9SQVUOxuFM9K3LUsWI6j0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIcn2G9x/RP+cJTydHerC33qcXMZPz583ccjkspcxoe7wOAtyN3kFg1/Mw2yRM/CKZHMVMz1hlPZIlI67E7Z5hc+yOsAgNGPNedA+gXc4rDtvk0ZXhpbGgkLLgHAliRiHzB0eZZEbyUYuTiG2gcX1gZTVixq5qUf4YtOFahV4Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9jALVed; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9jALVed"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304dc707c7eso513068eec.1
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 07:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781014274; cv=none;
        d=google.com; s=arc-20240605;
        b=Bh9HHrYH963bQWk74u/y/fNnw3gj0IHgR3isx2+d1zlE25dPNJDCFeFNmSqmMGVLk0
         SqM8bnfZdltbrcggLEAnJv3HGD/uQSSN+1NVCk7rSbUiOgpSnupu//VasFKAksJze0zq
         6DLcsvsVw4oR+eWXx0d1AwaKW38v2omXfDGkUS+tDPJh2tF540x5Nt5HDkCv42pSu5uQ
         lE67chnLWEck0GM+mhHiNJyMWBoJpxGTef2+2YjXGGsk1Phh0dKFplnCGLlj9dfCPAwa
         CZFIyssqIa7D2Nk47LaUpk1F88VwXgM8GsQlLFY7b3Re1q8i9lLvrsRx5bUu/VC1uyZR
         29vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhjDW0OszKJAGtPcPLD3bV8YMBm1E7bkkVTPi52pFmI=;
        fh=GRj87ypXNYBK/pK/DfUfasgxyCJUehux5ppqk5wky0U=;
        b=XxfFa74HRBAVvM/zrob16YqcDeJhliVkHnN3Q3/nFqMsDnpnZFESBVMdiZBceyHHsn
         VPAnl+XkBa43eTROmPKVwJMI7S22vghBk8wII6n9Y3sTZXDVet6N4bjPC8llJANsBuw7
         Ax/kE36J1COPUsRcsjyKuxNlNpklw9SbhTaokypCT5nyTqNK282o7t2ICZbvRr4+/BXi
         XNUJrtWJKjkciiP4HKtuBAxE1ah99bWlQX+Fz8rd4vj2RDCXucFwGbfvYkys+zQpO9MD
         kvvB8wlzhXl6XNtIDfGaPliVXuLzhb7I9HbeMtWDoVlZ4Wc6oAlUjKwyCDjG1Ro3wO46
         c0WQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014274; x=1781619074; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhjDW0OszKJAGtPcPLD3bV8YMBm1E7bkkVTPi52pFmI=;
        b=H9jALVedjFROOdZmpQv21/X1c2AjzZUCxFXZH3l8DG0dtZcBhEgg0qvssyzJJTLzey
         NmY9eaH0s+HO0LB/o1gUWkEN8QAjuLf8RsK4ksSj0hC6Yuc4mWrh0+PZ7ZssbRDWKPOr
         nJX7i+STowoyYw/1L/6Dfqaw7JxJHyNqrAHMDBHB0Tfpb+fFlxYcdK/78z14WC312v8Y
         SvVDMKmFzTq2gedm2wl3o6oxeWUR/PKW0ruT9lWsI51f536AB7Hxv6C+HgifjBO2su6y
         Z7cZuNGkdD5nXptY17VF5Ru9YLBdKXH3W7CfousIEk8LCHw6hZyLz3q6DHlN4tZR+Jed
         ZIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014274; x=1781619074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhjDW0OszKJAGtPcPLD3bV8YMBm1E7bkkVTPi52pFmI=;
        b=cmW/IwoNLZqU2hOSyqxQ0qDJY+fnbppVtBkfiUWGP+T2AjKMlFRi9t5PnhOd4G9erB
         6AkGbTKjSqwDTYLs7X1FM7K6s9O/2cZXlZIHTZoEndxhnq6c8hyqrTyq3Xnyt9X8Eef2
         vgeqIWpx9lVKsMV7+0rgVW2zU4OXVs2Apo2++NeaVKoJAH2A5J7TfYsofnFGA/6NhHAU
         j0IatGk72KFl3TEAf2VqMnMfEARjUv0zxynjRpyW90CjthDK3789AyMd+xdO2PkGKc+D
         JseRdqynBQt4mcO0nJAub499pB57cRaJVBRO0GwoOf9ddwuYwQlqtkwqgT3lSYHFf0lr
         0+WA==
X-Forwarded-Encrypted: i=1; AFNElJ+aWIChGQ7fFK87SZlECbPiDNsBIJKDmHSOeeA1BQYvIVL+A9qqzzuo5onifyTgN05hLiUFMP425GSPYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz75OvYhYHYWVo2/TpUhTidVdgeIiLjuIhVGxT7gw/jybT8uzg7
	Ffqf8UNN7I/9tKp4Gtr6DgWifQpnEm+7LvwdnTdBSAtl+J0ao/BeLFZ4vnrI80sADtsXRjn+QGv
	C5lADcly6RA5sUJrb49jovumYhCl4Abw=
X-Gm-Gg: Acq92OFP1F2R6zh5UeUsu3iHvLwkjiiNLjtjP34DY6qGCXu4UQcroqbt6IdI6cromI7
	MGBDBsbqLmAcKcLPxwE1oKIvg5sBJFN1yEyYad0lCP9DC45+r0qEJFH6LNUgTa5Qb667Ogzz7Dv
	udJ+iUewrMn+4UXaNZzwFDKTPgx8kWy5VulYpctOztstPr3+PJDz9FmhPawYETrge6raaMB+mFj
	Acvm4qugBeSYGrLY9id69ATBvLDaoCwdgQ6EPqOQT+ha6T1wBVOV93t4UADbd9pvsaVSksQCPm1
	kbPyBHxdRVWJUAuHVuFMHkLES7a+cN4S09Yj3VHSEaFm+NPFQEHzkAOUm3izwJ9mLcmoapGhChQ
	owN1VyQ8aQXimmHPmoIQW6y58D+Nq1DDU9Q==
X-Received: by 2002:a05:693c:3749:b0:304:8860:74d6 with SMTP id
 5a478bee46e88-3077b21ea10mr6213247eec.1.1781014274135; Tue, 09 Jun 2026
 07:11:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org>
In-Reply-To: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 16:11:01 +0200
X-Gm-Features: AVVi8CfNPwpEZxw0N5nqXBfBlOCze0ATuinL6YIsUVP51KJlhLB9xVsEvEDqHhw
Message-ID: <CANiq72nkYJnztntLzB5jNwi_oRY+V7UMpf6AuKM07aGH9FwPdg@mail.gmail.com>
Subject: Re: [PATCH v17 00/10] rust: add `Ownable` trait and `Owned` type
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	driver-core@lists.linux.dev, Asahi Lina <lina+kernel@asahilina.net>, 
	Oliver Mangold <oliver.mangold@pm.me>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:13=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
>       rust: page: update formatting of `use` statements
>       rust: aref: update formatting of use statements

Applied these to `rust-next` to get them out of the way already since
I have another similar one for `str` I am applying too -- thanks!

    [ Picked from larger series and reworded. - Miguel ]

Cheers,
Miguel
