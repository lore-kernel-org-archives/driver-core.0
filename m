Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391420;
	b=3vBHz+yrwrwVtACWBw86vtsLMwF+62C9V1ppzTyQrkRv1dXVQ2VWituboS0Y26ylUjsD
	 pgZlvWSCJuqaXwTi4OSFUAmbM8hlJiET2tbrBc8CVsPUz8eNh05jVSZvclw9P8kXfw0Vj
	 UiTaI+GBQvgFq+q35hgTwIFhsE4QiyHtDpd/Kn28L30nKAdAqstzBp4EEZ/tP+UXZJLSK
	 EzLM2Jov5WlqRsXTlHzRBZu4XBgvldIwbBH8DVaYwaVEnAjbv9gjsr8DYVgL3bLiz2Sa6
	 ZDMMYoMiM/H2/ET3cvvdVhKdFHp6XLXg9ujufcu0uQLoKG5KM9VtP2X8smiG/gRrlfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391420;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u1MykTMxG27paJgL2PFo5JFprvA8Co1WTOYVD19Chhk=;
	b=U5nFx+cX3grXdOI60gMDoQnHFMoyJtj318DGI/+CUGcG6Qm/Rz4rjDzf76ahqAoL05G0
	 KL0OqqHdPVHjRFziH2w/wyUkeluyEUYgTrIC26eHVIRJ9CFdcArSES6eCxIpSRlScdUD1
	 mcBJfe/cJbidsxr8MIayzZ7DzDu1u5zb30eBZ4L2PPmCO/f07X90jf6hVO/ii48FFaj2l
	 DzJLzYMBQ0GlKmRGLv+aUs3lKMIsDMcXxn+kVBnYysVcDnMdsx9fd28gSvNzevx97NNc8
	 5Ggckx3qzLa7a6eTK6JDppwZ5dehGKkwHzbMsmCEzbWW5s+IuHBmvl7OFjWpjCao2og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZAtxT/x7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD50606A89B
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAtxT/x7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324871F00A07;
	Wed, 11 Nov 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391420;
	bh=u1MykTMxG27paJgL2PFo5JFprvA8Co1WTOYVD19Chhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZAtxT/x7B92FzhCQygPMBcQTi+obskgi3UZybaCs7NXbJoA8WsNzoTB+171dpBPFd
	 rNtXYqiGmSqf2z36yBfuwQxcGk7H2/oBXVRiX2vo4PqdPlNXUwAB693wTrieijhuOZ
	 cUx8g3poaLj7TMp4nBSv2d8RqVG11KP0A70mQVXLcz9fAYFvBjD6KoVTbjgEOkfrrS
	 yj+lMoMr2wJwLq43ocEXoS/J6o+lDc77gK0/ACg92mjQUXoidJwv7CJyftSIQkh34X
	 1jx9iTEfWgOwBjupvs8LZf/lXysJ9kV5tFlqIqd9GCJxB8qHW/rTorpBpD2UlAcS2R
	 KQfvkn0QUSfxg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/4] arch_topology: Reset SMT state when socket parsing fails
Date: Wed, 11 Nov 2026 10:03:28 +0000
Message-ID: <20261111100331.2945297-2-sudeep.holla@kernel.org>
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

If a later socket's cluster fails device tree parsing, parse_socket()
returns immediately. Cores parsed earlier can have raised
max_smt_thread_num, but this return skips the reset to 1 and the
cpu_smt_set_num_threads() notification. The framework is left with an
inconsistent SMT state after topology parsing fails.

Break out of the socket loop on parse_cluster() failure so the existing
error handling resets the thread count and notifies the SMT framework
before returning the error.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-73adead8-21f3-470d-938c-b1f07a269a72
Fixes: 5deb9c789ae4 ("arch_topology: Support SMT control for OF based system")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/base/arch_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index e51fc9f5e976..8ed29885dccf 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -631,7 +631,7 @@ static int __init parse_socket(struct device_node *socket)
 		has_socket = true;
 		ret = parse_cluster(c, package_id, -1, 0);
 		if (ret != 0)
-			return ret;
+			break;
 
 		package_id++;
 	} while (1);
-- 
2.43.0

