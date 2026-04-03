Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FBB3B4EA9
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233638; cv=none; b=LX1mxOM3E/e2yOGeQeJZ2ol7IHT+bWb+3qXBu6fm0EOU2Z3Qf9H24jOBWWzyeTOrluXQMULKwm2uUGrFCcS/fTmotwYkaLYhqHiCVdsbmaQVxn2/nv8q0ydQc/8/v94GDpTnDmfWvDH44AWGV3lmLDEUKIQEbXyJ+VSEHQwXeUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233638; c=relaxed/simple;
	bh=pvTilDtBhKBIY+6xx/s5Gq6hvXKdnLiCnQn+KLPaRp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C5uJ4iBMvfpUGG3uDBmcUuxGYOkYQJOL11pfHX8/5XQNo8EqfTauMw7kUIAkx3CX2RbvBfOP0caGxPbKBk9wpJIrXSEw7RT8jQ8BUq3BJShD3MEnKldgSSDgRQok0wcUFIuUtrExaJf1iIwA4yEfVEY7LZciah1kxn5WChTQ2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hlTjUYQ7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hlTjUYQ7"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b936331786dso218353966b.3
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775233633; x=1775838433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUeQPGIt87F0rbyVQr6vuwoCOQ88eKT7ufcAUrXIRo4=;
        b=hlTjUYQ7EnuxHKS1l56JIrhdgLmGEz461R9ee401kkGQS2LViIFYJuyBzely/o3wmF
         zLQP+GZmU/LAzRT1XZ1wIdNrxukusdpJqRdBY0wgvJ1gZd74sCLYl9N9Z0C9FI0D3nSk
         bJ3S30a/dwTUvVBRswR+yxFVUJuNNYBhvPkq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233633; x=1775838433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OUeQPGIt87F0rbyVQr6vuwoCOQ88eKT7ufcAUrXIRo4=;
        b=M3ISXYcrF1v/ucfSJZEtfcWuWXh+QfrOhO/nOaRhwBu1VkHixAf6vmoAJwv6T1madO
         Gb4oUcSe8jdTYitwg/avTKgX/k+1S05kCSmvaPh4Y+G7S+/2ooFTEv2M3QUMK5JFUmDw
         nqosSoLHAnVgdN4LEEDNdj8glprCOFKkauYlB7pdpg+zR0uruanFWh8ASgiU6r3LXEEe
         rVFeB6XEoBngXEGTqHdzDEROFSI5xwLyK7VUfII+wQS4Ik8XwNmgBZeM+UkiE0vgEfOF
         33bV2RULYoo8tS5zGSuiIf7YO1IAEH357gNRx+MDSlOZ3wCCsNJQOIM3aNt31i5f0big
         6LtA==
X-Forwarded-Encrypted: i=1; AJvYcCV3BeL0dsaNO1Y3tiAz619mXgn15NgnGirgN+6Ixk6Qt+u44kxW1qlNN0owFOYMSjw/hLhHPhKUVEbJKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCw6U902z49xZ3VOguvnElspJQU1Mh3OK3V1aI4A1YaeNHky4c
	qhPGuspBjYYYb0r6tliusgfr6IJ9gz0V0Y1WLror7Xb49n5bX/3bUV37ZaBtZO/uUResFaqmX9H
	uU6hYj7II
X-Gm-Gg: AeBDievtll03IS5YvpIVC66yzzfaVEoBeaEA9AJH985ZZi6ltmFL2XUMMC1foqLzI2w
	mJRGL/xYO7NNp9AYQGHJvGWf2pxQpaKZF2eSpmH2A3Dri6pyQeTrrcVjAGMBby3kX0zJ2AwOkHV
	TdtTS6C3DwpO1MKBtiEFW8C9n7qKCMvq2raUkNxdyZPSWGMTEZENueuPcYjk1gY7PMBQ4ox3BkW
	2vXDbIleUBD6t/MCRPqDDivcUd/X+iNFGNmlNe9toFzm5t1nxCBULn/UcyTS5JIsQ3Rez8S8ssY
	PDxCH1uc8701VbOPHoHckQmi4reP3yvZ6OMqJu27MNLOS7fGt9Y2NPXdi+h3Y1rAwqT0XDEQ5Er
	cD9+/OVyRHuwAvEewLgG8KBjMKRnwPMwVM782Qp9vZ6Ayt+/PzSExAOSqGVTlOYKGUkaOaZwAtC
	6LFRYw6JrkpSjdMN0JOfdm8RjGtIE100sRDZikgFzwtYH/05qBVmQ90wJZvgK4Vw==
