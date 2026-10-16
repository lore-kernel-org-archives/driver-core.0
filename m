Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFE4E56C2
	for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792165722; cv=none; b=tGh3xpU9Ya+ub4yJL7nFvLCu2iHziiivowzgZ98zGpVE0QhoAd+P6V88x2w6twBLYK1jp1QkyiB2dY44Y0y2jyHjSdXXti3rm8/JUztOyfazVmT8Tp+CjI+sIXaIx/bA4GnV3KwIwxqa8JNmzqRkhux+2aGNIlK0LOVzCPAV6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792165722; c=relaxed/simple;
	bh=17tedGYcRNdDnq1dKIJYkX8tB8XKf3YAkAWYjfskwm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mrAUA70YBkQLR19GpfVx+WCOdtengaw06FgkPU3klUJgLTOCIAVM3Dy7vFEFsAZ06f6y3OwscDG/bgTqjC8tFC92rqsNlgxWM1+uz97on3I2FhsqwC7lPsKkxYbFLfgMvKT1GAwtvKCRBx1r4QFMwvR6+Qm46S/Hx4N9o5+THEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsedkWy5; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsedkWy5"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ab37e44643so538517b3.0
        for <driver-core@lists.linux.dev>; Fri, 16 Oct 2026 08:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165713; x=1792770513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plcoVhgmwxTvzaBDkme5sEgwM7GIbrXBdBohLzMS+Gs=;
        b=RsedkWy55lz17IyBVD7oF/6F+vpvOvSMpE4EuohwIRrtwp9UoocsYfkeSsgExEgZLC
         fZNrF6nY0m+McQAAWTPTjCAErAGE+FWaBFKkowTepxY1EJUje03EIxJKZYGuL0Zbs+Kz
         hYmtFTx2pcLJRXqdANkpkDXnWhK5Y2SpWPJ8dB/GOy7NokEfSzE0wFIdIzw8QsfkW103
         Zfol+661UYAML+TSQC5Z6SVjrXKWSaWK6dd7bZ+95SpBKyF9zSO4CNmdC8Own9Ugl+te
         ishd5m7QsfWygko+8GwKfBxxkC1THfw7ptbSnnKkLhfmn72+tN6jAHf5ADg8NF0uTCFc
         D6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165713; x=1792770513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plcoVhgmwxTvzaBDkme5sEgwM7GIbrXBdBohLzMS+Gs=;
        b=UgTsehPC1K1dJo7ltRuUEdV/tsCu3Jr84ojSGEgcHxctrOIU3M2QRMXxRVdvDOmc1/
         G/P+bj+YuaJHDLjwgGkp1jDbgW0YYeUgua0iYKdMiAH3QeQSvY3a9zCTk6jd19V3mBR0
         20EXZUZBYg4odAxxGbqKcJAl+bQwCfShTFs3DaFdgCB8No5vyBOfmLaPFaP6+G2F8Cvw
         rb9MYiuFzDqnmx8m+/Auq6YiWmUrd/PV5Zp8epf3AjoGkOFzsoOtBe25/3a8z9lmYM/X
         qXzWla3t4+qhosLnJOnn1DhyA/dJudAv55Iyl7Oa6s9TbQprSG2GdkjQzHP6zvo86y0s
         m45w==
X-Forwarded-Encrypted: i=1; AKwUvBxoLHepdffPCuZX41SoClBb1Yvr8i9Wcko9GgUehF9F5KDnGOMTe04oFQfw9Ab5YUryW2+HEhDjhEbf0w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLv16t60MkEAhXKc9QTk3D8YSh8w8e9l4SeuVu1RamhDjPJZyu8
	bxomRW8w9kdR+/au8tiUX1iwzgDI7fV9JXOxc/NrdZko4u27MsAaRaUA
X-Gm-Gg: AYBFou1N8d2bC44a2GEKOi3t0pnERljv75q5C8wOsgGcN7tNmou9TaYrLD52rrZjr9p
	brjbJgQJZh1dWyuDWmAeQ+C/o0x6D6RIQtU/nMMNy3rf3YlUjppQ4wkD08PY82sjyAipR7Xiel9
	/MFHnzGcMJWqBJnE5JpIvvO3QmThBe5iS34aBap3ep9J2gDX473POy06Pj84tHMmUM28o6tHsz6
	JV0ZCndgyufVHSxCvthje8SfWOZJSpmJJ9Xk0195C3WMOQCBmcHjU3UzRseQq2vhCV6KtiKDwMd
	gBSqaQGjmf1/eD6dDS8sCUe7+DUUKTh2WWDB02AuB9gbvDSA0HliEwaNQs+2IqzNup2mz7IAPo8
	vesSnOsvN26k+EoEyqBeMW1Xvimz7L25etQ3i+rp+Uk+wrnMZhtE/zXZREy7YQRjT5UVMFO4VXk
	lcuAee3r+eiLnnEEPn8q5L+kgL0C3N6GIG2WA/rAGBWN4EhcbbpZoR0IUHgXIpyYZZdEIh0SQSc
	jXYtShpFGmhqJehPvJeeBv4hotrajlZnqWDZVQ=
