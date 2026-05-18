Received: from jpms-ob02-os7.noc.sony.co.jp (jpms-ob02-os7.noc.sony.co.jp [211.125.139.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6143ECBC4
	for <driver-core@lists.linux.dev>; Mon, 18 May 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100225; cv=none; b=hoiFQHAmvw5HQeisPZ1ZRLnyEs20IOhp1uGzuwYgNZjm5LwRR6cX+KrTaFd6esFqD/rABzls/v7kZFVmKNEMLzCfdaWUQ13C6q2IbcQeD0pGtg7hyRwmZkBaSkF+rcdGEcciFoXZbidWTqA2dEFzb4+/jfc344Z/OlDDnUHyvWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100225; c=relaxed/simple;
	bh=cb8qj4xhg343NbZdyo6rpt+QT8xtsS/YnAvcGC2vlak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDptMsEcn4Xg5BCfmL0o1NwaEgtQ7AKbSgQhhoO3ECx+rY5fClCwXy+1bjULA3qnhpLC2Orknqeot9lfY6VI5Y8zyxQUHu70+6JJNWB+Gj/dWeZ2W65XFGDY+UgQOh2X5WSolQqxS7fk9E/XOxfxzTjllV3gjtGneo27tQ3XnNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=PGOEC5FN; arc=none smtp.client-ip=211.125.139.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="PGOEC5FN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779100215; x=1810636215;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pNRQ31g1BKh9xMFz1czeGZGptMasxgt/rCDZtMGdZYw=;
  b=PGOEC5FNAY5kNeNnOYidPuTbyyb5CGGUv2g7OB3ZjigP1d2gfF/DN8LT
   dIx/+kAi9CIGmlotGIdX56fuoKNz46vaJMguugViOi86naIE/8bzjKH18
   HcjAE31XcjuhoEbXLu6E1aqUTKhqD1ubmsaErXfY4lqR1HIjSsJUwFYA6
   mMtud/Gw9wsWmUoton2wAa/NtNO26e+U/WHrtkomRThm15rejBRQPEgFF
   cxEBL+TfcjuzVAXBs4ABQ2U9o6s7M01eMQDFygTM9nOlOWHVHAQSDKXFt
   UijOfNqe2GT3Rdt8FAF6CuGnO2hIrtgoXzAwh+bM+1hwqwC6BGem4mVNY
   w==;
X-CSE-ConnectionGUID: 4IhcyacfRYqTkBt40vDLVw==
X-CSE-MsgGUID: k9KqhjlfSciMMjbVO/wNSw==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:04 +0900
X-CSE-ConnectionGUID: eNQHig6rTSyeNFsq5eNCUA==
X-CSE-MsgGUID: bJzPrHHERBWQt31IwEhhsw==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041668"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:03 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:19:57 +0900
Subject: [PATCH v5 1/4] soc/tegra: cbb: Move driver registration from
 pure_initcall to core_initcall
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-1-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=2338;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=cb8qj4xhg343NbZdyo6rpt+QT8xtsS/YnAvcGC2vlak=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xfqvy0NverW9HcJ0/+jbb/frg7dt2Tnlxm6R3Qf1
 ehr+fDv6ShlYRDjYpAVU2QpVar+tXdF0JKeM68VYeawMoEMYeDiFICJ/FRh+Ml4ZabnJgHe1ruZ
 66Rfir73lW7Y/ehHoIfvgbd5bt4z/wQw/E/Mmq3LedrX7smVb8HzxcRfmQT6WPgLH3r16UWy0bK
 UhywA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Commit "driver core: platform: set mod_name in driver registration" will set
struct device_driver's mod_name member for platform driver registration. For a
driver to be registered with its mod_name set, module_kset needs to be
initialized, which currently happens in a subsys_initcall in param_sysfs_init().
The tegra cbb drivers register themselves before module_kset init, in a
pure_initcall. This works currently because lookup_or_create_module_kobject(),
which dereferences module_kset via kset_find_obj(), is not called if mod_name
is not set, which is the case now.

So in preparation for the commit "driver core: platform: set mod_name in driver registration",
move tegra cbb driver registration to core_initcall level, and commit
"kernel: param: initialize module_kset in a pure_initcall" will move module_kset
init to pure_initcall level, ensuring module_kset init happens before tegra cbb
driver registration.

Suggested-by: Gary Guo <gary@garyguo.net>
Acked-by: Sumit Gupta <sumitg@nvidia.com>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Patch 4 depends on this patch
---
 drivers/soc/tegra/cbb/tegra194-cbb.c | 2 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index ab75d50cc85c..2f69e104c838 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
 {
 	return platform_driver_register(&tegra194_cbb_driver);
 }
-pure_initcall(tegra194_cbb_init);
+core_initcall(tegra194_cbb_init);
 
 static void __exit tegra194_cbb_exit(void)
 {
diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index fb26f085f691..785072fa4e85 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
 {
 	return platform_driver_register(&tegra234_cbb_driver);
 }
-pure_initcall(tegra234_cbb_init);
+core_initcall(tegra234_cbb_init);
 
 static void __exit tegra234_cbb_exit(void)
 {

-- 
2.43.0

