Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B0248F850
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469931; cv=none; b=qHoV3jQkzKavyB3ShmZvvmFIDJ5cKvVXSXe4+CpOwLH2Ws9acYBmhGjtLMv64F51muzBk5ktHfcdh5GvAZxbO5Prc//1HSh5YRdZQOkYbY6sfHWx4eGQJAVtl5okrgoF9Qg4GZiuoTKBsibd2ErTCkDE4SZCcgacQ0g8qUkuAb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469931; c=relaxed/simple;
	bh=i5QrzP7qWJtfWpMzW5QTjus8a7SO6QHzqaznka26J44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L2FkROeb/x8LGX0MIV+kTE8Rwtq+zTnKMoADVBB+vu7eoy9bqb0AM2SXjExE8OADv0s3MZAF2RnyS3BuoVMLDag0Kf1hh9eAbl++HTr+5V7CnKXnebRAMmYK26n9pDpBjLTILmef1qdd+Yz0ZS/LYvgtaJ7DlZvSm2czjpmXHpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cz92qA6f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cz92qA6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789469927;
	bh=i5QrzP7qWJtfWpMzW5QTjus8a7SO6QHzqaznka26J44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cz92qA6fioPlVzTUYW3uf7smPF6DkbP3bnynZUSsXNQVikeMOv+zUchkxOfOr7C9w
	 ERVyhLnCtjLeHUlcx/WIkb4SEcL9YjacUUOyUyzjrqUn//0+jZ+d5Hyx3mOQO5B10G
	 vBhxUtP+SaQt0V0ij2IuG8g2/aE0h8xs5Q6FEZy1uOuSAKpEEViFmnuSVpckaHtwUH
	 5kafXN0kWw9vxPb9jpiTYEAt+KMJdXIC4Mw6WwK6LG+Y017/Q3feS3ugqFTX+FRsyk
	 sKkfiXMO5ruHOSRK1B99c9/OaeYmuD3ZmO8eybCF8hw+phyuofLKMrmzOzEoKqzDyr
	 TlAgP9A6D3hhw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4191917E0D49;
	Tue, 15 Sep 2026 12:58:46 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
Date: Tue, 15 Sep 2026 12:57:38 +0200
Subject: [PATCH 5/9] drm/tyr: drop unused KernelBo::bo() function
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-tyr-interfaces-v1-5-5d28f1f75aca@collabora.com>
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
In-Reply-To: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 kernel@collabora.com, Laura Nao <laura.nao@collabora.com>
X-Mailer: b4 0.14.3

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/tyr/gem.rs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 6ae4e71d3cbf..9a75344acc3b 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -142,10 +142,6 @@ pub(crate) fn new(
         })
     }
 
-    pub(crate) fn bo(&self) -> &Bo {
-        &self.bo
-    }
-
     /// Returns the GPU virtual address range occupied by this buffer.
     pub(crate) fn va_range(&self) -> Range<u64> {
         self.va_range.clone()

-- 
2.39.5

