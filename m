Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239872;
	b=vUWzRfJ+2+NgDfPc2OZ3cWRlBzSakOBK1iXa+F90DcZpHO5SSgKQED2e4iCvJnvjz6uN
	 VO9kmqX+u0KsUvI7r4y5Tj0Miz/GbFRaEhUzaVGvsUtZZC0OulKiNiqblhCpVpXVKtQEx
	 U+IcDsEeMuKfw4IHCTIzQAzh8pOQkYKd68OGxfTnBeSk8+PLtW3gRmpwhUGNEAf34uxeF
	 wbV256/srzIj93SvRPZu8FsCmlDgSzttZ5zIRFp2tdtEMgW2BMNcuFkP6zVB8nvFPq3fK
	 H6yIsdLo674fwqikjW8x7gwZAvOD+GXwIxYEftSaxF5HWPrscJ9IPIqvyR48jrOr3Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KQFKpRV7NATJKFVseA51zGW96GPsJPPL3A6Ir3znGCk=;
	b=KdkK5ok4Yrb5H97vhAHhtMrAdZinS3Mv2Slum1Hlfu/Ap7unk2w6rppmeElN3xwU9rXb
	 utLGDo+dEWqHJIScBwyRK0vAcT5B8UKu495uHxwiP3ocZx+tFxPFoN7UQ4QmPtrgw8ETi
	 cw3EbPZTC0wzXuWgwfbR4OIjGbib4CFLpEymY91W/PltUQwSxIC/Ad+wLjYqsfUkRcXci
	 LVtXrMqUhf+v2p9WXjBf0ScuUBqJ1PBVPJ4TITt7n/FOJ2C6//uNkQxe8f1ILGz59RFWy
	 DDnly9Ni9Ff/vPJfWIXxoPE6gbnM2omcdKlcT/s6TxIWyOw9q/NEiVOOXGBjTEi6sHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRzzW8lw;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52100606A325
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 15:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52100606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tRzzW8lw
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so721210c88.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 07:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239870; x=1794844670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQFKpRV7NATJKFVseA51zGW96GPsJPPL3A6Ir3znGCk=;
        b=tRzzW8lwwdB1d0vTCWe9V5t+cxTgOa7ffa1v+US0VZ9cz3IYv48g4tAvQi8tPJ1Kxa
         frhU0OaJtl9hy5anxdAlHOgsYHJBHY0QZCfn4LeSgBfzEyzagMIYYQYZLNWXuTimo86c
         7RhT/d3AwJQZPJ03Dr+lzHx7tl8BRxZgxFpgYgMpNe4NNaE07fq/NRi0vkcK7U81YSVd
         HK8hGOYaWgDg2OlBUDWFPyhDDPoroprj/I54vmwoZG+23OvYGphU85JoNyUxGq3eQ0Ud
         8D+4eKbLUs0KmhN1BS0SpLGJfJRSFKC48zLnilGMP0WIDsf54SufrRZ4u22/xPMeYHMd
         yjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239870; x=1794844670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQFKpRV7NATJKFVseA51zGW96GPsJPPL3A6Ir3znGCk=;
        b=BMkR/KnCGe/0KzyUPgOb5wYzl9Mvjv/TkuC3hPAyQevx8iCvV9c/u5JuQveNHSCLcr
         NR2NN6G7v+fxbOaSEFXDV0eiRadpVoB5rTqkGWk0cdiwaw+jHsx127DAFqj4X98iOvs9
         YXX/zceS+immjHXG7KsoI2jVbwfS+X4KU5NhW837k4jyYaN9YFy7F5f4j2gAPIXYgKfW
         hgBZmMRUYMCaeWZc3/p9rjJj8a0iPgQR+CK/Jx8cAyAzoinSzHZIzwRGOTyWD3Gg8Ssy
         aHDKY0K0/GF68+TSnIwvYKhqD8QQOhUJTLVqj9a2W+Z2NKtbgzNoq1OOxl6dJaZx4JQL
         Ksqw==
X-Forwarded-Encrypted: i=1; AL+hErEgKaLZwoMWrdt7ffGtLbKg8i9joeS3Naw74+ZmEsKpLTQ5aAs9jw0rR3qMzKk2uLrg5u2r4jAUvhAmEg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sdnqAm5JGRGpl9uyPIgLTN1krrhV0/AkrYwEieHvDQAni/L2q
	7Q98MwQqgMSc/4yeh3umxbvSIvHJ0hL72QCHCEqefPqbR0t9+OF0paP6
X-Gm-Gg: AYBFou3Y3HdpJXQKDnLkAnniCIGtdI03ho4CJ7WB8FuN9pwK3PLhE1iOhXNJlBZqfzv
	OWbxoh38U3iL41ag9IGdzPUasPXJRQKBq9RDHv9a0gAEoWhmM4R5tBA1gqOjt7O9ZazOCtafwBq
	fgIsMd7TxGMBpl/jm6nw+vzCtKuDbc9r64YT54lV0rZYj+EqUylRfc58Bh5vCgzm1qRbm6FDbYc
	EA3tx7HBDo0vBgxLQeM+kl43qAMgDCX/pqwb1V0jo8pra87SCQ1RYNjhp2JguL6PsDb9w+zIcUe
	f5FwJhYoC/fnIb8Lq5/PFOnlhWS/usm28ZZYlS3kGxaBmXJcIqOSzSDMsOf7LCXJqGrzXzxEJ3r
	RwC9Uzgur61UwAOq8k+nDnpQ104pKxZSLbUmWDT22YpmqFvXor65TPm7PqgulVfarRghDGoVcAA
	aOVjQTNyd8uoCdqTRtW+/vnVIGa+zEQHs0kRfqT7C0YpPpOqKWQvxOSjl/g76eYQ+7M4g3Ta7Qs
	j1ST+Fj1Zo1AcwWXoL7ecK77F0xDRkC2NvsNDqEtpEEVLSCvs+tnfcoAkSKVnjF5TGAookrXAZn
	wYJBgo4Aoy3l29YdzqrCY+sgH4rb1qcgS/V5hjV/cwKVzs1IGNLdOgqzLrtZjr9TeZDJTAY=
