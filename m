Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F343A7E1E;
	Tue, 20 Jan 2026 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912774; cv=none; b=bEqHP3Rb8D7LbBQvwzD+DI2QEpgS4SA8YOQ7TDrfPczaEBEnBmeu6rS466WRxeMMFa9lzanIKjs5upgwlHkWWcxJb1Ey0QvvCBb8uGEWpTSXZtpB1ydJLVflkyyQ9uYUjJvx84mb663LW8yZz0+0Fn6S9yEWCEVVQ9zOEUugaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912774; c=relaxed/simple;
	bh=w7F9mUPyzDVIYB2eMnY127iEC4Wr0zKoUsbOCPcMIH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAG+F/ir51DYSO35LAB0WF+oBXWy3h58IdWl+xzTS+h1g63p3CYU/dhJwgGOAvJ2kTLJMlmtE1JiLFf/9e0hcVmVxopNDisqrIHqERn09qaKizMmY0aTxGVgB9EXXM2qMcGIVU/fRPzU3B/REm7vht2Llu+vTS6Kpq8f8y0+09A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DF0aRraH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DF0aRraH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13812C16AAE;
	Tue, 20 Jan 2026 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912773;
	bh=w7F9mUPyzDVIYB2eMnY127iEC4Wr0zKoUsbOCPcMIH4=;
	h=From:To:Cc:Subject:Date:From;
	b=DF0aRraHdFRd6DcwngUPaY+a3h7iHpf82hoV9pc8ItXC5BqZhiaw2kEwqk8frxtS8
	 /EH1pir7QyVwFiJsiY/cBHfLA9lPHIuYTmwwPZkbDikTUW5tuz6GTqKDUwRGlXHkj6
	 AuZKUVmtzS05TOP7h5LDhntJ8FcWF+EinnxO/XAshsGxtU5pwuv/MNbPsLq/FcxqAp
	 kFIl5aQsG5JP7pHpPfj2DSj/gpO0jH8MVDEUSG/033I2bGyiACnOQzGMu9TG9BuhJu
	 YOR3po1p4m9WjNoVq7DfVPp1lCpDsWSWdeZ7W6cjNkunnwHyT1N6VFh4YFka4B7WjQ
	 AtIW+ADWkXjgA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	abdiel.janulgue@gmail.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	russ.weight@linux.dev,
	mcgrof@kernel.org,
	tj@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: Add driver-core mailing list
Date: Tue, 20 Jan 2026 13:38:52 +0100
Message-ID: <20260120123925.28267-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the driver-core mailing list for all entries maintained under the
driver-core tree.

If existent, replace linux-kernel and rust-for-linux list entries, as
they're automatically picked up by scripts/get_maintainer.pl.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cf5466c3948..1f15d4a5b9a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4169,6 +4169,7 @@ M:	Danilo Krummrich <dakr@kernel.org>
 R:	Dave Ertman <david.m.ertman@intel.com>
 R:	Ira Weiny <ira.weiny@intel.com>
 R:	Leon Romanovsky <leon@kernel.org>
+L:	driver-core@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	Documentation/driver-api/auxiliary_bus.rst
@@ -7218,7 +7219,7 @@ DEVICE I/O & IRQ [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
 M:	Alice Ryhl <aliceryhl@google.com>
 M:	Daniel Almeida <daniel.almeida@collabora.com>
-L:	rust-for-linux@vger.kernel.org
+L:	driver-core@lists.linux.dev
 S:	Supported
 W:	https://rust-for-linux.com
 B:	https://github.com/Rust-for-Linux/linux/issues
@@ -7469,7 +7470,7 @@ R:	Abdiel Janulgue <abdiel.janulgue@gmail.com>
 R:	Daniel Almeida <daniel.almeida@collabora.com>
 R:	Robin Murphy <robin.murphy@arm.com>
 R:	Andreas Hindborg <a.hindborg@kernel.org>
-L:	rust-for-linux@vger.kernel.org
+L:	driver-core@lists.linux.dev
 S:	Supported
 W:	https://rust-for-linux.com
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
@@ -7683,6 +7684,7 @@ DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 M:	Danilo Krummrich <dakr@kernel.org>
+L:	driver-core@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	Documentation/core-api/kobject.rst
@@ -9826,7 +9828,7 @@ FIRMWARE LOADER (request_firmware)
 M:	Luis Chamberlain <mcgrof@kernel.org>
 M:	Russ Weight <russ.weight@linux.dev>
 M:	Danilo Krummrich <dakr@kernel.org>
-L:	linux-kernel@vger.kernel.org
+L:	driver-core@lists.linux.dev
 S:	Maintained
 F:	Documentation/firmware_class/
 F:	drivers/base/firmware_loader/
@@ -13944,6 +13946,7 @@ F:	tools/testing/selftests/kvm/x86/
 KERNFS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Tejun Heo <tj@kernel.org>
+L:	driver-core@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	fs/kernfs/

base-commit: c259cd7ea3c9ad369c473ba2385d82e3432088b1
-- 
2.52.0

