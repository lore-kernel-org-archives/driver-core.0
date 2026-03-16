Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC0364E99
	for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698981; cv=none; b=WkoiXvvHtiVM/742/gU6sF1hPcwCKbguuVzWt+on0/bRzXxcprE1/JldcL20JICqQQ7mJHnvcM/X01wCsObMj5VigZAueb4NihyU7+nDIU4SIHrkayGM9BU3fiURTkNnVqG0tqQzhIlYgSkltLKlyx5Sh4LQm4pfCF/8TawkSTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698981; c=relaxed/simple;
	bh=TSXknyOLd+kJOiJqihMJLD/LuAHzVsUgouKl8cwf0Vg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ILAe3Rvx8eaDDIh+NdvZnFP1bioUOMik9+SUBU0wSxj6BlxS8Ro6uOsYXpQ+Y+aZ/YHEAfWiWfzkihTkscW+hexBeEYtJGDXV6cSiJwLtdWPthne67Ua6PBPkd7oFCGGJ2z9EdIb/+XM9xL5gkNB+TuzrPk/Qb2XqS6eaTSfP1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5q5M1xG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5q5M1xG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so46307285e9.2
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773698979; x=1774303779; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6vAIV8t4fRKPki63G6ghTdF4yApt0g7vn/TGcMMAIE0=;
        b=F5q5M1xGo3DUjmtzPXSfPECHwl33duDTYkINEUa0I96ZAcpEbvYDpUcQgofINEw2+E
         dHd4tKEhvShdx8BU0YJFnjGRCGWxmwM5pAK0wEQBKOwtLQmeboXcJGjA9c7cJ7B+53wt
         p/O8UK/CMW5Ra5OVPfWSAKA4AUSdktyMMq/2wl0d4rRxROGjRo6HkWymjsPIUUxcjzCT
         66ppDOMinPRWq+nOMmmsA94i+g5U376VEV19VHaaJmlzpUOEAytu4xpLN2Hhishu5Vq9
         mawJibmoP06c4xy5lBfFTQffBdg6uTw9t216CU3znYsl0dCiWR8ZMkmKSzTz+y30W8Yd
         E/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773698979; x=1774303779;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vAIV8t4fRKPki63G6ghTdF4yApt0g7vn/TGcMMAIE0=;
        b=dSo8a13RVDkyFOkeEvb5aNSiRcKoaJaXg9gZ/U5ZdtZz9eGpaBbGESphtHkQy0rGfT
         LwNXGPO9jFT9wSPCu8GcDeP4O7QHpHRjix1c9fWEca5CvIuW0NjVr6aSGVIg/wp102Gz
         Mai3EPf2PyUQXvPCibdhM4syJ49yocVr0afasvpkX0eXiL2LIzMSBXEpKtyWaGn1ccqq
         AuYI016ZcGweLSiGZfmxdaRYIjr0RBzXk1fdu/KAjc4spEpvFeW9X8+qB0Q5r6zkhzUp
         1ji/a8Chg5ZcI4Pm/JYwC3TkASdCDiX8lttwYKLpMYXhaCqEiwxpJn7IUkbB8+nye3O3
         RncQ==
X-Gm-Message-State: AOJu0YwrE75frvgiYyDpf6YZxNRq1oQ5ROdVYZhEDrFefsWNXgjBdSyp
	fruLcdy1s0ixVQSUkDE5m74fElKftjzy1Od39/ICsYlA1x/de8NGZZS+
X-Gm-Gg: ATEYQzz3xfXL9645/Uy/nxvVK+pjfdmKQrrCQ3BCc0jNsHtdS7efuKeMBocrp0I+wHU
	erVmydIL+L1bf0TAe6Kv39jKsP5n9GkBLYGXhMXcu54IxtIhT0hFbjD4Tdyx2MWcMz8WcfWzCdx
	T9N1srF1p/2M/F/SLaJ3scHwN5syuVjNm0JukOkjKpmhFoMpe9seoM3uV2xet0kKqhhKRpAu/qc
	TXpGzD84/jKkWmw2cZZjfV7Q5FeMyyIoIpSTi3XczYvfDW7nUfuNY4tvMMnE5pgF1EVmQb4db23
	RJ6nTgQv6i5NUO02QbH3CGoWkX7pUJdIyvxHWmOHzRqX0aiLJhgmk+WFWZJ3i8COGl5kWYjRVZE
	FPQqyNKLWy/Sdbnyaw1CjdtKkxH9EbHuLjhExOWpAhNKaBJ5jeFsPSiS6BSsPN7NF1BK/MNwNu8
	StNUgFsSPkoBJNIs4JnlL2xtqM4lT5xc7bgKBuTaF5ETxS72kzYu32UcTS4w+ZKngA/ExgSnEu4
	WLvldcqsTFClEZ6eLvf5GxBwjRc0wpZP8Yhf6jxVD9MZ5+YNKqzgOum6Xq5w691gA==
X-Received: by 2002:a05:600c:4752:b0:485:3dfc:569 with SMTP id 5b1f17b1804b1-48556700c54mr249244615e9.16.1773698978608;
        Mon, 16 Mar 2026 15:09:38 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f1d:a900:d899:a285:c20c:fd3f? (p200300ea8f1da900d899a285c20cfd3f.dip0.t-ipconnect.de. [2003:ea:8f1d:a900:d899:a285:c20c:fd3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3d87b1fbsm22327071f8f.7.2026.03.16.15.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 15:09:38 -0700 (PDT)
Message-ID: <21a1e5f1-c6a0-4f6f-aa86-1e6abd25f9c6@gmail.com>
Date: Mon, 16 Mar 2026 23:09:37 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] driver core: constify group arrays arguments in
 driver_add_groups and driver_remove_groups
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
References: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
Content-Language: en-US
In-Reply-To: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Constify the groups array argument in driver_add_groups and
driver_remove_groups. This allows to pass constant arrays as
arguments.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/base.h   | 6 ++++--
 drivers/base/driver.c | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 3bc8e6fd0..747530465 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -196,8 +196,10 @@ static inline void dev_sync_state(struct device *dev)
 		dev->driver->sync_state(dev);
 }
 
-int driver_add_groups(const struct device_driver *drv, const struct attribute_group **groups);
-void driver_remove_groups(const struct device_driver *drv, const struct attribute_group **groups);
+int driver_add_groups(const struct device_driver *drv,
+		      const struct attribute_group *const *groups);
+void driver_remove_groups(const struct device_driver *drv,
+			  const struct attribute_group *const *groups);
 void device_driver_detach(struct device *dev);
 
 static inline void device_set_driver(struct device *dev, const struct device_driver *drv)
diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8ab010ddf..c5ebf1fda 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -203,13 +203,13 @@ void driver_remove_file(const struct device_driver *drv,
 EXPORT_SYMBOL_GPL(driver_remove_file);
 
 int driver_add_groups(const struct device_driver *drv,
-		      const struct attribute_group **groups)
+		      const struct attribute_group *const *groups)
 {
 	return sysfs_create_groups(&drv->p->kobj, groups);
 }
 
 void driver_remove_groups(const struct device_driver *drv,
-			  const struct attribute_group **groups)
+			  const struct attribute_group *const *groups)
 {
 	sysfs_remove_groups(&drv->p->kobj, groups);
 }
-- 
2.53.0


