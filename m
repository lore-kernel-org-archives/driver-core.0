Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983461;
	b=3APApOJQmS6FYzRhGwTL02dvZ6SgsxINLgUyBPZjDuGDMqLqAS2/z56jnxBddhizZ4LC
	 nZN+y/ZbKemFQkVQyt9FjDRyPMktVYkyOq56mBcAuxyYt2XuHD5dQBk4Nf5WFXPk6Rc1D
	 E7V3vCxHTA8/0wdA1xhDHUZYJEVzAJRp7mjDiWJX3k39rOIeTZ5619T/IfyU2LicplKBc
	 URarDD8EpGpOJvTQf0+XY7Y/4ot216kIH0cGA4UyyUsid6r/xll43t/PYpWNg3tRbAO6/
	 jQQ5MFTfG2Dh0Q2vkQb1uOtwqHHLzMrwq0k7hXKAtLUWhMIqRrZwU9w4upbeAPDG/xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983461;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NBi245fowMiHqqPpy0hxhhvaFXCl6W6Ks74hl609Gms=;
	b=WfxMpkeyiyIEHozPNREaVNlFZRvrD4JpovvVlzC47xHF7QeAxBlBq93ifRKeckq3Oohz
	 XMMQa6LLVG+LqHsgBDQV4K5U48w58s1o+FfX3Ni8viP7hoGyhGukOVYyv16iR70pCHmeE
	 gVf8I/fh1ja21TZCMDFqRqRMrsNJBejLb/m9dW0k0cf/sI0ZgKbqdTwCLaPL/xKQpmSle
	 qH6JgRsZ0s7EQ5Tnsc5rTr66PM3MTxHzi3P/RmVeU7WZJxE+9lbyepXxh1P1ddDbSarbB
	 Y64eU6D+KJ5gOsfv0DdDWNyx6vVtdziibgd15I73994rKeysVWBw6Bhq6fDBFVYLzTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofST2I8C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D52606D805
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofST2I8C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1181F008A1;
	Fri,  6 Nov 2026 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793983461;
	bh=NBi245fowMiHqqPpy0hxhhvaFXCl6W6Ks74hl609Gms=;
	h=From:To:Cc:Subject:Date;
	b=ofST2I8CtV0PTyb/S7x3xwBh3TEmwNt6k3Nw7cAaUg+dgr/wr35hRaZcYQYF8rLR+
	 yRgC26iO/tACv3c9A6TyBJFdVuKyJkKQn4+B84lob9jg8kZo6tj8PZ9hTA7Vsmmvva
	 w1QAkTtyMRy0PWs2kQb4FR3EDgrEYam//R08uqwn2JhtxSeE0tWI2nLwonqppQW9b9
	 l9e2lC4LTsCgvYNPRftnK2ebT5ah1h7FI9la5GiENrD2H/IYSq3qQ9uso2oiHQRJz+
	 NbZ6VzzRHggAB3wXtOZQ++xJDcoECPQPhiSe+j/ZTTHm5SLVdGKByo8xyHC6mHrzV/
	 F2xNko4BG9VAw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/2] arch_topology: Reset SMT state when socket parsing fails
Date: Fri,  6 Nov 2026 16:44:07 +0000
Message-ID: <20261106164408.158337-1-sudeep.holla@kernel.org>
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

v1->v2:
 - No change(just posting together with 2/2 which was result of sashiko review)
 - v1: https://lore.kernel.org/all/20261103093421.1283949-1-sudeep.holla@kernel.org

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

