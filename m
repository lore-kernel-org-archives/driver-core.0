Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245494;
	b=CjAbdmnaE33WmBk8kcqoVIwZKCDw+oT5d6X7VgLISFDwVtXuBY/uI2/8PrU2yoaUhyW9
	 JKn7fGtdYLnB2TolvcRBYBS4AD1GvmhZaLXrv+GNVrRv7FCwP7sgNsMn1i6moDLzEjTL4
	 ze8yvE+mVqaEo74C/665kkX0fc1dz/FLoaKBOjr0rttXKZVxqzQBUjyePQcyjCAxUZT0D
	 ahhrb+9JFJ/UneK1aemjTv+xYX6nETj+LxjTJJlgDnRp1KZuNLxp8dd7nVE3RcDrYbaDi
	 df+b2InKumzOocNw3fR+zIBEz1vyhpFV+zjuqXu6z/UhmVLwW0tf84lq6yENxqluOuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245494;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/KAXzr2vGrhgAQNtgcIB9Qw2SIQizx1/dUNxASXVx+s=;
	b=Ui2ib67rNj5J4pfObUTC/RwMIhkx54fJh6HrZJcRDu3pxfMpVTNv8wNWNiPn+Mq85oYh
	 JLZleQRBxlolT1tZ+nAPx2WaXxNePcHYkaHC6SgH3xzXjh1nYDc6Qll+/dpAfWl0AwtPP
	 nN3NnVNV4O0XD5Hkj4AMkjS/2GEnqvL//7+m+vKYu9tjaSNBKgqvBxSw0wGLWePZY7S0G
	 1Lnhi3KeQmh2mMxlKArvjtf+pd2+nDh++6pGdpzmOI6quIE6U/8/wfRUMzdAJ905fJxo/
	 pm77dfEcch0aUpeJ4uUBLrffrS5JyXCmnIgYgyRaYB0/VDUw3y5v1/826SzJ6eiezog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3XWwRqn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A5606A33B
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3XWwRqn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69221F008A6;
	Mon,  9 Nov 2026 17:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245493;
	bh=/KAXzr2vGrhgAQNtgcIB9Qw2SIQizx1/dUNxASXVx+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P3XWwRqnVjIEuZaAtfKos4QhGrTwuRK2L11dEwL0rhZ5dC/TE7+zmugDfjL4M5nt1
	 07qJ8Fy1tPgbpYbcJiQyxGUvBydMEqVrGyXVzAucU4nEYU5aJ7Pz+cYwvdmm6scB9r
	 beybTmNwRU594NYOAVvpHXX40u4+0fH76F+tN3504Ivp6xDXyPeDR33HjokOMF0Ykq
	 1D/k9Y3yPsDeW5MVMXf3F9XX6bc+hs6FMvipmWiPSdEIrVRFJanqptCxlal03zcBOb
	 bEddpZZWZEaDjQqBMHCgbXrk8KO0/z5koe94CuxXYe8QiDW7A8E/9Qc0oJqYPKn7By
	 ZgsnCSVHiyAWQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 4/4] arch_topology: Free raw_capacity when topology parsing fails
Date: Mon,  9 Nov 2026 17:31:25 +0000
Message-ID: <20261109173125.1734847-5-sudeep.holla@kernel.org>
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

When parsing /cpus/cpu-map fails in parse_dt_topology(),
init_cpu_topology() calls reset_cpu_topology() without calling
free_raw_capacity().

topology_parse_cpu_capacity() allocates raw_capacity on the first CPU
node with a capacity-dmips-mhz property. If a subsequent core, cluster
or socket fails to parse in parse_socket(), or if a possible CPU is
missing from cpu-map, raw_capacity is left allocated and partially
populated.

With CONFIG_CPU_FREQ=y, free_raw_capacity() is not registered as an
initcall. If cpufreq policies are registered for all possible CPUs,
init_cpu_capacity_callback() sees the non-NULL raw_capacity pointer and
runs topology_normalize_cpu_scale() on the incomplete array, leaving
unparsed CPUs with a capacity scale of 0; otherwise, raw_capacity is
leaked.

Free raw_capacity when init_cpu_topology() resets the topology on
parsing failure to discard the partial capacity data and avoid leaking
memory or setting unparsed CPUs to capacity 0.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-1a2a8094-971d-40cb-b0cf-2e6d9f26c549
Fixes: 60c1b220d8bc ("cpu-topology: Move cpu topology code to common code.")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/base/arch_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index c439fc91270d..7783c0c517eb 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -954,6 +954,7 @@ void __init init_cpu_topology(void)
 		 * arch-specific early cache level detection a chance to run.
 		 */
 		reset_cpu_topology();
+		free_raw_capacity();
 		cpu_smt_set_num_threads(1, 1);
 	}
 
-- 
2.43.0

