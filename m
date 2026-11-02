Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605284;
	b=w52O8wruBQI+qhaBIhFsUcWWNo0Jkv+hDqTX8vCT84AWidZZ06AkONcjKopzFXn7JBUf
	 0wO+SNK5/ZmTvPbJ5nv/Td98YfPmrqUSRuyIZpzQrnG6PKl3L0iVurqlvMQOLxyrbfvH8
	 8XH8Va3COMBEd1x6uf2XfrSehT9PsueO76gCPlFzjARxp/EN7S5dlZIWIreNKtP8Y7pU8
	 ZQgrQI/AlH+vhPblY1NcKkQ29wMP3bTmUurMx9+pswgfu5nzCKUukemfHBxIMD+vJVLsN
	 qU1Y5QzNVnC/ickL4LyH3vNxdhxuQzps1eCqM8pusxVhiDHX0/p3DUDAxb/JP7Ehdtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605284;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=YYRG3mAruKxAvwUQFwRjhaf46fluRFJ0lQb4sPxhPnE=;
	b=AH5Sr+XXyhl5H8EGy1c5yxxLgwV4eMkkc9EmwnS/JDfAAPomnb+JQuIRqCNOrqGjsWk+
	 TcGn0lyqAL/P46dcHO0ykgkhYx64Dq8PBu1J6dpRm6PWF4A7Fvc+wH7uEpN6icGAqEkDN
	 lJbpWtvj4aclpUheuoo9jqkysuVGwO2FTZSkCOe5KbuTYb3TEKhxPDw2y6QiLI30Tlefy
	 TcCexvfBnLLHP62GLtf5+PWrPxzRQmJ8s/HATiCEW+B+aAx0NBRd8wDvzvAJEcLSzuQ+W
	 qfdMF4tobxNUYD0UyeqNbcAeqbSdZMM9uyOcoaTnBZCBNKhVRh6e4r7r3hsMPEYy+rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPjylFM8;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0C8606A326
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 07:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPjylFM8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793605282; x=1825141282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JBdt+suzHwpIrFn1Exd923ztY6/cg2FKIYSPbQgjXdE=;
  b=VPjylFM8ZFlRVAuCVrAVCO3Okfo52VL3J8G9yKKd5QGsxq2pESm3BW6b
   sO5akAM0AzjYQWr34CTDLL5/8+4eIVDCvwrR2J4Ozd0wd+5/k5AySog5O
   nlemFw69WoRVSw++SPKi3WOnxsaolBbph+xkIemT9XyoQf+GpI9LIGaJM
   cjpVQtLGd2mb8nNx58kaF3bfXkHL6bnEiojegKjrm+lN57KkWZSJSjuR/
   5hqkG1pOn8jsB2/tFWp1cgI+WGFjJvDqsuZlREQtUuKqvRzKgOlNcycwI
   tNMioXRmUrW5QnYIpODWS37Nw4U/tjUwUnEFiosAt1RR8cfQcmtZNB4c3
   w==;
X-CSE-ConnectionGUID: 8L8zvuDeRDKMU+61amfW7A==
X-CSE-MsgGUID: 9yp7IeRORNK6Qq5yFKPoLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2300171"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2300171"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:41:22 -0800
X-CSE-ConnectionGUID: TIFBNtKrSEyFABiL+/UMYw==
X-CSE-MsgGUID: NWGNiliHRV2JaqlAGMaw5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6182252"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.244.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:41:15 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	"Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 4/6] perf/x86/intel/pt: Clear TraceEn in hardware in cpu_emergency_stop_pt()
Date: Mon,  2 Nov 2026 09:40:37 +0200
Message-ID: <20261102074039.26983-5-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102074039.26983-1-adrian.hunter@intel.com>
References: <20261102074039.26983-1-adrian.hunter@intel.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

cpu_emergency_stop_pt() stops tracing through pt_event_stop(), which
assumes the software state accurately reflects whether tracing is
enabled.  That assumption can fail when a crash NMI interrupts
pt_config_start().

pt_config_start() sets TraceEn in IA32_RTIT_CTL before updating
event->hw.aux_config.  If a crash NMI arrives in that window,
pt_config_stop() sees TraceEn clear in aux_config and skips the MSR
write needed to disable tracing.  Tracing remains active in hardware.

Alternatively, an earlier NMI in the same window can stop the event
without restarting it, for example a group throttle calling
pt_event_stop(event, 0), or a PT PMI for which perf_aux_output_begin()
fails.  pt_config_stop() again skips the write, so the event is stopped
only in software: TraceEn remains set in IA32_RTIT_CTL, and
pt->handle.event becomes NULL.  When pt_config_start() continues, it
sets TraceEn in aux_config, so tracing continues until the event is
next stopped.  If a crash occurs before then, cpu_emergency_stop_pt()
sees no event and does nothing.

In both cases tracing can remain active into the kdump kernel.  Moreover,
pt_event_stop() may access PT MSRs while tracing is still enabled and
can trigger a #GP by writing IA32_RTIT_STATUS with TraceEn set.

Fix this by making cpu_emergency_stop_pt() disable tracing directly from
the hardware state.  Set pt_shutdown and invoke pt_shutdown_cpu(), which
reads IA32_RTIT_CTL and clears TraceEn whenever it is set, independent
of perf's software state.  The shutdown flag prevents any path from
re-enabling tracing afterwards, including intel_pt_handle_vmx(0) during
the emergency VMXOFF sequence on other CPUs.

Continue to call pt_event_stop() afterwards so that AUX state, including
the buffer head, is updated for vmcore collection.  Its PT MSR accesses
now occur with tracing disabled.

Do this only if the driver initialized successfully.  In particular, if
pt_init() finds tracing already enabled at boot, it leaves Intel PT
alone, and the emergency path must do the same.

The race is reachable only through restart paths that call
pt_config_start() with TraceEn clear in the software copy.  These were
introduced by the commits with the Fixes tags below.  The restart path
in the PT PMI handler runs in NMI context, so only a machine check can
interrupt it.

Fixes: 8e105a1fc2a0 ("perf/x86/intel/pt: Factor out pt_config_start()")
Fixes: 25e8920b301c ("perf/x86/intel/pt: Add sampling support")
Fixes: 08c7454ceb94 ("perf/x86/intel/pt: Add support for pause / resume")
Fixes: 2e17bf3a469a ("perf/x86/intel/pt: Fix stop/start with no update")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Cc: stable@vger.kernel.org
---
 arch/x86/events/intel/pt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index 7453e9880b25..8d71c00f9ff6 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -38,6 +38,8 @@ static struct pt_pmu pt_pmu;
 /* Set at shutdown, after which TraceEn must not be set */
 static bool pt_shutdown;
 
+static bool pt_initialized __ro_after_init;
+
 /*
  * Capabilities of Intel PT hardware, such as number of address bits or
  * supported output schemes, are cached and exported to userspace as "caps"
@@ -1900,6 +1902,12 @@ void cpu_emergency_stop_pt(void)
 {
 	struct pt *pt = this_cpu_ptr(&pt_ctx);
 
+	if (!pt_initialized)
+		return;
+
+	WRITE_ONCE(pt_shutdown, true);
+	pt_shutdown_cpu(NULL);
+
 	if (pt->handle.event)
 		pt_event_stop(pt->handle.event, PERF_EF_UPDATE);
 }
@@ -1973,6 +1981,7 @@ static __init int pt_init(void)
 		return ret;
 
 	register_syscore(&pt_syscore);
+	pt_initialized = true;
 
 	return 0;
 }
-- 
2.53.0

