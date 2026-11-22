Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795352565;
	b=rSulr94RqOl0hC0asAjVKDnqKCkJcqysicR2OgnE0QAhGX5KRz7cmNuN3Pzn+eOQFxsy
	 bcwPKjM+uIujjo6Crw3jkQify3e5ueK7OIvhMYJmEuRmrJ5HMMWlSxduSEHtRfuCTPI6G
	 7+o4zQFEPuhrO9ccv061DVNOaUBfPk8V+2K35Vs04NQt4P2T2U04hLq6KT9wGx5WUIsUG
	 brqIVQAYksi8xjh9RpFE9m7ZAIro43vGL8fgXCH+RxkrC8IjzB9RXKq0+ViOdmTp6DNsp
	 /kPD9wxRW6TLlrdMrmuVBs7zXMB90OV6VwILHyPMEMB/jDuwIbSPCsEQID99bp7nx6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352565;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=F3F/5DJsUYhqEjGjiDZ8FHYCTJv5xhZDMG4cisCHJuY=;
	b=bOFwbvUsohtlZFGXHZtZzdG171K8QpyvtaXyuWeK+rL7gnnSUpGurbPpjGrgqlw+RI+v
	 lMRQUTyR8180vFmQ753uIgmCgODJ7Klrz8r+IyuY2avQTjTGUAVXft1RRc/Ez/Ialdg0f
	 ht89Hja7a4DRaWhCKw3+Jt3Gk/KFLxcrmBp8mVl7vkCO9RlpX78+fCu9XRlX3520qNjpG
	 TARO+HiGzdumgpmtISeR593QPddoeMHxchnE2JqEbGVUUCZtYT+Mef1YWNMysXmiq49l8
	 gEsWxYigCAIMtsMnkCweG+euyjB9/RWuI9Z1Rxe9T1ho74qDykZiuBQhuzWPOUua98g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=SvD+tY95;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D71606A32A;
	Sun, 22 Nov 2026 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=SvD+tY95
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795352564;
	b=g/ZiTvh4NEeTt3SRQoIOtyBStORcdXsdT6jT883k35Ook4SiVoirGxK/6ooapTECnhkB
	 9HBP08zUW7+YUSorQ3eTam9PAFz+7EQWKWEWGktTz3THcf6Wmdk2Yt52WCUNL8XiXrhdo
	 kKR8gAnZ3nEjLNmn/HyYAjWVYIN3ZBU3hAv+Og8F/rQJNoNMadQWqS7osxxzVhNOrQ3I5
	 se26x3qgBkeLBTFvLi61MV+x1vbOWPD4Qh3xN4+WULpPiuAmu9F71QBn3ZXV+z8pejkrM
	 kgKDCuK0u62ynjC5ri4kg9zyuyPNWh/rN5QkovEcsSl64uh0qrlyw//tFD5F18XypYQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795352564;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=F3F/5DJsUYhqEjGjiDZ8FHYCTJv5xhZDMG4cisCHJuY=;
	b=fDNOn+4kIJGRnHHHa1nsZucA6gbwGqmKLllOwYdIJ5HNBTGbF3VTH9Iikg/YfdO/Val8
	 Atmqq7CKjppR/x6EutVbSaqdxR/LgJjCXFM+01KIxhQZHzbY06QCNXHlNFx0VuvVw7zsk
	 VT41TFStvCkxXawA9fgP03RFoyzCW198LAF/do4wnGPGKkOfYVh03VNs55Kx7VY+3dPpX
	 JmW61HNZd0J3M5xU0oLLWmSg1qfzsIUuifZNNQzCoYsQd0gehhP31qXy2LTaox3kiPIFw
	 nflSRQes1BtplaNaNQLT0793IJuc1ecMvaI44xs6ALeuxzQ7GdN2InsJl+OxwnUxN6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A7BC1F000CF;
	Sun, 22 Nov 2026 13:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1795352564; bh=F3F/5DJsUYhqEjGjiDZ8FHYCTJv5xhZDMG4cisCHJuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SvD+tY95kabt/msfM2g1AEEJXJVXp1By87X+G7SmtqcA7A0dahix+DGFsAvgyy4k7
	 TVjjctvfkfNDcbUXEX9BkP53IZPQ95JLx2Lh9EnxbdW3CuQ6360yMcCypkJ5bHV2Te
	 a7sfqxgUUgyQ8fOTWQrWMwLsBVQxwLUV93ZBm/XY=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D74F44C053;
	Sun, 22 Nov 2026 13:02:33 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Sun, 22 Nov 2026 20:50:21 +0800
Subject: [PATCH v7 02/10] rust: task: add task_size()
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
Message-Id: <20261122-tyr-ioctls-v7-2-3a2af624b992@linux.dev>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
In-Reply-To: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
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
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795352551; l=2517;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=ltCybRExPQSKXsCnz8UljjoTEH8sGi6OL1QQ7zSPhcQ=;
 b=MPmHqFSk+yRPtfW83Pc/pd82Q4DbwpLmiDzOi0fF6lOklYZd8u8u+Xam9npIlRYQXF+I6n1pH
 B8rf8k8DbUbCN4XFzWqSQ4gVBeCWMqacwuEOwjUjzM8RuLEZoJaNdgH
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

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
index a733816fd5dd4..1978f54fe5897 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -317,6 +317,18 @@ pub fn mm(&self) -> Option<&MmWithUser> {
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


