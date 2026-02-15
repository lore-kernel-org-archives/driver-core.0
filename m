Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355925A357
	for <driver-core@lists.linux.dev>; Sun, 15 Feb 2026 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771164705; cv=pass; b=tZjY1f7F5czC3RlyKCYqxCSkQNOvA+GqttZ5yFoh7f5yNnVArNMgdwOozQE5Z8+AN9KSnnlXHRzJKNRnj+9xKMv3KS2g33smdq9ylsznDUFHyxc0abv9fCl3VsbTcAxn6YvbW75bX3NMETUVRqNAru+G90hoMcOsHqdL5/dWyNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771164705; c=relaxed/simple;
	bh=IS67sc4Ha9dtdSU+DoGA1J2xownlpl0HA1i2nBo07Do=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iDjjHvQmYFvFr8ZYwZYfWrC9wwbTkzfmj5Gc7ppEcUGc6HbUPG0KrXfmJlIigFcJ5WoPnk5rDZxWPOUPo1EkiFHq/INf0EG1TcfFp9u02rqTuzv4PHlrwPw+5+x9Fv/ImzEa++OoK7d2lfOiIonZ1NB/f4a1SBrMa3FX2hoP7SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9/3Ddxt; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9/3Ddxt"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba716126f5so125991eec.3
        for <driver-core@lists.linux.dev>; Sun, 15 Feb 2026 06:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771164704; cv=none;
        d=google.com; s=arc-20240605;
        b=AxraoJizgOob4ThYO5kWB1PZFPOLEbFSWZBJJrvKpGCTJm26oOCohng957onBTeNZq
         cXASM7yNwvJvzO3jOSMw+QNkQz3ii1PJChovky+fq8uYFPqKLNonfX9sBYitVgY9c+2j
         E1QLQDjgRLBTZ9djMXysALNnxtbaIKeuwGQZUeClyD/4EpaoLIEMIhv7C2ZBft4IrhqL
         i9yquvg92s4HByH88B4VFnyenZIYdnZZ5yVsVVGzW/xV+i9nB1RyN5bZA+WMt6rjhhCU
         T6JmFeKqq+WZNVatcQJaRC7Xdy59XIAfl3gA7OtmAdzJfO16PQe7Mp3StPnatJcRjck/
         i+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lmAu+Za+Ffpbk5WZHW0bF6Gwlmx16jAYsYG2pCm96Tk=;
        fh=xLVn4uctQcxWTUGCJ8DcqzOzDQkKtO4ZEWMWLD+KsU0=;
        b=MEPAFF2mE4wODyZ3zofVWkDO/miusAmI2c+MBwKiR9eJYRTf+P3uIqtno17bD7dg4c
         DZUGUz92Ggzw75ddcUPGT1/AlRU9KS3UPbhsU7AEaz89s3B87JYe3GNtc6Pzr6sKldcj
         V/kE0rACguv+/aWeWcDnyCa0fDsTjOROnkkFoYltuoZmKD51O4FKTeK4Cyp8hpko97Ag
         qqbZYTAlkVYPg3q56qozmhL75uQ+1AiPL49emn41k03F3d03xKElMoG5FvA/vHa5iblz
         sDBIJPfjqbcadntnwOur9rb+ALRPywEDOvArKscCAyLXkstpmHxNOOkD6UTcCSgvzO8r
         gHxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771164704; x=1771769504; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lmAu+Za+Ffpbk5WZHW0bF6Gwlmx16jAYsYG2pCm96Tk=;
        b=l9/3DdxtAnO3mup6q7POjILB/j7ArT7q7cp6MWyxNC3CnpTdoUmm4HVi9d+uImm5l+
         5f2UINJNUyg9INBGnkbAshl0Kph3QzER9hyretYYKTg6upZTj16edMCWkPjNmKO7IC1U
         amhRj81hGI1p1Fw5vozN6QXaTj2qgyZFsdTUgJs2edyCQwn8F/FwPe9iZktR2abP3Ls9
         DKfHd5NFFUlro2OaYYOeN60MP/5Ozj93XlraCN12kn3ZCs2rvlPVMM+wPSQp+BpIF3Ej
         zLo30criTuSSsip0cfVimIozLROh/c+i4Bg8Zdpo8R2h+xjKYOdhYEfJG23upEFHhO/t
         Y85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771164704; x=1771769504;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmAu+Za+Ffpbk5WZHW0bF6Gwlmx16jAYsYG2pCm96Tk=;
        b=HAgHhMO1ykcc1ZyTOXWZprFsqKzlAJTdMbaGzrtJZYN3+zqnJCGxQ6KFBzwwtIV4tH
         TKptuPFxJS61P7TZK7ePTuklYWBN1N2vWGciElwdC+oX19KFrNNsc5ivwWrCoM/K9nx0
         85EiwvoXJP0aONRBABbZIp95XVxUBcrhrp7nZEDS8INhZcID+p8HJPIfzLKMVYNbe49k
         ea8c1qLrbSLSgeIljtvh8P472d8N5dRsgfksUTNJjunTR1jJ+A6MrtHoxaQ9B20gpjjv
         x1Z4yeJDUWwb596ULebEr6IY6untKv7DUoMG4e8Uba/3mYi99yP8LlCdpVs3MftzkPnF
         X1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVgtv9pNg7iSZPOg840l4w0HaAwBSTuSRutY2UMIQA4k2VluP5Yu1vrB7g4wMYnaxUlTw22pDp6dUbrdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmXLTW4LJVw+qepVnXNG7h9e6mY0D/b0sgYXkHnQL76MKaZhSp
	J9CYQhIQkUfSXQHrOeuXlZYoz/QA/YGZK/8DPjhQZ6qb/mbZrHfwDgSsqiwJ9ISH4AF0RxZLEyr
	6zrfh/Q49T+HWp5O5vhkhKF+W0l2JWBk=