X-Received: by 2002:a05:690c:e68e:b0:8b0:6617:e241 with SMTP id 00721157ae682-8b0f20752cfmr1168687b3.4.1792165713522;
        Fri, 16 Oct 2026 08:48:33 -0700 (PDT)
Received: from localhost.localdomain ([180.243.241.21])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e593c65bsm10882167b3.38.2026.10.16.08.48.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 08:48:33 -0700 (PDT)
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
Subject: [RFC PATCH v6 1/4] rust: io: add FallibleIoCapable
Date: Fri, 16 Oct 2026 22:48:16 +0700
Message-ID: <20261016154819.17936-2-muchamadcoirulanwar@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a fallible I/O capability for backends whose accesses may fail
independently of address validation.

Route try_read, try_write, try_write_reg, and try_update through the
fallible capability. Provide a blanket implementation for infallible
IoCapable backends so existing users retain their current behavior.

This allows transport-backed implementations such as I2C to expose only
fallible access while keeping infallible operations unavailable.

Link: https://lore.kernel.org/all/DJVQ852J7SOH.26YBIJTQ9B66G@kernel.org/
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
---
 rust/kernel/io.rs | 66 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 95f46bb75f9e..516895ca2082 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -276,6 +276,36 @@ pub trait IoCapable<T>: IoBackend {
     fn io_write<'a>(view: Self::View<'a, T>, value: T);
 }
 
