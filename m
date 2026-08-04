Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0C480DE3;
	Tue,  4 Aug 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873211; cv=none; b=Ilic3qHwxyn8cN54rmgV44yH0P3fVEXfPfnTHg4ILcA+VD2KRncALnMl0pxfTuPY/3C6rScs/jQ5wZKMS6zoNS9cCs2OcqVQodcS6ZsIitdwhIBoRE6KHxwnuqsN0tBwRxSTDlzjEi25hajisLfgqI3WmRKLr6nxhXB3csGyekE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873211; c=relaxed/simple;
	bh=5qdEy4oeUki2TjVPtO3bSRNatCoADKMiiRcmvTyP4yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQgN1proQ+vh3jR+l+gMJfZfSDP4fc1lHAI4QqpHpHphqL7dLDf52iyrnQLaMK/nh2C6QpAoRLrpztHlLKNeXzgicZghSWWOvc0UZq4CYMdt1MFddtR/kQpGSJ5A3qbKUS7o/Tk4XwzczVs6HQQ+9xPZDW3TiPmsZhxjoLB39SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/GATj/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/GATj/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DF21F000E9;
	Tue,  4 Aug 2026 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785873210;
	bh=eZTPnA8T6m5jKR5YQ2rmt0TwzN+zuyiegoiKGxGEFqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H/GATj/vv394ubKViF/uvksnWOlo3ITmq7C6UgLeYGyOGiMjdClDOsUviFt23GL6t
	 AjPMxezUMNaiBQplQn77PEQRekzPPbT4ZW6S6nDTveZOq1z3nZdVdFpl2L9hJK7WcN
	 MPt5TiWIu7HZLFvjiEpeSnDZlKtaSiBYEtGGtyiTKCpFcy0y3MzBl6WxZ99ucw1tIS
	 LF+bExfJl+ZVWEZQ9O0a0mcYLedBbjn3MGYsqmigstQ/k1VRfflVy6R0Cs6F2jAqXo
	 zd1U5+RqTBuDac7GBNBdvI1/0+UMjUFFGnokIYmO5QuHy58KXleHqn7ZCVqdqp5VAV
	 XysIv1/MpnokA==
From: Danilo Krummrich <dakr@kernel.org>
To: tj@kernel.org,
	jiangshanlai@gmail.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 6/7] rust: workqueue: add Work::cancel_work_sync()
Date: Tue,  4 Aug 2026 21:52:08 +0200
Message-ID: <20260804195248.665636-7-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804195248.665636-1-dakr@kernel.org>
References: <20260804195248.665636-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a method to cancel a work item and wait for it to finish if it is
currently running.

This will also be used by ScopedWork's destructor to synchronously
cancel work before dropping borrowed data.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/workqueue/mod.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 5de88c59b2e5..2b87f935712a 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -585,6 +585,14 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // the compiler does not complain that the `work` field is unused.
         unsafe { Opaque::cast_into(core::ptr::addr_of!((*ptr).work)) }
     }
+
+    /// Cancels the work item and waits for it to finish if it is running.
+    ///
+    /// Returns `true` if the work was pending, `false` otherwise.
+    pub fn cancel_work_sync(&self) -> bool {
+        // SAFETY: We have a reference to a valid, initialized Work, so the pointer is valid.
+        unsafe { bindings::cancel_work_sync(Self::raw_get(self)) }
+    }
 }
 
 /// Declares that a type contains a [`Work<T, ID>`].
-- 
2.55.0

