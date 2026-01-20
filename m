Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8B441325B;
	Tue, 20 Jan 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912778; cv=none; b=OGvVMDakgY+S8+OHDh9jJUxo0YYshoOLLy4tdWboARMF4UT7weq3zDHJM1nv5r/VDdQ5+XtzvUm0psTSFNLri5ASdt0mcPyyFbz5lNRcYfn/eWvEu9f9u0cRIorV2OAUQFKpVVVHA8bLtSgLAlbHkmnXHLan40yZnDaPRTcvImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912778; c=relaxed/simple;
	bh=XNcHmwmMc5rUlwW8Y87Y8jAEmB7MhJppku7aSMR3aFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7WhGdXAZ33XPe40gMcqMce6KwHbFW5aF81NuyGJG4oU5eHaZWynuEdeP4P854uH3Zhp6motEyECEIRxEeoPbawttI1VQANUpWcMAnMI2VW+Dhpz7rnpPPg1vHDd/20PhgCBy9EqFGUgC5fgB7anJKlFBMLyInISboxVOUgDqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sfvlird+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sfvlird+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EAFC19422;
	Tue, 20 Jan 2026 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768912777;
	bh=XNcHmwmMc5rUlwW8Y87Y8jAEmB7MhJppku7aSMR3aFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sfvlird+DzcfhXpOvXORit2/vyP/8JYXqdaMphF9ai1rOV/vW7xSVVDhfLk7wZ0R3
	 +jLwUDJzUfg6b+MyBKD0FC1K8d2mT8DL/y8fqcrDOykqpiUxSrA6gNMPkdds2VHgk+
	 yMFY3gwkz+YhEBMn7EQm8eVss579yKlO692OXhjG6O3mlsfqIsKxM2MFT/dev97ogL
	 lsN/lP0Yl/rhpu+uigQTdEUU8+My3xHC44fsRx8LP0jzR9ft6VTyw/+0oSbvryNmgc
	 SreCw92y3aH5+JMlPJ8DtRXOru/+qxmSrG61HJcQgo+brklYta8pfYnSxt6R7RYf59
	 3pN5AOg6l8BHw==
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
Subject: [PATCH 2/2] MAINTAINERS: Add missing T: entry for FIRMWARE LOADER
Date: Tue, 20 Jan 2026 13:38:53 +0100
Message-ID: <20260120123925.28267-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120123925.28267-1-dakr@kernel.org>
References: <20260120123925.28267-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware loader is maintained through the driver-core tree, hence
add a corresponding T: entry.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f15d4a5b9a5..7faf04cc4278 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9830,6 +9830,7 @@ M:	Russ Weight <russ.weight@linux.dev>
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	driver-core@lists.linux.dev
 S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	Documentation/firmware_class/
 F:	drivers/base/firmware_loader/
 F:	rust/kernel/firmware.rs
-- 
2.52.0

