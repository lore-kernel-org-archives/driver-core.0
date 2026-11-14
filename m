Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661333;
	b=B92M6i10H7Dq/1kHf6oo9OabUyG2bdmeC7MLJZ2DMoEC8DggLl7hTEDtqOoXbZibrWIF
	 9+qPs6TcZ8MSRNp7ImUuAQpmx0VjjlnYbKxiLSL8GGTuvRvqIwtHgbhgvaV1UHeoRU7Zr
	 Q5TjxX1diDpdYqQeSBuu3krfjbIxAmUA0lAto9JX/bH0dGddJGxerY5spIXxrrSnJ2o5e
	 U04cTP4J7C1PrxnTT3IWb0AUAkPZM2VynjoceqFU7JGJV5dWw2LoPUjT3N4AZLI9Rveir
	 +mS/06+kf3rIu8eTGEeXv8lFzCIEaZFz56LGJyAeusIHzZ/eTK+VcgkZUHpwDz84wuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661333;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a8liVn8UnmABTsZeVzknmD9S4lrmecQUdkrhMDrS/qc=;
	b=muwvLErs1WrZQq1YU8RV3xc6U3r25RkkTi+3qvv57xd8A/RxocF3HcRmEX6VrMEp71lZ
	 qO63SEYJBr9CGkyrrp7pWu8EN/ee+jrZ+/t8Lczp6N0t0E39nq663Vb+GtVivDymElRHL
	 vWOgwNlhrPfLMBU2WfgASXnVBvOr6mKzmRgyf7eDpqTh+mwzkVRS3moTL9WvSiEZcATZx
	 pHdRoN3aPcDJt/LtAZV/nx9I7lxWiwKdXsYu07UUtZShJqzWJvCbQ7lM2XEhjk6zoNENj
	 p7maDTn+5NYewTCsCLJY3HgFfJ5e2xrn6sEhi/XTqtxEfCtVK94JMiNyEL2GRXFpNaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G92UHqYQ;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC9606A329
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 13:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACC9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G92UHqYQ
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=aYTMwJcPZaY5jEHCZOnBOG5kZTkcaCeEJxo5vnx5Zkg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794661328; v=1; x=1795266128;
 b=G92UHqYQd8vcWUACvf4Pq2/T7VcPxhT5jA+UW1tJSikhXG8bNZJTlL7YYZSp8FOjmhgp4fMi
 LImH1w4yqahQJWxXZQ56IjirHi0Z/5WcY7uSMZp8XveuNE7btYS992trH3UJgi2RnP9hMpgQhy5
 gf/yVP989+etmA+2esgnWCwk=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6edc8f0930fb8514;
	Sat, 14 Nov 2026 13:02:08 +0000
X-Mizu-Trace-ID: 6edc8f0930fb8514
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 21:01:57 +0800
From: Peng Fan <peng.fan@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 00/10] regmap: clean up and improve __regmap_init()
Message-ID: <avhbxfOZqN048N-Y@fedora>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>

Hi Mark,

On Fri, Nov 13, 2026 at 11:31:48PM +0800, Peng Fan wrote:
>This series includes three fixes for pre-existing regmap issues noticed
>during review, improves the __regmap_init() error handling and removes the
>last user of regmap_bus::free_on_exit. Patches 1-3 are fixes suitable for stable;
>patches 4-9 are cleanups with no functional change intended; patch 10 adds
>KUnit coverage for the new bus callback.
>
>Patch 1 fixes the cache reinitialisation failure paths. regcache_exit()

I am thinking to drop patch 1(which seems not a correct fix) from the series
and use a separate patch to avoid sending a large patchset again, and the
other nine patches are orthogonal with patch 1.

If there are issues that I need to address for patch 2-9, I could
continue picking up patch 1 in v3.

Is this ok for you?

Thanks,
Peng


