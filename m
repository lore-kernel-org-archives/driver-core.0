Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD264252AB
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441361; cv=none; b=MLtCecDL/0QG0e74DY9/vwp871nhw93CPQeA98YLmfTxjMHVozc4h4Z+cpe/dOF8Se7lYuIipzSHfL1oZ/2JEsY+Mw0lXYI/0QSO0JQTrWbOLOAw7o1b638+EoX/Fv+CbuDYnGuSRYdGELsY+QJLabUyyt2p3bt2lTVIwLkuRbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441361; c=relaxed/simple;
	bh=3GtPDBtfDSI5Fg2TNJcbEvcKP7Jiow8UZdpWvMuWxk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hei479FEyzbE512ODOAfMx4Q32VNQ5/fG0l7+LRkrjkqUvrcgk2sfkrxt8/5jr/NACKWSsrMfd8Mrg3JwdGFKHcMUywe8Rb4oYmIZUv0LnQl4cD2AbXTPhKPcr8ralB/NrZuaNJrZfhraBSG1bDNZBRZQUfrw7Mkh43VEx9TBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=IBuZoK47; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="IBuZoK47"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f904e80eeso2267598f8f.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1786441358; x=1787046158; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDbf3rFmEbyUidca3UBZclD6tLiyKIeDuCnP/rYnFg0=;
        b=IBuZoK47exi3mnQ/BowxjRD/cWDwXCMeaL2mEBeO7/jszY1JmhRAC7u3tHL7zMKOrs
         hnnGhCE+x1dbiMsqWNCE4J/qqn7q1XhuEqnCIYf+jxkS+Duol3Xx3w3d7pz8wVWdgnSw
         BLpPd08PC63YC8+7CUHa/VCUryr8WYgDSNvx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441358; x=1787046158;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vDbf3rFmEbyUidca3UBZclD6tLiyKIeDuCnP/rYnFg0=;
        b=iYwW1zcaKdYOMgtBxpTsbEG4kUEm+rqG8J9f04KN7LG5CvdrhoLRiDb8IS47549sAR
         02exsDZLsomQCmykKSC8f9iABotGdUyEKC7AHv2K+2JapjLz1Ka7pv03Kz4BQ8hfo0Vr
         L9feRg2YIhycOJy/txkumSj2CgjU0RWPYUvTecJHgOOv2iS9M54hEI/vML1vvifohFPe
         +bFBA3/0TI1E8jbENyMuMcp4qa4Q9Aqfoo9xMUhe/BUsOeGm5XwUdyjshkDtkbFbwSq8
         VVXnA0L1OvwHU1ecNoVbPv/ohfFj1ZWNwGNvdA3Pdt+mMUFsso8pm15UGN4z9ABctv7u
         bcQg==
X-Forwarded-Encrypted: i=1; AHgh+RpL2ygxe7bYfVjfxLUMcnvmjq3sinao8yEW4g6cgYivHbtWKrs3Euyqnm2fpwWFAlUYH9ng+wbzfTYNzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyuu2g6lDivGU9UseHtelbZxojedG2iZH8gx4grN6qbhkbMz3Wl
	zlPOCliqOTYq60iOT06QocXYbkTP0ahi/1H7Ddi5Ylv3AiLlIoqvR1/ZxR4qN8xO8CY=
X-Gm-Gg: AR+sD103Tvby+gpPce1XzXDQFbPVJo5w13GCw9lyAWOcpJJdStZJRj62F92JZAW4tkl
	YHzCgd8WWNYBF45Qq+MP5P5Y70/t1cVXXgmaJvzRn3owG0SobJEAxrK6HS1BQS1kEsXgJTYpHyf
	Py/wnGrJ99jFgy5I5h8HbLdIxkmGhOnjdOMiHjwh6pWisvmaUrgBqi0+sgK/z+yfnFFj0mbSezG
	j6KBjrw6CDYoRhY9XVIUrNqNBUEk8bJ+CD8iw37pSnP1ylLkdQ2Cv5V86cu4cc05XwKrADfgPBl
	6tn9TepvAAbgDx3nnDXAMUPYSt5b9FoOd7zvs0MbJhwuw3pLBwPDD8AGpF6m9dHkroAww2rIPQZ
	Qrk4oSjFI+MfCUjl8+hbM1NLC+jzltjqzglcwvd5/Es6tKnp0rBWECMBZg49mgdmtSv1B+2IazF
	g1JYGYB53kBEziodWZfPPecABRLoGACvC4bmqFsRDmyaaBWPCAzf/4gMPfw05J//7ZxLhdb1hJp
	2Mf4whXqZYVJ1ts7Drz9BmGBOWqxcZDWV/XWw==
