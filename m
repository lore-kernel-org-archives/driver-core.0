Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90AB35EDAE
	for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933519; cv=none; b=Lqxkv2JjPePeYJkBjbYfS8lHgl9rdHoTCrvPXI4MIRaHuLotCwV/pbRZElDLmVNWx0xZWa92aV0/XaNIfpcIKyuANVNQPWQZiM4pQCbPB81TkSrUckodrAT42mzcQcfQ3XBLM0ayYtihDLCzRMb9nRUBIepaD6jrVFuRMocGlzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933519; c=relaxed/simple;
	bh=ezbBm/Tq1NbOZNYchfM5BrbiYJXHM46rp75jJpESgIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YdnO2A4ETM0LMbQiy+djLJx/woZa8FoLWcdwEtxvgrK4gVi1Ymx7R5/FNOibnU3q1l8JLHqSBFWU0fS1HGEhVK1rPLIQaNvvEpNZGd2DLYSMTp1pMssW/eeeVPdpKAZb+gs06uUW/GUwrzxVL+A+Jxrn1EbnyVEr5Cd6TxkSU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c63LqJrE; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c63LqJrE"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso260513a91.2
        for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 13:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770933518; x=1771538318; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/49beE9xrDbjk2PTkq3bWwQqpKtfvuvBtaf8t9tZ8yg=;
        b=c63LqJrEZQQWlbqFqlZ6B/ec6hMvxCdAtScv7u5dSgl+B2vqeG0XkbAW5gjmTBjH9G
         qq7Kb6ZvEWpjP/pj7CJk1B8XgqqXnjgmcITFt5NsyZhkaKWqjsSYvtY44QSVbOVO5gSr
         9nint0fYBZGcGLMoqRIy4120h6YWNmny2T/vHliqC0jjyEI4HyTlsdLN/yTYT3W06h8G
         s+NlFu07GWDSkDsyrTGQvCuV4oYDT0VWSLajul8DRIMPOe/J6xUIMItV1ATsza1el9pA
         WwCLaFSMsj85s/reqoC/XeYniBHF82t4+SIn2ySdr5+GNKI47R5mSr069TPaWEgWhbET
         K6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770933518; x=1771538318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/49beE9xrDbjk2PTkq3bWwQqpKtfvuvBtaf8t9tZ8yg=;
        b=F3uFap9lpS1cJYsUO61fpmuRuhTNKiwipzKN0frSvVePreR1O3GTQ8z3HdjNeI3NFe
         a/pf4U3dXcCABwb53Kk1S2zxCe/ojxVugJzNIanDoi5FvGlRmk8srF9xeyU3GVJ87Z8v
         mNVhcizyfpWykLwIIPXPmrCQE3tlS6Vq0sPpUxYF+p3JAPUaqolHiU5lrhkA/j7UKXp/
         Aw1jx4bMkE/k3xlPWM86Ydh+pWvvWAn5iZo7oNwAXeZX2zFs8sYCaQZklVTZAptPDBEu
         0LvhWARpkRekQGena5CDbvJX4HLvWCSnNoli4SJBqspVOqNTOztR0kDK4j6+yt8Eu/bD
         7cxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+5ShO6UkrjcD2bw0EXOUELDmyoGhkvasQeEYpz0Ew7UgqqUbWJ+UqjzF8jRVh8ELLOQ8vaSXF9SOuRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysrlwulf3b6q+2Ujyuk4fe3rXr4EI6H1f+R2SweTtq3iWRaUnb
	1/aEgYSgfCM2/0qmUgDCHUwqf5QFYq1gYKknwAseS0VA4+ALkVe2Wii74ZH6qjBnbnYxaUctyDU
	7wXZ7Xt/WxIT2wbi4kw==
X-Received: from pjbqx6.prod.google.com ([2002:a17:90b:3e46:b0:354:c41d:dd42])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:544e:b0:356:268e:ff97 with SMTP id 98e67ed59e1d1-356a792ab7fmr512870a91.20.1770933517978;
 Thu, 12 Feb 2026 13:58:37 -0800 (PST)
