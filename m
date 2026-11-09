Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239881;
	b=rSzKQTlsCxvzY1ncKvNIdd4ITMAu/cfY8rCoqBZG0zk3+hT4eiYpAjglQrWVD4HdmxM9
	 JkF84Wyd7OD54Oj/8RefkVpx9uFxxD+TjRZ04Gv94wBKOGeO5i1FwyVqEqmWsPE3dIp75
	 eBfVle/w1lXYPPPCU039SpGqbljLkx20bbzccW9FMcx6+CetdLMi65Niq7w8p5w25odsd
	 ZV89lVkfmQbQ0zyJVWlqZqn+w1SFRKlCMi2jIvmu/CIOofu5VzUVDBNi7K9jZx7kqPe8F
	 n6kWwUX3gls9EcFdSokWGzlLBqJCNb0egqUV7O15Pp8cZs4FzuD6vJVLvyUXgymABfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YcUWxm4+i8v6MB/f3qiLFhXyjp5WzDz6iCDXkVjGzug=;
	b=m4CxnjwFiuwbEIjpvPE9HxkqPDZSaHxc9BVF6WptVdiwtpSmJC8ha8Qog3W+AXh1p94T
	 va4XE95n8l562ciTPgTQd9OcPLHPNl0iWyiT77Dri1MW/7OeII+FSsdMr8VM3//gGGVTF
	 q83j4H17wTWOdo7ixWXfRMnHxp2lfYZOUUCo6kILqRgeyW4seWR/I8BGHEKynwf1Ipw0n
	 gFzw3RDq+Y1jN/tIFzrJflK15pGVn6JbtBe1XB7r+DGQbZaDDqo48W6UphCBusda8sE3Z
	 e39KYqqbWUg6XvTWA3zqhV1b84WlyQpGVhU8Zx8UodecdtksydKg0GFSw/9p6btjjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T18YkIJ8;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0914C606EE8D
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 15:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0914C606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T18YkIJ8
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so328376c88.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 07:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239880; x=1794844680; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YcUWxm4+i8v6MB/f3qiLFhXyjp5WzDz6iCDXkVjGzug=;
        b=T18YkIJ8odjBYNSTxDPfLFqfwx+GOv3kb+QM3LPB86WhC0jnBni5jHzmJSgYxSK0yT
         gy5HFmArOSlclypNyEajJ1vOMfdVSwUpMXL1RN0VOjssO6AL4rzxAMgHTIWDDNpkIOa4
         8p7+TGjCDkPgL2tKU59A4bs7B8LFzCsXdRGUmzqYM8b1T0VX5lSrZhzf7gAUA7jxuXew
         SK7MuftzyQ3G7Y35eInRFu+xL8kV7JTSaoF/hsCVb/MeDy4P9/lhqAOsNdpjT0RVlL+B
         e2C5LpRxY2kYMdH63S3Z5elTwZ0WU6OJoxkhYFcZ0kFf58r+K4NhHVuoCyhYJu12F5ix
         mCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239880; x=1794844680;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcUWxm4+i8v6MB/f3qiLFhXyjp5WzDz6iCDXkVjGzug=;
        b=rA9tvPPQdhIf+BOsymRM8QFiL7/clq+JJ+loUAxIowx1JsMmDwGUKK57guyBJ9o2qX
         vvDXhOXaYDyGkIKYZ3SH6z3IKf9B3g5LT1Lzi/Oj1bple9TAkg3bBI4CvTZ/BdTxtysF
         vGxxldHY85QwxSvO4t107NCTrWh7Fi7mbqPcVZE4s2kLcnzVH9g8cXZfhiAzx9Pm6Zac
         orDcDeBS4OdiCNeFBuZqKqbVPGjcMrl8fGHSOGYG1cRUtyisky4rk4vV7iTgdgErRPHy
         FUD/mSUxtxES4uFQJrt7Qmw1lWQiW5wICrbwtP1RrgCugEbhG1kP115sXwY9UZpC+2rV
         uDjg==
