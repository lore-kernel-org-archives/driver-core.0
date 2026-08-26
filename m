Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF00463B75
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761759; cv=none; b=E0buHS5FqHHeMrcPBU1DpO646jmlreKCslV3onDkiRohGydc2DFgqv5Z93TyC/+cVmR6SzdRkk+8Nasr/MrCF27CPu6uaaiFVJQdHFqggTCc89Y3YhWwpUF3dlu6gYpcn224a8mB9GS01Dcar8+GKUvoxzLRHMDHjm+mkDmn2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761759; c=relaxed/simple;
	bh=Xh594ZS85gUXvggyHKfotI2henUq6YClR0aeXlFsEDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBh+jgXqlDMiJooA576GhyMsKUlhoVBiJUC7CDUIuUuzUOYEe75CgGtF2QIL11gV58ysVNJEkuVz/CnAzD3c/y/GnxIPON7qIr0JY6ca46YybXUx3VqGl46JsztFn4aBb5vJqpJmb2oXTQckwC8qzjyEelldDsIeMxtl5ZbuVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=ZifKFlfc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="ZifKFlfc"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so907150f8f.2
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 09:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761756; x=1788366556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIlnj5dzuge9Y09JvuO0oI2LC/wGGksogWut7g+rsrQ=;
        b=ZifKFlfcd4oWyVqLimmoFO4pCmx9cOCDfEHSVk2Kew/l0UFPZmbYa+A7CpxGY2MteX
         gWTTRIQ6tF5aAHSs3trl3JoeNrexFzeej0RcakSGjY7RqnUbXvUkhrr7CDr8zrpYVV0u
         Z8SNGMOr6xkCzJPkO36Rg95wvCpvCYC0b2UuHhE2QsnBMVO9A9eHrun5Mfm2f9OzgTj6
         lGw9yRDloKepeofpD4kT6WT23dfQcRGrzV3piCikqNerIDYTZthYl4U1DCk5BOQ1HLSQ
         iFz4+QwkM0+FpO53qCVeOnX9ZIGccuMR8xsC3x9N5318OvqSTVmZLU7kiqcl8nKsBOJ9
         BKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761756; x=1788366556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIlnj5dzuge9Y09JvuO0oI2LC/wGGksogWut7g+rsrQ=;
        b=jL4JoqwbjAKtaeEz/rby4ypqF3qcLoaHtGeg+EoHpqox/SkEJNiLj9ahDecX+jqF+3
         qaPUIVQb7+m9X2HlCl43+5d2vGjkdm/m5EIl7N4B957VdDkh1QkPmlEQ1kkoXQ8W9CzP
         xfFvlrJU+GK2uXUiUc5L+0mXBH/VfioymBQG/rnvkOhg6bjym1r+mrePUUkKC48+BzsH
         cypZc6T73q0sW93oQ2LzFz7VaZgYRUqcYogNCMvFTUl7i8YNNqw+aEy+6MeTsWmpxDCu
         yBqBqtgohyrRhtUEEkirCVla4wiVr8vXQzDNdUHPttC2LV6t2di4r4SHw3hGTl1eRCp2
         DMzA==
X-Forwarded-Encrypted: i=1; AHgh+RqmtDvf5BLuRCj/rxsPigxSecBl+62o0s3/Vbo/d/egA6hfcSWTIErwHXQPlK9Aupj3Cmn+zQZAxx+Paw==@lists.linux.dev
X-Gm-Message-State: AFuF++nuXj1IuBNCsLVvVTKuYRRCY7SCGg/vXOeTf75th7fRETMhdBI7
	1Qy6jJ+YtK592vel+3V+UViCRl7u1v8aUONzoeKgfaJ04ar4TCeqKSYIYpEiS/wnYg==
