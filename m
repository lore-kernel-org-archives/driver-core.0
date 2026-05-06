Received: from forward400d.mail.yandex.net (forward400d.mail.yandex.net [178.154.239.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DA14B8DF6
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089648; cv=none; b=iN9TpXTS9gwhWrkpScEr6chFmcewrn3Y0RmT28waQRy5pvxKvEfXNQuM98TXKu6CDzyVeYPey3fE5cIfBY75SQ09H7fAa/10SXnCtMigh20676hLmNsYekhye2/73tw4pdslZnS3dHqptzWIxuET0KJ8BxWrcRV3g3zrQdu9DKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089648; c=relaxed/simple;
	bh=Si4UjvfPUwDzbV1bAyZ0OYQfKIOIZVd8ZoJF4LQ7qDM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rsKJyro02VAJ2ewkTSMIZSpQ9HkJ+jiQcxJ85AMaqe8T8WHEnvhL77TG/8KF6yc/5s4D1NL00y/2SSDpsRT/zhnxXkFbJc+rysK+x930t3fqRvOB4T4zzaVulyYRbsPTk9qRb9gwBLoLySpoCmGOOF0UCck9+IYnArSICGVVzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=IGNtBUeq; arc=none smtp.client-ip=178.154.239.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="IGNtBUeq"
Received: from mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4f41:0:640:844:0])
	by forward400d.mail.yandex.net (Yandex) with ESMTPS id 2284B807B0;
	Wed, 06 May 2026 20:47:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (smtp) with ESMTPSA id sklrQR0S9Ko0-05q3CWeL;
	Wed, 06 May 2026 20:47:09 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=noirlang.tr; s=mail;
	t=1778089629; bh=CLpE4LX48c7c6b5vbvHx/rScrCfB+dhcreEV6LPRJvI=;
	h=Message-ID:Date:Subject:To:From;
	b=IGNtBUeqQN1AXtInK1CW1RJptr4/gzB+AIKuRF8Nw+i5ZFJRnejuhHdmHy/+C0DzO
	 TD6Rvl8IaEJHwmOllGNRz3Y3ihjafGofFNWETvUfqoHXkIRFBvhrTlTCPbUrt7MdAr
	 UHpR9T5K/z4QZvpAPk1PzdtWAObsZ4/o3qOq1U1U=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net; dkim=pass header.i=@noirlang.tr
From: Melih Emik <melihemik@noirlang.tr>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: dma: drop placeholder TODO comment
Date: Wed,  6 May 2026 20:46:37 +0300
Message-ID: <20260506174637.22687-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above Coherent already describes the outstanding design

considerations around device resource lifetime.

Drop the standalone placeholder TODO marker and keep the explanatory

text, including a minor wording fix.

No functional change intended.

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 rust/kernel/dma.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 4995ee5dc689..60c458adba0c 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -580,9 +580,7 @@ fn from(value: CoherentBox<T>) -> Self {
 ///   to an allocated region of coherent memory and `dma_handle` is the DMA address base of the
 ///   region.
 /// - The size in bytes of the allocation is equal to size information via pointer.
-// TODO
-//
-// DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
+// DMA allocations potentially carry device resources (e.g. IOMMU mappings), hence for soundness
 // reasons DMA allocation would need to be embedded in a `Devres` container, in order to ensure
 // that device resources can never survive device unbind.
 //
-- 
2.54.0

