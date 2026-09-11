Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92DA4657D0
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117800; cv=pass; b=hdOKytdzjeiwpe1Z86SnSFUtmPCmxsPJYHYU1xCinF46+LlyKNzMIn9N+AQA9KNRtJOdqBW0IJJPrv/1HJuldO3Pq6xObeXBClj882oqRYp+VtQBDEGhbhlO+3E/N43FuAZu6wCvZQhZtRVIFjJiUgayAkDjeiw/g2yMdlvBgbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117800; c=relaxed/simple;
	bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uwj/FmpnFIMCa6MCXn+/xrE4i0bsZYoPBR4PQlJ9IEB3n3BlgIgIgJ0ZL3b6NKdUTBFBCj2IIDt4JN2G90oY8eTNqPqUADPOw+tPu3fdPIS7RkgdEHOqMf8vBwYGPDEIbyEz64eRFV+lJtAWR1+csXKXH5A+1pC1Q5tn5Yb+914=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XIih0tqG; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XIih0tqG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485888b3c3dso595545f8f.2
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 02:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117793; cv=none;
        d=google.com; s=arc-20260327;
        b=FCnf7cxB0t+HtDgLRw/t6LMhIcu9O3cPXW8krUgy+7WEyR8PyEdn+NU1P0lKZ5xFDu
         p/Bezc7fJnKAItf03vf3NmVsbDcjXE31OAolYK1gcOqtajVjzu4n8eCvTY0ktIVsX1y0
         mFvGS2drk9y9dbxfSUIlrIRGf5/naUWb3TdcCX41cnZHeHDh8IigGbZ1Kfk6TC8vvdFX
         dKEpTDx6rqIDgb9Y+o7KiCwuBQmpT3MuHY5yxs3HtfMDNIiKh2RbeY0Z7w5UHNTVgynn
         PzkTREYItd6MITJZOHDHPGx4kOHYq43MrFzZ9ph8ThiIwBxTWMROJr+y1vWncF6AUtSL
         AgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        fh=9MZ/rJo78uGpPEzpwrj90iHrum1vAcuanwNJ4F1o9Sg=;
        b=JJe2Ufc39aA8TBhRMXty6OXfOrL/I/bpDehDfvkCHTN10UHhFOymutohwX4vCkKtli
         q7nyK/R3kEST7QOMyi31XmKu3VaerotQS2FnOfbcHKPDRRTqs4qa5VpkQF+fgucX4AxL
         26xoYW+PbhpE3co/p/VHyJwrWfgzKyYib7sOKIcEhCs7B6XG2HwU284FHRBqkNoQJkDu
         fKtTs1tO7HYCih3qHiahLmP3pyYCtdTv3VfP03tHosJUbGgpQy2hSJ4lftjVOpSsYhI/
         U2cLZeFp4M8fvWfurorrrGlkex7O6m9clbETZk6JpDqdeKRAG/qGcMTEq/l0fKSqCnQO
         Zklw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117793; x=1789722593; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=XIih0tqGFPXY/fVw3Qc8ql5KClpf9xhWS3zPlRDsngXaUPtFuOIW+vEFsD86q8hiVm
         NmGIFIfzBm0jrhT+XtQgTxbCHsFgimY1Ye6duOTrhZgIO/Te3jQpFoNmtMOBO9XRgWBS
         F2XqVsBoNv7JFqHmiL91FK7o7Z6jqtKEjPIsVSpg4YzvAcIBNRUDAQfYBioXtvM+zw1E
         hnqkZ3hQ+qwGIxwogzVCbZgsFOZg5nXbI9Lo7uDAtaLzGNwkR85bDOb0STX9/2bJ/s65
         yeU1vuMiEHr757WtaKh9GL/mBXm/4PpPy9I+m/gFj/bFj+o8k+AWpLWKu7sRF8HlLw/K
         Ot6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117793; x=1789722593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=EEPDy09FrVitMvEPg+/4IIXnF7JgJ5mTEL/8f0bBULQD40Eax92BuAAg28KB9vIIN7
         dLZI/Ii3fUNuk4ib55qieHYnXwf9wFkMHCRaE7bpFhWPrdTPln8q1rm60G64zaRx/2wY
         CmeRpsaY9nn6btKdc4V5IVukAuWAhjPK0/Qst1HBJRjxIrZB/GHQuTuv0ER0XrKbSoVN
         dNbyeGvnaxAljnOdDi/+uCWuDRKLq4e6gXNflY4ntaJGmFWB0iR+VxVQ3y/7+3tnpl8h
         QyEVVXmSe2QeMA9Fyg8zwBKXWaa+/nSzR1TlMGZvm4Qbdr1wdWBFiCgUG+rvYYt+l9vt
         /Pdw==
X-Forwarded-Encrypted: i=1; AKwUvBwo68Wj1CnVHHsBS38H6KAduYZCP96EpmABxb+9dbyhbFnlK9AJC7756i90VxY9aQVJUj2yEXiT4NYuGQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mWeWxIMrYNG491SU/eBNnWcqOfYnnZPpEJ83ZSFcCThiOOm30R
	aoFB+64T/GXetdniGyqJM8y8khAAJDSaglxZSXhima7gHHmuHKyhA4SrhyAdhaehimkTEIOSdwG
	2asKsb7O/gMB/ctR5X8KlOAlrDTRzscNepH86ddh5
X-Gm-Gg: AYBFou0QM+qfVBBoXNurGyxVrLjtsXPuRtO+07sKmwHLrkJRz7dPshMI1QGwGbj12Wi
	Ao1aX0OgfPMv0f6jMMWvSnD5l7BHDps/U5VNTtDZt5+sGN2mkvOT17e6ph/NafgkDXp4RXzw6Qe
	BF/8vZIu2lS81+MZggAMB083PytG4/V99W1pRQnWwczXIKaM42/LK5PEkkwnQJKQVxHKL2N1jHr
	pbA0AoiI+zNASvBS1nxojDrJ+E8QDDaKlDF+hDAGvAg1/OpkQieJdX1nGbPkdNcog1ePPcI6psA
	ACVng2kVSPBBdiY6hjUrJfXfOasgdPobbHLYRuBhDE4QXCqsXQ3qBlZoiRROAnDIuUAor5TY8wh
	wjRl2Vc/u1uEkS75wx2IxgFsAtiZam2Fb5VvMXEMa2BjwsgvdWoAN
X-Received: by 2002:a05:6000:118b:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-486eb2fe6e9mr2544735f8f.42.1789117791504; Fri, 11 Sep 2026
 02:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-5-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-5-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:09:37 +0200
X-Gm-Features: AcwNN1U8uQc4Zj212gVRashrRro-WErwh8uVMQ_MWKQsPaL29993fZfZR2Hn4U8
Message-ID: <CAH5fLggBGvXayMT2QGo5JeQkYeJYc0L-348-kKLsBs_g45-fnQ@mail.gmail.com>
Subject: Re: [PATCH v21 5/9] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
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
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:02=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
