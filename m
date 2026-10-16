Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044094DAFB3
	for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165727; cv=none; b=FA9qpf1RsRDyu8Wwg88zJhjdAG+3e8shYjV2TbktqnPNphLHK1J0Uu3Jy/dGhWduA1uKbLNDKMyCdpEsbnjAJEarKiYpiaQalgzxlFNkSk6VGsFSP4Q0eGjDBhhMZysc8zTkGK0JnNQKn3VCg7JCO14ouKabN8NWpXHDQi0eRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165727; c=relaxed/simple;
	bh=f/LlaXwpgISPLIkAh4D0bO0JxYhqdGLGuejPAOTGjYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IOlKEFWyKjRw9jtmUoCbPMotq5BCwBzxdsdJaAPUx/P57u+44yJGFUR6R0EndwUEUYx9p7H6y1PKXHqGRnKgm4WzXDyX8wKcE8FHmi4e/JOc1cPiI2c2XzrLEEzQ6uV0DGzPBHkMMi60iGZ4bWlbwOeCa/wxZtV/+4I+neajGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4rCEywn; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4rCEywn"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ae8607e8afso341917b3.3
        for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 08:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165721; x=1792770521; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UcXcjmdbD4zGGAO+RVCCm8PFVCmkKLDPCn8GWidFdVc=;
        b=V4rCEywnLellFH3tck7mlwp5l3YoAi71t6ZK9PI7BOzjc7h/XaZ6G54kixW1XuVVjD
         Emc9p9RdfBM+vVhXn+E0T2JW5zcq0KYWphk5gdMX+NulVB7085dZzSxZ3HCDzmHZ0o87
         W1JsVxsiuVYEXJqbP6znpxCNhHHZ3lnuBpPaUhlq3ZIvkbcPwu29ngMXHl6t4WzBeOMm
         tnDX2t9hr0Hr1W3QXNa7GdEQSnPu+EdyUKf1IWRTCX5AOwvhX5Vs/uXpjVPi16ttd4Zi
         0A/E/OHjeZt37hNIkL6YxReBUAuPD301g2PlNHM8t9vK1maBrc81iJVY21v4Jhzi0DLy
         TYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165721; x=1792770521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UcXcjmdbD4zGGAO+RVCCm8PFVCmkKLDPCn8GWidFdVc=;
        b=wSfeHR7dxKnIGAH/31fdfiHJH+MAbotZ8SHbW6GV1YGM+HCU0tqb2HcAE5tjVjIrst
         R1MFVRAD+uw1CbStGjDvRQxmfKAHBtZBmv6HDSP5tV8Tf9bUqAtxMsOpkFzgwTuWMDyN
         TQfo0l505okrDw9+ceSUm+qp81Wf0/Mxq0IVAYIcMkDz37yPbrf90xcSMDTG9Wv/GBAI
         A0kDKDRgiPEQX7Qa3Phb+JpjbTU9CVZV+I3kQGFljZk5FWRS61kmdf6S8dsjqZueNRwB
         vMDogckubbWR7vv+z73WO/yRcEvz4Ejil2vLyTeySvGAP8DeCmcXMSK5vWb9xxuylkkI
         LGMg==
X-Forwarded-Encrypted: i=1; AKwUvBxF8MU6rUdMIWh8Avi2mtanXNRQU8YhAodW9rz6TnNxKJZ3ENMxRQlmuIQiV4ofrBrh81G41VxZNb9VMA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI+Os3lsw7NgoxZnFIkAbUflhNRBEhJ5v/X/CzGI765qqQcypNH
	tJA9D/vAbJaqoVsPcMH/YbNWGvrFALBSDw9Ks7IySIhy38Kb0Q7gQg/1
