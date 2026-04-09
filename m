Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC4221723
	for <driver-core@lists.linux.dev>; Thu,  9 Apr 2026 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775715054; cv=pass; b=DKSXoQMiSmGA4h6o8PiEMKuM3ttxM6KrSu2L0kvrilZQfIHQdgWkGXu96R/RsxeWX0nbjBXt1BnQgesQXI4M3usivpEA0HFi1CIrktz5A7MHnvC1m5lGKEmHpHHteVyFw9vWaJPfLlOUWRfdxlg7hT/bOKew7YcFOIwwCaPBgDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775715054; c=relaxed/simple;
	bh=C7jgFsggCUv+grYAo71GN5D2lfriBmXicwbQVFxdRb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKiuOTGtFn5imo8kqV3ggQsR2U+Fsi+QJWZ7MQLFO+7msjJOf5TbFgWu520H/D9haaJsGMmTDPtMfA5ty98oIeB2b4gf3WksDq0FPKblvnOnta2X0mihCMMDHbdIuygvcEP2UsDyG85gX8g5GvixK7G5jUVaikWIyCSWnxWLpnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ey1HoIkF; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey1HoIkF"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6501c9903edso494879d50.1
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 23:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775715052; cv=none;
        d=google.com; s=arc-20240605;
        b=NC1BcpDdJhCXW7FOWE1sKtpOPuAUQnx5n1HU+B2NikxglMeZjCb7gZ+bGT4nQCfDmX
         Q0kQk0YxWTYLHMSuzLXFTB1dQ+q/IKEWKDEv6ys6LXATwM74bwe21gCytNnnagrI62N6
         iL6Zf6m8aB+mRlsgfl50JPhD/Hs3XgELmANEPorD1c75HNjgNJIwVJ5qi5hgNelmWHIt
         VpuE/JpUysS2a4v0e5A1V7/qemkLDRVHeKtcXmKqT35kkrIhQzlh/ypA2oTbne8pIxeI
         weiCz5TKcio5UrSKX5D/vvVbE3+0w4PLEUr12tKe1LTXr27REGzYeZDuVNt6oGbVl8X1
         NAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwM99oTpixu108LuGJrATXw/cgerjBT7WB55X/ijPN0=;
        fh=SPgnvIrhrgfF3ORCflU/qtwHSJ2ERpRZUolCPK8655o=;
        b=O4a3FX64SWUJD4lbB6WH15w7u68VFGyUJCiLEOCWvnaBgfpdMZxvj58W6rrqsP+RcX
         dGzSFIVfN/UI28OTtheYaC4cl9kyhf2QLgdpN/xDVBqGgkdFD0SGzWOc+zK7c69D0WTb
         WD+FgbGr4cmk+HKEhmT9ZS1wayK9W/wm4SkOzC/hoSsbhKTmVVeAH4xYKH0w0lJKhwvj
         U2SwejRk1ogMyYe2SF8Tf29eTj7vGMi37iD8qY/KMYK/3FcOwHhfk4MdmeJRVECfPk9Y
         P3M1STSItSRfwC2pOEcvxaiC1Sx31/Dy8JQ5VjLCoQTLXemirecLrk4OFOAg2j3GOcgY
         mMlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775715052; x=1776319852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwM99oTpixu108LuGJrATXw/cgerjBT7WB55X/ijPN0=;
        b=Ey1HoIkFojC2cw/Dy7WIxxtrlOLhhcz/nrXEPyOzdJdbTnzzwTSNBBahbJzk0vdZq2
         DeXPk1WQ4IIHWTw5/PtHqGGMX9PL1WK1lxfaOcLhFG3dvIB+R/Km8MiPO3W+WarStp+x
         kGt4CPmFlRyd3sZE2c8HzLUBB2gqiJNvoguBb4L/2KNFvgjuO1A5q4TXk5RaW4BEEABy
         NDBMl6r0SEseGGURevpgL2QBnNEweaQgJt6ZqqxrclNuJXqFWBWJ1mLbNKJhcDX2bXG3
         l9kM519bMoStebwVZRkDX8Lp1gdzyYvAtSi1uySqE78v750+GqE5vIZiS5l3QF+L6BPt
         75dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775715052; x=1776319852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwM99oTpixu108LuGJrATXw/cgerjBT7WB55X/ijPN0=;
        b=Bqnvjw74DDc0hQhhEuh5CVHJH6d4vSOry/7o/8Mo3udnWaxJlVZ0TqeKKOzd/dn1a1
         sLCsKWF5W8WVRmh2maPxhTqAmB6cuDUxTOAgl13J+8mgrtHCVim2x/gxjYP3u5pS5NRa
         yD0j1H+KPfJVdKX4xUephm8cr+ILcNFAljYP6Ea3mBX/kYvBr7Rfjc81NCGT6fOb0UXR
         PEWrznE2c//sRp3IKXLCfFb4QdW0qQuzfRENGG73gltPI7hE1MntckyAm+dFrxxqrZog
         m+sr2hSBbg8HRYRhCivTqEZlyhfXht9GK3OIm0EDTpRmmyH/yBiMMCj/IzNqMyxqGwK3
         1dMw==
