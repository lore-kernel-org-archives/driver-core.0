Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C7F391825
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076624; cv=pass; b=dkyQYoNM+tBesSATP8qWGKFZx1Ydw/PTTV/Wtak8N5G4dCmeT7v1dIc+6vkqX5JGDj4jCFjt/XviFvRyyr/ZRZtx0l4BW2LgPYA5L7aq7AkhaNOORe7AMR+5ukhzpY9g8uX9sB8Dz382hXtae360F6otb057fwH9VW05ewyCBWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076624; c=relaxed/simple;
	bh=1u2BFa1iUX+XKaaA6ooa9MVnK/6+bpSB45oSuaa4+9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geBJk10Y04YPzZk/B+VhMny9Q7Vhp1Pn3zA0p/N5PTDEZiwBarWfObR26WZE7xEGzp0UklcZvIgppZc9+j9pLrGBw/ADn2tTwlUftovbyREEbrZ3F/aojVaQmHUD7akw2EGrn+sQuthgzFFk7rLu9CcrGtKei37ulGNemYSLM6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpNvC4iV; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpNvC4iV"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304da3b4508so670596eec.2
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 00:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781076621; cv=none;
        d=google.com; s=arc-20240605;
        b=RRXLQgUyYGdbN9mwUI4r9IY31n4g1H7gIAffX7nBmgZFbPZMHHj4U3lvw7gmKpMzdz
         VIDkzSComBw/dH1PjRj0tNKXXC0St952oYTOyMBdNjVlfMuSNfNZ0dUHqLONPoO8COxV
         rDPcMAtjE+7OxyvGpqY1WYQ6fHQax09d9sm0MF5MOWj8hTtF1FjzZfY5yvbQ/RRWxq5s
         jrq6HGGDTYziLG4ZRV8w2qmgPS7YKDXNFBqR9RFZhHvumw2Vyy3b3EUEcNUYmA270Sro
         hbN5FVCRt0pn9LaECmZUeKJOqRqtM7qdhNzJ63qr3d+GgzufqDIT+Zyy+PmvzOZ9/W7K
         NE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        fh=uy4+F3OY133l0aw18xIG32M2ILHT8iWWPnw/8OlRGtw=;
        b=By06kAR2S+BjVrKEQ6R54BHBPBNS7mDiA/eqVHcqMyR1nmG+JellD3vuGxD2TZKuib
         xwMnY9bTKenU7bqCuMJb2CVBHv+RnetEBd+qAlr2yAub+m7XV1daDL0OgjGB38Yw7OGq
         3fn2iyu2l4uX+u/PT1SRS6ZFLCaTyJ0a1gaZuVm8FTupUe7fJW5SZ/7a62ajfWalx/xJ
         nfolmIjjcJE8XWhLK+XP3MTGXHert/3sR0+e77ywlEbmKKC/0y98Z5ylCWROHWX07ENc
         NFWjVL5Lh4q5X9KSkKQOUQostVRXTLIS0N4rCw96RLAa0Itt+ERp3uPZGDJTgBQ5RF+M
         l57A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781076621; x=1781681421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        b=MpNvC4iV6kp3VTa4CzhvBF2SKixEIGjj9C8b+q+RWP+79l9o3lHnZBGMvX5ELuxjfw
         LYrrD9MBTg98Qs/Hd5/j9tH+C+UFNlyLAq8L500bIlf/2ZiUH/zsisS4AdHaCWU8kqhp
         fT2S6KW4xkJJpg2dr6czStlevJlN9+k/jHfLiGY/C6oZjXmUU8dyzHbnH/twTPdwXXFS
         CG4UphhD0XQZvkeKIL1I53kqmY+GqbnpyZo0aqfY9SAElyI/tsSXGTbpn9GpFe76Addm
         8LTZLalbfmhyatFUVcbiMzeH3uv3Mx19ag9W0SJI4AGtNlDRKhDbiQqy6tkAC+M+S37Z
         FMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076621; x=1781681421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pi1bSKu1iANxXNi53S3zpezuz21+ZWdmB0PoX/T+q2c=;
        b=r173NzFPU0KTdU2z2lREQx/COH9KbbYdQhLcNjbUDvgu7sf8fMvaEDIwfvQVaEdKqJ
         1WRmHKjU2O+9Lwxv6MmU/wRQ0RrtLzF+I/pKQGo2R2xJmIwfv6TMOQoShJRGD3CphOvz
         5yOYOaHtbp12WSfLJTsqRQgGNrrnbGSlo6C8xl5eG68j1TDvYGEv1rErMi2qvu4/bZOF
         nY2qOl88KfpumnkQOS8hrwedfZhicOCPeqJkFWKawDq/4Hzh4VanzuJlX0XqSwet93Vq
         9bXedTenXHg17o/K/+sWCC3m9lWy8uzWW/jluc+IVDgFaa0apXFReKkrUNECIiuDYl29
         GS5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/PHS5U9S2KJGJyva8u7Jy6Rjonl/C8CIVVDJ2HHsneWjtJsn2DDBuhqVBST0e9z3atryRsgdiQ5k6MLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuwAmg2qnC7imIlez97oPgFu+4C3OdmPpTfjVfT4ThIw0YBTuJ
	6vTJQbi4QAEOSGtuhp12RjK8xySNhVh8qgadUY998cKhJ+NyZKPXoSa4vhIUHs2GOAlBwYv4BcB
	ewaIpZcM5NuGgiMaFSzjCI3+SRC6uxd4=
