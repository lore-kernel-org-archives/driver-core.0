Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DC346D543;
	Tue, 21 Jul 2026 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648947; cv=none; b=VazFeYqetE0jKvCPklumCYTGJMi1crrKtnDAM156Y+HSxQJxNYxLshVkWPVMRcmeBsbhKIPYXPWXKVW22ufpFYIm7BPt3uOW3U8SWz3eOfAzAHtHrasBN1j6j/w+eGHBZrZ+C5QTlWtFmRXVtuYYN9N1bohwqexfdUi6ovcDkzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648947; c=relaxed/simple;
	bh=tWLKvSwHd/12fPv1tFRPpB6yvf1qvD8/kriGpC/rAbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neE7zDUVWb9lx8NLw8OW/1SA3Nq4zPzJEI5Ju5ryH7ToXzVzD+Ttd40M3wOLR/7BzV1HqwyDR5OQA1IQeqMftQv7y5qqn/Hl7H3OcbWvUwZj69MJfaRIzcZAL76gQCHSZHqDQwQHzhUO5XunUilQOaU7ziZ7K0j78niBVRL7njo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwJBrFNB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwJBrFNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E131F00A3A;
	Tue, 21 Jul 2026 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784648946;
	bh=X1i7lG2IapMmAixltdm5Db6EAqu8CMqr4RwEK0vzIAU=;
	h=From:To:Cc:Subject:Date;
	b=IwJBrFNBeQLntLQcDytTgo2g6ecxisdBUXp02VX7w3MTX2ud7Q2hLJnCZfc1+FuVu
	 r/9faUrwEcHTZtVqdhnl1g9lIEWCrBHIwZYa0iC8JquSc8wRJU0a1y0DQbftYM5ngA
	 CVuWezLHJ3n8AbgnFNQ1nIs3MyoOF13jHBcrgRaFsocG7pjcABMt0hIfeA1ipgQ9sx
	 Uby+VlhqrO4/Ci4Xx+WpkRcLQXHMatU2XMKA8a4GugVf+g5exf8mcxkD1b4rSOn+pp
	 5UskKU2XxPXmmbK20bsclkQ8c+Wb7yH8jkcf5hWfoHQHm3zeSBVpd+7+LvucmKyNbR
	 1T/nnzFKTnRWg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2] regmap: Clarify regmap_update_bits_base() 'async' kernel-doc
Date: Tue, 21 Jul 2026 10:49:02 -0500
Message-ID: <20260721154902.566531-1-bhelgaas@google.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for the regmap_update_bits_base() 'async' parameter didn't
actually say what it does.

Reword it to clarify the read-modify-write mechanics: when 'async' is true,
the write is queued asynchronously, but the read will still be synchronous
unless the device uses a register cache.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
Changes since v1:
  - Shorten doc, mention the correct function in subject

v1: https://lore.kernel.org/all/20260717205031.197980-1-bhelgaas@google.com

 drivers/base/regmap/regmap.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b02637..d0deddec516f 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -3296,11 +3296,9 @@ static int _regmap_update_bits(struct regmap *map, unsigned int reg,
  * Perform a read/modify/write cycle on a register map with change, async, force
  * options.
  *
- * If async is true:
- *
- * With most buses the read must be done synchronously so this is most useful
- * for devices with a cache which do not need to interact with the hardware to
- * determine the current register value.
+ * If async is true, queue an asynchronous write. However, reads are
+ * synchronous on most buses, so they will still block unless the device
+ * uses a register cache.
  *
  * Returns zero for success, a negative number on error.
  */
-- 
2.53.0