X-Forwarded-Encrypted: i=1; AL+hErFjkDhu22cr2dr4rDjAZIrO44e1tICHVYsJ+FS9YSWhk4HAaqpMZAtcPhIirysCrKMu1WGyVccnCnK/xA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8DKDNHGN2G1+0sIeDIAgGdAhdfhoLiCKs+nngjqxDuBw8KeaoT
	P5aFeIeapePtNYt6H42sZ6YF1TmpcuIAgCYuLC/GEdLsuTABtdJdGRA+
X-Gm-Gg: AYBFou0QeKNz726VYPA2lzE+vbhqDatz5Fd0HrHCq5m4sUP5SjtVj15h5pynSWlLJId
	fhxDTpC5NsnAXf3SbzH2fcAEGBt9fHR4JqG/voiXlZC4cKWyHGhv3XO4cUI1/ob6vb8+vBdfbTz
	kQHyO6p2cQ3k8ZrP+osLIP6FuApw0apUgyzNhxY17Se7eLHyL4vQOwr7TWN3I0l8nIr2cw/qMKa
	t3asBPzy6OwGi+BmO5a/V1/q2rJc/QVmNMMVh/twp+uRpOcew+o7KbqT3kczA5y1/1uKVKBQ7mD
	Zq4nQuSMfOdlblu844lzz19Vvb2X+qqsVLHNQB4MitQzlUNe8HOYCo9AAWyO7yBgeYH8PVxzTIC
	Codr0UESKXelPXJmsJNksM/K3KoSWub34vDsnM0ZmzMiV7MfQyZvt+4QV+ITmGhQziUXP/GHZND
	aVGolBoG67fes+NykZggNF7JCeiGpi66sluwHv/r+UoE5rneJ+ZbOjSVmvapLiiZIm4/W+su+mw
	tc7XnpxR7BM65PGHpoac62XpHDxIn+jwhlGXkMcYv0WYICDJiW5epWQVfafExOYW6k4V5H749lu
	r6huilHYTxxvpSQ7s1dnnFfZfYOty8/znAJZQupXCSW6e1YMzBahAfeZG9k9nCcYft+HTFxsPxp
	IzHXBxanbscoeiUX+
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr6035678c88.10.1794239879928;
        Mon, 09 Nov 2026 07:57:59 -0800 (PST)