X-Received: by 2002:a05:6000:1449:b0:47f:fa17:ae0e with SMTP id ffacd0b85a97d-4814ad8a600mr2615990f8f.11.1786441358189;
        Tue, 11 Aug 2026 02:42:38 -0700 (PDT)
Received: from [10.0.36.57] ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a709624sm3388917f8f.22.2026.08.11.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:42:37 -0700 (PDT)
From: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Subject: [PATCH RFC v2 0/4] rust: usb: abstractions towards the port of
 usbsevseg.c to Rust
Date: Tue, 11 Aug 2026 12:42:27 +0300
Message-Id: <20260811-rust-usb_control_msg-v2-0-ef79c92bd898@wyliodrin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQqDMBBFryKzbkqSRpGuCoUeoNsi0sSpDmhSJ
 mor4t0bPECX73/++ytEZMII52wFxpkiBZ9AHzJw3dO3KKhJDFrqQpZSCZ7iKKZoaxf8yKGvh9g
 KxJNBKbUtVQlp+mZ80XfXPuB+u0KVwo7iGHjZr2a1V/+tsxJSFHlurTHG5tpdPktPoWHyRxcGq
 LZt+wFLAZY3wQAAAA==
X-Change-ID: 20260801-rust-usb_control_msg-ee34e002b818
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: b4 0.14.3

My end goal is to port the usbsevseg.c USB driver to Rust. That driver is
small enough to make a useful first target; the remaining piece it
needs is sysfs attribute support for USB devices, which I plan to send
separately.

Porting the driver requires:
- retrieving endpoints and sending control messages API (this series)
- enabling sysfs attributes API for USB devices (future patch)

These patches add the USB and sysfs abstractions needed to port
drivers/usb/misc/usbsevseg.c to Rust: retrieving an interface's
endpoints, and sending and receiving control messages.

Patch 1 adds `AlternateEndpoint`, along with `AlternateSetting`
and the accessors needed to reach one. Patch 2 adds the
control transfer methods and the `Request` type describing a setup packet.
Patch 3 adds the sysfs abstractions. Patch 4 adds the sysfs abstractions
to `usb::Driver`.

The part I would most like feedback on is the typestate design in patch
1. `HostEndpoint` is generic over a direction and a transfer type, both
sealed 1-ZST markers, so a function can require e.g.
`&HostEndpoint<In, Bulk>` and skip checking the descriptor itself. Control
endpoints get a `Bidirectional` marker rather than a direction, since
bit 7 of bEndpointAddress is ignored for them. I am not sure whether
this earns its complexity for the drivers we expect, or whether plain
run-time check would be better.

Only `as_control()`, `as_in()` and `as_out()` are implemented so far;
`as_bulk()`, `as_interrupt()` and `as_isochronous()` are skiped for now 
as no current user needs them.

I am not sure about the soundness of the sysfs absgtractions, especially
the lifetime annotations of `DEVICE_GROUPS`.
Feedback for this would be greatly appreciated.

Signed-off-by: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
---
Changes in v2:
- add sysfs abstractions
- add DEVICE_GROUPS abstractions to usb::Driver using sysfs
- rename the `control_` methods correctly
- use `Duration` instead of `i32` for control functions timeout
- fix control function 0 value timeout from "for ever" to `USB_MAX_SYNCHRONOUS_TIMEOUT` 
- add `#[inline]` to short functions
- use `u16::from_le` to read `wMaxPacketSize`
- rename `Generic` generic type to `Dir`
- impl `max_nak_rate` for `HostEndpoint<Bidirectional, Control>`
- make data `&mut [u8]` for `control_message_receive`
- Link to v1: https://lore.kernel.org/r/20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com

---
Alexandru Radovici (4):
      rust: usb: add endpoint abstraction
      rust: usb: add control message send and receive
      rust: sysfs: add abstractions for device attributes
      rust: usb: allow drivers to expose sysfs attributes

 rust/kernel/device.rs           |   2 +-
 rust/kernel/lib.rs              |   2 +
 rust/kernel/sysfs.rs            | 602 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/usb.rs              | 227 ++++++++++++++-
 rust/kernel/usb/control.rs      | 367 ++++++++++++++++++++++++
 rust/kernel/usb/endpoint.rs     | 516 ++++++++++++++++++++++++++++++++++
 samples/rust/rust_driver_usb.rs |  14 +
 7 files changed, 1725 insertions(+), 5 deletions(-)
---
base-commit: 8ba098e6b6ff0db8edf28528d1552be261af30d4
change-id: 20260801-rust-usb_control_msg-ee34e002b818

Best regards,
-- 
Alexandru Radovici <alexandru.radovici@wyliodrin.com>

