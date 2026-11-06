Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955449;
	b=gj7rOGFZXDCgGtuvrZrT9ioXzHM1fqvvRi4LMQEyUQ6u8Y91Sro8BObj0TQcOHIvbGvV
	 3wZZMRidx7OI8OJ/hvsXJnQheRaEdeQT1VUze6rblfbF/ntkLxHCezww44K7s0F7xgL8v
	 h236Jpwhr6vR9EIXnc5QOSRp+bTlsURem/w65p0XxOgKZHRwMwUaVWLhHIejogA+fO/5S
	 KirohLwp6D8t/mGI5UETkW7AZ2SooDMty2i2BbPPDYROPBc/IfnN++He9WZfCw6Dsm4gF
	 J6zTWlS0EKP3E4oK+ShV64UazKkSRyQha3nMpSwEBFLjGbFKZdr4Gw750qxB4X9hJMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955449;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7tnDwOUyL+9+3EBd25a2jQS8D7TqqGxOJ/LMYNK67W8=;
	b=HCL08PFqTEpaPG3rM7RMSU0uB6XPF2fnRLvPyup/el9/Sc48Mg8YEf5I4M6FnS5xFken
	 XVHKQR8EXE+WvtEzk2r0zNcBJr/+ZyCQgRiveAWhOtRzyWu3vbXcVc5Qm6nZy3YdTQKTa
	 8QG9lQ2wCVhTkX/tDSZGPLf+l/200ZuZKetDw8O9fwoYQUMhkjBlbGms7wZ1DjyTTa9TA
	 58CuaWvAxnvuOYRrknqm9S0Fo1rgOhBhjwGbooIBIan5cQk3Pm0LLNpgEdanyxkLcRYBU
	 b0dsYHaXqkdOlC5W+lik5eNyApLWj+MJqq69yLJAP1KAc5ACrH5CqZfz+FKThrqqjgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HTJjrmFL;
	arc=none smtp.remote-ip=95.215.58.208
Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D7606A328
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 08:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30D7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HTJjrmFL
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=d8226L5zRatr4QjzGAsxcF8uWP/1uGCbid94j82xW6U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793955447; v=1; x=1794560247;
 b=HTJjrmFLQVrV7kAs8EPK/OhwBG9oU0FEZ56DSo5LizGks/N4Tm2o7FRZ2BTqv7EL7HasxgUp
 YDXL98vSgciL+0idIGV35kKUY8rX+bz0od0hhd/UuueCkz504dajqUN5PwgUU9gHCa7OdKJtHTP
 lRy72Qc1D2NfHgSmvR276Q+c=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id c5586882dd48232f;
	Fri, 06 Nov 2026 08:57:26 +0000
X-Mizu-Trace-ID: c5586882dd48232f
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 16:57:14 +0800
From: Peng Fan <peng.fan@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] software node: do not resurrect swnode being
 released
Message-ID: <au2WakZdbqc6asKF@fedora>
References: <20261106-swnode-race-v1-v2-0-f8bc7b14d578@nxp.com>
 <20261106-swnode-race-v1-v2-1-f8bc7b14d578@nxp.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-swnode-race-v1-v2-1-f8bc7b14d578@nxp.com>

Hi All,
On Fri, Nov 06, 2026 at 12:38:35PM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>software_node_to_swnode() walks the kset list under list_lock, but the
>last kobject_put() drops the reference count to zero before
>kobject_cleanup() removes the object from the list. A lookup can
>therefore find a zero-ref swnode and call kobject_get() on it, which
>triggers refcount warnings and a use-after-free.

sashiko reported issue here:
https://lore.kernel.org/all/sashiko-outbox-200773@kernel.org/

But this is not a new issue introduced by this series. The series only fixes
the zero-reference lookup on swnode_kset->list for unnamed static nodes such
as dwc3_imx_swnode. Named-node and parent/child-group re-registration after
delayed release is a pre-existing limitation and is out of scope of this patchset.
The parent->children list also lacks synchronization between list_add_tail()
in swnode_register(), list_del() in software_node_release(), and child
traversal; that is why the child-traversal patch was dropped from this series.
We plan to address both in a separate patchset that adds proper locking/lifetime
handling for parent->children and parent/child-group reuse.

I tend to not introduce uneccessary churn to this patchset, but if you perfer
to have all the fixes ready, I could give a look to fix in v3.

Thanks
Peng