Received: from localhost.localdomain ([125.166.179.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm13020828c88.13.2026.11.09.07.57.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 07:57:59 -0800 (PST)
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
Subject: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
Date: Mon,  9 Nov 2026 22:57:41 +0700
Message-ID: <20261109155743.83740-3-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement fallible SMBus byte and word access for bound I2C clients
using the generic I/O backend infrastructure.

I2C transactions may fail due to NACK, arbitration loss, or timeout, so
use FallibleIoCapable rather than the infallible IoCapable interface.
Propagate errors returned by the I2C core to callers.

Provide smbus_io() for byte-addressed register access and standalone
word helpers for layouts not represented by the Region-based view.
Also provide smbus_read_word_swapped() for devices that transmit the
high byte of a multi-byte value first.

Restrict these operations to I2cClient<Bound> so bus I/O is only available
while the client remains bound.

Keep the raw SMBus FFI calls and errno conversion in safe bound-client
methods. Include a generic no_run example for the word-read helper.

Suggested-by: Shuai Liu <847807867@qq.com>
Link: https://lore.kernel.org/all/tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com/
Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/i2c.rs | 235 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 0487bae811fb..6f63bb8c6f93 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -14,8 +14,15 @@
     devres::Devres,
     driver,
     error::*,
+    io::{
+        FallibleIoCapable,
+        IoBackend,
+        IoBase,
+        Region, //
+    },
     of,
     prelude::*,
+    ptr::KnownSize,
     sync::aref::{
         ARef,
         AlwaysRefCounted, //
@@ -594,3 +601,231 @@ unsafe impl Send for Registration {}
 // SAFETY: `Registration` offers no interior mutability (no mutation through &self
 // and no mutable access is exposed)
 unsafe impl Sync for Registration {}
+
+/// I/O backend for SMBus register access via I2C.
+///
+/// This backend implements only [`FallibleIoCapable`] and not
+/// [`crate::io::IoCapable`], because I2C/SMBus transactions can fail
+/// regardless of address validity. The infallible [`crate::io::Io::read`],
+/// [`crate::io::Io::write`], and [`crate::io::Io::update`] methods are
+/// therefore unavailable for this backend.
+pub struct I2cBackend;
+
+/// An SMBus view associated with a bound I2C client.
+///
+/// The pointer encodes a command offset and is never dereferenced as
+/// memory. Its type and, for dynamically sized targets, metadata describe
+/// the extent of the view.
+///
+/// # Invariants
+///
+/// The view is derived from the client's SMBus command region.
+/// Projections preserve the bounds of the source view.
+/// `client` remains valid and bound for the lifetime of the view.
+pub struct I2cView<'a, T: ?Sized> {
+    client: &'a I2cClient<device::Bound>,
+    ptr: *mut T,
+}
+
+impl<T: ?Sized> Copy for I2cView<'_, T> {}
+
+impl<T: ?Sized> Clone for I2cView<'_, T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl IoBackend for I2cBackend {
+    type View<'a, T: ?Sized + KnownSize> = I2cView<'a, T>;
+
+    #[inline]
+    fn as_ptr<'a, T: ?Sized + KnownSize>(view: Self::View<'a, T>) -> *mut T {
+        view.ptr
+    }
+
+    #[inline]
+    unsafe fn project_view<'a, T: ?Sized + KnownSize, U: ?Sized + KnownSize>(
+        view: Self::View<'a, T>,
+        ptr: *mut U,
+    ) -> Self::View<'a, U> {
+        // INVARIANT: Per safety requirement.
+        I2cView {
+            client: view.client,
+            ptr,
+        }
+    }
+}
+
+impl FallibleIoCapable<u8> for I2cBackend {
+    #[inline]
+    fn io_try_read<'a>(view: I2cView<'a, u8>) -> Result<u8> {
+        // `io_view()` ensures `offset + 1 <= 256`, so `addr()` is at most 255;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+        view.client.smbus_read_byte(reg)
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u8>, value: u8) -> Result {
+        // `io_view()` ensures `offset + 1 <= 256`, so `addr()` is at most 255;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+        view.client.smbus_write_byte(reg, value)
+    }
+}
+
+/// The `Region<256>` view is byte-addressed. Consequently, its generic
+/// 16-bit operations reject odd command bytes and command byte `0xFF`.
+/// Devices whose command bytes each select an independent 16-bit register
+/// should use [`I2cClient::smbus_read_word`] or
+/// [`I2cClient::smbus_read_word_swapped`] directly.
+impl FallibleIoCapable<u16> for I2cBackend {
+    #[inline]
+    fn io_try_read<'a>(view: I2cView<'a, u16>) -> Result<u16> {
+        // `io_view()` ensures `offset + 2 <= 256`, so `addr()` is at most 254;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+        view.client.smbus_read_word(reg)
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u16>, value: u16) -> Result {
+        // `io_view()` ensures `offset + 2 <= 256`, so `addr()` is at most 254;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+        view.client.smbus_write_word(reg, value)
+    }
+}
+
+impl<'a, T: ?Sized + KnownSize> IoBase<'a> for I2cView<'a, T> {
+    type Backend = I2cBackend;
+    type Target = T;
+
+    #[inline]
+    fn as_view(self) -> I2cView<'a, T> {
+        self
+    }
+}
+
+// SAFETY: The bound client borrow remains valid when the view is moved
+// between threads. The view exposes only SMBus transactions, which use
+// the I2C core's bus locking, and pointer projections that never
+// dereference the encoded address as memory. `T: Sync` preserves the
+// shared-view restriction.
+unsafe impl<T: ?Sized + Sync> Send for I2cView<'_, T> {}
+
+// SAFETY: Sharing a view permits concurrent SMBus transactions, which
+// use the I2C core's bus locking. The bound client remains valid for
+// the view's lifetime, and the encoded pointer is never dereferenced
+// as memory. `T: Sync` preserves the shared-view restriction.
+unsafe impl<T: ?Sized + Sync> Sync for I2cView<'_, T> {}
+
+impl I2cClient<device::Bound> {
+    /// Returns an I/O handle for SMBus register access on this I2C client.
+    ///
+    /// The returned handle provides fallible read and write methods for the
+    /// SMBus command byte range (0x00–0xFF). A command byte is a data byte which
+    /// often selects a register on the device. The 7-bit device address is handled
+    /// separately by the I2C core.
+    ///
+    /// [`crate::io::Io::try_read16`] and
+    /// [`crate::io::Io::try_write16`] on the returned handle reject
+    /// odd offsets because the [`Region`]-based bounds check requires
+    /// `offset % 2 == 0`. This model does not cover every SMBus register layout,
+    /// including layouts where auto-increment or auto-decrement results in command
+    /// bytes that appear unaligned. Use [`Self::smbus_read_word`] or
+    /// [`Self::smbus_read_word_swapped`] for word access at an odd command byte.
+    #[inline]
+    pub fn smbus_io(&self) -> I2cView<'_, Region<256>> {
+        // INVARIANT: The view borrows this bound client and covers the 256-byte
+        // SMBus command region.
+        //
+        // The provenance-free pointer encodes a command offset rather than a
+        // memory address. Its initial address is zero, and the region metadata
+        // supplies the length used for bounds checks. Projections select command
+        // offsets; SMBus accessors extract those offsets without dereferencing
+        // the pointer.
+        I2cView {
+            client: self,
+            ptr: Region::<256>::ptr_from_raw_parts_mut(core::ptr::without_provenance_mut(0), 256),
+        }
+    }
+
+    #[inline]
+    fn smbus_read_byte(&self, reg: u8) -> Result<u8> {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_byte_data` accepts any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(self.as_raw(), reg) };
+        to_result(ret)?;
+        Ok(ret as u8)
+    }
+
+    #[inline]
+    fn smbus_write_byte(&self, reg: u8, value: u8) -> Result {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_byte_data` accepts any u8 command byte and value.
+        let ret = unsafe { bindings::i2c_smbus_write_byte_data(self.as_raw(), reg, value) };
+        to_result(ret)
+    }
+
+    /// Reads the 16-bit SMBus word value returned for a command.
+    ///
+    /// Wraps `i2c_smbus_read_word_data`. The `reg` parameter is the SMBus
+    /// command byte (0x00–0xFF), a data byte which often selects a register on
+    /// the device. SMBus transmits the low byte first.
+    ///
+    /// Use [`Self::smbus_read_word_swapped`] for devices that transmit the
+    /// high byte of a multi-byte value first.
+    ///
+    /// Returns `Err` if the bus transaction fails, for example because of a
+    /// NACK, arbitration loss, or timeout.
+    #[inline]
+    pub fn smbus_read_word(&self, reg: u8) -> Result<u16> {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_word_data` is safe to call with any valid client
+        // pointer and any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_word_data(self.as_raw(), reg) };
+        to_result(ret)?;
+        Ok(ret as u16)
+    }
+
+    #[inline]
+    fn smbus_write_word(&self, reg: u8, value: u16) -> Result {
+        // SAFETY: `self.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_word_data` accepts any u8 command byte and u16 value.
+        let ret = unsafe { bindings::i2c_smbus_write_word_data(self.as_raw(), reg, value) };
+        to_result(ret)
+    }
+
+    /// Reads a 16-bit word from an SMBus command and swaps its two bytes.
+    ///
+    /// Wraps `i2c_smbus_read_word_data` and applies [`u16::swap_bytes`] to the
+    /// result. The `reg` parameter is the SMBus command byte (0x00–0xFF), a data
+    /// byte which often selects a register on the device.
+    ///
+    /// SMBus transmits the low byte first. This method swaps the returned bytes
+    /// for devices that transmit the high byte of a multi-byte value first.
+    ///
+    /// Returns `Err` if the bus transaction fails, for example because of a
+    /// NACK, arbitration loss, or timeout.
+    ///
+    /// # Examples
+    ///
+    /// ```no_run
+    /// use kernel::{device::Bound, i2c::I2cClient, prelude::*};
+    ///
+    /// # fn test(client: &I2cClient<Bound>) -> Result<u16> {
+    /// // Read a word from a device that transmits its high byte first.
+    /// client.smbus_read_word_swapped(0x0c)
+    /// # }
+    /// ```
+    #[inline]
+    pub fn smbus_read_word_swapped(&self, reg: u8) -> Result<u16> {
+        self.smbus_read_word(reg).map(u16::swap_bytes)
+    }
+}
