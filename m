Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E33BFE45
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 15:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133600; cv=none; b=oZjt3o+aJ9ugMtC1gn3lDlxuXZJO0FImp2JXVj8eqkwzB9CmQxgJw8AFoC29dla5MrTDz9wgrXKUJSkBi7RirqrlEFTQ4qrb4eSYIqFw04dpvL5h5MsVOOUUFniPCPYYSBiZgvi5y2RTfjdISB7bx6oCG0oiXWPFb9od7+p40kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133600; c=relaxed/simple;
	bh=toV72FONVd+c77Jdi9/X05RZt7qiox3e/hnCpHZii2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EMJhStlFeiXyu5ADzDIpzL34lWf2oCHwUwiCiqAWz20QYUAUph55aYk0n5ZFV82EQaVasOEwKxN6lZDObaG9SW5UkGo76g8qmkowHrbdicbbx3keMXZGwZQXCCAYgCKnkg8Ff0jVzpHTx69f6KHiqUxb4eveo1Ovx5k4qVU9cKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QIwN+RYy; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QIwN+RYy"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b799f7a603so31777194eec.1
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 07:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133597; x=1770738397; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/wJPUnQVMCcHAFscBghK0MQ8yiIElHndU1rZLXdeks=;
        b=QIwN+RYyVhg5G9ABw8rSlVVObU1nrgUVym+UkY3NjP+tQD+Qz5UpSBx9xRr6JDfH7a
         t3aK1m3TD6S27bPzb4bQGYsOTsxwLAynEg5UiPH/i7kPgggmMC5lR+AHPfvlrBnBBT6m
         4XGu1zRzPoHgArz2moXF9oHt+YpmEJBtUJ/sY44/cuSp3JXwgt3zzUyLjKeuioab+PW+
         agSB5SKnrQIcdc9RDkMmQfTpAM1RiBElqudwuw4KtNrXaOviUghyP/TT369Q6ueczGPR
         EyO8efyIl3WLvyjO3nnaC6C/sOzF++qVPzXQa1rLUR3WyyUxXT4ubUd3lerYqhgrm+g/
         kmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133597; x=1770738397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/wJPUnQVMCcHAFscBghK0MQ8yiIElHndU1rZLXdeks=;
        b=uYjNCrOwIIZZo0ZyK6SuRv+cj94M2lxQuYjz/Dowm77Oc+nrt/pPkFTyWrNs7b19Yr
         opfvlF8ZiM65Lo41JIwz7U3kH6pH5Ck0m+1N6c6TumP1Ne47X3fA2URAj0cw4U1jPP13
         7ZcQ35EIn2bHSdq4XYYxiIwjgGit2y2yWzxGe/YoWFsX0VLn9X7/OAyKWjq32ya6e6OV
         ngFEWmfN3sa9Iubdfb+w3JUrQuKYR1NPqjtN1nnbZuqjMCd3MgkRvyNcyMNQ/kq8KrxH
         DmFsjdnZ6ybEPYw56JE1GVX60UwBF/PM6SwGdaFUk5PFUSa+S3W7LMtfClJ9GeaW/Oya
         TGLg==
X-Forwarded-Encrypted: i=1; AJvYcCVK0M4jtuQ0H9XanMF/E4zok0rpNehYCgMw/yUPNFCHhnEwIHjr+K7flsL85vlWZl+qvsfnXXW6MEj2Dg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBDmH/AtdGiktQJ93fCuV1M7xXcFVs8gk9KxQ85F3tAFqGB6US
	ppzIruFtA7q4D7iAw7YrcXOy89ov90zzu3xzzYRIb1Upjbh4xfI17q6KQQ592e9w9GiSxJe6ob1
	RWpLvpfHFmA==
X-Received: from dybny37.prod.google.com ([2002:a05:7300:e825:b0:2ae:51e3:c162])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7bc2:b0:2b7:20c6:36dc
 with SMTP id 5a478bee46e88-2b7c8960b21mr6824371eec.42.1770133597088; Tue, 03
 Feb 2026 07:46:37 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:30 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=1885;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=toV72FONVd+c77Jdi9/X05RZt7qiox3e/hnCpHZii2E=; b=HmKT9Wjpe5u2hTdJ2Tcoag2Ev49Zm6fhsS7eX/dQiAxY/wxuUniXmJdhtGMd67QiHayfpx34L
 0bkddcnyzhZATSmzQBb6PghYphGlfrft9E9n7goPvqOGq6riqINeZyj
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-1-d6719db85637@google.com>
Subject: [PATCH v2 1/6] rust: Add sparse_array! helper macro
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

An idiom in C code is to have an array of nullable values which is
partially initialized via `{ [0] = x, [7] = y}`. Because Rust expects
everything to be fully initialized, it does not have this idiom by
default.

`sparse_array!` allows declaration of `[Option<T>; _]` constants to
allow Rust code to more easily mimic the safe version of this pattern.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/slice.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
index ca2cde13506196d46c9169aa6e4ab2ac42af6f5b..826b6f77f0d07775bd22837cc1773b59ec96936c 100644
--- a/rust/kernel/slice.rs
+++ b/rust/kernel/slice.rs
@@ -47,3 +47,40 @@ fn as_flattened_mut(&mut self) -> &mut [T] {
         self.flatten_mut()
     }
 }
+
+/// Create a sparse array of `[Option<T>; _]`.
+///
+/// This is intended for use when C code would write `{ [0] = x, [7] = y}` to perform partial
+/// initialization of an array.
+///
+/// # Example
+/// ```
+/// use kernel::sparse_array;
+/// const FOO: &[Option<usize>] = &sparse_array! {
+///   0: 10,
+///   7: 16,
+/// };
+/// assert_eq!(FOO[0], Some(10));
+/// assert_eq!(FOO[1], None);
+/// assert_eq!(FOO[7], Some(16));
+/// ```
+#[macro_export]
+macro_rules! sparse_array {
+    ($(
+        $index:literal: $value:expr
+    ),* $(,)?) => {{
+        const SIZE: usize = {
+            let mut size = 0;
+            $(if $index >= size {
+                size = $index + 1;
+            })*
+            size
+        };
+
+        const {
+            let mut arr = [None; SIZE];
+            $(arr[$index] = Some($value);)*
+            arr
+        }
+    }}
+}

-- 
2.53.0.rc2.204.g2597b5adb4-goog

