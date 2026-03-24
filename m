Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8AD23B62C
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774327619; cv=none; b=ByFedLguwik33ar/GbLYG1RagmERm46znjdxGIxiGYXQJpnV71NHageETxEMrYZVgNTz+J/adAT/oZvxe3oBUoXxh6ctQjiPMAq1dAQ5mSdXJqlVie+AeJNy6dw4jOpR6X+SFhFDeXBci3x/i2sbdmEZFrO4vm3zE6SfdjzpNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774327619; c=relaxed/simple;
	bh=S4LmDD5N7YorWQUk0CYhBh+UXavWKeyPWNH2i6t9Gjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7NqiXAIABhwORz/xKCKg/FVFe13DLnqPsUNGHlgzybsNaWVAI4HMKlCVcGUZkEcc7QIpLhm9ySPIQTGMBDACm0i5aN5UcRVX/n18l/B0ZnC9DldaLtD+lbhSzMCa/69iaG+nJyNuvYqpqizDAqP8zwPzsaJ0oGFu4A4VuNArYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtICBFa3; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtICBFa3"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c1092cc08cso1870720eec.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774327616; x=1774932416; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4n4yln5k8cNFTolCtaKAVbNlkFjgerksTIKyF55kf7g=;
        b=OtICBFa3AuuXVyjHACc6+kOLXZnWCtilwHJEFxNReAPpnqBodSMG8HVxsQDbynlcer
         S6LeuoLyExYEfe15kw6uI3FeYcQB9IKUiepAMnuZ+jUeInozGz23OmVTMsZtsEY8ZG70
         S3SMlMggTgNHebAfuMPVrd/6nG1GHZxsgqTi60NtPglndkbM3sOaA0VlGTvT3C4fUEQK
         5xQy7jNUrN9OGISw5Rs9wXlSSdGeIOA5F8+rxcjRYBeaSGN2QRTU89bDJb31xONgX3Qp
         moRNHFe0aLsELafjMVzQHMY/55iD58QK5kfuwqa+y4qjgU5xC+R83K3/U1yrgwyKjBLB
         4JeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774327616; x=1774932416;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4n4yln5k8cNFTolCtaKAVbNlkFjgerksTIKyF55kf7g=;
        b=Atz3zmLoTsz2fho1YH8dOkLAwK4sSBhxrPikBWsbKDLbMkO7j13Dx2nIAUa1bQaMSh
         usVCvuZoJKk5l3J12I899xaoMxZO9ErNyYkp7GnHu/lZckaaAtxyrHvrnsTWVmc6wIeb
         lqYddU9/L+ml39SeFrHQKqRck1Jh8IzcUrqSOIDgUfe0GNX7xZTyqBV1SR8MrTrpM3K6
         u6dYlLX2zr/GDcYrDv3oET3ofC2oIhuoCGcj2X5xjNBwJLyFOJPWFqk1OeE69aDYN/cX
         tCP1UUsaYHkDk1j7A17E/DVKVAush0AsUWqurmCAY3NAu6RBlMuFMx312ididyctP42v
         q4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHwXjM+byvfYb+fpMUqsj0Uju9BqNVdmCYvs3wXtk7UxjV+cptxIhYOHUdA6ddrkxmDouO/p2xyBbIkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvyGZwTgwYtGBENsWT7OyVOW6JjePb4DqhaiXDUYnxx0ocSlaf
	up+09l9Psgp7qjqv4SgucaYwtl5oLYCpsvUo6ajUN31YVT4ezc9hXODd
X-Gm-Gg: ATEYQzxo4Q6FT2wnD/ev6HPpiiyFsTWkPfDaU2R2eCkoTsLvYdSe/Bb6KotOQ5qWe9t
	z1yDj39E/DZ7zC8DgtS8aGLMeJdiV16JhYZ7PoDQ6kx8Z57VvtIud+ixrsGS2ZWnVE1f8aqIUtc
	+vpPVzEFYz0vH29Ay/U3FH6CfMMo7/GI5GGtfLah9IkNBi1+dWihToD20HiJ0LQ1PKt8c6RNvjl
	PczPUTffGIos1E3M+8qgv0HCJT5QVmfrvJDFPoshrBi7em2cMYAopDZLFFQobTR2Gjuvd2S7ID1
	l4H5LPCFIoaIilPX5tBX9mzY2qo6+X/RkMc6EjhSQJC6Z0l9SgWtAFgNaa0BVahCjb3fOqPpA9R
	CZTfuOnhu3oQVe9KYcqxL9G/q5FVpOkmKujeVRyOullriQAmHeHbTrp/AalisCvE2O1toKpLOve
	GVHN2p0SsSBc7xysmlvZm2LSt4d/QB7oe7XH7XYbIe6OoHGczTTMIlpDTmyUcZK42Avulz7TSG5
	pg=
