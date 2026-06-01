Received: from jpms-ob02-os7.noc.sony.co.jp (jpms-ob02-os7.noc.sony.co.jp [211.125.139.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736CD3998BA
	for <driver-core@lists.linux.dev>; Mon,  1 Jun 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780309805; cv=none; b=AV4t4BUfjnnE0U2PlVntjIgkkE6VCHfx8X+CwhRQyerwuQzkq+IYtU9veiq842AtYqayuVJseE/zn8PmgK7cblT32582P6Mu7WhVOjtY6UUqIl3YeRNyTbCmLDT+Mbr+CxVx48fk3CRJ3/A7ooFBMcp2TW4ze6ocyMvtOxUBu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780309805; c=relaxed/simple;
	bh=NCCEOep1v/81LrwEaRyt9x58TIOTCpVMYpw9cwgu8Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwRCcPBTnWblkcs0We1vyAuIz0PMDAsW5KWvFOxvlw7J3fp17u/2u73c5HxGUYLfpzDyO1hXuS7BkdjG5r3sfRyz+2mjKVzWmclhdJrmj0nigBMMqYoTQoa4sRAWokYzBtI5wizYnbUEz2ec6Fv6ekYD1QOTp6/N/Q9XrlfWThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=Y37iIY2r; arc=none smtp.client-ip=211.125.139.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="Y37iIY2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1780309803; x=1811845803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0rHdH/6OzUvgw/Z1d6llxooirf3DGCf2wJCl22Zrk6k=;
  b=Y37iIY2raFzbRPz2W23qR4ieCnTpqTfQTYK0LpG7opi7GvcN60MaXSk5
   to1oL4hRjmGupB0SrLsWzPAa57OokQNhdjxlGZpevbjJITHR35u+Bmk78
   9U1Gq6TePHlkHqSJRt+otPe4kbHGTVZog2q6Vh9h3J3f2Przn/QxllbaZ
   KISuCGekYjskNCEG5J70w1lETzoLIvy9D4p4dK3YDCZBBS05TEOQMbLjN
   tDKl3Ac9KxWOS/4Da9Fap0bctOfX1ZxK+Kk7n+Rdba9b8thz7sW9TPR1d
   kDBOSb8jv5vxqnuW+mcNwOIVdV0lU5ILhupcRtVExffVYnQX8WvC9j1eH
   A==;
X-CSE-ConnectionGUID: lJ/TD5/fS8aQx9vR0EiFqw==
X-CSE-MsgGUID: zV7FKyhORf2PSqX2vL4cSA==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:19:53 +0900
X-CSE-ConnectionGUID: sNjFdX7LQYSLb2PshMkn2Q==
X-CSE-MsgGUID: WqV8hNo5ShCKx694VddLQw==
X-IronPort-AV: E=Sophos;i="6.24,181,1774278000"; 
   d="scan'208";a="69757146"
Received: from unknown (HELO JPC00244420..) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP; 01 Jun 2026 19:19:52 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: "Gary Guo" <gary@garyguo.net>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Petr Pavlu" <petr.pavlu@suse.com>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>,
	linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Sumit Gupta <sumitg@nvidia.com>,
	"Suzuki K Poulose" <suzuki.poulose@arm.com>,
	"James Clark" <james.clark@linaro.org>,
	"Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Benno Lossin" <lossin@kernel.org>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Trevor Gross" <tmgross@umich.edu>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Shuah Khan" <skhan@linuxfoundation.org>,
	"Luis Chamberlain" <mcgrof@kernel.org>,
	"Daniel Gomez" <da.gomez@kernel.org>,
	"Sami Tolvanen" <samitolvanen@google.com>,
	"Aaron Tomlin" <atomlin@atomlin.com>,
	"Mike Leach" <mike.leach@arm.com>,
	"Leo Yan" <leo.yan@arm.com>,
	"Thierry Reding" <thierry.reding@kernel.org>,
	"Jonathan Hunter" <jonathanh@nvidia.com>
Subject: [PATCH v6] kernel: param: initialize module_kset in a pure_initcall
Date: Mon,  1 Jun 2026 19:19:41 +0900
Message-ID: <20260601101942.4002661-1-shashank.mahadasyam@sony.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ahEd4iC-2hqUbMy3@JPC00244420>
References: 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit "driver core: platform: set mod_name in driver registration" will set
struct device_driver's mod_name member for platform driver registration. For a
driver to be registered with its mod_name set, module_kset needs to be
initialized, which currently happens in a subsys_initcall in param_sysfs_init().
The tegra cbb drivers register themselves before module_kset init, in a
core_initcall. This works currently because lookup_or_create_module_kobject(),
which dereferences module_kset via kset_find_obj(), is not called if mod_name
is not set, which is the case now.

So in preparation for the commit "driver core: platform: set mod_name in driver registration",
move module_kset init to pure_initcall level, ensuring it happens before tegra
cbb driver registration.

Suggested-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
I'm sending v6 of just this patch to add the comment suggested by Petr and pick
up Gary's Reviewed-by. The rest of the patches are the same as v5.

Danilo, I'm assuming this series goes through driver-core. Could you please pick
up this version of this patch and the v5 of the others?
---
 kernel/params.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..a668863a4bb6 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -942,9 +942,9 @@ const struct kobj_type module_ktype = {
 /*
  * param_sysfs_init - create "module" kset
  *
- * This must be done before the initramfs is unpacked and
- * request_module() thus becomes possible, because otherwise the
- * module load would fail in mod_sysfs_init.
+ * This must be done before any driver registration so that when a driver comes
+ * from a built-in module, the driver core can add the module under /sys/module
+ * and create the associated driver symlinks.
  */
 static int __init param_sysfs_init(void)
 {
@@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
 
 	return 0;
 }
-subsys_initcall(param_sysfs_init);
+pure_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter
-- 
2.43.0

