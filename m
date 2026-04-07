Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144913B9DBC
	for <driver-core@lists.linux.dev>; Tue,  7 Apr 2026 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775577951; cv=none; b=tnCMgHOpNJ6rzVeTMLcb+oaa6yB1ghsiSLB+vWczU1O/8FLGcgbDK+ydIDVe+Z/7iy6stIyclpVFs7T5zxiyGb89pFO6IHVaE7JxXP2TTceaVL2dvAMomU13cloTNhc5sMFCGtJc0WOiBo/R/kVst/jhlzuhjnafpwEXcnJW5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775577951; c=relaxed/simple;
	bh=6kBHhGOK4020AEojvgEcBZzqws1dMhu3vrb6nYUER7A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACUA4SLKnhp3XXSMM57LAki65JmsUdSOq2BCWWunYl9lMVeCY+WGlY8IG8rTBtBlVi8qz8aRIm/8tRR2rPWXU+d5XfaT1ZuSK7e5W82BkIoWMvPuCYjgNIlJxc5QXJnOkDMj0rAfTEEw8n1KYlyyzxICaoGc2kXNkitQWV2aaBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=MOdQXeAx; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="MOdQXeAx"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fqrdT0srdzlh2hS;
	Tue,  7 Apr 2026 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1775577925; x=1778169926; bh=OzdtxUGl+Xu0Kapkclq7wwh9T4SqcKwnmUz
	jsqh+vfY=; b=MOdQXeAxUFw3BsqDnhiqSjp7T1KkmKK6SbRrYi/ZBfZIfXIdop3
	wSp1kYypRu0S2FqTxiMF4EorYpTGWVlf/dARDd/vZTCIagEBy4TY8enaxYNK4wRH
	dOl876mHWpW5oF47IC/Tna0IRtOClPBcBnBeYJSDVq3/jG22Q/y7EzBDojnscF2l
	Hn3tZVq/KtawsXf0AfiKZ1WoQ6NWFXw73hZqWasRfMLzwSaiypWbztvgefwQO3iu
	oF78hszgmmRST4nAn0R3ibqurNuSok4zBPAqnVRtCnYxjizjz7HBBvLXzGM+i7jk
	ZVypbD6rCbKUoBOMiEzHfANRBYb/goVi/6A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ZuCtzBO1__Te; Tue,  7 Apr 2026 16:05:25 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fqrdF4s4fzlgr46;
	Tue,  7 Apr 2026 16:05:21 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Igor Pylypiv <ipylypiv@google.com>,
	Chung-Kai Mei <chungkai@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] drivers: base: Set mod->async_probe_requested if needed
Date: Tue,  7 Apr 2026 09:05:11 -0700
Message-ID: <20260407160511.56289-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If PROBE_PREFER_ASYNCHRONOUS is set for a device driver, and if loading
other kernel modules depends on probing of that device driver to
complete, e.g. because it is a storage driver, and if
mod->async_probe_requested has not been set, then the
async_synchronize_full() call in do_init_module() introduces a delay.
Fix this by setting mod->async_probe_requested if
PROBE_PREFER_ASYNCHRONOUS has been set. This patch reduces the Pixel 10
boot time by 100 ms.

Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Daniel Gomez <da.gomez@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Aaron Tomlin <atomlin@atomlin.com>
Cc: Igor Pylypiv <ipylypiv@google.com>
Cc: Chung-Kai Mei <chungkai@google.com>
Cc: stable@vger.kernel.org
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/base/module.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 218aaa096455..e58fc189d389 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -39,6 +39,9 @@ int module_add_driver(struct module *mod, const struct =
device_driver *drv)
 	if (!drv)
 		return 0;
=20
+	if (mod && drv->probe_type =3D=3D PROBE_PREFER_ASYNCHRONOUS)
+		mod->async_probe_requested =3D true;
+
 	if (mod)
 		mk =3D &mod->mkobj;
 	else if (drv->mod_name) {
