Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp [211.125.140.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370AA3806B2
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751996; cv=none; b=OFrKrDG2AF697en57qW/KO2u7gvgDmHt0f1v33hqIzLbJt5OC2xKe5Tc6K4ItWcEz3FiFvrtBnYo6OUfCZ4aHHXzJ494s83iAGMYZhuhUV3MBVIcrUtT0BrjJOI3CBFr0FPaXu3Hs2FJhQ1zOXJXzCeYqUZ88drVCeNkTgADWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751996; c=relaxed/simple;
	bh=TAodI4xUlrEwxLtFIUjQdPLrsiw6kWJSMaRMWxe/2RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCzInhI62XMQ6o39/D5GZwYgSnEwHX8huju9322sf3UyAAWx2u/jgNI6LBbPU2pjKQwefVkQ24eztHPvPo/C+HB3d+H947dzFuj8KAl4PCzj9BPDCU/Abd0CX0SOEX8yM97lloPZfr1hJCMdBJ+C4DgJb8T1SvxmaqVccQa8Fe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=r/FzhfnS; arc=none smtp.client-ip=211.125.140.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="r/FzhfnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776751994; x=1808287994;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=M5voK61wljPEL9MIXMGk8CLB5JWEHYq4E0HHNP/m5yA=;
  b=r/FzhfnS/y7ZwdYQ/+fGmU19lELHSnyRqFEUrBs/ZQzTAk9cbgBjwYl6
   cMy+xa2ce4OrdjeG8ZXp6xGZT1wUMz7Ldp3umE6dWF4KVG5EvFdz6Gw/x
   i+H/yKnikrYp99EAG2k1gxNzVXkm+4h9+CX2B4NazqRbPmBYkvWgzr+Lb
   1LGfC74AUiBx65Mztk614OZTWr38J0HLcWqbkpQDm76VoLmLgKgWw8GBw
   m2sfsLfAuP7EcPcOvlfgByItgxLjp+X7Yx27bF+Axu4+QkFUr4n2aXjQ/
   HV3otEDFJoAdUx66P14j3u+c3wxtZU3PoEgIbVqyVQfEKCoqmcqlXBJoP
   w==;
X-CSE-ConnectionGUID: 5AsBSkLMSeuPvyp/XTwMiA==
X-CSE-MsgGUID: n8ecQ/DXSzq2tdAqOeTLqw==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 15:03:02 +0900
X-CSE-ConnectionGUID: LTCnBPipSWGuc+TNvzgr2A==
X-CSE-MsgGUID: JCCWmIAIRXOq7fv7kUw5XA==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603010295"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 21 Apr 2026 15:03:01 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Tue, 21 Apr 2026 15:02:34 +0900
Subject: [PATCH v2 1/2] kernel: param: handle NULL module_kset in
 lookup_or_create_module_kobject()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
In-Reply-To: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=TAodI4xUlrEwxLtFIUjQdPLrsiw6kWJSMaRMWxe/2RQ=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsznwkKK3M8VPyyJ+fOob7rf792F97YK+ua1sro5tXz3q
 f29acOdjlIWBjEuBlkxRZZSpepfe1cELek581oRZg4rE8gQBi5OAZhI6wFGhhavhQvMf2ayxh3Z
 b3TgadmxWv7ixJPb9/4/9DNDa6ccgzrD/4y+FczS57NEdAJDtM/K+orHPZv5seyNw1tjpQufRea
 F8AEA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

module_kset is initialized in a subsys_initcall. If a built-in driver tries to
register before subsys_initcall with its struct device_driver's mod_name set,
then a null module_kset is dereferenced via this call trace:

     [    0.095865] Call trace:
     [    0.095999]  _raw_spin_lock+0x4c/0x6c (P)
     [    0.096150]  kset_find_obj+0x24/0x104
     [    0.096209]  lookup_or_create_module_kobject+0x2c/0xd8
     [    0.096274]  module_add_driver+0xd4/0x138
     [    0.096328]  bus_add_driver+0x16c/0x268
     [    0.096380]  driver_register+0x68/0x100
     [    0.096428]  __platform_driver_register+0x24/0x30
     [    0.096486]  tegra194_cbb_init+0x24/0x30
     [    0.096540]  do_one_initcall+0xdc/0x250
     [    0.096608]  do_initcall_level+0x9c/0xd0
     [    0.096660]  do_initcalls+0x54/0x94
     [    0.096706]  do_basic_setup+0x20/0x2c
     [    0.096753]  kernel_init_freeable+0xc8/0x154
     [    0.096807]  kernel_init+0x20/0x1a0
     [    0.096851]  ret_from_fork+0x10/0x20

So, return null in lookup_or_create_module_kobject() if module_kset is null.
Existing callers handle null already.

Fixes: f30c53a873d0 ("MODULES: add the module name for built in kernel drivers")
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
This bug is triggered by the next patch on arm64 defconfig: tegra194-cbb tries
to register from a pure_initcall, and with the next patch adding mod_name, this
null deref is hit.
---
 kernel/params.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..881c7328c059 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -752,6 +752,9 @@ lookup_or_create_module_kobject(const char *name)
 	struct kobject *kobj;
 	int err;
 
+	if (!module_kset)
+		return NULL;
+
 	kobj = kset_find_obj(module_kset, name);
 	if (kobj)
 		return to_module_kobject(kobj);

-- 
2.43.0

