Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792503615;
	b=d7RFhotJx4Abz0F9nDjJIfvMZ9EcBxEnSBDmx2xUMttVOStxsf9OPQgOcT6+0UJPDo7U
	 eEeDIk9uXc8UHYM6ID5AO7I2d0A0/0oRrO+ceKOZD7tPbe7k07Pd2HdIJV5Vo4UG+RBhB
	 K68hb0syyFgjHIJ2tePFFAyI27tITjZyMDcVa560i/8855RuSuX5ze/nO2bLIzU+/OQSj
	 vV5lvRnpBP8vfZ8UJ24SmJ2Vrl+JcDhxraTcD2JZcFf3bcHaGklSteGR3uarqoE7KVfoD
	 gJvpWpPgYaPq+xz0pq1bWVvGB84+xUy0eZ5yOveKCSjE44k3lBL18pWgSDmxFQtcOaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503615;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/+1PRSJWz9UU0CVbMpRr0MzVYgDmR8xZi9xGlTnYR6c=;
	b=vp93Kf0HAhVFiwf+9+fE7qrq1bbeO6r4WQcl1TvLIpcptDQgMJi+i7shgjrUpGNrIeQA
	 rF21TP7o3g6xcKKmy/8cfn/EmyGus1ms4q7NZIMcJeVbIa/XmmSNXL+Fx2F9bDVygU8On
	 zJg0IONuTXQG5uFls4U9Z9IAnFzvP+XQjaTRURigOPfLcZhMMNwAlpp4xkMKKoRrOJ3Vt
	 36dzHhDhc+H9u7aX/T6VjtxX1u+jaNXGDVqsanY6FmFPhHYonR9C29VWWkuM5ANEBWWt3
	 sNsmtDrSdIxzZMoD5mTMtlgX0B0prspvLpXnF6/bTlrp6EZhjcyMefgHGYBwF0sPaNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0iFOR9I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1CF606A330;
	Tue, 20 Oct 2026 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0iFOR9I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792503614;
	b=0SCcA9fUncQ7+aJsdHjbERHg/x52F1zUEbIaNZ62r8yDj4QDC+imsCMWJs70YMmEIA1B
	 jdA5bKR7mpVj89WbY/oPf9dQ696tkaEb6OdzfJljuZQYPXicCPVFD/byYnSOxcBL8pyKr
	 Vt7lU46TWfkY9DWb2kHTsqoEH70athr96KuI2f7abGJ3OzSf79R2v3EjOYAN5wQpTjijf
	 4sd/PZVsIHbJsSusxuNR6pYccia+pr/dFtJIUm8SlU5tEKDk/GE9s5iQgkx9FxSN7Ga6z
	 /PEsLCDaMu4oE1Xb58LqAaT44pOZ/6BHGpKTIOc4jEaMnUMeyOGLft2i2SIoT1zyyBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792503614;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/+1PRSJWz9UU0CVbMpRr0MzVYgDmR8xZi9xGlTnYR6c=;
	b=GG8uwL9/ITrQt9pMr/t7Dhu5Nreu1qrRUTxJMNTJRTuw4M1j6HCzYc1zH6Bf4imP3rPy
	 CMuCWdqnLB+IuLfPHtqpzKofxCIss/GN9UNpyt9jUd3xFhVbUB6Q9zRJRr6qwOkUyct8u
	 ABDvkT70XUKWCgbNVx5wt3V9pSbrIGCQe+0rBal1rdL/D1Cuk8hYt/oB2gNUrmDPyEwvc
	 fmtiJlHBsCA17L7AlJWtxGHh1uFazcQFSgdLz+VJnLke5Cikckz1aaEuEslB/vIisxi2E
	 RktPxFlFBHw6o8JeSaGogUqtmGfQ43rrvCCBDQd218LIQmSa28zoKh2Qvs687N5nwMw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46F8C1F000C8;
	Tue, 20 Oct 2026 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792503614;
	bh=/+1PRSJWz9UU0CVbMpRr0MzVYgDmR8xZi9xGlTnYR6c=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Q0iFOR9IRQCGBOR1z/zZ91xoWL4Pq+1En/D6Q1sZIMbf5dkAXp/iQ1+2NtBomJYyi
	 TGFJXi2ZHxl6n+xmtFsZpl1yNtF5VJA587woPQI7zBp1D1ely2Vk+yk97pYa81uaGl
	 Q9/nfC1e3mgkURS967NWrjXd7hQaDHCnHtx2ygeX6ttYy/UzNE394cqwBrjMOHylY4
	 JCLqmoC7tL+Wppg4Z/VwTH//CNLUdOkJLvpS8M0OPAILliyVGQB5BQ4zzUN71/NSVH
	 wEXFbEN3EndvWksHPa5ijq85br1aWS7li722CnkGUrietbqmR5bn6ik9H9dVGYXTEJ
	 WNypq5RfmAzWQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9C6364319D;
	Tue, 20 Oct 2026 13:40:13 +0000 (UTC)
