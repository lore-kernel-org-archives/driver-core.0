Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606CD531B1C;
	Wed, 14 Oct 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984696; cv=none; b=WmFD+g1MpXmpm85UhfzMbE4DuO+ICPTdSbVKmuj3OF3jQ7arzuY9Zy7cNJYtu6t0luXZiXipNZ0BwsPUj3flrbPxQqowc7+GGNd1wUIcdfgfd+pqpK35swf6a+2kGabg6k+GnGZsLefz1uSOv5eiIJeUbl+hJlnkmDl/ZCuAo2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984696; c=relaxed/simple;
	bh=iVXDdi+LbaWE4pulO6pirqv1Ke4rUwj4L6ZghTo/N20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fp62UsIYeNiQF0bR6PNZ1BVgRU7drbVGpzhenOa3uOeB5LsSzOHGO4zXP2ahD5bGsFjliKgPavyELt+vmHS9fMY5RJv6+2J+GnkHpQYN+6pgMb3oPQwDRo4eLtxkEC2HlQiEoPbCFalMJ9AXU9fSiqKljjj3Jurgqu7xkoIFTjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uda0z0UG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uda0z0UG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA40D1F00899;
	Wed, 14 Oct 2026 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791984691;
	bh=pdFwGDO0y5LNxHzplUr7H2rcasbgHL5eYyB7H6l6Hhc=;
	h=From:To:Cc:Subject:Date;
	b=Uda0z0UG+irMpty13cruypPuAua5PbmeRoGdDA9W0fGCLWEdcQajL+OVzL+RGQXnH
	 0gkVBZIMTJikogwNmv3EL2rENgMdRIlilMbHBd5XGY807iI6nxUq6LSmagJ+QTo6mQ
	 u8ug357cXXEXlYMj/6L4YKaezkI1rX9L6D+nw/+2VNRugMNzwx+WomHUEJySPW3SK5
	 bh+p5HlsFzeIBRd2cVe7RicBgGxvT9XE78Xp7flVl8mlqx/o3EkRAd0JgJawhvJaOT
	 Id5n/9zrH/rWutiR4RUvfJMHgu/UiCJfYXtvfATG5BBw1UCYfuSp26PghkzntD36d8
	 qEv2g6pgDmSvg==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xGz4q-00000005qCU-2Su0;
	Wed, 14 Oct 2026 15:31:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Mario Peter <mario.peter@leica-geosystems.com>,
	driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] driver core: parent lock fixes
Date: Wed, 14 Oct 2026 15:31:06 +0200
Message-ID: <20261014133109.1392265-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mario Peter reported that USB interfaces may be probed without holding
the parent USB device lock during asynchronous and deferred probe.

This series addresses both cases, while fixing a long-standing
use-after-free issue with the parent lock implementation stemming from
the fact that the driver core does not necessarily hold a reference to
the parent device when taking its lock.

Johan


Changes in v2:
 - fix the parent lock UAF issue (new patch)
 - include my update of Mario's fix as it also depends on the UAF fix [1]


[1] https://lore.kernel.org/all/20261013140408.1226841-1-johan@kernel.org/


Johan Hovold (2):
  driver core: fix parent lock use-after-free on USB disconnect
  driver core: take parent lock on deferred probe

Mario Peter (1):
  driver core: take parent lock in async device attach

 drivers/base/base.h        |  1 +
 drivers/base/bus.c         | 32 +++++++++----
 drivers/base/dd.c          | 92 +++++++++++++++++++++-----------------
 drivers/usb/core/driver.c  |  1 -
 drivers/usb/core/message.c |  1 +
 include/linux/device.h     |  5 +++
 include/linux/device/bus.h |  3 --
 7 files changed, 81 insertions(+), 54 deletions(-)

-- 
2.55.0

