Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB4249E5;
	Mon, 25 May 2026 01:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779672226; cv=none; b=HWV9SNS8ZgQhWW5+o8T4FsIdy0KNUTxXW/gQsy6PvLqZMu99zSmexS7iBcCZL9hHRsgSyplSVM+bu/CDaKvw1YgdC4moLIyQ/vfJPnaMjqGj4kLgB4oN3VOaQ1+plT0ufa73cvrUZ5weyQcDPkcejY2gz0oeBKsJgKKOlJ9aW/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779672226; c=relaxed/simple;
	bh=oPP6dXpeU5aQsNk3qWk9R0YLkcgNqN8aL06T17i2Fss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kr4A84ZCUHWhokcbhhc1yg/0oGhUlDdf2HTPfNpQFneAGHS4jgfPd6y8nKfw264otFrrjU6HRBe5ug9zYtE7izYENh89rZcFNF1Abf0MfCTZDuUwxiDOzvp8kEfHtCMDKj8TRxUUUOY+loFx8luo/vbbqovY4d2b/Uq0NxAbQss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksZdlWMk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksZdlWMk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A701F000E9;
	Mon, 25 May 2026 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779672225;
	bh=1lR7/ekB9smg1aPjA7XsuO1TorpgaZx9Q0vWtvq+REg=;
	h=From:To:Cc:Subject:Date;
	b=ksZdlWMkz+t27M9ieeMm9OBTQRyCLLqD5VL5TM+XZrw/Vct7sWVaUa/4m+y97N9jk
	 0N14xZNKHKcq9IK8LU81zz3calwmNEhQyz75l5BksrPopslPG42vsr4x9WpUxIIEw6
	 iLTmSKEDIyQgr2WEcxI7P+ftke72hyykjmeWzYRMhe7pMDzXzF46+brbQ5qyB9rdZT
	 0htwHzhXXv8coSuw1Vo4wWCwDiVj78zaUahjRa9/Nquj+inaBOHplsjCVU6xOkoD7n
	 eYMgUc8A2VYrhrpCR2SVQQvbCXPUi6JdIE5Xw6TrYDZ7aS8syi2AWFbZ3n2CBZoaey
	 p5CQ6F7B5Ynkw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()
Date: Mon, 25 May 2026 03:23:21 +0200
Message-ID: <20260525012340.3860581-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mod_delayed_work() takes jiffies, not seconds. Thus, restore the dropped
conversion.

While at it, fix incorrect indentation.

Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/dd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 172a02a438a2..bebb43acc132 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -324,7 +324,7 @@ void deferred_probe_extend_timeout(void)
 	 * start a new one.
 	 */
 	if (mod_delayed_work(system_wq, &deferred_probe_timeout_work,
-						 driver_deferred_probe_timeout))
+			     secs_to_jiffies(driver_deferred_probe_timeout)))
 		pr_debug("Extended deferred probe timeout by %d secs\n",
 					driver_deferred_probe_timeout);
 }

base-commit: 56785dcb2ef6d3cff82ac33f2e34db94377416a3
-- 
2.54.0

