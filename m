Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4D4DD3C7
	for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165714; cv=none; b=XknQjSeRGSmZ4iQjcwO8gg3jS/uVkn4eA5vk6cPXcrpzp2GjFW8QBwfDO5UO+4ZU8ih15H/fTB9vEH5P+P28mMdFzt20vCHVg+pFCvwSlYJvvwHyUt+VOpQ/ZwIWoWconGPjaDlFf9YvtGlm0GXMkPHemqxbO3JzRaVvT6mBY1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165714; c=relaxed/simple;
	bh=V1jRKmCQFL7EqhgtKwrUFCiu8eMFT9qwVk/G17OwXZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Np5DJxn1RnK5WycVra5ZqCi+h+pH4avFWsZ7H+3i/TMyElUK+zvQ79w3saMon1mkPWBzcZDlEWOQlSLp6GKWXGmtpqznJjoV2B10yDoFa30ha0srVy5CiYnJ33xm8d22jjcFDWGhQGHBB23HWyhKY2ZhQivAgKgwi95860i+mLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joLbK9W1; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joLbK9W1"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0d63f60bcso442407b3.3
        for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 08:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165708; x=1792770508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Ear117DJjn2hMVG10i+yEJqY+WZsqWtPeHsEomSMN0=;
        b=joLbK9W1IhiLEmYBYkgk1Qhve5xIVhsmphsgTZ2li6Cr3hZW17Qi1MXWDmCPbYNAia
         O4INTNMda1ORmyARdKYxnf50l9Jar5mDtiRRT9+Jkxc/0iHKqmRjeD34L+zO2rEQMUUI
         jzNnsWQOdSbk1by6RHGGUgjFKY53kZzxuHZlo+Ds6Dn50Kr2xZv5gHz1ikGwP50vHgse
         Nxl5SrvFDIygj8tmHkagacicI9qLxp+YSluF/nZ/Zkrtw5OuYAOHFZhaiZR2fan8Lt+8
         wchcllcPXCQkfA0iSp3FL5A1pSKH+Qus5S0hg3XwuoG7i/momXJrzUBGcHsDZbly852Y
         9P4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165708; x=1792770508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Ear117DJjn2hMVG10i+yEJqY+WZsqWtPeHsEomSMN0=;
        b=YOhBQ20VBRyMhdlrCAwd93i6vzav5gIvZ9QUY0FOx5Mj+u8twP1mBrh/z6Gj0UmZW/
         WjKov4c1m36OdWjfMrvSiOXfE7V0QXcE4onMqamaAPDOKkOQsvwLNFggq29q8rGyGT0T
         RQaBSTrAV0FDPp3Lm9UkY2OKT6SMGqZ966mqplfRxTLMufNsXvBfZ6hSWTPhlgBFs3DC
         VnFcNBgpbueZmRrXTiqNbctHgffZiVC5LXT9gB+/uS6VEsuh7DIygbGl+ak4IlyDLerR
         wElMCyRBQXqKW74M0fFb2AJDS3cozfGPbV5imeekPlNadpHnK/tckSugk/RHXTjk9rI3
         VinQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN0ChR3V1PqQmBmjkh2r8rgBCXA8m8D20RyEPIo88/FF9WVXomTlJNPEzf1q7alPzvbD+ObFHblaVAPQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJYibUYAEEYnKUSEsCQ2YMoIgEZg8IUkCiIR2s548pXMHgWKOfM
	9NcXBAOWGGqA7qkRCJlzMzCu3bQQXh5IdElyUQ4eKL8TyGiIoqWLRHCP
X-Gm-Gg: AYBFou0NyLpwJfmqUQfuB02VdhKGqLdUdd9P90MH3OlBwNBCQobuMh8ogLdB31wbbRT
	OzferjnOu6+XW/ZLrPKz1UaccjIDRfpdmU7pea0r7RiutJJXnStzOqs5L/i8vxeQbqtxE8MdxJR
	U/DIr/cZMrTgKVZgsKc4QH80xFhlOstgZqfHstl7yWm1w4zUUBf2T6y/h385A8JRmGxkWJDucbc
	voVvo35BjQFduRPWOaCKpI4as5xvwoY8qxNuVy0hCTo03BZ3eDCnxXHXZ0cCi151fJmX0lRC9YB
	Hu1mVKQuQy0E67XsNfXR5NjE8K7gcvopc3S4QVkfjMnw1uy38x0RfRnv1YoRJ9ZzO+mpkiKJXbQ
	pxjyfjKAx2+WIOa+lPVP8DfiDyKAtAUaaaYIBR/ZGrzqxQdVm6vyR3tt1k7WZ4jAOevC4DxrcKL
	qgaDkmlRlWpxvXZRPttT9HGBKIR6bSP4gnOtf1CYh/lyvzNXw0dtZRsjEqiFFTzztuOrhFatqMQ
	gd4A2ovNsFHYZ/UNuyHVCjB35jCX5lVX0alVOk=
