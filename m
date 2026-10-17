Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC443E49B
	for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247315; cv=none; b=jam2m5uvoYlg0ANewY3TB/YNC3uH9anRzQJaCDIdeXDSsb57IIPZzZr1HZ7BJ9dP/CsB2iHvDGF2T3s3attXbPKAydN8C3RgOdHPPJVKfw/z3FOCkHFf/PjeMZiXzOxhXYztOcp1miX61W6qqVZEwZX/1Sf9GuY4sRot59e8wQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247315; c=relaxed/simple;
	bh=KFgv3Vu+tnqvpaQP51JkR+LVi8r9HPxQcQulwSHgR/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=EKVJ6MEgcYLSfz01KFDEzQrCwkh8tEabX05yNPM0DpER0bMQUm+dDWYatmEIPATCZEBxJBxnh1NDp7lXKAuGFf2frx2yiOHFuZ5ysL1nar+QmnOCRY9BwTBGBR2Un9FGeaPRMNbYZdCqNw+7iJPPu2E2xS11xDj4HrTH2VyVtUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D65wYHT1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D65wYHT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792247312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=577UK/IrfP8S3LuMeyMt+iZan45Tovhf520l9SlBMbs=;
	b=D65wYHT1at++/TSjCLhhraFSec0VTs74sYULunMLe0AiXsKUJe+EyFIsYt2g5FK1GvU3BW
	NesYwfobzOSe9s/b36JrFY9ewFrzXSFXbzeepVC8lf7QxeTtNK594OqD0kxuN94q5aG/gW
	r95Pt+Pdlf5LRrDCxrqf+308udCinMY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-mkBTTil_MRmFqwCbnnc-qg-1; Sat, 17 Oct 2026 14:28:31 +0000
X-MC-Unique: mkBTTil_MRmFqwCbnnc-qg-1
X-Mimecast-MFC-AGG-ID: mkBTTil_MRmFqwCbnnc-qg_1792247310
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48589603501so507361f8f.3
        for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 07:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792247310; x=1792852110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=577UK/IrfP8S3LuMeyMt+iZan45Tovhf520l9SlBMbs=;
        b=AJIkUEaW5PcZmw765HiklnAzrH0HdeAUbJ6Avv/MyUIznXBM7VdXN/tgFVR7EU3J0T
         XAoEXTig/MCu8vrKnsnWFoIyc5IXtZEW9N6BHS+8kJkk7skWtNp6lr0mAxfQpJsL8cDw
         httWoKLvUHpaf/nIq75Q9XhE9YSDvj7etQOHNtteNJHNIY8q6tO8uJllXLOuk6pgk2vz
         q6aM7JW/Agc9BZAEMuYAdeuDKy1eck9Sjy+H95j/jsKT40NG/TUSeyWRwzawEQsckutJ
         Z/FRy+UbJDfEzh4pNYfg6UM2oGVBOxJeI5SuzPp10NXhCnNHTHXFaeBvdIcZuT6lgXae
         Yd0A==
X-Forwarded-Encrypted: i=1; AKwUvBze64T0SYNBHVqlzHEEoqzDp8Mj4huh7LjbDQ4imPKQg3JaOL2BJdp0IUN2U9WJYj6ZFt3rnzGPeOytjQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3HVnzqpmWycPFaL6r2D65klLgygZLHWMEdAnBIucQYeH5ycXT
	szmmWiZTavM6sbW1rTmmyNXWn32SqT4Qs5SnjaKcFlFgX7VzfIeu9tQnL161GNjK1fgy+uMLmSo
	qjMbLBCaR0y+jPf/0iI6akAyvxc3uGYaqqO6SFJ02UITmVtDhdNqKP4+Ktko0VyN6
X-Gm-Gg: AYBFou2CdvwKaFxbRtNXc1sPVZHwSEN+ijVUiiQNs7M+bVqU87qSFndJbiKgmVSeT/v
	Tpz05Lpq/Te7VV0npyojobHT2cbJ++S5llVyAdadwD8mm9DR3nvkQ+oCvFmYYrMFmTUIzxdHMVe
	317iWH2WC7Q7NDzXQ3gOgNqN9W1KSyoZnPXbMaz/snqOPg731HcIYDVyeiJPFGMnUtsxBpip9vU
	FZ4IW+Je+BIPiBjy5xvRN+gNz73rbpqQEjjC909gKaV+HMCbrTfXPR84MliHRVqxXymI6FUQ7Pz
	cBrxyNsck3l4ajr6tK0kn8L2HlJTrc+tFm309EnrT2GQaSeKueLPG5j8WX8K5T2rEOTKgGM5jhm
	FtlUyrBvcrBqBUD5XbUpQnrur
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr62939635e9.4.1792247309972;
        Sat, 17 Oct 2026 07:28:29 -0700 (PDT)
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr62939115e9.4.1792247309522;
        Sat, 17 Oct 2026 07:28:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d97b7bb9sm27107205e9.0.2026.10.17.07.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:28:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	driver-core@lists.linux.dev
