Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265070;
	b=5nM0BSCD2eDBkw/wS+542uHaMyPaTwwjya3ylPQNin+yNdOMfu0q0shXLnQlGOvNZ6Nb
	 okr7Rkh9qwxIeZ5qzziwwY37OKmDKsRJuebla7iag34jUr74qSDDw/NkTPU0xlrWw9MqL
	 p789RMbhW/xoSmaxXRW5L7KAjFcir4lfy+KsW0CTAW+DbVxhozdpLEhLn4lH6RVLOd6no
	 2+sh9RHziekkQr63SIYbtiemf+27i0BwW5pBq7BJclCX/B7aV/SUBRCzpCe01tb0kHShK
	 sXgSQjlV9HYwwo3ALt53lytoyX3MjYyS8/UDW+aR7+VX0+Ro3uMb+jU1NvAuqxrvavg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=tNdBMbdoUEpfdlsrGN0ZMJtoQWQSOQgXpAFu+PGWRXM=;
	b=gglaJv8AjTM0LOs18Wfvi9HdGK+vG23SNtMtjODo1F1AKKFiEDkzQ2tZexJKIkFHWtDz
	 alfuEpU9GDtM7o5FNz4fOYx/XTISo42qKipn8c0DHFcLYIX1lc7TtADAGp6JFiBzPeIdc
	 M7YHWD/26hqC4uqooklgvPLcJhbW3qLVj/yz99Cij5Iwpd3LYZscimWvObYx09jVi9rdy
	 fB3CAjkgrMjncaJEcgI7QKpocvsfGgekmUGxisRhKh7bIQG1g5OrNx9htt+8mwISGOhQL
	 JreOGpwQAgDSWXARIjiAZcDuH8DFSF1M+T+7ovGSYoRPKoB+4OEf9kH8GJQUvWFwqjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Xw06Qho/";
	arc=none smtp.remote-ip=91.218.175.220
Received: from mta0.migadu.com (out-220.mta0.migadu.com [91.218.175.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72086606A32C
	for <driver-core@lists.linux.dev>; Sat, 21 Nov 2026 12:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72086606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Xw06Qho/
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XECq9aDnW9kZH8EtKIoKopBym0h/9xhYm1C9psIsN0o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795265067; v=1; x=1795869867;
 b=Xw06Qho/Q2nIAfN7V3cUkmkzr036hxhkDjBQm1R7axUIo1tQOgEZDS3hiqA6bLxHvt+MkTeq
 zxCfemYY5HdPvR47XmC/WiJNy/q6FNhnxJGl4w1RFc/YYCMEQ+IZrDC9vikgyupIFrHpO6qXp1D
 tiuMkzgTB7X/8TuTIdVU0zng=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d270eb0436d1fdfb;
	Sat, 21 Nov 2026 12:44:27 +0000
X-Mizu-Trace-ID: d270eb0436d1fdfb
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH 0/3] regmap: 2nd clean up and improve __regmap_init()
Date: Sat, 21 Nov 2026 20:44:18 +0800
Message-Id: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgM2SiteRRyKjZrBWlIQQXp3i
 +Mb/n8hswpnmJoXlG/JcsUK0zawHj7ujBKqgTqyxpBB5f30CeVMet2MFAP2zjpLPISReqhhUt7
 k+afzUsoH0mQnWWQAAAA=
X-Change-ID: 20261121-regmap-improve-2nd-376762e4d823
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

This is a re-post of patch 8-10 from [1] with addressing Mark's comments
to patch 8 [2]

[1] https://lore.kernel.org/all/20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com/
[2] https://lore.kernel.org/all/179510759875.116416.1025341724543668395.b4-review@b4/

This series removes the per-device regmap_bus copies used by the I2C and
SPI helpers to override max_raw_read and max_raw_write, converts the
__regmap_init() error unwinding to the scope-based cleanup API, and adds
KUnit coverage for the new init_limits callback.

The first patch replaces regmap_bus::free_on_exit with an optional
init_limits() callback. It is invoked after the bus raw I/O limits have
been copied and before the cache is initialized. The ordering matters
for maps with raw register defaults: regcache_hw_init() reads them back
from the device during initialization and chunks that transfer using
max_raw_read. Following review feedback, the callback takes the bus
context, the config and pointers to the limits instead of struct regmap,
which is private to drivers/base/regmap, so bus implementations outside
the regmap core can use it.

The second patch converts the __regmap_init() error unwinding to the
cleanup API. A dedicated release helper unwinds a partially initialized
map in the same order as the old labels. map->cache_type is now assigned
just before regcache_init() and reset if it fails, which makes
regcache_exit() safe to call from the cleanup path at any point.

The third patch adds a KUnit test that lowers the raw I/O limits from the
init_limits callback and relies on raw register defaults. The test
verifies that the cache readback is split according to the limits and
that the callback runs before regcache_init().

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      regmap: drop regmap_bus::free_on_exit
      regmap: use cleanup API in __regmap_init()
      regmap: kunit: add test for regmap_bus::init_limits

 drivers/base/regmap/regmap-i2c.c   | 85 ++++++++++++++++++-----------------
 drivers/base/regmap/regmap-kunit.c | 91 ++++++++++++++++++++++++++++++++++++++
 drivers/base/regmap/regmap-spi.c   | 66 +++++++++++----------------
 drivers/base/regmap/regmap.c       | 77 ++++++++++++++++----------------
 include/linux/regmap.h             | 10 ++++-
 5 files changed, 207 insertions(+), 122 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261121-regmap-improve-2nd-376762e4d823

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

