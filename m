Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296663;
	b=o8c8o+MI2KT9RPQcV8i4N9hGP3l9C6k34cnPkpJLUtuYCGgqSA/mxVuflpMtCXyvswRI
	 bk3QqGymlr3cV/POXTjnjUzVwyJpZd+aIkkSGrIN8zYzBMhvUpPpMMLFKquXX56Qm/EYh
	 3gEVG39hrms3eKk65kqQl1gP6Bi+BT+zOdO27rJQ+C5ft5PJnZzrXhwNxJmNqGise5OuM
	 +Z/hD9o2lin7Xri2vBCxoZNExFYK+NDwMOth8jxVoni5qv/Y7rcFpaADGm+VpX3v0Yv4E
	 ASfpvCep2blkPmofPQyJtbOUjCvwjx/hSWVTkQ/sRsegm2/ACBFnJZg9yhhtc5154LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
	b=y9nNZrWsO1jRu+9gyIzEvvcv1mpAjWvg+LQLwxQq75z8kkKDS7WaWr+/0RXFMFuK8ifP
	 qXLSYoJrfo1qTvseDhmTMz8qZk7Pbia6D3R2cU7NgkNr+H5w7199xu5I4WcauizicmQjV
	 aaGpcfZJp+73cHEe/QLTULzEci/wf1c0vhKRP0i7YBvOflljznrPxauBYL0u9lXZP0/20
	 c4i23GeryTNb3K14Yn8rGfLHW97ThrEiexh+O/6LQJ8YkM6En5dHb+aI3SFE9PxO9yBFT
	 gttKBu/aoBDs8CY+jph0JlIqzYiyTGE2OV/Yo0vwZdJr1B7H/4FctnQPr+EKxzdSeZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2DOKlMw;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AC60A2602
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 07:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C2AC60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2DOKlMw
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec2cc397aso942262b6e.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 23:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296662; x=1794901462; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
        b=a2DOKlMws5gNgHJucHG507AYKe3+qrvQro9b9Xq/AbuCut8G29J67xGG2X4F5PYFoT
         zpmhhIlEvevI8yItsg6KR+YQ8lTf5/I5wOx76iIIJWgJIm9OcXgfJBFWQi2BfWEtjxPG
         0HqOYbghWBRE3J7XgrGtbIMbl7NQh4cCr34Sa/t8X+M5aclHAEJY1fYq6Gm7it0s+oNP
         ALbCKi/aG8YKdxuPYRKpLdGL9zqIINYAPCmc8kgsFJCzUeXGOYuuRAIk6WYpIlmJoIcj
         7Jk+A9fCH5YiWcgzXLiE4d2He06g8BZybozrJEMompHSCDEghQBr2A/t+vwVgd43Oc9j
         ZlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296662; x=1794901462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
        b=ccIWxMrSQ1QdCCnFIetXH7IhaZr9gAOX7bDuAwnflhoP0H2k93MjgEp8nhHiQr6OLg
         EDnHCS2/l1IsO+Br83Ut9ymVBBuYrndbqlifJaNRtMYr+LRp9R64P1/sPiv21Gw5U/iT
         FJE6dnupBCMniS5ET05EWkmWOle+6oKf2bhlqFjFageMAim0xrn5srfWFMAUUyfBXe/y
         eilFkv/2I9UcdyUWbVMK8/q6IMAmMabqdCQyAbahtXQPS0sAKIR+QWQUz4+T2EjXV3Bg
         0tIoPXuzb7oifIXpScO+b1L4AzjKS2H8poUA+xiciaDQ7zYufcylobJtbwkjEB/rGWdo
         d7eg==
X-Forwarded-Encrypted: i=1; AL+hErGcQRHjVA/d8Dn2ZgTaGuuTCcRAIL6kqLqZVVfjGw0Skn17XsVXzq5P8mhwaMD8IYR1dwMPX1d10KwLmg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3xR1/CMqlk08HqxmZami/e5iZavIR6/LkO7SnsrG9D4LO0NPg
	f9UA3ZgiJ6KffLAJK7iKP4ws89cWJefPD+dDLOSprOzf7nyOE+HBLs5n