X-Forwarded-Encrypted: i=1; AJvYcCUqrQvVZBEyshY9aRgfTjc7S6g2Fcqp8cfjzoCNOirioOOOfarlBUxX+1ZG1QzY9U1i1MF3veddzcOSlA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMYAYkB2FzvmyvE3BBxBRr+AMYX40ATHzNtbvN29JMkH7HgTPT
	+3gM+5lJIj2P3I3btbLcYKKJXPBtEglPSqsFGDS/v0uAcoVkIgwvp4UWvlxRPMv+ctiKV5xQV5z
	tVtrYJ3/e8OCWOlCQjFmAjaKljg1EyL+tEV5Ac4I=
X-Gm-Gg: AeBDievQieydMC58JOGdy0XxXZWB5ld1Zai2Ma3JQ3DLW7xtv/R5WAL9bK/HuaqkSkI
	+jzV/z1HyfUjoR90enmaPvtWwovPD1S1u0hhFQ4/2hRzkAOjSBxN295CnFYZUufZZ+z5iTEWria
	JpDbC4SRS9q257QJ2USjGFjdP048kwtABWGc2O+F6pp/0P8p7zMqGcDwD6JO1oQzvCXGFznQoqX
	Y5iis/3VY76txkC3KXQR2/IM5zGTTyjKejZbsgEzPbknzMVaX+cGZ/YH0kHQ74fo0SL9ikMsNjo
	hHgTLKOqpcDLVyrI7g==
X-Received: by 2002:a53:ab48:0:b0:64c:aab6:65ac with SMTP id
 956f58d0204a3-651877fdd64mr1480527d50.62.1775715052052; Wed, 08 Apr 2026
 23:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408131155.2946395-1-zxyan0222@gmail.com> <2026040834-runaround-glass-8ea6@gregkh>
In-Reply-To: <2026040834-runaround-glass-8ea6@gregkh>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 9 Apr 2026 14:10:40 +0800
X-Gm-Features: AQROBzD7twGkrLJRsCVbPZfKvMup19HoLO3_op45fL3PdQYXqeQehbkPbzvJjwo
Message-ID: <CAP7veTJWngyX0OWLOK35r=9uS-hMfLWRR_Jn5oa+-xyC4V=7rg@mail.gmail.com>
Subject: Re: [PATCH] regmap: debugfs: fix race condition in dummy name allocation
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I missed adding Cc in the previous send. Resending the correct
v2 patch below.

On Wed, Apr 08, 2026 at 09:11:55PM +0800, Greg Kroah-Hartman wrote:
> What code does that?  Why not fix that?

Multiple drivers using regmap can probe in parallel, leading to
concurrent calls to regmap_debugfs_init() with name=3DNULL and dev=3DNULL.
The dummy_index is a global static variable inside regmap-debugfs.c,
not something the callers have knowledge of or control over. Using IDA
is the appropriate fix for this internal concurrency issue.

> Also, you did not sign off on this, so it can't be taken, sorry.

Apologies for missing the Signed-off-by line. Added in v2.

From 7f7d322d6605a1b2c3d4e5f6g7h8i9j0k1l2m3n4 Mon Sep 17 00:00:00 2001
From: Zxyan Zhu <zxyan0222@gmail.com>
Date: Thu, 9 Apr 2026 13:40:11 +0800
Subject: [PATCH v2] regmap: debugfs: fix race condition in dummy name alloc=
ation

