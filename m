Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD83CF20A;
	Thu, 23 Jul 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842887; cv=none; b=l+AV4/H0ykD+kUYi8brXvJ/xG/85g/RIS2DSI62Zgtz4ZgoRZIEVNFlgpyLeZULbUX8vo2XXwFDe0gIOxWFcrgTRgwReo6aLU+g7vkMQo8IPDlfn7yHoGRw5XPIQu7bhhau++v2LEiV8fZLA8u4KeGcuZbS6pbpJX9gs629EIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842887; c=relaxed/simple;
	bh=P1tY39dyn/DQRJzndxq+XUPRF22ww+jWFrPgH3hOqRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDNgz8ZCXS1MzLVRlmw5p3XAmzhdhzNuJF3NqdzuSvv3bRhCi3Q+t4OasEKCwPsEhfLPW1XQM2IRw2ITQPB0vfjLBLMiPVbZavxDKGM70qA8I7UBf7PqGYp7eL7t/GCX+u+A27RhyCjkLLfFFK6d1jXaJvdtKo2P8IeXQaQC6lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=adLAiRxb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="adLAiRxb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=sX2oIcNP5BG++ZPllpgvFglv3CiQyIdWWV9GcdkWAes=; b=adLAiRxb7Qj9iv9ijSZMpCDuBC
	XAVfahnZkDDMhluMjQU1xCE3gUrN7yWGyuAtvBPZ76vqDx5/mPxuBaSb5QiagCUiqrbP2zOwhnyM9
	cV6L4/60Li+omYo01lsVLm63ebuEzoY/tJj0Eh3doBtSBHP+IkOh87wr85sKA/YtTOZh+ja31txQS
	fc+evgA7Fg/Y1bTSlJ9gXbkxDpuCKSyNonfTAEKVEaFEjUC378X+VDIhxHsjDWar7QXeMlHPqcj1T
	jmKzg4dwEv5fZdCp/ZURU1FnsI1HQ5JzFkbM+FT3j95wwJ3G/tHeiqDNXWmA9O7M8Y+kpQOrutcqv
	+DfEVNig==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1AN-0000000F8Ld-3PlR;
	Thu, 23 Jul 2026 21:41:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev
Subject: [PATCH] base: soc: fixup sys_soc.h kernel-doc warnings
Date: Thu, 23 Jul 2026 14:41:18 -0700
Message-ID: <20260723214118.652616-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- add function return values in 2 places
- use the correct function parameter name in kernel-doc comments

to avoid these kernel-doc warnings:

Warning: include/linux/sys_soc.h:25 No description found for return value of 'soc_device_register'
Warning: include/linux/sys_soc.h:37 No description found for return value of 'soc_device_to_device'
Warning: include/linux/sys_soc.h:31 function parameter 'soc_dev' not described in 'soc_device_unregister'
Warning: include/linux/sys_soc.h:31 Excess function parameter 'dev' description in 'soc_device_unregister'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev

 include/linux/sys_soc.h |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--- linux-next-20260722.orig/include/linux/sys_soc.h
+++ linux-next-20260722/include/linux/sys_soc.h
@@ -21,19 +21,26 @@ struct soc_device_attribute {
 /**
  * soc_device_register - register SoC as a device
  * @soc_plat_dev_attr: Attributes passed from platform to be attributed to a SoC
+ *
+ * Returns:
+ * - %NULL if the SoC bus is not yet registered;
+ * - on success, the newly allocated &struct soc_device pointer;
+ * - on failure, a negative error code as an ERR_PTR().
  */
 struct soc_device *soc_device_register(
 	struct soc_device_attribute *soc_plat_dev_attr);
 
 /**
  * soc_device_unregister - unregister SoC device
- * @dev: SoC device to be unregistered
+ * @soc_dev: SoC device to be unregistered
  */
 void soc_device_unregister(struct soc_device *soc_dev);
 
 /**
  * soc_device_to_device - helper function to fetch struct device
  * @soc: Previously registered SoC device container
+ *
+ * Returns: &struct device pointer for this @soc
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
