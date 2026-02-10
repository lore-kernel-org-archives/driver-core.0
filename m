Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641BE263F5D
	for <driver-core@lists.linux.dev>; Tue, 10 Feb 2026 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683918; cv=none; b=bW2chhZ5dugY2aYesZ2sd25XMCP/fU9aDQwR218gWe3TgoH6ASTE4zsTwL3kngf1J8yEizvVbapJbqDPTAz8WF57qEe4GD+wv8OJ2ppcD/M4k+UzilRx7S48go+qRaO5QNdF9XvnizAMX0x9vRu+FMxGgma6PkoUNH2O2BoZ+78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683918; c=relaxed/simple;
	bh=1Qt94GB4G3IwGLclm8KcPaUi5sZ/Z6HPS+sk0iKFMzE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vf7fQGqs4C86YS3n5jfATwe0JAZMcSttufWK7K52ICYrxlbnORPIyfnxS3NMKfNTx5WRJZtssKfk61yzrW1jsbDiuSY0F6OOALGGyKOfHyCbvHQgvryMemGON/G3W6GG2WIcDObMl8Qm+A90zCjiU3AT2RSYtHcDKm10fRhSrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MJ9uKY1d; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MJ9uKY1d"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2aad5fec175so5272995ad.2
        for <driver-core@lists.linux.dev>; Mon, 09 Feb 2026 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770683917; x=1771288717; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Pi0e7p+zApj87fVsFVxZlxRDj171oPkvxq1iRYRTY=;
        b=MJ9uKY1dWFTJcaWzS7DtlynGcM4A7tXZmGz/V5bY93zZ3EjlswMuDxLNZlzR+JdjM+
         OXQ+Ce3Dd0Q6r/UJxQc6AcxLPl/ffrrSPtbMZ2YnRFND0Xw27bvsQe9+2lCapobVzTgo
         CIiROf9WxfxE6T/fYYys5yKTiGgsYyWZ6UnsfvlSJQd3AJvMFmQJJh3tXDvkE9C19c+Z
         gKDnQTz+erI7SjGYw+PWQJIYmwbsIH9mF44Q7XNlkf0Eeg09I2J0MJrdnZ3c0mRlfb1u
         9Nyl8C8wAI/ROqfVwKVbonu4cdZ7ABW45d/+QyABUyKceUl652Ajv0xjJ4bRoCb42Xsv
         Ni/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683917; x=1771288717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0Pi0e7p+zApj87fVsFVxZlxRDj171oPkvxq1iRYRTY=;
        b=uc+O4xGSsYum5TjyxRQ/xaQ4vPGAX8ToKIFcflPHhu9yrwMmxyXCXBnxx4c8G5Pp2R
         CTBJ/h+Wc1vGVZVDgT6ZMF1z+Htj6AF9ezXHo+g8jrqP077ZCPDQ7kF/k/FrSuEzq9f8
         VIPboAjkffHUoVrMKlaX+iMa48TdZtjsEkYzNrQ1FMhUKA7DE+wLnBPTwvFX/gVgUzRs
         FDF/aWeAePOCjsOUvphJYeiv37k3yo9kPlCfcFVYocBPGwmbqDhbhbPqV2EFkyemK3St
         DHCDap+YxTv/fAopmMMVjdASZcfL/puuNsFWVl6B6ozuDJ3PVUvPUHw0ph3ATwVB2976
         19fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV3EWeBMaRz77AGILAdOiw+FR0dw7uZ8vNy+zkGPHPxROXrySBWLIOogx+0G8aFvKQ8YanJsz0c32TYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ2Zvf1M6qEnRYV8aRkGGbdksjdhrZc7kzjSbuH5MCggOYsQ/Q
	D6gswv710hQ2fhukbgWRdvN+hioq5nvxkMnRLxDmTmvXt+yUQQl8pgpCeGVkrvIQK8UJBWi5F8o
	vKfQd5fsYuyJndDoxGg==
X-Received: from plzv5.prod.google.com ([2002:a17:902:b7c5:b0:2a8:759b:173d])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e744:b0:2a1:3cd9:a737 with SMTP id d9443c01a7336-2a95194698fmr165463975ad.36.1770683916818;
 Mon, 09 Feb 2026 16:38:36 -0800 (PST)
Date: Mon,  9 Feb 2026 16:38:01 -0800
In-Reply-To: <20260210003801.2834976-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260210003801.2834976-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260210003801.2834976-4-tjmercier@google.com>
Subject: [PATCH 3/3] selftests: memcg: Add tests IN_DELETE_SELF and IN_IGNORED
 on memory.events
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
 .../selftests/cgroup/test_memcontrol.c        | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
index 4e1647568c5b..25a495347f7c 100644
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
@@ -1625,6 +1626,129 @@ static int test_memcg_oom_group_score_events(const char *root)
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
+	struct inotify_event event;
+	ssize_t len = 0;
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
+	struct inotify_event event;
+	ssize_t len = 0;
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
@@ -1644,6 +1768,8 @@ struct memcg_test {
 	T(test_memcg_oom_group_leaf_events),
 	T(test_memcg_oom_group_parent_events),
 	T(test_memcg_oom_group_score_events),
+	T(test_memcg_inotify_delete_file),
+	T(test_memcg_inotify_delete_rmdir),
 };
 #undef T
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog

