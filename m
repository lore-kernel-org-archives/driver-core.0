Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net [178.154.239.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22317318B96
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682121; cv=none; b=IUAKoByfM1Ly2F/fHskR2OaezNM37Fh2mrO8D2GS/yqs0QHlDUJ+b65HZobXVCEm849U4WryXA/ex3mSpRzZV1W2KAjJC7NqxYXOfbKihpqhKrUQQFQ75FZMYSVNxpfoHfkz7SNOHHg7rYNd3oFmRPuuzbB0aw1G/pzdtosX21o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682121; c=relaxed/simple;
	bh=7rHsNzIcmek3tWOOIrKLPQETr93/GCm0Fz+/PRUUFvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r8AqpGJk5icT/++H3DEiEvPLj7eVsNHeYQO7wECziPl+rfQswCYAvspr80CJAVey0xJYHOdu1StVKpCceaOvsPmDQ7jpg3NG4wA+iY1KEZMXttz2U8gVKD5sZD3Y8p90csXgrGTDs6WomUTBNDESXlo+GjocxF5bt6LIylyLPfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=LPBNeVMq; arc=none smtp.client-ip=178.154.239.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="LPBNeVMq"
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:221f:0:640:b03f:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTPS id CCD80C0085;
	Wed, 17 Jun 2026 10:41:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net (smtp) with ESMTPSA id mfLfCDfe7W20-twPwWzvo;
	Wed, 17 Jun 2026 10:41:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1781682109; bh=zi77wOFztnj5ZirdgIA7h8ognzCCr4iKXZPI62eMxs8=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=LPBNeVMql9XroG/vOR6jBP8MGcOUK0Zau3g3PBa6mrS9M2493gTqTl+hUJMlfW0dU
	 WWJYbewMVkbmZmCPi/6rjjV5JpQvz52+olh/PmrRdNQUGCJwADzvpaQJtqSu3f7SSs
	 UJHB3D/h42dtFxnGOlChSO9meFvkZqY41XpF3UCo=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Tejun Heo <tj@kernel.org>
Cc: driver-core@lists.linux.dev,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] kernfs: simplify kernfs_name_hash()
Date: Wed, 17 Jun 2026 10:39:41 +0300
Message-ID: <20260617073941.472337-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 'kernfs_name_hash()', 'name' is NUL-terminated so it may be
directly scanned up to end without an extra call to 'strlen()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 fs/kernfs/dir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 97d9d227b66d..82bbaeb326aa 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -330,8 +330,8 @@ static unsigned int kernfs_name_hash(const char *name,
 				     const struct ns_common *ns)
 {
 	unsigned long hash = init_name_hash(kernfs_ns_id(ns));
-	unsigned int len = strlen(name);
-	while (len--)
+
+	while (*name)
 		hash = partial_name_hash(*name++, hash);
 	hash = end_name_hash(hash);
 	hash &= 0x7fffffffU;
-- 
2.54.0

