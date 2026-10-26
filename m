Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032876;
	b=v9MkU8bETlaDwjAGVzK2ObzC7aOL7/aLySaO0Fbl+3A6BuQKaMduxuU7EC2wGeDKsBJp
	 Hwx4iJe29i0vj2TUGuWVana3ouOjWtwgYcyoTH59LjYLIbg1NbG0lhO3wMsw6POu6cBaw
	 KeHH7bP2T051ge8D4MBrqgWKm9xuvuCKC0O9pEPUxQLW1f0wjdpx8oVq2VY5YhAYvnUjc
	 Gdf1+H11sgv3MBuZGuanbtsdOu3w472DEP1w1EyJRZNgPGgKxicbvhi5mgypJ/HIF7MKM
	 J0Xhs406FQiHLYZ3U//nUXm5+e7DM+DWL3EnsdMyFqq/04qbseGysbqDmyoA32Mnt5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032876;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eipZCh/aZVOWGyKk+tem6Pf9Se2oB9+JhA06IxGI1NU=;
	b=kdOsCURSvQcRhBxYiWFtbqP6Oac2o9a2WYVHN44tNg1HWosjDYZx+HTFjkCIi2+1Cy8N
	 PKu4w5t3tioV6Nzdudpcc/awrC0+cdyGlc2EnB2qS9MTmc51hWb2Z3Kqb8oIUqd5A29w3
	 p/trHgKT9uS68vx1x/6HMRODqp6XulSTo5vzM29z2cKofMDSblnmtiIIy2adr3iV7AkWx
	 93s0B1SWv38Laa7totaSzc9Ngmfto4YHcfRtQoHfQzHwpHn+vDM3q/3d7rvgC7LMkt92y
	 549Ca8CkOyEnVfoxKUMzSXdqPSmavN2z04f6W5BmxoQ4K/aMGpUntBEPHr2Couxbncw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZk2eRta;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71899606A33E;
	Mon, 26 Oct 2026 16:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GZk2eRta
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793032876;
	b=M2v7/uLXjrIibhiSjrFWhBeGfeoX23DJ8A9DD8KaPrQ1nUONuIX1ZeMsHLRIkcGtM4Wi
	 k2BYIaE8tje9o6Rl9kz5FnYkcCG1gJPQGaLsEe/qsoULEt6r+fo/VpWeyOQRotAkxIuDG
	 32aTxU63PiXUOaJl6y0PK4AQhpviE+jjR6MPuX7AJWI/seoyDSVy1lWEh/X5+AWwsVKxj
	 BC487XODHD/4zILb3cKdg4UOc4SBhZydq67bGK+WabKUBLQcxKlxaiT9DqraoAPVPglnv
	 qPFhdVgJuzp6er8icDyByqlgND+wuwIRmrDW+z+Jj2MKHMKttYoltdKLzBTUxzVLNZA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032876;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eipZCh/aZVOWGyKk+tem6Pf9Se2oB9+JhA06IxGI1NU=;
	b=dVt6MxzrTxqOS3XR2it7+XPTWKpDWZCdYrClAVeAwepZI2WRcSXpp26Ks0G5ddKy1r14
	 oF4uksAmLWbkhVNAi7BrjToIQVhDHXooaHa/Hg/TcyKa8B9oBjIDG0BJ12PsS3faQPRRy
	 x8nP9v5Kq0cijydx2U91b0k6pHS2VrfMBNdKFqYvq2RiWIKpn2O+d8kgc0j9fdaMd/PT/
	 aBREmMcaGPHphO29EUyMozQawPHWSN+kPoQX3z18x4KZsCl+lErCbwmkApsxxk86G3HTF
	 kqD0LbAHrCKQRnoiKx+n5qOOfJrqE+nDvXu8jcOM+CC6y4mZ4AOEwItrj8K7qwcqKCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A1C791F031ED;
	Mon, 26 Oct 2026 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032876;
	bh=eipZCh/aZVOWGyKk+tem6Pf9Se2oB9+JhA06IxGI1NU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GZk2eRtapGS5gm2DVBMNyKh1xi0JEqiln9HAe8e0hCKDIl6O/uivCP12iJFg+jMR5
	 OxS0UW/VK7ZVdlpll/rAlq28eHephi18uJicGI+uCPlHri1S2zkUpFffegmsx8eZaC
	 xXlh0bQ3DydIS2Xzs/Vfui8NWzrWpGuc5l6IjCndZEd7R8oi0TcTvGkUa5BGm726ZK
	 hFX7Frq30MKnzKVFAF1boOM5DNMpxffX52YLkhDektmOqXCehr9LGl5+dTj/Shv5Rz
	 t7jjs+EJ2lZZ4wNpkMIbUkHQ4mlcnNik+JX1/qgKD9a6ds53mPkOkNWtqIy3fkA1sz
	 +5EpnZqRvoEuw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A38B444DE5;
	Mon, 26 Oct 2026 16:41:12 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 27 Oct 2026 00:41:02 +0800
Subject: [PATCH v5 09/11] rust: device: expose the device DMA attribute
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-tyr-ioctls-v5-9-59dfe98cb003@kylinos.cn>
References: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
In-Reply-To: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793032870; l=1995;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=mEXxKt/y8TdcnvMGSXY8Zt74eqKKEsHMFWEDUBLN0a0=;
 b=AsEhT8VpAkFvbY6l+fE2yrMMmciiO5Rwztn6IFzDXjTZbMvqBNdwfxkSCq3jeCtVlH19kZm08
 jrVIHx+blJLA2gB7f151h+WbnzZH1kSwhA8omNDWm5f/6rUzlZ6W/pK
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Sami Tolvanen <samitolvanen@google.com>

A driver may need to know whether its device is DMA-coherent, but
rust/kernel exposes no accessor for the attribute today.

Add a transparent DmaAttr wrapper around device_get_dma_attr(), so all
three attribute values (unset, non-coherent, coherent) are covered, and
an is_coherent() accessor for the boolean case.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[ Replace dma_coherent() with a DmaAttr wrapper covering all three
  attribute values. - Alvin ]
Co-developed-by: Alvin Sun <alvin.sun@linux.dev>
Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/kernel/device.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6849e..d5bbebdf620df 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -260,6 +260,30 @@ pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
     }
 }
 
+/// The DMA attribute of a device, as reported by firmware. A transparent
+/// wrapper around the kernel's `enum dev_dma_attr`, covering all its states.
+#[repr(transparent)]
+pub struct DmaAttr(bindings::dev_dma_attr);
+
+impl DmaAttr {
+    /// This wraps `device_get_dma_attr()` and only returns `true` for the
+    /// `DEV_DMA_COHERENT` attribute; no attribute or `DEV_DMA_NON_COHERENT` is non-coherent.
+    #[inline]
+    pub fn is_coherent(&self) -> bool {
+        self.0 == bindings::dev_dma_attr_DEV_DMA_COHERENT
+    }
+}
+
+impl Device<Bound> {
+    /// Returns the DMA attribute of the device as reported by firmware.
+    #[inline]
+    pub fn dma_attr(&self) -> DmaAttr {
+        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer
+        // to a `struct device`.
+        unsafe { DmaAttr(bindings::device_get_dma_attr(self.as_raw())) }
+    }
+}
+
 impl<Ctx: DeviceContext> Device<Ctx> {
     /// Obtain the raw `struct device *`.
     pub(crate) fn as_raw(&self) -> *mut bindings::device {

-- 
2.43.0


