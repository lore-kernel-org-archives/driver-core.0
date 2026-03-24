Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E42364927
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 00:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312805; cv=none; b=cET1klaR7T83MJnuX/l8uMYAwqejIAMKpkQnNCroEL6U68FXovWAqnSCGhZsmlrZX7fYkYkk/SbITsNBASWGKhCK8aCayA0eFdn8th3wCsWn4GmVTuTknsoOHIyfB5v/tTpnW+NxQdQ1hqomJIFSi0otm2BUmdwDqcQJkkwK3GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312805; c=relaxed/simple;
	bh=Grx/pH7Whoel/08IPXs9sl4RENgf6azDLpfb9doS5b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r4AQ0y3LrrHvMoibb+AW6IH9V0VMOVpOLLgNKQwFum29yrjONB0Jh0V2SWD26MdBbBcjMHAgdDkqjJ3OMiCOPtqkBbwb8a/9/9Gs1t1lflnH7HYVyElYxEDE5LPbsQ1jUKWGJe6+2mPEwIKl5DFuAKu8rhVzqfWgQle6LkZhQ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oUjqHipc; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUjqHipc"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1279eced0b9so4821528c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774312803; x=1774917603; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwlsItIufp55QkDByiWcscZ/zHchruIpUll+4+d6xMc=;
        b=oUjqHipcT205z7mgqdXEX/rSY2FT5GbU7u9fdVvXo05bVlCbUXrviXml8kkucDAasc
         6l5fyV2CNHGQ8KH33GDv6DGeJROavwu9B4KKhPkWtftys3RvSosavXX6YWGocP0ocOJA
         Et/wQu4x+lRqjqraf0uHRCtp1POK8/hAEaBCfYkYSPjDDDjUn51rEnfVMpDdeeHEt1jQ
         ie4cMtRVkvf2Z/BO3P3bqnxupou/RZ/avcsVEtnD0Fbyf/FFrPjTATOnjmidSgbFzmc2
         /xedjwX5uguVgDen51kIcsItEOuKHs/1QtWLRUEGhBeaGMZkVkmyuqa2pIcTEqPbZCZg
         irlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774312803; x=1774917603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hwlsItIufp55QkDByiWcscZ/zHchruIpUll+4+d6xMc=;
        b=gwlgDSERRX+I6IhbzhrLJu9IOrp6DPpjFnAvYFO3MQ9da9FZ5mMpMFU9jWgSTG61yz
         wxd1Wmaffo4PZEv0XqGGmV/zWHBVvUi5LpbgCB1tGu1svlRbWLhWSKbI1BedQzqE1lRB
         F5H5ix5vatRSWmYxnym8ErSOmYQ3hEcTgNCP8Bil2JBnNYuyESrUhzRZd4Z6S8IaC1D2
         bThVNywu+O5H/3rwzca315LlxAnuInW4i89hu9xkYMPXZ3zPe9/uJBsEkj3jWysSRniU
         7dunOWkpxjIi/CZLiDQ8mYTNK3sP5319XVfDATR1uAjQtpKOcbgKvb0lMV9gY5mTTyFE
         Vcyg==
X-Forwarded-Encrypted: i=1; AJvYcCV7O9Ks0ZBEp+sQQwESultMM8P1FLuEJWv7TUPzgv+BcnF96tIa3J18/aGvbJeooDcsA7vP9cdwSne83A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhac+5sQS0Tqj+EAQirCiUP7z2H9nCOBDtvdVCjXFm02jvdS/w
	oHit7ove5P6rVmSPKByCSgMHMbDZ5sMJtb3L1+BGjxo10zFo4qGLhKqi
X-Gm-Gg: ATEYQzwQaQCDFmqIu6Z85qOKW+CPNdNMXz0M0wIM+zzicFxoidnZdK6FK4ySGw/9+HN
	YQDDlI4unBG7F51wfzoKO++gfMjxtDutK0+MzdM1HqWtVRwGW3l/0BRSYi5NBL2wKsAj+qKr0GC
	mczVDuaNlHvAYgnD81mRlTA2TuppHzQjsdUFnSW+RZ2NMNZMWzIqlM/PpSzDOK18O5nEwnL5pta
	g4rnTqhMFg2L1WeetoqO5etd+UwivWm1Oc0vDiBTNT6H8IHBQqKH4vxqJUGKbJRSqqeBN8n3/0k
	ZHQzW8/zmbLjPC6DiD0iBuxwJM2BN5Pmw4a91diZVDgifGGES7swOjCd+h/eq5eqrVMrquQCIVq
	Z+5WFoy/Y6q2kDXzL2TtYRqOwDefyz7B3KegRCPDn86ZLBBTp1rfZUsNcQxWjsjizd3lApU+SRM
	P4IWY5WDckOZbcu/RBEG3696htVUVRRwcmJtdWt3ZKkOjRQnKgB7IgQLfe7NGt6X0SjoMWyvw3E
	S2ziGnAd4VKmbg=
X-Received: by 2002:a05:7022:4590:b0:128:cf5c:535a with SMTP id a92af1059eb24-12a7268c7dbmr6052354c88.11.1774312802827;
        Mon, 23 Mar 2026 17:40:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b90dsm17543148eec.10.2026.03.23.17.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:40:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Mar 2026 17:39:39 -0700
Subject: [PATCH 3/4] software node: verify that property data is not on
 stack
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-property-gpio-fix-v1-3-9cb46e5fe7df@gmail.com>
References: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
In-Reply-To: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Hans de Goede <hansg@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 driver-core@lists.linux.dev
X-Mailer: b4 0.15-dev-a6826

When registering a software node, ensure that the property data is not
located on the stack, as it is expected to persist for the lifetime of
the node.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9..45c319a08eb6 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -16,6 +16,7 @@
 #include <linux/kstrtox.h>
 #include <linux/list.h>
 #include <linux/property.h>
+#include <linux/sched/task_stack.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -917,6 +918,7 @@ EXPORT_SYMBOL_GPL(software_node_unregister_node_group);
 int software_node_register(const struct software_node *node)
 {
 	struct swnode *parent = software_node_to_swnode(node->parent);
+	const struct property_entry *prop;
 
 	if (software_node_to_swnode(node))
 		return -EEXIST;
@@ -924,6 +926,13 @@ int software_node_register(const struct software_node *node)
 	if (node->parent && !parent)
 		return -EINVAL;
 
+	for (prop = node->properties; prop && prop->name; prop++) {
+		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
+			pr_err("%s: property data can't be on stack\n", __func__);
+			return -EINVAL;
+		}
+	}
+
 	return PTR_ERR_OR_ZERO(swnode_register(node, parent, 0));
 }
 EXPORT_SYMBOL_GPL(software_node_register);

-- 
2.53.0.1018.g2bb0e51243-goog

