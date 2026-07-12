Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DC3AE1BC
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783864611; cv=none; b=baiROV5AauEbHppT36nbqd7ERWd078DEuLetlKgPjCFI+2mF7wTyzRhXT2l6zO9j9fyaYMenuPl679H1ZTCMBbEShda+I5evA65NElMdDjGCrmoAOhxDbKgW0HCooQE8IoLgeiwXXl5VkJ4FrngvR6KR3rppXN+Z9Yi/rA7hVyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783864611; c=relaxed/simple;
	bh=lWqFer+ezL4yGoS8CAC+vZsRIvt8a9gUUxzTD2B2/P0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=T1NvnMwBIR9+B8FWDPEe2jVGCIcOVSIAamLZAnGsUHSYDpcTVDfUXjtsTlmtbt5F982/rRHrB5E7yuNcVQ/4QcNhIXBV3de7PlQdZK/5IC7suk0ef19l/UVov7OYc4Pn6uvvOo2dsUTSWYBA2bp/vEvM7IySSGvTG/mwS1hB2lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=h5BeW8fi; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="h5BeW8fi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783864573; x=1784469373; i=markus.elfring@web.de;
	bh=4OWfFxi/5gajJeHLHLArP8k2NHzKPGSTY+ry5mqrEHw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=h5BeW8fiNo/jw3jhs5ITIe7OzFUCZ9fKIunZhsanum96xxFdpQ0EP0wuvzQFYI3t
	 Weudv1LJ6d4HY+Gr8dK/+Svzzi/Zu7q2JofrGPz1rIwIgnSp5TiTk/dms4xikiIwE
	 vBhwfx8F4q4nIWq5HfTLJuEaYdEsfS2OQ3ECaL3IYPLKlOmeaKxjDlMNyRkGdUhBT
	 5zR9XhXe8DnUg+Yv13CpSkXfvGLXu75/r2MmFuAe//CnPbfe5+oBuU4iNOpA4PVBA
	 vuW92oJ9sza57/AkH2hsjU2ScV3ewTt42nHN3S8CSRJ5iSMdoqHNFZ/mBDVgBt49h
	 tKzeDa1iXTOgtFN8dw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4vNQ-1xAN691YtI-00rLR9; Sun, 12
 Jul 2026 15:56:13 +0200
Message-ID: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>
Date: Sun, 12 Jul 2026 15:56:09 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: driver-core@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <jic23@kernel.org>, Lyude Paul <lyude@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Zijun Hu <quic_zijuhu@quicinc.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] driver core: faux: Move a variable assignment behind a
 condition check in faux_device_destroy()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nAcCHU5KR634wKcdEzIqDQNe6baZx5BV8dBaZ2TweXAQ+tzfj8C
 gB4nOm5b2iOZ0ScdgE8/7xF3t4u6O7YPv8cAwQIkJWDxwED5so6pzSNfcLEtz0yEayfIctN
 Ub47TUDnTF32v/sHcwyed1LNM+pTds2yXyNWyxMjbzsDUMqZuxQHbfLsy9brfwnWZIbyyWl
 5oHCVnphS5TfvYLpi7h7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ese2CKQ3EHc=;TIoXLDLp/mj6PmQrC8lvY2/x/tQ
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 12 Jul 2026 15:45:19 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cfaux_device_destroy=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cdev=E2=80=9D behind a condition check.

This issue was detected by using the Coccinelle software.

Fixes: 35fa2d88ca9481e5caf533d58b99ca259c63b2fe ("driver core: add a faux =
bus for use when a simple device/bus is needed")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/base/faux.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index a8329f88222e..4eb22d082552 100644
=2D-- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -221,11 +221,12 @@ EXPORT_SYMBOL_GPL(faux_device_create);
  */
 void faux_device_destroy(struct faux_device *faux_dev)
 {
-	struct device *dev =3D &faux_dev->dev;
+	struct device *dev;
=20
 	if (!faux_dev)
 		return;
=20
+	dev =3D &faux_dev->dev;
 	device_del(dev);
=20
 	/* The final put_device() will clean up the memory we allocated for this=
 device. */
=2D-=20
2.55.0

