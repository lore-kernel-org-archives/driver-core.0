Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A133F399
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276043; cv=none; b=s6GIxn1tYyOSuryKCPAHfm1R9hv8SLeEtMoxZCfcM8GdyoZiFCJCg3Pyft7HLbVVFG9Ba/VaCcm3QJdmd3dYEsv/yQ3CZ3YWrY3VVQVbKUAyj+t/94x23BkTbTN8DaLeY9sb13mEmzj15Ac7N+tGJ1pptYuh865l0OhASr2e1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276043; c=relaxed/simple;
	bh=46Rvufl9GY3RiQAPlUFJ/v0FMMZD9jseFAtVDvEWju8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=thqnbe2Kh1O+z9MYeVm2Hcs5MnRua9SPmCMyv7byc6uFRAtn+cj0QB3Nl6yRhqy3Fq+Ju9uN+KsLeqGSmvvRmOceeI/RZr0qQINWYL2K7VYV5vmQ/jTszmptTxckWxOVD8V9h62PfDaBVzk5lNygKcCFArlH7YarSKBg0hm0rYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fwTa99fY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mxxxnLbF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fwTa99fY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mxxxnLbF"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gcMwR2MSwz9v6D;
	Fri, 12 Jun 2026 16:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781276039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TGLTuPu76BAtm9AnkK8ldXbO8QQWBHMItTZiCzzFuNM=;
	b=fwTa99fYprlB1XjBfCOn2pi4AMMz9WwNZmN/E+Th4xMmFE1KUaqLSa5eN5+sI3mrUiv825
	BIDoVPtxS+vUddGWqOB7YrDbctb2nVD0rrTq73wzfvxYf/VvIDJPer6nkayL2TMsNDkgC6
	wrgPptdnNxeIlpMU9RmyQ8tT+9hMaHDofmaEZi/T31PBQWvIuPz+9obMqisnI+gnHc9zVA
	vQJQ3IhEaiKFH49AnoMS1Akf5M9IzZD8Ws/0O5KRn/wFryO0SR3gIjTflVKh9zUHEcLUVP
	pEF1dfH20/30n8AaOnq834cOE4PPBDpvNcp0yWyvs+EH+sLWkNGEc89iDMWtiQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mxxxnLbF;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781276038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TGLTuPu76BAtm9AnkK8ldXbO8QQWBHMItTZiCzzFuNM=;
	b=mxxxnLbFLpKwMIeYd7EJnaTWkW7Mkxw7vRcmw69P3zjF9G/q/xMHzPN4ZL/HKNVC3xkDZk
	xKpLtlCKxkJLDRGFsNSSQH6eo1Di3xDG7xNAeVqcv1QhqKYXIc8WgVARqdDkhwXnE7+Ta/
	YHIBHw34D8SP9XjL+0SKhTYcbVwLrxirP0Mls2prlqFUwSbOvd1zAFH8PX1y6YOzgg3rJn
	wWOeXqG2aqK2Tg4095sZ0q5ia7YfgDuUjBvTvpE+0heag4RE6uLFrAjidBL7BYGyD7o1FC
	KDKYOKEzc15zpDZIxqn+Kq37kB4/iBJS4z4yoASdPW4IQBSAtOVxjC8/44XW/A==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] docs: ABI: sysfs-uevent: add missing bracket
Date: Fri, 12 Jun 2026 16:53:32 +0200
Message-ID: <20260612145331.189632-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5oqh14w1m3mppgz5ahtme5wep6ngjgq9
X-MBO-RS-ID: f1736485ba7a7c0dc42
X-Rspamd-Queue-Id: 4gcMwR2MSwz9v6D

Add ']' to complete the command.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/ABI/testing/sysfs-uevent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
index 0b6227706b35..c15e18c47a0e 100644
--- a/Documentation/ABI/testing/sysfs-uevent
+++ b/Documentation/ABI/testing/sysfs-uevent
@@ -8,7 +8,7 @@ Description:
 
                 Recognized extended format is::
 
-			ACTION [UUID [KEY=VALUE ...]
+			ACTION [UUID [KEY=VALUE ...]]
 
                 The ACTION is compulsory - it is the name of the uevent
                 action (``add``, ``change``, ``remove``). There is no change
-- 
2.54.0

