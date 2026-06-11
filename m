Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444D368276
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167888; cv=pass; b=Wo2fyzs3a1szI8LPBfHy4x+yx5h3A94c5SsZ/auQecoyDZqUU9LgtGxJaTvcqyHvXd5mu8btr74TUEOFtjeskSDS1lzSqVzkGTGXAua36i04E4A+bb5bCC4hk7qbQDfsuFcR7PEjSykJT4p74xW1uSRDCNIObXJNHVk1kHEex8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167888; c=relaxed/simple;
	bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GK5txF6KukvJRqB1UK0rpr2k5nly3VOgFBfYB4iXOekkKEc6FNRd4M1xtTTwnRsQEgbV0qhXvfHvyjHw21AVwZZnvbp997O5wHuYOvakThKqC/VILkxC4U+kGulQqGiYAklzz5qFdbh9MeATlzz7F+hUw4iWz7b6Ve60zr/qUNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNGUXRBa; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNGUXRBa"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3042a99f0ceso942887eec.0
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 01:51:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781167886; cv=none;
        d=google.com; s=arc-20240605;
        b=Np+72D+y3Aaz7o84+CMtsyI02Bx0caRuqZlFVLchTHOSSpNmTQfOpZ6MUNZ7XJqF2j
         GqK1zL+sz+8Kt0zqMnCXWqiMh8rW/I03Dc5LzuFWECgRIv+Tnr1r9RLjrEY70yWXTHPv
         Xm2bcneQ1xfwJYjh6+t1ebcsVtJHF0oww5OTtHBuNa4Bo27NmKPs66MkUCEJCyxr3pL4
         yYDS7Kt3iScFJLV3uHiEBpuRWFch0auEaIrrIl0UY2MMrRvhoywsCXF17IzQK0uHHu2/
         VDq3+CgiYtKRBnkSbe0q3wkk8Zq50VmMd93MgGhaQmvjnbBmg0vMh5qggCV/ostizzYA
         MQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        fh=GRbhrgWPkOR/6BAR5U1czk9WhNrhYHjaC5JnFE79SdI=;
        b=PvFEoMoLA7j6H8pKX464p5TETL4sCbsR+S5mOi9qppC5iTlBkgDAZ3gvYR1PCsUgHH
         cHE3VHD5z24T9Ua/KvJOq8+u3Oajvy7NXYwmAHHxShvzc+pzsr/qRDjRpTeAeXvbqoD1
         /cm9gdhg5m8FCvcaPWNKuLG+xYU3scdOZRtKPrEYGghJTAphNojpoENV+c46C7wkZn7X
         AMt4mmDhg8xot3jz++sztZlhX+tJwkevAkcq77zjmuIPcNqlzAG8JOir6dnv8jr/JYmz
         8X0Cv40QTuL/gTH3XhS84YftvtQOWu1MvJCB4rOeL8gUnys+BlToTht45cbKQoUpOkE+
         H2pA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781167886; x=1781772686; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        b=dNGUXRBa2JKnG560ek3nvpW80oC5phn950kRFp+e/v4jTbiGXWTHDtFhMro+xgmNm+
         bB8joeXtWmliEnZw50PwS+tW4lUHcLQx/UkJvqPekq/CLGY8wByfxx8cgl7czgUHlZUk
         drMkPG6m5eCpfMiUhsPbC3FRtNDwarPRkuc76n0Ht0AEKA3cKbzCzYLOzlMStW+7BG8I
         +xFRTd4dDy34VySBj24QWuBJsRtcYD0mSG5QAHKWK2YElk6bzfTs8tCRgP/Niq3MZZz6
         eiGI7MgrUyhbk1HvqsVQb8dT3R+2tIv6epx6l1+sT6K/e3GuwbI+s7t2+xYwSC0EVWv4
         dP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167886; x=1781772686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gu6SXLCI0/eC/AnJZSyIbfVO8bAqJ5On3y51xTlO4vw=;
        b=aQcA4O5FORL7QtDrk2a7Iw+uOIv6tDIk95FBxcI3YE1vT6FhxgH74f0d97NtRMaN9n
         LGOJhe87xEiW8Gu7SMFcgkuN7Wv576c0sdMyPjcN8qDWOaq+z23wRkjwhvqqKAPax7kz
         mQsQGyt7qpVo8pVQj+VQwKMKSAWwunxsS/xqD0g22uIBXcWo0OYvEWgDpM+CLaYWXyE1
         iAyVx2vmjrC9UsaLg54SZxcKVG1VDDRaKSWioA6+nfdIIRXsDVvpe6r01DxRVwY090sK
         uF1WxsdclhtMgXakfKzMU235W5gRBKrl+Yxlkt22e9ycW1bLFNnwB8LUruHlvlzplZRW
         vnGw==
