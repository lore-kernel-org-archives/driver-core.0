Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777BD4AA591
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054777; cv=none; b=kPlLHBWK8ftcneRHGTi886hkNF5tvN3vgwUgiW5BtsbqP0sPkAk5gxvMpczRckpmqwu509bgUTtbl5gE0Yj0brEcsXOVWw0J8JxdKc5nT+D9AOxe4yy2nQYfgZ0CLQcxlQwTBgQKtj65jq21AR5FCRHIBhgiB66c/cxv5fYVjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054777; c=relaxed/simple;
	bh=yWG+hoDEtLJ/6H3nP82927cNZvMVB+giKJZJxO/9hwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXGoeja69psxrJV81EuZpON/rkaIfoO2KX4wUI1h5B2FyU/mqCDOIi786bKlyhyjUSwP2T1bs8lIOQUr4y7uVWll3M4QhIW9kPJozuAnVL3PJkn3GAsVQomY5pvSFnXWBPL9i+YZ1TtBWPVBZLF0btIu1FlviYLnL65Kcm9AvXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrW+T4p5; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrW+T4p5"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so14626391cf.0
        for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 08:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054774; x=1789659574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVg0q1Ig+XeCRC/Adf+hBiNx1miS6vJUHYevs12aWqM=;
        b=LrW+T4p5NQH8UOXS2Uqv0CZSak0w95rHX4GseMg76mugBYeUvIDIldhYJi+S8U1B1C
         Q1Un+CLdFpjgpoB3mHh08y50h8js/R2ttU4ftv6QLKlxJh4AeNfOALoaJI2Zch8YOSzX
         1Cb22qZzRyeOeE+aIhqHHB4rVYomPSr7J11END68mipo/petaw9JYBS0M68wRodYYfbs
         O5MZ4N7zWJrYtasVGejMUdd71lLkbmked+XBjshn8v8nOGafMz4ZtL2aob0OBW476KbM
         vKa7KHCgM8kW/GQwYVW2hlVA8Zaj7ZXbw6qoOR0k+Hmc/GfIB2//SEerZutzrCjm0AmX
         mcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054774; x=1789659574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVg0q1Ig+XeCRC/Adf+hBiNx1miS6vJUHYevs12aWqM=;
        b=mPjGCV6fTS+xXjkUyrIYHpWaYryhwLZYF+qrcp/y+Ly7oCUvgErJPfmOABiNJura0E
         O1ycjsmVd6duZrezfIdb+bJPL62Gqed7LdIr9WRSUTYqrVKz3F1MYjx6uyLGXAp8Hg7F
         nVm3+0V4GJH5bAWq4Nq9mVfznOqhukrnxGW2gVcEmok136Kh8FHXit6+5Ov8FbndHlzb
         +gg1hABrzB0o7wZX8AP6UdUNkhK0KIW8bCVZj7cwgkXCixEtNvkHbiWEVVrtRg03dEAC
         MEZloDmQzl1/gF0eKiB6LVkoxAR/HrGshmfeLftEp1KdS9ht2+oswjHvLgFxZS68cUAQ
         V9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzyUKjpTaGWQ7pn43hRWMwOpJoflHmKptHftmpKGodISx68sYvJ1hGVjfiyF2zL3j4hQ9zhcL+FmekBfg==@lists.linux.dev
X-Gm-Message-State: AFuF++k/u/EijVPwa9W2JFIbPyWwBxkD7AULwNq9RbZE4Qlwk4c+/Y3L
	TLXH6ofxoY8GD2RdBV33oRLIomqL9dQZuxVW+eowJHQwOiPSwgsfc+qG
X-Gm-Gg: AYBFou14cCjsGJ5nm5fUmBeW1aHHm8/EysxSgc/7aLRcM1WEzw8B+SS9YOtD4p/Fz41
	QVIzNrTdZBeW02Vq98vlsT/Obk3fwRdurpmUW8WdMDR0FumfiWdMLU4ia/VguHWoQ+syaiTmPNE
	0Rrn49D/xsPantwONTX1DkazCTzIJtIAuincesK7tOV14h1ybLUOEhyMRjEd0GHqKPbdn5IcH6W
	frX69ArilmwpdS76PMq1bWpJ6fJpegxPLlooDdmauQAw99/DfMUVuugNijsn55R13cTHNh4rBwd
	D/swh5zOb554DT1jTlI+SEaVXYn5bI5QLZkW2rBIBNpWF8jmYGLkgdvYaMZzyRl8c0gaJHtPhS4
	cxaVoUPDhJUII6BFrbUOV24GN/3i3Pd0Q+3oPgITpQAAzXsO2xeAa/WBSdE7wdtB75Q24Mk6r1H
	SHsv9gWGq3G2Fp29xanZp9p/4gXCJHAhDUj/a0zLgoQAZo4eq4FdjyfsPs40pL5y56ZEkDCSOpg
	RJ3iwyx
X-Received: by 2002:ac8:5a8d:0:b0:530:6ffd:1ce8 with SMTP id d75a77b69052e-530aedb7cbbmr100110721cf.41.1789054773862;
        Thu, 10 Sep 2026 08:39:33 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305413ce9dsm170860171cf.11.2026.09.10.08.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:39:33 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH v2] rust: auxiliary: validate DeviceId name length
Date: Thu, 10 Sep 2026 11:38:44 -0400
Message-ID: <20260910153844.3987791-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
`auxiliary_device_id::name` array without checking that they fit. An
oversized name is caught by the array bounds check, but the error
reports an out-of-bounds index in the copy loop rather than the
constraint the caller violated.

Check the invariant explicitly instead, so the failure states the length
limit rather than an array index.

This should only be reached when constructing a device ID table, so the
failure is a compile time error. Document that intent.

Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
Changes in v2:
- Drop Fixes: following feedback from Danilo Krummrich and Alexandre
  Courbot.
- Replace the `# Panics` section with a note that this is for device ID
  table construction, following feedback from Danilo Krummrich and Gary
  Guo.
- Reword the commit message so it does not suggest runtime evaluation,
  following feedback from Alexandre Courbot.
- Link to v1: https://lore.kernel.org/rust-for-linux/20260909033246.2779303-1-georgeandrout13@gmail.com/
---
 rust/kernel/auxiliary.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 60dfbec8f330..2ace0428e45e 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -137,10 +137,18 @@ macro_rules! module_auxiliary_driver {
 
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
+    ///
+    /// This is only intended to be called in const context, when constructing a
+    /// device ID table, where exceeding `AUXILIARY_NAME_SIZE` is a compile time error.
     pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
         let name = name.to_bytes_with_nul();
         let modname = modname.to_bytes_with_nul();
 
+        assert!(
+            modname.len().saturating_add(name.len()) <= bindings::AUXILIARY_NAME_SIZE as usize,
+            "auxiliary device ID is too long"
+        );
+
         let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
         let mut i = 0;
         while i < modname.len() {

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.47.3

