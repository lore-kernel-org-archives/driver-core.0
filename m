Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED69F3C0621
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851364; cv=none; b=D04XTVWku3cbkkNH8LxEtqNxQ2zqPmAfY7nmIeC/ZQqf1sxk/VEhwqBQvzT5FyuJMGIxh2n/Li7F9bjbnUjXSgIALx/ZucigovxmZLSxQUq/XGQ6J7DLvfWRYn+fc22I38+omq8r+H5D2Rwt9vMd9q/M/D1PCpb0HwcTE7MmoS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851364; c=relaxed/simple;
	bh=GmzcpVaW54kBYM6ZNlSdGdXppvRENvMzYTTYU+OtJCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 In-Reply-To:References:To:Cc; b=Tq8VXcQJ20sZI/0aNAeNm+BdJ2u29qMguknpDZMLtynUMZZw+nMPhKLVxKVABGKrmj4ksF24Sp1E3FRB7fqsRj3rlvKbx6WcreBQN7nS38PuHkiPt+Xakri2bI+2uc/2FQmNAr7xd/znR/wqAu6ZSOfPM7m/TIVyiGrwypQOMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=X22GW9lO; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="X22GW9lO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851361; x=1808387361;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:in-reply-to:references:to:cc;
  bh=9pkPs3Vc6paRjccGHW+dfs6voI0geE6f+u37jCbP6Uo=;
  b=X22GW9lOam21pcus23JOa2fzK9rVgi9kqPvlGLXzvICX2QVyFI0kNAE0
   ErPXzjgg3hEtJ2SYnSOVnHo2Xh2sZGkLMaZXpsZa2F6FhTrkOg2mYvPMI
   QPmCw2KhtxgM4vpZdymKFQjQJONQkEQyAc+Axl06hhe4QskRQ6DAklA25
   FPSKWTuQGwYpqD6163h45eCzAb3pDh7PxSl0qtYP6jJuGSDnRqccvY6uv
   lW2q06qluIMMy5ewtl0ktl+iVEof4viiYnvkU1/OeC2La6mu7tb+8mUXH
   bk65GObg5tUQEtRLXJYkI24i2wiNqBYvsVNLY5v01zAhRAMA2eUbPUA0H
   Q==;
X-CSE-ConnectionGUID: sKFc1QZyQPm+Y3gsUn+Y9g==
X-CSE-MsgGUID: Wdan9FxGSZab+yiv1ATdSg==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:15 +0900
X-CSE-ConnectionGUID: GBF2ZWP0TpeP2oXg7nUOEQ==
X-CSE-MsgGUID: b0ydDtKiSKCjtrykRa7W3Q==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446125"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:13 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH v3 0/4] Enable sysfs module symlink for more built-in
 drivers
Date: Wed, 22 Apr 2026 18:49:02 +0900
Message-Id: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI6Z6GkC/3WN0Q6CIBhGX8VxHU3AMLvqPVpzCD9Jm+DAWM757
 oHduLYuz/ad8y0ogDcQ0KVYkIdognE2ATsUSPbCPgAblRjRkvKyIhwLOZp2cKq1YgCseXUSNQf
 G6g4lZ/SgzXvr3e5fDq/uCXLKkbzoTZicn7fDSPLuXzsSXGIiKtVwrc5cNtfg7HyUbkA5HelOp
 uRXpkmGmumGkVIJxXbyuq4fC4SJz/gAAAA=
X-Change-ID: 20260416-acpi_mod_name-f645a76e337b
In-Reply-To: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=GmzcpVaW54kBYM6ZNlSdGdXppvRENvMzYTTYU+OtJCg=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM6fLrX8v6BaSdzKn8GzPj74bYVsWpS8RMPkifqmFe
 bf/8806HaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjAR3oMM/9M/3JbctTpeakV2
 hOv0xa4CzJqzt5+pP7usMctY61NaczYjwzeOGE8GwSr1NdJNZUpS7z4vttCRCYsIzasuvmO75Pt
 JNgA=
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

Patch 3 depends on patches 1 and 2.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Changes in v3:
- Initialize module_kset on-demand (Greg)
- Make coresight driver registration happen through a macro (Greg)
- Split up the patch adding mod_name to platform driver registrations (Greg)
- Link to v2: https://patch.msgid.link/20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com

Changes in v2:
- Drop acpi patch, send platform instead (Rafael)
- Link to v1: https://patch.msgid.link/20260416-acpi_mod_name-v1-0-1a4d96fd86c9@sony.com

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
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
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: driver-core@lists.linux.dev
Cc: rust-for-linux@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>
Cc: Daniel Palmer <daniel.palmer@sony.com>
Cc: Tim Bird <tim.bird@sony.com>

---
Shashank Balaji (4):
      kernel: param: initialize module_kset on-demand
      coresight: pass THIS_MODULE implicitly through a macro
      driver core: platform: set mod_name in driver registration
      docs: driver-api: add mod_name argument to __platform_register_drivers()

 Documentation/driver-api/driver-model/platform.rst |  3 +-
 drivers/base/platform.c                            | 21 +++++++----
 drivers/hwtracing/coresight/coresight-catu.c       |  2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  9 ++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  3 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  3 +-
 drivers/hwtracing/coresight/coresight-replicator.c |  3 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |  2 +-
 include/linux/coresight.h                          |  7 ++--
 include/linux/platform_device.h                    | 17 ++++-----
 kernel/params.c                                    | 41 +++++++++++++---------
 rust/kernel/platform.rs                            |  4 ++-
 16 files changed, 72 insertions(+), 52 deletions(-)
---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260416-acpi_mod_name-f645a76e337b

Best regards,
--  
Shashank Balaji <shashank.mahadasyam@sony.com>

