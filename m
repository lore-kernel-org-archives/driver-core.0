Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239877;
	b=LiPAMc079Nt0qP03bLxJr4vAw6Q2T14NraGzGLLU3KEnHuLQrlbqgwIDQ9AbdPa/BUwh
	 KX3X9XVypv9IIOm+5uWPyLOUfottSn6BMQgLhIomLESvVyB1qnpNBIwLGwOgtotdtkbKD
	 tXF9IaGWIt5UC6DB16xMaEuvYhir6S56ON7AG82e13msV0spJTeqL7y6obYjP4AqCJIKB
	 /qOMO8LbB6N/7GQP54XsL4NVW9pIKiVNbzOJhy5pFKh0ZbGggass+g0zxTgNTmP8vlWxo
	 DMv8t7ILbTohuf35Q1B2/3sqtuLaATkU84dXBmFaKyYkOaHUG5EzK6D2p85364mJpjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZbCaAvhWgcepykM7cYCVdmIyX9bkP8mLlamURxwhqqk=;
	b=sAowYfC+9JRml23xnH/YyiCcKhE/B2O2yxwhPMHk40xFXcTSPB1RXpHXzCNqWKOIDV/x
	 /VdteOO4g0+9YbFaGdmXjIRjjsu8fEaEvsMznfFiZqaOuWfcwQofRzS5eXSthJUBU8tNr
	 pEFT4zJv3zGFD9CfjGUPMai+YVRGbeSI/sqcZw856aNuXODkmTkcDv+KplbhGHcI5P21Q
	 lLi+OBfxXuETyE7SeI8DvRj20//KpkY9c1+brMvvWK5/UP1GZQCCViBhkEM7cvBA/hQA3
	 0koaky2CGL4B8g9mlldCNlBuzYinI6RoNfrstnBbyvQJ8WzuwZ1qXxZO3rEQroM8XaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdmjrluH;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264F9606A33E
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 15:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264F9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BdmjrluH
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so721336c88.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239875; x=1794844675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZbCaAvhWgcepykM7cYCVdmIyX9bkP8mLlamURxwhqqk=;
        b=BdmjrluHYu0qxEaF2qrwrUou4yC5zNvBAONpks6Xer1nlC+3cmk/xPM8bkzx/yQTmF
         bVY8+Soav+njpj92+0m4T/tm0rmPRBOFXO0svxre5VbDXFrI27g6emeicjcQ3JQMwdMT
         WoG0dTNbEWmfpCGoSHc0bVkDhv1eppaFJJvtyCaT8oV88W5OfVG9IM8+z8/AxtMJDdyh
         hTzRaOrOyU74xP6BnmymbayHPVxalKFEt0lo+ulEzUQ0BdjPs9N8rCvgqHsiHf2ObnA/
         ofUVm1Y2uWmP3EAFEIgBNcEuxjeZNor02l6HB4dQjTRHMFkNxNu81ffFLHDygT5M9k8B
         MEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239875; x=1794844675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZbCaAvhWgcepykM7cYCVdmIyX9bkP8mLlamURxwhqqk=;
        b=mw05cq+hsEOrlYfeeF7FJHg5AsQ1PdZ34hSkC4x3Ep0u+yKkr6TaiaH1qx4huQ52Zf
         hW3LV2UeJzn0RigMbZ3XTG/ZkWDt0wzS14PE5bHnq2L7Eb7qHHQNQMl/VtM/FDsi+OR/
         DcJYlQjrsReuabkNwPk98SBE3Iw1L22m+vqTfDG8KU5udiBTS+exYE6cJ8cMAvKUC9zi
         qW4fosX3oecrbU3SPYkSL+hBu+5ecWKnkk3ZrGe07+yshIZ/d0uPoIIf9IG59BCWlUwY
         2mR5ewg89AXx68JGuA32MBupsu8a4tiidFPGxp1Buez6oca/QrUSEGKR82R0RTqGaEqo
         DA/Q==
X-Forwarded-Encrypted: i=1; AL+hErH+PjhEi/5G8BXJ5DCsrjYtyyu5EgpU6JhJMYs0i0qL1347z4/X84M2lkLh+61E8/PEDy90WwKhlLnZwQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8rQj5cROw6bvIc8Gqenb99iCnsXI+d69TWVp2QSRdHzc5d7eDO
	tjkVy2P0t4USTqu61b7R0S/dL3vFxFOk0TSWyYeuUMYzOtrS0r2bmdwN
