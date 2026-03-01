Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD402E65D
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772368221; cv=none; b=qAkCrhsLTeUp/lwicshGEa3cEJPCzYiyZtBRfaIDX2IIkvst71KnLbxcVT5lafum05C6E4fjf5cV3tG8bciJCqI90hOzsSMCPhaozlBgWwxeTgVpgbbckcSrRycPELDaOKk2J0Kog68Z0v6FEajXW4GrbbKewE84yF4YVjgCZ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772368221; c=relaxed/simple;
	bh=Qlxf4vGP0s+oYc7nTK+dIxJjKgrkya9GImiujsOZ3vk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HVoRlEnzlB99pD+FSthNs+IDB0Ltla9ps1vG3vLdeGSkJv44uJayrG/bXcPI+OqIfqHAbzOUN2sWM/Jnf3OThGIP1Za6GgUsluhzZGaEGtWpnsdYH0lrINAyh1ZKAGwLmTlv7J+Eo+UazXv3Kw+lkcpsF7d4hVN3Wgfsa8h9WrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWCJ+bFy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWCJ+bFy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so40189555e9.2
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772368219; x=1772973019; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IH7s13CuB6X9sNPcDjs79QdKxXWKmWCf+uImrAdahLc=;
        b=mWCJ+bFyMSKkeEYKV6PF1ne6pM4eNj2T0Pq3wDRyxESbR7pjfLEoQMs778+nNbvmwS
         OAHqyqzF+0scg3a+4hj57TdHEdt4NWT/hy1jPS091KEokuiyjLGoYpeN6YzhpwFUv2ZZ
         QVtvaMZpukBUkZf89KeKDRYMkeSPiUKYJHjGQ5jWs0cB925/Q/JAfbolk3foi40yTBeV
         hmioRan28kRzf6R5f6Ni+ouAyUQ1fYRFBsyhdSg3EenpmOwWxBIk2lSr9wEZczIld4lj
         OAL16nGt3QW8ukRiIxgPHeGsTvyGqzkHyvsV8gKianztplPuywHsa+OwTjMJDytOi5JZ
         WB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772368219; x=1772973019;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH7s13CuB6X9sNPcDjs79QdKxXWKmWCf+uImrAdahLc=;
        b=i87cuQXG5vxahmTryhCGs70v+PNgnB5D9Ogq41VqpSGK/+e+VuYdoOHX3tyMrH0agh
         LWh2TVzW7UAlDoIs8VKW8S1CjMPF4VD8X/8/faLjO6PS3fg2pXglk16nE24DLlGthFN1
         7AiDOa4K5unhHRIPlQRmJnSGxMwKdhHMj331AeRGc1FXerbjpnOJlCrCDt9BJawXPdii
         kF29SAEtNu1TNFrtjjq0Ka+U2onkqaHNJa4Kawf3E3ctOFjs66XMMjuSwQsGffOSdGkW
         uHryXSRWtTMg3daZc+cGafs2k9OlUjBc4uXLSjmegnI+MUJrvoIQRM9ZMVsD5vjKwSH5
         Gqyw==
X-Gm-Message-State: AOJu0Yxph7CJ0M7xiEVdAZR3ddhj8jRrrOmWCBcfXQ1Ox6ifM8Z2IkAM
	ORMs3dV1laXtoWMMPEEV6Niq0N8CqKLxKuHpbPCfUlIWDDQ6KYTfGOkg
X-Gm-Gg: ATEYQzyi0mVnSKVDcw4ceQ5VOoR3aNFcZFU4UVt6WAF5fhD21MvhsntFjgj6UIfPv2J
	P5YCSw61Sk6wdNaNuzpDthIn/ahWCCCZFdcDYCuoanCAClI9hr8XSKVfiK6AqlvMkZ1gYQ4erCX
	2vcFUHa5ASEnYqzjEjFthNDfVTKBsYDGpTlFcm/XJECH2uD0r36YFQt0jeqApmVEnb5wNNaDqtz
	7OFPwZAqV1mCg2uVTpKA36tMkOooPTz9xWAc0RXIHmE//H2AfMWsYpWn4nRx8hESU8Rv1TK8d8y
	jOUHWCJwvaIr7rb06YkP0wPKKb7WCmIpLfvDBmjglmW/4obGj8KX0J12wrYN5/0Vc87//SX3Io6
	ZKUXcsE5nISpTKLHoa/zOTkAwdQVbKS7z++yu/8XAskWlBBGyLBN9+XIFADe78gBu5BszkqKKD7
	M6/pI+98Vk4vb63ZT8q+AYAgJ6TKv5WeXR6E15jbPILFwTXz750SJaVeo97iaFiOQ7pzU198sZA
	8/HmWDUUSeiwSoPjcq0GIM08M/gEYXJ3EK492wgzepejECmD5HLA9h6On6TUeBTPK/iHNDXKEbT
X-Received: by 2002:a05:600c:3e12:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-483c9bb1e09mr148646305e9.8.1772368218757;
        Sun, 01 Mar 2026 04:30:18 -0800 (PST)
