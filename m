Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822185;
	b=HDdiyk7+apqf/49EHKlF9giOBkvnPx0KuStAeIUS18+jesyILKMaEBqhbXX/rLA31McR
	 Ep9l/+409e6RBXxnITyPF9ApfLz+FAJMJWyPFgT4tF5JNZLyU7fxadPe7+FUkNigk+EWx
	 /Xxf7zewQhwD3bG6kBwVkDn5siOVVD0NDEG2aDm084OuDLGxSsnM5rFx0YRZkZWrXGy1e
	 5Oi/DopnweTC2LQoqnLcejIuIYcKyXB5LDx3Z8i5SGVSEp1rMt4+iCoKc3d3+ncRGy+oZ
	 L8ZB4O+X3T8V9FDWQa0ZGkAH4W245Zjib2siu6sgVYMDIYQykPAxeARdO4/Q20VQhIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=5LYozNRqhjODpZRRGreiBPLyhGDd9kX9S97BkRXIX68=;
	b=xpESVa/L4V5xp0W2ZSsGmbSVxmoB0FWJtH18SRJClSOm5LryLBYiddjiQmg6pG0Yl+PC
	 LfYKAd4vT448B6iHCUtBkHiP48txm7nb+JHc7b9AGwDE+thb3M3LoilV2KrGD9zQpKPpm
	 oKfyy/iKiZjz9n+7Yap8j6EswFXjanTdVR+TBklQYY3I7UZ9vR5PhwpUr0QzbiTbX1yVM
	 6Uys8NQl482Nhk94uT9RHKkhLcy5TG94cCV+rYJ+e4eCPLz8a39NtstLwyCYC2kEi5xoa
	 BzBSP0HQVMvMxHWP/aA7V8aMrgmr3JdG9sOtjfBzqewLbzg7t2STEs5e8fNpfi6dU2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHgazOVX;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD24606A32F
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD24606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OHgazOVX
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3692225b3a.2
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822184; x=1795426984; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5LYozNRqhjODpZRRGreiBPLyhGDd9kX9S97BkRXIX68=;
        b=OHgazOVXW8UPtinL7Eg/9sbLxPfKKChmitXvEBLin+jUXZs4j3CDbDcwT7PcA0jFRh
         XtQZXz2dLSXMkRlLNjkMdADR1eTxLGXwxwH2azbx5i0WX96demZzsjmOLJsTYkz9nygK
         kJNVK4gWOA7SXdIuiIiO0gMlCZFO9lcb8EMkXr7xmr77HErWZkjGEf3g7Yedt9AzrCFk
         srpJT1kS+8n9X7VDvNLotZKTFCyGKOpG9C1y1mUu6+eLG3IrEvNhXI/kOng5ziOccnkt
         FwryLBapv2FAHM7PJ3cppKA7K8chE/yyH6XRE9oPxnPGtbgyDen7CHcU0At2em3vS+wk
         QJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822184; x=1795426984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LYozNRqhjODpZRRGreiBPLyhGDd9kX9S97BkRXIX68=;
        b=NSqZYHkck7+G2/0PhjxnAmrwHTxq1Z5OlvvUvtue5fNexnplP+HV/rkV6VZW+lcXsJ
         A+7hoyPzxkcrqYEr9lOmjFQ9wESWtQZfUAqZkXKoPlRw2NblvtDNlyDSTgrG78hdIfxP
         T/3FgobMO3pSyqkMiq54ztUa3vyuF7ISXO0KrXNu+jwOlD3iOgJ2wHpfk4UqnkFt5ZM5
         /TpROvty6t1YSqy5BE4N4/AGVsq7XzWu/4QYUUPhruWiqAwy+kK1lVyBP54sTPBIRidC
         M/kqWiDmDidUsJFoFDSusMpVtI8jAAXggHpWqmDc9pfTk5qdQa33Gs9UY3s7j1sU9vbS
         a37Q==
X-Gm-Message-State: APuU4Z8EZIcU3X9oVlRHM7LbOQLSgg4UqqXBOXPfOlYNHm0ZqKdq8I97
	dlzAqR2sIJpV0KTskxqgqqA6mktYUJ2KeOEx9WMDxLWkx0ex4ysVS2/8
