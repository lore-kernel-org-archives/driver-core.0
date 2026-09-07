Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974D525A7E
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806266; cv=none; b=LFwSSfUd/qpIOAW32PhB4OrK8GGpBm2rAlxA0vC3b1fTj+cSp32blrBIxN3Ue7x5gsqfUF1oBAKwpZwxWKorlU+uQQ0JDd/cLiUKSHbmAjj+wapqnfnOVHM9Z/T6mu7kVPd53DFwEp7hf0tzvnasB72ahoDncvxS66OHgDldSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806266; c=relaxed/simple;
	bh=oNDH8onUgGA6/IUo3nmdBjyIs7eNB1x5h32U/LQ0DFI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8Nyz3eMqyvjAhzin75mh4aEe0qUg53Hqq5m0Llge8gODxe6JCC2MlhYnF0rYlOiNUbc2QQBUwNfzsiUbaRf016j3vTfYxn5yxjazriHCmRy1UXO3MzmiDXDbTgiOlAizyGwGpotIUHZwW9jkG0tNYSefabVnNWT1lKCC55+0v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x3eDs-000000004e9-2OF5;
	Mon, 07 Sep 2026 18:37:40 +0000
Date: Mon, 7 Sep 2026 19:37:37 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Frank Wunderlich <frank.wunderlich@linux.dev>,
	John Crispin <john@phrozen.org>,
	"Benny (Ying-Tsan) Weng" <yweng@maxlinear.com>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: [PATCH net-next v13 1/6] net: dsa: add devlink flash_update callback
 to dsa_switch_ops
Message-ID: <ca7ce5efa19afc93bede2b5bf6841b0b47eba4ba.1788783126.git.daniel@makrotopia.org>
References: <cover.1788783126.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788783126.git.daniel@makrotopia.org>

Add a devlink_flash_update callback to dsa_switch_ops so that DSA
drivers can support devlink dev flash without open-coding the devlink
plumbing. Like the other trampolines in net/dsa/devlink.c, the op
returns -EOPNOTSUPP when the driver does not implement the callback;
the devlink core will then have fetched the firmware file from
userspace before the request fails, which is acceptable for an
operation as infrequent as a firmware update.

The devlink core calls the op with the devlink instance lock held and
without rtnl_lock, whereas DSA serialises its switch and port ops
under rtnl_lock, so a driver has to serialise a flash against its own
ops itself.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v13: no changes
v12: no changes
v11: no changes
v10: no changes
v9: install the flash_update op unconditionally and return -EOPNOTSUPP
    from the trampoline like the other DSA devlink trampolines,
    instead of a second devlink_ops permutation (Andrew Lunn)
v8:
 - retitled: this patch adds the callback, its first user is patch 3
 - describe the op's calling context in the commit message
v7: no changes
v6: no changes
v5: no changes
v4: only install the flash_update op for drivers implementing the
    callback so the devlink core keeps rejecting unsupported flash
    requests before fetching the firmware file
v3: no changes
v2: align continuation lines with the open parenthesis

 include/net/dsa.h |  3 +++
 net/dsa/devlink.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 7507d632e7c6..9babab92a0fc 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -1174,6 +1174,9 @@ struct dsa_switch_ops {
 	int	(*devlink_info_get)(struct dsa_switch *ds,
 				    struct devlink_info_req *req,
 				    struct netlink_ext_ack *extack);
+	int	(*devlink_flash_update)(struct dsa_switch *ds,
+					struct devlink_flash_update_params *params,
+					struct netlink_ext_ack *extack);
 	int	(*devlink_sb_pool_get)(struct dsa_switch *ds,
 				       unsigned int sb_index, u16 pool_index,
 				       struct devlink_sb_pool_info *pool_info);
diff --git a/net/dsa/devlink.c b/net/dsa/devlink.c
index ed342f345692..25311a87cbc5 100644
--- a/net/dsa/devlink.c
+++ b/net/dsa/devlink.c
@@ -20,6 +20,18 @@ static int dsa_devlink_info_get(struct devlink *dl,
 	return -EOPNOTSUPP;
 }
 
+static int dsa_devlink_flash_update(struct devlink *dl,
+				    struct devlink_flash_update_params *params,
+				    struct netlink_ext_ack *extack)
+{
+	struct dsa_switch *ds = dsa_devlink_to_ds(dl);
+
+	if (!ds->ops->devlink_flash_update)
+		return -EOPNOTSUPP;
+
+	return ds->ops->devlink_flash_update(ds, params, extack);
+}
+
 static int dsa_devlink_sb_pool_get(struct devlink *dl,
 				   unsigned int sb_index, u16 pool_index,
 				   struct devlink_sb_pool_info *pool_info)
@@ -169,6 +181,7 @@ dsa_devlink_sb_occ_tc_port_bind_get(struct devlink_port *dlp,
 
 static const struct devlink_ops dsa_devlink_ops = {
 	.info_get			= dsa_devlink_info_get,
+	.flash_update			= dsa_devlink_flash_update,
 	.sb_pool_get			= dsa_devlink_sb_pool_get,
 	.sb_pool_set			= dsa_devlink_sb_pool_set,
 	.sb_port_pool_get		= dsa_devlink_sb_port_pool_get,
-- 
2.55.0
