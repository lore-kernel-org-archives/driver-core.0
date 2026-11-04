Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793760816;
	b=3C+b+CnA1Hmn1ERFV8QJJYXqxfgJRdRgONC2duksZpq1915lKk3gOZ4eRBMKWJuNKSs8
	 PsJzVc0xnmB81yymw6H/8r8C4mqQSxs4oJtpOkfAnu8L4KBBparZ/TOQOaiIVrJdWTeDn
	 Z9IW3yk7rmbTD/fZrbX+sLzkf2qRPiBhdgzR9IaQ2TUlqrSZQ5BlQQvM+wNBIuhxBzkzp
	 yPgun0GR+oyN5v70vp8Ht1R3DSr5eAUqu/2T6WCwf5Q/MuEXDegLkc86+bl0OfBDoP9ME
	 wJMUgfoZTTKEbogEkGxIwQJ+pntRhuR7nhSVs2N5eJL0PAC+70qDhEi1nzjcdmGrblg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793760816;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=pm27odaPImgVuKZbdcHJQtkn37De96npYM7vAzgC+x0=;
	b=2kT2huWhH9+a2hNsCNgInxn+WSG+fm6uiXnWIAa4ySyu5323pVGtmH4/pjbKpsiuAkt5
	 B8+FC8Wlr2VPfhIf9bWcktbEYvDRprbnGBvGDTvrY4+sQQJT3KmokTQejSiGgumj1S6U1
	 WyCn3/In1ehLzOw1KYVvwkwBzqwomzU+wxQlwNLqCdpnM5iSqcKWQPSZpNn4xDtBXj3+8
	 IohlGq78gQmLowrS0LcFVHV5CtXv+JAQjU7Z2FSMglUJsevIUJN7NbvqwAfHJDs5ddsMI
	 W5+5uSLc/rJUDuMm8GhLF9kInvUfp/HIsM/q2cqu5r68dd+nNhfFretP9J98WnWGqkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2331B606A31B
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 02:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2331B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABnVf8unupq9+Q+AA--.27601S2;
	Wed, 04 Nov 2026 10:53:34 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: driver-core@lists.linux.dev
Subject: [PATCH] driver core: don't update the status of an autoremoved device link
Date: Wed,  4 Nov 2026 02:53:43 +0000
Message-Id: <20261104025343.1527458-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowABnVf8unupq9+Q+AA--.27601S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4UKr45GF15Wry8JF47urg_yoW8AF4rpF
	WDJFy3Ca4Uuw48Wa1UJFyxZFyY9a1Igryfuryvk3409a1rXrWS9ry0vFyaqF1qy397JF1r
	tFW5Gwn7Ca4DAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBjb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjcxG6xCI17CEII8vrVW3JVW8Jr1lc7CjxVAa
	w2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8GFyrJr1UJw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Cr1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x07bpfOcUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMBA2rqY-nijQAAst

device_links_driver_cleanup() drops the managed reference held on a link
that has DL_FLAG_AUTOREMOVE_SUPPLIER set and is in the SUPPLIER_UNBIND
state, and then unconditionally writes DL_STATE_DORMANT to link->status.

device_link_drop_managed() puts the reference that was taken for the
managed link, which unregisters link_dev and lets devlink_dev_release()
queue the work that frees the link after waiting for device_links_srcu
readers to drain.  device_links_driver_cleanup() only holds
device_links_lock, so that wait does not cover it and the store to
link->status races with the kfree() of the link.  Writing the state is
also pointless at that point, as the link has already been unlinked and
unregistered by the drop.

Set DL_STATE_DORMANT only for links that are kept, as
device_links_driver_bound() already does for the analogous case.

Fixes: 1689cac5b32a ("driver core: Add flag to autoremove device link on supplier unbind")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..bef08a50fc0c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1583,8 +1583,8 @@ void device_links_driver_cleanup(struct device *dev)
 		if (link->status == DL_STATE_SUPPLIER_UNBIND &&
 		    device_link_test(link, DL_FLAG_AUTOREMOVE_SUPPLIER))
 			device_link_drop_managed(link);
-
-		WRITE_ONCE(link->status, DL_STATE_DORMANT);
+		else
+			WRITE_ONCE(link->status, DL_STATE_DORMANT);
 	}
 
 	list_del_init(&dev->links.defer_sync);
-- 
2.34.1

