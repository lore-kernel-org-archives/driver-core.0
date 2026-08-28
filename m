Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF3322DB7
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 01:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881961; cv=none; b=R2dLNaGofUqGXCqXK54cpfwUIMwpw4j7lgzc4U6A7IhvBbHo1SYhk0Kebhq/LskEjDBLTv9+T+MU/WLVnzZr2wahLgBKCXvoCUTxtOmEJPPwB9nbxIGyaZvjs4T7wT8ly98WRf9zXpgC+oh0CiUdXWlcGASuCNipYtoyD3SxktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881961; c=relaxed/simple;
	bh=q30dBEXeI8fNqG2Fhm0SNCEmhwHt3HVvGwgctzlo228=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoCwf11CDafxfmazul/G59WpkFGe0nbyrqIFCvfI/U/wIX55fCNQjE8hw0AtwXHxPI90SqFxLFxAqOPK4CZkGmqxGDLgH6TeH42vQyzB/APTUq1BrXWrerHdgCb8m/VzerlsO87vrjJGvp6xamufxKoT5FwkJEZtOvT2xBbvFJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oOwdp9Kk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oOwdp9Kk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so604424a91.2
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 18:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787881952; x=1788486752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zu+RxARiDBgW38W1dKFU7cEtIABJ2qMEIV7Sy1U5J70=;
        b=oOwdp9KkM4mPSgoyOMWuJz7O1LfI6JJaU4ZvV1+DkkTc509z+n6t2XrA8Pw6GQ5UVr
         D31YCl7W6dm5LP1LkFScdLRoyWXvkiHXwjMrWnewDJYz0ZCKQZUelDIR/B0G5I0ODyJZ
         8b8M3hISSn41YmtfAJhhR9mRcdPrPg1K9qabYuBjg88qGHwlSNCWNyH6WowSga9jivUr
         CufDckxlrxVxPO81OapSiABQjkdShrRPktNAomBWc+eBSw/W2hL/0h2jQJsGWE+BsFr3
         gGI0JEI7V9NvGsTHSLcqFvvwyPam6LdL56t5iO5nGQT/6/WjrowxWEgxKabDAxxTK2EW
         bs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787881952; x=1788486752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zu+RxARiDBgW38W1dKFU7cEtIABJ2qMEIV7Sy1U5J70=;
        b=j95IgogFQl/cIicRtgPnRxHmXhh9I93X7h7sftJLujoYSJcJPL2IDeDBKxMC7ndtP+
         /vUPAAC1GEe9hPt8R/vyt+D1VxMncT22ztGt2s/OCGWiHua+E3UqhDbGVkgEbyq8kihO
         732krJFgV0qbQ6zUiPmuCGpcau7SAl0gx31ZW9TjB0m2mfWyWgif/1cD6SXxXJfNi/9r
         IEYqHJ3S3lBJes54hx1rKrRGGnyZivssfaxTqbfwIugTgqOOKCQr0K2M0PV26Xwk9hYf
         iiNk/1mbOQgyoF09Hib6mcjbrFEUT2zuHgyNDz8MwBOTWe3gSCoLCF8zIm/7VhRRqfrR
         t4Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqBYqc1ODY8ebW/oKcxza5YFXA7F9c4DJR6J+/NDlULHwEfl1JHJOiYkdSH91aliMg4QWxHqvm12BXh9A==@lists.linux.dev
X-Gm-Message-State: AFuF++k4AX9GPqX6ESwi/ktBC6dHmgubn+bIKPMsOoSYeVaOOqNXIm3Y
	wGQ00imVIuZrNVhlA3mTSdt3p5UYeSwfk1wwnlKO4/HiGFKai2Oci4y6
X-Gm-Gg: AR+sD12OGiMhe3AOF/VbtoQ+ZYgUlwR6RW5xo/YYKB4RgoyBTqyyA/Sg4DOyMrbNIkJ
	sST4+mY913oYorQmC22Q1c7mcIu/8Ds3hzLww0XZ9JqYV+2S0JkDjF819CTIb4cVmbL4KXGOahN
	4MdeHEFGA3APr/lXg/JpI1+krOTHdD2g7LsQ9ujStWdrS8MdXruMBX9yPZTGFgDo2Z8CJTcRJ49
	8nfdO9rlAlF9dspFrXHBW35Ve7GiJQ5R3Qan2rmzPXXx6enws3nM87uHNBuY3Lswbws9XPpJoFm
	wVMeTB+fFpOnilnumj4nUeZL4eTjwS5KX3y/UqYWkDgd+3hKVGObZd3gzNehmK6b2xwbmHjl4zn
	jXGbekzdzq61K462a5SZMmuQWjYhGLZNVofD47KEt9qKc18NlmQ63FhjuSJdiEzZd2UknaObZj3
	EvG990aG6xhuXToFu3itHPwKsSPn7Cx9fUx9I/iGtZVemuSIGlh70/6Y3spO6Ke6YtYRkjI4CSP
	Dm3lw==
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr6224769a91.0.1787881952077;
        Thu, 27 Aug 2026 18:52:32 -0700 (PDT)
Received: from main ([176.237.234.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d2316e21sm603674a91.2.2026.08.27.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:52:31 -0700 (PDT)
From: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Subject: [PATCH v1 3/3] rust: io: register: add missing newline in doc example
Date: Fri, 28 Aug 2026 04:50:22 +0300
Message-ID: <20260828015148.221737-4-mehmet.mkoseoglu@gmail.com>
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

The `pr_info!` call in the register module documentation code example
is missing a trailing newline.

Add the missing `\n` to the format string.

Fixes: 20ba6a1dbcb9 ("rust: io: add `register!` macro")
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
---
 rust/kernel/io/register.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index 03dfd2ff48c7..31e084a4aa9f 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -71,7 +71,7 @@
 //!
 //! // Read from the register's defined offset (0x100).
 //! let boot0 = io.read(BOOT_0);
-//! pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+//! pr_info!("chip revision: {}.{}\n", boot0.major_revision().get(), boot0.minor_revision().get());
 //!
 //! // Update some fields and write the new value back.
 //! let new_boot0 = boot0
-- 
2.55.0

