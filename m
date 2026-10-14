Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9537E5E2
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 03:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948266; cv=none; b=LTy6/5FHY1uqKfN+bG/Fo30K0QWztptvVrvbTUjXACwZ32Q/XKaGjbYfmF4l8lSSt1sXF2xartZf5iVLT9iOewKqaUtsq/GjQ1wt1pRn8PgZMQnBG34OyLBjBX0TcRXUd7HgFjn657Aeo/KF9U3BbsUjKHPISGUhVp6GCr0ElEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948266; c=relaxed/simple;
	bh=6iTz7VpiLZLSAVqOeCRO35pCkxOjw9Jd91Pbj9XD8Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLEUar6auTvAJ88DPMarxIaxn9feN8qdQUZvbMshFDdf/FtCNKm6sA49A7UQjPsqxti1UjGnDbP3IAXmBm82IQVeslHHV9D6rO/ftEDiK5M+wqskNwVo2ct6t9X0R1gH+7JRZAMkkSzZa5GhA6dJeIkpgXxDIELe84wXO4qlnAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Egih0cey; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egih0cey"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-141395927feso6922440c88.0
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 20:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948264; x=1792553064; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOvCtYCKadNEkaISc+QEKXNYLWgmraWIzzzO7LCq0ZI=;
        b=Egih0cey0M2jSCQG9Mfk2osx566ViQvsOkwdTDWoYqT2IeJxFeLFcCR42et4kvBy7S
         eUOVUUqPO0BfZpjQP1jAUKMDhXOZveUwDX4bMo/DNahBbLH4awgOPVIqKsxfZ3vLrpZs
         jqCGavw55Wa5pI+t8yNAeVVTZKLVrjXOjSXJj1E08H1Ltse057nkZgSRriIToxUift1H
         aSZUhK5xM/9C6rGibz/mzLDJYF3PaqikDt0hfrqNDccpACHim2huOpLQYEfT5L4MBt1h
         pBEVDQqBA4jfa88/IRLQ8HDhJyq8vcqRPcVkWYwQioq6rebejd4Oq6FklRTYIOyepNB/
         vziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948264; x=1792553064;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOvCtYCKadNEkaISc+QEKXNYLWgmraWIzzzO7LCq0ZI=;
        b=ozRrfmToBi9z6uIRzYg7LLJX41i86epweeJlsQXl8SUZ0e3EDlNVpYp+fp9eRKZHc2
         fAtkLaDZl0NdOnZwyPZmYX7ceRXBsz4aJ6FJ9loVfo1Ekl+4AbdEKlSME1TML4XrMVjy
         86nwY/bni7yIDVSv/SwREFdwg3B6/4YSctPbTGcbNgnIikavifpngzGIdekIAM6x5mdX
         qofNuucLuGXp0MR3V5+l6Ptf+ZYn7yH52G5hCXtb9TqU65tJPv4X/hWQZIwt7twh5gZH
         krkwULtj0ckTtWS5of73+cy04rEsCJ2MT1F9qZeH78ixcaPRVEw1XtP56pH/1GbLV2W2
         lUBw==
X-Forwarded-Encrypted: i=1; AKwUvBwbluolnXdFN//nd9CL3p/Nr7qFN22vxwvGpI3PwkK2NdJY+PgnJjNIjlEMUc9PSKrEJuunmpO9tJA0mg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIbASJVyE5iOLync73A84kUpE8V0m5+/ObBNptcrDii3Ra08GOE
	8EE0nlv4coksnlrTt+v3LlEkm6y6aDLM+kRzh3uFNwzqNEHkeSuNGZn0
X-Gm-Gg: AYBFou0L4JrG0gSOuLiz3lshZJidIPoTHUS379MpLNE0mUzXyKGUx4iI/7ipVUXbkkp
	y4K1eJo/9PPrRvSSBALhGFmE9zXAUAJSLnyutDAgKFsZn5aYxwpPRIkE044thBILAYJ+0jmEsHW
	x8Tb8P2I+Vss3eI4tXnJL3fP5rCqdN2FAyooWy0X3OyjG8dYEievZExrFclF4aFe9sMprBrAa04
	enZCgHEQnlXuEQggS7PLRWVZ5NRQuZKbI7M6JmuaFVvf2CrU0LWuZ4u+GjUU/ecRuh7wzTDbeeB
	6thYkErbCcRx0Pdtijp363vGYY7J6+bCw0XZLAKWAa+MKYiekPGdOBQOQJNLRVliSLKOe9brofs
	1T3LRSWxILPWc15nYNmOj19VWPh/y7YDadBqEpTp1nTLY3tNpV7raAU70eKSg/jPRTwvu7gU6vz
	uQUx1F9h0hUn8hscS/wfPxKePSUjWgdWnt9fDZ3F/PjxwOnKktB5ln+8cfNU72lFLeaT9efX9Zd
	RgAyM7mvH1VmV9fXygkziQXlXbAK8AouJb3qCvg
X-Received: by 2002:a05:7301:e0cb:b0:351:1e3f:812d with SMTP id 5a478bee46e88-3537e0caeb8mr18111087eec.36.1791948263787;
        Tue, 13 Oct 2026 20:24:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:875a:117f:b9ea:5a08])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm53415105eec.17.2026.10.13.20.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 20:24:23 -0700 (PDT)
Date: Tue, 13 Oct 2026 20:24:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: fix race between bus_remove_driver() and
 dev_driver_uevent()
Message-ID: <as71DkwHeLGNDsPv@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When a device driver is being removed, bus_remove_driver() removes the
driver from the bus klist before detaching it from bound devices. If
dev_driver_uevent() runs concurrently on another CPU, it may acquire the
bus klist lock after the driver has been removed from the list, read the
still-valid driver pointer from the device, and access the driver's name
while bus_remove_driver() proceeds to free the driver structure.

To close this race window, acquire and immediately release the bus
drivers klist lock after all devices have been detached. This ensures
that any in-flight uevent generation that observed the driver pointer
before device detachment completed finishes reading the driver name
before the driver structure is destroyed.

Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Extremely unlikely to hit so I would not worry about backporting to
stable.

 drivers/base/bus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index d17bd91490ee..8b3aaf451e4f 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
 	driver_remove_file(drv, &driver_attr_uevent);
 	klist_remove(&drv->p->knode_bus);
 	driver_detach(drv);
+
+	/*
+	 * Ensure that any concurrent dev_driver_uevent() that observed
+	 * dev->driver before driver_detach() cleared it, finishes
+	 * accessing drv->name.
+	 */
+	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
+	}
+
 	module_remove_driver(drv);
 	kobject_put(&drv->p->kobj);
 
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
