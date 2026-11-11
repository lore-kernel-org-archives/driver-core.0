Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391422;
	b=EaPntNGSqJHJJV/m/uGrFvcnFAYSo8A7/yW7vpln5gg7XaebGvEtqKIFdnHXl+E6pJU0
	 GfLGwAkW6bFNkRi4oX4yCCrjXkjxX77lCq7Tvv+57r0ekVKFMt95mRbltVHFLggvSE9Ba
	 n2oA2u3HSPpyP7TJXIdawaMNynM+dsgzmcntUhiqLPTD4HylTc4jRVSD/xk5kA/yLE+nf
	 f0DGKfmV4EQnj5C0/KtEOTzrHmIik+9bfrMmPwBx9HLMj6bNQXQu5G3C9ELLaadrn+bSx
	 H/1zq9kZ57CU3D3T2d72FzMQHRqUZWToqoGiKgPatRNvTHQ3Z4Lo2MHQSH974/Q7LLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391422;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ed/IHz3PxJm5ZNWBaZpu1Eskyyp5O6m7B7gIGFQDSLo=;
	b=1kfcS5I8Gy1PDKhSWXFJMi8LIqOQjZCu3CsHSfAfZLV3plglB3zbT5mKNh/VJA8J+jD6
	 AzC4QLKRzj9CtSs2ZXyChsrIX7j4Km6S4Hk6NJU6rE7s8LxJbK/wD3DKDdUHK51LVngIG
	 /BL58IJyIyvQCXp+rwxC4CFuYvSLBtswVthuK/V8btQxiRBvZ9y32A4q8tgirJ5eu2kdr
	 FPn+Iq5loDgB+VyEjDIaN3lmtR6vhtOO8cGwdLU0MfHi/I7uUCQ9g/sW6NMrqs8eQwRMb
	 ElAScyLeXC+qzwgMilk0R7tdyCRcTpaOTf0TnO+zhaHyDUQ7R7ZYEjT3WjSUuQXF8rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGUQS7xU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC200606A899
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QGUQS7xU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0861F00A07;
	Wed, 11 Nov 2026 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391422;
	bh=ed/IHz3PxJm5ZNWBaZpu1Eskyyp5O6m7B7gIGFQDSLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QGUQS7xUku+0RCUH7MWNLiskDyg5SG/6CR0bA7hcgBDJVjDN2Ou6mKQ6E5JiYAQmx
	 2STVWCeWdXTZI3Dtv3uegPhigvCIBBpiLArUGMQDf+HkwkCnqEoXeH8gYBbbHrjARS
	 pky83vYMT/TwSh68qgzPOITahLtekSJMRThqbd7pkb92a3GJ+ke1aA1tWBOe3ncZnh
	 ECdaudeYFgDpT+7sXPWmjKvdxLDjZGQZBfMm48UtopRbGbpQT+lzj959mCtAshKB31
	 MnLoJxTN5iMD8w5Dy9axJs7LtykarSLTeI+5hd5xKRLTNEj6ePXagOAmeiR/k6fjcK
	 JYcpdg3wWLZuA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 3/4] arch_topology: Reset SMT state when topology is unavailable
Date: Wed, 11 Nov 2026 10:03:30 +0000
Message-ID: <20261111100331.2945297-4-sudeep.holla@kernel.org>
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

If DT has no CPU information or cpu-map, parsing succeeds without
notifying the SMT framework. A later topology validation failure can
discard parsed data while leaving the SMT thread count set by
parse_socket().

Reset the count to one on these paths so the SMT framework matches
the topology that remains available.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-486a8656-d962-4966-8d90-bbb2ce276147
Fixes: 5deb9c789ae4 ("arch_topology: Support SMT control for OF based system")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/base/arch_topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index eea4c4257d08..c439fc91270d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -662,6 +662,7 @@ static int __init parse_dt_topology(void)
 
 	if (!cn) {
 		pr_err("No CPU information found in DT\n");
+		cpu_smt_set_num_threads(1, 1);
 		return 0;
 	}
 
@@ -672,8 +673,10 @@ static int __init parse_dt_topology(void)
 	struct device_node *map __free(device_node) =
 		of_get_child_by_name(cn, "cpu-map");
 
-	if (!map)
+	if (!map) {
+		cpu_smt_set_num_threads(1, 1);
 		return ret;
+	}
 
 	ret = parse_socket(map);
 	if (ret != 0)
@@ -951,6 +954,7 @@ void __init init_cpu_topology(void)
 		 * arch-specific early cache level detection a chance to run.
 		 */
 		reset_cpu_topology();
+		cpu_smt_set_num_threads(1, 1);
 	}
 
 	for_each_possible_cpu(cpu) {
-- 
2.43.0

