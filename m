Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60070175A68;
	Sat, 10 Oct 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791640298; cv=none; b=hV+6aIfFFVkgGBFh7j+Rfr6NMkMPrdtd+UOzXUxLCYHwaAIBjJ6slwYg+vndIxQ9LN/RO0LvsHkTNskopyJE9sb5oj9oTvw88U+AZ+kPT1BCRJaAOgnDnTQWMh+eb2XGCJhx8rNyrTxxuExrOQr9XICZJ5omeTEbHnsNI2Zh5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791640298; c=relaxed/simple;
	bh=/8xOBfv50ZCgRFvLLq0CQyKWWIawm/YT8f0qjYIzl7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7OGxZm3hxTowZjz2cuMFijWATulgJjH4KNzYzbH/d0iQz4HksB6LxOGttbGzjoevvjg5YKpCjMbsi1eV7LeCuIH3Wugpp4zwyjzyHX9y41YwJ/P+NiTmL5QxH5PVYd5htAnehzATfuyYHmbXWIoy4NRUbR5XLS+rU/EafS4S0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRo5Ob4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRo5Ob4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C5A1F000FF;
	Sat, 10 Oct 2026 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791640297;
	bh=Pj7KYE7fxTCpyiECJyNzSduvP1jBgXaEvy3veVvPADw=;
	h=From:To:Cc:Subject:Date;
	b=kRo5Ob4BqzumekJzh5jcNWCEd8eePWVsPklv2HuT1Q4j+nTFwsi02vtvhReesnJUy
	 mwJDdJg7jJTKFhLjy6pi45Is2hXammPBpRGvLyGRIr66f1pztRfo/JiJdydqXZ/QMz
	 ubKNZ/M9tLSezj3brWTKyP0VBq4ozlnU7g75whJqf/oDM4AuQ/gZU0+3Pd+5ZQ29Y0
	 D4nMwt3boRoX1Z13pmc3iURGYwKF4toWbHiNYIRZI+wUwhzaZGQsOkMhkr4B9KRZgS
	 njxGdZkZPj9sA1NHv4mWg0F2DAFbUOgTJz2yXdAFbfIU/c++1F17Ny4RkZCR4oTy00
	 PVpVhUXymGMvw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael.j.wysocki@intel.com,
	dakr@kernel.org,
	johan@kernel.org
Cc: linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2] usb: core: don't set drvdata to NULL in usb_unbind_interface()
Date: Sat, 10 Oct 2026 15:50:49 +0200
Message-ID: <20261010135131.286498-1-dakr@kernel.org>
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

The same applies to the unwind path of usb_probe_interface(), which also
calls usb_set_intfdata(intf, NULL).

Besides that, the Rust driver core code manages a driver's bus device
private data and destroys it in device_unbind_cleanup().

If usb_unbind_interface() sets the pointer to NULL prematurely, the Rust
driver core code sees NULL, and hence skips the destructor of the bus
device private data, which leaks all its resources.

Thus, drop usb_set_intfdata(intf, NULL) from usb_probe_interface() and
usb_unbind_interface(), and move it to usb_driver_release_interface(),
which manually calls the remove() callback of struct usb_driver and
hence can't rely on the driver core.

Cc: stable@kernel.org
Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
Reviewed-by: Johan Hovold <johan@kernel.org>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
v2: Also consider the unwind path of usb_probe_interface().
---
 drivers/usb/core/driver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 7f33fe5ba03b..9c5a10dc0542 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -410,7 +410,6 @@ static int usb_probe_interface(struct device *dev)
 	return error;
 
  err:
-	usb_set_intfdata(intf, NULL);
 	intf->needs_remote_wakeup = 0;
 	intf->condition = USB_INTERFACE_UNBOUND;
 
@@ -497,7 +496,6 @@ static int usb_unbind_interface(struct device *dev)
 	} else {
 		intf->needs_altsetting0 = 1;
 	}
-	usb_set_intfdata(intf, NULL);
 
 	intf->condition = USB_INTERFACE_UNBOUND;
 	intf->needs_remote_wakeup = 0;
@@ -644,6 +642,7 @@ void usb_driver_release_interface(struct usb_driver *driver,
 	} else {
 		device_lock(dev);
 		usb_unbind_interface(dev);
+		dev_set_drvdata(dev, NULL);
 		dev->driver = NULL;
 		device_unlock(dev);
 	}

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
-- 
2.56.0

