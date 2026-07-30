Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4979D35C180;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431151; cv=none; b=bkgjuhqpYRTVAXaFwZGCgB5lH7iwbetGhPVqjscxcceolmteUTjeercfbOETJ0d3a9VEYMPSFnbHTFa3Y2PWFUnUEJG6b/NmvOas3yIjLxhp5cB+KkeAJralx0s2gSXduWqxyPyUuxrbwa6klJu3Se5nPH1OuewPDaHUEkW57fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431151; c=relaxed/simple;
	bh=WZR8Y42ND9E/OAlX111HbpPcKsxTChsq0oOfQ3+9UZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXB7v0Zyh7QTLW2xmOwQlERd0ej4+4w1wWYhefa7LHUc8BxDb/W1DMVbT7EYmzffnnu2sw1183Ri2xKlCcTXlGgAJroFZLmbUPJbkmHiV9D5L78m5E0OMgDdFKU44/yt6fzPfEPar8GIvrLxArEZUnAzW1m5wvsQp3DsLnCw0kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U0OgeggQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U0OgeggQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03FBEC2BCFC;
	Thu, 30 Jul 2026 17:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1785431151; bh=WZR8Y42ND9E/OAlX111HbpPcKsxTChsq0oOfQ3+9UZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U0OgeggQO9XAL00a0Lyi35OLQFTK+lgiPeKS4qmN72pWx387JkERQVbhaBtOVKxdJ
	 sJd6YYGWsuOVxaSSQoYbyIEuRiRPoFytyPFKfSKxYw6JA5XO9HnFuJ6vYAEboU5uLI
	 7IX0+x5h0g9equU+dLAiCNGM5Adka3vWJXdsZZfU=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF18C55171;
	Thu, 30 Jul 2026 17:05:50 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Fri, 31 Jul 2026 01:05:42 +0800
Subject: [PATCH v2 4/9] drm: move debugfs_init after dev->registered is set
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-tyr-debugfs-v2-v2-4-aea19eccb996@linux.dev>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>, 
 Eric Anholt <eric@anholt.net>, Ben Gamari <bgamari@gmail.com>, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785431148; l=1502;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=WZR8Y42ND9E/OAlX111HbpPcKsxTChsq0oOfQ3+9UZM=;
 b=Nu6+7BcxiJjyRPpf2u+1b0iaiSQBOJe051oW2rzfFeF1mot84+/iQEuu/d+7bnherhoaUo22G
 PErAWGVIR6SCpdLLCp+QzHtk1b2X3Lol0rBTsYH8E7OtNJA4IEi52sW
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

The debugfs_init callback was invoked by drm_debugfs_register before
dev->registered is set to true. Moving it to drm_dev_register after
dev->registered = true fixes the Ioctl type invariant violation.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/drm_debugfs.c | 3 ---
 drivers/gpu/drm/drm_drv.c     | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index ae1c6126c2c59..38cf6ce387cc8 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -442,9 +442,6 @@ int drm_debugfs_register(struct drm_minor *minor, int minor_id)
 	/* TODO: Only for compatibility with drivers */
 	minor->debugfs_root = dev->debugfs_root;
 
-	if (dev->driver->debugfs_init && dev->render != minor)
-		dev->driver->debugfs_init(minor);
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index e890052061f30..15669764fe625 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -1101,6 +1101,11 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 	dev->registered = true;
 	dev->unplugged = false;
 
+	/* Call debugfs_init after the device is fully registered. */
+	if (dev->driver->debugfs_init && dev->primary &&
+	    dev->render != dev->primary)
+		dev->driver->debugfs_init(dev->primary);
+
 	if (driver->load) {
 		ret = driver->load(dev, flags);
 		if (ret)

-- 
2.43.0