X-Gm-Gg: Acq92OGgk8oN6UgEYLJkJHLC/OXPoboCCTySwXCX08ExkWt0xXAQDVXclooPptbeSUf
	EBIM/14yqo2zMKeAUDgS4c9WUNpwMJHm/Q07Z+dSOUmd9hm0im07fiznWcCYpjBdImVztqyhOx7
	ULsQjsPWJ2LUKhlynQ3ZXxM9wEZwICjknSOg2RHmFw5DOuSJPcKtllVK6CnATC7wteF0rk/4/HM
	Olf0+eP8AJv20yHHJtNh5YGDWsAUjMdrSR89f3d5P8OVEDqJbfY/8oKdMkNWmlnvCBPpP2W53Fy
	X1uVu2bmKx4zYapQka5L1pXPlaWFDZ8MALKwETNx4U2/bQAnE18zkvjKXxZAn2FWyfaGXJ0UNno
	78zxk9WayYZglDDVpFPgOYwCTPMyOb7lgIw==
X-Received: by 2002:a05:7300:bc0c:b0:304:8860:74dd with SMTP id
 5a478bee46e88-3077b57ff09mr6067698eec.8.1781076620726; Wed, 10 Jun 2026
 00:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609142637.373347-1-gary@kernel.org>
In-Reply-To: <20260609142637.373347-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 09:30:07 +0200
X-Gm-Features: AVVi8CfhtUOUWqMJb81Bw-Ep_qKBuU8iXg5G_qpR2vrQ4E2KJJ25x_mDHtH0Smg
Message-ID: <CANiq72=H_box4dE2aFWcENE-UY9_1cAKMWzhxLUS_a=zHsFKrQ@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Tamir Duberstein <tamird@kernel.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 4:27=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> Given the macro scoping rules, all macros are rendered twice, in the
> module and in the top-level of kernel crate.
>
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Acked-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

    [ Sadly, because the definition is hidden, `rustdoc` decides to not lis=
t
      them as re-exports in the `prelude` page anymore, even if we refer to
      the not-actually-hidden item.

        - Miguel ]

    [ Kept a single declaration in the prelude, and reworded since they
      already had `no_inline`. Removed other imports from `predefine` since
      we now use the prelude. - Miguel ]

Cheers,
Miguel