X-Gm-Gg: AYBFou2/+8r6UYEs6+2pvhAPwK4rU/oqRMC6U3kvubjOOx5O2WAwSSOyFFUC/2kCAh8
	puKTVu7L2t/YT2OthbyKQwyCWS/1dQwj/rhyiFHVJvPk9UpkbWt5s4sez/co1RwsdumT4YfoarB
	Vs9NO0Lk5qrPz8H4mLDl2V1nkn8Am2zxteZBVVOgmfwH6Oi6okqFIx040HvTpZzN9qrmA3Ve9C8
	GreJYVS1VVH2ZC5+blGOBihtb3htPyDqzNPLK+rlBi23MM5N5T++A6gKdM+KXHHZ1hR65nPPCSm
	9TTcZAXQVoHmgAoSKBSrNJN3NshbQhsUdvIghomNWcAsu4SsEOqGkJ46YVb9onnVC6le5EUYBah
	Ef6lFFQc67ciyWSmmK9IWAXhpgkqECtu8+vXN3dJct6nGrYeeZxThHNeAS6TmuUYtJfPIjahTlo
	awZAhlsnxGyoBa1zDYutE7ZOGkRU4sgb/woSsS3dWPTanCHNBOl1Rt3fA3sW03octtdWaprULQt
	ap6cIi8PRhxEcRos3y8eRoUSLK+yBA2mShESrodeIQQd/CAG6oBg7Md7kMC8UYVyLzovsEXUwT4
	2C96MRXmqx8Yj3OmCXLCP2BEeo9F3nEz6YGHaX1+3LVs0UQKOQyt85AITwbHrosZU5kNyyY=
X-Received: by 2002:a05:701b:455a:10b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b3ac6c5edemr3932498c88.29.1794239875103;
        Mon, 09 Nov 2026 07:57:55 -0800 (PST)
