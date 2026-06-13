Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545F9385D75
	for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781344166; cv=pass; b=eFGjPDGrBE9LE96xjZVU/7e8wL6eC4Eaj7d+hNklzMxIfHn0yDoCD3xpTROfRnAa/XvaXzpCFqDk8r/BwClsjIXbjqrND445t69cTZEZd77MmAZe3zvhauVzFUJ8pU9ske7oezQbkQHVRK/4J6O13962fCvYx3BSfEAjkiH9Ee4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781344166; c=relaxed/simple;
	bh=N+BOVUokZvEKxogb7woXjEf8tUSXjSp7mQH0tyGXKLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzCirn7ztYKznj3dwc6xV0t67IRV++KSfX5ISmwGTJ6QxRI7ulYHaTj/HPfSC2um+1YQPt/tO71SG4f0sLy5uEKM76X0iSs4FWPwopVuEldfHHdDb49b+fmIq53CHjdyvjw1467v0jDVs+5m6KUgu+hJKeMTRugIH0qxoYUTH4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXWeID36; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXWeID36"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3042a99f0ceso251922eec.0
        for <driver-core@lists.linux.dev>; Sat, 13 Jun 2026 02:49:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781344164; cv=none;
        d=google.com; s=arc-20240605;
        b=h1Az2/kWFnovaecS7U7brCVXC/LfZb+DsivmRhj1LPMpFLHjBSFoUu5Wt4HbSEOFP4
         HWArguei22ABXbHKxbdLDPjeB1BdGhpAmQL5j+X5C0UGwG9D3TPkB9BI0GRKFamca/JP
         ukrzpatx4JVrE4J9jy7y0PlNsRf8ias+WRKFyA1bu4VIkYKfTzbSP0RZXLS58RtaRo6t
         gqFgSYMqvwnFDaH12W7N7AXyCUD6pqbU2TUk7mJ5FqSRNjLK7+FNIjXu6kq+B1WJN34G
         0W/dwuPRLbGHf9vBRrPDc4WnL6lWnJItzSoyvF5oPr6Na5tTpNvedKxe1BuowHDaAc3q
         TtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        fh=XDckJSTR5V9yA5mL7e9Hl04NF25qfrllxN4ewYNFL0s=;
        b=khXS549ON6vFHIOri7bjobKxtoT+qPXLCRSV8+f2NiYqvzCiZIIpU/17wllsFNhq+c
         k95l32tQVGZiF6LuXTi/6G20uuF2QvuE6gjaJcw3FW7tP9JWjZG9Y+13EylhG6EPTQa0
         PhIyArJc25O//Z2N5RPRZ1KbfO4+stOjDZfUvRwZfHNM72fJeEjmN9+B/WGHKhP6nMup
         lH6uCsoL8n/QDT494CeuIQ/9q2SmWs/M8UGoGAMt/sTAmsYOg+GKe+pJCywTxJx8Vzxp
         YAzzcipgjlZiStfSsbmxW74NmRoMMS0f1oek4IVnTj443eZgUDPv4pa4aVFFERF+ez/H
         u6TQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781344164; x=1781948964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        b=pXWeID361KYC7EbArxTrBy7E98blgui7XFdPXWBvXcmL3ADgaiJYOrNpdqgwz/P+3y
         1nW+hL0QaLjsfbn9Bdqb8F+7WrXb4LU0VzWgXw7rEIzioNp1xcG0GW65Ie/noR6Fhh3C
         j0Lj4ptbqkC73jhNKPrq/A2H4+dMlnHj84nJBHhMfIlPU/sWuQR5+BAnVpHeh/DU96yx
         KkkazuscWpBGFV+UHUdXknrjeU+6nw5kP7+hFahBvD5dWqhC7sTEmN2H/MXZiFIl5fCR
         tmuFoKfiBXh7fjI6vRQmyWWNbF7z2Pz5JLBP07A7td2xDwe3toFSbS2cZVLt0L7m7pxP
         3rTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781344164; x=1781948964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkM4+eHaDUAb02aEnfu5B6pMfFHeevNTKhJz3xUQyG8=;
        b=EBYgOmXuQGUbdOarMN3vCvLCj57yZJClEmS1NWbIRTMeBQ1rMan3rcz+eugo1mdE9J
         0VgmDTRCSFGLVNLGqLSpR3bmb3eZEG/0uvsvmWXDXsJUddRcFuYpHldT4oemXUpwZXqb
         BVHKRFB2aJB+le7C4x/gRcI+wFVGYgE+AQuid9aFkghBsQ8GpgI8e5N2rPFDFhKXfQ/V
         jJujCTWEJe8/rkDj0VsEmguev4n3n43AuxEyAXL5StdewLNIg6jAzaH3X9T+bJckWgbC
         N62ZKyqeSH9+1zSlJh0wdkOb52EFSlY6USvS4V0fYlgxHDT9mPHVe7/L0cJz/XsPi1ik
         ze4w==