When multiple drivers using regmap probe in parallel, they may call
regmap_debugfs_init() concurrently with name=3DNULL and dev=3DNULL,
resulting in concurrent access to the global dummy_index counter.
This could lead to duplicate debugfs directory names like "dummy0"
being created, causing debugfs_create_dir() to fail.

Fix this by replacing the non-atomic dummy_index counter with IDA,
which provides thread-safe ID allocation.

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
Changes in v2:
  - Add missing Signed-off-by line
  - Improve commit message with detailed problem description
---
 drivers/base/regmap/internal.h       |  1 +
 drivers/base/regmap/regmap-debugfs.c | 21 ++++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.=
h
index 5bf993165438..e067890866c1 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -84,6 +84,7 @@ struct regmap {
        bool debugfs_disable;
        struct dentry *debugfs;
        const char *debugfs_name;
+       int debugfs_dummy_id;

        unsigned int debugfs_reg_len;
        unsigned int debugfs_val_len;
diff --git a/drivers/base/regmap/regmap-debugfs.c
b/drivers/base/regmap/regmap-debugfs.c
index 5a46ce5fee72..18f1c60749fe 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 #include <linux/device.h>
 #include <linux/list.h>
+#include <linux/idr.h>

 #include "internal.h"

@@ -20,7 +21,7 @@ struct regmap_debugfs_node {
        struct list_head link;
 };

-static unsigned int dummy_index;
+static DEFINE_IDA(dummy_ida);
 static struct dentry *regmap_debugfs_root;
 static LIST_HEAD(regmap_debugfs_early_list);
 static DEFINE_MUTEX(regmap_debugfs_early_lock);
@@ -539,6 +540,7 @@ void regmap_debugfs_init(struct regmap *map)
        struct regmap_range_node *range_node;
        const char *devname =3D "dummy";
        const char *name =3D map->name;
+       int id;

        /*
         * Userspace can initiate reads from the hardware over debugfs.
@@ -567,6 +569,7 @@ void regmap_debugfs_init(struct regmap *map)

        INIT_LIST_HEAD(&map->debugfs_off_cache);
        mutex_init(&map->cache_lock);
+       map->debugfs_dummy_id =3D -1;

        if (map->dev)
                devname =3D dev_name(map->dev);
@@ -585,12 +588,16 @@ void regmap_debugfs_init(struct regmap *map)

        if (!strcmp(name, "dummy")) {
                kfree(map->debugfs_name);
-               map->debugfs_name =3D kasprintf(GFP_KERNEL, "dummy%d",
-                                               dummy_index);
-               if (!map->debugfs_name)
+               id =3D ida_alloc(&dummy_ida, GFP_KERNEL);
+               if (id < 0)
                        return;
+               map->debugfs_name =3D kasprintf(GFP_KERNEL, "dummy%d", id);
+               if (!map->debugfs_name) {
+                       ida_free(&dummy_ida, id);
+                       return;
+               }
+               map->debugfs_dummy_id =3D id;
                name =3D map->debugfs_name;
-               dummy_index++;
        }

        map->debugfs =3D debugfs_create_dir(name, regmap_debugfs_root);
@@ -660,6 +667,10 @@ void regmap_debugfs_exit(struct regmap *map)
                mutex_lock(&map->cache_lock);
                regmap_debugfs_free_dump_cache(map);
                mutex_unlock(&map->cache_lock);
+               if (map->debugfs_dummy_id >=3D 0) {
+                       ida_free(&dummy_ida, map->debugfs_dummy_id);
+                       map->debugfs_dummy_id =3D -1;
+               }
                kfree(map->debugfs_name);
                map->debugfs_name =3D NULL;
        } else {
--
2.34.1


On Wed, Apr 8, 2026 at 9:33=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Apr 08, 2026 at 09:11:55PM +0800, Zxyan Zhu wrote:
> > Use IDA instead of a simple counter for generating unique dummy names.
> > The previous implementation used dummy_index++ which is not atomic,
> > leading to potential duplicate names when multiple threads call
> > regmap_debugfs_init() concurrently with name=3D"dummy".
>
> What code does that?  Why not fix that?
>
> Also, you did not sign off on this, so it can't be taken, sorry.
>
> greg k-h
