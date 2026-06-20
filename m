Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD693367B9B;
	Sat, 20 Jun 2026 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981413; cv=none; b=EPpAy+uh39HzvQAkaWmX3AV4AYdXtLDjvapZOPib4qiQR55nRblyfWoXoE8b8T6sGKqt9BUsyHDeYEMFXe8vHP2C+ntlpDtmGAMPSzkHsIzLPiiegefZyC6ggZuBp2sR7vdAAwrOAjjpm2hfseTxehnFdnnKK9AfSz7InU6J2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981413; c=relaxed/simple;
	bh=h1dp0CSyxoofGCtiwZW8SPTrIttJiN8Edh2bD0JC8kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8X9bYyjssd0sSIMXcRtKHxwC2lvjTGEnxDfh52kKcCxtRRTKiCHPHAxLNxvx9xlx4IPOeSYycIWfPZhBeWWBVvyPm7i1p+J6v0opp5wOXVligyDMPqR1SkHHba6Ce1TKeQUBEBvv86eQN0tic13i2oytZW1aPb6B89aeHHdztU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afgmvRHm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afgmvRHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C871F000E9;
	Sat, 20 Jun 2026 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981412;
	bh=Y1nxmUNmzObjE1ETWe+k9k6wr36179Z11Zh2Wwpy6wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=afgmvRHmZnuG06kGRpjmvYHW5H0dNneBRjkCPEjB16I12t47Y0IHE5GUicK3Y2gxK
	 jiwIDyH1ftMfF4nX3rP410owQtDR6cvNpmi4XeesU4RtKIbtGpbKo3IFTYC6a8acmQ
	 ZrXnPxydUVAftPWTc2YHy3tticcsN4fsRAppHTSUCq2ORI+ZDfUIrnbFGNqhquo99i
	 L6kOkNeG4F4ggRiUA6BMBCpBNpm8SOhqHyYWkmfMFsuxxtNIQ91hbgYwpNzb89K6fK
	 ot6N23ocGa7gp+DVGcANPZnjhxB/OjV4c7jsBfkxp3yII0AC6du0rQTBJpinHTOjg4
	 P0osC47Av1b+Q==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ecourtney@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	deborah.brouwer@collabora.com,
	boris.brezillon@collabora.com,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 08/16] rust: drm: pin ioctl Device reference to Normal context
Date: Sat, 20 Jun 2026 20:48:01 +0200
Message-ID: <20260620184924.2247517-9-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620184924.2247517-1-dakr@kernel.org>
References: <20260620184924.2247517-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly annotate the Device reference produced by from_raw() in the
ioctl dispatch macro as Device<_, Normal>. Without this annotation, the
context is inferred from the handler's first parameter type, which would
allow a handler declaring &Device<T, Registered> to obtain a Registered
reference without runtime proof via RegistrationGuard.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/ioctl.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 023e6da5c1e4..70cf1aa4d788 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -167,7 +167,8 @@ macro_rules! declare_drm_ioctls {
                             // FIXME: Currently there is nothing enforcing that the types of the
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
-                            let dev = $crate::drm::device::Device::from_raw(raw_dev);
+                            let dev: &$crate::drm::device::Device<_, $crate::drm::Normal> =
+                                $crate::drm::device::Device::from_raw(raw_dev);
                             let __anchor = ();
 
                             // SAFETY:
-- 
2.54.0

