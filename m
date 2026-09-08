Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850058F077
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887844; cv=none; b=licJxOT9JDvSkN0OOlAykwLT0HGZ4zem9+jsDfGKVYfOKcpk/He39rrxKHWWA0fV/d0WcBh0W6wpaAGUOFbDi8jNKNwTzmAm/8apCKS8pVMwHoDAeDnsf2kn+m5Y1M4NzxgHBX9qT+Tdbxj75Q8Gb5Q7C9nI1r5JEvyJ0vwjK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887844; c=relaxed/simple;
	bh=Dwyc+5KFatPgqOfM6fiICZd6cFIS58K7bYSDTZtCAtE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oJ03tJXo6OeA62VMrmTP+GNKdJt6yLpbzBIa/YmjD+Wi1Gic/uL8RAMRtNlc+qn0L7Bj8gZFBvup9rQqXL3/RE4DwVYmqVGYiuTcL39b3n6lzy0Url/pO/NqYtB+CWl5U9Omqbwwy7cp6badb6TQo9MJdjdTFrLlo9weQ8c4igo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=izwVjCpZ; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="izwVjCpZ"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso57168725ad.3
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887842; x=1789492642; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSlHq0SmvCt51JoCh9r13XuOzmtJA9g6nMobC24S5K0=;
        b=izwVjCpZe2YM7iZje/IXax8HFt3QYejVM90cyTeK7rAGmNTX69190FkzhbfiHz0T4Z
         z+NiaZqU6qy03PsgAVLqo7EAPCcVHG2Aotc5/GY+7KMMajxgBvD8afux2rnw4a5mID/M
         Itg3qSj5XNe0p4V1XuWVuyoSaA0t6alFbpUfrPC2by30Ze28dVI8xfRNuyfFy4Prxsl0
         j3nSmKBAp8hpYKODoIOnhA7qlvdXCfZVDEkMof9Mz8AzMzDDW9cJYE+Nc80IZVRVIc5n
         trnN5uWgyi0FX/IIJBHeJp4BH27sLrzo6hlF08J0t2ndXfizHV5rpAGMFxrjTR6SbVkY
         VPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887842; x=1789492642;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSlHq0SmvCt51JoCh9r13XuOzmtJA9g6nMobC24S5K0=;
        b=Jf+wRnNriULa926FKYHN0bKOMmCSKXqMEg97B6Q9CxGZ1B3CmuU2xc42wHRZ+e6QSa
         hOfdoIUOrLl0PzryXT8oUwzjo4I75fclNQOBs0b+v1AOyLdWQ9SLVeeyswgD5Gh4zcZd
         uJmgKFseXo50dLLg0BC/Z77H3Anac/qG8YZ2sZCLnkIdnyABwb21zQ43lVZnfiBKtnnE
         KaFJPPAre+jqj+w9fMxJFVSqhlXkBqTMI50TxDSs2mCly0AgpGfla/PlPcihzasokt/6
         75mTWhMhi20593uabEd5mGP9GbmoCsnpG492TfYauClmDz07qh+sWlHLA21T0BnzzE11
         TeCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwc4z7KBgoH55pg5qSSHh9HKn0Im2XG4uVUVXYEhni8S2jzBdMOWmyc7Y39pPT7buV4JqnhIU2yz7zrQg==@lists.linux.dev
X-Gm-Message-State: AFuF++kgK/yzUD5YS2nDMIYfbINGNrb8xUGkzjXjEAuffTaHngf+D1ZN
	SD6B35nwZiBAFBWD1gZW9deOdR+0uuK/It69o5jF6s5spynFIMTvEaqMC7m52pnDlPUPq4VJU8i
	cwg==
X-Received: from pjbfh16.prod.google.com ([2002:a17:90b:350:b0:39b:9fad:2ae7])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8b:b0:398:9bd5:490c
 with SMTP id 98e67ed59e1d1-39b26214502mr42288900a91.19.1788887842174; Tue, 08
 Sep 2026 10:17:22 -0700 (PDT)
Date: Tue,  8 Sep 2026 17:16:59 +0000
In-Reply-To: <20260908171712.356645-1-praan@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260908171712.356645-1-praan@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260908171712.356645-4-praan@google.com>
Subject: [PATCH v10 03/15] iommu/arm-smmu-v3: Add arm_smmu_drain_queue() helper
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Daniel Mentz <danielmentz@google.com>, 
	Ashish Mhetre <amhetre@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Thomas Gleixner <tglx@kernel.org>, driver-core@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Nicolin Chen <nicolinc@nvidia.com>

