Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5B23C1D75
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 06:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639206; cv=none; b=oCdCsC73JZ/QcH0yTHekZb4m2ZI72NuUzujmhKAxjxnm/nXnZelWJo9bRRBGl2O1KYXp583KIjVMO5d2hjnq+eJnAD56aSk3gFezwPtYHvzQtqgwJGF2lz8zmzu9t37ANVWcL+I2DbUxlCKX41I4PKsJReWlBoZ1qkc3kgDn46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639206; c=relaxed/simple;
	bh=a60ZAUuDEFXwWm50B4jlOfaQjY/HSzApRqnqVd+ej4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK0kjcMYMGbEQM5vtA23uj5wLJzjOSZJ/NmXI/3Z6oF1ddiNY0H3ZAxgltiOPFRCpVjNKZCzeT0yCDvKxXqwxYdPBLPvGD+W/l3vwncIB7FDJ7Z8+pIwvL/IuVOTsKVgWNQs8QaO4G70iGZvh92g94EL1kFD/w0REce1cWK736Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.190.160.162])
	by mtasvr (Coremail) with SMTP id _____wDHz3+PNY1qNLzAAA--.274S3;
	Tue, 25 Aug 2026 14:26:23 +0800 (CST)
Received: from 192.168.5.38 (unknown [10.190.160.162])
	by mail-app3 (Coremail) with SMTP id zS_KCgAHQXSONY1qqVmqBA--.45709S2;
	Tue, 25 Aug 2026 14:26:23 +0800 (CST)
From: Jiacheng Xu <stitch@zju.edu.cn>
To: gregkh@linuxfoundation.org
Cc: vishal.moola@gmail.com,
	rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	driver-core@lists.linux.dev,
	Jiacheng Xu <stitch@zju.edu.cn>
Subject: [PATCH] kobject: fix out-of-bounds read in action parser
Date: Tue, 25 Aug 2026 14:26:20 +0800
Message-ID: <20260825062620.63807-1-stitch@zju.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026082518-swinging-wildfowl-9c19@gregkh>
References: <2026082518-swinging-wildfowl-9c19@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zS_KCgAHQXSONY1qqVmqBA--.45709S2
X-CM-SenderInfo: qtrxiiaqttimo62m3hxhgxhubq/
X-CM-DELIVERINFO: =?B?/MRQgwXKKxbFmtjJiESix3B1w3tMoM3snk/k5SVzZVydjEqe1eefKHnLf95EnB4iem
	egWzO/wNhIP+pglnkLd0BnOsfOZPlHb2NHDvx5+h1jPenQ6Y9p9ny6nTY4tz3QwAmjtZVE
	dkIreh7G8bgJM14S8HtRovRhZtgnUFxLKp856I5m
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4xKryxJF1ftw48Aw4xAFc_yoW8Xr13pr
	sI9w13tF95Jw47GwsxtaykWFW7Za1kAr1UJF909wnIkw4Y9wnYgF1DKr1UZr13GF95Ar1Y
	q3WUKwn09ayDZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU1yrW5UUUUU==

kobject_action_type() uses the position of the first space in the input
as the length of the uevent action. It then checks the byte at that
position in the corresponding action string.

An embedded NUL byte can make strncmp() report a match while
count_first is already greater than the actual length of the action
string. For example, the input "bind\0 ..." makes the parser access
kobject_actions[KOBJ_BIND][5], which is beyond the end of the "bind"
string.

Use strlen() to verify that the input action length exactly matches the
known action string before accepting the match. This avoids indexing
the action string with an out-of-bounds offset.

Fixes: f36776fafbaa ("kobject: support passing in variables for synthetic uevents")
Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>
---
 lib/kobject_uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..b03562301bfe 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -83,7 +83,7 @@ static int kobject_action_type(const char *buf, size_t count,
 	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
 		if (strncmp(kobject_actions[action], buf, count_first) != 0)
 			continue;
-		if (kobject_actions[action][count_first] != '\0')
+		if (strlen(kobject_actions[action]) != count_first)
 			continue;
 		if (args)
 			*args = args_start;
-- 
2.51.0