From: Qinguang Xu via B4 Relay <devnull+guang.cy2023.gmail.com@kernel.org>
Date: Tue, 20 Oct 2026 21:39:06 +0800
Subject: [PATCH] regmap: irq: fix incorrect index calculation for
 read_sub_irq_data()
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-debug-v1-1-44e0491ede30@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMD3ZTUpNJ0XbOk1FRTUzNji0RLQyWg2oKi1LTMCrA50bG1tQDoIvy
 tVwAAAA==
X-Change-ID: 20261020-debug-6bee55638a91
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Qinguang Xu <guang.cy2023@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792503607; l=1610;
 i=guang.cy2023@gmail.com; s=20261020; h=from:subject:message-id;
 bh=h/epT8PozJJSzYsR6YyQpeY/N08qpMA03/LtijdFBKU=;
 b=N/3MqOgQb9WGXlYuHe3je8J4Nun33kI8SPFWObRtxpeLnhwe3lVID8RzhMAkBE2xMpMPmjwY0
 +G1DTk/TrnLA+3Sh2SUuBPUsvq3JsrUCZGewiDRcoSd7gw1cr4bwnSy
X-Developer-Key: i=guang.cy2023@gmail.com; a=ed25519;
 pk=nBIKvk/kltcVDBLn+o4Bv1W0xE/m2VgIByF+uxYTYzk=
X-Endpoint-Received: by B4 Relay for guang.cy2023@gmail.com/20261020 with
 auth_id=1248
X-Original-From: Qinguang Xu <guang.cy2023@gmail.com>
Reply-To: guang.cy2023@gmail.com
Content-Transfer-Encoding: 7bit

From: Qinguang Xu <guang.cy2023@gmail.com>

While working on a PMIC driver that utilizes num_main_regs > 1, this
issue was noticed. Currently, no in-tree driver sets `num_main_regs >
1`, so this bug has not been triggered in practice.

Pass the global index calculated with `i` instead of the local bit
offset `b` to read_sub_irq_data().

Fix an off-by-one error in the index bounds check.

This patch has been compile-tested only.

Signed-off-by: Qinguang Xu <guang.cy2023@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 99b55b105..e151c6222 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -398,14 +398,14 @@ static int read_irq_data(struct regmap_irq_chip_data *data)
 
 		/* Read sub registers with active IRQs */
 		for (i = 0; i < chip->num_main_regs; i++) {
-			unsigned int b;
+			unsigned int b, index;
 			const unsigned long mreg = data->main_status_buf[i];
 
 			for_each_set_bit(b, &mreg, map->format.val_bytes * 8) {
-				if (i * map->format.val_bytes * 8 + b >
-				    max_main_bits)
+				index = i * map->format.val_bytes * 8 + b;
+				if (index >= max_main_bits)
 					break;
-				ret = read_sub_irq_data(data, b);
+				ret = read_sub_irq_data(data, index);
 
 				if (ret != 0) {
 					dev_err(map->dev, "Failed to read IRQ status %d\n", ret);

---
base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef
change-id: 20261020-debug-6bee55638a91

Best regards,
-- 
Qinguang Xu <guang.cy2023@gmail.com>