X-Gm-Gg: AR+sD134z2FoAQgxt39KPi/co8Z40PzjmIEWjbLiF0wDpCSbrlRNE4P42LT6ufz7WQr
	MOAFy9maJaOp0qYAlOepTBhRG03wtW0M/C3Mir3/q0TAgJsomlxb9c79BQYZ/OXK5izt0e7VjZD
	aYGCZdEpv8qzSSwkuBnODF6wUBoFc0llQWQQTyJm8ywK9tiUqXyD8hlJ21r37h/axgIqD5avFz4
	BeNEb0zfjexg0ZB/4BL2//Llbiz325utzGg8gRagLecHF6Xnf1wsKuiaMe2iGh7/PcVWrSMuxAD
	hNwu09xvm5MJKi0TAFcuFrcGWiRRq42TxOj+iaR3ZuW4MUwnotRmtaPU/sNheUjmyz3l83F/1mF
	jXVqfwnTI+5hQmCaIHTNOYZweIgBFh6k25j3KZHmA4VEuhvka7Ev08Kz5SWKxs81ef7S9cAGGEt
	oHkjNm/QblmdSW9q04vip30iMwH7fsyal3Dq0l61yCaKX4y3S9x7z7295Mdrgsf1RraIoYlOyXE
	jYL8vaWzk5CWPadnEYCx7dtiyCtBVXIkDtJ0JCZWxMB/nM=
X-Received: by 2002:a05:6000:29ce:b0:482:de48:c445 with SMTP id ffacd0b85a97d-482e26d9aaemr7644532f8f.11.1787761756534;
        Wed, 26 Aug 2026 09:29:16 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab574sm3232342f8f.14.2026.08.26.09.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:29:15 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: rust-for-linux@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] rust: io: add checked offset copy helpers
Date: Wed, 26 Aug 2026 17:28:40 +0100
Message-ID: <20260826162851.2497-7-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826162851.2497-1-mike@fireburn.co.uk>
References: <20260826162851.2497-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I/O mappings often need to copy a bounded byte range rather than
the complete mapping. Add checked helpers that project the requested
range before using the backend copy operation. This keeps raw backend
pointers out of consumers and reports invalid ranges instead.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/io.rs | 50 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 95f46bb75f9e..aea346b8b79e 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -225,6 +225,30 @@ fn io_view<'a, IO: Io<'a>, U>(
     Ok(unsafe { IO::Backend::project_view(view, projected_ptr) })
 }
 
+/// Returns a byte-slice view for a given range, performing runtime bounds checks.
+#[inline]
+fn io_byte_slice<'a, IO>(
+    this: IO,
+    offset: usize,
+    len: usize,
+) -> Result<<IO::Backend as IoBackend>::View<'a, [u8]>>
+where
+    IO: Io<'a, Target = [u8]>,
+{
+    let view = this.as_view();
+    let ptr = IO::Backend::as_ptr(view);
+    let end = offset.checked_add(len).ok_or(EINVAL)?;
+
+    if end > ptr.len() {
+        return Err(EINVAL);
+    }
+
+    let projected_ptr =
+        core::ptr::slice_from_raw_parts_mut(ptr.cast::<u8>().wrapping_add(offset), len);
+    // SAFETY: The bounds check above proves that `projected_ptr` is a sub-slice of `ptr`.
+    Ok(unsafe { IO::Backend::project_view(view, projected_ptr) })
+}
+
 /// I/O backends.
 ///
 /// This is an abstract representation to be implemented by arbitrary I/O
@@ -640,6 +664,32 @@ fn copy_to_slice(self, data: &mut [u8])
         }
     }
 
+    /// Copy bytes from `data` to a range of I/O memory.
+    ///
+    /// Returns [`EINVAL`] if `offset..offset + data.len()` is outside the I/O region.
+    #[inline]
+    fn try_copy_from_slice(self, offset: usize, data: &[u8]) -> Result
+    where
+        Self::Backend: IoCopyable,
+        Self: Io<'a, Target = [u8]>,
+    {
+        io_byte_slice(self, offset, data.len())?.copy_from_slice(data);
+        Ok(())
+    }
+
+    /// Copy a range of I/O memory to `data`.
+    ///
+    /// Returns [`EINVAL`] if `offset..offset + data.len()` is outside the I/O region.
+    #[inline]
+    fn try_copy_to_slice(self, offset: usize, data: &mut [u8]) -> Result
+    where
+        Self::Backend: IoCopyable,
+        Self: Io<'a, Target = [u8]>,
+    {
+        io_byte_slice(self, offset, data.len())?.copy_to_slice(data);
+        Ok(())
+    }
+
     /// Fallible 8-bit read with runtime bounds check.
     #[inline(always)]
     fn try_read8(self, offset: usize) -> Result<u8>
