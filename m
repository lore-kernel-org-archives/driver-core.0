Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3036073D;
	Mon,  2 Feb 2026 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076344; cv=none; b=bWjFXgJ7HIKvTIjJdSCB93NUHxNguioRuag1IL5V6LnfbIZmwh4mtkVaHmZ5jXCQH+xcIHhAkFCba+3qmUhMNo4jakJuTNvjFJshfg1pxrQXSlXi0RwXmRhd7ipcHknqpe5rcKmAUZtaEg6mULZo0+Ux80k0ct1IcAqgWgz6pVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076344; c=relaxed/simple;
	bh=3qAGt3di1e2bar6yPpvHKQ//pI4RJnwYRhbAoAEPvLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpR0LvKW/4WRkiEJzbjl8VnEYD4B8gI5sXxZgQnX+smI8DFliVQPGt9PFW86xh5fqCVOuwavvMkDa4ERzAlzYZTXPEs6496W2hqT4PoY74ZdouqqE/LzZuV1mbzdaKFgn0wG+GET0kMlf/BC4Lh9gyc5L5nyzdb3ezK0ALLtVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANWhiFDT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANWhiFDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2059C19421;
	Mon,  2 Feb 2026 23:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076344;
	bh=3qAGt3di1e2bar6yPpvHKQ//pI4RJnwYRhbAoAEPvLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANWhiFDTRIqJPpKzeY8GY55GldisGXoAsdDO5RY2shMkDjtw96jQS30KRhnw7OjY9
	 yG+Ch7/9sEEvD0oWdRPOmhncM3O/ehQ1I9pXFNsHI0oAllzyZsOu55AxewNgUQOrfe
	 cffHgCokq7gc232nZI08JEVkghvUGPQiD6Uu0RMGhtPtGZV21JGxqxyYVRb/OUttwW
	 5Wh51TpHbhkI+hB1LrA64ne7dkbvMtkXLzwW+wt68U4dq99Ip6KdTqirG8qJe31pYH
	 el9EeJ2W5MZfNAbe38iPU8ELOGglvXWqnbBKrA5o8NHrPJLNGky8WcNIWSBVF2Sysv
	 51CeuHlk6qOYw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/7] devres: fix missing node debug info in devm_krealloc()
Date: Tue,  3 Feb 2026 00:48:14 +0100
Message-ID: <20260202235210.55176-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202235210.55176-1-dakr@kernel.org>
References: <20260202235210.55176-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing call to set_node_dbginfo() for new devres nodes created by
devm_krealloc().

Fixes: f82485722e5d ("devres: provide devm_krealloc()")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index f54db6d138ab..1a972f47916e 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -940,6 +940,8 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 	if (!new_dr)
 		return NULL;
 
+	set_node_dbginfo(&new_dr->node, "devm_krealloc_release", new_size);
+
 	/*
 	 * The spinlock protects the linked list against concurrent
 	 * modifications but not the resource itself.
-- 
2.52.0

