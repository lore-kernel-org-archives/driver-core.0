Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F3A347BD7
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851370; cv=none; b=JptDITunKg0qTtUJsWhFiXojckhNP8W1DEHPoTAAg2TeyUeqIjGdM2bPwPZM92dSX23Ycybxoy6krLI3AVzifC1w2wRv2xS9lF+nuAuTbZkbjEDIcI/0DmD2OpmrpdFh2scKe7fGYgW2SuL3J6xVmi0pe1GtVUjT2TQiMnkxDgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851370; c=relaxed/simple;
	bh=15chuYpccSlT6UpH8TNwNGnGHfksA7xi4fPhMzJSTtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d72M7EbJMI4wcq1TiPJR7GjAopQ0RGe7cI4KuahopOGf+4nBPAf/X/+InlfWgTCfgWIZIdK4ifACg8LTz7l4zDCbjJx1ef+5Z/+9atYL/220u446CkKzzbgFMUQ/58WmdEEgjMJiLb9UpvzGcCY9RzKLPzy5WEWtB8dYruNSons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=g5lx81se; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="g5lx81se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851369; x=1808387369;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=oCL1gEFUP1wdiZ4mPtneZFBWlCiHxBCt8+1MrSojH7w=;
  b=g5lx81seTfHDTs4iTnv3WDKaXV/9JkQYkrJDYldqzbUtf0bAN1oaNMjU
   73iXKjqHEK1rMq76lUiBnNHr5iSZghuZ7QYqXJhuRtpnSmvZpFWWH72m5
   ZVOHYw2AwZyK51oFYu9RtKQbWy3aXplT5XzMOFMbdAEUNH4GkP7D8qjB9
   fCJjGDgmKF57aW2/MgmHxnV9UKWvrhZCIgVoPSzizjgQY1Xa6Wz8F6xqw
   pITDoDAQ0CO7IaIb3TtzEqj2P78PdCVlYlP8E2Q22KinCJ/lxm43Mk2Bz
   227JwyFW4OcV+eJEMMl8K7Uc1RHsZKhuZCjhZ1LcKGWewEy/W8zQgP36t
   Q==;
X-CSE-ConnectionGUID: th/ne4B7TwC+eZiogkgisA==
X-CSE-MsgGUID: 31o07DiVS4WM/lyJbIMKCQ==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:20 +0900
X-CSE-ConnectionGUID: SgthmcMQRTCdknWd7vVZsw==
X-CSE-MsgGUID: Ta60PQwYQQmW9I62Z0fNyw==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446140"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:18 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:06 +0900
Subject: [PATCH v3 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=15chuYpccSlT6UpH8TNwNGnGHfksA7xi4fPhMzJSTtA=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM2cEchoeX80oYratR2Gj5Zx04SJxhcVGOZ+TJkb7O
 L9antrWUcrCIMbFICumyFKqVP1r74qgJT1nXivCzGFlAhnCwMUpABMJY2Nk+HNF00Fs57JPb8Uy
 XdVs19vsf8i6w+K/728jkSYh54ItnowMx7R93hRNCX8S8Stqo8+qT9IKK45LeT3mv7H9mHSG+KL
 NLAA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 Documentation/driver-api/driver-model/platform.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index cf5ff48d3115..9673470bded2 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
 provides helpers to register and unregister an array of drivers::
 
 	int __platform_register_drivers(struct platform_driver * const *drivers,
-				      unsigned int count, struct module *owner);
+				      unsigned int count, struct module *owner,
+				      const char *mod_name);
 	void platform_unregister_drivers(struct platform_driver * const *drivers,
 					 unsigned int count);
 

-- 
2.43.0