X-Gm-Gg: AYBFou14+h0ZZ8fA2E+6e0FyzImiNyzS3TVHOWjSD3J0mKAnfOHF0mnv10WMwHqxuEX
	fQxcl77DtlPK4RFqMDxH+60hq9AhJaAhicZ02V2htejL0wddgHtx783u9h8nlTJ7SSnUnlIazjb
	oE2D6HW15bUmH8ckrtprA75fsUmuIxuXu5cRmjMjTiHroE40kRooBKdo0bo5kSaK1u+v5b/5Vgx
	DqfXtHd+vWwUROoLlMVAYlToShpYYq62X96JrAATHwFnUcWPiBNLSZLc4xyBCU0YNd3Mm4EOAHB
	mlwHyGtO2zd+zsGCB6fg1/dMX/9WeTxDM4LnhQCu10Udl5NLI5ehSrvEppOodzUey4uxGOl14Oz
	ic+LED9SJvSZYUmOl353EZBx0flgueKynMuWIvwOac/nKtr4tpJWrL8gkhkWKmAN/gxcKF/6pEY
	J54d2eqto4RsYHQ4YIdZ3YIV4ede/QHwJJUCGKpcVugxmJx3nVNfyvOcNAWfDmaCPEtpPdq7ytk
	eRYrV/VrWGl8GknjwTLMaFfgNFutIfXDNj181Q=
X-Received: by 2002:a05:690c:6203:b0:8b0:ad62:19c0 with SMTP id 00721157ae682-8b0f21b9343mr1466717b3.39.1792165720564;
        Fri, 16 Oct 2026 08:48:40 -0700 (PDT)
Received: from localhost.localdomain ([180.243.241.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e593c65bsm10882167b3.38.2026.10.16.08.48.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 08:48:38 -0700 (PDT)
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
Subject: [RFC PATCH v6 2/4] i2c: rust: implement SMBus access via IoBackend
Date: Fri, 16 Oct 2026 22:48:17 +0700
Message-ID: <20261016154819.17936-3-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement fallible SMBus byte and word access for bound I2C clients
using the generic I/O backend infrastructure.

I2C transactions may fail due to NACK, arbitration loss, or timeout, so
use FallibleIoCapable rather than the infallible IoCapable interface.
Propagate errors returned by the I2C core to callers.

Provide smbus_io() for byte-addressed register access and standalone
word helpers for devices whose word register starts at an odd offset.
Also provide smbus_read_word_swapped() for devices storing the high byte
at the first register address.

Restrict these operations to I2cClient<Bound>, ensuring that bus I/O is
only available while the client remains bound.

Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/i2c.rs | 248 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index 624b971ca8b0..a53f7ee42b13 100644
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
@@ -601,3 +608,244 @@ unsafe impl Send for Registration {}
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
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_byte_data` is safe to call with any valid client pointer
+        // and any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_byte_data(view.client.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u8)
+        }
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u8>, value: u8) -> Result {
+        // `io_view()` ensures `offset + 1 <= 256`, so `addr()` is at most 255;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_byte_data` is safe to call with any valid client pointer
+        // and any u8 command byte and value.
+        let ret = unsafe { bindings::i2c_smbus_write_byte_data(view.client.as_raw(), reg, value) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
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
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_read_word_data` is safe to call with any valid client pointer
+        // and any u8 command byte.
+        let ret = unsafe { bindings::i2c_smbus_read_word_data(view.client.as_raw(), reg) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
+
+    #[inline]
+    fn io_try_write<'a>(view: I2cView<'a, u16>, value: u16) -> Result {
+        // `io_view()` ensures `offset + 2 <= 256`, so `addr()` is at most 254;
+        // the `as u8` cast below is therefore lossless.
+        let reg = Self::as_ptr(view).addr() as u8;
+
+        // SAFETY: `view.client.as_raw()` returns a valid `*mut struct i2c_client`
+        // pointer as guaranteed by the type invariant of `I2cClient`.
+        // `i2c_smbus_write_word_data` is safe to call with any valid client pointer
+        // and any u8 command byte and u16 value.
+        let ret = unsafe { bindings::i2c_smbus_write_word_data(view.client.as_raw(), reg, value) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(())
+        }
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
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
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
+    /// # Example
+    ///
+    /// ```ignore
+    /// // AS5600 stores the 12-bit raw angle at command byte 0x0C with its
+    /// // high byte first.
+    /// let raw = client.smbus_read_word_swapped(0x0C)?;
+    /// let angle = raw & 0x0fff;
+    /// ```
+    #[inline]
+    pub fn smbus_read_word_swapped(&self, reg: u8) -> Result<u16> {
+        self.smbus_read_word(reg).map(u16::swap_bytes)
+    }
+}
-- 
2.50.0