Subject: [PATCH] firmware_loader: Expose requested firmware names as sysfs entries
Date: Sat, 17 Oct 2026 16:27:33 +0200
Message-ID: <20261017142826.2668881-1-javierm@redhat.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Am0op-F7MEAGwOx8bDfl_bQ8jaAyyBncVUz5LUEjqbU_1792247310
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Most initramfs image creation tools (e.g., dracut or initramfs-tools) have
options to create initramfs images that are either generic or tailored to
a running system. For example, dracut has the --host-only option for this.

That option allows to have a smaller initramfs image which only contains a
sub-set of the kernel modules, libraries, binaries and configuration data.

One thing that can't be queried in a running system is the set of firmware
names that were requested by the kernel to support the different devices.

Let's expose this information as sysfs entries to allow initramfs creation
tools to determine the set of firmware names that are needed by a system.

On an AM625 BeaglePlay board, the following will be exposed through sysfs:

  $ grep -H . /sys/class/firmware/requested*
  /sys/class/firmware/requested0:powervr/rogue_33.15.11.3_v1.fw
  /sys/class/firmware/requested1:ath3k-1.fw
  /sys/class/firmware/requested2:regulatory.db
  /sys/class/firmware/requested3:regulatory.db.p7s
  /sys/class/firmware/requested4:ti-connectivity/wl1271-nvs.bin
  /sys/class/firmware/requested5:ti-connectivity/wl18xx-conf.bin
  /sys/class/firmware/requested6:ti-connectivity/wl18xx-fw-4.bin

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../ABI/testing/sysfs-class-firmware          | 19 +++++
 drivers/base/firmware_loader/Kconfig          | 14 ++++
 drivers/base/firmware_loader/main.c           |  2 +
 drivers/base/firmware_loader/sysfs.c          | 75 +++++++++++++++++++
 drivers/base/firmware_loader/sysfs.h          |  8 ++
 5 files changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware b/Documentation/ABI/testing/sysfs-class-firmware
index 44ca1b78a0e1..bae9d4bca0fb 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware
+++ b/Documentation/ABI/testing/sysfs-class-firmware
@@ -75,3 +75,22 @@ Description:	This file supports the timeout mechanism for firmware
 		fallback.  This file has no affect on firmware uploads. For
 		more information on timeouts please see the documentation
 		for firmware fallback.
+
+What:		/sys/class/firmware/requestedN
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	driver-core@lists.linux.dev
+Description:
+		Read-only, each file contains a string with the name of a
+		firmware that was requested and successfully loaded via the
+		firmware loader. The N number is a monotonically increasing
+		integer starting at 0, assigned in the order that the names
+		were requested.
+
+		The entries are global and deduplicated, if multiple devices
+		request to load the same firmware, it will appear just once.
+
+		Entries are never removed, so they represent all the firmware
+		names that were requested since the system booted. This list
+		is useful for user-space tools (such as initramfs generators)
+		to determine the set of firmware required by a running system.
diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
index 15eff8a4b505..368aa8289d4f 100644
--- a/drivers/base/firmware_loader/Kconfig
+++ b/drivers/base/firmware_loader/Kconfig
@@ -221,6 +221,20 @@ config FW_CACHE
 
 	  If unsure, say Y.
 
+config FW_REQUESTED_SYSFS
+	bool "Expose requested firmware files as sysfs entries"
+	select FW_LOADER_SYSFS
+	help
+	  Enabling this option will track the names of firmware files requested
+	  and successfully loaded by the firmware loader. Each requestedN file
+	  under /sys/class/firmware/ contains the name of a requested firmware
+	  file that was loaded since the system booted.
+
+	  This information is useful for userspace tools (e.g. initramfs image
+	  generators), to determine the set of firmware required by a system.
+
+	  If unsure, say N.
+
 config FW_UPLOAD
 	bool "Enable users to initiate firmware updates using sysfs"
 	select FW_LOADER_SYSFS
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..409b6274156e 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -909,6 +909,7 @@ _request_firmware(const struct firmware **firmware_p, const char *name,
 		fw = NULL;
 	} else {
 		fw_log_firmware_info(fw, name, device);
+		fw_add_requested_name(name);
 	}
 
 	*firmware_p = fw;
