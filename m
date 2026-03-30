Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB856392801
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774837683; cv=none; b=luXcnV//sNEMcSZF2I57fc8rgvdmscjlkgWrxyewNAQJGnw2hySlloteoKiYJdVgJjb7jJai8qzeyngdi6+hcV2tA+00aEwV9w+2dKLLpbVZbZY5Sju88sweOg9dKbhk31Sen3cZIdEvZCtrBztGmUVO9ZzVRHNb73YcHdZ7pXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774837683; c=relaxed/simple;
	bh=bFqZrxIa+wAz0ne9hpWyd8utebsvCUq3EVc4FZvgjF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yz+yCYMjXOuKq+dsDa8dZadjs9R2qn1HBj26jJDMshUFXAQLauVNUo1vobha3ozRYVnL9SuMqJ2rdWJGQaAnXeqPFJ3JHwYITfh7Z5mxoJNWrkvcXrETPi23GhonzLB8Km5cujqDkL4M9nlxfKRzUfGOS/mX3OSa6nRePYxsue4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVU8rcBg; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVU8rcBg"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4254497eec.0
        for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 19:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774837681; x=1775442481; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zqs1uUluer6Mf+lCXT25NfqzHgsGQt/gWHHebQbC4Q4=;
        b=QVU8rcBgs0fr97OFl6rajEjIw883Z8qjBvrQf8o4V5UrcAOlfMcS6uFiuUX1djPDfz
         lZRp769wB1IsOSali6wGzXd54U6tlXUcVll6e74jaIYC4pie5E373NmoG30I+WLqg8dy
         7Q4hIlqqh9JMPa35n/9jrV1zVa4rzU+h823ingiB9iRuuiOWqTaTaaPbANIAEKTmPoGX
         b/crfCNh1fyRVB1FX9W7F6ddWJAjbxuBPBw9U6MCfGDp4vPhtyg/EO+Qxu+x1RGUlJhv
         5W8tPUZDuuloVNiSFQV29+k+2X6QhYoG46Z1IgUQb81TySGZEosL8FQrQgd4MQ/9LfSZ
         aIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774837681; x=1775442481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zqs1uUluer6Mf+lCXT25NfqzHgsGQt/gWHHebQbC4Q4=;
        b=IaiHOPjMObYO1b4tnHjfAKCvTKSY7FVT2lJcNUfTfYwG9FF0b5msPimC4LIzA39IAC
         zCCf1kRbodj7B2CdWAC1GkMOoaa0d8jXbVTe5DrA9fcKsddQd1MtCcUesjfKzP9t/lSF
         N0abZz6sYGv6+j47y1Ce3oGgl+USmcBNi1wgopfoK92uZkU/Zabj3/PKAvZfFwa80HHj
         pcqJ0rQPuAgizcF8ROZL4b/6hzTip9WDDjKu2/8b0Hjni1sHzYjxsrwRuQENG0oBmqHZ
         7BBZ1Qj16d9Gzm/qCmUBTybXVAY1qIlwun5sz0BJuMKfO3KPakx4zQvsBtDWzOCYJYLx
         twVw==
X-Forwarded-Encrypted: i=1; AJvYcCUiPdM5xBV4VM/vDbW8thrfyLqSFaPwy1cnJqGpUSPPw6rtR3czxgYaf081NC9BYwv1fGWagPprVZo5wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMuOEv9t/fBn0OrNqZ7AcsKLDgng8yRdn3QeFVKw+m7bWlDcIf
	Y9mQEwanlA7MTyYgeScqX6ywM1rTtCadVdOZWBUqKdFi21Vwl8LWUOry
X-Gm-Gg: ATEYQzxeHC5z62jF5JdCmA69MHc8RCqqe1hrn+DMpW7vFk9lF/cE6ESlDYGM/f673jV
	RPTwLYmHbqbiVkQxZj/yzlUe9/6cjjs4YVwXk3AlD67miSDci0g6VOpaELK3D9k400PVha+44kr
	AJP2hDZWXkRLq2rVUv7qE4Z0GeCfXwaWX2xF3lSs7/4IqGxe/wuG4BEZeZt7KRde7M90vMN0/Qt
	WnOKmPSb8uf++CvdvXeYCLIgSzeAWAag61hnoohRV3VEMQ5z2mBvLJlpve3xb/fdoBoJKlqLFpH
	y+etA+8ZzT9zRcD04O8ENxnHbrfcAo2TdMd3Ipy9TQZKq0kHAE7xG8S4deAZB7l2sHjvoMy2faz
	GyHBLnvGH4Xl6w4Xkrdm9DdG/muu4TwkIUKLiQh9G+aR5QQZvq+fjwF8I1NOnDA13Ii+fN5TqAA
	zGkr4WlKfAMWPNokuyUV376paAf4tyfRQgNaRMxgKW780xgvrwEAXVRrefg48OiPyIU69IphaFH
	FizxKxxIKL67yY=
X-Received: by 2002:a05:7300:b58a:b0:2c5:d833:a4f3 with SMTP id 5a478bee46e88-2c5d833c673mr1330554eec.18.1774837681020;
        Sun, 29 Mar 2026 19:28:01 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm6250673eec.30.2026.03.29.19.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:28:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 19:27:50 -0700
Subject: [PATCH v2 3/4] software node: verify that property data is not on
 stack
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-property-gpio-fix-v2-3-3cca5ba136d8@gmail.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
In-Reply-To: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
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
 drivers/base/swnode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9..286eab02e8fb 100644
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
@@ -924,6 +926,14 @@ int software_node_register(const struct software_node *node)
 	if (node->parent && !parent)
 		return -EINVAL;
 
+	for (prop = node->properties; prop && prop->name; prop++) {
+		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
+			pr_err("%s: property data can't be on stack ('%s')\n",
+			       __func__, prop->name);
+			return -EINVAL;
+		}
+	}
+
 	return PTR_ERR_OR_ZERO(swnode_register(node, parent, 0));
 }
 EXPORT_SYMBOL_GPL(software_node_register);

-- 
2.53.0.1018.g2bb0e51243-goog

