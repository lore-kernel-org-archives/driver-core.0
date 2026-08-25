Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AA025CC79
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 07:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.78.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641536; cv=none; b=Rh/Ges7KHMU8RcHaFYAnVIvbqDEkoql/yWLAoSQ3H8Z2+UsCRUIdhv3g4aC+xEC+uM8grC0hWnBOA6YSDi2GSMaZS4nVtsSkd/YkBwhZU0C303NYcMcveBiTy9JHfPUGiFDyBnnIpVAsgUaKCin3Sc44Kpyf/dzgnos/clZiiKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641536; c=relaxed/simple;
	bh=a60ZAUuDEFXwWm50B4jlOfaQjY/HSzApRqnqVd+ej4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bp8FNFt+vzy1iWHYNiKgjkOynPQ46VaLe9OmDS21OzI/qg6tqKKrnik/f5IeujAsk/4PND/IIAWocMqcwcbALbIDueoD1NhCGOqgG2Dr6W76Lkcz+4Grv8MdiBG0GcoQ3SQxj50UfrkdW/3VjnA8k1ACA/18yNSGENsMvE1X5Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.76.78.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.190.160.162])
	by mtasvr (Coremail) with SMTP id _____wA3tiy4Po1qEeLAAA--.608S3;
	Tue, 25 Aug 2026 15:05:28 +0800 (CST)
Received: from 192.168.5.38 (unknown [10.190.160.162])
	by mail-app3 (Coremail) with SMTP id zS_KCgAnPnC3Po1qAIuqBA--.54805S2;
	Tue, 25 Aug 2026 15:05:27 +0800 (CST)
From: Jiacheng Xu <stitch@zju.edu.cn>
To: gregkh@linuxfoundation.org
Cc: vishal.moola@gmail.com,
	rafael@kernel.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	driver-core@lists.linux.dev,
	Jiacheng Xu <stitch@zju.edu.cn>
Subject: [PATCH v2 RESEND] kobject: fix out-of-bounds access in kobject_action_type()
Date: Tue, 25 Aug 2026 15:05:25 +0800
Message-ID: <20260825070525.76409-1-stitch@zju.edu.cn>
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
X-CM-TRANSID:zS_KCgAnPnC3Po1qAIuqBA--.54805S2
X-CM-SenderInfo: qtrxiiaqttimo62m3hxhgxhubq/
X-CM-DELIVERINFO: =?B?m1FgSQXKKxbFmtjJiESix3B1w3tMoM3snk/k5SVzZVydjEqe1eefKHnLf95EnB4iem
	egWzO/wNhIP+pglnkLd0BnOseY7yZURa9/aTZdjFdCZ6LvppqCAjDpUvMasmwYmRY3z57x
	KdIliCu/wImWqY+lxJDYTRELsriASjh7/H7VYkk6
X-Coremail-Antispam: 1Uk129KBj93XoW7Zr4xKryxJF1ftw48Aw4xAFc_yoW8Xr13pr
	sI9w13tF95Jw47GwsxtaykWFW7Za1kAr1UJF909wnIkw4Y9wnYgF1DKr1UZr13GF95Ar1Y
	q3WUKwn09ayDZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Gb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1tfQtUUUUU==

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

