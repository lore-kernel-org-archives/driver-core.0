Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09673D5251
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775251750; cv=none; b=dAFnC06YftsFmx8F8E1uNo5rJ2fbGh7T6w2yIuEIdq1sZvAdA+0c7tbLZiMZbL8rHaPmmygQMSwnFtKjwIC+XUBae2GEUXxUlp3noc/rDNEynUmHGYZaCTr5Kk4Ht+i41mkZFWmGGHxbLEsJBGrLkjso8X3EMvHVZxzjlm8cDB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775251750; c=relaxed/simple;
	bh=Ox3UuQdkMKEHg6JNiBb7kjGglPmNTah85JmC94qLAOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfrJsyyYKyP96BkBi1Uvo32nIOMrppCdtlTkVak6kWtX1ePDpfm5YGPG91t0/8rSyeYRfytpMc3fquLWjfIYXqUXeVPq1hWTs/otuum90rV7qWCQH6t/vOokKTtGdtlr9fHL6+FZbLkYIMA1TFWhx35YijgfFKdlmFc54RrI1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KANzEM+U; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KANzEM+U"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1274204434bso2710518c88.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251749; x=1775856549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ViRMffOfOvJYtVVzDZMmnf1RPEi0BVW89hSG6CnDeTI=;
        b=KANzEM+UCj+8FTZmAjrm4c2EZbUAr4JX+BXSafZtUK6D2vn4oSuTEajb8Zl8xL2Ibp
         tgC8u1Re7z/SDjV9/yLRSjU0fG52MfHoLe4EDZKcaJVtknylK/xoSH4AWFQVq3UHLv7c
         SCri6cW/PWv+iDvUHV6Dd3O6wl9O/0sV1NZ32tfvqJYjzbpP+aYbLJIY++WoSjrUimK9
         X+si7Feq7csWfLbjsdcjr7qVljrBUju4FgcrNCi9k8rCbxRM6gJH2fBrCicz64QKkiSq
         D47Pw3as62F9qEQi4Otu/syoJZMCO0BXixtf0ttj96HOihtgxIh8TMACDXBGFGWnuR3p
         G2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251749; x=1775856549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ViRMffOfOvJYtVVzDZMmnf1RPEi0BVW89hSG6CnDeTI=;
        b=iTeDpjNtUs7jQPPYCud/MN3d//r7RwK/rCaZmfR0NTUs5xZyb6dSNeO5we1flOXQPX
         5VyyLaaIVJaQd9DpVFw3xI69afsrsAvW8SJKZXgAewUjNqZjTtPpRRQy4ww+PF6qyPRD
         GQbemVWBoU5yzh7WztU/gCWFCDW7uY3YVtIF0PvnMNrTZk9fMsI1U/rHtIBkEyDGuLyZ
         UOpS1UCQQuXfRGy2GI1TR34HV3MFJYflmzP34mG+w7Ou2MrkXmACyGHvg/rTz08iumt8
         NvzXQ3MasR2vGkXTV0Jvc7eWWCKzKfP7gkv2CY7D4ekbkcC5BmNt6OoxvRICdNvRdN/k
         GkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7P5WipIo5gu3xPZWyCeZOitmktRLnoTt3DSDUVd0UdE8FAlw1r2qJZjXgfsGoTCrf91QkHWYq2wI8/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlg7vrHl0ZFDCubj9tH2PiyFnBwnQ4oGzv+ZuwLMs/fXdkhc1x
	2eu/diXuhJXEEN5XWdqd+YkzIpYE2QK78xmnCbizkLyiD1Hx2XJjKvx1
X-Gm-Gg: ATEYQzyP+vy1CEnB2sm9adx46RHIGfVfp15WY4dfLnHKj2DQF3Q0j6GR/2zt+XARsQn
	aShFY+7yld30yvdoNTtjpeBWkGVSnQWWB9vXCVJmXekJ8TRc5rb88uxKOEEeZXIsK9fFZFPY6rp
	xuoDqT8af3l1fbp6I7O+Cz0ISgPauYx8IbdNiJbKWW4KRrCalowzmN9nEK6DB3yWSuwIdhmGq6Z
	/bdVPiyeGN34Ycc/HDp/Yfbqn5mP/xc6F1dre8AJf96vIolm80ewIThETDxQVuVL12ZFkkFa378
	T+YjRmAcgKieFFNNgeLDgfYNqGK7IYt2VEV114rXQIBcXMY31nz9i4TLOksFsVfiVVxHLmZB0cE
	+ckcepxU4heGBVpp//hyniyiaiEbnFZEw3TH19anRP8j+5Udcrul3x0frzDNtloDUB6HNdbK1+v
	btkfXr3JBae2FebXuhsZ4cuTkmI7nnjbLTdf9gzN47ApZwRooIRrVO1yIMLqz8rTAvaQSFoA4Q
X-Received: by 2002:a05:7022:927:b0:12a:6d05:3941 with SMTP id a92af1059eb24-12bf0599936mr3116316c88.2.1775251748584;
        Fri, 03 Apr 2026 14:29:08 -0700 (PDT)
Received: from ar-pc.lan ([2603:8000:bb00:9b3f:5094:4d4:5bc0:f9f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede7f542sm5462263c88.14.2026.04.03.14.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:29:08 -0700 (PDT)
From: Aditya Rajan <adi.dev.github@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Rajan <adi.dev.github@gmail.com>
Subject: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size overflow
Date: Fri,  3 Apr 2026 14:28:22 -0700
Message-ID: <20260403212822.294288-1-adi.dev.github@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In alloc_slice_with_attrs(), the checked_mul() guards against
arithmetic overflow when computing the total byte size
(size_of::<T>() * len). If this overflows, the current code returns
ENOMEM, which is misleading -- the system is not out of memory, the
requested size simply cannot be represented in a usize.

Return EOVERFLOW instead, which accurately describes the failure. This
also distinguishes it from the actual allocation failure two lines
below, which correctly returns ENOMEM when dma_alloc_attrs() yields a
null pointer.

Fixes: d9aee73c56ee ("rust: dma: add generalized container for types other than slices")
Link: https://lore.kernel.org/all/20260320194626.36263-3-dakr@kernel.org/

Signed-off-by: Aditya Rajan <adi.dev.github@gmail.com>
---
 rust/kernel/dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 4995ee5dc689..179bc8832947 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -832,7 +832,7 @@ fn alloc_slice_with_attrs(
             Err(EINVAL)?;
         }
 
-        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(ENOMEM)?;
+        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(EOVERFLOW)?;
         let mut dma_handle = 0;
         // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
         let addr = unsafe {
-- 
2.53.0