X-Gm-Gg: AYBFou2aHNVgbzmzzoSlqOv6K4VdADNsGlqlcUJwXucuFYgL84uBSxeELytbmJC3SF2
	F2fYvpNq5BeXC0VUPMosahSbv9eznhUylHfkJ7x+dpE437MilSGcC/Zwki7wJMC9j2xYje1WAI7
	JUEaLbHB17kKitAdK4M+dkzRi1JgQTW3DAqVaeUaFBmckzFY+dsWPVh+mLb6uD7C6vN3u0HBfBZ
	+7ThYz4fLuH7qXlmXXLvGfhOelAkCz/81GmK8B5nTjV9xWY4HW7+I/iJVu1k8//fwJEFgOP2/u/
	jvS9LzWci/SU8ttNGCXwtVkp0lG/L5a1o55f494PN5275Pdu7ttRqOabxsWYaqANEuqfbJiwhvA
	dwAxUMnyoU6hrsiwcT0kpvPgUwJszO7VEdG6Ld7c2R0davAe96fsnshKzNWwlwT792z76u7kZ2+
	bD7n/4aAfmbgeqUL/N4M/1DwhXoulBOtdg/zb0/vzsPxAEQx1crv4GgaROP4v3KmHQ/A9z+fYW1
	AR1yiCHGpRsKlRPvaCPZSAKoS/3w4botZw+01VjHp3VBN+qlk4eeySW9/y/tJdEzbY002blDhZb
	JxudgxDm5foWZmub78nX+/6syI5WJMV2Cjb5/vOX8PuE/noe6eBpwFAPnf9lu9F5mzrCav2KfUa
	+bbRmphdWO8Nt6mx9wQ==
X-Received: by 2002:a05:6a00:4518:b0:8b4:b88a:c2d6 with SMTP id d2e1a72fcca58-8beb6d604a3mr8639338b3a.39.1794822184188;
        Mon, 16 Nov 2026 01:43:04 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:54 -0800
Subject: [PATCH 2/4] sysfs: check group visibility upfront in
 sysfs_group_change_owner()
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
Message-Id: <20261116-sysfs-group-invisible-v1-2-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

For hidden named attribute groups, looking up the group subdirectory in
sysfs_group_change_owner() fails with -ENOENT before attribute
visibility is ever checked inside sysfs_group_attrs_change_owner(). In
addition, checking SYSFS_GROUP_INVISIBLE inside
sysfs_group_attrs_change_owner() still updates ownership on the
kobject's own directory node for hidden unnamed groups, and breaking out
of the regular attributes loop still falls through to binary attributes.

Check group visibility upfront in sysfs_group_change_owner() using
__first_visible() and return 0 immediately when SYSFS_GROUP_INVISIBLE is
returned. Remove the now-redundant SYSFS_GROUP_INVISIBLE checks from
sysfs_group_attrs_change_owner(), which has no other callers.

Fixes: c7fbb8218b4a ("sysfs: check visibility before changing group attribute ownership")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index cc03229f8a94..290e70034329 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -520,8 +520,6 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				if (mode == SYSFS_GROUP_INVISIBLE)
-					break;
 				if (!mode)
 					continue;
 			}
@@ -542,8 +540,6 @@ static int sysfs_group_attrs_change_owner(struct kobject *kobj,
 		for (i = 0, bin_attr = grp->bin_attrs; *bin_attr; i++, bin_attr++) {
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				if (mode == SYSFS_GROUP_INVISIBLE)
-					break;
 				if (!mode)
 					continue;
 			}
@@ -585,6 +581,9 @@ int sysfs_group_change_owner(struct kobject *kobj,
 	if (!kobj->state_in_sysfs)
 		return -EINVAL;
 
+	if (__first_visible(grp, kobj) == SYSFS_GROUP_INVISIBLE)
+		return 0;
+
 	if (grp->name) {
 		grp_kn = kernfs_find_and_get(kobj->sd, grp->name);
 	} else {

-- 
2.56.0.679.gc527c65306-goog

