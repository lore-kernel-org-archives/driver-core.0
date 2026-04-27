Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259013B52E1;
	Mon, 27 Apr 2026 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285829; cv=none; b=sIRjdTzy6i9mcO+FChwrOqY4ejhUGli8+bdHaTr7p7d7eci5VRVA5bDwIUvfFfsZ8Gn8MPIXKIjFNt4jEAGykOv81DzuWmq5AGSI5MXI6khiKefiN1J/iG8zd8wMgHwa7uUkZHI1/6Wx/ZSmlsYhNVy4Vga5O19epYQp/7mIuWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285829; c=relaxed/simple;
	bh=mzRri+UwfqSsBPQWcw+cLA0FA4jDpn8RGhgxNrI8duA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=irPh0odRrZurQEiI91N1JJ68p5ScDHYaqOrqOxCtX0N9WBJo68q3K8RSsFmqaPblNgjyfP0adAkQmdrud5R70h1gfiOgEHA1UKh3tp//GERBFEoNzKIXtchC+hafvcCrRd8wBdLC7dn2AZgNqO4jXyzmK6zV1sqK4IdfGECJDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9IUSJxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9IUSJxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EB5C19425;
	Mon, 27 Apr 2026 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285828;
	bh=mzRri+UwfqSsBPQWcw+cLA0FA4jDpn8RGhgxNrI8duA=;
	h=From:To:Cc:Subject:Date:From;
	b=j9IUSJxa+vLM7gSJjHIkyQS5qcRj7/1wFC0h04EoTG0O6DruiX/As7RBsLLHAr2iH
	 J4uP+4uKEXKAtO8+9zSpPBHQ/AI5LgBrguSpvpcII+KnrLXUxsIcIMtZVKS4G4wMtu
	 ihoRyv36dcSFMfYGU00+hGifN0pFxL3Cb3ilyCoBqDskW7CeQZ7P48Wo+RlgqRrdEu
	 SdVRwDRAAEx03xY3mWkeKmv626rhUNavHO/3lF/Lytr8GUJRbXsEaLnVlijfp8E/hI
	 6k9zlEgwemDfXOhAmUkgCL0bgOyq6jzBeYQ3ZbMkWnkPcq7rk2+3Dmsvi6dFTfLiGF
	 9tFEjfZC6rgHw==
Received: from johan by theta with local (Exim 4.99.1)
	(envelope-from <johan@kernel.org>)
	id 1wHJEO-000000000b2-2p5p;
	Mon, 27 Apr 2026 12:30:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] driver core: reject devices with unregistered buses
Date: Mon, 27 Apr 2026 12:28:52 +0200
Message-ID: <20260427102852.2174-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to register a device on a bus which has not yet been registered
used to trigger a NULL-pointer dereference, but since the const bus
structure rework registration instead succeeds without the device being
added to the bus.

Reject devices with unregistered buses to catch any callers that get
the ordering wrong and to handle bus registration failures more
gracefully.

Fixes: 5221b82d46f2 ("driver core: bus: bus_add/probe/remove_device() cleanups")
Cc: stable@vger.kernel.org	# 6.3
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/base/bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 8b6722ff8590..d17bd91490ee 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -544,10 +544,10 @@ static const struct attribute_group driver_override_dev_group = {
  */
 int bus_add_device(struct device *dev)
 {
-	struct subsys_private *sp = bus_to_subsys(dev->bus);
+	struct subsys_private *sp;
 	int error;
 
-	if (!sp) {
+	if (!dev->bus) {
 		/*
 		 * This is a normal operation for many devices that do not
 		 * have a bus assigned to them, just say that all went
@@ -556,6 +556,13 @@ int bus_add_device(struct device *dev)
 		return 0;
 	}
 
+	sp = bus_to_subsys(dev->bus);
+	if (!sp) {
+		pr_err("%s: cannot add device '%s' to unregistered bus '%s'\n",
+		       __func__, dev_name(dev), dev->bus->name);
+		return -EINVAL;
+	}
+
 	/*
 	 * Reference in sp is now incremented and will be dropped when
 	 * the device is removed from the bus
-- 
2.53.0

