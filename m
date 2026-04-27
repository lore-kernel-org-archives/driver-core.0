Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBAC325483
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 02:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257745; cv=none; b=b70cbG0Nf8S/x2Pm2CDENnzRqnCWyYOoU9N3aPLewylqL+zwO9U7LBqqnJP+IFnLuX6nY6BMs53xUUZM4w/KvydOL4n/EMys8/LFrphzcw47ZL3tzBxSbLyAwDF9hGbAgmx7/oGE/5pp64TIfS4b4WbloDJpRG8tqiiHi9CoUG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257745; c=relaxed/simple;
	bh=Ntxs4LrM9nMix70BKY/iLLvKQ7C8YsLHb8BjcRBYfF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZwCRlXNIQgUktBpo4cAzUPLsREXAHxxLMGIkvGA+O0ExpSL7RGxT9WlZu4sE7LNcbjdc5TKE3FbaeVKb/9oElpE54nRyu0OLdnBnTkuKpuBR4zf3clmOCAVCyF8V8jYWz2XYesFziVfJZx49w5fe302ka54IQ2L7U/dXbOYjqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=yJd4diSr; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="yJd4diSr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777257742; x=1808793742;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9dNZSXPaU7SwRa36y6sq2F/bVDLBSOQWDoZdmR4n+V4=;
  b=yJd4diSrQW3D88s6PEDKliIW9g4ujeHHfryAzYCKTDlLT9zsyTbUuS9h
   Rxl0G5g7l6DmIUH36ZhnM6HW/nRldd0xbkJ4o1hp3yMpbl3OkNN+4MnzG
   Acebe4ZTG7oJOJRVRdEK0SLxY65p3mDnv5SqVhbh6m95UzCLAacLBSdWf
   GshjFXyv8NsZOObkup3tYtXc3HZBBfhTjlQsrsaOjlQddHfkkC+ENSqJb
   F3O3zYn63A9mnT52G9BXKOYPTbhfp4hb7JLB0CfQNQ7K0SEGGn9Rzn5G5
   pi/dhiZfQ5DEBbJ0cHsaZjqGnqTS+MZgSp74JJmHwVeaWWpkFRFG6VZY9
   g==;
X-CSE-ConnectionGUID: RGbSqVXxSGSqHmEfbpny9Q==
X-CSE-MsgGUID: +Ee3aBHfShWKmW/wpS5k+g==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 11:42:06 +0900
X-CSE-ConnectionGUID: lBeFfeEhTdCwKS4pXM/ITA==
X-CSE-MsgGUID: 4YLeYhxMRa2Yx4TTtDP+/g==
X-IronPort-AV: E=Sophos;i="6.23,201,1770562800"; 
   d="scan'208";a="52275261"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 27 Apr 2026 11:42:05 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 27 Apr 2026 11:41:24 +0900
Subject: [PATCH v4 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpi_mod_name-v4-4-22b42240c9bf@sony.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
In-Reply-To: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=Ntxs4LrM9nMix70BKY/iLLvKQ7C8YsLHb8BjcRBYfF0=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsx3Z37dP5picffdXU5/nzP2lrWFZ/60ahV/nu7mI7aK/
 cZZ928bOkpZGMS4GGTFFFlKlap/7V0RtKTnzGtFmDmsTCBDGLg4BWAiVjKMDJMEdF50TzXKPv9U
 TVJjv4b/9lrv4CvbMmqLLvH9zhC/8JqRYTLXfx+7IA9NltunV3Jzzgq5qj/X4WDjH9tf3l9O7fU
 w5AUA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Sync the function signature of __platform_register_driver() between the code and
the doc.

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

