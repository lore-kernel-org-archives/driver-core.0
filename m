Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F136E3D16FD
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882759; cv=none; b=H154ZhgRUva9qoXRbRhmsltJTcNVI75hhQH/5+S9c0ez+jBCuGXkx+bahprIwsFE7fxONwJr1+58Hw9pswsfJtjVCE4hMdg8Q5zp1pBP4o+uY7qbzYuVuaW260qYLst4K2WhUtmffM3Vgqo3Oda2se7ZJU/skK8ujnsEmVzW0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882759; c=relaxed/simple;
	bh=KUtjs6FgOjsyLkOFxgBaigUiwew9qgi3NFDBAcDMWv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUetgVbX5Xij+x2sYNrhl66Q6RlsGeRGj99ihvHo0e+jctaoXdfy2cYSCRuE1R9uh0bS1vH1al9DaDZAfqgGxC/HDwLKhiHYq3P8+XdoDsJLvaZBkdM+T99yklNNrg5J5fExwcKHPN2pVNNx4QhAJhYoHENOyIVejinY3qcqyZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.162.235.101])
	by mtasvr (Coremail) with SMTP id _____wD30H13ca9qOVomAQ--.23770S3;
	Sun, 20 Sep 2026 13:39:04 +0800 (CST)
Received: from localhost.localdomain (unknown [10.162.235.101])
	by mail-app2 (Coremail) with SMTP id zC_KCgDHFMl1ca9q4MSLBA--.35390S2;
	Sun, 20 Sep 2026 13:39:02 +0800 (CST)
From: Jiacheng Xu <stitch@zju.edu.cn>
To: gregkh@linuxfoundation.org
Cc: vishal.moola@gmail.com,
	rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	driver-core@lists.linux.dev,
	Jiacheng Xu <stitch@zju.edu.cn>
Subject: [PATCH v3] kobject: fix out-of-bounds access in kobject_action_type()
Date: Sun, 20 Sep 2026 13:37:26 +0800
Message-ID: <20260920053726.22626-1-stitch@zju.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <16559d89.19644.1a037110cc7.Coremail.stitch@zju.edu.cn>
References: <16559d89.19644.1a037110cc7.Coremail.stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgDHFMl1ca9q4MSLBA--.35390S2
X-CM-SenderInfo: qtrxiiaqttimo62m3hxhgxhubq/
X-CM-DELIVERINFO: =?B?6+2IkAXKKxbFmtjJiESix3B1w3tMoM3snk/k5SVzZVydjEqe1eefKHnLf95EnB4iem
	egWwQkFDeLwlqL5lzEaRMYLHIYeLkY9kwH+qefAODLgNNC5oIwDjHnHuA84Faspe9V2ONg
	XhsWVp2R/a+JezvqnT2XguWHTWSWDw9kjeBztpJ5
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw4DWF1DKrW3Jry5ZrW3CFX_yoW8ArykpF
	Wa9w13trykJw47Gws8K3ZYgFW3Ga1ktryUGF90vws3K3yY93ZYganxKr1Duw13GF4rAw12
	qa4jgw4Y9FWUZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU7xwIDUUUU

kobject_action_type() compares the input against each known action
using strncmp() and then indexes the action string using count_first
to check for an exact-length match.

An embedded NUL can make strncmp() return zero even when count_first
exceeds the length of the action string. For example, the five-byte
input "add\0X" makes the parser access kobject_actions[KOBJ_ADD][5],
which is beyond the end of the "add" string.

Check the action string length with strlen() instead of indexing it
with the input-derived offset. This rejects malformed action strings
containing embedded NUL bytes with -EINVAL instead of invoking
undefined behavior.

Fixes: 60a96a59569b ("Driver core: accept all valid action-strings in uevent-trigger")
Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>
Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
---
Changes in v3:
- Document rejection of action strings containing embedded NUL bytes.
- Correct the Fixes tag.
- Correct the malformed-input example.
- Add Vishal Moola's Reviewed-by tag.

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

