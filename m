Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DE81FC101
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 12:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772368265; cv=none; b=p046bWAGMiITL0FtgX4fzVnFkNK2ZDbd8IB1m0jKgNaeD5jp8i40ZjZku6oHEigrs4IDRZS+WMtT4Q77Apm+hHvlubuxg+gl3FVZ/pAax3A4XG6R72u+Bm3gvjzruEz3VJEr+qv3XunP1F4mJVdy8BH41Rz+5qu9zsD2oySsvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772368265; c=relaxed/simple;
	bh=e8H4avRFlAUOV699FyBASvVpYwgBt329l3QdH0BnKgg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GJf+QeT8dTm8/BQcWzkvANBfjb6efIkmjwSPA477oO2zNQbJtTDfPNXV0AJjRImF06NkJTLKzuCEM48TISxMY9SzQaqaik0ZsM9vPbBXZ2eqN9aHaVvIvMDiWeXTd55TSJZqDDZ/4Wq2i4qm67vwlEBhtcGShDqXnjOmh3JPtEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdG02e3T; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdG02e3T"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso522094f8f.2
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 04:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772368263; x=1772973063; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IV8LIVJYlIzCJ+pXwZ3nFU4gVyFjVKrpHPPGWI1pXSY=;
        b=QdG02e3T+rus10yJ90PbUtScwyzfFHAkBLjRCxqfHgL0HbsZMxzbXpkLmsNXTZ3ldy
         gbUEmrPWE/JkLdtgFvtSwdCFOZqw8146hm0UDNM0VDhVlVBOMbTh7/6NTbQ7MSgYWIx1
         EMHxh6olNaKmWYOqhZ3QM6iZwHfxOJBtesyT367gOrbxngKGAD299QEUqv23KdvzO9Gi
         My0xS6mhvov1ytBhcVFa3zh3zMceOHYuj60Tp1ObBrAucfGnl1T58XAZ0RoSCPQm2kww
         ga0p9aVMiK8sFhBXIBzo3JmgNpVZgWe8u4N+XtpDWknaW5KvXIFwh+5djb1ZJZg4Q41j
         PWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772368263; x=1772973063;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV8LIVJYlIzCJ+pXwZ3nFU4gVyFjVKrpHPPGWI1pXSY=;
        b=O98XwWZmQDBrLX/EDZVdl+1tNPdyQMiOyVw0B6k3gEpjNBEGjTmwmtSOsGkdzvT17L
         u98d6NiDm60dkkj56YCfE3zgJfmtOW/0kpbvKnvhajbpafd2ALKiRDC38gZLdGlLCKKc
         ZRZLnSlbTyT9wWHEoT7hE7P8WQkXBvj5VA9rKwYKZlTqgAPI5Q4ALX90Wm1cJK0l8vuX
         jWlV0ooeJTS2bgaVgVOk5ttuhs+FfPbg69Vqzbh/yNCxWEXfVSmAdW//9vKELf4lnyg4
         HU1f8q/xpzgGktKO3TNbB41rxoqxg/DiVJMiTS6CfzJQrxYka9t43wzv1hGpf4OP280G
         bpHQ==
X-Gm-Message-State: AOJu0Yz0y1vkmJz2aBi2FvBNXiFlCFy0fG9425M0F8PqDfPZAs//1D1U
	yyw4WPn+h8Ut9JyrIjG3W5Zb4rSURjCvMcQUK6rejMGTfGb2XjJrhYv1
X-Gm-Gg: ATEYQzw07KW4GV1sMW8MpYMNidz0W0seDxp6ZYAnKPmoQHmRqWPcm67lFu39bZDc2hM
	MrUUU7LDJcJa9oVzsNJ115y6M+17fXr69RXfQT0eDIr6GeKfEKbciSC1DTE1E8fQgYYsM39IkJS
	390NQCHGQ+iZ218mSaDP3YzYRdgGkfQZwL+sxz7nvofZ7ERGhq5zRMuim1nonRuo+nzqWv5+IQA
	l2qPv+BJEG1rFP64lT8TA9Rz8QR4Frn98xjvnTUaAX5n2rULxBcLMIBCL7NJswTl9DfUmI9IlIN
	j825G0kVvph7fBMYVa1NRwNVmLCYqUSxGwT+H4qtVKSPzAHuEJCF5MSoXkH4ub4ku04+pwVVJMX
	Dy+Kg/fjj/Di3eaHq2Yv4a8/UCdd7qjPOXD1zbRGsmSg/kWZKtCPaM4CBUE2hoHLUo0ZH1l1nIb
	UBIbI0/WrPugnd5soyJmBLAfmtg1l0unJmO+PuPhjTAl4+w+CtSVEC3nhtDY4rGxAwQBlZMWHek
	Ue7aLZORJFYS1G3MARZKWTn+t8eLNvJeiLTC9nc7FWkqabGKJpIlwvlCOCKzTPoyg==
X-Received: by 2002:a05:600c:34d6:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-483c9c1cc59mr160599545e9.31.1772368262780;
        Sun, 01 Mar 2026 04:31:02 -0800 (PST)
Received: from ?IPV6:2003:ea:8f04:4d00:b8f3:c9fe:a208:3449? (p200300ea8f044d00b8f3c9fea2083449.dip0.t-ipconnect.de. [2003:ea:8f04:4d00:b8f3:c9fe:a208:3449])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b841absm255176275e9.13.2026.03.01.04.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 04:31:02 -0800 (PST)
Message-ID: <8ea2d6d1-0adb-4d7f-92bc-751e93ce08d6@gmail.com>
Date: Sun, 1 Mar 2026 13:31:02 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] driver: core: constify groups array argument in
 device_add_groups and device_remove_groups
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <d13ed3da-898e-4b73-a98c-76a671258757@gmail.com>
Content-Language: en-US
In-Reply-To: <d13ed3da-898e-4b73-a98c-76a671258757@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that sysfs_create_groups() and sysfs_remove_groups() allow to
pass constant groups arrays, we can constify the groups array argument
also here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/core.c    | 5 +++--
 include/linux/device.h | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 791f9e444df..f497b724332 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2831,14 +2831,15 @@ static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(removable);
 
-int device_add_groups(struct device *dev, const struct attribute_group **groups)
+int device_add_groups(struct device *dev,
+		      const struct attribute_group *const *groups)
 {
 	return sysfs_create_groups(&dev->kobj, groups);
 }
 EXPORT_SYMBOL_GPL(device_add_groups);
 
 void device_remove_groups(struct device *dev,
-			  const struct attribute_group **groups)
+			  const struct attribute_group *const *groups)
 {
 	sysfs_remove_groups(&dev->kobj, groups);
 }
diff --git a/include/linux/device.h b/include/linux/device.h
index 0be95294b6e..48a0444ccc1 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1131,9 +1131,9 @@ device_create_with_groups(const struct class *cls, struct device *parent, dev_t
 void device_destroy(const struct class *cls, dev_t devt);
 
 int __must_check device_add_groups(struct device *dev,
-				   const struct attribute_group **groups);
+				   const struct attribute_group *const *groups);
 void device_remove_groups(struct device *dev,
-			  const struct attribute_group **groups);
+			  const struct attribute_group *const *groups);
 
 static inline int __must_check device_add_group(struct device *dev,
 					const struct attribute_group *grp)
-- 
2.53.0


