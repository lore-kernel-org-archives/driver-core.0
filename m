Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8AA2BEC5F
	for <driver-core@lists.linux.dev>; Sat, 15 Aug 2026 02:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786760566; cv=none; b=PEVnn/xeV9vjzogsy3R8uqeLr7CaABenJqGz7T4iAZ5Ur5VVpVr5eDRlP8WXuOxEAGdQvcWHPQSiBkwdbAZDeaehhvOCKoqg4PmJQ8QFJhSu3GmhbaR40jzmbDekgHGdN5laQoEVSSYqQkL3Cc85l78Ejl9JZj0RUJaeB3NngJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786760566; c=relaxed/simple;
	bh=Ee3FdVR/GdnvH5dGnkcUbmVcmuQlP7cQ1YYOfk7SjRE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=bMAkE3bTcgPeckdH2xOcDQI55WzSfby8eTvKORMP74OnAYJbP5DlSmh79/FdDIJDFntEr2CdnOyDCg1YF+5YkwTLT6aizdLJp94dWBoLkg749yjO2ED42S5mqbj0wSEHu4Q8Dx1fi5yLLHivsCovrtBmXnb8dKB5Kk4Y8ElvWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=sT3xdZYB; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="sT3xdZYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786760534; bh=9+6xBqYjXWiwtS8jU5WNVik2hUwsA5jxqbdJYSYzGJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sT3xdZYBmHlVuwq5uG0gD7w/VVz2OJ0J4p3/SyHz7AtN1YmojahofXOghOaMS5lwM
	 VJlx8FOk/JRwmYFsp07RsOhLWiY0yH5J/NGBWFb+K82hbDqk3EYmFcgzyOzf/FmZqJ
	 gYX1QasYv/n5A1wwBgOy+PF6cN+wlIvmiL0YNEJk=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 58B9C4D1; Sat, 15 Aug 2026 10:22:11 +0800
X-QQ-mid: xmsmtpt1786760531teb8qx8jf
Message-ID: <tencent_5A6ECE8C93A7F206CD12F4C65C49852EC906@qq.com>
X-QQ-XMAILINFO: Mfa2ogpi8We7DAxRZS9qKSApTp7KTtUoUwfw/ryL6yi2gIEe6rs8colH+2WM2I
	 /Kv9Vkcv0mWxySa5IBChv5QKduX02sjgHbUbvXUwLlHeoTWqOXvV0OPkAtqJZpCgG8kqLP2lUiBo
	 7v+G1rCUwXHd7uBIseQa6N+O9r+jFmW4dewM/cKWg/cXrZ03FxMZsvK9UYmkjAeWLKAsRm7StBfo
	 0elhDB357khK1A02fEN0T/HNJHjdgPkSwaaN1FAqmSRQoKSdvZXKsd0g4qK311Q+VsfiRfzlG1lL
	 Z6w9rdaNkV5+e5tHRYDLjfPtHg+2NUdyDojjJ4+FJnv5QoGeA4+vQDvJ/+d6sLSGvNZsBzg3nA1g
	 DMbYi6b0StEM46AfOAgwl/stCY7TldzDpEfx96bYJ5Vb5/n/XfRh8O4lR7+D6LpV2ZTU7fvvbUC5
	 MJFb73XGdV5fEoSL69C+1to4Rh8qk6Fb4cllk5UWjdhAUXjDXHdlDyVMwQ+bOl/SnhiQWtdYDbNZ
	 xSZJnHJzUaNXeSMwdwsqp0aW7O1ImucFbty2KG0+Yq/K5/kqd64D2fefgsfNEM04jGIflSanIIzN
	 NCl8gQVCfDXAyUdZd80Vx6vxI345bEB1kubpJroBPaVHeJQBbrt7t5wWmrPNU2MGQZkBTmQpr5Jm
	 9xF0F84e6533G3zbx+U6F6eKkvcFPX9oJT7oV8wzncKBY1Bd7kFTYs2CB5lC9IXZj/+XbXpitbrL
	 ghBusu24gad5WUTb7NyTJXDydJg4HjdyrRryhie5NIa3nqKlGp5kQ8ZKQXSSM8xBxGuHkLzjk8KC
	 3QmJj0jmABAQV8hEt3z/pJ66Vfiz8hT3hb2DE0+Y4kY+B8iwnmlVu289TQfEB2MdrTnXDkxRfpxI
	 ocvawITCDVHMmiOOukmiq9HzgQ8onEGHNhS2o+mDE0rZ3h+yItf5zQ5urxX22doaVlHjBF74Vo3j
	 OeCRkwCtiQYqWXf/fqyACsjiyh7lF6LiKg3dXxIpYsb3nh+i6ui49rEnRWfDNXf0hPEB5dMOwD+a
	 xCnqY4bw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+de42beb9ccc760a210ab@syzkaller.appspotmail.com
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] driver core: Cancel the attach if device addition fails
Date: Sat, 15 Aug 2026 10:22:12 +0800
X-OQ-MSGID: <20260815022211.247040-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a7ed70c.5b0d2c79.2ef4ef.0004.GAE@google.com>
References: <6a7ed70c.5b0d2c79.2ef4ef.0004.GAE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a null-ptr-deref below [1] following a fault injection in
device_add(). [0]

When device_add() fails, dev->p is NULL.
Later, __device_attach() tries to access members of
dev->p(e.g., dev->p->dead), the issue in [1] is triggered.

Let's handle the error of __device_attach() properly.

[0]
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 1, space 0, times 1000000
Workqueue: events_long serio_handle_event
Call Trace:
 kmem_cache_alloc_noprof+0x91/0x6a0
 kernfs_new_node+0x117/0x150
 __kernfs_create_file+0x53/0x350
 sysfs_add_file_mode_ns+0x207/0x3c0
 internal_create_group+0x593/0xfb0
 internal_create_groups+0x9d/0x150
 device_add+0xf60/0x1970
 serio_handle_event+0x59b/0x990

[1]
KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
RIP: 0010:__device_attach+0xb0/0x4d0 drivers/base/dd.c:1074
Call Trace:
 serio_find_driver drivers/input/serio/serio.c:112 [inline]
 serio_handle_event+0x60a/0x990 drivers/input/serio/serio.c:206

Fixes: 654888327e9f ("driver core: Avoid binding drivers to dead devices")
Reported-by: syzbot+de42beb9ccc760a210ab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de42beb9ccc760a210ab
Tested-by: syzbot+de42beb9ccc760a210ab@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/base/dd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..d345f6c175a6 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1071,7 +1071,7 @@ static int __device_attach(struct device *dev, bool allow_async)
 	bool async = false;
 
 	device_lock(dev);
-	if (dev->p->dead) {
+	if (!dev->p || dev->p->dead) {
 		goto out_unlock;
 	} else if (dev->driver) {
 		if (device_is_bound(dev)) {
-- 
2.43.0

