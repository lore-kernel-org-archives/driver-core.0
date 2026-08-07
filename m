Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369683EDAC1
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.155.80.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096994; cv=none; b=Z7jyYsE21yUTLjQV8hh0jH70G3kwdaWqRrbVXmAXLv39frPWGZGhL6RumT4iJgz3gLs0mIUgaHQUqjZ0xV6jgo4dJsSdlbXLXRNI98T5u5fOzWzXFPNb3hJhwatHLlxAJJ/iKcy2MfoFWkATA6JgcidDb8S2579nuFi/+g83Cnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096994; c=relaxed/simple;
	bh=UkB4BkkOuvbkr7MHYB2oA3HYyctuVjhYqz8iZvkLqDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j0uFdLdioLmOZwUvLsKB93vVQZH+AqRrHclGNOFKGLEVTq3qAI6kMG01oNSfpH0Sf/VbYnAdcoHQgM+bmJRhdf1eilrJsS3m0pGvyBFvI6CF0SfQRSyS/7nJ0M52C5fr6Cw++4NocaepJPur43pCMa8yO4VOAppGWMPm+ovAyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=CzRZ+fZt; arc=none smtp.client-ip=43.155.80.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="CzRZ+fZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786096927;
	bh=xWuuNdzgsihlts9kq25VLkcDTHVhKO0Q6F11EnxG6To=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=CzRZ+fZt/Qarn7B8G9O4VSSSE42rwaClAoSP+e2nU7OiBIrctebo/UszEytJFfgw4
	 ULJDfNTERZ54cqhDYomWVvcOkCdKUl78vmAYKiUXK6f8gj3Y2Aqym9f9axvuu1wVVo
	 DUQTANqipaxFjIvV9KazQCcpkcbL3P0OHOYVcLmg=
X-QQ-mid: zesmtpgz1t1786096921td0398ff9
X-QQ-Originating-IP: 8y3xLzEn+39nDhSP/ySEVFNl/hUDlLvDaTOsHkILQKk=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 18:01:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8339967122186954904
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
Subject: [PATCH v3 0/3] debugfs: make debugfs_create_str() read-only
Date: Fri,  7 Aug 2026 18:00:50 +0800
Message-Id: <20260807100053.1089834-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NU4e3V92LJuQzOywtNWSpBhuqmYnt2u9Viqqmy6EFMgQPfMBhS79qAeK
	xnBP6taDUF2Kp1k02fZ/XH6ZrLzhrrTDUQoV9CwTQgV6M57Oukh/56Ygx2kkq1JgOWOifqF
	9cXjdI17Q+4M2Qj8exdLc8SapOMZA8PP8TFPiMVSENi19+666e6Fj43TcU3uOb+pfiJiWxC
	BlM+IsGqJrztoB4qOm3KET7NrC2Ep+o/2H8G6+CT0RxdvlQ8S53pA40OYIwbOs3ri0nNCwL
	kKwa3u+6zAJ+iBc2AWHxjIMAL2ZnTK5FQUSIXCXaKBYaiMcJbAMXBrRcZ3oHgng/MyLk/O1
	GNd4UPzqPAkKM/Q0CCwFM4W2YsqUVc2E86gWqFc/NtI0MvjdlAIXaTaVscFRMWhB1b+MTjR
	rjZAv0UtrGEuBL6tSc7qGvy/GHnPFagB1uyALWXGGTebdomX0R6YDeEkYBVT9G8cFTnNkhj
	MKd3SWOC4qTjlaLPyb9NtmSK15AQelIS9WsLMOqu3etiiIyIO/YZtzs1ANkjhPZFrfn1ypj
	JcUwJTCtOdIc31o0EgDkmIGNBzyyumTak+U8GzWg0edV3dwwBkmadDOjAHCTHQnhWne+xYb
	/jpgY6yD+QFNkEpZ1teAIfKHl5+hNYKzyvgBPbcGiaGMCaG/cuInhc5c2HzPHDbbwmoYx++
	rziUEKms9u4L0Aj7Sj22z/IiO//Y8TRP4LjGFSmAX/Ea3NM2+rBoHGLh1VM62mKY4YrYh2W
	7p0aC++N+qsYWVNh0VUvSTfa/EdA2P5lVrpYY5z4CJVXuRHWtgrRnWbzAvJbFOl3rhWIv4f
	90Py8qnfBlsgw5mEgDQT3CaEMG0+HrlgeVFAB2pmjKmPJPNTB9HJvjPjVRQD+oGi3YIrt2f
	Q380LfctPFgULqndBUhu+hsoQKgYoFcNAhqcqlL0WISrfEhe3l/L2pirP8JFdYwQeOPK1jc
	dPXMv5SbkItleR+g1hEEXFZi1E6p1DVIIAqKUxpI7yABiW0iy1IzCHaxZZo6sl1MiHl6ron
	W4DpAjT3NvBbZ3lcA9PWhAobiWXqQTgHWcZAHKlRbSTsdsMKEN
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

debugfs_create_str() has a generic write implementation that replaces the
backing string.  Concurrent writers can race and free the same old string
twice.

Instead of adding more locking to the generic helper, convert the existing
writable in-tree users to local file operations and make
debugfs_create_str() read-only.

Changes since v2:
- Use scoped mutex guards in the interconnect and SoundWire conversions.
- Clarify why GFP_KERNEL is safe in the interconnect conversion after the
  RCU read-side critical section is removed.
- Drop the unnecessary firmware_file = NULL assignment in the SoundWire
  exit path.
- Use WARN() instead of WARN_ONCE() so each writable debugfs_create_str()
  caller can be reported.

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

 drivers/interconnect/debugfs-client.c | 81 +++++++++++++++++++++------
 drivers/soundwire/debugfs.c           | 63 ++++++++++++++++++---
 fs/debugfs/file.c                     | 81 ++++-----------------------
 3 files changed, 129 insertions(+), 96 deletions(-)

-- 
2.51.0
