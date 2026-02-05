Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2F21E5702;
	Thu,  5 Feb 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770296988; cv=none; b=Locm0mfoj7t+VmEHuHr9CxRyS9g6xGsbmG391uj37iu5mlpCGWIUfL4D1Vd3Nl3I7r0EOS8oe9CzfMtK4uPZNUut2RjRKVLAQd1qWBtlQ/fNtbMTw4rA9RbB6sck+GozAZKQEUt79GTlZhPD8B2ANJh7cPWPhm0lTr/uu67XE0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770296988; c=relaxed/simple;
	bh=HYEh77tSm9JWawCemACkqZXverynzhUlEzG2qQrBEUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWyi8Dv9ZnBbW17jLVM7anniwjkX0SzUntP88kXlxBaDLw0KcmOk8rfQAk33Z7azDUaHroMofP+5Q/2zNGU35vZUFbDa3kcfRt4mYf/GstLUvK0COUIhdh8q2UhMNOh0TyGi1sINu9kiSCNBZOiRJCvXZiNBpCftrZOif3v3gcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j10H3K2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j10H3K2l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396B7C4CEF7;
	Thu,  5 Feb 2026 13:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770296987;
	bh=HYEh77tSm9JWawCemACkqZXverynzhUlEzG2qQrBEUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j10H3K2lblwQhf1DmoJEn+fYSa0vYhqFTkjZzYQk+f4ChwEmBgoXknNyqCT1mNUJi
	 AiBWBxv1qarFx+kQNxTP1P69M1LzO6oIROSHpXz00CsLTDYgHiri3fdVNsvNLaMT6G
	 NSn5+BtVOqfAkvsbx4lnOBZJJ5a4NfZMe+/WKWzI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] driver core: remove device_change_owner() export
Date: Thu,  5 Feb 2026 14:09:43 +0100
Message-ID: <2026020543-molar-childcare-af20@gregkh>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026020541-energize-graduate-981a@gregkh>
References: <2026020541-energize-graduate-981a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=HYEh77tSm9JWawCemACkqZXverynzhUlEzG2qQrBEUI=; b=owGbwMvMwCRo6H6F97bub03G02pJDJkt06YfeJJTzzc96ld8+EvxplCZuLjfHJtLz4iUr/rF0 qnKwzy/I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZy3ohhnsLSK1OeRTC67Y7J CZ39z9TmeMGtJoYFBy5FqZfpTLUXnnNx4jWVqwGR3RpxAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The function, device_change_owner() is exported for modules to use,
but there are no in-kernel users of it, so remove the export to prevent
out-of-tree code from thinking this is a safe function to call.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 40de2f51a1b1..f599a1384eec 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4781,7 +4781,6 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 	put_device(dev);
 	return error;
 }
-EXPORT_SYMBOL_GPL(device_change_owner);
 
 /**
  * device_shutdown - call ->shutdown() on each device to shutdown.
-- 
2.53.0

