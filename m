Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583923;
	b=VfDYe4GJ8Gktgu5KFqPT79zJvaiiAt1QxMkhWuboBwK0oXROuZTY2btWbpJV3eepU8PC
	 tSpYKmXGN780G5H7WVlnqtXdo1nlW8N7JITTGzdOrwrWRdQ11bcwSD2kE6mHz4ZXurRxY
	 ii1AwPDu9Hc/mf7FPY7F1FNBwDkXXSOvvzwfHv8Fay0bkPtLvZv5+f3sVrbj6bKZwDrac
	 S94mgq840xPwn/JPD70AYGgPICiadt8xIG0XMI0PN8eKYpcMbjwrHtwxPEApI0IL33hn/
	 qWj8yv094QBer8RoJ/GRghnLD9BI2Q/JFZ3alqTRTRHKXnbC0U1FtqzK06QnjepZOrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583923;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=vb/wvWEXYJTWDbfL/XjJ6tbYV6An8CqbOa3HRnqBz9I=;
	b=d9SbEJ3CAdQlxDThmPXKhwTJM9nZx33RlY0u/hXDaVjz1pb3enCQceeKwoyhkW3rNEWa
	 tUyChBoJtN9/nHh2KHo7Rk5m+QdNfcxRn/NheocwJ3G5gMH56qFngESfBOJIeDgdGDfsL
	 ognng/7+ef4Yz+504b87rp3dSJi2VgffxWQ7Ymz/yRuAV3zmnY8LuN7J/o5FBZKWmTddW
	 MJNWPtYOwgjtVaK226irOxBl7SXIBsugB2LbC/ObOqkQnJPd+3zttQHGHfaNv/uLih+2N
	 Pmp0R0TVJ4FiJPTgz0xx3aeQsbZJ9NDyL7sIWxDrpNBbjJ7AfjfLhEGBTIrMAEqi2BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kbs1VQu+;
	arc=none smtp.remote-ip=91.218.175.36
Received: from mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C172606A32D
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C172606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Kbs1VQu+
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=qzkxtRDMf6Gn6Zr4pVgwhUr4A1UzL/cqXjy8kwU7GxI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583920; v=1; x=1795188720;
 b=Kbs1VQu+BDeKtI8HMO45s2pzFOfKW1ywjmU745zqUwyZMFlHmZHFr0eOgKzwHcmwrcCMNeD8
 zLtPBK8t+6E1/mYTTD2N3mPz44aFU99dCOKEhWlliBjGSMj7WqrXmY2MjEFxRFLe8Th095hZv7d
 XkcYhuUAf7IrcTYCJVY3TLv4=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id f56dcdb89d24520c;
	Fri, 13 Nov 2026 15:32:00 +0000
X-Mizu-Trace-ID: f56dcdb89d24520c
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Subject: [PATCH v2 00/10] regmap: clean up and improve __regmap_init()
Date: Fri, 13 Nov 2026 23:31:48 +0800
Message-Id: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBG4avIrBNUMKqrRAupv5pFJSNIIN49a
 fkt3iuUIIxEkyokyJz4uRtcp2g9w31A89ZMzrjeWjNqwXGFqPmK8mTo0XoAPgwGK7UoCnZ+/+G
 81PoBZXYayWAAAAA=
X-Change-ID: 20261109-regmap-improve-915eee5a80ec
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

This series includes three fixes for pre-existing regmap issues noticed
during review, improves the __regmap_init() error handling and removes the
last user of regmap_bus::free_on_exit. Patches 1-3 are fixes suitable for stable;
patches 4-9 are cleanups with no functional change intended; patch 10 adds
KUnit coverage for the new bus callback.

Patch 1 fixes the cache reinitialisation failure paths. regcache_exit()
freed reg_defaults_raw without clearing cache_free, and a failed
regmap_reinit_cache() left map->cache_type set, so a later regmap_exit()
could free the raw defaults a second time. It also drops the old cache_ops
after tearing down the cache, so a successful reinitialisation to
REGCACHE_NONE cannot leave stale cache ops behind. Clear the ownership
state and leave the map without a cache if reinitialisation fails.

Patch 2 fixes regmap_get_i2c_bus() so that applying an adapter read quirk
no longer drops the raw write limit advertised by the selected bus (and
vice versa). It currently starts from zero-initialised locals and
overwrites both limits of the bus copy.

Patch 3 fixes the raw write limit calculation when the adapter's
max_write_len quirk is applied. It compares the bus limit against the
quirk payload size rather than the whole-message size, avoids the
underflow when the register address alone exceeds the quirk limit, and
keeps the existing limit when the quirk cannot fit a single value, which
would otherwise lead to a division by zero in the raw write chunking.
The same minimum-size guard is applied to the read quirk.

Patches 4-7 are mechanical: evaluate fast_io once, and factor out
regmap_set_lock(), regmap_init_ranges() and the format selection into
helpers. The forward goto and the label-based unwinding are reduced to a
single error path.

Patch 8 drops regmap_bus::free_on_exit. Instead of kmemdup()ing the
static I2C/SPI bus to store per-device raw I/O limits, add an optional
regmap_bus::init_limits() callback. __regmap_init() invokes it before
regcache_init(), which is required because regcache_hw_init() may read
raw register defaults from the device during initialization and must
already see the effective max_raw_read limit. The static bus structures
can then be used directly and the per-device allocations disappear.

Patch 9 converts the error unwinding to the cleanup API and drops all
err_* labels. map->cache_type is now assigned just before
regcache_init() and reset to REGCACHE_NONE on failure, so the release
helper can safely call regcache_exit() on a partially initialised map.

Patch 10 adds a KUnit test which verifies that init_limits() is invoked
before regcache_init() by checking that the raw default readback is split
according to the limit installed by the callback.

Testing:
- Built drivers/base/regmap/ with W=1 on x86_64.
- checkpatch.pl clean for all patches.
- regmap KUnit suite pass.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Rebased onto next-20261112.
- New patch 1: regmap: fix reinit cache failure handling
- Patch 3: regmap-i2c: fix write limit clamping for adapter quirks
  Correct fixes tag
  Rename the patch subject.
  Fix write limit clamping.
- Patch 5: regmap: factor out regmap_set_lock():
  Move ret = -EINVAL below the successful regmap_set_lock() call so it
  cannot be clobbered with 0 on success.

---
Peng Fan (10):
      regmap: fix reinit cache failure handling
      regmap-i2c: keep bus raw write limit when applying read quirk
      regmap-i2c: fix write limit clamping for adapter quirks
      regmap: deduplicate fast_io checks
      regmap: factor out regmap_set_lock()
      regmap: factor out regmap_init_ranges()
      regmap: factor out format initialisation into helpers
      regmap: drop regmap_bus::free_on_exit
      regmap: use cleanup API in __regmap_init()
      regmap: kunit: add test for regmap_bus::init_limits

 drivers/base/regmap/regcache.c     |   8 +-
 drivers/base/regmap/regmap-i2c.c   |  68 ++--
 drivers/base/regmap/regmap-kunit.c |  89 +++++
 drivers/base/regmap/regmap-spi.c   |  64 ++--
 drivers/base/regmap/regmap.c       | 714 +++++++++++++++++++------------------
 include/linux/regmap.h             |   7 +-
 6 files changed, 541 insertions(+), 409 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261109-regmap-improve-915eee5a80ec

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

