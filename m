Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170479;
	b=SwgVUqcT1et6gkBAgZiRm3tTtW15ykQ6KdYaejt289v2Yw+IrpBnZu08bt8CE0nO5Beb
	 DDDo9Ur9avoBvumIlHyh7h0qMPiPqvriofr+s56X22d7VyUDOUOyXfbZRJLibmY6mfmXt
	 cXRjPFjTA9Qo/F4kjPvlSDJpC4XqGSiVwvf5sjDP+rZLzx2hGLcYZdMcIr3Yz6YwA3JKZ
	 vL8NByU4vXSD2LRWxayt2I6Kpkv2vAo8thiXMYpOC+vW3TNE3TgDhepddY1559QUH3bE2
	 SMn1/O3y4yH24Jj4dnbaWFlxy3a3ab/vX+8lfccVfDyD0Lzj1y1MIR3NrdKYa8WSq6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170479;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BJJGZ2hR7KrC6FO1SD1oNY+HbmJucVU7dix749FAVQw=;
	b=RTmpviRVrFCTaV0Wb2sbNW1IlZGVP6GQ/0lhgwUluB0xtCWlAxTvC/eza/KleLbrmkz1
	 gEs3dhLv/okcXvNZCknh67xcqhhkf/3LyUjaLJOVECMbye45Pb+VYnsuOAO05hs7vW3vJ
	 OKaaGG8o75aY61D1R6gMllN+TTJSpopsgB4hQAkzr1Iro/o1jIGR5BkVyGtGrSuonMA0h
	 9xggEK6+rbx1C2pDwLTwAwQDnz0VQxZ9UOGtyYVgrZX7m0m+0ZiF0VcVOSGQvhCxganxm
	 z2yQK6ji+JxZVqGagI8G0M0PyrGftt1m5dK+DfLv4jQ50Cu6c4DJ54PZ1vsWPMX90JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGbWhYsJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC48606A320;
	Fri, 20 Nov 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGbWhYsJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A571F000C6;
	Fri, 20 Nov 2026 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170478;
	bh=BJJGZ2hR7KrC6FO1SD1oNY+HbmJucVU7dix749FAVQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NGbWhYsJrys+xYxSXvAyaDvOTFqbMpAWP+I+omasdxQ13kQRFhtxlBqM3H5vqF1aQ
	 28MpaiKZFLNZZCOutfV/1/P34TdO94NRk7XJHz0suq5i6mePQFwnZsi+0IkmQ/RI7W
	 TqOpftIOsuKtNM6hxLhWxIlofQnx7GNksuP76dFZSZ7bPiPJfd5K0Gbp2I/Nmg/lt0
	 rgEwqHlWOWnw14Loo+8rU7rQ73Nv4grYHTaEXaY4zVYPI04rdpBDXykMHz8JPFynSr
	 HYhQVoUrDiLF0jr3tWcXvpHRMBnyG3Sf5zBrFpEynDwh57R42umdP4KdcFGXfo8Oqv
	 DmokSAqpk/GQA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:09 +0100