Received: from localhost.localdomain ([125.166.179.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm13020828c88.13.2026.11.09.07.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 07:57:54 -0800 (PST)
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
Subject: [RFC PATCH v7 1/4] rust: io: add FallibleIoCapable
Date: Mon,  9 Nov 2026 22:57:40 +0700
Message-ID: <20261109155743.83740-2-muchamadcoirulanwar@gmail.com>
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
 rust/kernel/io.rs | 62 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index a877df11a03e..b93a540c28da 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -356,6 +356,31 @@ pub trait IoCapable<T>: IoBackend {
     fn io_write<'a>(view: Self::View<'a, T>, value: T);
 }
 
+/// I/O backend capability for operations that may fail independently of address validation.
+///
+/// Infallible backends implementing [`IoCapable`] also support fallible operations. Backends
+/// implementing only this trait cannot use the infallible [`Io`] accessors.
+pub trait FallibleIoCapable<T>: IoBackend {
+    /// Read from `view`, returning a transport error if the operation fails.
+    fn io_try_read<'a>(view: Self::View<'a, T>) -> Result<T>;
+
+    /// Write `value` to `view`, returning a transport error if the operation fails.
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
@@ -759,7 +784,7 @@ fn copy_to_slice(self, data: &mut [u8])
     fn try_read8(self, offset: usize) -> Result<u8>
     where
         usize: IoLoc<Self::Target, u8>,
-        Self::Backend: IoCapable<u8>,
+        Self::Backend: FallibleIoCapable<u8>,
     {
         self.try_read(offset)
     }
@@ -769,7 +794,7 @@ fn try_read8(self, offset: usize) -> Result<u8>
     fn try_read16(self, offset: usize) -> Result<u16>
     where
         usize: IoLoc<Self::Target, u16>,
-        Self::Backend: IoCapable<u16>,
+        Self::Backend: FallibleIoCapable<u16>,
     {
         self.try_read(offset)
     }
@@ -779,7 +804,7 @@ fn try_read16(self, offset: usize) -> Result<u16>
     fn try_read32(self, offset: usize) -> Result<u32>
     where
         usize: IoLoc<Self::Target, u32>,
-        Self::Backend: IoCapable<u32>,
+        Self::Backend: FallibleIoCapable<u32>,
     {
         self.try_read(offset)
     }
@@ -789,7 +814,7 @@ fn try_read32(self, offset: usize) -> Result<u32>
     fn try_read64(self, offset: usize) -> Result<u64>
     where
         usize: IoLoc<Self::Target, u64>,
-        Self::Backend: IoCapable<u64>,
+        Self::Backend: FallibleIoCapable<u64>,
     {
         self.try_read(offset)
     }
@@ -799,7 +824,7 @@ fn try_read64(self, offset: usize) -> Result<u64>
     fn try_write8(self, value: u8, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u8>,
-        Self::Backend: IoCapable<u8>,
+        Self::Backend: FallibleIoCapable<u8>,
     {
         self.try_write(offset, value)
     }
@@ -809,7 +834,7 @@ fn try_write8(self, value: u8, offset: usize) -> Result
     fn try_write16(self, value: u16, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u16>,
-        Self::Backend: IoCapable<u16>,
+        Self::Backend: FallibleIoCapable<u16>,
     {
         self.try_write(offset, value)
     }
@@ -819,7 +844,7 @@ fn try_write16(self, value: u16, offset: usize) -> Result
     fn try_write32(self, value: u32, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u32>,
-        Self::Backend: IoCapable<u32>,
+        Self::Backend: FallibleIoCapable<u32>,
     {
         self.try_write(offset, value)
     }
@@ -829,7 +854,7 @@ fn try_write32(self, value: u32, offset: usize) -> Result
     fn try_write64(self, value: u64, offset: usize) -> Result
     where
         usize: IoLoc<Self::Target, u64>,
-        Self::Backend: IoCapable<u64>,
+        Self::Backend: FallibleIoCapable<u64>,
     {
         self.try_write(offset, value)
     }
@@ -958,9 +983,12 @@ fn try_read<T, L>(self, location: L) -> Result<T>
     where
         T: AsReprMut,
         L: IoLoc<Self::Target, T>,
-        Self::Backend: IoCapable<<T as AsRepr>::Repr>,
+        Self::Backend: FallibleIoCapable<<T as AsRepr>::Repr>,
     {
-        Ok(io_read!(self, try: location))
+        let view = io_project!(self, try: location);
+        Ok(T::from_repr(Self::Backend::io_try_read(io_view_as_repr(
+            view,
+        ))?))
     }
 
     /// Generic fallible write with runtime bounds check.
@@ -991,10 +1019,10 @@ fn try_write<T, L>(self, location: L, value: T) -> Result
     where
         T: AsRepr,
         L: IoLoc<Self::Target, T>,
-        Self::Backend: IoCapable<<T as AsRepr>::Repr>,
+        Self::Backend: FallibleIoCapable<<T as AsRepr>::Repr>,
     {
-        io_write!(self, try: location, value);
-        Ok(())
+        let view = io_project!(self, try: location);
+        Self::Backend::io_try_write(io_view_as_repr(view), T::into_repr(value))
     }
 
     /// Generic fallible write of a fully-located register value.
@@ -1037,7 +1065,7 @@ fn try_write_reg<T, L, V>(self, value: V) -> Result
         T: AsRepr,
         L: IoLoc<Self::Target, T>,
         V: LocatedRegister<Self::Target, Location = L, Value = T>,
-        Self::Backend: IoCapable<<T as AsRepr>::Repr>,
+        Self::Backend: FallibleIoCapable<<T as AsRepr>::Repr>,
     {
         let (location, value) = value.into_io_op();
 
@@ -1071,12 +1099,12 @@ fn try_update<T, L, F>(self, location: L, f: F) -> Result
     where
         T: AsReprMut,
         L: IoLoc<Self::Target, T>,
-        Self::Backend: IoCapable<<T as AsRepr>::Repr>,
+        Self::Backend: FallibleIoCapable<<T as AsRepr>::Repr>,
         F: FnOnce(T) -> T,
     {
         let view = io_project!(self, try: location);
-        view.write_val(f(view.read_val()));
-        Ok(())
+        let value = T::from_repr(Self::Backend::io_try_read(io_view_as_repr(view))?);
+        Self::Backend::io_try_write(io_view_as_repr(view), T::into_repr(f(value)))
     }
 
     /// Generic infallible read with compile-time bounds check.
