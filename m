Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170486;
	b=eNVepedBaIME3BFs/4otCQe+hZmRaxe7S+pUmKe7ZOnkFZk9oKIKZaO0rz/WE0y88GuN
	 xhhyJYRnKURhIKPdpnRN+e6McPLQm7c1X5wCmKLO4O+jmZbHQ1f64fmSWrz5dVzv9Mgw0
	 CUqDKEykUChDKu34QCO9ZIiuUxjwCbUu5e3BedTApHGXsaJG9ySSBhw9tZj1DbVliYM26
	 mbBCVn3c8vfZByUjzG5ipLXB9SkezStCnAX+TBnATEQGZwNouXxE8r4dkGtngMWetpCqe
	 swu8zbV666k2kDS3Be+Qi6IP7YULTIHO3SF6B5qiWmKbqaSsGlOu4CnVwgAXh3hJudQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170486;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=48AW8ufpmYF1nS3yXygoenOKi7Jq3drTzHpOotJHiqE=;
	b=LAblpYbFp6BPIIwE9X+NSEgKe5yDNErmrdasXAbjacyK+f6L00f76hR6/ap9MZT48b/f
	 NKUYW9uinuCcHKU/Jj3X+HTRnS95iPjAcmaM/kAKUk7r9qItJFqr5QtKGeOXGOXoUO70b
	 E9XkFOdgyQlCsvKye/C19QxhxO3mKV9+sPX5S2ZcdVrdWNVxRsl76dsYGX9rev9UqNBAU
	 GipQfCbIbCiSEDwIDNuzLONv1kD32YwE2gKDSr+2Rwqe3IOwlGP8kqJSZQW563lr60OIH
	 xxkFrgBTmKheP2RqljLF7tlrpmJLGxR2xF118Z5b6idW3Yll0un2i91Tw/SJUjgy4Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REeCs4jf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61B606A332;
	Fri, 20 Nov 2026 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REeCs4jf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19651F000E1;
	Fri, 20 Nov 2026 10:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170485;
	bh=48AW8ufpmYF1nS3yXygoenOKi7Jq3drTzHpOotJHiqE=;
	h=From:Subject:Date:To:Cc;
	b=REeCs4jfsvaRVHdkJC3F+nPu18uiIUqdTOTu1Sh6pf2Z/ZOzqaaSt5uoldvT2ZYjz
	 l/9UiLLGYuT64ikUtVpd30rokihYch+N5OBU8z3CglWP2lC2WA92UVrFui/NmBZZFM
	 NFPnaNMe0SJMXzXs79bPKZSJvaJRl5nhE1SYX7t+3XhJEK4WsK6e+xY6nNyHwvRp5U
	 12Neaas4vOrDOM6KtiwDcSYVrDQCszYl+j2yY9/oKOViTx0DWkjR9KFTidiKY10Fhq
	 cFHT+Fygz5Ue3gEEkyDgcJIYn0P0wbJfigokZFIC9vz1mjxGV4d/P1ADZkEY6jFAqz
	 IYUqnIHIs/n1Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 00/11] rust: page: improve access methods for racy memory
 regions
Date: Fri, 20 Nov 2026 11:26:59 +0100
Message-Id: <20261120-page-shared-v1-0-66f8c4c62822@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAHMgAGsC/22PzW7DIBCEX8XiXCp+jMnyKlUO/CwNVWISsGmkK
 O8eEvdQqT3O7sx8uzdSsSSsxAw3UrClmvLcBX8biD/Y+RNpCl0TwcTEOQd6tn1WD7ZgoOD0uAs
 jAEokPXEuGNP11fax33Rd3Rf65Vnx4yh4WTtm2WzE2YrU59MpLWZo+n2kxQvyG2+GJ5xxyTZ4y
 0e7pGNfZcpUjAqUYjpI06a/OcUkU3Sd02VF2s+jAqIPk1YREEwT/6H6n2JD5e/Zuk4SCBpGbnf
 SiVdof78/AKMiYWU7AQAA
X-Change-ID: 20261119-page-shared-9b748d499e3e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4331; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=BHZbvkAF+8qU1x9bBgdqAem+iRsGSMXYFrP9PxFuYQ4=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACB6l33KQq+5JeQb6wqDk4/Mk3E/JfJxPT0gw
 ynOAk7wLZeJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAgegAKCRD6UCkIqsW9
 0Ic7D/4klhWumsGm6Z/AMzRwWmpTKLugQFFa8ICICKWOF1HpFZcDglrZ92Zih5B8qeruBQfcpDz
 OyEfU92BxjXm+U+Na4qcFAJMyDVR8qppNtiT0ev+nx/gav7xPih/VIsR/LrZnh3a8rr1aNYlmf/
 sBRdhp7jwVCPBKjCdWdKTg+eA1tQMMeY6nH7r0U3netINDaJI/z76GwCbboIvTDRyJCtL4hHE4x
 WHUiDh8uN9HzgJ9TW5jIJQi3b3bV6HUMYEBJ1z5YMwHG3zJlcMTW0XO1BxwYxwEnATyX7nTmOyh
 oIQ4g55+mQJv8TZ7D59TzgcwlVzBg7sn4rFsrvVhbFdBxcTgT6UttkSO6zo0G8hc9JfsmlYV39u
 3M5bpzYOHMjNyy7Mse7t7dTguojCTsFYDeuH33riRj6DACcHRBLdTx0uh4Aj0dRtZ22cn962LlB
 GfL8cR6+2ayYrpjHaLpjDPfvSHeia7Ts7SSdNe31Xp+zjIjpwCzYj/fBknPnu/Y4WfBYN5jSPD1
 TP6+SL31CseIWPMjs9ShiabxUljaV2336LCl8OrTuJnFi5bKf7siHOxVMv5UtYBeGOUBInTIIdb
 xDw5GAmn5IsHG/rYbSoQwYBzUCQM8Iggj7lN14mx+HVCg1R/n+oRuVp9NlJoiSl+F+tSWNQs5V/
 1Q5q3ffUDZqbEbw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`Page` has a number of methods for manipulating the memory of the page.
