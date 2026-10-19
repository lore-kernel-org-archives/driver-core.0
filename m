Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452898;
	b=BMBJBZVTJgS/iIZHQUNBMk0SgqWU/4Z/Q1Qz+YP58wnjdBdyZojYgA9ctWenQtci9f9S
	 847XwZFqSMZirIeNRz5wt/bpznEE44Puyg18TMr6vQ+QAaNTCV/OOvW2nO8hfvhnYStVX
	 qJ4p4d+vHTFSVUrCbybJM502h/WxoxjMivkSgmmRAwj15XIGAOTHo5bYGu7B9r+FH0R39
	 VpQB218ZRugwKZ9GHY4AObeTVZEi1tXUAQxMIOG2GtBt9sShuwUzFsoR6yvGpD6h7ZRdZ
	 N7SHIDr/BjIHQagwHOob9NHlYuOi5u6e1MaOq2wohm0HlkbgbgAJblWsXe2BtptitfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
	b=3SJzO+h03LpMxQGD70ApqVDrOBliWgBt+dpFbJKIzeRN/rFM+yN0IpSlnlTW5cdY0QlZ
	 wqz5QlfVH4gpiEifFSbjWCZ8/KCf1Rq+mYraY/1X4T63cS9dmR0TgM9n6y5Bw3WiP8GhK
	 3O//yvZC7fq06XMxvssyDgtTYz98MXJuUItnkCdnaqegvCNi9CP9btL28oI2PxyylRwW1
	 rQSvOMi5X7vrNxOQzQliCtVZjQZBOtuXJ6xCvcUUUpwrgqsQmFzRJyLp4gNhIcLqDs9Yv
	 eSVcbHffjRrvOYC/jKoc4Ha6XtcByD+JrB4tB2qrIX7k6/mPubOJ/ITMsD1AgO8Sl7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tDiqVf4M;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBCE606A325
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 23:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBCE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tDiqVf4M
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-151ba226e1bso4327303c88.0
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452892; x=1793057692; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
        b=tDiqVf4MyZ7I2RXCVpq2eru6uneiQO3PqG2JoK+THh6XKxZ7hTL0vnBB5hfOyXTtw4
         RD/5FOpOsisObDbMjLktnsEljI2L93GVFlI/vdE9CLVLnKYtN7aYPhVj2XzmNkgS+150
         7DIfrFlkx1ihaMCZ7tZOhNhuJ/96IwguzflUA9CEXJeLl5/euUzoMxpXKfzWV1byzZk7
         ohIVksdR7GwytUKosUaHnqE25srLJOZAPD3Fuq7Upfj4BN1ZYLNxT5x/caas1Df3fhj9
         BCgxvvKDbzOQM00ONmjxOjjpjpRydqbYe4L/u25ZRupAfHLONNocRPYccoL2Rw10m4ot
         gQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452892; x=1793057692;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGwB2YpKzTsLsCyUbVgXall2WPAD+FiuQOyllj3FCWM=;
        b=s1dnR8b5+nceBc3X871J+0ZPXihBRq4lQjqiv10drFg+r9JuOnGNQv3yectTdtpAC0
         5/1o0d6BEo4WGd7onsb0BKVWAdcU/GhTNZUsPrSjrh9zjrCma8XJsjH+HxgOqeuc2ye3
         Bg2K08M8vO8PPIWzqNNC+bzjudgotvr5uCy33zsTQ5HwfkTsE95vXek5F9ZRWPfMttOh
         sYe7w4r+SrrhKaVsE1oKwL/cKDMCr4hdvvFr4yhZMpKr3BGoy/PmlO6pRnEdzxJ01rzf
         zPeGfzWuspz8PXdPpHzMMAZHMdQkTy/ZQ+YmpOY+KwyaMQ9ZXqRvPrqBxtONGMWW3ujf
         X+gA==
X-Forwarded-Encrypted: i=1; AKwUvBwGmbW0Ly7h+AOcz9mV6aHzdv5FWi9iRBGwYN2Ve8doLLnieJfmsVvVTHXeVyD1RqvZvPlXLnpjf2hzvQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJzCBoklVBzHKnnQruXRb13dvSnKe8Adzs4E/UlfwqFHip9Ckrh
	/cIrFtRiu7BQjJLckdaogsdvD3mQ6J6LFv6lQeivoJyfRgfW0MepHWiFwwjyyArsBv9UHd37CtP
	qYUapYKEPPbucXZmjfdqIUr8x3XdVCA==
X-Received: from dloo9.prod.google.com ([2002:a05:7023:a49:b0:165:ba5:ba2b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4189:b0:181:5cac:8f27 with SMTP id a92af1059eb24-1876658f64amr14367338c88.35.1792452891323;
 Mon, 19 Oct 2026 16:34:51 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:38 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=p5U1adkcwaI6ibDBmAfxywKhSDWSVuWmXkCqpHz9YZ8=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVoqtTc4Xnx1kdd/zrVinptqVnxlVkydJTO1Y59rBa
 P6JyedNRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIpFOMDA9UV7cLd7ZeCZg4
 947UWbsd1R1/hHqTVfas7DnLZiSucIbhr+RTjbzXCSlWskZPvlzj7Wf/Hsu18+jczVN37z3y7r9 lGwcA
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-2-9503472ba738@google.com>
Subject: [PATCH 2/3] rust: hrtimer: declare cfi_encoding for hrtimer_restart
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

The hrtimer callbacks return bindings::hrtimer_restart, which bindgen
generates as c_uint. C calls them through hrtimer->function, which
returns enum hrtimer_restart. kCFI encodes enum types by name even with
integer normalization, so the type ids never match and every call fails
the CFI check.

Generate hrtimer_restart as a newtype with a cfi_encoding, as is done
for lru_status, and adapt HrTimerRestart to the newtype.

Fixes: 8a8afe9349fb ("rust: hrtimer: introduce hrtimer support")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters     | 2 ++
 rust/kernel/time/hrtimer.rs | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 5059cc74cb3c..6003d5127676 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum hrtimer_restart
+--with-attribute-custom-enum=hrtimer_restart='#[cfi_encoding="15hrtimer_restart"]'
 --newtype-enum irqreturn
 --with-attribute-custom-enum=irqreturn='#[cfi_encoding="9irqreturn"]'
 --newtype-enum lru_status
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 2d7f1131a813..07344ed5fbd5 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -834,14 +834,14 @@ unsafe fn start(this: *const Self, expires: <Self::TimerMode as HrTimerMode>::Ex
 #[repr(u32)]
 pub enum HrTimerRestart {
     /// Timer should not be restarted.
-    NoRestart = bindings::hrtimer_restart_HRTIMER_NORESTART,
+    NoRestart = bindings::hrtimer_restart::HRTIMER_NORESTART.0,
     /// Timer should be restarted.
-    Restart = bindings::hrtimer_restart_HRTIMER_RESTART,
+    Restart = bindings::hrtimer_restart::HRTIMER_RESTART.0,
 }
 
 impl HrTimerRestart {
     fn into_c(self) -> bindings::hrtimer_restart {
-        self as bindings::hrtimer_restart
+        bindings::hrtimer_restart(self as c_uint)
     }
 }
 

-- 
2.56.0.212.g129ede20d9-goog

