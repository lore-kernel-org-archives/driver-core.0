Received: from mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576F3769F4
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787082433; cv=none; b=eIEhBhi0CwyTarf0NtGuZKbNLb/Kq6iXEzgRotGJv7C7MiDGsGldafCNpZ6Ex7RDxXeUxsliublA0cu0Mr8NsT90jdtin8p/7ZY5jhiyt1P8aam0aSEIzyNe8+NwY21jNEl3fl6yi8gfT/5tyOFfdHlip9u1XNqKRJSyPT4oF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787082433; c=relaxed/simple;
	bh=DMyK+EH6KKYUPMg/kAzqUPYxrKkaCplMqzm1OFq3uMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSwY+PAlylT02hu2D91i5T49/vtg8ACCOFdmyN+gatEn+3rEgHbgpxrOKIiRG58njEiPE7HDazjAnTyXmbs4oOFAy0vq1+MidSlwAtiPrnujJMPy0t2S8ntmqy1L7zGlllwSgHLvrdO1o4Nweznr4CQgbUVoY9qphK0eiEA3mlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hs09iXOb; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hs09iXOb"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=DMyK+EH6KKYUPMg/kAzqUPYxrKkaCplMqzm1OFq3uMo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787082430; v=1; x=1787687230;
 b=hs09iXObaUwmlKGx+DqhTcbtzR8NP7DJz4LUlnTY3X4/LOkEMYHnkESKjOldjGo4fgF4XaFh
 KCKLY8qvibooPclc3pzr6GYuYToxjBY1CLa63czkAU933Ajd4cC/8QFhXDz1tLgJz5s83pC1nhl
 /+Krg1LLtahihrvQz47FIqQI=
X-Envelope-To: driver-core@lists.linux.dev
Received: from savannah.home.local (66.113.51.199)
	by mta12.migadu.com with ESMTPS id e79edd378a23eb3f;
	Tue, 18 Aug 2026 19:46:59 +0000
X-Migadu-Flow: FLOW_OUT
From: Russ Weight <russ.weight@linux.dev>
To: dakr@kernel.org,
	mcgrof@kernel.org
Cc: driver-core@lists.linux.dev,
	Russ Weight <russ.weight@linux.dev>
Subject: [PATCH v1 0/3] Remove Russ Weight from kernel development files
Date: Tue, 18 Aug 2026 13:46:45 -0600
Message-ID: <20260818194648.1014604-1-russ.weight@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Russ Weight is retired and is no longer actively participating in linux
kernel development. Change the contact for the firmware_loader sysfs nodes,
add an entry to CREDITS for the firmware-upload functionality, and remove
his name from the MAINTAINERS file.

Russ Weight (3):
  firmware_loader: Change contact for sysfs nodes
  CREDITS: Add Russ Weight to CREDITS for Firmware Upload
  MAINTAINERS: Remove Russ Weight from Firmware Loader

 CREDITS                                        |  4 ++++
 Documentation/ABI/testing/sysfs-class-firmware | 14 +++++++-------
 MAINTAINERS                                    |  1 -
 3 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.43.0