X-Received: by 2002:a05:690c:581:b0:8b0:ab62:c636 with SMTP id 00721157ae682-8b0f21e9dc9mr1812167b3.45.1792165708302;
        Fri, 16 Oct 2026 08:48:28 -0700 (PDT)
Received: from localhost.localdomain ([180.243.241.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e593c65bsm10882167b3.38.2026.10.16.08.48.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 08:48:27 -0700 (PDT)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Brandon StJohn <branstj@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
Date: Fri, 16 Oct 2026 22:48:15 +0700
Message-ID: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust driver for the ams AS5600 12-bit magnetic rotary position
sensor.

The series adds generic fallible I/O support, SMBus access, a minimal
read-only Rust IIO abstraction, and the AS5600 driver. The driver exposes
raw angle and scale through IIO sysfs.

Reviews of the lifetime, concurrency, and teardown contracts in the Rust
I2C and IIO abstractions would be especially helpful. Danilo and Igor, if
you have time, I would appreciate your help reviewing those parts.

The Region-based view models byte-addressed registers and is not a
general model for command-indexed 16-bit registers. The standalone
word-read helpers accept any SMBus command byte.

The current interface is intentionally limited while a Rust regmap
abstraction is unavailable. Feedback on whether this is an appropriate
interim approach, or whether the work should wait for regmap, would be
appreciated.

This series is based on commit 3fadfb9362cf
("rust: firmware: avoid UB in example by passing parameter"), which
contains Gary Guo's io_projection-v6 infrastructure. It also depends on
rust-next commit b93fb6e76ec1
("rust: error: add remaining error codes") for ENODATA; that commit is
not included in this series.

Previous version:

  https://lore.kernel.org/linux-iio/20260822062725.60519-1-muchamadcoirulanwar@gmail.com/

Changes since RFC v5:

- Split FallibleIoCapable and the generic fallible try_* routing into a
  prerequisite patch.
- Require CONFIG_I2C=y because kernel::i2c is currently exported only
  when I2C is built in.
- Keep a bound parent borrow in the unregistered IIO builder and transfer
  registration ownership to parent devres.
- Derive the bound I2C client from the parent during read_raw instead of
  storing an ARef<I2cClient<Bound>> in the driver.
- Make IioDriver unsafe and document the validity requirements for raw
  channel specifications and the unsupported channel features.
- Reject operating modes other than INDIO_DIRECT_MODE.
- Use the external error-code dependency for ENODATA instead of adding
  the error code in this series.
- Clarify the writable-storage contract for read_raw output pointers.
- Replace the stale datasheet URL with the stable document identifier.

---

Testing:

Built for ARM with Rust enabled, I2C built in, and AS5600 built as a
module. Tested on a BeagleBone Black with an AS5600 on i2c-2 at 0x36,
running kernel 7.2.0-rc1-as5600-debug+.

Raw angle and scale reads passed with the magnet detected. With the
magnet-detected bit clear, 10 consecutive reads returned ENODATA. I2C
transport errors were propagated during a physical bus disconnect, and
reads recovered after reconnection.

Concurrency testing used 10 parallel readers and repeated reads during
20 bind/unbind cycles. Lifecycle testing covered 50 bind/unbind cycles,
50 module load/unload cycles, module removal during active reads, module
removal with an open sysfs file descriptor, and module removal while the
I2C bus was in an error state.

KFENCE, UBSAN, lockdep, and kmemleak reported no issues. KASAN was not
enabled because 32-bit ARM currently selects HAVE_RUST only when KASAN
is disabled.

Muchamad Coirul Anwar (4):
  rust: io: add FallibleIoCapable
  i2c: rust: implement SMBus access via IoBackend
  rust: add minimal IIO subsystem abstractions
  iio: position: add Rust driver for ams AS5600

 drivers/iio/position/Kconfig    |  11 +
 drivers/iio/position/Makefile   |   1 +
 drivers/iio/position/as5600.rs  | 177 ++++++++++++
 include/linux/iio/iio.h         |   6 +-
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/bits.rs             |  29 ++
 rust/kernel/i2c.rs              | 248 +++++++++++++++++
 rust/kernel/iio.rs              | 480 ++++++++++++++++++++++++++++++++
 rust/kernel/io.rs               |  66 +++--
 rust/kernel/lib.rs              |   2 +
 10 files changed, 1000 insertions(+), 22 deletions(-)
 create mode 100644 drivers/iio/position/as5600.rs
 create mode 100644 rust/kernel/iio.rs

-- 
2.50.0
