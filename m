Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E73D0BED
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603966; cv=none; b=PmyT83SoKVWRdTqhDOZM4sXxY6LoQtP9xHfCOFyQNoD6QlPzONC8Ehej06W/qdKYw/ERiu5FFgefN8IB/BRWKBxYC4W7E6XD8sJqNpEUk3Wate3gpHNm3LbllmEml0fKj3Ww8TCogcOcJO5sGrzlJnzE5EZfHEZzr7Eoc8vsjpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603966; c=relaxed/simple;
	bh=bhX/uExq36XR2B5BBZe8MSmuueLve7yslUKIQx34rgQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EVsawrDBIYf7BaA/HF/Immo3G7ynsmDQc6/8keJshYjxTbBMmtnq3W0UTRjN50vUl1vCjzvqP/oZl/LZK656aMSPrwIIZSAfrVPzviMsM69tojW5sMRdZuK73+Jd9+vjvTwUDC92fmZMuct9DIHxKEKfO/MBg4XbJSB1ufkL5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=O99zO7fv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="O99zO7fv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778603956;
	bh=bhX/uExq36XR2B5BBZe8MSmuueLve7yslUKIQx34rgQ=;
	h=From:Subject:Date:To:Cc:From;
	b=O99zO7fvlSK+0L24vN3/S50Tka8H8A2v+p25hcVYFPeF0OvjIZY+3hg3104ZB3Bxw
	 0XKFMzpacimMjgp36/HFzf4uLJaOtEFqptKszPOyx3tNqd7k2PIdGchXKlruccNKG5
	 Pvjm73HnwAwWux2tBBQWAFQmmtiDK4zoKvyk3Src=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/5] driver core: Allow the constification of device
 attributes
Date: Tue, 12 May 2026 18:39:10 +0200
Message-Id: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOyw6CMBBFf4V0bU1fWuvK/zDG0HaQugDSKSgh/
 LsFFy7c6G7u5M45MxGEGADJsZhIhCFgaJsc5KYgri6bG9DgcyaCiT1T7EBxxAqpaxtMtEwpUp+
 vHFzXuYvQUWM0r6xS0viSZE5eVuG5Os6Xd8be3sGlBbw06oCpjeP6xMCX3j++gVNGhRRGqkprK
 93pAQERXd3X2wYSWaSD+GB3TP2CFRmrjReGOyuZ5l/YeZ5fF537TUABAAA=
X-Change-ID: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778603956; l=1929;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bhX/uExq36XR2B5BBZe8MSmuueLve7yslUKIQx34rgQ=;
 b=OP1VDKEWmTNrAOKiedwucwZKqhc8giQMGQ6bHt4WPx5qk+t8hPB8hDuBaawZvJcA890TQNNZm
 eg/H5+d1YDtBYckQmPQgwlK9iNNo0C+K7xekrBOS6Pm1VDBvv5RTjSd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow device attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

My goal is to migrate all sysfs attribute of a given driver or subsystem
at once to avoid code churn through. To do that all sysfs features the
subsystem uses need to be const-compatible. Which means that the
migration of device attributes and is_visible() are happening
concurrently.

After device attributes only kobject attributes are missing for a full
conversion.

---
Changes in v3:
- Also constify DEVICE_ATTR_RO(dev)
- Also handle DEVICE_ATTR_*_NAMED()
- Link to v2: https://patch.msgid.link/20260504-sysfs-const-attr-device_attr-prep-v2-0-79d291cb3071@weissschuh.net

Changes in v2:
- Rebase on v7.1-rc1
- Extend cover letter a bit
- Link to v1: https://patch.msgid.link/20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-of-by: Thomas Weißschuh <linux@weissschuh.net>

---
Thomas Weißschuh (5):
      driver core: Delete DEVICE_ATTR_PREALLOC()
      driver core: Add low-level macros for device attributes
      driver core: Stop using generic sysfs macros for device attributes
      driver core: Allow the constification of device attributes
      driver core: Constify core device attributes

 drivers/base/core.c    |  54 +++++++++++----------
 include/linux/device.h | 129 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 126 insertions(+), 57 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

