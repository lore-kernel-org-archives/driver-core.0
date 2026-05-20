Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABBC2C0260;
	Wed, 20 May 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282419; cv=none; b=iQ1Su3xFf0rmykXwOSjdWtKIkSgJxGa6qusA9nu3R/TcFzBiCD5DLLa9uUAVEIiS/ZliZ0lAtKjzA/xbF28VvmOaZKBH69o/EyiJmuefmeIBHkuTu8JOIF/6rk+wZP5QAXMc+4tPodfPlkvIEYEVJj03RRuzaEoJq9K8LF0rmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282419; c=relaxed/simple;
	bh=WRNc7oQn1TrgksJhDz3CxkMcMc37fzxKopTC/1hm8Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLyyN3zU2G4zjEjUmD5UZ9bx/dQLI9gRUFPZDSVlqq7wQ61LZvfDJHqW0d43JKcfTFzErgp3LEpkAy9xe3sEkbQOf0LGqrwJQqXfdWGt4F5D5aVuM/Zhiy2ygbjDFGavAE9Vqv4AgiidwghCFWiejHjvBzrQsHxXtod9VJ1yobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=msV6O89v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="msV6O89v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31DA1F000E9;
	Wed, 20 May 2026 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779282418;
	bh=y6eqfYRUOgholZb4Irxz1LsGTIOHtLdXUa6rWSNqYFs=;
	h=From:To:Cc:Subject:Date;
	b=msV6O89vLmmd0VW81fFBeh3mYy1S2Nol1se4mn5hqVp/aOoscTm0IrmNe9pXC8CEc
	 9fnFBZM9Kw5XejYmT4VwKPvl7E5I+tGSwTzWqpi0Uj6UDD0VBLd4D5hUE7QVJSSLvp
	 Q3BkmqDng9WeFu80jD3kQWuzaNCv6Eby81KH+KKM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	NeilBrown <neil@brown.name>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Date: Wed, 20 May 2026 15:07:01 +0200
Message-ID: <2026052000-drove-unicycle-d61b@gregkh>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=WRNc7oQn1TrgksJhDz3CxkMcMc37fzxKopTC/1hm8Zc=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm8G7+suJJirzk7kOmblZ9/4o6MPJ1XXwS/JnaLve2qn FWSwJbaEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABOx/cowv961L+nL0ZKVc4qZ P2Z/fKy8Z+qdLQwLdsw+fYajnb9r6rQUn3pPtQ0FP6t2AQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

sysfs_kf_seq_show() defends against buggy show() callbacks that return
larger than PAGE_SIZE by clamping the value and printing a warning.
sysfs_kf_read(), the prealloc variant, has no such defense.

The only current in-tree user of __ATTR_PREALLOC is drivers/md/md.c,
whose show() callbacks are well-behaved, so this is hardening against
future drivers doing foolish things and out-of-tree code doing even more
foolish things.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: NeilBrown <neil@brown.name>
Cc: Tejun Heo <tj@kernel.org>
Fixes: 2b75869bba67 ("sysfs/kernfs: allow attributes to request write buffer be pre-allocated.")
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/sysfs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 5709cede1d75..25b44fe171a3 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -120,6 +120,10 @@ static ssize_t sysfs_kf_read(struct kernfs_open_file *of, char *buf,
 	len = ops->show(kobj, of->kn->priv, buf);
 	if (len < 0)
 		return len;
+	if (len >= (ssize_t)PAGE_SIZE) {
+		printk("fill_read_buffer: %pS returned bad count\n", ops->show);
+		len = PAGE_SIZE - 1;
+	}
 	if (pos) {
 		if (len <= pos)
 			return 0;
-- 
2.54.0

