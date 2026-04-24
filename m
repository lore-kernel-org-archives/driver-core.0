Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853B24CEEA;
	Fri, 24 Apr 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044735; cv=none; b=q72/AEd+o+rDl5mDcIvi/Mo/Nj3hkTd7HN2nYAtktRmrVOtjs6HVVH22XuSf6u6Z4pRfGiUC6Z6n945X09zLh9TlqH4lxc2RbmWwZ6aE/t3NYH6AiKG+caFivOK5mm3nFoueYPoNMe4b+qUeLKtBw7RA2LIAVJZCMWinTw3ayyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044735; c=relaxed/simple;
	bh=rvwUbkcPtMawg9QdQEyU2QtXZY+eiP5ta/I8JMZupwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qgO8nC4AQkRK0qbNr8LIBJTUiV1Q8Fbf0KaPSiJMldbHdSXchHJwcw6bGIyKbh8sJ8plZwI5QbS11hLuqQkKWGFOia1uQwxJ5d/I64UFHWKx00DStmxnk6WTXzDdYhI5p2hL/uja3DCrOuRjkhOqWXKGu6gkFj7yd5cV7m2ZGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjkU750y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjkU750y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC231C2BCB6;
	Fri, 24 Apr 2026 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777044734;
	bh=rvwUbkcPtMawg9QdQEyU2QtXZY+eiP5ta/I8JMZupwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BjkU750y7LSK0e9P9cl3hEeqv9Tias/qFfxjDJWr1FN8Bpte7sJwCUt3YljzlXLN6
	 5R5gO8NdePZYCDupPpEL6UnTKnRgp66eOdNyihAv/OqgsdPAaojmzu8rxfV0EWwfif
	 z9FeNBaNMWLactaMnJ0r/MxHntaTge4kkNyrg0Ik1UxF5lNvON408WJDclNqteYHix
	 sHUcNDjxcgd3HBAeoKzuSNFI0zKx4VwI3XeFY7DdnD26ptuc6tFt9RAWpr9QTV3LFp
	 k9gTi0x0tJhuuDkNtHIf8e6wpwFYAvpnX65JAfgQZkZ/BXwl/JwdPATDCx3fqY6nOW
	 gHRLxKgbh5opA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGIVo-0000000B6j3-2z7X;
	Fri, 24 Apr 2026 17:32:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 2/2] driver core: faux: clean up init error handling
Date: Fri, 24 Apr 2026 17:31:27 +0200
Message-ID: <20260424153127.2647405-3-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424153127.2647405-1-johan@kernel.org>
References: <20260424153127.2647405-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the faux bus init error handling by naming the labels after
what they do (rather than from where they are jumped to) and separating
the success path more clearly by returning explicit zero.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/base/faux.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index 3d1d1eafb473..a8329f88222e 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -244,20 +244,20 @@ int __init faux_bus_init(void)
 
 	ret = bus_register(&faux_bus_type);
 	if (ret)
-		goto error_bus;
+		goto err_deregister_root;
 
 	ret = driver_register(&faux_driver);
 	if (ret)
-		goto error_driver;
+		goto err_deregister_bus;
 
 	faux_bus_root = root;
 
-	return ret;
+	return 0;
 
-error_driver:
+err_deregister_bus:
 	bus_unregister(&faux_bus_type);
-
-error_bus:
+err_deregister_root:
 	root_device_unregister(root);
+
 	return ret;
 }
-- 
2.53.0