X-Forwarded-Encrypted: i=1; AFNElJ/amNGWtDxw2KwsED/F3gi1eJmh3YS8/qy8QKx+Vx5x+GoQ+36sX52IqhNW2v2ra4GIRYUOcy2Zol8x/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjAbuqDu3hx/AvkQe9iSLHBQFecLIpfASPIHqo9sVBBozFD7cs
	nXOg0rH7tztuKpSq7eaPn7p9n7QZnmH8EAWgbMoxKqb7y8xQg6mQMg1283b4GCEhs8Rmv2ySXYR
	RIxf3LRNNKhvuLk207QVhmu2a5aJEUTs=
X-Gm-Gg: Acq92OFElHbj3/ITaQpNcaN67u0fbIxuXlBWvH8q6v+kjvEJHUThTE+KzHhFLb3DTDB
	gO3LOWLZFRppRq1hlXtrsvNYM7PdyobKOiMKqsos/U++TR+GgAMPbnR1RjWJmNRLcbtK8xn2Hkt
	+rgBVB/Zt6ckDiNmNk3PGsZKCvwWyLVUJFe7ymOyEesd5onfvoA0ShzMw4OVa4G6OYdK1V13PZ8
	0rMQ2Hl39wPa9wT0mHkbLXzeaAWYl/S81qwPwhSpKMkYZQrVk4DBTBUi8IjI7RsMIXfcanbU8HJ
	qSh9+hAKgC5keYhOVjlQozhqXQ+A5IOdwnxwA/yncPAU+VNIHTvgWJ+6HOBsgz7hHfTuW5R+NR3
	smsb05MhTiziHvwJ3gZuKqCBCrclfNzu32Q==
X-Received: by 2002:a05:7300:8184:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-3080410050emr652555eec.0.1781167885763; Thu, 11 Jun 2026
 01:51:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DJ4Q5J5OILOX.1KCPFIVUFN2VV@garyguo.net> <20260610072947.338278-1-ojeda@kernel.org>
 <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net>
In-Reply-To: <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 10:51:12 +0200
X-Gm-Features: AVVi8CeZqdEWXPdGh8thUTK4-wo6B8DARvooPGXEOY6tr17NX-f1ZHtJHf1zMrU
Message-ID: <CANiq72khOCLC5kG5vWhDeXpHv6n7Yo9Nv=PewNS0D73AxUDB4Q@mail.gmail.com>
Subject: Re: [PATCH v4] rust: make `build_assert` module the home of related macros
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	airlied@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org, longman@redhat.com, 
	lossin@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	netdev@vger.kernel.org, nova-gpu@lists.linux.dev, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, simona@ffwll.ch, tamird@kernel.org, 
	tmgross@umich.edu, will@kernel.org, yury.norov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 2:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think if the re-export is of form "use crate::build_assert::*" then it =
will
> still be the same semantics but would be appearing now?

If you mean a glob import (within or outside the existing `use` --
same behavior), then that makes the glob import appear in the list at
least, which is an improvement because at least people have a link to
the module (i.e. but not the individual ones).

Or do you mean something else?

Good first issue?

Cheers,
Miguel
