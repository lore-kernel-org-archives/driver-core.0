Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFAF286425;
	Mon, 28 Sep 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581544; cv=none; b=WyfxZe6429+NAidJdHRAkprunPNcyW+kKFf8NJdv7EdM86WAEhgSjYbrhPnnn4c6NOuF15IwfiGLoYUWTEHoiEDhM5L04phWWfnRPl3cAU96dTKwdSQh5vfIebKScIeqzlWONIT/PF3v/t7Zv0VwYbr7LDQVRcqxaVOLix/0DXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581544; c=relaxed/simple;
	bh=OQNTrWDpDLgTL3zZYw+yvcv3I9NSIZFPqaLFiaEPzsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZhrYt9ywm/yBtaxlxHS/fk2g0k8v6Fx3aUE54cqO8h1blB/H1blFFgrs/tR4mYv5F5OtE6lIQfQ8SBd8OFjdVMr1cwUSb9b2jfkeGyD6Ea+dwLQHpCD7EhNm7G+407jmXKRJYqdPkNlQ43pxtkjCXpoPCF3jfgDnQHFV4kp+5Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jopfbmtc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jopfbmtc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4249E1F000FF;
	Mon, 28 Sep 2026 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790581543;
	bh=Q+SYugRhT+dmbNyAMWbVSIFwi3WvwbxvWZejMAHjnuI=;
	h=From:To:Cc:Subject:Date;
	b=JopfbmtcHnSnYYoy3DW8gXvf2hqYhhFVhcDcukU1EkE3gbVoS/Gn/u2b1/0KfxGzA
	 KbRXGKFwM3btD7cHAItza/LF+gHaF3FiVwXVtP9+i59RjDvUsSABXeDr5pWFHrPx1K
	 ZhiBs3sThYKoCYpOFQPWgBUXT/BydBgu2IgoUpBMKabdxcTcIipH2WK2rwJk4VPz4X
	 B73L3iuHri9kCxXJUIJabxxF0ICkH0Lo0WHjhsNvTDrqWy6L5tet7gxeJfODqwauMV
	 OCsV9pg+oQYmSDfFV21lw1EktWYBXSRpGIM1tQpvf5uxS/g0Q+LPe0FYotiRyAxcjc
	 132zy586vXTvA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xB63Q-00000003a6X-3Yef;
	Mon, 28 Sep 2026 09:45:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] MAINTAINERS: add myself as driver core maintainer
Date: Mon, 28 Sep 2026 09:43:29 +0200
Message-ID: <20260928074329.853637-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I will be helping out with maintaining driver core.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..2a39b302f77a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7957,6 +7957,7 @@ DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 M:	Danilo Krummrich <dakr@kernel.org>
+M:	Johan Hovold <johan@kernel.org>
 L:	driver-core@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
-- 
2.55.0