X-Gm-Gg: AZuq6aIoSF7WwS6nuri/c4NDGwj5QrqKIUFcyia3o6nIjoFc+2JUVQiT29hjDqlQWXi
	kXCkaWHgZ4tR9nNtOg/c+yXEVpcjvN1wjMaH1ynjCqmdwxR3o0/bu/Jei/xKQrS+Vu6amBPIAnj
	u12L2PAhD8JlWWnhlCOHXqm7BPF7KfHAq6XFAhsmuHCC/P9q7iXJrYnLkCl5u8/98jgVoDbDWsw
	BZfXND9cbIRc0VJBdAUF4DDGXcO9IP4SYFq6StV/x3++wzbc4F9XLadzqVx7LJvKmnlqf8FL9X+
	49P4UFfJijKHi7yAok0Hm8aP9xWNj1Z/b3rOydyNjkC5w2N0LKPQB+7ckUA6mV0vPiBjzgABxsO
	GsUErHQvt2j8V/r2HY3cjuMKV
X-Received: by 2002:a05:7300:bc0e:b0:2ba:b16f:8092 with SMTP id
 5a478bee46e88-2bab9ec5ef6mr1638797eec.0.1771164703649; Sun, 15 Feb 2026
 06:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 15:11:31 +0100
X-Gm-Features: AaiRm51kWsntpYAMki_wBOn4FdlRNmJALQ-XrmQQ5z16DZEm77O5QapQ1SrWrNI
Message-ID: <CANiq72n3qPsoy2u1KxfyV4ZCjJyDZLkK-54i7EesTH=TE9h1jw@mail.gmail.com>
Subject: Consider backporting rustdoc fixes for 6.18.y
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	David Gow <davidgow@google.com>
Cc: stable@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg, Sasha, David,

I have been seeing these warnings (errors with `WERROR=y`) in stable
6.18 UML + Rust on the `rustdoc` target [1].

Unless David (who works around UML + Rust) or the different
maintainers (Cc'd) have a concern, please consider backporting:

  a9a42f0754b6 ("rust: device: fix broken intra-doc links")
  32cb3840386f ("rust: dma: fix broken intra-doc links")
  4c9f6a782f60 ("rust: driver: fix broken intra-doc links to example
driver types")

They had Fixes tags, but not Cc: stable tags.

I hope that helps & thanks!

Cheers,
Miguel

[1]

    error: unresolved link to `kernel::pci::Device`
       --> rust/kernel/device.rs:158:22
        |
    158 | /// [`pci::Device`]: kernel::pci::Device
        |                      ^^^^^^^^^^^^^^^^^^^ no item named `pci`
in module `kernel`
        |
        = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
        = help: to override `-D warnings` add
`#[allow(rustdoc::broken_intra_doc_links)]`

    error: unresolved link to `::kernel::pci::Device`
      --> rust/kernel/dma.rs:29:70
       |
    29 | /// where the underlying bus is DMA capable, such as
[`pci::Device`](::kernel::pci::Device) or
       |
       ^^^^^^^^^^^^^^^^^^^^^ no item named `pci` in module `kernel`

    error: unresolved link to `kernel::auxiliary::Driver`
      --> rust/kernel/driver.rs:82:28
       |
    82 | //! [`auxiliary::Driver`]: kernel::auxiliary::Driver
       |                            ^^^^^^^^^^^^^^^^^^^^^^^^^ no item
named `auxiliary` in module `kernel`

    error: unresolved link to `kernel::pci::Driver`
      --> rust/kernel/driver.rs:90:22
       |
    90 | //! [`pci::Driver`]: kernel::pci::Driver
       |                      ^^^^^^^^^^^^^^^^^^^ no item named `pci`
in module `kernel`
