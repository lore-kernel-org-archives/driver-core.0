Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391424;
	b=4NSpKbCjKek8DjRHpn/TgxgAOpm9GrA+6IzSNThJwbQQo2wZmcimagZiADgqBdAxOE82
	 cAWfAfbMjz+0mFD2xVRKNotj1aTWkXL+L9JmXFZVMVWH1qEPKRKk6mqCjnmrU1htQOP6O
	 L/6V19JLspWeogzJB+1N2/T3IwdSIPfFqX/QYGPMyScOu3dA1wbWGeIJ1tYc7YvrBMUjD
	 XBVJwI34gxOeSXPXy2uoXgFuWKWwackInotX21XJ112xDdkj1tn+CqxyTet9n5pLKXGVs
	 yHMfSRirqi++29YcL2NtasqE73TUCRh4Dbnwskei3nNQu6nXcu7lgd/dKtKY3FOmwAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391424;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=P5uK5k8hE6cV5mVfO4fzcbbPTXDB254WVyWlg4BLU54=;
	b=DGnOK/GbkwLZ1BpzaeupeWNLulR9hErdaBrLbwEsG8qEseWC2j4LfdGMLIyCW1AiTOIT
	 6OwirU9gi+9B96QOd6I5q0EBhXYdoknK07HTkL+c5Ntc9ohbEJLBVybDpI88y2AmWJUfb
	 iwqbYkOYLhrX7mS4InYMaepbGOuhoFXHvv1JCl0ZMoxOlQR+WP0zoQsps0Ea9cnbqjKBG
	 DrS68vpAKLb3wh3UXKmt2dkdDxHf342RSjinwru15VbV5uTFOQP4NLC6R3gIb4/D5wgv7
	 JdKZ+wSZ+zXxOdptXlM3SeMVYkpdWI1Una/n+dqQ/1RCNPRRMHKwDMT7oh9LMdzvfjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5lpNhtS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090C2606A88B
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5lpNhtS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF471F00A05;
	Wed, 11 Nov 2026 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391423;
	bh=P5uK5k8hE6cV5mVfO4fzcbbPTXDB254WVyWlg4BLU54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m5lpNhtS6dc/yG/qaxZ73zHYsbeQeN/Qun9vLmPpF8DbVqcEsqIyyqYNifgqp1hdU
	 9jESug6jgnMtxzjazhyE6l8NfOwP3ioQJ9zVaF2tr2oiFlmbuacXbo1ysHnB8K+MyB
	 QhRAR+SBsuqxojVUhG1qOfN4gEEc7twCG0lvryTn5RpleiO92vmQWM1W5k9a5Vy5QI
	 UINl44xtacTlupwefhmBX8qH5IkIU/wfSubX5pN+/pFxcdKCdfkkgkhba/dJ6ALRzW
	 p9nqVknBYNbkZrCK28KzQCKsu+ts2j35RtWe8nA2+DcF/9DzZIHlqZMONVbA0PctS8
	 jM2O5Laz+wZUw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 4/4] arch_topology: Avoid zero CPU capacity on parse failure
Date: Wed, 11 Nov 2026 10:03:31 +0000
Message-ID: <20261111100331.2945297-5-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100331.2945297-1-sudeep.holla@kernel.org>
References: <20261111100331.2945297-1-sudeep.holla@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a possible CPU is missing from cpu-map, parse_dt_topology()
normalizes the partially populated raw_capacity array before checking
that all possible CPUs are represented. This leaves the missing CPU with
a capacity of 0.

Validate all possible CPUs before normalizing capacities so parse
failures do not write partial values to cpu_scale. Free raw_capacity on
the failure path to discard partial data and avoid a leak.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1a2a8094-971d-40cb-b0cf-2e6d9f26c549
Fixes: 60c1b220d8bc ("cpu-topology: Move cpu topology code to common code.")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/base/arch_topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index c439fc91270d..e868b7de88fa 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -682,8 +682,6 @@ static int __init parse_dt_topology(void)
 	if (ret != 0)
 		return ret;
 
-	topology_normalize_cpu_scale();
-
 	/*
 	 * Check that all cores are in the topology; the SMP code will
 	 * only mark cores described in the DT as possible.
@@ -693,6 +691,8 @@ static int __init parse_dt_topology(void)
 			return -EINVAL;
 		}
 
+	topology_normalize_cpu_scale();
+
 	return ret;
 }
 #endif
@@ -954,6 +954,7 @@ void __init init_cpu_topology(void)
 		 * arch-specific early cache level detection a chance to run.
 		 */
 		reset_cpu_topology();
+		free_raw_capacity();
 		cpu_smt_set_num_threads(1, 1);
 	}
 
-- 
2.43.0

