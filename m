Received: from out-06.smtp.spacemail.com (out-06.smtp.spacemail.com [66.29.159.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5805137FF76;
	Mon, 29 Jun 2026 03:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.29.159.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782704705; cv=none; b=RXJSSWtPe3dalAOGBZA5IzjZrE8icISKshC6zCus5NFJZU4ckYc/gl7y4MBX8MYTWMITPNoKbaBuzqtQt06a4zTIpYhqw3EMm6ZNz5KA6pQIGFYY+9rWuc2RwxyQBYYohCLz5alF9FnVtnp9lnf880aiKI5rUrfB1OKFp/THU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782704705; c=relaxed/simple;
	bh=okKxM59CE4/G2xX4raBSlrCkbSnH5+WESqBKuNIdq1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIUCI1zsKUezCvIeulDQOq0MbfUfTbBD4E4k77sF9lwmPZd1PhroQ7rP4ER8FrRVDlRB91x9AKw/CFLIV/EF9JOIhjkUA7t9Pb1m6aY88pmEGFGGp3FJpkje3psW2UO4JGEcdZIWBHotTaSgvxs19yDLwW8z/wQvZ+XAsK5MxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=mHJDmukg; arc=none smtp.client-ip=66.29.159.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="mHJDmukg"
Received: from [192.168.1.96] (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4gpX78520mz8sbh;
	Mon, 29 Jun 2026 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1782704311;
	bh=vyHdIyQGWD9zJBic852muetfsygYSW+BCtH1XnAbMTU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mHJDmukg/yuC/3MQOVMDJETsHa4Wvh88erkOpCvPts0Huj9qZLrHgY8vpF6ioEYaA
	 aIFgHzyDg2unc9n8WqLPZ3pwh1ZsI6RTEYsFnJL2/pRRldQnQW0q6Hd7RiGMtPUzig
	 bLzd3WHQLiMdXkw778RFLwBqWxodnH/S5vszAHpSQbjX7VJyAAOIkJbBykYkp8E9to
	 CVA9pk1sdPuBipgpDfi58vs+3yMCrHLWSMyYuyDtn4JDvRaTMA0B4+VnBMf+uKLr7c
	 FktZdsJIGJOI3qrfAFy47T0Rss1+kKqCC8zA4T0xH8Y0rcSkRL/xYyjRcVdue1elc5
	 Cc3pMuT50pZGw==
From: Guru Das Srinagesh <linux@gurudas.dev>
Date: Sun, 28 Jun 2026 20:38:16 -0700
Subject: [PATCH 2/7] pwm: th1520: use vertical import style
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-b4-rust-vertical-imports-v1-2-98bc71d4810b@gurudas.dev>
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
To: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Jens Axboe <axboe@kernel.dk>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-block@vger.kernel.org, netdev@vger.kernel.org, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Guru Das Srinagesh <linux@gurudas.dev>
X-Mailer: b4 0.15.2
X-Envelope-From: linux@gurudas.dev

Convert `use` imports to vertical layout for better readability and
maintainability.

Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
---
 drivers/pwm/pwm_th1520.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index 3e3fa51ccef9..3e4524a1910b 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -23,7 +23,11 @@
 use core::ops::Deref;
 use kernel::{
     clk::Clk,
-    device::{Bound, Core, Device},
+    device::{
+        Bound,
+        Core,
+        Device, //
+    },
     devres,
     io::{
         mem::IoMem,

-- 
2.54.0

