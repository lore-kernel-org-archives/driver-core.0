Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170506;
	b=dqq1G1Q2mBKmOL9yUkom/ATH0WEAi+bzpEvLTOETayjEyXV2tZhJxpdXFWRt0QhIF+Vj
	 etnDD2np9gwh1nm1G86S6Co9HbYR00XSMm5ScwHMqn6lImd82spSrCENj+GNjy3I6/Jbr
	 qGobDxaqvcnXywlRUYc6c/FjmoRvNYU2WFFDMR683I6MdEYkL7ktse0wZ2KgX9gP9yTAj
	 Mf3dO6COYME0SFiPnUevZXDUYif3y8Q5qKtbDaoEnuleefi+gT9rlvHwBT0+ZXKT0jaYT
	 1ZePHd9r6I0iYcAkD8p45R7NQKkBi6NmvtbZp6aXEB5hLkDlq1ECVQcQdSZpnrp0xZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170506;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RalyYAx1YoLGhOyFcSAsDfzWBv5wWU7LgQTBoopH1Hk=;
	b=PURH1dyapqHML6nH+r9L8wKjrGzlwPY5vNCvZL5Bx0+CUBR0f21Hu/Fybt0bIJdvP8sz
	 tuVUQEj9mgCYxoWAdtku57p4mUi8OO601Ef0rgiJoS8qP3wRromYpDE0XB7KY+fi3VUgt
	 Iug8KfsUDw2DkGzkXDSyVLEpBiiFYRWPg0Z7TV/SwPTPNvIh5vn747NFFwfv4Rid4ou3c
	 HBFJGnfF/m2Bwa6O+VenJ/tkRwdTM0Cy8S8unxqBlGTfpuDP5c1B/CNEOd01PwuKthcgt
	 ulqK7vqHdam4dQldLZt4PPeDf78NbcOlYWC2ASyNAmaVkOtD26TZDubf/vmJskY8tBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCiF8uvk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA4A60A2617;
	Fri, 20 Nov 2026 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCiF8uvk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F3E1F000D0;
	Fri, 20 Nov 2026 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170506;
	bh=RalyYAx1YoLGhOyFcSAsDfzWBv5wWU7LgQTBoopH1Hk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZCiF8uvkEpbeBiRyHV2KFlEqafiiK0+tSoH5CoXzKJThLyUyExw1sPqpqRsn0fUJ2
	 ZO6OihOZdi9SiP6y/Qq9qR58N8IiIxUeP4J7+D1Y8VeKUSn9H36w8d2ZNdDN9OOyd3
	 IYv74U0WDj5CFcoK1AVUSIbFlPe9zKDLdwGyic6YaWATRyaMUh+IvHjaeq8O8PxbIJ
	 M/W0MD4f0pagD+EzBTINYZdc17V4pdfnVZN6H74ce53tWK7nf+5g/LF+D7sfcHYN6R
	 veQud0PDLL8aVMfKsAwGbbL0PQ6tpFojw+eJre36w3OlfSipUQ6txofCfF8ddcNrcn
	 AVK9DEltY15Kg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:10 +0100
Subject: [PATCH 11/11] rust: page: remove `Page::copy_from_user_slice_raw`
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
Message-Id: <20261120-page-shared-v1-11-66f8c4c62822@kernel.org>
References: <20261120-page-shared-v1-0-66f8c4c62822@kernel.org>
In-Reply-To: <20261120-page-shared-v1-0-66f8c4c62822@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Lyude Paul <lyude@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=yf+ZJdytQ7fsndkVjpDDExnANbyp+/XNQ8K9iMvdiqQ=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCLDBjp7ML3zquQ7ptfmv1+wLTplqh09kKwn
 9JIxhZHs5GJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAgiwAKCRD6UCkIqsW9
 0AArD/9tCVQl3icfEOakZUAmYhm7LMSpEDiv3LcukfJAC6uAJNaAZ91Sp0XC5z0z6soVB9n1hhy
 5Uf+HSMYOazlWZ4fJa6AGyxAlGixQI8hhJEdGqMLFccKNEPkw/tj6R1VXAY+oz/FlgTa7l71Bpn
 fUhmrFjLo/ZW61KXhRkHytyk0hcP6JpZx7ceB3xCb6RRm/SkuFius+oJ7IOwliAK7dyUvBjzo8B
 H2DJeLEvGJgvac7oinMwYxNVMRZvb2rlaOvWta15GP0p6NP9/yIqrfHckZfgZKCIa5LrasZZ0Ub
 2n/xlam4VZsqx8LGZuA8er0Ytw9YYY8veKum+KM1beGMX1s/fSpekecxpzTRWUBSjeGie7rpiQV
 qq7fh2AMCbDA1sWyMSgo5L64Zvw3dfG9oMtOhu9eTHlACv6TWxOsIKjsTDVy5lxiQCQk4+Y/eHF
 dqV10WPKl4c6x0Kc4QOdEJANlbCtQvOyWO9QkORaPnv+UmYbdosM8NlgFVCSNL4b+1gn5u1L5f5
 Hn88Nf5wRcF1Ud98/vbl3zQy0+cIWr09CHSyeAYamPukKc7Jfx05XrBFkmA8aCwu/C/Z0JKDRxg
 nkQ+w+Z4AT7W/P33F0X4mqTTlwsZ5MmMx0eTyo7oInERapbp40yIT6xd/o9Zgorwr3JdxM+3t53
 /IntH97mo7vrfcA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The last user of `Page::copy_from_user_slice_raw()` now copies from user
space through a `SysMemLocal` view, see `UserSliceReader::read_sysmem()`.
Remove the unused method.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 7fa037f5938b..adb131fb94dc 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -32,8 +32,7 @@
         Opaque,
         Ownable,
         Owned, //
-    },
-    uaccess::UserSliceReader, //
+    }, //
 };
 use core::{
     marker::PhantomData,
@@ -631,35 +630,6 @@ pub unsafe fn fill_zero_raw(&self, offset: usize, len: usize) -> Result {
         // written are initialized. `fill` only uses the view on the current task.
         unsafe { self.with_page_as_sysmem(offset, len, fill) }
     }
-
-    /// Copies data from userspace into this page.
-    ///
-    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
-    /// outside of the page, then this call returns [`EINVAL`].
-    ///
-    /// Like the other `UserSliceReader` methods, data races are allowed on the userspace address.
-    /// However, they are not allowed on the page you are copying into.
-    ///
-    /// # Safety
-    ///
-    /// * Callers must ensure that this call does not race with a read or write to the same page
-    ///   that overlaps with this write.
-    /// * Callers must ensure that no reference to the data of the page that overlaps with this
-    ///   write exists during this call. Such references can be obtained from a
-    ///   [`Page<Exclusive>`], see [`Page::as_slice`].
-    pub unsafe fn copy_from_user_slice_raw(
-        &self,
-        reader: &mut UserSliceReader,
-        offset: usize,
-        len: usize,
-    ) -> Result {
-        self.with_pointer_into_page(offset, len, move |dst| {
-            // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
-            // bounds check and guarantees that `dst` is valid for `len` bytes. The caller
-            // guarantees that there are no races, so `dst` is valid for atomic writes.
-            unsafe { reader.read_raw(dst, len) }
-        })
-    }
 }
 
 impl Page<Shared> {

-- 
2.54.0


