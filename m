Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F87B314D37
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881943; cv=none; b=T+dmhhcWBRaPg9SU6X7t9mco1w24GAEsLf7D3FL013kofeGwNz7LUdqVXcliPspYIK6dHVC+G2MGA9KzJfoYJ/Ze+1XTvD+bPiWku+maQAhAbftuXA+Hnr4kygBJPlRC4OIHOpRbArUcw13azZ/tFUEbrxNkw15LHLWuxT4A8x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881943; c=relaxed/simple;
	bh=WXS6vakLdU7L83PfcH4phfkIOBuzvYI+wtSQFxoREIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9q31KezS5FaiHDSZr5Gc1i0Hx9ttVrNrTw73KJqPG0L93FoVckNhgqihIVhdrgOylaYvxh4jiX7kNON9zHNFHuyk6I7aFaekrMcTQS882vXt4cF3rkq1We9ZQSfCOtn3gdhfkvsxS77ih6wJP+DLEEJ0BYj8xccyMOyaOBUrfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSQ+/9yo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSQ+/9yo"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so436827a12.3
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 18:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881940; x=1788486740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+4C77kmToqjwj4xCnglFajcSc9AFnruzbKFWTqw9sUw=;
        b=eSQ+/9yoBQNxQPDT0kqUEgJSm4KbRbZuGEtCHrqoPfjkOL9V2HnHZPoWat6dqdhCmy
         7mrxd79Occ9HcTfJn4VTI99GZWHgFDZns9kmqF7kclaIKoR8yJ9l0+GAbAb78pPZ5GWo
         m0uVHwn0apMg4ggrqCAH7KS2UsRUnQK3SYSIN5aO5JOnJSObA+dXgSLSjEk9ChT3ou9x
         flkgM1A3z6t3xLlMG+ICluR1Un4X5XefIokqh33/dITDc8c/OUhgn+MzW2pkY553nNFp
         3PtTjVTUvw9zMUOHTqRfI37l517yVm6BNWmpHqbrr/EAXtfT5yQSWq3P7bQutQPpXVxS
         Wbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881940; x=1788486740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+4C77kmToqjwj4xCnglFajcSc9AFnruzbKFWTqw9sUw=;
        b=qmHtftBCaHoM1SBgsYFtQ1OEVvJaiMJ1KjD/5IuzNPeulwwPo1zqrD8FQCtm7xvRdz
         F8i5y+b0Uh8M+XWivziECjkd4eGsA0UIWUqycS8j3wKd9jhNAlsY4YO8TuUCne+5KitJ
         TjmdPgg8VIAN/DtGlCuvlDzQBYzpMCM6+cyc3S/jIK1lqJG5eMwUAvCGu1QWYz0HCrKG
         twYQrvhHSJ9Lucy0qy4WvFG6mM6d+dEdnezoIWUP7PuWUXV/5cmUmseGRtRKxs9vhQv2
         movowzrhXFx1o5brc1BdaCPVajKJ8YGyQf4nh2C3HIzk3vSnF0B/liTDrx0sYUTpNXe1
         K9wQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+//Ng7Zck0EUfhioyvmtoampKw+4h/qF2Tiint14MQvMrldukFXG4zLX7+/2r7g2HqlG1OnenvMMQRQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kJ3gt6IRFUC8b0RqWO9rlddXB+2/ldlxDjHRcvwwyyGR9rSKvF
	XF66qZ4autHt6CHSBQAnG26vrZ/bqyVhkkApCS9N8xw7YiMCGJiPruCcBbtrdGhDvb4=
X-Gm-Gg: AR+sD13c6S7A8cjW+W4Cbg1BeJkfQhTOZ/c6lWbGg26c8PwxeK7UMydigAtO3mLDhT/
	hnC6vWxQlNDhYAhY0GR4fTO3wwseSRXsBWsq8RJGxJpsthzyBNICHRHpl8PesweYsWyf9+ZTg1C
	tpf6+wD+b4ALrt/UAsX+QDONV1+LUAxKU2z8/xvqZu5qDjqk9uOEBuiUrjIOTk5I5d7k16gfVyi
	vx90HImqf0TJbvcVzu98A4vWE41ahQRk4sTK3joZBuyPElGgLRQkbR+AyfWZ23lGZuLcAqyrXFF
	6lJTQX2bk4tkHpuEgoOWkgSil9VzEiyJsiIvfDQRSXE59Dv3qVxDE1eXeJCIuQ9ELQBlZmWBJz3
	aGYdqcznrrDV4FmSNZQJoC1VV76yLzpnHaXnQsDbVGEHXW0ntnv86Tw0NjCNO2Z7FS/9FD/dwJ9
	5hh36+uFyBEyjaLDW4qjciNJFVXCQ2OEJEE6iaIIexvNE2yrnpXyOQJfrLT+aX3pqISZr1Puhaw
	Z1pZg==
X-Received: by 2002:a17:90b:2cc6:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-396d0d92cffmr7286955a91.2.1787881939600;
        Thu, 27 Aug 2026 18:52:19 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:18 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
Date: Fri, 28 Aug 2026 04:50:20 +0300
Message-ID: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calls to `pr_info!` in `arc_print` are missing trailing newlines, which
causes consecutive messages to not be properly line-terminated.

Add the missing `\n` to all four formatting strings.

Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc printing")
Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >= 1.84.0")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 samples/rust/rust_print_main.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 682207c81fc2..01729e87d6b5 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -23,10 +23,10 @@ fn arc_print() -> Result {
     let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
 
     // Prints the value of data in `a`.
-    pr_info!("{}", a);
+    pr_info!("{}\n", a);
 
     // Uses ":?" to print debug fmt of `b`.
-    pr_info!("{:?}", b);
+    pr_info!("{:?}\n", b);
 
     let a: Arc<&str> = b.into();
     let c = a.clone();
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use kernel::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }
-- 
2.55.0