X-Received: by 2002:a17:907:9999:b0:b98:4e9b:7e49 with SMTP id a640c23a62f3a-b9c67951919mr179199966b.33.1775233632651;
        Fri, 03 Apr 2026 09:27:12 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec58f1sm214977966b.33.2026.04.03.09.27.11
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:27:12 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d029f346eso1900823f8f.3
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 09:27:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaj3UZtduPGPHe9iYdNg7XD6SXJ5C2y1lBr4jtW2TvbFTB3uy16NtmeR4094wewyuTfv1d91GqaM8EQA==@lists.linux.dev
X-Received: by 2002:a5d:5847:0:b0:43b:4e13:221f with SMTP id
 ffacd0b85a97d-43d29300bf1mr5983818f8f.47.1775233630478; Fri, 03 Apr 2026
 09:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403005005.30424-1-dianders@chromium.org> <20260402174925.v3.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <2026040319-seventeen-humorless-5541@gregkh> <CAD=FV=XmnWjVzQcr13GmRKX3cvRortA==5C8TH5D-jRBe0VBqw@mail.gmail.com>
 <2026040353-glamour-repacking-0e53@gregkh>
In-Reply-To: <2026040353-glamour-repacking-0e53@gregkh>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 Apr 2026 09:26:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvqPH7FkRh16u7EE3LAuw-oUYbAdiL1nZxizVft2TqKQ@mail.gmail.com>
X-Gm-Features: AQROBzA-JM1RSDMJUI5giQRrfhVGhdnJrGAOYUF8apJWtN8tBElJTzv70RQO5p8
Message-ID: <CAD=FV=XvqPH7FkRh16u7EE3LAuw-oUYbAdiL1nZxizVft2TqKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] driver core: Don't let a device probe until it's ready
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Robin Murphy <robin.murphy@arm.com>, 
	Leon Romanovsky <leon@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Eric Dumazet <edumazet@google.com>, 
	Christoph Hellwig <hch@lst.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, Johan Hovold <johan@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 3, 2026 at 8:44=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> > If you wish, I can turn this into something like:
> >
> > #define DEV_FLAG_READY_TO_PROBE         0
> > #define DEV_FLAG_CAN_MATCH              1
> > #define DEV_FLAG_DMA_IOMMU              2
> > ...
> >
> > ...but that seemed worse (to me) than the enum. Please shout if I
> > misunderstood or you disagree.
>
> If you make it a numbered enum, that's fine (I hate unnumbered ones),

Sounds like a plan.


> and a comment somewhere saying we will "max out" at 63, or have a
> DEV_FLAG_MAX_BIT entry in there.

Sure. To be compatible across all architectures, it should probably
max at 31, right? Atomic bitops works with an "unsigned long" which
might be only 32-bits. Oh, actually I should just add "DEV_FLAG_COUNT"
at the end of the enum and declare flags with DECLARE_BITMAP(). Then
there is no max.

In total, I've now got this:

enum struct_device_flags {
        DEV_FLAG_READY_TO_PROBE =3D 0,
        DEV_FLAG_CAN_MATCH =3D 1,
        DEV_FLAG_DMA_IOMMU =3D 2,
        DEV_FLAG_DMA_SKIP_SYNC =3D 3,
        DEV_FLAG_DMA_OPS_BYPASS =3D 4,
        DEV_FLAG_STATE_SYNCED =3D 5,
        DEV_FLAG_DMA_COHERENT =3D 6,
        DEV_FLAG_OF_NODE_REUSED =3D 7,
        DEV_FLAG_OFFLINE_DISABLED =3D 8,
        DEV_FLAG_OFFLINE =3D 9,

        DEV_FLAG_COUNT
};

...and "flags" is now:

DECLARE_BITMAP(flags, DEV_FLAG_COUNT);

Yell if you want anything changed. I'll restart my allmodconfig
compile tests now.

-Doug
