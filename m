Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829659;
	b=RjIp0cdon7AsvDahvXshZ3X7nPy1r5gyFuP2YomCFviOa6dh0Zx9OefCeOubOKCSjlEW
	 Y9oU65RsJIzOY4wyWFFFNERs7q1e3rfoDlVF8xef2kFssYGYcH0tL9hpBEWehUrfsskij
	 8R3KEhC+xVNw74F6pZuKtfFPQcRqo5XQMrd1mt4MdPZ5ZzQ1oSkYNfWu6APpUNpLHHHt4
	 tME399R3w5Xmt+w4K0aqNhJTaGjegSvcEd3FVBD+wYTxfan4yG/qYL6dxl/OgKxOlu4NR
	 wrdktXYeTxsztKQPJWkC7+ak3p24ZOUglo/89Eg8UlMSwHTn59izBS3JaSx+CmLd1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829659;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Eg+9+oeU9+jU9RyDJcEVZIb1X8FilkqhAFwEKY4Lpi8=;
	b=12Zu6ZP+ToIR5lILb2M37kUsku+j9ZKcW4hkz9Vb3j71pGLMl+DPiKjIHXK+hTJHEhmy
	 SV2FjYA7druVug1VnBTc0ZEubzOVVRtHg0YmkCFc8jLcJFFeMT6ARd7KNFB/N+/WQoTOw
	 SWZ78l6PQWySSwmTHsRFRF1OFua/KxKvo/0LloLl+ys4u9TY+jS5OSG0wofBpTD6XnuJM
	 I5u5ljOrtLo58luhS8vKw6JxDNtjDU/Uhqw9eWfiGTvartT21RqFPqX2wAYwv6cv6ezK5
	 Vx9K2DNqgjnI2aCUp8QqMemefKjnCkzEsVa6bWQmsGGQtSBrMQX/DpXYsF6AqRA5Jkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=mCTD2QBK;
	arc=none smtp.remote-ip=109.224.244.22
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C6606B2FB
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC4C6606B2FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=mCTD2QBK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793829656; x=1794088856;
	bh=Eg+9+oeU9+jU9RyDJcEVZIb1X8FilkqhAFwEKY4Lpi8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mCTD2QBKtCGQJtBJAkcbPXIrrZbdfugo1UVrZdSfKYt9ImLRuQqPyTr+q0ck3eQX5
	 Wtq7nSpt0C0QUWVDxzuiAwzmT12wR017Z9NKDRsKrykTXdVJHNs5UuJ5cnF4cW/tbb
	 Kz8psi6cjpjzMaxfDanC52zf0o2AW69L1mNwgS/Jono4miQF4qw1mzu9ri2xYcTyfJ
	 mrEBh89JhytWt0nP14Ofpl5m+j8vKGvpw29SlpikNhZBTNOtltTYJKxlEuCzHp5r1+
	 sagT2Smsp6ZITQNshyFLTQe4LfJGOF9E1/K1WX+VSN6VkCy0KRk1Sc3dnOj6sqPmoL
	 2r8aS80tRgjiA==
Date: Wed, 04 Nov 2026 22:00:52 +0000
To: linux-kernel@vger.kernel.org
From: Chad Aldreda <ca@modelmiser.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nick Faro <yux50000@hotmail.com>
Subject: [RFC PATCH 3/4] media: v4l2-dev: name the video_device behind an open file for DEBUG_DEVRES_REFS
Message-ID: <20261104220041.3994559-2-ca@modelmiser.com>
In-Reply-To: <20261104215546.3990950-1-ca@modelmiser.com>
References: <20261104215546.3990950-1-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: a81056a207e7e65d520d4940c4814eb046736413
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

An open V4L2 file points at a per-open v4l2_fh, and the driver state,
with its video_device embedded, is reachable only through
video_devdata(). The DEBUG_DEVRES_REFS check therefore cannot see the
most common shape of the bug it looks for, a video_device embedded in
devm memory, without help.

Register a devres_open_file_hook on v4l2_fops that names
video_devdata(file), a lookup in video_devices[] that does not touch the
video_device itself. The driver state behind video_get_drvdata() is not
named: reaching it means dereferencing the video_device, which may sit
in managed memory already freed by an earlier unbind, the very thing
the check reports. The hook object is defined unconditionally and the
registration calls are stubs when the option is off. It is registered
last in videodev_init(), so no failure can leave it registered, and
unregistered first in videodev_exit(); a walk in progress pins the
module.

Parenting the V4L2 cdev to the video device with cdev_device_add(), as
mc-devnode and cec do, so that a generic kobject route could be used
instead, was considered and rejected: V4L2 deletes its cdev from the
device's own release callback, and a parent link would make the cdev
hold the device and the device wait for the cdev. For V4L2 that is a
media-core change with regression risk, not something a debug option
should carry.

Written with Claude (Anthropic) under my direction; see the cover letter
for the disclosure required by Documentation/process/generated-content.rst.

Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
 drivers/media/v4l2-core/v4l2-dev.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v=
4l2-dev.c
index fd267fb749..fe617dbb97 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1235,6 +1235,32 @@ EXPORT_SYMBOL_GPL(video_device_pipeline);
 /*
  *=09Initialise video for linux
  */
+/*
+ * For CONFIG_DEBUG_DEVRES_REFS: an open V4L2 file keeps its struct
+ * video_device alive via video_get(), and reaches it only through
+ * video_devdata(), a lookup in video_devices[] that does not touch the
+ * video_device itself. The driver's state behind video_get_drvdata() is
+ * not named: reaching it means dereferencing the video_device, which
+ * may itself sit in managed memory already freed by an earlier unbind.
+ * Defined unconditionally; the registration calls are stubs when the
+ * option is off.
+ */
+static const void *v4l2_devres_open_file_holder(struct file *file,
+=09=09=09=09=09=09unsigned int idx,
+=09=09=09=09=09=09const char **what)
+{
+=09if (idx)
+=09=09return NULL;
+=09*what =3D "video_devdata";
+=09return video_devdata(file);
+}
+
+static struct devres_open_file_hook v4l2_devres_open_file_hook =3D {
+=09.fops =3D &v4l2_fops,
+=09.owner =3D THIS_MODULE,
+=09.holder =3D v4l2_devres_open_file_holder,
+};
+
 static int __init videodev_init(void)
 {
 =09dev_t dev =3D MKDEV(VIDEO_MAJOR, 0);
@@ -1255,6 +1281,9 @@ static int __init videodev_init(void)
 =09=09return -EIO;
 =09}
=20
+=09/* Last, so no failure above can leave the hook registered. */
+=09WARN_ON(devres_register_open_file_hook(&v4l2_devres_open_file_hook));
+
 =09return 0;
 }
=20
@@ -1262,6 +1291,8 @@ static void __exit videodev_exit(void)
 {
 =09dev_t dev =3D MKDEV(VIDEO_MAJOR, 0);
=20
+=09devres_unregister_open_file_hook(&v4l2_devres_open_file_hook);
+
 =09class_unregister(&video_class);
 =09unregister_chrdev_region(dev, VIDEO_NUM_DEVICES);
 =09debugfs_remove_recursive(v4l2_debugfs_root_dir);
--=20
2.43.0


