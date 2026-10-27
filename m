Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793121503;
	b=VZwxAcDD5i91/V8oMX32gaSgjnkYECKz3eqSjoCE1+F3lmWBGIfS/3ZciDgBNGdKq5VU
	 GC0KiWYxrfCXzed11BMfVlhRdw8dF5MH7ASRTrKm2IYB7J86JfF3tNIGMRJRntHwOIKlY
	 GFRmrfkWiun0aDAVVWVizfLQ/bZO2kbNA6sN5k3DRfLLgstEJlGEoaozo2rWd/8KA4Kju
	 y3RRt8hts60L7Qf79woZTjyyhCQo1D5o/cAXv4DM2sadczISpeioMVRxPcWPcqpUV16Tu
	 +N+hRJmgHNquUYa6mvPptxkCP8cjf3h4Cg0JFw2/13zbbfV27q+dx5jjIMaMO+argpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793121503;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Lines:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Jpqw1dZFFdRJ3YcOkY7F7UIGXi7r1qXZAzE2/kbVmEI=;
	b=V7q/JQ9PmxIlvZQPDtKqd9YHq9pt2xNUdENuCqQdcy+bFfMEDizlTwf0zf+LdGqOIpAD
	 kYsYN0a4ezV0ZA1pHeRnxNfqiZr4qG7qpMKwHbXX7GITUhA5BcIUerE1Dg9ee+EuvX4i4
	 x39Izx0BMQ4E0f9zQ1JUrc4yBnGUmIt6PSFyi55G5ZRDwM+HfvWaam5JE8A+yq5NqDQdX
	 ugD8sZsdXP+0WJcD+ViqdeNXZtvXl4bwXPHzsDXfjHdFyH93NKgWVGzCAZ62ui81PS6lr
	 BQXFlMqt9RyQgilTS9157ZbLW9elIr26EDvyFAhSC4cnmQbEJ9xqT05EQpXWjaupxiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jDcx6k1I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D547F606A31D;
	Tue, 27 Oct 2026 17:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jDcx6k1I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7F41F01829;
	Tue, 27 Oct 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793121502;
	bh=Jpqw1dZFFdRJ3YcOkY7F7UIGXi7r1qXZAzE2/kbVmEI=;
	h=From:To:Cc:Subject:Date;
	b=jDcx6k1IGZq0nDPQN04OMUEd+VaLE+BGJatcbGEK0V/pELFYJQOYS/ThgvoiNmHz9
	 leivEQ6+F66yKJxZAjKrBImYLiV39z1l9DKyVl2Vlsdhqj792P59LD+OrZkR/C6PaQ
	 VQ4nlztfaXoXNVzhy+NF7uk8HOgn2ph5i1oglLTk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] driver core: Limit the messages on a refused uevent
Date: Tue, 27 Oct 2026 18:18:19 +0100
Message-ID: <2026102718-conduit-glorious-a8dc@gregkh>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=7WA86eHW8/XZY5jWKhBuR6+aFu6P/cEKcUjIYXwRAcs=; b=owGbwMvMwCRo6H6F97bub03G02pJDFkP7tySP+zCnBUSwFB46EjWkor4tU37lq++47P2zqtXu /qkDzA/6ohlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJOF1mmB+zQNz0+LkDAu6/ V6Xk6X77eveg/UWGWczsPe8cbPS3sIe9ejZVzldM4NsXNQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

From: Josef Bacik <josef@toxicpanda.com>

A write to a "uevent" file which is no valid action makes
kobject_synth_uevent() print a warning and uevent_store() an error every
time.  This is generally considered a bad thing so rate limit these
messages.

Fixes: b0e37c0d8a6a ("net-sysfs: make sure objects belong to container's owner")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/core.c  | 4 +++-
 lib/kobject_uevent.c | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f21e225abd51..0e2eccd3e613 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2881,7 +2881,9 @@ static ssize_t uevent_store(struct device *dev, const struct device_attribute *a
 	rc = kobject_synth_uevent(&dev->kobj, buf, count);
 
 	if (rc) {
-		dev_err(dev, "uevent: failed to send synthetic uevent: %d\n", rc);
+		dev_err_ratelimited(dev,
+				    "uevent: failed to send synthetic uevent: %d\n",
+				    rc);
 		return rc;
 	}
 
diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 1480e2c27ed0..1d29378d4f55 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -223,9 +223,9 @@ int kobject_synth_uevent(struct kobject *kobj, const char *buf, size_t count)
 out:
 	if (r) {
 		devpath = kobject_get_path(kobj, GFP_KERNEL);
-		pr_warn("synth uevent: %s: %s\n",
-		       devpath ?: "unknown device",
-		       msg ?: "failed to send uevent");
+		pr_warn_ratelimited("synth uevent: %s: %s\n",
+				    devpath ?: "unknown device",
+				    msg ?: "failed to send uevent");
 		kfree(devpath);
 	}
 	return r;
-- 
2.56.0