Received: from ?IPV6:2003:ea:8f04:4d00:b8f3:c9fe:a208:3449? (p200300ea8f044d00b8f3c9fea2083449.dip0.t-ipconnect.de. [2003:ea:8f04:4d00:b8f3:c9fe:a208:3449])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm237976555e9.9.2026.03.01.04.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 04:30:17 -0800 (PST)
Message-ID: <17035265-8882-4101-b7a7-16b3eb94f8b5@gmail.com>
Date: Sun, 1 Mar 2026 13:30:17 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] sysfs: constify group arrays in function arguments
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

Constify the groups array argument where applicable. This allows to
pass constant arrays as arguments.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 fs/sysfs/group.c      | 10 +++++-----
 include/linux/sysfs.h | 16 ++++++++--------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index e1e639f515a..b3edae0578c 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -217,7 +217,7 @@ int sysfs_create_group(struct kobject *kobj,
 EXPORT_SYMBOL_GPL(sysfs_create_group);
 
 static int internal_create_groups(struct kobject *kobj, int update,
-				  const struct attribute_group **groups)
+				  const struct attribute_group *const *groups)
 {
 	int error = 0;
 	int i;
@@ -250,7 +250,7 @@ static int internal_create_groups(struct kobject *kobj, int update,
  * Returns 0 on success or error code from sysfs_create_group on failure.
  */
 int sysfs_create_groups(struct kobject *kobj,
-			const struct attribute_group **groups)
+			const struct attribute_group *const *groups)
 {
 	return internal_create_groups(kobj, 0, groups);
 }
@@ -268,7 +268,7 @@ EXPORT_SYMBOL_GPL(sysfs_create_groups);
  * Returns 0 on success or error code from sysfs_update_group on failure.
  */
 int sysfs_update_groups(struct kobject *kobj,
-			const struct attribute_group **groups)
+			const struct attribute_group *const *groups)
 {
 	return internal_create_groups(kobj, 1, groups);
 }
@@ -342,7 +342,7 @@ EXPORT_SYMBOL_GPL(sysfs_remove_group);
  * If groups is not NULL, remove the specified groups from the kobject.
  */
 void sysfs_remove_groups(struct kobject *kobj,
-			 const struct attribute_group **groups)
+			 const struct attribute_group *const *groups)
 {
 	int i;
 
@@ -613,7 +613,7 @@ EXPORT_SYMBOL_GPL(sysfs_group_change_owner);
  * Returns 0 on success or error code on failure.
  */
 int sysfs_groups_change_owner(struct kobject *kobj,
-			      const struct attribute_group **groups,
+			      const struct attribute_group *const *groups,
 			      kuid_t kuid, kgid_t kgid)
 {
 	int error = 0, i;
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 99b775f3ff4..9777e9445dd 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -445,15 +445,15 @@ void sysfs_delete_link(struct kobject *dir, struct kobject *targ,
 int __must_check sysfs_create_group(struct kobject *kobj,
 				    const struct attribute_group *grp);
 int __must_check sysfs_create_groups(struct kobject *kobj,
-				     const struct attribute_group **groups);
+				     const struct attribute_group *const *groups);
 int __must_check sysfs_update_groups(struct kobject *kobj,
-				     const struct attribute_group **groups);
+				     const struct attribute_group *const *groups);
 int sysfs_update_group(struct kobject *kobj,
 		       const struct attribute_group *grp);
 void sysfs_remove_group(struct kobject *kobj,
 			const struct attribute_group *grp);
 void sysfs_remove_groups(struct kobject *kobj,
-			 const struct attribute_group **groups);
+			 const struct attribute_group *const *groups);
 int sysfs_add_file_to_group(struct kobject *kobj,
 			const struct attribute *attr, const char *group);
 void sysfs_remove_file_from_group(struct kobject *kobj,
@@ -486,7 +486,7 @@ int sysfs_change_owner(struct kobject *kobj, kuid_t kuid, kgid_t kgid);
 int sysfs_link_change_owner(struct kobject *kobj, struct kobject *targ,
 			    const char *name, kuid_t kuid, kgid_t kgid);
 int sysfs_groups_change_owner(struct kobject *kobj,
-			      const struct attribute_group **groups,
+			      const struct attribute_group *const *groups,
 			      kuid_t kuid, kgid_t kgid);
 int sysfs_group_change_owner(struct kobject *kobj,
 			     const struct attribute_group *groups, kuid_t kuid,
@@ -629,13 +629,13 @@ static inline int sysfs_create_group(struct kobject *kobj,
 }
 
 static inline int sysfs_create_groups(struct kobject *kobj,
-				      const struct attribute_group **groups)
+				      const struct attribute_group *const *groups)
 {
 	return 0;
 }
 
 static inline int sysfs_update_groups(struct kobject *kobj,
-				      const struct attribute_group **groups)
+				      const struct attribute_group *const *groups)
 {
 	return 0;
 }
@@ -652,7 +652,7 @@ static inline void sysfs_remove_group(struct kobject *kobj,
 }
 
 static inline void sysfs_remove_groups(struct kobject *kobj,
-				       const struct attribute_group **groups)
+				       const struct attribute_group *const *groups)
 {
 }
 
@@ -733,7 +733,7 @@ static inline int sysfs_change_owner(struct kobject *kobj, kuid_t kuid, kgid_t k
 }
 
 static inline int sysfs_groups_change_owner(struct kobject *kobj,
-			  const struct attribute_group **groups,
+			  const struct attribute_group *const *groups,
 			  kuid_t kuid, kgid_t kgid)
 {
 	return 0;
-- 
2.53.0


