Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107813;
	b=x8G20WTF2d5QBicIlN+vCbYc/vlPupfkfXRN8c27RisOwF4qiFaIA83VtjtOmfmDnlZt
	 xzgmtV7NGYVo60zrjQVJFvagHrIoV4LIU/QZ9njPouNQQtqGJuuhBEcOaWh81sN7CmSoB
	 5VlPvaNZiF6UuUB8AZso8CICTNaruagjtpHQ4HeorRIgXHnOoAVYa3WfiluybLTorSYW+
	 EADObOrqt5Qryt6bjUAHaKXxptfbVpO5YXipMacZFG1L43XaCvbud3vLn3j0G2Ux0BwZ3
	 DB/C8fvSXgRNSUTHqfuFDdLW3gkZ2FMt9WPGC2kvrV8L0GRHGWAe00SpqTSzQDJUo7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=CYbXanoVIznje4wNLs5CNwhXIty16UVDrSGIc7iuqrM=;
	b=YeUvverEMyNhR35NRngPzK5QY9srRMYaSx1F63dF7emDg7YPB5H8cwrl2kpOLHVawhaS
	 I2r0GoaM9eJ2LYlldUytaNOaBIQ+eTtQKQvqr52h076vZCFsdLljrjR1TXYCfMCCWFML0
	 bJkNuBdwq+CibyfoBtQv2dW54baphD8I5qOkjoREjYx7AiVOXJqNlBkkOo9rrOzKT7/Kg
	 xp8RGW5K7r1QSeFAgYa8bYkd6Dh+Ojzt4jWttCWJgVQNrjOB2R+0jB9v4oWK9mMsz0Lxn
	 BhITuzFWJ1R08g8Qwh+CquitlT4n8KCdwPZYMD+OCYPrDm6LER/ydtpRFWL6OU4zNVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JE5TgDKY;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593BB606A31D
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 03:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JE5TgDKY
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso100125a91.1
        for <driver-core@lists.linux.dev>; Sat, 07 Nov 2026 19:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794107812; x=1794712612; darn=lists.linux.dev;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYbXanoVIznje4wNLs5CNwhXIty16UVDrSGIc7iuqrM=;
        b=JE5TgDKYZ3AnN5gRp6ayKpnObDEPc83zo83rloo9RoGVhGr8EdabZDKgffHMNdlC7M
         aPHhce+fSIr0Qpmh68RuY73s0mk7wwa4UxaxfLHZ2eVEFVkfR/jpOaV4MYr6MVj+Yk5N
         k6GKikf4S9XomRlPsEyUbob/YVZTe4aJejblI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107812; x=1794712612;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CYbXanoVIznje4wNLs5CNwhXIty16UVDrSGIc7iuqrM=;
        b=DzYhHmGqSiYQ3CaIJBhPt7ye0Lxi04irccwNtM4+V0tmbob7naV+AUZc8UzpIhYxHm
         43YOlj8dDKPbLKKllOgmBLqdWQUesoChMH1eBHp4VqKzUT22IZviqga8067orJu5Y1mq
         SkJAMRIZlQp9PrNTs8l+z6ZhLlQ8KIe/89cfWpveueXWzovWVvgHnzGMjbr3G8+xQ8cS
         Rn09C3P7qPvBWDm/YWqPLULBvGIJCoYVw8g1UgYZd00cOjVV4r47pxJDrZ4/ZXIt6E7L
         JSLS6rpllgwVyGjBFZcLO7+Yr015WRd0Xphq0uHI8BQvmvOrT6MXViNQKC8iodht80xu
         9vqA==
X-Forwarded-Encrypted: i=1; AL+hErEOxHfZuR7rUtEOnIbS7pj0A0RlIO7r+vn1bsc18TsNJDejxym8R8Ekvlrh+kMXMoCuzL+THQtR81mFGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8BoK5OjjMq5F/wO9Zfa8eZu97qX58NY+9WWgLP1U9fPPjFss1n
	9r2NO+RsRgVhzXbMD8HcbexjZUlvT65N43WW15RvaLoR2LNg8x0NNOPzrJfBA5qZV+s=
X-Gm-Gg: AYBFou2OojYyZAErPfDUj5MooBEj7lImibsk1qw+bGIK6VF9AjZE3YbIfn/e3W6zwl7
	olDlizxhtoqkCh8uNn90nm/e3QQ4avkK1dXSJLnddjcM1Wta+/fuQ0dj4DhOQR87FtDyixpme7d
	uqhNFf1FysK013rtdZmK8LtCCV37BqQF+3nDBnp3Eg9H/jJfybOK2oQtq4fJFlPm3KKeyeIGpXV
	xoOjAHr3YbJ+or3A2SfcPf5HxF7eLqgUXfFgvvRQndm9CjvCkxvO+fNxdSA5Fa0WCj93SeAFYub
	Ehs3TJjPXQiA8KHEcBIX9zTa9ij3zm58jLfn3qr1k1CV2fjQF0GEUe0eEivh0ZrzsR48GqrkO5g
	iGcWUDfy7XRjojuTvuatVu1RdaYJAG8B4IPxbVjEsnPZkVkprhd0cFGosUNH62rOofYlqU3H3S9
	j7BapidXu1LtzvKTqHuG/Y4BiKD9l+S2w+IGC2Yd5QcVEw+6nx6A9WmcCS02nqOSfPu4v1i2COv
	shNO5r1MWUm92NIEansZmInpAytf0bCxE68HbtEGywHAH7SQD+oPsOZoHFnu++LumwMF+xfYSkN
	qvLZwCri6IdwjFBSu50rKsNFzuOCPKdT1EZ4eg8mPvJembyVBKczV/xi3Ofj+OY0IA04Z/XmPLt
	a7QJA7h4EJQ0i681prrWMzCNjJiH9IwhXLHFlcfuStOJB21e9Uv+/g7RMOa85/5d+Rexm5UV6eu
	5SoRr8mWsaiJOCyEnvfiNHG99i9LtN39Br+KQjX3C4fuqJwybyWlZA