+/// Fallible counterpart of [`IoCapable`] for I/O backends where operations can fail at the
+/// transport level (e.g. I2C, SPI).
+///
+/// Infallible backends ([`IoCapable`] implementors) get this for free via blanket implementation.
+/// Fallible-only backends implement this trait directly without implementing [`IoCapable`]; the
+/// infallible [`Io::read`], [`Io::write`], and [`Io::update`] methods will then be unavailable,
+/// enforcing that callers use the `try_*` variants instead.
+pub trait FallibleIoCapable<T>: IoBackend {
+    /// Performs an I/O read of type `T` at `view` and returns the result, or an error if the
+    /// transport-level operation fails.
+    fn io_try_read<'a>(view: Self::View<'a, T>) -> Result<T>;
+
+    /// Performs an I/O write of `value` at `view`, or returns an error if the transport-level
+    /// operation fails.
+    fn io_try_write<'a>(view: Self::View<'a, T>, value: T) -> Result;
+}
+
+impl<B: IoCapable<T>, T> FallibleIoCapable<T> for B {
+    #[inline(always)]
+    fn io_try_read<'a>(view: Self::View<'a, T>) -> Result<T> {
+        Ok(Self::io_read(view))
+    }
+
+    #[inline(always)]
+    fn io_try_write<'a>(view: Self::View<'a, T>, value: T) -> Result {
+        Self::io_write(view, value);
+        Ok(())
+    }
+}
+
 /// Trait indicating that an I/O backend supports memory copy operations.
 pub trait IoCopyable: IoBackend {
     /// Copy contents of `view` to `buffer`.
@@ -645,7 +675,7 @@ fn copy_to_slice(self, data: &mut [u8])
     fn try_read8(self, offset: usize) -> Result<u8>
     where
         usize: IoLoc<Self::Target, u8, IoType = u8>,
-        Self::Backend: IoCapable<u8>,
+        Self::Backend: FallibleIoCapable<u8>,
     {
         self.try_read(offset)
     }
@@ -655,7 +685,7 @@ fn try_read8(self, offset: usize) -> Result<u8>
     fn try_read16(self, offset: usize) -> Result<u16>
     where
         usize: IoLoc<Self::Target, u16, IoType = u16>,
-        Self::Backend: IoCapable<u16>,
+        Self::Backend: FallibleIoCapable<u16>,
     {
         self.try_read(offset)
     }
@@ -665,7 +695,7 @@ fn try_read16(self, offset: usize) -> Result<u16>
     fn try_read32(self, offset: usize) -> Result<u32>
     where
         usize: IoLoc<Self::Target, u32, IoType = u32>,
-        Self::Backend: IoCapable<u32>,
+        Self::Backend: FallibleIoCapable<u32>,
     {
         self.try_read(offset)
     }
@@ -675,7 +705,7 @@ fn try_read32(self, offset: usize) -> Result<u32>
     fn try_read64(self, offset: usize) -> Result<u64>
     where
         usize: IoLoc<Self::Target, u64, IoType = u64>,
-        Self::Backend: IoCapable<u64>,
+        Self::Backend: FallibleIoCapable<u64>,
     {
         self.try_read(offset)
     }
@@ -685,7 +715,7 @@ fn try_read64(self, offset: usize) -> Result<u64>
     fn try_write8(self, value: u8, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u8, IoType = u8>,
-        Self::Backend: IoCapable<u8>,
+        Self::Backend: FallibleIoCapable<u8>,
     {
         self.try_write(offset, value)
     }
@@ -695,7 +725,7 @@ fn try_write8(self, value: u8, offset: usize) -> Result
     fn try_write16(self, value: u16, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u16, IoType = u16>,
-        Self::Backend: IoCapable<u16>,
+        Self::Backend: FallibleIoCapable<u16>,
     {
         self.try_write(offset, value)
     }
@@ -705,7 +735,7 @@ fn try_write16(self, value: u16, offset: usize) -> Result
     fn try_write32(self, value: u32, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u32, IoType = u32>,
-        Self::Backend: IoCapable<u32>,
+        Self::Backend: FallibleIoCapable<u32>,
     {
         self.try_write(offset, value)
     }
@@ -715,7 +745,7 @@ fn try_write32(self, value: u32, offset: usize) -> Result
     fn try_write64(self, value: u64, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u64, IoType = u64>,
-        Self::Backend: IoCapable<u64>,
+        Self::Backend: FallibleIoCapable<u64>,
     {
         self.try_write(offset, value)
     }
@@ -827,10 +857,10 @@ fn write64(self, value: u64, offset: usize)
     fn try_read<T, L>(self, location: L) -> Result<T>
     where
         L: IoLoc<Self::Target, T>,
-        Self::Backend: IoCapable<L::IoType>,
+        Self::Backend: FallibleIoCapable<L::IoType>,
     {
         let view = io_view::<Self, L::IoType>(self, location.offset())?;
-        Ok(Self::Backend::io_read(view).into())
+        Ok(Self::Backend::io_try_read(view)?.into())
     }
 
     /// Generic fallible write with runtime bounds check.
@@ -860,12 +890,11 @@ fn try_read<T, L>(self, location: L) -> Result<T>
     fn try_write<T, L>(self, location: L, value: T) -> Result
     where
         L: IoLoc<Self::Target, T>,
-        Self::Backend: IoCapable<L::IoType>,
+        Self::Backend: FallibleIoCapable<L::IoType>,
     {
         let view = io_view::<Self, L::IoType>(self, location.offset())?;
         let io_value = value.into();
-        Self::Backend::io_write(view, io_value);
-        Ok(())
+        Self::Backend::io_try_write(view, io_value)
     }
 
     /// Generic fallible write of a fully-located register value.
@@ -905,7 +934,7 @@ fn try_write_reg<T, L, V>(self, value: V) -> Result
     where
         L: IoLoc<Self::Target, T>,
         V: LocatedRegister<Self::Target, Location = L, Value = T>,
-        Self::Backend: IoCapable<L::IoType>,
+        Self::Backend: FallibleIoCapable<L::IoType>,
     {
         let (location, value) = value.into_io_op();
 
@@ -938,16 +967,13 @@ fn try_write_reg<T, L, V>(self, value: V) -> Result
     fn try_update<T, L, F>(self, location: L, f: F) -> Result
     where
         L: IoLoc<Self::Target, T>,
-        Self::Backend: IoCapable<L::IoType>,
+        Self::Backend: FallibleIoCapable<L::IoType>,
         F: FnOnce(T) -> T,
     {
         let view = io_view::<Self, L::IoType>(self, location.offset())?;
-
-        let value: T = Self::Backend::io_read(view).into();
+        let value: T = Self::Backend::io_try_read(view)?.into();
         let io_value = f(value).into();
-        Self::Backend::io_write(view, io_value);
-
-        Ok(())
+        Self::Backend::io_try_write(view, io_value)
     }
 
     /// Generic infallible read with compile-time bounds check.
-- 
2.50.0

