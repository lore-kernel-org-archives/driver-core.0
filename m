Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7741F5EA
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 08:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006179; cv=none; b=ClTaN5MHIkUoL0Yk8exK1yEHAEUMyH2TC1aDvPmSlwzyNJDrUcmURU2l8FFeJluhN9NOQZOa0pCoc+yAwUogcum1J1VJSa3PqvNg/Ms9BFdNxNpOT27UqTkhqGpIYMM0EcaTWi8ndeS6992HdUNK1Ebz5wCudEy2Lr7h5em5fPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006179; c=relaxed/simple;
	bh=PSqhwNhgk0w3pRkAn7OksH/I0Bm/DIJZHaLdHbJBmkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=amT69f+42ERaTMW31kfn7G/BcMB6A89W7HYFhpO0uNmppyRAQbcTEk+9ZqqoAYL3YGs2a8f36msfy2KZcaZNda+MrVfJoEm8xZXxJ4QDAT3kn2eMSQLyIOywVe/XWzTrKB2J11yyPt1pnLTcEF+cR2hcP078NiMwCTC2pfWzTZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=X1DAExgI; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="X1DAExgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786006144;
	bh=bfQFI9UE0BG7PqkJJvCr5MnjWC2ExUuD2Mv5wNUydPI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=X1DAExgIgT5nC6kwUlmkDgpRg/RtSnxSfv6xz8iTXwJDOjsG+FriyV0dUaEKJqy7L
	 UXuNTz+dcXrguUoz9nT1blMkWu39lDDCOPG94qp4KKErqgl5v389lwNPCI88i8CopS
	 SRp82i+HO8pWJq5gfXYYyCex1f4BH+8QvZ+23si0=
X-QQ-mid: esmtpgz10t1786006138t64a578e1
X-QQ-Originating-IP: ZumO0C5vAZaw+kCchQzXeTEgVEoSMl6W5wDM4tLlYmc=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Aug 2026 16:48:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16807416105596679994
EX-QQ-RecipientCnt: 13
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	djakov@kernel.org,
	quic_mdtipton@quicinc.com,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH v2 0/3] debugfs: make debugfs_create_str() read-only
Date: Thu,  6 Aug 2026 16:48:51 +0800
Message-Id: <20260806084854.1019789-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MxdW4jxL6NvX5bVhx3wffVYTh7l5twAWtJy2WNXi6Y+2ekQ+evS/iXlP
	B4X3512nCcf6C58LxjejH6OX77iwYwne9i7VTkzMOh8o89gxzPBDlvr255TJFBOYE5gQyjI
	TrdSV8ndSyq6an2A3bxrotPnVU4BY9cGm7A2lJnZMpZzOA7NrGmXcBU/ipsgqNDB6vL+iI8
	dHKB9IFIRwMBQyrTxyynL7gZkQoZKKQnTFIzLyX+6sGoMgUIgAJQQ00/2z40kHfoJ9g/Jfp
	v/0KULxBmOYeyXw020c2cEJBsVQz2xPaEvash4n4bJWdxMVfS+mK+3hux8tLqjXYlbM4Jxk
	ILaZhmeAkCqxHqhwpCy8BopDwctb5gKuGzFD0dpLyc0Uk8jXayNdOCMemTaJnk+hdAtCBCy
	+2Tzs1s+/R8iKdWPXKTXbHiwtVe5/u9maubHmkr/0ziQJ2F/TdQNg7vmpv2Ap9cxnOX8lOh
	XGL3AOFbHqLOTB7UO9m9fKKgrT377dewpzgIiCCjTaJj7/l4MLqnYsFrb99prwCjmJYOy3J
	hDcOpoJ4u6vwcrMrWMC8e2aX1fZ6C1Oc1919RCaWau99XQfc5GlgGD8UC2nLJMkVJ24ZXql
	jmKbtXzeR7qj3hjMjNXI9OgUfgIGJ9i8anyHoU2yIWA9yRxpSYRnrmzoALvZV+DOIyFntAx
	LN0VlWN9mSNGpfa23OGQ6od1aBH/VxAJzEn0rWfVbewVvD7gQYW7OZxcdmsHTqPSWKfEyXk
	CbNq33GqE51aZFgjsV93n25m5pKrNEZhp0o4MB/PlfjqafDwDijR/H/CT6Dc5IEtLwnIxBK
	iwe9g7CTl783LOHBpl2980WIV7R6Yn7lYNdft/IvSMluLke1vnTycWArtpB70P9sPwz5qnU
	haJpWiMPgmD5xTteZrgtg3N7Kink5ZjEuN6qUKPV3/M+nv0n23jdewmM9+YFQf9WTRgXkHy
	Mj66Z2GOw/NZqRxvHrpew9fFbgFkhXltZExC1npkAs0yeZQKwYVp+iX8anaZPgEHy6AMs+I
	HwnXJtoh7fcjOiJZJNp2mgJkq5UIo=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

debugfs_create_str() currently supports writable files through a generic
string replacement helper.  Concurrent writers can race in that helper.

Instead of adding more locking to the generic debugfs string code, convert
the existing writable in-tree users to local file operations first, then make
debugfs_create_str() read-only and refuse modes with write permission bits.

Changes since v1:
- Follow Greg's suggestion to avoid adding locking to the generic
  debugfs_create_str() write path.
- Convert the existing writable in-tree users to local file operations.
- Make debugfs_create_str() read-only and refuse writable modes.
- Split the change into a 3-patch series.

Yichong Chen (3):
  interconnect: debugfs: replace writable string helper
  soundwire: debugfs: replace writable string helper
  debugfs: make debugfs_create_str() read-only

 drivers/interconnect/debugfs-client.c | 75 ++++++++++++++++++++-----
 drivers/soundwire/debugfs.c           | 56 ++++++++++++++++--
 fs/debugfs/file.c                     | 81 ++++-----------------------
 3 files changed, 124 insertions(+), 88 deletions(-)

-- 
2.51.0
