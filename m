Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8C1424D42;
	Tue,  4 Aug 2026 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873198; cv=none; b=jSDRElBCq0v51pVphHZmvFJWUlv+rWMYr8rUBoEn+8AKLlFNwYj93kSu0UAAevGvNR8CwKOxrhtsvTiJb8yKE3GYfI8nClB0zFB5ms1fC2jy+/bAPSivR/KuXyj04EjAbruflyYVheJFwh4bFxU+FBIOfLeod9NHoJAg9rSiNlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873198; c=relaxed/simple;
	bh=6+gjh4Gvuj/YByD6T4ssZ+a7Z2aa8iuzagit5WYBSzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/+xUrNhD75gITdvjPv7MZNLsO7M6ek3t/jN4DPJPrjgzT+kkamAVLTMydtt2IxCkrVYKtS2a7xONHYm8Tr/uiWj2KIw56jtGjRRDLdBptdTr3/XArngrZdHq2wfIJ19qcvKKDg0TANCZnEZVzGiHf3G4at1oExSQzQgGIRWtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luReNjZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luReNjZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FBA1F00A3A;
	Tue,  4 Aug 2026 19:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785873197;
	bh=Q3IT0ymdhSoxgrdPIf0dd7pDLblnnETkkoNTCHMHVzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=luReNjZzp1BIDymY2SzpWaiAmm3owb7RNK9JLnt3ouljLbllMySafBAEbVKQ3iBTS
	 XLKzmBsHtbhDsM/B9pl7fGjdJzbSA0tTolARYCggxB9smOvR/3THqgXjJ4rjieY6pn
	 2G6h0ToFtcHGgvqOdY9hjKNpzOfiYz5TVvQ5o4hPWzGDEGAN9VzZNRPYwpQjHem+g/
	 Z+bWQDIdJAG60DcHxwV8FxZgm8rDuDHRm0S5/CKoXMdApkeHXe4lkIuE2MLEojwK/a
	 H4B+/Kncx3c/NGmoVkLfvF/tzLUkAU5CFPtmm4ouCVMCP3iHunP0FqXRM+W2f3wlDj
	 Y0kPxC7/M20qQ==
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
Subject: [PATCH 3/7] rust: workqueue: create workqueue subdirectory
Date: Tue,  4 Aug 2026 21:52:05 +0200
Message-ID: <20260804195248.665636-4-dakr@kernel.org>
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

From: Alice Ryhl <aliceryhl@google.com>

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)
 rename rust/kernel/{workqueue.rs => workqueue/mod.rs} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f672858996f0..9cee804d840d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29155,6 +29155,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs
-- 
2.55.0

