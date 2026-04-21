Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp [211.125.140.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9337C937
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 06:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751992; cv=none; b=KeRm0YUYnPqoIo+5Ql/5u4n0USeBp1YFVJ1XvoYQaqKypes+Cvx4j1JwEGXz0XvK/ubh0eXkTyQhKoFadwnaYxb69cDx7RpPJ2g1a58rXJnxG6l1UbHtiEaxB5nIbK0QfOORgOzluleQvuZu/OmocSi9zdKDdmeha1JQNX6ipOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751992; c=relaxed/simple;
	bh=cq5j1N/tLVr7JQQAEFQwE+5Pc1i9Ewpt4Q5nOJ0PQwE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sgrBPlWvGKQcO9paJ6FSf1nfanC22l4cg0ZK2wrQy5V79CB4vFF6Uz+UB3jsulHzpZ37hAJF6qshVWB8w5MjyX9XlViFTA0v+GkxfTs00s+fqNiEVyTewnuzgM78BYXjcLqoxaz3OXgo2reO+i9IUPZUS/u6UylDvGwTyms9ESs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=V9YZTwcS; arc=none smtp.client-ip=211.125.140.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="V9YZTwcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776751991; x=1808287991;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=f1rqbhKZQGPjKM6rafuitMg1brZYqWCZ8SEDj4DxtvI=;
  b=V9YZTwcSbixysz7I8WkdKxKoLUJf7wNvt2QW4Sgl+6f7crJ7QplXj061
   IeZNITLzkP1QDhbZOUJMSHpaPqVOmEvhbcplszbKcOGjxAfVQdwixRt9N
   iuC1s/1N74i0QLF5NigEJJPomUJC8HbkIOvZCPhCoPgIxfmjdm8SAiARz
   U5ILrauaA67niBZKHKt3Eptxl5znFB0GXKeG/S9kfRTlxVpGKq7Fpf0cL
   Q5Hl6kLttrhBzWYUziKmSGBJqgVA1zE+MKDiWc5kxs+o+cjfwOy+CkZyb
   OFUR1iaQO6jVk695W02htDKdCBxOPW38+5xJ/uF7i4q7VD8axh/qiUbP2
   g==;
X-CSE-ConnectionGUID: A8aWtnoaS7e6Gbn+Sn3Ggg==
X-CSE-MsgGUID: EwnXuNbyQk2DobylKT8hBw==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 15:03:01 +0900
X-CSE-ConnectionGUID: oHqa5c0bQkmnd/FbkksCDg==
X-CSE-MsgGUID: sNkWM31oRXWC9d+MIiZeAA==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603010287"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 21 Apr 2026 15:03:00 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH v2 0/2] Enable sysfs module symlink for more built-in
 drivers
Date: Tue, 21 Apr 2026 15:02:33 +0900
Message-Id: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPkS52kC/3WNwQ6CMBAFf4Xs2RpasIgn/8MQUtpF1oSWtNhIS
 P9dwLPHSebNWyGgJwxwy1bwGCmQsxuIUwZ6UPaJjMzGIHIh85JLpvRE7ehMa9WIrJflRVUSi6L
 qYNtMHnv6HL1H8+Pw7l6o5z2yGwOF2fnlOIx89/61I2c546o0tezNVer6HpxdztqN0KSUvkNPr
 ey7AAAA
X-Change-ID: 20260416-acpi_mod_name-f645a76e337b
To: Kay Sievers <kay.sievers@vrfy.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Rahul Bukte <rahul.bukte@sony.com>, Daniel Palmer <daniel.palmer@sony.com>, 
 Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=4296;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=cq5j1N/tLVr7JQQAEFQwE+5Pc1i9Ewpt4Q5nOJ0PQwE=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsznwoLVX6tvxWSsms4lb2Ccqn75as0Sc76jr5d9/8bMf
 Kemy3RXRykLgxgXg6yYIkupUvWvvSuClvScea0IM4eVCWQIAxenAExEUYuRYeaLwgCVNWcj9pwL
 CPLuevnPLLzETm5r0/JXT5zXp0e48DL8FeE59tqltJRZpLEgw8M7bc4cmW8Lj6h/uMfdcdbnb/0
 OJgA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

struct device_driver's mod_name is not set by a number of bus' driver registration
functions. Without that, built-in drivers don't have the module symlink in sysfs.
We want this to go from unbound driver name -> module name -> kernel config name.
This is useful on embedded platforms to minimize kernel config, reduce kernel size,
and reduce boot time.

In order to achieve this, mod_name has to be set to KBUILD_MODNAME, and this has
to be done for all buses which don't yet do this.

Here are some treewide stats:
- 110 registration functions across all bus types
- 20 of them set mod_name
- Remaining 90 do not set mod_name:
    1. 36 functions under pattern 1:
        They have a __register function + register macro. KBUILD_MODNAME needs to
        be passed and the function needs to take mod_name as input.
    2. 42 functions under pattern 2:
        These have no macro wrapper. They need a double-underscore rename + macro
        wrapper to make them similar to pattern 1.
    3. Remaining 12 do not have such a clean registration interface. More analysis
       is required.

We plan to start with pattern 1, since it's the easiest category of changes.
Within that, for now we're only sending the platform patch. If we get the go-ahead
on that, we'll send the remaining ones.

Patch 2 depends on patch 1, without which arm64 defconfig fails to boot with
patch 2.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Changes in v2:
- Drop acpi patch, send platform instead (Rafael)
- Link to v1: https://patch.msgid.link/20260416-acpi_mod_name-v1-0-1a4d96fd86c9@sony.com

To: Kay Sievers <kay.sievers@vrfy.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Richard Cochran <richardcochran@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Shashank Balaji (2):
      kernel: param: handle NULL module_kset in lookup_or_create_module_kobject()
      driver core: platform: set mod_name in driver registration

 Documentation/driver-api/driver-model/platform.rst |  3 ++-
 drivers/base/platform.c                            | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  2 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  2 +-
 drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  3 ++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  3 ++-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |  3 ++-
 include/linux/coresight.h                          |  3 ++-
 include/linux/platform_device.h                    | 17 +++++++++--------
 kernel/params.c                                    |  3 +++
 rust/kernel/platform.rs                            |  4 +++-
 16 files changed, 50 insertions(+), 29 deletions(-)
---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260416-acpi_mod_name-f645a76e337b

Best regards,
--  
Shashank Balaji <shashank.mahadasyam@sony.com>

