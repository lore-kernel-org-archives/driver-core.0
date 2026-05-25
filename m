Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843A234973;
	Mon, 25 May 2026 01:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779672229; cv=none; b=uqjoeWCe539hEP4HyxoYHS1LWGu//iEopUndd9O5s3Q7x9r4fQWi6jXxDVGiijZwOGxPiFNabzFIkzzomY/cekBw8h9HHKyYyFmZ2cPzWKnGSOERLITTCa3o9q2XMVrTl6pdRA+kXgGBckgjeE/4mhhZts3DUKPyxkxpCKZrL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779672229; c=relaxed/simple;
	bh=Dmljjn3DQAo4E++913DUxGITlIB2KlM4L8Z9UVDHhdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/e1ptfv8zvxaVahCkPddRU7p7UNXPdKZGLMiQoUqU8wI0WpoaTeNka4o29xjPbhgSxEj0iGqUmyiCnsVkRRgmwAqBshFHbHx0+7d/FJSsLQHgw9LLUWkG5ZOom2fiFyAvwQx9HiNhpyOiRymvpjE19oalgg6yw5DWlNRst95RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRES9O8c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRES9O8c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5761F00A3A;
	Mon, 25 May 2026 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779672227;
	bh=f7Sbcn9EF8w0SvIqk9/zOpyVUxohnVxEMBhJO1S1kgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PRES9O8ce1uKgcIKiFq84ZrunPQjE7PlnfRyBNvwGyY1jwYpdNv6bcAR/yRvJV6o0
	 MglkpSHTZxAkoKHa9FiwHnQzu+Adm6y3ZzzYbtNCjihooxnTa9pFesSnSV0J+Fqywc
	 /P+unamZRHYvheEIAzAQMhjXlAeEe0Y5sVKFrYJrHmrm8pBa8L5Ew/YIyQXcg8HPo5
	 ilJrJEtZ8CoN87oZ1mZlI1L+RrkyYWhxGU1gNUYiv5ADjz8iNWaM4BH064hYunG6r7
	 qboDEx+OXkeqMyrLtAImkT86AoE8XO3yZdEXgyK6jtc9o7PLpNDS2BImsb1ouStfPf
	 Vw9JsUgaFfx1A==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] driver core: Guard deferred probe timeout extension with delayed_work_pending()
Date: Mon, 25 May 2026 03:23:22 +0200
Message-ID: <20260525012340.3860581-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525012340.3860581-1-dakr@kernel.org>
References: <20260525012340.3860581-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mod_delayed_work() unconditionally queues the work even when it wasn't
previously pending, which can fire the timeout prematurely or restart it
after it already fired. Add a delayed_work_pending() guard to restore
the originally intended semantics.

Premature firing calls fw_devlink_drivers_done() before all built-in
drivers have registered, causing fw_devlink to prematurely relax device
links for suppliers whose drivers haven't loaded yet.

Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index bebb43acc132..905269ecef9b 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -323,7 +323,8 @@ void deferred_probe_extend_timeout(void)
 	 * If the work hasn't been queued yet or if the work expired, don't
 	 * start a new one.
 	 */
-	if (mod_delayed_work(system_wq, &deferred_probe_timeout_work,
+	if (delayed_work_pending(&deferred_probe_timeout_work) &&
+	    mod_delayed_work(system_wq, &deferred_probe_timeout_work,
 			     secs_to_jiffies(driver_deferred_probe_timeout)))
 		pr_debug("Extended deferred probe timeout by %d secs\n",
 					driver_deferred_probe_timeout);
-- 
2.54.0

