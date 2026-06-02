Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE7374198;
	Tue,  2 Jun 2026 03:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372602; cv=none; b=J7wW7E1m68RbmFG1LhMGs6hSBq8nkXIl4xeKdZ6H+M6FJOTLzI/daI/S5nGgHakceDVZd2qMI3jGQw/lBGaGPAiRGWswfHHQp2bqAjPGLBJQPWrfTzudfYdQfI24ClgteJgsto+zW28mKo3xZZbaPMl7j02TO0xOgL4YRvhi5S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372602; c=relaxed/simple;
	bh=WyjqYCfvpf0jmio2T0eYOCk5mvppWnCbouGj3/chLho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ARxHEGlgF3nMiGRM3qcb/nObvBgXijJz0NECY7LOGzeEnh5umL3FOESAVwKWAFzusPcuScuQv3LbgGikGbbPNRjKum5Bgc7aSve2hj9chOe4nua/jbda8GEyn/HFbtkQsexcsiD5QSMMqHLGT3b94HtYWxcSNk2YgmLBuOr13YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+a5Webs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+a5Webs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB381F00893;
	Tue,  2 Jun 2026 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780372597;
	bh=RjL0XQL194oefPwzgyeRy5zX8P9jxibQ+BU3bBn0aVw=;
	h=From:Date:Subject:To:Cc;
	b=M+a5Websx8N6+tgLgjIOSZBAIHll6vFeyLPkywVEi/RYbIkT93Z9QiRTw8FzMiZQG
	 Yboo3EnbxenetcoF8ARCSbZiSE9HgeMGmK3jlGdTas0WOJwT1MsCB3v91l9wjn9ha7
	 wQRUqT3XufdcN5gXeQ+hMLi4zxSLm/P6s2NiMaF1uD4acqmX6rakRZnrIRv7/yIlKg
	 GDgk/LtCoTUiCg2LqPVtFBkb+fvVL/ZG72sEQWAMWbpI1ydo3UYqSBrA5q3KgNz15P
	 cN3Z/GR/mwhyyaIdn4zcFOqtfKyYJqFNwJW+HcKBJ/gmfVaZcNKbSlnZI5l+gGX+8R
	 SS1BSGf+xOrdA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 01 Jun 2026 20:56:31 -0700
Subject: [PATCH] driver core: Use system_percpu_wq instead of system_wq
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNWwrCQAyF4a2UPBuYDnVAtyIibSatEZxq0otSu
 nen9fGDw38WMFZhg3OxgPIkJn3KKA8F0L1OHaPEbPDOBxdciVFlYkXqlbGVD9rXBn7e5jfOtSZ
 JHTo6xqZqqxMFD7nzUs7D/eNy/dvG5sE0bGFY1x/AvkuchQAAAA==
X-Change-ID: 20260601-driver-core-fix-system_wq-warning-0c5db4f49c62
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Zhang Yuwei <zhangyuwei20@huawei.com>, 
 Marco Crivellari <marco.crivellari@suse.com>, Tejun Heo <tj@kernel.org>, 
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=nathan@kernel.org;
 h=from:subject:message-id; bh=WyjqYCfvpf0jmio2T0eYOCk5mvppWnCbouGj3/chLho=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlyIcWflacGiFaVbNiu+7NbITR6vmVdnbrLQ84fxVcWL
 PtasZSvo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkRzfD/8jG9hAZrpCHRjJ/
 onfNyPJqvumTvyde9w3jn41NcswdrxgZziy8Zy1fWvxnlsHsNtELU09yS+37uExavcDjnpEG/77
 3TAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
deferred probe work") added a use of system_wq, which is deprecated in
favor of system_percpu_wq added by commit 128ea9f6ccfb ("workqueue: Add
system_percpu_wq and system_dfl_wq"). An upcoming warning in the
workqueue tree flags this with:

  workqueue: work func deferred_probe_timeout_work_func enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Switch to system_percpu_wq to clear up the warning.

Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
This should go via the driver-core tree since the Fixes commit is only
in that tree currently. The warning is only visible in -next when the
driver-core tree and workqueue tree are merged together.
---
 drivers/base/dd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index a8ca2092905e..60c005223844 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -324,7 +324,7 @@ void deferred_probe_extend_timeout(void)
 	 * start a new one.
 	 */
 	if (delayed_work_pending(&deferred_probe_timeout_work) &&
-	    mod_delayed_work(system_wq, &deferred_probe_timeout_work,
+	    mod_delayed_work(system_percpu_wq, &deferred_probe_timeout_work,
 			     secs_to_jiffies(driver_deferred_probe_timeout)))
 		pr_debug("Extended deferred probe timeout by %d secs\n",
 					driver_deferred_probe_timeout);

---
base-commit: 46def663dd34da36464ba059f7cfeacf29d98e5e
change-id: 20260601-driver-core-fix-system_wq-warning-0c5db4f49c62

Best regards,
--  
Cheers,
Nathan

