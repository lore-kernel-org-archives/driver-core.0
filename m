Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E1D3BFE4F
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133604; cv=none; b=fH9Q51ZLYwkMSkhKzc87qIE47vTIn6vF9rvcZjoqtmTOFGDcSlLsTlgavWZwEqMsANThzRn59BfS+TuU0vJtQV/3tOacB83/uLVFqHMNXLB7OEgBNtagC2ZGGwPY/9Lzfrj/wupHv/gXTGmLvAje+DvZU2YLm+/RhuWz7+m9/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133604; c=relaxed/simple;
	bh=sLbxFTX2mTYV2vSHOwak0YCZYcQva6hVw82FQCeYKlk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=glARXJ22z6fwxmG+IF1isxSohj754CRq2ExPInPb/03xuM168A03lIALSnV/zYVzp247Ux5IGh/rXJKA3eyhJ3HYIkZ22DCfINBesf/ZjiSKsGTdGFaQrxtztB8XoWwKUcmI82lflVLXRZgfiG37dYDTV7Dzwlz6jICr3trD8LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t/eijnPN; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t/eijnPN"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b795cff830so18085150eec.1
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 07:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133602; x=1770738402; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yriD2nT/Os7MHztKIgeqU92FBaPsLQ1akZyLJCP9KTY=;
        b=t/eijnPNwewkLf59xL4CM/jKfPJXxpT6GuUUDRFbLMO2UgnAU7C7/qReG3o5cFV5zA
         eu8T54pfUVjnMHpznJognSDh0pIW3+BixwkUd2GOUZorTZQLy3+l5CeGYIBRBHF9IMa6
         ycb+XOAJxZTkfhDC6Dx55alClcl01nx6qhGZJ9faB3IpQxZf9IbRpzoXie7bZ7+eGxQl
         GUBDV9LCmeGKQbSQ6mHz7tWxJ1id43oapaWSj1AruDFcQZzZ6ioJY1ObJLYCm1JyfgUg
         u+/Ntb5ErKP32/URLnXZ7GeXboOHztOD67woo3WGeT2n7DH38OQ9cuexYgy4LuGfmMg9
         vb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133602; x=1770738402;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yriD2nT/Os7MHztKIgeqU92FBaPsLQ1akZyLJCP9KTY=;
        b=Vcz4ETEIZz/RvxjvYg4FJ71SudWCmXeK3z7MAKPFTgvUz8PKYe0kKs5Kgw4I9J31tE
         hBVvl/jLJoHi2jyktELNGjM81BCL3ewtBzioFUqLKtySaub9RVJW8FGBJEeeugogZF9G
         Pw9qGyyYxPTqHhO+U5Ri4mxcUiGcAV0il7eloCJ5Ortm888F5p6GSS8FBLQSuyux8INi
         EH96IJPmA3YrlpYIa1i1M5H2tPZyPJZlfXXAKXsOyZ/PD91iZAZTr1VGgCNwO7X7HoBn
         xkNhLOQ4zQkt0+xQX5zo7C26lQrRS5AP4obxfeq6kjd2lbCyUj1HsUPsQ2gPxw3V/RbO
         Cu5g==
X-Forwarded-Encrypted: i=1; AJvYcCWqoId4zxnmKm0kDBnQkTe9bkctI5MX5ZelYUCc7rn9HdXQqX4fPrszEzhsySZly0sPwSvFMpV+PsuqfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYZnEmjmp4jrgTqpdwu4J6nBpwRqUIGKcIXdxjg4fdNPKuA3Ur
	/pDgsPYMb11w+arozGd2LCGIQiIiToHdKvDYS7V0ZJHBJmLYTcPKVF28demZsB+TfitcKO1HYwK
	damOWNV8bQg==
X-Received: from dybhk18.prod.google.com ([2002:a05:7301:2892:b0:2b7:d91:b4a2])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7491:b0:2b7:f28d:c8c1
 with SMTP id 5a478bee46e88-2b8327328c7mr4126eec.0.1770133601984; Tue, 03 Feb
 2026 07:46:41 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:33 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=1096;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=sLbxFTX2mTYV2vSHOwak0YCZYcQva6hVw82FQCeYKlk=; b=lrUfeO8BzxGoH2q0cLzXZitIHc5mxhrmhIP1EvIGlTolROpSubzosdu4ukDgERhXMbVdgqt6B
 hy4MuPfZ3YMDwryq+n6Z7b1/52uJBUTXJBD7xC/OlPQKkhC26hmI+cu
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-4-d6719db85637@google.com>
Subject: [PATCH v2 4/6] rust: auxiliary: Support accessing raw aux pointer
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

While it's preferable to add bindings in the kernel crate rather than
using raw pointers where possible, access to the raw aux pointer is
required to pass it to C interfaces provided by a driver.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/auxiliary.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 93c0db1f66555c97ec7dc58825e97c47c0154e54..1a88277f0fd9ea5ff32cc534dfe5682009de94c2 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -237,7 +237,11 @@ pub struct Device<Ctx: device::DeviceContext = device::Normal>(
 );
 
 impl<Ctx: device::DeviceContext> Device<Ctx> {
-    fn as_raw(&self) -> *mut bindings::auxiliary_device {
+    /// Returns the underlying auxiliary device
+    ///
+    /// Prefer to add bindings in the kernel crate for any use other than calling driver-specific
+    /// functions.
+    pub fn as_raw(&self) -> *mut bindings::auxiliary_device {
         self.0.get()
     }
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

