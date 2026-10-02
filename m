Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A672B48164E;
	Fri,  2 Oct 2026 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953159; cv=none; b=OaL5dIvu6iHUH6tjUMoeFArNPkBD/b1jK+l1wLQejADTrL+4xgYhnJX0jIoolagXJmxSnwOvnz5KsN3K8jLEvez7dyzRTcBpDxzKBgMCXL9PPrC2RIhk4Lrjeonm1rvkOyWG/JpQ5QCGHuuUP4UuWgX6MR4pdXRL9SLs/bnUeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953159; c=relaxed/simple;
	bh=vf2U29OfDqQi6TRh/hgKlKMu8NiB7PFe0yRgU6x8me4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+kzX6I7YMmY3mzqaXKL1JgV5cFOWfr01wOj4xOfNJAK6mu6CGAGTuPcqLxtZrfddtPJYs+NUhc0Lyr+pKxj79gHUk7/Lg8Oj6+PoswnG7e/bm/tjsX/XWA4LSirCLraq4eFdd49vNM2Yhqj555iUQYeiZWfY5n/ryQ1ZtRqVvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUO2iVyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUO2iVyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD471F000FF;
	Fri,  2 Oct 2026 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790953158;
	bh=xLtGezXul7Lj/dxXMiIF/tLM+YjmDyHC+PudCRBWjuI=;
	h=From:To:Cc:Subject:Date;
	b=KUO2iVykTMNViRDrZGkYaO3rR2SRq4gUejZxbCaT6mDw6NwYI5c9cTSLkc2vYPN20
	 pWL7L85l6yqF4NOhYfCc31YMYz524SsTYr4l8JzA34l+m4jVV9SZqphTcUNmzv+vAj
	 tmSydLctovKJURteR6HUhFNPMTidC+xFhjIehkLB+TZqh62u0QJ6tSeyhCkXIA/+BP
	 xTAYOvqYrvCeC1OkQK0ZG3Ykecfjf6KFJz4Ysc5TQqhs07b1SPkRSOuNmZtNyxtX6B
	 JH8vCxclsIZIXr7vi5+M/TqpkJkk7/P2wzik5WKHPEAUByPF2cErFGWvnzKW8J72pT
	 I2RHsqrb1mzHA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael.j.wysocki@intel.com,
	dakr@kernel.org,
	johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH] usb: core: don't set drvdata to NULL in usb_unbind_interface()
Date: Fri,  2 Oct 2026 16:52:49 +0200
Message-ID: <20261002145455.3392703-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_unbind_interface() serves as the remove() callback of struct
usb_driver and calls usb_set_intfdata(intf, NULL) to clear the bus
device private data pointer.

However, the driver core code already sets the bus device private data
pointer to NULL in device_unbind_cleanup() *after* devres_release_all(),
which makes the call redundant.

In addition, it can create unexpected NULL pointer dereference scenarios
when drivers use managed APIs.

	int probe(struct usb_interface *intf,
		  const struct usb_device_id *id)
	{
		struct data *data;
		int ret;

		data = devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
		if (!data)
			return -ENOMEM;

		ret = devm_device_add_group(&intf->dev, &foo_attr_group);
		if (ret)
			return ret;

		...
	}

	ssize_t foo_value_show(struct device *dev, struct device_attribute *attr,
			       char *buf)
	{
		struct usb_interface *intf = to_usb_interface(dev);
		struct data *data = usb_get_intfdata(intf);

		/* Potential NULL pointer dereference */
		return sysfs_emit(buf, "%u\n", data->value);
	}

Nothing prevents usb_unbind_interface() to race with foo_value_show()
and set usb_set_intfdata(intf, NULL).

Besides that, the Rust driver core code manages a driver's bus device
private data and destroys it in device_unbind_cleanup().

If usb_unbind_interface() sets the pointer to NULL prematurely, the Rust
driver core code sees NULL, and hence skips the destructor of the bus
device private data, which leaks all its resources.

Thus, drop usb_set_intfdata(intf, NULL) from usb_unbind_interface() and
move it to usb_driver_release_interface(), which manually calls the
remove() callback of struct usb_driver, and hence can't rely on the
driver core.

Cc: stable@kernel.org
Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/usb/core/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7f33fe5ba03b..412174270fbf 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -497,7 +497,6 @@ static int usb_unbind_interface(struct device *dev)
 	} else {
 		intf->needs_altsetting0 = 1;
 	}
-	usb_set_intfdata(intf, NULL);
 
 	intf->condition = USB_INTERFACE_UNBOUND;
 	intf->needs_remote_wakeup = 0;
@@ -644,6 +643,7 @@ void usb_driver_release_interface(struct usb_driver *driver,
 	} else {
 		device_lock(dev);
 		usb_unbind_interface(dev);
+		dev_set_drvdata(dev, NULL);
 		dev->driver = NULL;
 		device_unlock(dev);
 	}

base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
-- 
2.56.0

