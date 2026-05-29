Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA63EFFDB
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073008; cv=none; b=ETPILt13a4yQVuiN0XfOIZIxX+N6Yy5BD0hHoOcwTcOgAMkfUBGp9two5jQ9UMLQ81gxpdXR+o5UAHyVB8/fGEwb0aTweXqilKQiLLZMQbGqswdCkBe2Lwyt66fY2/2JlbaYoPnK3XTFEEA3D/RLapVCkSIcC8FtMdoWwC3bbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073008; c=relaxed/simple;
	bh=J1Eb26yXzGpOf2bgrVjU6dUVb9eUDnHPNte+iAlMmLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcMHAqqX4mnbli9c77yQGzfSdhdnmIQfMI/MQ02l8QEqGzFdNd6hOa2illCz1XM80V7PVj7TTSMLNe4Zz/c5VuGFW3HpfmhMPtIbO9+mzZH22KT/iizHF+RFhOhXE7MM4gxoGHl2njNXhqd01mrAUp1PX9z0cKhBCh2EUacDhq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=mSH53gdk; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="mSH53gdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780073004;
	bh=J1Eb26yXzGpOf2bgrVjU6dUVb9eUDnHPNte+iAlMmLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mSH53gdkqSpv4X1B2VQMbWd0w7KaaKINh42jPHPA5JzkqIus+9YnGA5fBXjL5cTmP
	 U5heXBe5jmjB/Wx/fPc5dmENS87VCJD0sGi2d+1PQuupnswvx5AzvJcg0i9l+/gfXI
	 4bsAVUh7xSUYP+XT23dN8HOho1fkeWGyB2LSUc1g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 18:43:22 +0200
Subject: [PATCH 1/4] kobject: Provide macros to initialize 'struct
 kobj_attribute'
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-sysfs-const-attr-kobj-attr-prep-v1-1-7e667ba3bb85@weissschuh.net>
References: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
In-Reply-To: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780073003; l=1650;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=J1Eb26yXzGpOf2bgrVjU6dUVb9eUDnHPNte+iAlMmLM=;
 b=SGzVSFaheSzcJz/KidztYGzagWXTO5b7FdgN2HAKYwu8GvuGFBee8+AAKgn/yQbMzjC3lUVMV
 z1YG2Uv3We8B0MJhOfRZ6dTm4dMAKweRCFPoWYjzfPLtao38ZRVt9xu
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently the generic __ATTR*() macros are used to initialize kobject
attributes. These are not able to handle the upcoming piece-by-piece
constification of the attribute callback handlers.

Add dedicated macros of kobject attributes. For now these are the same
as the generic macros, but they will change soon. Users will be
converted to these macros as part of the constification, but it is
expected that they will be used generally in the future.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/kobject.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index bcb5d4e32001..975a5361fb60 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -144,6 +144,28 @@ struct kobj_attribute {
 			 const char *buf, size_t count);
 };
 
+#define __KOBJ_ATTR(_name, _mode, _show, _store) {			\
+	.attr	= { .name = __stringify(_name),				\
+		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
+	.show	= _show,						\
+	.store	= _store,						\
+}
+
+#define __KOBJ_ATTR_RO_MODE(_name, _mode) {				\
+	__KOBJ_ATTR(_name, _mode, _name##_show, NULL)
+
+#define __KOBJ_ATTR_RO(_name)						\
+	__KOBJ_ATTR_RO_MODE(_name, 0444)
+
+#define __KOBJ_ATTR_RW_MODE(_name, _mode)				\
+	__KOBJ_ATTR(_name, _mode, _name##_show, _name##_store)
+
+#define __KOBJ_ATTR_WO(_name)						\
+	__KOBJ_ATTR(_name, 0200, NULL, _name##_store)
+
+#define __KOBJ_ATTR_RW(_name)						\
+	__KOBJ_ATTR(_name, 0644, _name##_show, _name##_store)
+
 extern const struct sysfs_ops kobj_sysfs_ops;
 
 struct sock;

-- 
2.54.0

