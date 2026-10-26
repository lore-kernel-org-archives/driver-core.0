Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032874;
	b=EwJKd4kZ7EpQ7pJbnciVhPBqhu7FfEmr0KjCZR3vfIL7lfBJDhloq0+03VtzobRaARik
	 FcJrtLS3pPg8TtEb1YiKD8rg7cWD1jKsxdhMZthbx6I734De5tQ0F+VYL1udr4O+04Zqn
	 v1zN3+ldiS3S57ykqnnWWE2GC5DJxCudwop4rB/Wd71FxmZUSMumDCja2p3j5yLT2fe52
	 EmhOL9HCFwxieYylaDUdVqITQjhOT6faYFnI6mS4wFRPQPKSjeFgmKip1xxntcoAmGcOy
	 utePoHMY4a7QJgFGYts5hIwsXddlP5yxT/+3r7b82gGZtBEKCHEnjNOkPKL/leYoaCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032874;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jKnS8OcReTjLaHrdFjGjVJmk8r0TI5DsvNMEnm3UFOw=;
	b=Qg9rQIAGG01XBhcXohh+GBf0BbumqO6wP/zag4p8wxLD2/yc6jZ4v0QHp6VeVjcLOd62
	 /ve27eE1hbmTD4Z/qA0dy9UtfAassaq/SqxnXsT7AMcrawAfmPCIyJl5zaSxmoPmwC1rV
	 k/Fbac8qssiv6/1IRQe3d3RaNLiyuSlEJS95nhq8BG9kb2lXhM7SAZs9vVjsVAPAWmN9R
	 wyWyBvD/3nnoTesSaZWytWUlKXlcllPnR0Fxkj4wE6J3xk4RkOH7oNlV4LgieKvdO3RwL
	 qGQ9Yv2r6e3RRr/hDKKer6KiyQKkb/P4ZwdyxLsyJJL3vz3+4CpDLzuBqw0C59IsddQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOwOZ94p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F36F606A31A;
	Mon, 26 Oct 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOwOZ94p
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793032873;
	b=AZ6pj6yzqPZoYlCabPtgMuR9hHq8PVrrRP92PKNnWeh/0CddjAPeNiOGAtuhAnj9B8ji
	 lQ2fXoL9Gft/VQYnVqfUdUMzUWZ/Du/+74KIi1Io92ThGRB3cDPXYuaNv//QXJ2riXt9T
	 svLl9Kwc5XzBhUCDUhY7vpYG9okR5kdl/BgQ9DkkWRqrY9r2Opn6m59NEZyG0zTbScv3B
	 wLPzhgh7nBu0DEt9GROOdeleWrCeVx3eDKTSRg1YXgMtwVVDEOgLCYnHonxejp90wrl5Y
	 0Q1mfHqhaQit12ul1T0B6HRmnBLMzu0YpDmTfyoqZqN/U1mrycPx8IDY0VEh1hIzOfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032873;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jKnS8OcReTjLaHrdFjGjVJmk8r0TI5DsvNMEnm3UFOw=;
	b=rX57m7GBS7qVBoCMdc9XBAzgD7N5njDC8mOjVom54xJq8yfNYqBzBARQVStc8uf9iwgX
	 S8JFsQTwewV016V7hD2LBlCa49z7umpPyUzRSE0rvg1ZLOHSimm088E7VLKWYaabHv711
	 hAynFHqmYs4QNsQ7koljC1ayyhV27DicgX5RhWoylgO7k+SAz/n/g5sMcatFxaLEISnRD
	 9NhqzmfssCFFxRx+qp42jrnJ7s8SA6ofF6ptqhQsNzALC/DAmmSKdeC2nI/R9N5o5HOmt
	 cp/w7DnKs4rzwsY4GWxkaBlJcSuuLJw+BIVH2/iXkHf5mbw2jxF5v+feHhEV6BqTrCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CF5E81F01828;
	Mon, 26 Oct 2026 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032873;
	bh=jKnS8OcReTjLaHrdFjGjVJmk8r0TI5DsvNMEnm3UFOw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XOwOZ94p3hqqwbbEMBwsKIVaRn6u10aeoRkV2zsg7+SGVaOFaR6/Sigj8nlY8+dTm
	 J9WX3Q/Ex4m5Ud5/8mu1gVnijfwj3Rh5bsM2kEcEIqurJ9rMn2MRVJXvb2tKD74H48
	 rInzElIcGgqxdcZvD2rUbS1HqR/0AzKTKsnzmKdrJbb5qJ2b2QxtRwfbgpESjphO9p
	 sI66sYhobgHpUR8uiK9K0petqWVJ+hf8xuxTN3wrr8ZV/pEiP4VhBREAM4d7JbBq4v
	 bTavMsrlmiuu4KLe9UPFV9MCQWWjjvOhvWCKVVJD07sz4vqjXk7s7LQuxoCR8J670Z
	 C/BDaiWb0TbvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5709D44DC9;
	Mon, 26 Oct 2026 16:41:12 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 27 Oct 2026 00:40:55 +0800
