Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033174CA299
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823361; cv=pass; b=UwfBBJU306R+teXxFF2z7Pf8Zc2NTB5LcPyUF3/3arnqGR+ZRTQLOy2qqdWt2MRtR6G6KxYw4C46p3jtmp4zrzgL2Hlhlgo99+ECY+Ka0cfUYZCBoSDm/IJ/cdXUsJV02U8jQ1OLLNY6O+VLwqtGlmAuJiryZTAF4Vn/nUU/ZjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823361; c=relaxed/simple;
	bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtUZmhBuHNitFZVtbkvE9X6OvM4gvtxnsshiu7L+eDag23hRp1yYW5rYkEchC6rzxA3OrYi9/R9avJz/CEdxMMqowgXn2bsgvrMIlf8Jguo/MroN1PboP6gn7BuY1BKgXQbv5D09CR+z0Wcf8cp7/i1CRl8USwRd26VtomeD808=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LERPoBqr; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LERPoBqr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf420670bbso1925675ad.1
        for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 09:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784823345; cv=none;
        d=google.com; s=arc-20260327;
        b=MQvPX6aE3sOcZGMFIO0Yg1/QydUKr+ewViVAgchP0iA2DKn1ZI6CMXBSqDueRcMK8f
         6j8tZB8ACbOFRH30JBPoPp7P/cRYJYq1rjNA+bJmbz1hKQXO1BEs9A+RsmJFJk0OAsbl
         iP0j+P5jfAH+CRN9A0muSEMHZ4C7C4Y+iolABv4vtCO//25oAme2emCNtuhpsh6YIkTD
         uSGIIicojrfJMHYE7T71Mls6nsLaONWG815MUWaQKQO83Xn8Fb9iNH5/Eqtf6uK6c+Rs
         IbrtC0pPHbOgdV1pY8fDuwL+x1CjHeIOesthNYU6Nxd12SP8FZNkeG2TH4gb4EXI1nf8
         TauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
        fh=ChH+gHNMBX6y+V1OprLGBcaJJ3Dg+FDnJo+cNr6s4KY=;
        b=f/GAV+417iCuLT+Sf2EjdDtVq4OxPHig/ZSqBwxd2Xv4idLTuffhh+Prs5pYSxJmXu
         1nVBbs5FqdbSDDBYp4JDRbOHo1nFPM7Op5GkObnPN+Ld6ieH/nET9hvO1x7aFm05KouC
         UNkkmyc5qzdO1TMySfwWtwcFpRCWqzJKAcI9u+SLnev0j8GnIGPYbByHmIEjBaBM8QTC
         +7jtoNVDM9tdeFCO/fDYD8W9/99tYoO7ZJ4R/HrQ7zTW8qLq3kyzFCewbKakV1o2VAqE
         3sY+ZFXXkLFUpZIu6cL3OZ7tbaEW9bIkJbO9VFWmX+PACtKKf3KJ78TJhXcntCMSkqXM
         wRuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823345; x=1785428145; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
        b=LERPoBqrpkwNqgYJu9zzu3y5kYpA88/HRaVX/wv9d/vYIqejjMKx9U4Bm2xbH3UGQc
         whxuvApqCyhxdZyndRfjKjr99UWeqjjmkfQ1oJo00COiLGeZOUdD/PLmB9+MMoVt2lRQ
         nFXYhSDCcJeMk1ih1/F6EkPSxEBXbIP1DwyoQvHWK78MD19wv5zj+idoO3xnBseidB1u
         NXA/V6CmrE1vfOKMRZfyifR8tcyma3j+D9VjBuvFGN5a3+AMyUeY7lN4YIHxvK92shjD
         CyTchgEazD96gNztRSwrcWWoFQ97NrgjCV8KEzu9TW3Ao1VwvVuZmcmphQHNJ+S4uoee
         yXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823345; x=1785428145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+UuQnH9p7pQ4txAQtrBZMq/oyL9mQTAJo5xHQjvdvQ=;
        b=UJ6zmm8PKd8L3iU8uVHpn9zso99Mo+7NFax9nO/Lf33oHQjN8UcBmjrzM5IssAtDqN
         7tajtMAW7iDEdSOLg7ektBVYe1q446EAXaYePE7oYXwK2g5zXqUSvkIvVhct0rbFX6z0
         YdptcYx2j+EoR8XMBhyQXIat50FzYzNSawApw+p/ikv5L1Mf5b5bk5lVfr7gdU6daPgW
         7SPx8UiBL0CEYQVUHFM2vBd8MnCRwXhQWCfWUwjQGfPS+394E2roj6YbzK+m+r4HE0ey
         ulQzPjzSrpYLZN0Ako4WuMlnJ0L+WsnW5zHRWfwJmnQCxJ+O4sANYZ478jIItQ4+u7Vv
         1VTA==