X-Received: by 2002:a05:701a:c919:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b39fdaf74fmr6537059c88.0.1794239870114;
        Mon, 09 Nov 2026 07:57:50 -0800 (PST)
Received: from localhost.localdomain ([125.166.179.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm13020828c88.13.2026.11.09.07.57.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 07:57:49 -0800 (PST)
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shuai Liu <847807867@qq.com>,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v7 0/4] iio: position: add Rust driver for ams AS5600
Date: Mon,  9 Nov 2026 22:57:39 +0700
Message-ID: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a Rust driver for the ams AS5600 12-bit magnetic rotary
position sensor. It also adds fallible I/O, SMBus access, and the IIO
abstractions needed by the driver. The driver exposes raw angle and scale
through IIO sysfs.

Feedback on the I2C and IIO lifetimes, locking, and device teardown would
be appreciated.

The Region-based view models byte-addressed registers and is not a
general model for command-indexed 16-bit registers. The standalone
word-read helpers accept any SMBus command byte.

The current interface is intentionally limited while a Rust regmap
abstraction is unavailable. Feedback on whether this is an appropriate
interim approach, or whether the work should wait for regmap, would be
appreciated.

Based on Linux v7.3.

Thanks to Igor Korotin for the device ownership and bound-client lifetime
rework used in patches 3 and 4:
https://lore.kernel.org/all/179286358623.55649.5397316745104390556@linux.dev/

Thanks to Shuai Liu for reviewing v6. This version addresses the Clippy
warnings, replaces the ignored SMBus doctest, and moves repeated unsafe
SMBus calls into safe helpers:
https://lore.kernel.org/all/tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com/

---

Previous versions:

  v6: https://lore.kernel.org/linux-iio/20261004130303.65432-1-muchamadcoirulanwar@gmail.com/

Changes since RFC v6:

- Rebase on top of Linux 7.3.0.
- Make register() return Device<T, Registered>, stored in the driver
  data, so the IIO device is unregistered before its private data is freed.
- Remove the bound parent parameter from IioDriver::read_raw(); the driver
  now stores its bound I2C client reference directly.
- Drop the parent lifetime parameter from UnregisteredDevice.
- Use pin_init::raw_try_init() in Device::build_device().
- Document sign conventions for IioVal::IntPlusMicro and
  IioVal::IntPlusNano.
- Add IIO=y and I2C=y dependencies to CONFIG_AS5600.
- Use typed pointer casts and lossless integer conversion to fix Clippy
  diagnostics reported by Shuai Liu.
- Replace the ignored AS5600 doctest with a generic no_run example.
- Move raw SMBus FFI calls and errno conversion into safe bound-client
  methods, as suggested by Shuai Liu.

Testing:

Clippy and debug builds completed for ARM with Rust enabled, I2C built
in, and AS5600 built as a module.

Runtime testing was performed on a BeagleBone Black with an AS5600 on
i2c-2 at 0x36. Raw angle and scale reads worked with the magnet detected,
and reads returned ENODATA when the magnet-detected bit was clear.

I2C errors were propagated when the bus was disconnected, and reads
recovered after reconnection. Concurrent reads were tested with 10
readers, including during 20 unbind/rebind cycles.

Lifecycle testing covered 50 unbind/rebind cycles, 50 module load/unload
cycles, module removal during active reads, module removal with an open
sysfs file descriptor, and module removal while the I2C bus was in an
error state.

KFENCE, UBSAN, lockdep, and kmemleak reported no issues. KASAN was not
enabled because 32-bit ARM selects HAVE_RUST only when KASAN is disabled.

Muchamad Coirul Anwar (4):
  rust: io: add FallibleIoCapable
  i2c: rust: implement SMBus access via IoBackend
  rust: add minimal IIO subsystem abstractions
  iio: position: add Rust driver for ams AS5600

 drivers/iio/position/Kconfig    |  11 +
 drivers/iio/position/Makefile   |   1 +
 drivers/iio/position/as5600.rs  | 186 +++++++++++++
 include/linux/iio/iio.h         |   6 +-
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/bits.rs             |  29 ++
 rust/kernel/i2c.rs              | 235 ++++++++++++++++
 rust/kernel/iio.rs              | 463 ++++++++++++++++++++++++++++++++
 rust/kernel/io.rs               |  62 +++--
 rust/kernel/lib.rs              |   2 +
 10 files changed, 978 insertions(+), 19 deletions(-)
 create mode 100644 drivers/iio/position/as5600.rs
 create mode 100644 rust/kernel/iio.rs

