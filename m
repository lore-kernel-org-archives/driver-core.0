Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A7345741
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 02:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256113; cv=none; b=kjMKX8DdaN74Y/zKtdoSKxpQ6J3eZYjQ6qFkBnioQS3kDddnWCqSIcxGkO+fRaLIePaYnzY/WYl/6lKFun+lzwBzmEHYz9DVyyV2zt3Eo5bLrNTZYBFMW3IrhKARlR3p6NP/yEsyk7SDeSU1uRsRIy9QUA30ZFz5O8W1j4+bcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256113; c=relaxed/simple;
	bh=DDh2GgbdI5RQMq7gxZncAkacOeotdu9Fzy33SzeLtQY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j/wVkDVFVelU39olWG4bER+RQiB9x/+lnwCSbVFJZDRgMQ5tHkG81rawEYZd++kBgGWe9fbknNzACg3w+ZTql/iPdWTUtyCJAom0Wot/On9Anmf3KzoafFxAzkTVFI58muAukdAa7Y6XooJWIztDb7ouMj3e7Bpwugfb7J6yMK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KvCiqduo; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KvCiqduo"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c15fed5653eso365628266b.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 19:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256109; x=1784860909; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3nhX204PbzOZptNzEwfrJ1tihihmuj8AGndCLVcQhw=;
        b=KvCiqduoock/RSjGwg6Wg9JiyD6XaOHt/lJ0SbAp/T4nH8e/d7FKaMoBRLNPG4IsWY
         e8rSTG5FI+ZEyqY5vPASRAue7brR5CDYz+9gLZOPttXqRAS0A1jXviA16Xqv4a9lkvPa
         vX6IlN69rsjISTHJgOVdKDuwpJagt3BwDAhrs6ihUilpteZPd3p1lWKdpbAqk183SEUF
         ex2Lnj8aRqUW9mux2mF8rTBs7Iy3MeODr78aCXOb1bux+WoLjhD8MiT8/NkNinZNvCmP
         07LFd2sdlI1FWotPY5kD+5cVOozirBopE+WI+mo9IjL8fgxatEacfyej8p0zAd8wY6WV
         6JUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256109; x=1784860909;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j3nhX204PbzOZptNzEwfrJ1tihihmuj8AGndCLVcQhw=;
        b=R9MbqfxCdrPIhkqwL7v/lNdVXd26si71FwBVgm+UwBqYPrvVYqKyAoJ6W+L7MWjvi8
         vy1Y8epYkBdFEeM0ylc0amc4kALfosRtiz/MRprK053CbVu01ms3nrBRStbEGVe4PEFU
         YpympcUoIHeIfKOASq8FNVFyK23hYVh4dc6Ko4hAfzUrC5Y8aq8WHG+kA8S3wbs1TpAE
         NwGcZB8mytp2Lllg5Li4bbRzYowhkHKmEaqMOcDP5e6GTqYtw9o326vAHBgdUhdIweGb
         VbjbC8rLbprUHhnQ5SYRaqkGnZ53cGkM7eo4BMNjQK9XWR5X52ob5vN4HAYE74snS/9D
         loMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpf3O5TlqqYtFOjYE6LFtsPOj+E2xxvAjZZlL5OOfZ3juLgQbIdTWTWCzAiWY2ntnoBsR1cBAYnBYEq1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUCLe4xqcz0bC4DOwKDrpjKhMAAABmD+PIS3AM/yGu/YI10DH+
	HjEllRInN4q1zuFmMWGSkv+nMA6ecfViOVhGD6cihz1WVgHN0JENF9SgMG7RnDZt+aswkakx1xa
	ZczRU9ICNCoIbM1AgzA==
X-Received: from ejfr10.prod.google.com ([2002:a17:906:3d6a:b0:c12:5875:9cda])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7203:b0:bed:19af:f89a with SMTP id a640c23a62f3a-c16b46caa65mr21546866b.7.1784256108367;
 Thu, 16 Jul 2026 19:41:48 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:10 +0000
In-Reply-To: <20260716230411.2767394-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-7-tarunsahu@google.com>
Subject: [PATCH v19 6/7] PCI: Enable async shutdown support
From: Tarun Sahu <tarunsahu@google.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: bvanassche@acm.org, john.g.garry@oracle.com, mlombard@redhat.com, 
	loberman@redhat.com, mclapinski@google.com, dmatlack@google.com, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, jordanrichards@google.com, souravsgl@google.com, 
	stuart.w.hayes@gmail.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, emilne@redhat.com, jmeneghi@redhat.com, 
	linux-scsi@vger.kernel.org, David Jeffery <djeffery@redhat.com>
Content-Type: text/plain; charset="UTF-8"

From: David Jeffery <djeffery@redhat.com>

Like its async suspend support, allow PCI device shutdown to be performed
asynchronously to reduce shutdown time.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/probe.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index dd0abbc63e18..af2381446406 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1046,6 +1046,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 
 	bus->bridge = get_device(&bridge->dev);
 	device_enable_async_suspend(bus->bridge);
+	dev_set_async_shutdown(bus->bridge);
 	pci_set_bus_of_node(bus);
 	pci_set_bus_msi_domain(bus);
 	if (bridge->msi_domain && !dev_get_msi_domain(&bus->dev) &&
@@ -2748,6 +2749,7 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	pci_reassigndev_resource_alignment(dev);
 
 	pci_init_capabilities(dev);
+	dev_set_async_shutdown(&dev->dev);
 
 	/*
 	 * Add the device to our list of discovered devices
-- 
2.55.0.229.g6434b31f56-goog