X-Forwarded-Encrypted: i=1; AFNElJ+8Zjl6E53HglW05o74f/F/c9B8JmCNVpMXNGoJuIpXrhIpUsMu/wYdgV9FJKj4aC2dmMYII1epITSuUA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhQlQcJ0TygmaZ5iGJG5/379vQW0NCSFzUL6Wm/GmEu5u/gTEk
	NZz6B7HuaABxDCZrKFFjOApzRRW75Gv7LWev4N85A3emK4LCG4JRHhe48Yjsb6FNYmLP+A0HR72
	VX1Nnh1dXOMeVPZlSy25RUdzxxBCafQc=
X-Gm-Gg: Acq92OH1jzDopzqgCGgPtQp9tvMiYjxBihh/QC7bye9e73v9xjg86TzWCftDgQTMPwb
	7CvuL29yXfj6hwKyCpljztUYkFRNIMx+RHbP99KQEx+Bgl2YTXhvmIGxip1BjrsjbfwL7dPRcrB
	WHowawwRYupOoyQjngsU66sN55h0nokY87AwuierJFpSEi/JW/WR8oAkO43+X2FJgTGBMRN5fdY
	zeSWXA2lLSLjL5CU0fJhIU64P/ojOSVndct++TOC7M+0iO/qn9dYao6ORODhYjPpigeS89wGmz+
	nJd0QVH51DE6sNAtyKIQB7pULx/tJ5ouNZ4iFigGxGY+jTBDSnqgc3R/fr6K05/dYDeG6/Ispdw
	4v/ejdXz4GyWmbW5GR4eqzRI=
X-Received: by 2002:a05:7300:730f:b0:307:2e1c:17ed with SMTP id
 5a478bee46e88-308200d09dcmr1479282eec.7.1781344164338; Sat, 13 Jun 2026
 02:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DJ4Q5J5OILOX.1KCPFIVUFN2VV@garyguo.net> <20260610072947.338278-1-ojeda@kernel.org>
 <DJ5A6AM2FDGQ.19T1Y9N1T6JST@garyguo.net> <CANiq72khOCLC5kG5vWhDeXpHv6n7Yo9Nv=PewNS0D73AxUDB4Q@mail.gmail.com>
 <DJ65HZ2867HB.2ZK56NEAURVJO@garyguo.net>
In-Reply-To: <DJ65HZ2867HB.2ZK56NEAURVJO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 11:49:11 +0200
X-Gm-Features: AVVi8CdobUhfSP0GVHy-aYqTcvmFqhk07mdunfn978mPaEmklHiQcpFapjBPE1g
Message-ID: <CANiq72mhdy3i+X-9ZDiwe-mAYu9DX2B29dQQi=2iAYMS8JMzXg@mail.gmail.com>
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

On Thu, Jun 11, 2026 at 1:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> > Good first issue?
>
> Agreed.

For future reference:

  https://github.com/Rust-for-Linux/linux/issues/1242

Cheers,
Miguel
