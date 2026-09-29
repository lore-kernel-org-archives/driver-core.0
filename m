Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94971298CAF;
	Tue, 29 Sep 2026 02:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648156; cv=none; b=dOJqay7VFko1oPD2iXGyvAdRwojGXpmO2OAqgacZNNFv3ZPUbT7ZAEGjX5ZPIckKJQldG0vsl0oaCd6Ac7NG8h6UOX6zVbJRVH4ej4Jl2238D3yABGejsOQ/Sa/FE7RGE6NfVCPULTsgds5mIN6Pl81/vRXDsz/wty9wdnguZa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648156; c=relaxed/simple;
	bh=tAJEHSAuTRx0EwppaN+WcZOoNCdsIpUxUwps4sDokJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b3mAb0GsIddDuHmVK3bedU9fbd7qle5LAahS8Y6MoM6HgsSW7+OHjqX6yJmHvOmBoAYynqgr6ffXZfpt/AonEL4k1DrqlfDY3EkXjIA8W5eJkxCOXhwKXQ3gGMs5nTkRoC9+rMJvc/RVQzyq2VNNbKc9hUTSOVoM0NRlc7d1tGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUntmLjX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUntmLjX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41C2EC2BCC7;
	Tue, 29 Sep 2026 02:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790648156;
	bh=tAJEHSAuTRx0EwppaN+WcZOoNCdsIpUxUwps4sDokJQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OUntmLjXkQkD5gqD/fAnaZhEjU35i3NdeD0MDKAt5qMfvjV8dgzKTn9oIERB2ri1w
	 T2TRxaOaxqM7EjMJ8UCcBzqirn2hhBT3nO9P54VKxxnMgFcXcU4NtHfEWmoGtvQuAc
	 kTgHXBPwIDkObGcAtgBPsOOEQiKyj65zPCEzAwNZF5fLbFzlH8D2y3SRnE1pSt2BGP
	 uYfWcF9ZwzcGo2B6z/ZfTg0VtJziwq4RIoQiS2MMLHGYfdWpscZ1AuB1KpKFaaCHX/
	 SpXlzsWg7KY5lJC6HpZFQ/aQh3tORGPFPAJi/cHpI5JYirQOGWwZL9e47Mwi5bhEo5
	 bQblDfhWr2YOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2096DCA5FA1;
	Tue, 29 Sep 2026 02:15:56 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 29 Sep 2026 10:15:52 +0800
Subject: [PATCH v3 02/11] rust: mm: add `task_size` helper
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-tyr-ioctls-v3-2-26955fb111d5@kylinos.cn>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
In-Reply-To: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
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
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 driver-core@lists.linux.dev, Ke Sun <sunke@kylinos.cn>, 
 Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790648153; l=951;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=JO+2MVB8/0ZEX96oFL0eP1mAOKrIibNCaD5F9FcB8NY=;
 b=4hJQWHlONdWWEYIBfTzQKm2FojtHl4B5GKRGXQ2cctUARsgYvoM5Bxw0nyFeRQMcltOUvr9di
 VOrWnAmOxmNBqTQMrnCvfAvmWk2XdvzQ4gQZIJzQ/NQjBo78LbPkID2
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Expose the task's address space size. It is used by the Tyr driver
for splitting a VM's GPU address space into user and kernel regions.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/mm.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 4764d7b68f2a7..d2dfbb7d43972 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -149,6 +149,13 @@ pub fn mmget_not_zero(&self) -> Option<ARef<MmWithUser>> {
             None
         }
     }
+
+    /// The size of the process virtual address space.
+    #[inline]
+    pub fn task_size(&self) -> usize {
+        // SAFETY: `self.as_raw()` is a valid pointer to an `mm_struct` per the type invariants.
+        unsafe { (*self.as_raw()).__bindgen_anon_1.task_size }
+    }
 }
 
 // These methods require `mm_users` to be non-zero.

-- 
2.43.0


