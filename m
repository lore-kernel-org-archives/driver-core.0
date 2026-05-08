Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE647383C97
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233959; cv=none; b=k9miwttsFEWIAACE6BnXASb8Ap5DMYIqb2YjtbsYf2JTXMCPxyyTBNL+PitrFF4N0lLN9KvvkHkdtKC1xBraI6J5HzpcnPQ7IHP5vUcqgg5JYWdQ1QkVmRFWtU915HXEnj5vkvZj9RiwPYycTQG6uJwyj5J79ijjV45+o95xvG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233959; c=relaxed/simple;
	bh=tcT4Ke3eonYhGbRY7q/wz2GsdpR5v03TooPgQ/VT3So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HC74z5Gln8rfjfQdpLYZhOR7rTaPj3QzYJmV1kEP1t4vjXilaTYqMb46L+3IsY/2/92enhzuHWGUXrvk+HZka7qP7LlRQ9OjVtCHWdF4ETVHSxBOA8+E4qFEo/vPXqckB16rK/anVD89bRLGBzi5PaBRPliYoxWyO5Q/RdLQ9mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ync9TNYo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ync9TNYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778233957; x=1809769957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tcT4Ke3eonYhGbRY7q/wz2GsdpR5v03TooPgQ/VT3So=;
  b=Ync9TNYoqCqhsTlmrTodZziJwnEhhvqEqEcDTTRpMWwa5x7HCJk2VBd3
   4pyrZb+w6lmGQZDzKC31zmra4b0SdEbVCJRAFv075N8mZ2vBZqZkW0n0/
   yKfhKZFkpSIbwsyltJ5/0CLInEKmDfDjmuq+a9EatcX3SXaqSe3EViZEf
   fORAHoCUbTfn5gLzEYiCgoYK9yrEZbEiOiGM+kCV7zMDi1qAkbKjXdiAj
   YOj6NbOww8NCq+c1c6KRn/4zs7MG+yghsALTBha8T4pop8z7/B0Mqjh4B
   f8YimTQlB0VudRNIOreGf+dDDC841FThgoETmym6cvkmg6cgwwKBswpkq
   w==;
X-CSE-ConnectionGUID: Agd1z+uWT16DMadhl7XPfQ==
X-CSE-MsgGUID: isr+LCmiRA+s0oBzjGo1nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="104659531"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="104659531"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:52:33 -0700
X-CSE-ConnectionGUID: 44ayaFGvTg6nqP32p7SG/Q==
X-CSE-MsgGUID: /Kk7z0f3Qe+4X+3NVhkh6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="235740003"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2026 02:52:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4C08398; Fri, 08 May 2026 11:52:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 0/4] driver core, iio: suppress driver_override
Date: Fri,  8 May 2026 11:42:38 +0200
Message-ID: <20260508095224.1275645-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently Sashiko started reporting the missed NULL check of
spi_get_device_match_data() or device_get_match_data() in SPI drivers
in IIO subsystem. It appears that the way to crash can be made by use
of driver_override sysfs attribute. However, many drivers, that may be
instantiate via ACPI, OF, or, in some cases, user space won't work
without necessary driver data. These are, e.g., most of the drivers
in IIO subsystem. Trying to override the driver for the device that
has no matching entry makes no sense in such cases and might lead to
a crash, when the driver is not prepared for that.  Instead of adding
a NULL check for driver data pointer in each of that drivers, effectively
meaning a dead code for normal functionality, introduce a special
attribute in the struct device_driver to allow drivers just to hide
the attribute for good.

The last two patches are the examples of use and code simplification
at the same time.

I consider getting an Ack from Mark for SPI, and from Jonathan for IIO
and route this via driver core, while providing an immutable branch/tag
for the above mentioned stakeholders.

Note, this doesn't change the state of affairs for some busses that
do not have driver_override flag set while using custom approach.
On a brief look it's the s390 crypto case which may not ever need
the above and hence left untouched.

Andy Shevchenko (4):
  driver core: allow certain drivers prohibit override via sysfs
  spi: Support suppress_override_attrs flag
  iio: imu: inv_mpu6050: Suppress driver_override sysfs attribute
  iio: imu: inv_icm42600: Suppress driver_override sysfs attribute

 Documentation/driver-api/driver-model/binding.rst |  4 ++++
 drivers/base/bus.c                                |  4 ++--
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c   |  8 ++------
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c         |  3 +--
 drivers/spi/spi.c                                 | 11 +++++++++++
 include/linux/device/driver.h                     |  2 ++
 6 files changed, 22 insertions(+), 10 deletions(-)

-- 
2.50.1

