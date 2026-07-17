Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A439D35AC32;
	Fri, 17 Jul 2026 20:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321437; cv=none; b=AWp8VkEre0/84IFXrT50u+Z0sAWzSThQUZJbAs0vxZYaPMujrpGwjSlkXWwYAQSvZTAs96i8vBSEtdNHbkJ8De7fuAjSGQcUWwmj6zHsefsBEm0sj5n/ir6FJif+gx68ofSNFmJAt/kJrWS44O6faigNr6uNlNd4gtBjK0haWMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321437; c=relaxed/simple;
	bh=RETl3eLQxfArN1LuhdDjN1jvLsKi+ZcQVlq01MjdT1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d1hMoWk7YfXbFLmTacje8Rz5h01JWf2HsXjNuyvOPbGDCj7S6sOwNwTcqSMHpdgpkRD3fJ7DNPZlJMkeKM7awk8hgW2PmbU5nhOu9l26SOJp0fVLdSi+dGSXmRFYlpliYI+Q2+M4wec9Ya0D4zKW9+nAy1OiDevqVUd9zS1Zg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7u0Y2oK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7u0Y2oK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7001F000E9;
	Fri, 17 Jul 2026 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784321436;
	bh=NgTdbtddBGMa2gMghd5GgSzDtP6TQvkrOxvm5+yLuD8=;
	h=From:To:Cc:Subject:Date;
	b=g7u0Y2oKc9YT3bEgJ1/b4iG3FWlgg8d0h38WD9le2dSCIBQDAvzx6AbPsO/uhE5C9
	 vx7ED6T2HkVd0QHWcyR+iBV2gdSfwoUCPM97zXxNtP8VVCfNP/hAF4U2ShO3dERdlM
	 L64opdmuKT/rLqu7Moz46CRBFPEAbZK4gA6RYxBrDXOzDourzqIqgzS6cFKgUr/d8v
	 SNaiXxvV58F8mzM67T7RMX0Py/CLYUdWbatjDCbzZYLHQtqJiKXVytHK1amZSZSS9e
	 +2GtvSNhVqUlE/Kn9LrQdgxxM8gPBmzBQ6yEBXdcjNQSWdGLawXKdQxkNopjfxkvWp
	 1Z4sI+umM2Ugw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1] regmap: Clarify _regmap_update_bits() 'async' kernel-doc
Date: Fri, 17 Jul 2026 15:50:31 -0500
Message-ID: <20260717205031.197980-1-bhelgaas@google.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for the 'async' parameter didn't actually say what it does.

Reword it to clarify the read-modify-write mechanics: when 'async' is true,
the write is queued asynchronously, but the read will still be synchronous
unless the device uses a register cache.

Assisted-by: Gemini:3.1 Pro
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/base/regmap/regmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b02637..430dc8233c40 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -3296,11 +3296,11 @@ static int _regmap_update_bits(struct regmap *map, unsigned int reg,
  * Perform a read/modify/write cycle on a register map with change, async, force
  * options.
  *
- * If async is true:
- *
- * With most buses the read must be done synchronously so this is most useful
- * for devices with a cache which do not need to interact with the hardware to
- * determine the current register value.
+ * If async is true, queue an asynchronous write. However, most buses
+ * require synchronous reads, so the read-modify-write cycle will still
+ * block on the read unless the device uses a register cache.  Therefore,
+ * this flag is most useful for cached devices, where the current value can
+ * be read from memory without hardware I/O.
  *
  * Returns zero for success, a negative number on error.
  */
-- 
2.53.0

