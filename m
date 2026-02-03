Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015E83C1961
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133608; cv=none; b=Png6yekF2B51hpKeam0ZeaY4pRG4Xl9e40KLSgWWKsWwxcSeMrP3FJ6fDe2gGUmq7glZ/OWw0VzfEV5AiFuhX4FifKtnVmrm9qHRGQY/kaQob75LJ46ayHHzCMIdVSoxFfSYk90bTwLruN7WhDnACBiGpW5Hjh0Do76AYAwGNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133608; c=relaxed/simple;
	bh=WtZdKvjX12D2Jmn1kMkn/+vs+NvlqXqrgcd1O83Ixd4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ts9TBnzaA5jek5KjUlgZp+t5iTPE3WPGWv3ZJYo2tcu61xRKK65eelWVN9oRCQTLU5lRWF2jB141urefnQMMQ+6u0DtrQw4RhxGrUodKKPpVbuPGI9ZRWWSw8G2gDsnpZsJDa6B3GxAWTGSWNqbVgo55ym/5lqKi5yrokrdnOmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NF+fxyOu; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NF+fxyOu"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-124627fc58dso9318496c88.1
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133604; x=1770738404; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wdhof5UcFa0LauNDEG7A5hw9JfGF2S2FIbHiIBJlkVI=;
        b=NF+fxyOu3WtX1kcu5gGpPSTq6GBWTSfRw7fTl86W7CbFyi8PVYX3zy9LTVkejCgGho
         7abO9AlsM7PjdFxek2V5orfU+/g/NXEkN6li0uX3Sn5Wj4nhMNBCZXoKZeCb9pzppGSK
         6QEVncl2rxvU8aJrkGDhT0Oo18arhh5q5v5RgbaJ1Z9Mx6YVyxtdotaCqFxDJ/37Dxc2
         iHSFS8jsuLfaODTY5Dv4DbAhAwVrAQr1fCfZR6Qw3St+7ss4YwPb3K6a5a4ytsxF8JIc
         SMmhPH0ZPfx1ZK9ul2J5s2z/Tqi2Dcwo6rma19fFxNGQA5jIUD+1ZqGJjm3GckHVq5mV
         7ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133604; x=1770738404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wdhof5UcFa0LauNDEG7A5hw9JfGF2S2FIbHiIBJlkVI=;
        b=ua30kB3fjQihet8KO3gjt8Nd0P4gdhdqQeigBrTzdLz8sEWZlnQ4cPtM8T8cmWNni7
         klYNbM3086XibTo0Y1Ge8cDjKw54c17p9AN52srdDjpxaudN+EyaXik3YV0Tr+rFqG5V
         2jDCUyWJ1wYfqav7eUiBEgDNTpR9H2AR+soSdE9rXjtn9/EgULZ8z1nZqiFTjqbNHKXb
         lnLEFg4NrR9lUMKsV4P7GdLcQHwbQUhdNa2S4BSObzjwxh1ZUBIGSSrCansxxbynDjUT
         N71BR0SwS7+3ldas7QOwdWVfZqnZnGVTyTJ9cBbKUyE0vcJ7Moo0egoKWB5nz5K0f4Tu
         iH7A==
X-Forwarded-Encrypted: i=1; AJvYcCV4IcapJ+z3yKg+JcTWobb84M9W6g1pqetWYld90ip9KYwnWPYobNgUfnbK00dZYqPO1melRlcNRJRuxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDKIk6bgbPe4JBVqrtlMJdcJHhl7HxBBsPkciL+qy5reoWrDoH
	aqtfFkhXgFqCIMLQFLZ2SFxa8wTAC3iXVdyIbWbIJwm/8jndbq1bmZCYEsTPWw/uCQvPFNTJubW
	Rd+UiMBJNCQ==
X-Received: from dlcip4.prod.google.com ([2002:a05:7023:c084:b0:124:a6e8:e9eb])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6281:b0:11b:9386:8271
 with SMTP id a92af1059eb24-125c10081bamr8120436c88.46.1770133603693; Tue, 03
 Feb 2026 07:46:43 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:34 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=2442;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=WtZdKvjX12D2Jmn1kMkn/+vs+NvlqXqrgcd1O83Ixd4=; b=y1zunl2p/I9o6cmWUb2NnYfAPstnO8iv9BQaW1CxpWleUmklNBei8N2Of6dN4lKwNKIrkORJy
 w7+q2IWbzENDidaJ41cve7e/37dXsY/YHczM8JnE76IbaJ4tUPyi7qM
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-5-d6719db85637@google.com>
Subject: [PATCH v2 5/6] rust: debugfs: Allow access to device in
 Devres-wrapped scopes
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

This adds support for creating a DebugFS directory which is aware that
it is bound to a device. As a result, callbacks under that directory
have access to a bound device which gives them efficient access to other
Devres, ability to use dev_err! and friends, etc.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474698235203f2b7d8fec96f2bb43f8..ac614d693fa73929d095b669e9ba61958bec609e 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -11,6 +11,11 @@
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::{
+    device::{
+        Bound,
+        Device, //
+    },
+    devres::Devres,
     fmt,
     prelude::*,
     str::CStr,
@@ -722,3 +727,38 @@ fn new(name: &CStr) -> ScopedDir<'data, 'static> {
         }
     }
 }
+
+impl<'a, T: 'a + Send> Devres<Scope<T>> {
+    /// Creates a new scope, which is a directory at the root of the debugfs filesystem,
+    /// associated with some data `T`, enclosed in a [`Devres`] for the provided device.
+    ///
+    /// The `init` closure is called to populate the directory with files and subdirectories. These
+    /// files can reference the data stored in the scope. Because it is stored inside a `Devres`,
+    /// the init method is granted access to a `&Device<Bound>`.
+    ///
+    /// This can be used for cheaply accessing device-protected data inside DebugFS methods or
+    /// accessing device-specific methods (e.g. [`dev_err!`]).
+    ///
+    /// The entire directory tree created within the scope will be removed when the returned
+    /// `Scope` handle is dropped.
+    pub fn dir<E: 'a, F>(
+        dev: &'a Device<Bound>,
+        data: impl PinInit<T, E> + 'a,
+        name: &'a CStr,
+        init: F,
+    ) -> impl PinInit<Self, Error> + 'a
+    where
+        F: for<'data, 'dir> FnOnce(&'data T, &'data Device<Bound>, &'dir ScopedDir<'data, 'dir>)
+            + 'a,
+        Error: From<E>,
+    {
+        Devres::new(
+            dev,
+            Scope::new(data, |data| {
+                let scoped = ScopedDir::new(name);
+                init(data, dev, &scoped);
+                scoped.into_entry()
+            }),
+        )
+    }
+}

-- 
2.53.0.rc2.204.g2597b5adb4-goog