These use `core::ptr::{copy_nonoverlapping,write_bytes}`, which are not
valid for use when one end of the operation may be subject to concurrent
reads or writes.

With recent patches that allow pages to be exposed as `SysMem` regions, we
can use the `SysMem` infrastructure to do the operations as byte-wise
atomic operations, thus making the operations well defined.

This series builds on the atomic memcpy series [1], the `Ownable` series
[2] and the `Page` refactor series [3] to prepare for handling the pages of
a `Bio` in a well defined way. As part of this work:

Remove the `core::ptr` memory operations from page.

Add a safe method to get a `SysMem` view of a page and use that when
copying into pages from `UserSliceReader`. Remove code paths in
`UserSliceReader` that would make a `&mut [MaybeUninit<u8>]` to page
contents.

As `SysMem` is `Send` and `Sync` but pages are mapped with `kmap_local`,
add a `SysMemLocal` variant that is neither `Send` nor `Sync` and use this
for the views of page data.

Finally, remove `Page::copy_from_user_slice_raw` as it is no longer used.

The three dependency series do not compose without conflicts, so I have
provided my b4 tree with all of them applied [4].

[1] https://lore.kernel.org/all/20261113-page-volatile-io-v6-0-5603e527c919@kernel.org
[2] https://lore.kernel.org/all/20261116-unique-ref-v22-0-12029383206d@kernel.org
[3] https://lore.kernel.org/all/20261118-page-ownable-v22-0-d63ff73f4075@kernel.org
[4] https://github.com/metaspace/linux/tree/page-shared

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (11):
      rust: page: tighten safety requirements of `SysMem` copy methods
      rust: sync: atomic: add memset
      rust: io: add `SysMem::fill_zero`
      rust: page: use byte-wise atomic operations in raw accessors
      rust: uaccess: take a raw pointer in `UserSliceReader::read_raw`
      rust: uaccess: add `UserSliceReader::read_sysmem`
      rust: page: add `Shared` page kind
      rust: io: add `SysMemLocal`
      rust: page: add `Page::with_page_as_sysmem_local`
      rust_binder: access page data through `SysMemLocal`
      rust: page: remove `Page::copy_from_user_slice_raw`

 drivers/android/binder/page_range.rs |  35 ++--
 rust/kernel/io.rs                    | 151 +++++++++++++--
 rust/kernel/page.rs                  | 355 +++++++++++++++++++++++++----------
 rust/kernel/sync/atomic.rs           |  25 +++
 rust/kernel/uaccess.rs               |  79 ++++++--
 5 files changed, 496 insertions(+), 149 deletions(-)
---
base-commit: fd9230005e85472b81c1c7c16afe93dd878996b1
change-id: 20261119-page-shared-9b748d499e3e
prerequisite-change-id: 20260130-page-volatile-io-05ff595507d3:v6
prerequisite-patch-id: 112f7ee8c101c766ba33128a08c053ff7dd1bd6f
prerequisite-patch-id: 4b725c8c4d3313096ea722ac2866bd5e36227b88
prerequisite-patch-id: bf25326b450044d86f2cc7392f67d17d674afe8a
prerequisite-patch-id: acbb5d7f331c45b8da915ea32bef91447ac0b234
prerequisite-change-id: 20250305-unique-ref-29fcd675f9e9:v22
prerequisite-patch-id: 4e3c7a1a2077aaa0ece2d557fa73486355903ae5
prerequisite-patch-id: d1073c5dcd6287fbcba7848a5d182108930230c1
prerequisite-patch-id: 3244def11bbdf2eabaa6e94e15ce06540b2f5814
prerequisite-patch-id: cef14c5bef5ba519ceaf0a0e7c9e93ef974db7b3
prerequisite-patch-id: 56410da35ed8dbe7b210adae0985af705cc0b5b0
prerequisite-change-id: 20261112-page-ownable-2e97941a83b2:v22
prerequisite-patch-id: 4e3c7a1a2077aaa0ece2d557fa73486355903ae5
prerequisite-patch-id: d1073c5dcd6287fbcba7848a5d182108930230c1
prerequisite-patch-id: 3244def11bbdf2eabaa6e94e15ce06540b2f5814
prerequisite-patch-id: cef14c5bef5ba519ceaf0a0e7c9e93ef974db7b3
prerequisite-patch-id: 56410da35ed8dbe7b210adae0985af705cc0b5b0
prerequisite-patch-id: 7454d72e9d18045c4b45c3be614c51288c7c437a
prerequisite-patch-id: edcc308e1ba9596e7939859cb50230ca56f0b265
prerequisite-patch-id: 90fcb80e26232818fea9472fa83871b6577bbddd
prerequisite-patch-id: 10e8ae82a9750cd76b42754393d3e39b9e849474
prerequisite-patch-id: 881055f06785a8df0ec9f8107065428900ca78d9
prerequisite-patch-id: e0759f2b41824d562a594c9e2452bf41ba514cbd

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