X-Forwarded-Encrypted: i=1; AHgh+RpUH8V0EQddUSl+Gy2e0uNb6V8FXG0+q49KlpX1MxQN2hsS69lybjHxTYFoRVcF8mwstm5mT7LmZmL0tA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF3S/dQi4dAgoo0Y/ceyBYUUZ4N+6Ax0VuhkYaIkk+CFHVU10s
	N5il+cJ+nC8LMxktr/kkt2HwMzDPt9BSr6fk/UxKxKseABQSZavDjnXpNoFHPM5x0k0tiRgCkEU
	/vcyKxLvghXZOxlUfBX02aTv7Nz/nsVE=
X-Gm-Gg: AR+sD12LdstKTmYY7XJ0DNdRFhwU+cmIUp2VsARo3gi+XOs0UHnJWz6WERPiM2XrPj2
	9FHf1zP8nVlivRmZeo2lFEC25CtWWTdZ+7zB08gIbfs2T4vvNDyus0pf8h/qVroR990/89G5svd
	X0r7Zea3xWwHDIPOtP2/YWZvQgh2CGSnkuQHojaJKWYdxCDTLH2VfFo/0S7ep0KlB/7Ku5EVRuz
	nBMt4L+LmOD3M5bNuPuk8CAVcEdU+1n9/DH2ZQtpuuEQ5siBRnOkIeqtCJ8njldBfUYvdwpitcW
	JR27Kwd/iwHELOFVVmxUAshkyJUb8JnBrNcyoyJxAvACmmtHDzEECgzei+QiP52qmSZDiwM8o7G
	D9A==
X-Received: by 2002:a17:903:98c:b0:2ca:6885:8a06 with SMTP id
 d9443c01a7336-2cfbd2b74c3mr2366395ad.5.1784823344470; Thu, 23 Jul 2026
 09:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
In-Reply-To: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 18:15:30 +0200
X-Gm-Features: AUfX_mwkPOgZ5l6-5ZKvWl3ZTUXh_wDSFE1Ix3DRe1vASO0ih2BX5vJ8dTJn36o
Message-ID: <CANiq72k34khi=vGRxge0sX-1d0+N0f=ixhdko7jqvfw1S4dsqA@mail.gmail.com>
Subject: Re: [PATCH] rust: dma: return zero for Coherent reads past EOF
To: git@younes.io
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Timur Tabi <ttabi@nvidia.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 9:22=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[u8]=
>")

This hash is in v7.1 so it should likely have:

Cc: stable@vger.kernel.org

In addition:

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/t=
opic/.E2.9C.94.20Possible.20past-EOF.20bug.20in.20Coherent.3CT.3E.3A.3Awrit=
e_to_slice/near/611677095

since it was discussed there :)

No need to resend, though!

> base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed

This points to `rust-fixes`, but it was likely better to point to the
`driver-core` branch instead.

Thanks for the patch!

Cheers,
Miguel
