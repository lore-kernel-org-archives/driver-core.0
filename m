Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6993375D5
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 02:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256110; cv=none; b=E16EpqJ1PdfngUx1KNRHCYt/aBDeyF4Ez8vZEAdMlLJDECx4zBZqws2nkfLI2/6gF/4dDiFmwW8qsUh1V0sMrMEf+k0IWOM1onJ6E//opJJIW0u/mm6nJJD6SqaaQO3W2pMOFBKCzvIzh1Xiw29BmLJNCMTgu48tmpED9G6xlmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256110; c=relaxed/simple;
	bh=KH/ARVjO6KZqlgIJZ1WbqwS9YnBGnwAD01sy0uaFPNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EI0IM4WU2+Vf4zaHEzdir0xXaGkT4kj8MqZ9AbV+J3QYWWN8aqtCaMjobKbajFsKVXXpI35tVqc6hJ2wIG0Y0wyn/oavAEsNMoPQosuERR6MjfHKXb4sEi612LxOKPl17rJj2PHm0S+fjWepAgqMMhxS2j3okhlVvuF/uz73048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzz1s0QL; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzz1s0QL"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c166d70977dso93152666b.1
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256107; x=1784860907; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kNEDG9WfHYH4efBdhIMziRHnrMAb5uPezNVzt5EuvWI=;
        b=dzz1s0QLpu81z2EchlmZm4/IJXa/RLwmswjx76jusSAhw41S/+JzRVzJNrAmkFrDqr
         u7h9jIyItY48xMx7TqSNvIoQXfXLtNn6nfJn0xMfzplCkG82rpV2Uqszn5p8elSrj9oG
         L6fjqJetBO7/whayS7zGZewSPXcxtRKioaXpir6BCGgXi84Fmm0WeWdhMEk9PSFUoogP
         Pdk9o4D1eNYAmQwy6I+uyZBjSX1aeMt+w5xkZpAJG717cUxWFVrOGV389a6b5I5nG16k
         GknbOECjL6HjDFuZwVLRY40aaCAPYQawrdXS6wsR1QRIkYhn/4Wo2VfqWViLJsTwCUbc
         5VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256107; x=1784860907;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNEDG9WfHYH4efBdhIMziRHnrMAb5uPezNVzt5EuvWI=;
        b=Qo1tiBqEEK+DpMvrVEbpJVKdh/vfvSjZCq3RsIyj+/2hy4NoGfgSdyR/S8GxEraDNI
         6HMCvsP8j8D/vom0nYxwdPrcwjfwls0QYMawX6+8RTg0+RsVFElmz8hxwT3O5b38CZo1
         KPdieTYqCH+f3NmyKywH73BEFN3CTJrQSnyjskkolr1q5pM7fcKmGe23L0nvLbEZ7B1u
         q26al+jKV84HtmgSdrMlYPOuvBluxIltTpAT6QyrnHdqbisny6TPaXhsp3WcI2hhttkN
         zNUNSKDw+to+t+1djkR0chJWyYkyJ09HQNFfY/xtJEf053Zcda0xVINW3krRIK4e2As7
         FROA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/zOaDTFepkdze3BmVTXoHlaq+OhH8SJaeITKW6a+Slzc1KTzwUvRJdIv+ZFAnQfPlrmSXS5hovS+Q6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywms4GAiHp7Ycaqbss4Bdo6I5Cy4dkfwAw+s85083ut7ZnsdKJC
	jkJ0Q/6WlUn3sc18tQXsxcLOIwrgJtPsoaYeKWSf2b3KFG1cwEd9dzhCnatI88yj8tPxe/+T6q8
	t834q27f53sZlp4fuxg==
X-Received: from ejbgg8.prod.google.com ([2002:a17:906:e288:b0:c12:6e0e:a4b6])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:abcc:b0:c17:1295:265c with SMTP id a640c23a62f3a-c1712952993mr6792166b.21.1784256106546;
 Thu, 16 Jul 2026 19:41:46 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:08 +0000
In-Reply-To: <20260716230411.2767394-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-5-tarunsahu@google.com>
Subject: [PATCH v19 4/7] driver core: do not always lock parent in shutdown
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
	linux-scsi@vger.kernel.org, David Jeffery <djeffery@redhat.com>, 
	Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

From: David Jeffery <djeffery@redhat.com>

Don't lock a parent device unless it is needed in device_shutdown. This
is in preparation for making device shutdown asynchronous, when it will
be needed to allow children of a common parent to shut down
simultaneously.

And only acquire a reference to the parent device if the parent is to be
locked.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Tested-by: Laurence Oberman <loberman@redhat.com>
---
 drivers/base/core.c | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 82a7af1f3ba2..31f95e86856e 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4898,14 +4898,10 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 	return error;
 }
 
-static void shutdown_one_device(struct device *dev)
+static void __shutdown_one_device(struct device *dev)
 {
-	struct device *parent = dev->parent;
-
-	/* hold lock to avoid race with probe/release */
-	if (parent)
-		device_lock(parent);
-	device_lock(dev);
+	if (!dev->p || dev->p->dead)
+		return;
 
 	/* Don't allow any more runtime suspends */
 	pm_runtime_get_noresume(dev);
@@ -4925,12 +4921,32 @@ static void shutdown_one_device(struct device *dev)
 			dev_info(dev, "shutdown\n");
 		dev->driver->shutdown(dev);
 	}
+}
 
-	device_unlock(dev);
-	if (parent)
+static void shutdown_one_device(struct device *dev)
+{
+	struct device *parent;
+
+	device_lock(dev);
+
+	/* use parent lock if needed to avoid race with probe/release */
+	if (dev->bus && dev->bus->need_parent_lock && dev->p && !dev->p->dead &&
+	    (parent = get_device(dev->parent))) {
+		/* the parent lock needs to be acquired first, so re-lock */
+		device_unlock(dev);
+
+		device_lock(parent);
+		device_lock(dev);
+
+		__shutdown_one_device(dev);
+		device_unlock(dev);
 		device_unlock(parent);
+		put_device(parent);
+	} else {
+		__shutdown_one_device(dev);
+		device_unlock(dev);
+	}
 
-	put_device(parent);
 	put_device(dev);
 }
 
@@ -4956,12 +4972,6 @@ void device_shutdown(void)
 		dev = list_entry(devices_kset->list.prev, struct device,
 				kobj.entry);
 
-		/*
-		 * hold reference count of device's parent to
-		 * prevent it from being freed because parent's
-		 * lock is to be held
-		 */
-		get_device(dev->parent);
 		get_device(dev);
 		/*
 		 * Make sure the device is off the kset list, in the
-- 
2.55.0.229.g6434b31f56-goog

