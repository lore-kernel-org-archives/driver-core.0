Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E243375D5
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256107; cv=none; b=GcnaFVQvYU9OFpQy+ii8yYcR4mL1ujRwqWeJ6g63qwDBH43HS1MJ6NSb2DdO5IamEbKYGAsY472ZT1TC0BB+RsgV8XhtwVipF4dVK2g0gqswVm3XOUlXf5DuhbyNq6hFzFHo5uaBmQyLSi3H6SgF7hsDFKI414uq+rMX5zNyRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256107; c=relaxed/simple;
	bh=O/Swl4p41vnXyf3QyhUiXUdXKMg+dvofMUMHqzzQhEI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eCVvhn21neHGNPIFEzq4/wM07yP/VV8eQRkAppRlzbEJSKkQIS1knlmGJDNa9uH1qNX4nYrW6Mpzd3ULd7b+Wcr//OZ8ZyVtnj/f3rcC3RdvVkUZRIka1HURqMB2agHRwSIzUqaaVns71D6zkxMEsj0JXRrNIkRmfILVmIV66vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L1tpsnpD; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L1tpsnpD"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso308720266b.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256103; x=1784860903; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbIYBGDrxSWIIJNYURi+rPKwz3J+f2cnmzz2JP395M0=;
        b=L1tpsnpDlA4G1aBK9VQ5WurnOnHedf8ycoxF+Uz0NRJ0sohFcX15V7b/n1KZo3FYB7
         YLsmpWVHqtk687ENbYMEs/Sz2QgPfKSzVNFsqBRL2ZKEXbIZcYga3l69WvW/hSpSj5aE
         G6AkUeVJ4/U7laTgVCfbNK86WrTIQlboIt7YekYq27+nO/D6NY5Fn30452Ii6ik7UPsj
         7LsmtpG8pA0TllTWULFxN79wN33QuAqHbfDI9p304Dm+ohWwKF8rvTcZ097FBE3pbwdz
         D3knLn+kQqSnhsAleLVZQpnslb6rwJcSGc80hTc2eNmtMF0PXT8e3+EdV1NzuFsIEWOs
         Fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256103; x=1784860903;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbIYBGDrxSWIIJNYURi+rPKwz3J+f2cnmzz2JP395M0=;
        b=OdyocNJQF67X2ZKszXkHY5yxHGSyKgAbBcTprswGd4n8rsqEF1sDIqcjxv/h7XhUMQ
         o2H79ces9RUWxyAu3ugDhdnXzPtcZnNhm1BkF+uSPp5M58A/tdh2b3d0yH1/EBzK1VgG
         o7hVLWUwqWC0wUJOysoDV+Zv+tDwGfYxrNGyj4/mbkPm1c6CauIT20KJx28UjZZ9nPxi
         vEdRidhZHdZ4aMmU1ZeWGq06aCUC9oR04QuqXaW/d+hyBMufr9J8ld8vi9fqHisKTNol
         aKAeusDxWqr6ZylzUh0rX/ycEzbjmuSaWmL6+ZwFdns4P+96vbeng6hqGr3DPNim7tMB
         FDqg==
X-Forwarded-Encrypted: i=1; AHgh+RrPZxXra4duLo6fh9ask7ByTfJPVxmzz9t0FovLzqIm8nbpfZj6mcMknuuTMyOEHAVO/kjL1ALmFEC7pw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsy4pWAmA57TBwOsuN3e/kysZk1pQPnKPG7xiVXtX3yxGgad2b
	H3D21BEEgOuSSxyuEe1mcfPngWUZznCAlCSfaiSauKZeh7fEpCFKW1DSOZp4s+Ek9PkzbtiagGt
	djHbEwRtIzUagGCKp0g==
X-Received: from ejbse11.prod.google.com ([2002:a17:906:ce4b:b0:c12:6d92:3b02])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1b0d:b0:c12:67e9:bf2b with SMTP id a640c23a62f3a-c16b4799b95mr19191766b.40.1784256102996;
 Thu, 16 Jul 2026 19:41:42 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:05 +0000
In-Reply-To: <20260716230411.2767394-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-2-tarunsahu@google.com>
Subject: [PATCH v19 1/7] device_core: rely on put_device to free dev->p
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
	linux-scsi@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>, 
	David Jeffery <djeffery@redhat.com>
Content-Type: text/plain; charset="UTF-8"

device_add allocate private_data for device and assigns to
dev->p. If device_add fails in later steps of the function,
it cleans up this dev->p which is not necessary because In
the next call, put_device free it anyway (if reference to
the device is 0 which will be unless someone concurrently
get the reference to this device).

This avoids unnecessary races introduced in system. After device
is added in device_kset->list by device_add and later steps in the
device_add function failures occur, it will free dev->p manually,
while in between there might be a user of device_kset->list will
take reference to the device just added by device_add. and might
try to access dev->p. So relying on put_device to free dev->p
prevents such problem.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
---
 drivers/base/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..76ba02c26aa5 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2614,6 +2614,7 @@ static void device_release(struct kobject *kobj)
 	struct device *dev = kobj_to_dev(kobj);
 	struct device_private *p = dev->p;
 
+	dev->p = NULL;
 	/*
 	 * Some platform devices are driven without driver attached
 	 * and managed resources may have been acquired.  Make sure
@@ -3824,8 +3825,6 @@ int device_add(struct device *dev)
 parent_error:
 	put_device(parent);
 name_error:
-	kfree(dev->p);
-	dev->p = NULL;
 	goto done;
 }
 EXPORT_SYMBOL_GPL(device_add);
-- 
2.55.0.229.g6434b31f56-goog