X-Received: by 2002:a17:90b:274b:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b12d3cbd66mr374011a91.15.1794107811685;
        Sat, 07 Nov 2026 19:16:51 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm5351700a91.4.2026.11.07.19.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 19:16:49 -0800 (PST)
Date: Sat, 7 Nov 2026 19:16:46 -0800
From: Chris Down <chris@chrisdown.name>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Serge Hallyn <serge.hallyn@ubuntu.com>, driver-core@lists.linux.dev,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] kernfs: Build paths in linear time with respect to depth
Message-ID: <au_pnu4s141ylqHD@chrisdown.name>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

kernfs nodes only point to their parent. To build a path top-down,
kernfs_path_from_node_locked() walks back up from the leaf for each
name, so the work grows with the square of the depth. Reading
/proc/<pid>/cgroup does this with IRQs off and css_set_lock held, so a
read from a deep delegated subtree can hold up fork and exit elsewhere
on the machine, which is certainly suboptimal.

Let's improve this by filling the buffer from the end as we walk up,
and if the path fits, moving it into place directly.

In terms of operations, with a 15,000 deep path chain and a 4 KiB
buffer:

1. Parent and name pointer reads go from 112.6 million to 75,003 with
   this change
2. On my machine the second read of /proc/self/cgroup takes 99.86% less
   time.

Fixes: 3abb1d90f5d9 ("kernfs: make kernfs_path*() behave in the style of strlcpy()")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 fs/kernfs/dir.c | 61 +++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 800af10d9511..1ac6a5ec451b 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -94,6 +94,14 @@ static struct kernfs_node *kernfs_common_ancestor(struct kernfs_node *a,
 	return a;
 }
 
+static void kernfs_reverse_path(char *buf, size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len / 2; i++)
+		swap(buf[i], buf[len - i - 1]);
+}
+
 /**
  * kernfs_path_from_node_locked - find a pseudo-absolute path to @kn_to,
  * where kn_from is treated as root of the path.
@@ -130,9 +138,14 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 {
 	struct kernfs_node *kn, *common;
 	const char parent_str[] = "/..";
-	size_t depth_from, depth_to, len = 0;
+	size_t depth_from, len = 0, end, pos, room, n;
+	bool wrapped = false;
+	const char *name;
 	ssize_t copied;
-	int i, j;
+	int i;
+
+	if (!buflen)
+		return -E2BIG;
 
 	if (!kn_to)
 		return strscpy(buf, "(null)", buflen);
@@ -147,7 +160,6 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 	if (WARN_ON(!common))
 		return -EINVAL;
 
-	depth_to = kernfs_depth(common, kn_to);
 	depth_from = kernfs_depth(common, kn_from);
 
 	buf[0] = '\0';
@@ -159,18 +171,43 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 		len += copied;
 	}
 
-	/* Calculate how many bytes we need for the rest */
-	for (i = depth_to - 1; i >= 0; i--) {
-		const char *name;
-
-		for (kn = kn_to, j = 0; j < i; j++)
-			kn = rcu_dereference(kn->__parent);
-
+	/*
+	 * We can only walk towards the root. Fill from the end and wrap
+	 * so that if the path is too long we keep its first bytes.
+	 */
+	end = buflen - 1;
+	room = end - len;
+	if (!room)
+		return len;
+
+	pos = end;
+	buf[end] = '\0';
+	for (kn = kn_to; kn != common; kn = rcu_dereference(kn->__parent)) {
 		name = rcu_dereference(kn->name);
-		len += scnprintf(buf + len, buflen - len, "/%s", name);
+		n = min(strlen(name), room - 1);
+		if (n + 1 > pos - len) {
+			size_t head = pos - len;
+
+			memcpy(buf + len, name + n - head, head);
+			n -= head;
+			pos = end;
+			wrapped = true;
+		}
+		pos -= n;
+		memcpy(buf + pos, name, n);
+		buf[--pos] = '/';
+	}
+
+	if (wrapped) {
+		/* Rotate the two pieces into path order. */
+		kernfs_reverse_path(buf + len, pos - len);
+		kernfs_reverse_path(buf + pos, end - pos);
+		kernfs_reverse_path(buf + len, room);
+		return end;
 	}
 
-	return len;
+	memmove(buf + len, buf + pos, end - pos + 1);
+	return len + (end - pos);
 }
 
 /**

base-commit: a42ae51fe3c36cef82dc687ea594ca232a785fd4
-- 
2.54.0