@@ -1736,6 +1737,7 @@ static int __init firmware_class_init(void)
 
 static void __exit firmware_class_exit(void)
 {
+	fw_requested_cleanup();
 	unregister_fw_pm_ops();
 	unregister_reboot_notifier(&fw_shutdown_nb);
 	unregister_sysfs_loader();
diff --git a/drivers/base/firmware_loader/sysfs.c b/drivers/base/firmware_loader/sysfs.c
index 29a10d2ad537..0bc603d0d10c 100644
--- a/drivers/base/firmware_loader/sysfs.c
+++ b/drivers/base/firmware_loader/sysfs.c
@@ -423,3 +423,78 @@ fw_create_instance(struct firmware *firmware, const char *fw_name,
 exit:
 	return fw_sysfs;
 }
+
+#ifdef CONFIG_FW_REQUESTED_SYSFS
+struct fw_requested_entry {
+	struct list_head list;
+	struct class_attribute_string cas;
+	char name[];
+};
+
+static LIST_HEAD(fw_requested_list);
+static DEFINE_MUTEX(fw_requested_lock);
+static unsigned int fw_requested_count;
+
+void fw_add_requested_name(const char *name)
+{
+	struct fw_requested_entry *entry, *iter;
+	size_t len;
+	int ret;
+
+	mutex_lock(&fw_requested_lock);
+
+	/*
+	 * First check if the name already exists in the list,
+	 * each requested firmware should be present just once.
+	 */
+	list_for_each_entry(iter, &fw_requested_list, list) {
+		if (!strcmp(iter->name, name))
+			goto out_unlock;
+	}
+
+	len = strlen(name);
+	entry = kzalloc(sizeof(*entry) + len + 1, GFP_KERNEL);
+	if (!entry)
+		goto out_unlock;
+
+	memcpy(entry->name, name, len + 1);
+	entry->cas.str = entry->name;
+
+	sysfs_attr_init(&entry->cas.attr.attr);
+	entry->cas.attr.attr.name = kasprintf(GFP_KERNEL, "requested%u",
+					      fw_requested_count);
+	if (!entry->cas.attr.attr.name)
+		goto out_free_entry;
+
+	entry->cas.attr.attr.mode = 0444;
+	entry->cas.attr.show = show_class_attr_string;
+
+	ret = class_create_file(&firmware_class, &entry->cas.attr);
+	if (ret)
+		goto out_free_name;
+
+	list_add_tail(&entry->list, &fw_requested_list);
+	fw_requested_count++;
+	mutex_unlock(&fw_requested_lock);
+	return;
+
+out_free_name:
+	kfree(entry->cas.attr.attr.name);
+out_free_entry:
+	kfree(entry);
+out_unlock:
+	mutex_unlock(&fw_requested_lock);
+}
+
+void __exit fw_requested_cleanup(void)
+{
+	struct fw_requested_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, &fw_requested_list, list) {
+		list_del(&entry->list);
+		class_remove_file(&firmware_class, &entry->cas.attr);
+		kfree(entry->cas.attr.attr.name);
+		kfree(entry);
+	}
+}
+#endif /* CONFIG_FW_REQUESTED_SYSFS */
diff --git a/drivers/base/firmware_loader/sysfs.h b/drivers/base/firmware_loader/sysfs.h
index 1cabea544a40..6ed79ad7f6c7 100644
--- a/drivers/base/firmware_loader/sysfs.h
+++ b/drivers/base/firmware_loader/sysfs.h
@@ -115,4 +115,12 @@ static inline void fw_upload_free(struct fw_sysfs *fw_sysfs)
 }
 #endif
 
+#ifdef CONFIG_FW_REQUESTED_SYSFS
+void fw_add_requested_name(const char *name);
+void __exit fw_requested_cleanup(void);
+#else
+static inline void fw_add_requested_name(const char *name) {}
+static inline void fw_requested_cleanup(void) {}
+#endif
+
 #endif /* __FIRMWARE_SYSFS_H */
-- 
2.56.0

base-commit: 902fdc5e6662a96de71887ce4c2a591231aed82d
branch: add-fw-sysfs

