Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321948;
	b=ahWrs3hNiT0LFpwFKlHMMsm1SuEB8z9zEFAf845tGYZJfajsZVaFyLZiChj5KQ3gOvwg
	 T6kEyp3LD2fTca75fyw1YSZ+h2LOnFiRbonV3vx4sHzJq3MEpxUz+GYmf/fij53N1gFXi
	 +JXumg8ECTVeDucgYjrieU53VHc9C3cREw7a1NqGiwAXOGnh/LfOGglQp/AYxrkoCibVu
	 HsGX4tgvwh1oX9AWDRB4LUVJy4MWlV4b65p5cv6Npt8jl8ZiyuRK2Q+iqt0IUI6KJcZmZ
	 U8TD2X8iOaeCJ2zjUHOJgRZCc3kLM0mi/VeK0ULHhEAEBQttWrckl03QdxzFGFYHGIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321948;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=R9lBEoIWVZ1hq7v8fJDQt0mB70S3ebuyMNcxrw2vw24=;
	b=zbxIDKcbqtolISbXuZxCJoK4QksXzz6hI3tvv/WhtPxMOdK9ONyNijpUkVR4jThjaPwT
	 lkOPfTs9cjznMIJ9H9gYPVKKAnjdtlphFeCslHkoFlEWVFWwDj3FUR6GfcwrbN+dg9blm
	 0T0jTBmcUnFszt5E0CCExBeuM/cApL4DyM4eAodUg0SBc06okqxEIjjtygPup0djFmiNr
	 5Suq45pFimavTW8M95Hp5NwkTVQ0Q9UvZc4CItOO+vHNxLuna46vukvCxXwO8NXyzVCs4
	 3OTu7KWb1xuSuUUIXV8NZ/ARC3ZUyUkgAW2i16d92tV9Fsn2nMnzqjhuIzims2G2YsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CrmBV/WD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF060A3819;
	Tue, 10 Nov 2026 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CrmBV/WD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF241F008AB;
	Tue, 10 Nov 2026 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321947;
	bh=R9lBEoIWVZ1hq7v8fJDQt0mB70S3ebuyMNcxrw2vw24=;
	h=From:Subject:Date:To:Cc;
	b=CrmBV/WDDK8s7UxUEco04Menz3UIYnabxTXaDbMSrbR0SKNsyJ0WadwsoNIU3JuVN
	 HpJ3q1W262L4Qs/2+dmakPhpJ0JLP5TWa2+EXLwNfzVBQFRZFKO8Q8LRFe/wdXdQ6s
	 U2GVUzu3GxqpHqTE+jDXBOej/b6lNgvFfGHXJEoUf5dcCTrcewP948gfK8gmL68xB2
	 2BleWlGDj0aI3tCGkS2cn06GHkojl7fgrokDvCiXbZNgGS0/46b4adQ9n58EzFwS1+
	 lHtvt+a65Pvmf269FpQdTNQZPPYHHiGribnwyrvFywjptDZ1yyWmxYSQqvpCTfzVda
	 QPgT6CBFIbTmw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v5 0/4] rust: byte-wise atomic copies between `Page` and
 shared memory
Date: Tue, 10 Nov 2026 15:44:18 +0100
Message-Id: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAMIt82oC/33Nz27CMAwG8FdBOS+T4/wp5bT3mDikjQPRqgalK
 AJVfXdcLmyimnz6Pss/z2KikmgSh90sCtU0pTxysB870Z/9eCKZAmeBgA6UBnnx3NU8+GsaeJk
 l2Bhtay00QQs+uxSK6fYkv4+cz2m65nJ/fqhqbf/BqpI8bdRB0z6is18/VEYaPnM5iVWr+BJQ4
 YaALHjt+q5tgrI9vgn6t6A3BM1CcGD2TQcmGHgTzEtwYDcEI0ECoWpC20Wl/B9hWZYHqP1u1Xc
 BAAA=