Subject: [PATCH 10/11] rust_binder: access page data through `SysMemLocal`
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
Message-Id: <20261120-page-shared-v1-10-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=qHAg/nVGaoHxsvrd6qBHGWy3BAkPVAIkJJLohHw0Kts=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCKShU+ukfTHKYqoYkqcKlnnZ2g88oZQPIL3
 XyA7duY9eOJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAgigAKCRD6UCkIqsW9
 0F4dEACOLzzfXceL7SEsh0TjwL2M7VwnvYPswzzZCiLzMfOHwSSdC1xnyUxYjDpJW0fdNnbJ/LS
 MreZUWOtychDXEmg3fK++XrCq6KAMuIVsk0a2OYibqKPr5Beqv0P2XNotiDNLHc1MBPSAYVtFZT
 slOkdIOzk4GjNEC3AyEVXOAfpLOvXb2J+agcCgNp4ENB2SIbO45ovvmkVRHCnbIVr6LO9jVIJUo
 mI1CPFQGqzq0WmgP2jn2JsmgKPKJFFSXobQzgu/d1Cf1O7wo3uPJqeLVfJvpWKC7zFgRpEW1fqi
 MgZ41VsmJ2CbqH39zvrB/Da9QApGneMLz27PrBz86QZp/Z6SMUfCvWFYOjygqRKpNayX+Wvo1rk
 Utq9k55Jmv9MmV5b7dxSSi8//8N7qKDo9rZoOVDhGSzliht17thJbQbpm45X/IeUhgPzeAcePJO
 pFKlOVG6ziFkYLJH/ch3weiN6O98LgPFJ3ZSai6sXWxOrhfZvCW/otLgVcjGQWqH1U644iuw4Of
 H7q5tgDCkIWJwCbuPb/J6CdOn1CATUP00pP9BF/VQb52Uf6D4uS0eCxoj2WKHXDNIaC5FULDlxM
 VNkE+ogcZzKa9TQdU03cW+4Q3mz7bSk4EyhxTw+MI2qAoJoVNVuCiGnNIlw9XYv6z/2esH9rRx4
 cbPHn6elffFlkqw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The pages of a binder page range are `Page<RefCounted>` pages, which
dereference to `Page<Shared>`. Thus, their data can be accessed through
the safe `Page::with_page_as_sysmem_local()`.

Use the view in `ShrinkablePageRange::copy_from_user_slice()` and
`ShrinkablePageRange::fill_zero()`. This removes the reliance on the
safety requirements of `Page::copy_from_user_slice_raw()` and
`Page::fill_zero_raw()` in these functions.

`ShrinkablePageRange::read()` and `ShrinkablePageRange::write()` copy to
and from raw pointers, so they keep using the raw accessors.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 drivers/android/binder/page_range.rs | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index bddc4538745e..2d360c32202e 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -538,14 +538,12 @@ pub(crate) unsafe fn copy_from_user_slice(
         offset: usize,
         size: usize,
     ) -> Result {
-        // SAFETY: `self.iterate` has the same safety requirements as `copy_from_user_slice`. The
-        // pages of this range are `Page<RefCounted>` pages, and this driver never creates a
-        // reference to their data, so no reference to the data that is written exists.
-        unsafe {
-            self.iterate(offset, size, |page, offset, to_copy| {
-                page.copy_from_user_slice_raw(reader, offset, to_copy)
-            })
-        }
+        let copy = |page: &Page, offset: usize, to_copy: usize| {
+            page.with_page_as_sysmem_local(offset, to_copy, |view| reader.read_sysmem(view))
+        };
+
+        // SAFETY: `self.iterate` has the same safety requirements as `copy_from_user_slice`.
+        unsafe { self.iterate(offset, size, copy) }
     }
 
     /// Copy from this page range into kernel space.
@@ -605,14 +603,15 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
     ///
     /// All pages touched by this operation must be in use for the duration of this call.
     pub(crate) unsafe fn fill_zero(&self, offset: usize, size: usize) -> Result {
-        // SAFETY: `self.iterate` has the same safety requirements as `fill_zero`. The pages of
-        // this range are `Page<RefCounted>` pages, and this driver never creates a reference to
-        // their data, so no reference to the data that is written exists.
-        unsafe {
-            self.iterate(offset, size, |page, offset, len| {
-                page.fill_zero_raw(offset, len)
+        let fill = |page: &Page, offset: usize, len: usize| {
+            page.with_page_as_sysmem_local(offset, len, |view| {
+                view.fill_zero();
+                Ok(())
             })
-        }
+        };
+
+        // SAFETY: `self.iterate` has the same safety requirements as `fill_zero`.
+        unsafe { self.iterate(offset, size, fill) }
     }
 }
 

-- 
2.54.0