Add a counting-based arm_smmu_drain_queue() helper, to replace queue
specific polling loops. Its until_empty mode serves the suspend and
runtime PM routines that would drain the CMDQ. Any timed-out drain fires
a WARN_ON as well, since reaching the timeout would take some stuck
consumer in any realistic case.

The existing queue_poll() API is not reusable for such a drain: it is the
atomic busy-wait for the command issuing paths, and it assumes a hardware
consumer making progress. A drain caller is sleepable, in contrast, while
the EVTQ/PRIQ consumer is a threaded IRQ handler that needs the CPU: such
a busy wait would starve the handler throughout an entire timeout, whenever
the waiter and the handler shared one CPU on a non-preemptible kernel. So,
this new sleeping helper is marked with a might_sleep() as well, given that
an atomic-context misuse would otherwise hide behind an empty queue.

Note that a drained event is dequeued, but not necessarily handled, since
queue_remove_raw() moves the MMIO CONS before the threaded IRQ handler gets
to push the event onto the IOPF workqueue. A subsequent change will invoke
synchronize_irq() and iopf_queue_flush_dev() to close that gap, and it will
act on the errno of a timed-out drain too.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 81 +++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 06b7de2e6e4b..84b56849f6dc 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -948,6 +948,87 @@ static int arm_smmu_cmdq_batch_submit(struct arm_smmu_device *smmu,
 					   cmds->num, true);
 }
 
+/**
+ * arm_smmu_drain_queue - Drain an SMMU queue
+ * @smmu: the SMMU device
+ * @q: the queue to drain
+ * @until_empty: target selection
+ *
+ * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
+ *
+ *   cons0                cons                                prod
+ *     |                   |                                   |
+ *  ---+###################+=====================+=============+--->
+ *                         |<--------- undrained==0? --------->|
+ *
+ * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
+ * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
+ *
+ *   cons0                cons                 prod0         (prod)
+ *     |<---- drained ---->|                     |             |
+ *  ---+###################+=====================+=============+--->
+ *     |<--------------- pending --------------->|
+ *
+ * Note that a drained entry is dequeued, but not necessarily handled: the
+ * EVTQ/PRIQ callers must follow up with a synchronize_irq() to wait for the
+ * threaded IRQ handler to finish handling the dequeued entries.
+ *
+ * Context: Process context; may sleep.
+ * Return: 0 on success or a negative errno on timeout.
+ */
+static int __maybe_unused arm_smmu_drain_queue(struct arm_smmu_device *smmu,
+					       struct arm_smmu_queue *q,
+					       bool until_empty)
+{
+	ktime_t timeout = ktime_add_us(ktime_get(), ARM_SMMU_POLL_TIMEOUT_US);
+	u32 cons, prod, prev, undrained;
+	u32 drained = 0, pending;
+
+	might_sleep();
+
+	cons = readl_relaxed(q->cons_reg);
+	prod = readl_relaxed(q->prod_reg);
+	/* The exit target: the number of entries in the queue at entry */
+	pending = Q_POS(&q->llq, prod - cons);
+
+	while (true) {
+		/* Accumulate the entries consumed since the last poll */
+		prev = cons;
+		cons = readl_relaxed(q->cons_reg);
+		drained += Q_POS(&q->llq, cons - prev);
+
+		prod = readl_relaxed(q->prod_reg);
+		undrained = Q_POS(&q->llq, prod - cons);
+
+		/* Exit on an empty queue, regardless of until_empty */
+		if (!undrained)
+			return 0;
+
+		/* Snapshot mode: exit once the pending entries are drained */
+		if (!until_empty && drained >= pending)
+			return 0;
+
+		/*
+		 * A timeout means the consumer might be stuck. In theory, if it
+		 * moves 2 * qsize entries or more within a single poll interval
+		 * Q_POS() would wrap and undercount drained: that could trigger
+		 * a spurious warning too, if the queue was never once observed
+		 * empty. Yet, that much consumption in such a short interval is
+		 * unrealistic. WARN it only, as a stuck consumer is a real bug.
+		 */
+		if (WARN_ON(ktime_compare(ktime_get(), timeout) > 0))
+			break;
+
+		/* The consumer might be a threaded IRQ handler. Yield to it */
+		usleep_range(100, 200);
+	}
+
+	dev_warn_ratelimited(smmu->dev,
+			     "queue drain timed out at prod=0x%x cons=0x%x\n",
+			     prod, cons);
+	return -ETIMEDOUT;
+}
+
 static void arm_smmu_page_response(struct device *dev, struct iopf_fault *unused,
 				   struct iommu_page_response *resp)
 {
-- 
2.55.0.979.g7e5102b832-goog

