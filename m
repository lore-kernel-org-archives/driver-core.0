Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245490;
	b=ZYVBZdYIRzLBFMmbsr30m47CfdqMy4An/KAe01gYNUeljumB6vOUK5xFJqD63AAicQyL
	 vJIEIUeK/fws1C9lnRt2NjkQxBWZ9VJ/GD/FoQU03jiRXFV/z3zX+ZmcBP0BgFaMVpQDu
	 7knYNLKzj62NOkyMkS2cD/URfbAHeMH+tnr5CerJ2dFHlbUbJmCgDUOPXxIGLUQQS1OeJ
	 nqQDpYCz0IojQdxmkSShVeKdOvML5MrLHoMHPTE9Z4jJVkvJD5qyY0X0pMTG61BoQusaC
	 GeOJqAFJXUeORTYACfFWxQMsLxCXfTXm/k2rYKAuhZ1xbb8bTHRb0GPZNjWktFxQLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245490;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u1MykTMxG27paJgL2PFo5JFprvA8Co1WTOYVD19Chhk=;
	b=tvZrDNNHIOPhbT2QNRDl8+twzkyTtLagwJk4f6KLafu/H4Q4K4fF8Ay1mxznlekAiVXu
	 8ji9sSx2+qNq4mUJcfqJ9jYKimwpNND2Rbg7cWjCx/4dE/1CQribhaIcWcfMU+UQezaCB
	 t6Iy2JvQA6NofHluxc3yIMZWedHa4B5P3d8IbX0O/TQYhAWFGApbpmn4med5sqv0RSj0R
	 Ia24/Ddsf/Wr/1K0fk1cdTG0qs6kRNuXqK5g3CebT1IM+lHxsYI1TxoglQSgbchbzab4k
	 XlfYk/b+0KKPZKM8Bv4t5DoMnkBLK01Pt4t7EYIOdm2H2f+ZT2PxTe8B4TOsMdRJ4PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUGDgpMu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A704606A334
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 17:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUGDgpMu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313081F008A2;
	Mon,  9 Nov 2026 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245490;
	bh=u1MykTMxG27paJgL2PFo5JFprvA8Co1WTOYVD19Chhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fUGDgpMuQYFIQM6BCzt6f/NsBarZH+AYhZJ5wsoXQc1dBMT2i2St8a/5S+Masjygq
	 RBUaIIEmXpm+ZSDHI4XZrjhkfseh9OLJBo2AI2cqnCD19Z6HcoskPNeQ14Ls9a7uZ2
	 WgR8se/7JIAKENlFF0ZWnwIHttvBnVPQ1O7Mp/6xAgZ3Ti3lh780UjapOereLaSoDG
	 qclSll6YZDmtSDl34TH/zOfPYXiXQQ63v6bTMfEnNIyRr6GGkKfZhHntoLjYr7vCCu
	 XvIHkBoIhVGJdlT7tnKoKC4s+ZJAcYgxYXEDta0/HNp2eLRNu5dfsaAVs6L18a5ixz
	 QxYnySMGNZIPw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/4] arch_topology: Reset SMT state when socket parsing fails
Date: Mon,  9 Nov 2026 17:31:22 +0000
Message-ID: <20261109173125.1734847-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109173125.1734847-1-sudeep.holla@kernel.org>
References: <20261109173125.1734847-1-sudeep.holla@kernel.org>
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

