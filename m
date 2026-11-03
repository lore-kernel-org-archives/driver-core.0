Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698472;
	b=aHc4qOdlhXwimIX7g2sCdWTMY87MqwLTmjaLrSd9HLURRL5q+CaZGQqeieoMS/SPgw/y
	 37kMSOtYO2kGwcQCuckFwcChJnYgeOH/4mpRNo2UxdP4+cBzAc2SXoRmvWP+O/DW+CyYT
	 cwCw+UNu7XnzEyP99bBqbum2ILcQZz0dMkrC+bEo8Y9o2dRLc/o85rOR6xyeggdbGF4bJ
	 Q9qwF7Jy9eTBE/FEwCcEk3zSAJrqEEP+btMQLIx+a6T5FEQPHetKYSGQcBjTZopPF/NB0
	 2/FALJ5ELoyi53oWh3ZD4qpze+G/hwJU/4GZj3Yddsp2r/B0+yi6ogYOsQWzdaOoPrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698472;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RXP3Ca7hKz0mrbeEmpLWjZuQHidzh2+VvDasmop6jJY=;
	b=17zdYy20DpNh/W6bl39IVSmfBufzQmVHfSyDco7k3xSnl4p7RfOpUvSazcVdardoTQ10
	 891kbLVQ8NCs2I8MWcFqG1C/+fyUDK2AWK6d1U4namMpXIyrIrrvyUhGxhDYLoRC6AKy6
	 v6R7d1SRU/CVCT8QOqAeSg98oUi039BJB637m8i0Fv+dEazptpLMTPXEa+LLQl2AjMa7M
	 dPElVgGDb7Q+cun3oNcvFo7N5EhQR+zYI2u2NBrn5qZjEi5p98vrG20ig28s37O6ni8zX
	 zzEch7PiYAdxlul9nQ3fN1ajaGXQBlk0MKwGc9SRyLGIDispSkb9M+LdoORKSLcAcxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7MFrKB2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AC606A324
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7MFrKB2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C874C1F000C1;
	Tue,  3 Nov 2026 09:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698471;
	bh=RXP3Ca7hKz0mrbeEmpLWjZuQHidzh2+VvDasmop6jJY=;
	h=From:To:Cc:Subject:Date;
	b=e7MFrKB2bA/HfCIcUCfByccFgZ9UGqW5QSXzc4I7ITX2fXvZDel8ATXfmNllDsRLn
	 i9vpTNK8NFgkf5BQPTNIaLBgLjXmqQL1oCwX496cCzswyEgmdS0GdgbDgxbZvB6Bq7
	 KgL0uwUn9t6XfcTVH+on6Uiu8Y6xD5kpXKhuRBKD1/OwVT0mq/dkinaR8Z0+KNY6nW
	 g6GdQHgrgJCGNhkv/Dhjbr9YE7qOiq2buiJQWk7nMQHmIJTDhik2dLyM+elJBBOCmD
	 1NvcgLAodNdfLYCHBv2tk9RLV9K/E3vVz//QQLSITOmHFYH01DTTqY0OOIyqy6zezz
	 C7jpVhMHNUi9Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] arch_topology: Reset SMT state when socket parsing fails
Date: Tue,  3 Nov 2026 09:34:21 +0000
Message-ID: <20261103093421.1283949-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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
index 8c5e47c28d9a..1569ab3335f5 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -633,7 +633,7 @@ static int __init parse_socket(struct device_node *socket)
 		has_socket = true;
 		ret = parse_cluster(c, package_id, -1, 0);
 		if (ret != 0)
-			return ret;
+			break;
 
 		package_id++;
 	} while (1);
-- 
2.43.0