Subject: [PATCH v5 02/11] rust: task: add task_size()
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-tyr-ioctls-v5-2-59dfe98cb003@kylinos.cn>
References: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
In-Reply-To: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793032870; l=2517;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=SVTHAw+MuGYh/fZMg5wDC3wPSM8rseGtAWNOgWBu2T4=;
 b=3nn7okpFbPdhHXxttuKyB0Km40JaGCKzmRceOClh+jDnb/88sWg7q6AXsMGBUBq+egZW8SeTn
 vMs/n+Fsgf4DiI1Vrs2EHX6dcZqnmz/+dqb6s6hSPM76dX8spYsRdoS
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Sami Tolvanen <samitolvanen@google.com>

A DRM driver that lets userspace pick GPU virtual addresses needs the
address space size of the calling task, so it can offer a GPU range
that the CPU can map at the same addresses. TASK_SIZE_OF() is a macro,
so reading it from Rust needs a helper.

Add CurrentTask::task_size(). It is bound to the current task because
TASK_SIZE_OF() falls back to TASK_SIZE on architectures that do not
define it, and TASK_SIZE describes current.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[ Add the <linux/mm.h> include, needed where TASK_SIZE is defined in
  <asm/pgtable.h> (e.g. riscv). - Alvin ]
Co-developed-by: Alvin Sun <alvin.sun@linux.dev>
Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 rust/helpers/task.c |  6 ++++++
 rust/kernel/task.rs | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index b46b1433a67e8..b49bd40027154 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/kernel.h>
+#include <linux/mm.h>
 #include <linux/sched/task.h>
 
 __rust_helper void rust_helper_might_resched(void)
@@ -13,6 +14,11 @@ __rust_helper struct task_struct *rust_helper_get_current(void)
 	return current;
 }
 
+__rust_helper unsigned long rust_helper_current_task_size(void)
+{
+	return TASK_SIZE_OF(current);
+}
+
 __rust_helper void rust_helper_get_task_struct(struct task_struct *t)
 {
 	get_task_struct(t);
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index eaa0031416a98..e60a0f0727889 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -314,6 +314,18 @@ pub fn mm(&self) -> Option<&MmWithUser> {
         Some(unsafe { MmWithUser::from_raw(mm) })
     }
 
+    /// Returns the size of the userspace address space of the current task.
+    ///
+    /// This is the first address above the userspace range, so it is smaller
+    /// for a task running in compat mode than for a native one. See
+    /// `TASK_SIZE_OF()` in [`include/linux/sched.h`](srctree/include/linux/sched.h).
+    #[doc(alias = "TASK_SIZE_OF")]
+    #[inline]
+    pub fn task_size(&self) -> usize {
+        // SAFETY: FFI call without preconditions, valid in any context.
+        unsafe { bindings::current_task_size() as usize }
+    }
+
     /// Access the pid namespace of the current task.
     ///
     /// This function does not touch the refcount of the namespace or use RCU protection.

-- 
2.43.0


