Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA05616C0
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966897; cv=none; b=T3zeeFNyJFG3dtOfI5Na0tEPs5qXM/9kGv72yXTbBamIUcTKKUA7epp0M01KQrXrkk3bp0fcjXotHRixoAOEDyMAQa0/AhZ+V4/0lfVqIfqaEbYMwas9G+s3bYoglvlYsAnKMwCODSy+hTrcn6PmV59MZNcbkK6bxPpsTQrYoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966897; c=relaxed/simple;
	bh=CECANy83eJ476WV9+m8Z1DPlG6IR5GvieLQvKQjJhkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClOrhJEnHKTTkjQbarC/AlK9zYMPVE1rLC23//Cj0sV8RUh9IDtQW9KTOXSGMiZd4luo5roBGDXV5Q8oT6bw9PpIuo5thTe9mCUMOD60ogOirTPDfIpoCNpBOUK682Usuz9x5JMbv9iYKFeIRBu7WhtgPoV9B+wxZJlw5CDJZoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5168ceso142953e0c.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966895; x=1789571695;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=haSiNz9f37NiWVNy2OnhpaaLVM7uwzgfEK4yu5ZD+M0=;
        b=M/uyN0CQdKPkFwGaRBbXDHhl0QrVKCLkvF91HeZHt9G0KUowcmUrPqhKQwIX9jzF1P
         eRaV6CKoI3rA4EMxxk0+Z3VVWbpjWDfdbxPKFaFW25lrdewJTjk2EEdL9ZM0Wsvf4hE/
         s37V05Wq5U2PHkIReavbD1pZlzRqtdcsJ9QQjTQkVbdiBTLm8uwZv2XrY/U7SAasKp3U
         Nv7NU0pXu1wR8aCusb28oigQyCouc0xt3noo1263IjtbvEe1aa3lueMrMHUz1N9E2w+f
         75mhfe1MRfMq266Nv+tn4uYI82lSFqmeZZ57wgMEzru8rITcwLaU6cnz93dFMRSONfCG
         Znow==
X-Forwarded-Encrypted: i=1; AKwUvBzS8XUeTE2NXSIzEICgmPJVLA1Zno+SIpgwf52HcsX67mKBOV4u2h5S8SRSKQjKg58DPiU57vwmgUOAig==@lists.linux.dev
X-Gm-Message-State: AFuF++kRaU7LJR8h6exoL7AM3X7a1zkv+8ReXK9+sO6zoy6FG2tE9Ovx
	S0l7XCUXiRzUpazLiMzdJPnVjo6mQke8ch/52gOxnMJDuGw+ZWEa0zOwwsOmaTYzcdxOgA==
X-Gm-Gg: AYBFou0szL4LgB9WpXM8drn3U4XSBDSV36VrgHUSGMHFUlt0u+EdGKWKm4AS+psoixR
	MsN759a1puUGDCGvuAkX2psEi2W+OihxJ/wMQH0Wrgcd5Wesvq6LfQ6YNVvlg3uPkvxYvW9pz93
	2dK/zL8T6AAXB3GU/KgszWWky2XepheyvL2w2XHPzg1eLqmJYjf0aMtyuqDCPfPYz4ANiWpnAUB
	1W2SNS3/RxicgpKKnVUhyinHbB+L6X2ThXXJ03HrH4NCmIropybfY9rX8HkipsgDACNuKoKmE7T
	t2kGGMbmpWWM0aFc+owUS7U2dORYJsZEYpmos5YDjvQ5ZXhU5v8GcODThLKPAaxNuwzZh6ZL0vB
	eP5YW5H/QB3gN7fjYMeHeOajpX52gnl7Sp4ikMy/nP8TP5fLw1XpTXL2wrrr9yrPtEg7W2pLKsz
	GmbpSVtDeeDWjZa/cBpoW/zHsc/CJiGIodWNlhorh19xNxQxwhQy+7pcCpLeZ4NN62ARacmmtC2
	ukCRJ1ocXUapJJv3yTh54/NKQFh6L4ogNtO
X-Received: by 2002:a05:6122:6141:b0:5c7:ae9a:a056 with SMTP id 71dfb90a1353d-5c8336e3e3emr1271564e0c.8.1788966895438;
        Wed, 09 Sep 2026 08:14:55 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c82ec51594sm1356918e0c.3.2026.09.09.08.14.54
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785643199baso134522137.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByTxI8eM/Yqb0gI5ZrvJ5GINSr5G7al8JEvJSAwoNGyQbwwCtXSY/JC94FsGJxb+QpAsdRlGuYGVF0bAw==@lists.linux.dev
X-Received: by 2002:a05:6102:f9a:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-7907800afe0mr1252914137.13.1788966889473; Wed, 09 Sep 2026
 08:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:14:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
X-Gm-Features: AcwNN1UB2bvnyx_MDMU6btLmRb2JR3XbtnsQvALz2JEMNNgbbOmmr-5JjuTx89A
Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