X-Change-ID: 20260130-page-volatile-io-05ff595507d3
To: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lyude Paul <lyude@redhat.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=YOVunpKh8rriMHxdsM4btTJnoAAZxpp6z69TlPOEWpw=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq8y3JUG0x1nePgD55NR6MXTFhwklev6GpT7O63
 jSLg5bIyAaJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavMtyQAKCRD6UCkIqsW9
 0AOyD/45gUocLa+Lkb1gFgkWEP2yD2p6y0Pz+rdDUBXXjQDs+HePIJeJMsF3xvvVj8DQI20ZkBl
 GFVSfsQsMDw3yWtNCs13S4MIu4crVcNdryWmNUW8q7X7DB81wNJDWQVj+nFKjBy5u86/gXgW5jl
 2ZPm1JxnoRpdI7AIOIAZ0bc/qBlSxFSfHd+rGDNhkrjY8/gMDih/qIxs+W8VnU3On9h96RebNjm
 nG2u8Nrq/r2YYbm5U5kDlXN9kEDZKp3LzEFPkjUlFy/WH2MB+DO8lbc1OZCVLuPt2IuwO75BpP8
 8L2oH+shax6LvpS7ctTBELUHEFLvstzkG3G+c9dcHeLVwtOS+txAoueU819rpDYI0j0B9UdHROs
 WbC5w/HCC1J9p2eqaWMik2SwMiIZOLNkmoMfesOUzPT1RBsTMOJsTK2TjbDrYxu6KUNvccg7RZw
 m4x8laMxeVy7jrizDnWomsRPsj2Ojiut4DHpkeplcwq3W7Cwtjpf2muyeCIs08DZICw/r8yMnWi
 uS3lIpVwI79gBJs2bhBNAAhl7FsLvjD1om3Vlqip5+9rtpimPVUpnFtgASnJhfHzjoy1Q14RiFL
 9EGC0NWji7qL6WddMIch3gExiqXyMRRyqeSXjY/elz8vZxWazOzi/5oxBecgp6I2avTAsko2hXA
 L42uTiv9se6aarA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds a way to copy data between a `Page` and memory that is
shared with actors outside the kernel, such as user space threads or
hardware, without introducing a data race.

The copy is built on `SysMem` from `kernel::io`, which already accesses
system memory with volatile or byte-wise atomic operations. The series
first makes the requirements of `SysMem` explicit by requiring freedom
from plain accesses for the lifetime of a view. It then adds
`atomic_per_byte_memcpy()`, a wrapper around the kernel's `memcpy()`
with explicit safety requirements, and routes the `SysMem` copies
through it. Finally, it adds `Page::{read,write}_bytewise_atomic`, which
take a `SysMem<'_, [u8]>` view of the shared buffer.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v5:
- Rebase on v7.4-rc2.
- Build on `SysMem` from `kernel::io` instead of adding raw pointer
  based helpers to `Page` (Gary).
- Add a patch that requires freedom from plain accesses for `SysMem`
  views (Gary).
- Route the `SysMemBackend` copies through `atomic_per_byte_memcpy()`,
  so that the requirements of the `memcpy()` call are explicit.
- Let `Page::{read,write}_bytewise_atomic` take a `SysMem<'_, [u8]>`
  instead of a raw pointer and a length.
- Drop the claim that `atomic_per_byte_memcpy()` is volatile.
- Add a non-overlap requirement to `atomic_per_byte_memcpy()`.
- Add examples to `Page::{read,write}_bytewise_atomic` (Alice).
- Link to v4: https://msgid.link/20260605-page-volatile-io-v4-0-0e217d9bf11a@kernel.org

Changes in v4:
- Split `atomic_per_byte_memcpy` out into its own patch (Boqun).
- Expand `atomic_per_byte_memcpy` documentation to explain the
  concurrent-safe semantics and to note that the kernel's `memcpy()`
  uses byte-wise atomic load/store instructions (Boqun).
- Clarify the src/dst asymmetry in the documentation of
  `Page::{read,write}_bytewise_atomic` (Boqun).
- Use the "valid for atomic {reads,writes}" shorthand in the safety
  lists of the new methods and of `atomic_per_byte_memcpy` (Benno).
- Drop the redundant data-race bullets that v3 added on
  `Page::{read,write}_raw` (Miguel).
- Link to v3: https://msgid.link/20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org

Changes in v3:
- Update documentation adn safety requirements for `Page::{read,write}_bytewise_atomic`.
- Update safety comments in `Page::{read,write}_bytewise_atomic`.
- Call the correct copy function in `Page::{read,write}_bytewise_atomic`.
- Link to v2: https://msgid.link/20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org

Changes in v2:
- Rewrite patch with byte-wise atomic operations as foundation of operation.
- Update subject and commit message.
- Link to v1: https://lore.kernel.org/r/20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org

---
Andreas Hindborg (4):
      rust: io: require freedom from plain accesses for `SysMem`
      rust: sync: atomic: add atomic_per_byte_memcpy
      rust: io: copy `SysMem` with `atomic_per_byte_memcpy`
      rust: page: add byte-wise atomic copy methods for `SysMem`

 rust/kernel/io.rs          |  72 +++++++++++++++++----------
 rust/kernel/page.rs        | 121 +++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/atomic.rs |  35 +++++++++++++
 3 files changed, 203 insertions(+), 25 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260130-page-volatile-io-05ff595507d3

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


