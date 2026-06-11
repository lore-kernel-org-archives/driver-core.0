Received: from outbound.st.icloud.com (p-east2-cluster3-host11-snip4-10.eps.apple.com [57.103.77.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482363F4DE0
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186040; cv=none; b=GC2ssyqEymFSlNVYn8XO/XVn6yplcyFsvf1B6c67ktSOyN81WUbzGl65vYBXCOLQBixkBDQ0Yp/qcNu6Cf1/cXmGBRDJzPR0cfyMbO1JgJJKV4szNSkDwABQvL7IdiUVEe9jj5u4coDOUDwWWtE6EsxjaHnzZatK9PJNow8hEpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186040; c=relaxed/simple;
	bh=PfFj0FPRNTre341Q7wIafF4wkJWI9Fa+Kqg0sb3T+XE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YSCrrSTKwh2tugH1vNR8X3NKKaFhbLOCPYfF7dYZrnhyoPxgDuhTLQ+d3eoWkqst60tzbi14vb/syTid4pAqHjzBPCXOSQMLTfqCsCnutZv2fA8njLG8HoU7AtMyRM4q/TJEVQOnIG60YFanenkYojcR0C0tzsvQ5yaC3lST7oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=NHq//Ni4 reason="key not found in DNS"; arc=none smtp.client-ip=57.103.77.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="NHq//Ni4"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPS id AF2ED18000A6;
	Thu, 11 Jun 2026 13:53:56 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhJA0MBXBxHCVYCXAdLVxQEAVgtTkZZH1NWXQhDS1QUBAEeBlgBHB5cDBMfVFYEUFEdXwIKBEcEWxdGA1NFQQQXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PCRQTXAcZBVcEGRVaCQpXBBQIHFBaAF5UR11NVloCX1ZHCkwKXQBeA0QMSwddAl9URgFKUQxUXhxBDkACXABaC0EBVlQEQ0VLG3kBHgZYARweXAwNTUMSQhUEG0YeQwRfL10XXgxeBQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1781186038; x=1783778038; bh=eroEUBChHXHVueJV1H9Se+t+asGD6YJDNw99Mz7k7+M=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=NHq//Ni4Yg51TmneJB1tAg4H4yqCf/74p4zE7TvEGn2ocksIP4oSRp4X7FTPcuAwwahPtHFi23VD6DK412ashcC0unTQRs3+EQF4o2FogZ6+pcqAX5mwy/PjulVAXHqwlwbJdDTl0AlpKWAOIR8txTcOhA0kVF646iva7roENN5DUxvfNleu45RJ0aji3Psiid0IzRkdXRR8xvOXYbBr10d481iHWf5aTLgSFB2bQQz7oGTsDhHymkcER66kRAaq/UmQoLOeX2bfM2uMJvDGr1lMYyDlGV5u+ao+Z5Nak6YKjsGVKa0rg1mvdWfapzmAjBTtLd2mtaVaCI91r4op1Q==
mail-alias-created-date: 1719758601013
Received: from desktop.tail809fd.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-4 (Postfix) with ESMTPSA id F2C96180054F;
	Thu, 11 Jun 2026 13:53:51 +0000 (UTC)
From: Yohei Kojima <yk@y-koj.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Yohei Kojima <yk@y-koj.net>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] debugfs: warn if file creation failed due to uninitialized debugfs
Date: Thu, 11 Jun 2026 22:50:16 +0900
Message-ID: <6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEzOSBTYWx0ZWRfX8uvGxM+ORyRj
 FBgU3CSVAJodxS/wYfDMLpWpjZIyMVdU0HLSiRYG+DwS2dXyuUD8hx7CHm62OvtbrmzvHEh1VVy
 Al0K/KscL5GR95Hsswi48LiOUlSlXxUUNcYOAo6xVBth4SIj/LgS2m6zEDfUmLFUcT3H3u+NOvJ
 ot9D22JPwltGCQNtw0GRoRC2PKHmkpmyehJqQZqXEZVV8cM4OLp7TLQ/ViwDr12NXSE7zzlDjRk
 uC0tjWip+ofwAzyM9ifX5oVpjoevJBm2w4SofnkTxcTAa2XsKCV3gzoiCJAO8mjr3/X2FYUs0vG
 z+dDJQXMNrQ4CLNbFH7wjGiZwEBwy2Fn1ah64TFc8aSO++cOHMsWeZ92vvhJGg=
X-Proofpoint-GUID: kRtm12QffUfCl9GzfndE7V75Tkb0JWdi
X-Authority-Info-Out: v=2.4 cv=N4wk1m9B c=1 sm=1 tr=0 ts=6a2abdf5
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jnl5ZKOAAAAA:8 a=_xAqOp6IjimozsifCeEA:9 a=RNrZ5ZR47oNZP8zBN2PD:22
X-Proofpoint-ORIG-GUID: kRtm12QffUfCl9GzfndE7V75Tkb0JWdi

Improve debugfs_start_creating() to warn if it was used before debugfs
initialization. It silently returned ERR_PTR(-ENOENT) before, but it is
hard to find the cause of failure especially if it was called by
debugfs_create_dir(), because the document of the function says:

> NOTE: it's expected that most callers should _ignore_ the errors returned
> by this function. Other debugfs functions handle the fact that the "dentry"
> passed to them could be an error and they don't crash in that case.
> Drivers should generally work fine even if debugfs fails to init anyway.

Signed-off-by: Yohei Kojima <yk@y-koj.net>
---
I tested my patch on my x86_64 qemu/kvm environment with the following
code (I appended this to the end of fs/debugfs/inode.c, but it should
run anywhere in the kernel):

static int __init try_making_debugfs_early(void)
{
       struct dentry *dentry;
       dentry = debugfs_create_dir("early_debugfs", NULL);
       WARN_ON(!IS_ERR(dentry));
       WARN_ON(PTR_ERR(dentry) != -ENOENT);

       return 0;
}
early_initcall(try_making_debugfs_early);

static int __init try_making_debugfs_pure(void)
{
       struct dentry *dentry;
       dentry = debugfs_create_dir("pure_debugfs", NULL);
       WARN_ON(!IS_ERR(dentry));
       WARN_ON(PTR_ERR(dentry) != -ENOENT);

       return 0;
}
pure_initcall(try_making_debugfs_pure);

static u64 postcore_u64 = 0x0123456789abcdef;

static int __init try_making_debugfs_postcore(void)
{
       struct dentry *dentry;
       dentry = debugfs_create_dir("postcore_debugfs", NULL);
       WARN_ON(IS_ERR(dentry));
       debugfs_create_u64("u64_value", 0400, dentry, &postcore_u64);

       pr_info("Successfully created a directory and a file in debugfs!");

       return 0;
}
postcore_initcall(try_making_debugfs_postcore);


And it warned as expected if it was too early, and succeeded if it was
called after debugfs initialization:

[    0.114434] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    0.114434] debugfs: Unable to create file 'early_debugfs', debugfs is not initialized yet
[    0.114434] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.114434] smp: Bringing up secondary CPUs ...
[    0.114636] smpboot: x86: Booting SMP configuration:
[    0.114910] .... node  #0, CPUs:      #1 #2 #3
[    0.115139] smp: Brought up 1 node, 4 CPUs
[    0.115139] smpboot: Total of 4 processors activated (27351.00 BogoMIPS)
[    0.115466] node 0 deferred pages initialised in 4ms
[    0.117793] Memory: 3939444K/4193784K available (19486K kernel code, 3500K rwdata, 8176K rodata, 4664K init, 4548K bss, 248632K reserved, 0K cma-reserved)
[    0.118647] devtmpfs: initialized
[    0.118647] x86/mm: Memory block size: 128MB
[    0.118647] debugfs: Unable to create file 'pure_debugfs', debugfs is not initialized yet
[    0.118837] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.121105] posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.121508] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 KiB, linear).
[    0.122058] PM: RTC time: 13:28:19, date: 2026-06-11
[    0.122613] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.122989] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.123373] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.123793] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.124222] audit: initializing netlink subsys (disabled)
[    0.124461] audit: type=2000 audit(1781184499.707:1): state=initialized audit_enabled=0 res=1
[    0.124461] debugfs: Successfully created a directory and a file in debugfs!
[    0.124926] thermal_sys: Registered thermal governor 'fair_share'

Thanks,
Yohei
---
 fs/debugfs/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 4598142355b9..e054e62919ec 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -368,8 +368,11 @@ static struct dentry *debugfs_start_creating(const char *name,
 	if (!debugfs_enabled)
 		return ERR_PTR(-EPERM);
 
-	if (!debugfs_initialized())
+	if (!debugfs_initialized()) {
+		pr_err("Unable to create file '%s', debugfs is not initialized yet\n",
+		       name);
 		return ERR_PTR(-ENOENT);
+	}
 
 	pr_debug("creating file '%s'\n", name);
 
-- 
2.53.0