Date: Thu, 12 Feb 2026 13:58:14 -0800
In-Reply-To: <20260212215814.629709-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260212215814.629709-4-tjmercier@google.com>
Subject: [PATCH v2 3/3] selftests: memcg: Add tests IN_DELETE_SELF and
 IN_IGNORED on memory.events
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Add two new tests that verify inotify events are sent when memcg files
are removed.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 4e1647568c5b..be0e78809494 100644
--- a/tools/testing/selftests/cgroup/test_memcontrol.c
+++ b/tools/testing/selftests/cgroup/test_memcontrol.c
@@ -10,6 +10,7 @@
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <unistd.h>
+#include <sys/inotify.h>
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <arpa/inet.h>
@@ -1625,6 +1626,125 @@ static int test_memcg_oom_group_score_events(const char *root)
 	return ret;
 }
 
+static int read_event(int inotify_fd, int expected_event, int expected_wd)
+{
+	struct inotify_event event;
+	ssize_t len = 0;
+
+	len = read(inotify_fd, &event, sizeof(event));
+	if (len < (ssize_t)sizeof(event))
+		return -1;
+
+	if (event.mask != expected_event || event.wd != expected_wd) {
+		fprintf(stderr,
+			"event does not match expected values: mask %d (expected %d) wd %d (expected %d)\n",
+			event.mask, expected_event, event.wd, expected_wd);
+		return -1;
+	}
+
+	return 0;
+}
+
+static int test_memcg_inotify_delete_file(const char *root)
+{
+	int ret = KSFT_FAIL;
+	char *memcg, *child_memcg;
+	int fd, wd;
+
+	memcg = cg_name(root, "memcg_test_0");
+
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	if (cg_write(memcg, "cgroup.subtree_control", "+memory"))
+		goto cleanup;
+
+	child_memcg = cg_name(memcg, "child");
+	if (!child_memcg)
+		goto cleanup;
+
+	if (cg_create(child_memcg))
+		goto cleanup;
+
+	fd = inotify_init1(0);
+	if (fd == -1)
+		goto cleanup;
+
+	wd = inotify_add_watch(fd, cg_control(child_memcg, "memory.events"), IN_DELETE_SELF);
+	if (wd == -1)
+		goto cleanup;
+
+	cg_write(memcg, "cgroup.subtree_control", "-memory");
+
+	if (read_event(fd, IN_DELETE_SELF, wd))
+		goto cleanup;
+
+	if (read_event(fd, IN_IGNORED, wd))
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	if (fd >= 0)
+		close(fd);
+	if (child_memcg)
+		cg_destroy(child_memcg);
+	free(child_memcg);
+	if (memcg)
+		cg_destroy(memcg);
+	free(memcg);
+
+	return ret;
+}
+
+static int test_memcg_inotify_delete_rmdir(const char *root)
+{
+	int ret = KSFT_FAIL;
+	char *memcg;
+	int fd, wd;
+
+	memcg = cg_name(root, "memcg_test_0");
+
+	if (!memcg)
+		goto cleanup;
+
+	if (cg_create(memcg))
+		goto cleanup;
+
+	fd = inotify_init1(0);
+	if (fd == -1)
+		goto cleanup;
+
+	wd = inotify_add_watch(fd, cg_control(memcg, "memory.events"), IN_DELETE_SELF);
+	if (wd == -1)
+		goto cleanup;
+
+	if (cg_destroy(memcg))
+		goto cleanup;
+	free(memcg);
+	memcg = NULL;
+
+	if (read_event(fd, IN_DELETE_SELF, wd))
+		goto cleanup;
+
+	if (read_event(fd, IN_IGNORED, wd))
+		goto cleanup;
+
+	ret = KSFT_PASS;
+
+cleanup:
+	if (fd >= 0)
+		close(fd);
+	if (memcg)
+		cg_destroy(memcg);
+	free(memcg);
+
+	return ret;
+}
+
 #define T(x) { x, #x }
 struct memcg_test {
 	int (*fn)(const char *root);
@@ -1644,6 +1764,8 @@ struct memcg_test {
 	T(test_memcg_oom_group_leaf_events),
 	T(test_memcg_oom_group_parent_events),
 	T(test_memcg_oom_group_score_events),
+	T(test_memcg_inotify_delete_file),
+	T(test_memcg_inotify_delete_rmdir),
 };
 #undef T
 
-- 
2.53.0.273.g2a3d683680-goog

