Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB2E492E42
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 03:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924816; cv=none; b=ZLjPESxUWza9YVlNWDUjgqX32r4YfgPmXsdPTZzsC9ffFIJbO6Hiw89La/o8npyaG3l7+zJMZk5TuqGNiBJkqSn3qeAWXZTHLiJB3t7jtwt/u4NNpT8fEWDnrAV10IGY22EG/m99ZCJHIW6huVBGIkdlxR+QdpaX7qlslKXpLKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924816; c=relaxed/simple;
	bh=9i9o/ilOEdPdQ52LKqv8CmqkloNbd+8uOtKzKeA/MzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhBTp1C9zS6OXTbcX48WvwvXzuLt9huZlAF9j88ybJn1t8lJjzBsiJz/9JUdM1fch74xzcNMyrfGlNp4fkSM5+JFFnxL9wMY6fockpfzPAL/1oz+7/WL13cBvtxrJZyZTko4ZTjJHF/WS9d09EPfWd6D1dlTGNhihMMqRQULzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPmFY4cE; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPmFY4cE"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90e92b99ab9so36203806d6.2
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 20:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924813; x=1789529613; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0xYmUfmeEhmPnSVBSx2jrGqsQw1JgtPqNfXTg93gKs=;
        b=FPmFY4cEWXP4Yoyl+kWlxLzNVsNDG6u9sQ6AhK4TVjhAekADERjwiEIQCGplGZmwJJ
         E3S5hIaREAEhFOR/TCXtN/t7Uf0B2dWh9NpmUmxQGr/Qaome+tEv7h8Vg4kl7eK2enXT
         kpIcbgRNo7Og7fcmcRR7MpabmXPUiIH6JXeQitUatBowPg0V6xNVwp4hCgQwINu698YV
         HbWoAdxh2oFrhuz46lvnbJUGlaSaVefWdHtMKXlFDdH1QuuTxRFiW0RGVqhGfUQF+NDo
         HxmXElxAGpvW0QP4gwoMEeV0fTo/ZhW78wVK1C2DVNwhmqNRk4rneaAR1f4Ae1c62Kqu
         mMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924813; x=1789529613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0xYmUfmeEhmPnSVBSx2jrGqsQw1JgtPqNfXTg93gKs=;
        b=E92a/oh/sk8wyV0ceyTdWA8GimUZc1TcGrtvoZHUPUUIXVUTn7T/CLCvJY3d5aQK1v
         wubu3AWtV0/OF2tP6qrU3muU6TCAgMzd7GA8NvPjBgJfTWtUjQa6jex4/2oFw3U65Vnr
         rAgTiIPyj2dxGhodMEw+yG0aGyfAWLicMqUFgjV6uRSD1ekmvaGW3a61HhEYt5Eth0by
         9mjt87lXd4D2k9Xn2jnvJR0ZdV0Uy18qbon04gI2ssZkagL02/D2/wX8wEn2VwaD5uyf
         UC57KYg2NG99WRkR+E+O2Jqgg6ujs6+mrq+QKDdx4S3SZkfzTrBAcKFvmiVakyrOMx2o
         7vaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxYfulHzSWb/+Gxhzfg34SMwHRVM30kduMb9S7XrbWAnL7NAWu1wQSd4b+GIjega5ecq0rSmdO512cKw==@lists.linux.dev
X-Gm-Message-State: AFuF++lZchu7jujX/xFZD9XrbAx80ux7HpuTwgLldXhhZgdyNMB3dmNq
	/c6o60jqQrI5KnyphmAMI4mwisiUpSwjPVTRDzBWVQd8i+vVHAkul+rD
X-Gm-Gg: AYBFou2CzVKZngGnue2dTt735BhDXzu39n4Z/KgyG0mx7Xn8Voq3Wo9SnyVU+LJsHfI
	eJQ4+oyXq3jseytEcszONtIkQqobW9LfUN+UfzMdHxPuDB8cBdfv6do+7Y69AgvfLKEMedV5sy6
	QScH0vpoW9RttRnhdbtZgzp+JECqPYlhg6Wp3ROK/z+XB8pQI9ukJOCpFIlD07EYucAIe2s/FEF
	GiJxF26buV7fPKg0EE3QcY/3X46bIKHU+J7SSbQ03WvbDj3h0zLMdN5I+lXKjq8Ov5MnNcR89Qy
	xTeyBLYindRAtNcvgvBpBf2NsCOPoWb/bwiUtyYNncC9Tg8sLfJXkygrqGA9+9Fw8jkpDCzVZWF
	tcpj6YnV1gbc3wMeNgpArISaZNuurvUpIvTNJSCsIbC2W03RRvGNwz2gFforreDTIoPrOPe+jZi
	8JvuLZioWIzvyloSQoZ+95x851h2jeoYhFkWJVfw6a44qNUKOBoWCeSpnHBK2Oz8jgWScUMw==
X-Received: by 2002:a05:6214:2b06:b0:910:345c:57e5 with SMTP id 6a1803df08f44-9103efeb90bmr420056646d6.37.1788924813465;
        Tue, 08 Sep 2026 20:33:33 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106ba5b95dsm11910696d6.21.2026.09.08.20.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:33:32 -0700 (PDT)
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
Subject: [PATCH] rust: auxiliary: validate DeviceId name length
Date: Tue,  8 Sep 2026 23:32:46 -0400
Message-ID: <20260909033246.2779303-1-georgeandrout13@gmail.com>
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

In a constant context exceeding the limit leads to a build error; at
runtime it panics, so add a `# Panics` section for it.

Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abstractions")
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/auxiliary.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 60dfbec8f330..1f3ba86d6d96 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
 
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
+    ///
+    /// # Panics
+    ///
+    /// Panics if the combined module and device name, including the
+    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes.
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