X-Received: by 2002:a05:7301:3f07:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2c1095f867cmr6583342eec.8.1774327616075;
        Mon, 23 Mar 2026 21:46:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm244833eec.2.2026.03.23.21.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 21:46:54 -0700 (PDT)
Date: Mon, 23 Mar 2026 21:46:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] software node: allow referencing software nodes by name
Message-ID: <acIV6xF8mY-8wd5e@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Currently static device properties references require either an
instance of software node or an instance of fwnode_handle to be
available when defining a reference property. This may not be very
convenient when device node is instantiated from a different module
(which is usually the case).

The original implementation for describing GPIOs using software nodes
worked around this by creating a detached from gpiochip instances
software nodes, and performing matching using gpiochip label and node
name. The gpiolib maintainers rightfully questioned this approach, and
currently recommend to attach secondary software node to gpiochip
instance, export the symbol, and use it in board file when instantiating
static properties. This unfortunately results in tight coupling between
gpiochip drivers and board code, necessitates creation of header files,
requires adding Kconfig dependencies, limits options for choosing module
vs built-in compilation, and alters device initialization/probing order.

Solve the issue by providing an option to use software node name in
place of the node instance when describing reference properties. When
evaluating reference driver core will attempt to resolve the name to
concrete node instance and, in case of GPIO references, will use
identity match on firmware node to locate corresponding gpiochip device.

This approach has a drawback of needing to know name of the node that
gpiochip device will be using, however benefits (minimal coupling, no
need for adding dependencies) outweigh this drawback.

To deal cases with software nodes not being created or registered at
time of look up, assume that the node with matching name will get
registered eventually and return -EPROBE_DEFER in the meantime.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/swnode.c    | 25 +++++++++++++++++++------
 include/linux/property.h |  4 ++++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9..9903f252d1d6 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -510,7 +510,6 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	const struct software_node_ref_args *ref_array;
 	const struct software_node_ref_args *ref;
 	const struct property_entry *prop;
-	struct fwnode_handle *refnode;
 	u32 nargs_prop_val;
 	int error;
 	int i;
@@ -546,12 +545,26 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	 * relevant properties and bump the reference count.
 	 */
 
-	if (ref->swnode)
-		refnode = software_node_fwnode(ref->swnode);
-	else if (ref->fwnode)
-		refnode = ref->fwnode;
-	else
+	struct fwnode_handle *refnode __free(fwnode_handle) = NULL;
+	if (ref->swnode) {
+		refnode = fwnode_handle_get(software_node_fwnode(ref->swnode));
+	} else if (ref->fwnode) {
+		refnode = fwnode_handle_get(ref->fwnode);
+	} else if (ref->swnode_name) {
+		const struct software_node *ref_swnode =
+			software_node_find_by_name(NULL, ref->swnode_name);
+		/*
+		 * When using a name instead of a software node structure
+		 * assume the node will appear at some point.
+		 */
+		if (!ref_swnode)
+			return -EPROBE_DEFER;
+
+		/* Reference is already taken by software_node_find_by_name() */
+		refnode = software_node_fwnode(ref_swnode);
+	} else {
 		return -EINVAL;
+	}
 
 	if (!refnode)
 		return -ENOENT;
diff --git a/include/linux/property.h b/include/linux/property.h
index e30ef23a9af3..44e96ee47272 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -363,6 +363,7 @@ struct software_node;
 struct software_node_ref_args {
 	const struct software_node *swnode;
 	struct fwnode_handle *fwnode;
+	const char *swnode_name;
 	unsigned int nargs;
 	u64 args[NR_FWNODE_REFERENCE_ARGS];
 };
@@ -373,6 +374,9 @@ struct software_node_ref_args {
 			   const struct software_node *: _ref_,	\
 			   struct software_node *: _ref_,	\
 			   default: NULL),			\
+	.swnode_name = _Generic(_ref_,				\
+				const char *: _ref_,		\
+				default: NULL),			\
 	.fwnode = _Generic(_ref_,				\
 			   struct fwnode_handle *: _ref_,	\
 			   default: NULL),			\
-- 
2.53.0.1018.g2bb0e51243-goog


-- 
Dmitry