>freed reg_defaults_raw without clearing cache_free, and a failed
>regmap_reinit_cache() left map->cache_type set, so a later regmap_exit()
>could free the raw defaults a second time. It also drops the old cache_ops
>after tearing down the cache, so a successful reinitialisation to
>REGCACHE_NONE cannot leave stale cache ops behind. Clear the ownership
>state and leave the map without a cache if reinitialisation fails.
>
>Patch 2 fixes regmap_get_i2c_bus() so that applying an adapter read quirk
>no longer drops the raw write limit advertised by the selected bus (and
>vice versa). It currently starts from zero-initialised locals and
>overwrites both limits of the bus copy.
>
>Patch 3 fixes the raw write limit calculation when the adapter's
>max_write_len quirk is applied. It compares the bus limit against the
>quirk payload size rather than the whole-message size, avoids the
>underflow when the register address alone exceeds the quirk limit, and
>keeps the existing limit when the quirk cannot fit a single value, which
>would otherwise lead to a division by zero in the raw write chunking.
>The same minimum-size guard is applied to the read quirk.
>
>Patches 4-7 are mechanical: evaluate fast_io once, and factor out
>regmap_set_lock(), regmap_init_ranges() and the format selection into
>helpers. The forward goto and the label-based unwinding are reduced to a
>single error path.
>
>Patch 8 drops regmap_bus::free_on_exit. Instead of kmemdup()ing the
>static I2C/SPI bus to store per-device raw I/O limits, add an optional
>regmap_bus::init_limits() callback. __regmap_init() invokes it before
>regcache_init(), which is required because regcache_hw_init() may read
>raw register defaults from the device during initialization and must
>already see the effective max_raw_read limit. The static bus structures
>can then be used directly and the per-device allocations disappear.
>
>Patch 9 converts the error unwinding to the cleanup API and drops all
>err_* labels. map->cache_type is now assigned just before
>regcache_init() and reset to REGCACHE_NONE on failure, so the release
>helper can safely call regcache_exit() on a partially initialised map.
>
>Patch 10 adds a KUnit test which verifies that init_limits() is invoked
>before regcache_init() by checking that the raw default readback is split
>according to the limit installed by the callback.
>
>Testing:
>- Built drivers/base/regmap/ with W=1 on x86_64.
>- checkpatch.pl clean for all patches.
>- regmap KUnit suite pass.
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v2:
>- Rebased onto next-20261112.
>- New patch 1: regmap: fix reinit cache failure handling
>- Patch 3: regmap-i2c: fix write limit clamping for adapter quirks
>  Correct fixes tag
>  Rename the patch subject.
>  Fix write limit clamping.
>- Patch 5: regmap: factor out regmap_set_lock():
>  Move ret = -EINVAL below the successful regmap_set_lock() call so it
>  cannot be clobbered with 0 on success.
>
>---
>Peng Fan (10):
>      regmap: fix reinit cache failure handling
>      regmap-i2c: keep bus raw write limit when applying read quirk
>      regmap-i2c: fix write limit clamping for adapter quirks
>      regmap: deduplicate fast_io checks
>      regmap: factor out regmap_set_lock()
>      regmap: factor out regmap_init_ranges()
>      regmap: factor out format initialisation into helpers
>      regmap: drop regmap_bus::free_on_exit
>      regmap: use cleanup API in __regmap_init()
>      regmap: kunit: add test for regmap_bus::init_limits
>
> drivers/base/regmap/regcache.c     |   8 +-
> drivers/base/regmap/regmap-i2c.c   |  68 ++--
> drivers/base/regmap/regmap-kunit.c |  89 +++++
> drivers/base/regmap/regmap-spi.c   |  64 ++--
> drivers/base/regmap/regmap.c       | 714 +++++++++++++++++++------------------
> include/linux/regmap.h             |   7 +-
> 6 files changed, 541 insertions(+), 409 deletions(-)
>---
>base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
>change-id: 20261109-regmap-improve-915eee5a80ec
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
>