X-Gm-Gg: AYBFou3Qb3RUlXmPCvVcZSkrB388OCTupFWmsFESLljbprOvuXmnxjj8ZI9nmRJV9RR
	RsMkmyoRcQR7Rm0WUJY+r0XHJLb+zcFaTnuTPMu+OxHZM7Zn4XHkHSXgDC1FBGF5ovtJ9Nq2OrZ
	RvNC6t91vVf3g6mZTaRaBSFWo6jdXqOZtqZKmf5IB6MjbYm/EnHImGpry7e3hyiNYY3EnVNL8iH
	2QrCzLPWgkYlkn8n7Uaj8BrzKOkCFgDBnZSYaxefPNJArS0mK0QalOTaoENmfgvtlBYMLO4k+2x
	fZGLJRpj0uwA4o17d8besqGlaV59aLZHUfR6AqZjfgHmYRvDrWe+vhM8SRK0qQJLACD5DOPJxe5
	c7+ZkwV9QBea6Vn6yTH4pyrOof5rrF1ZnXALFdHjqy17t+HwqdXB28MpjciVM3XeBzgWr6stFz1
	4fdt03RULmW7E8emVKo8Av+9McND9HZg+88yWd0509mwo39f+xCECvXliYheymozbn25XxVtIRG
	9FhvlGrhxXkZuDOIrtVvVDNyZ0BmBl7gGe2MReVfowvrO9S5mUM0/Jy6erajcz/UEiMa+90OnNn
	RLlzv1cw0wUz+MZFxjVqFF44IasvUtAV1D/eOEE7R+O9ezfaNBrjsV45ZVV7ld7qa7UkvNR1BHi
	Y6iiCPmmMAYdHuMtTnVltg67ijTuB4vPjKcSVELvkeSse183qiAn7+Fv9Tabviej3t0FMawrJx4
	dfFY6pnY9GQtK/f5y1zQr0G4i11tptRbqtQM62ZVDF5AdInec78GCC
X-Received: by 2002:a05:6808:159c:b0:549:ef3b:1a90 with SMTP id 5614622812f47-5683ce4a928mr1595474b6e.54.1794296662184;
        Mon, 09 Nov 2026 23:44:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:05 -0700
Subject: [PATCH v2 02/58] driver core: retain the owner of device release
 callbacks
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 driver-core@lists.linux.dev
X-Mailer: b4 0.15.2

Device references can outlive the driver or subsystem operation that
unregistered the device. A modular release callback needs its code to
remain loaded until it returns. Dropping its last module reference inside
the callback permits concurrent unload before the function epilogue has
finished.

Add an optional release_owner to struct device. device_initialize() takes
the reference before the device can be published. The built-in device
core caches the owner before invoking the release callback and drops the
reference after the callback returns, allowing the callback to free the
device itself. This also covers initialized devices that were never added
and device_add() failures.

MTD will use this to keep its release callback available after retained
device references outlive driver unbind.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/base/core.c    | 9 +++++++++
 include/linux/device.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..03f8bf69219a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2617,6 +2617,7 @@ static void device_release(struct kobject *kobj)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct device_private *p = dev->p;
+	struct module *owner = dev->release_owner;
 
 	/*
 	 * Some platform devices are driven without driver attached
@@ -2642,6 +2643,7 @@ static void device_release(struct kobject *kobj)
 		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
 			dev_name(dev));
 	kfree(p);
+	module_put(owner);
 }
 
 static const struct ns_common *device_namespace(const struct kobject *kobj)
@@ -3225,11 +3227,18 @@ static void klist_children_put(struct klist_node *n)
  * approach is to use kzalloc() to allocate the structure containing
  * @dev.
  *
+ * If @dev->release_owner is set, the caller must keep that module loaded
+ * until this function acquires a reference. The core drops the reference
+ * after the release callback returns, including when device_add() fails.
+ * A module whose initialization fails must still drain its devices before
+ * returning the error, since module references do not prevent that unload.
+ *
  * NOTE: Use put_device() to give up your reference instead of freeing
  * @dev directly once you have called this function.
  */
 void device_initialize(struct device *dev)
 {
+	__module_get(dev->release_owner);
 	dev->kobj.kset = devices_kset;
 	kobject_init(&dev->kobj, &device_ktype);
 	INIT_LIST_HEAD(&dev->dma_pools);
diff --git a/include/linux/device.h b/include/linux/device.h
index aee79fd6b32b..cd39ebf47ee7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -683,6 +683,9 @@ enum struct_device_flags {
  * @release:	Callback to free the device after all references have
  * 		gone away. This should be set by the allocator of the
  * 		device (i.e. the bus driver that discovered the device).
+ * @release_owner: Optional module containing the release callback. Set before
+ *		device_initialize() and leave unchanged for the device's lifetime.
+ *		The core holds a reference until the release callback returns.
  * @iommu_group: IOMMU group the device belongs to.
  * @iommu:	Per device generic IOMMU runtime data
  * @physical_location: Describes physical location of the device connection
@@ -787,6 +790,7 @@ struct device {
 	const struct attribute_group **groups;	/* optional groups */
 
 	void	(*release)(struct device *dev);
+	struct module		*release_owner;
 	struct iommu_group	*iommu_group;
 	struct dev_iommu	*iommu;
 

-- 
2.53.0

