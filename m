Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF6E359A91;
	Fri, 19 Jun 2026 10:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863422; cv=none; b=vAIKIiRlX6t3BOYjA4j0NMF9D9Uru6KpwbKreieqRtnGnqebJZRJP+F9HncRNI5TIRDsFtjdyfB00SwuzlNaZNDtwX1HG5QxFl6NK51b0HEmcyCSGqwW9fMjhr0Rtr3GlwcDjhtApejgfNtykOEmwHLyCAE0SmUcq5jR/39AsII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863422; c=relaxed/simple;
	bh=vw8uWlA8rw7pLm015RIKurVNob2IBv1t2YLzwgt8Q6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jW2zXH0Zi4KYIPGDMPbME23D/GzAsr/EIvqKBxnQHKjJVJc9IvGqOT5MaxCsVD+KcJ0xERusrK7TZSRlCF4voXdWM8XmAwb/yct2BgT7Zpp0IKeA2a7rTVcAuhGdAnEWpYCK2R7UEP3obBhw4eH/dutUxIPZOQxCNMKi9KGoU0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4F71F000E9;
	Fri, 19 Jun 2026 10:03:35 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: driver-core@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] base: Remove unused DMA_FENCE_TRACE Kconfig symbol
Date: Fri, 19 Jun 2026 12:03:31 +0200
Message-ID: <16fb40ded203d1e2b72f4eeecad3fd0c0d23ad6f.1781863296.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit d72277b6c37db66b ("dma-buf: nuke DMA_FENCE_TRACE macros v2") in
v5.16 removed all users of DMA_FENCE_TRACE on the premise that the
Kconfig symbol did not exist.  Apparently one failed to notice the
symbol did exist since almost five years before: it was renamed from
FENCE_TRACE to DMA_FENCE_TRACE in commit f54d1867005c3323 ("dma-buf:
Rename struct fence to dma_fence") in v4.10.

Time passed by, so remove the Kconfig symbol, as no one seems to have
missed the functionality.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/base/Kconfig | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index f7d385cbd3ba4b2b..43f20ca95a2a6ba9 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -222,15 +222,6 @@ config DMA_SHARED_BUFFER
 	  APIs extension; the file's descriptor can then be passed on to other
 	  driver.
 
-config DMA_FENCE_TRACE
-	bool "Enable verbose DMA_FENCE_TRACE messages"
-	depends on DMA_SHARED_BUFFER
-	help
-	  Enable the DMA_FENCE_TRACE printks. This will add extra
-	  spam to the console log, but will make it easier to diagnose
-	  lockup related problems for dma-buffers shared across multiple
-	  devices.
-
 config GENERIC_ARCH_TOPOLOGY
 	bool
 	help
-- 
2.43.0