>
>One way to hit this is the dwc3-imx driver on i.MX95: when
>dwc3_core_probe() returns -EPROBE_DEFER, dwc3_imx_probe() removes the
>static software node from the device, and the deferred probe retry
>immediately adds the same node again. The previous swnode is still
>waiting for its release callback, and CONFIG_DEBUG_KOBJECT_RELEASE makes
>the window large and deterministic.
>
>Fix the lookup by acquiring references with kobject_get_unless_zero()
>and skipping objects that are already in their release path. Use a
>reference-returning variant for callers that keep the node (register and
>device_add_software_node()) and keep a borrowed-pointer variant for
>software_node_fwnode() and software_node_unregister().
>
>To avoid looking the node up again after registration,
>software_node_register() now uses an internal helper that returns the
>newly created swnode reference, and device_add_software_node() consumes
>that reference directly.
>
>Fixes: 80488a6b1d3c ("software node: Add support for static node descriptors")
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
> drivers/base/swnode.c | 122 +++++++++++++++++++++++++++++++++++---------------
> 1 file changed, 86 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
>index 84a77ffa3dc4b..965e960156876 100644
>--- a/drivers/base/swnode.c
>+++ b/drivers/base/swnode.c
>@@ -75,8 +75,36 @@ static inline struct swnode *dev_to_swnode(struct device *dev)
> 	return to_swnode(fwnode);
> }
> 
>+static struct swnode *swnode_get(struct swnode *swnode)
>+{
>+	kobject_get(&swnode->kobj);
>+
>+	return swnode;
>+}
>+
>+static void swnode_put(struct swnode *swnode)
>+{
>+	kobject_put(&swnode->kobj);
>+}
>+
>+static struct swnode *swnode_get_unless_zero(struct swnode *swnode)
>+{
>+	if (!kobject_get_unless_zero(&swnode->kobj))
>+		return NULL;
>+
>+	return swnode;
>+}
>+
>+/*
>+ * Find the swnode registered for @node and return it with a new reference.
>+ *
>+ * A kobject remains on the kset list until its release callback runs, so an
>+ * entry whose last reference has already been dropped can still be found
>+ * here.  Use kobject_get_unless_zero() to skip such objects instead of
>+ * resurrecting them.
>+ */
> static struct swnode *
>-software_node_to_swnode(const struct software_node *node)
>+software_node_to_swnode_get(const struct software_node *node)
> {
> 	struct swnode *swnode = NULL;
> 	struct kobject *k;
>@@ -87,10 +115,16 @@ software_node_to_swnode(const struct software_node *node)
> 	spin_lock(&swnode_kset->list_lock);
> 
> 	list_for_each_entry(k, &swnode_kset->list, entry) {
>-		swnode = kobj_to_swnode(k);
>-		if (swnode->node == node)
>-			break;
>-		swnode = NULL;
>+		struct swnode *candidate = kobj_to_swnode(k);
>+
>+		if (candidate->node != node)
>+			continue;
>+
>+		if (!swnode_get_unless_zero(candidate))
>+			continue;
>+
>+		swnode = candidate;
>+		break;
> 	}
> 
> 	spin_unlock(&swnode_kset->list_lock);
>@@ -98,6 +132,21 @@ software_node_to_swnode(const struct software_node *node)
> 	return swnode;
> }
> 
>+/*
>+ * Borrowed-pointer variant of software_node_to_swnode_get().  The caller must
>+ * guarantee the lifetime of @node by other means.
>+ */
>+static struct swnode *
>+software_node_to_swnode(const struct software_node *node)
>+{
>+	struct swnode *swnode = software_node_to_swnode_get(node);
>+
>+	if (swnode)
>+		swnode_put(swnode);
>+
>+	return swnode;
>+}
>+
> const struct software_node *to_software_node(const struct fwnode_handle *fwnode)
> {
> 	const struct swnode *swnode = to_swnode(fwnode);
>@@ -374,18 +423,6 @@ EXPORT_SYMBOL_GPL(property_entries_free);
> /* -------------------------------------------------------------------------- */
> /* fwnode operations */
> 
>-static struct swnode *swnode_get(struct swnode *swnode)
>-{
>-	kobject_get(&swnode->kobj);
>-
>-	return swnode;
>-}
>-
>-static void swnode_put(struct swnode *swnode)
>-{
>-	kobject_put(&swnode->kobj);
>-}
>-
> static struct fwnode_handle *software_node_get(struct fwnode_handle *fwnode)
> {
> 	struct swnode *swnode = swnode_get(to_swnode(fwnode));
>@@ -977,21 +1014,39 @@ void software_node_unregister_node_group(const struct software_node * const *nod
> }
> EXPORT_SYMBOL_GPL(software_node_unregister_node_group);
> 
>+static struct swnode *
>+software_node_register_node(const struct software_node *node)
>+{
>+	struct swnode *parent, *swnode;
>+	struct fwnode_handle *fwnode;
>+
>+	swnode = software_node_to_swnode_get(node);
>+	if (swnode) {
>+		swnode_put(swnode);
>+		return ERR_PTR(-EEXIST);
>+	}
>+
>+	parent = software_node_to_swnode_get(node->parent);
>+	if (node->parent && !parent)
>+		return ERR_PTR(-EINVAL);
>+
>+	fwnode = swnode_register(node, parent, 0);
>+	if (parent)
>+		swnode_put(parent);
>+
>+	if (IS_ERR(fwnode))
>+		return ERR_CAST(fwnode);
>+
>+	return to_swnode(fwnode);
>+}
>+
> /**
>  * software_node_register - Register static software node
>  * @node: The software node to be registered
>  */
> int software_node_register(const struct software_node *node)
> {
>-	struct swnode *parent = software_node_to_swnode(node->parent);
>-
>-	if (software_node_to_swnode(node))
>-		return -EEXIST;
>-
>-	if (node->parent && !parent)
>-		return -EINVAL;
>-
>-	return PTR_ERR_OR_ZERO(swnode_register(node, parent, 0));
>+	return PTR_ERR_OR_ZERO(software_node_register_node(node));
> }
> EXPORT_SYMBOL_GPL(software_node_register);
> 
>@@ -1061,21 +1116,16 @@ EXPORT_SYMBOL_GPL(fwnode_remove_software_node);
> int device_add_software_node(struct device *dev, const struct software_node *node)
> {
> 	struct swnode *swnode;
>-	int ret;
> 
> 	/* Only one software node per device. */
> 	if (dev_to_swnode(dev))
> 		return -EBUSY;
> 
>-	swnode = software_node_to_swnode(node);
>-	if (swnode) {
>-		swnode_get(swnode);
>-	} else {
>-		ret = software_node_register(node);
>-		if (ret)
>-			return ret;
>-
>-		swnode = software_node_to_swnode(node);
>+	swnode = software_node_to_swnode_get(node);
>+	if (!swnode) {
>+		swnode = software_node_register_node(node);
>+		if (IS_ERR(swnode))
>+			return PTR_ERR(swnode);
> 	}
> 
> 	set_secondary_fwnode(dev, &swnode->fwnode);
>
>-- 
>2.34.1
>
>
