Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E17330DEB0
	for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800862; cv=none; b=g5TkIDkHXjFgnpMTI9DfB2B65ubxg41cnS2HOM5BPY5xWzH0UbQDc8H3D3r/7EqeTZsDhkGAFZQaUwy8FQB0tSwkl6kLzvSMn8fngu4s/e+JmL42QwiTpFBdBS0wRNHaXFz+JiNAtNx7cbv208U8nrKgxKVoLGx/VVwPTrvbRmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800862; c=relaxed/simple;
	bh=idD9jv7uFW521itEPBe4KyylCkWc7f46VoJ7nLJFmS8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cb38Q37TVl9Og6cVnEknuyUtJdH9JxSDzn6TA4iy6V9eSVkaXywN5ghxMJWFZcedybLJOpjjE173Kb9OsrohJRfJchxJkqMpnb7eUnoGqxyD9tnvYXHMmjyVJtk1/umEqsbLkhMPLB52yWf02P9XTsxTRSvxaxqWM2/0ZeKWDiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XUaQuJW0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XUaQuJW0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso876825f8f.0
        for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800857; x=1775405657; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV1NVYu2CUk772hs5pUuIWfRYtmEoiUvAReCjlabyeY=;
        b=XUaQuJW0s86uXukASNBynoJzE0TxS7lkrGhXeNnt3/3tFCaZaxTUgS2/icy3IpCrfy
         sFf82tnFmQRd2LVkB3SZhzSMi3Sp4wsf8+a+l2fkzu9uHLLTU0qXgrgOMeQOuxseymL/
         +6tkE2+YUmlUR/pqlOzzLvFkvyY9C4qBmg7BA6JfP5t+Eyh8jgYT63MEf6rZSfj5v9f3
         icVxSPAA+fI1Eb89TkpUQhev7yYVYBtM1LMa7YzNn0mSsaOL+LiqJ8qduYMUqXfb2YTx
         1Et7WriPswWyPXTZVNRErnvX5JFcL9ydLox8UhxaPRJWId+2SMATW69ctBigfM03256t
         u0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800857; x=1775405657;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sV1NVYu2CUk772hs5pUuIWfRYtmEoiUvAReCjlabyeY=;
        b=nedsj5ZuAhdpq10OxOrKThceufVA0EulA+1A9fhXEl3DYEkWM4sh1AmZ8VjJW6lTlI
         +vHt3sn5uy0uD0iRgE+D/GGwNYLD8pqwmqDdrNPwR7xh7p/VjqA0qagOUkpOBTTODMLC
         g7s/xkHSMThIOZMk+Equ889LdagRvpCoNjtHXx5ZeQiQsMwSdwoaEOFv6qufwGRQs8xp
         fWBxW6XQ65nDXFeW5MaUtngfsoKQPRMjZV0y1MU37k2YvezpCnkLtYU3OmUjB4TSLtk8
         MG2bw4RPxwYvEdGtS1K1pIyAuES4bXd8OTO+b6HXED6gpu42KhjwRFc1hWZN3zmaW7vg
         ObmA==
X-Forwarded-Encrypted: i=1; AJvYcCWb0kkJFKPo24IBG1lVbVE6uJsmA4CtQ4O0m3NjwupJLrcokmDKY+rlRgJwORq+yir/ohx+hBA+OgcIdg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKV+JLby8y9gKR9SQQCT2jbn3wSQQauPYtGlNuju1jOi7nOC2L
	XZqV7PMop+/p22oqUsXrNBHdPCEloXCKoK1eZwZ9MeRs7DfizJtKwTTm
X-Gm-Gg: ATEYQzzQoNFP5CPzbk1YUg4cwJrVGmeqVsuyx+HhHcIcT/kBzCZ7z1VzzQcOaJXJc9N
	tJFnRdEk7EB5XURG2HWtSCdi/KvnReYxToaTSv+27sL4GhvVwE5C/wyCM0Mtiq3Z2AWfPQrFn9f
	J93T8d6tteoqyupYHjQATNpw2QgkOPnqL38PHGJRWRZwb9p0Oya6GYWQExJjqK46O/xxMhs5Siu
	OrISC83e3VPIAn2+hFyMf1PCUbA/QAi5v8vcTwDTYbe5p+Xt1dm8iI5OQps09TI9uS9fYwEdrtd
	Z/LhhpsLiVYAlYsd1bVG4+gNcO4UBUYd7Rt0pHdGvKFBLtb+bPWlw2N9Fu86KxP45q0stIlofQH
	EsppgxWhWvc9dPgfSNIpDas+K5TSEQ5NHYf3V8MB5e4geIoXi/12vVZjachOkElM4zedDKA3MHX
	iElBVEeFpUg1S6Atvp4Z3h2ksWO03fwDeEZETsjiRVpoOGUdkVxh+3nSi/TzSbR3omkdyExyTYp
	bjIYGVvXD7t1Bd1MIwdnNtg8XIGQBe6CuIPDZYVzi9gQJILefqG1StvyVfknUrAsw==
X-Received: by 2002:a05:6000:18a3:b0:43c:fe66:43fb with SMTP id ffacd0b85a97d-43cfe66466emr1830837f8f.17.1774800856677;
        Sun, 29 Mar 2026 09:14:16 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f09:ff00:e94a:abd6:53f0:1fe4? (p200300ea8f09ff00e94aabd653f01fe4.dip0.t-ipconnect.de. [2003:ea:8f09:ff00:e94a:abd6:53f0:1fe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm20250282f8f.0.2026.03.29.09.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 09:14:16 -0700 (PDT)
Message-ID: <0fe1b679-ab28-4505-b0db-14e7ac3ba749@gmail.com>
Date: Sun, 29 Mar 2026 18:14:15 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] PM / wakeup: Allocate class wakeup_class statically
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Allocating wakeup_class statically avoids a little runtime overhead.
Define groups and device release function as part of the class, so that
we don't have to repeat this for each class device.
Whilst at it, constify wakeup_source_attrs[].

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/power/wakeup_stats.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/base/power/wakeup_stats.c b/drivers/base/power/wakeup_stats.c
index 308f8bde9..72beb8fce 100644
--- a/drivers/base/power/wakeup_stats.c
+++ b/drivers/base/power/wakeup_stats.c
@@ -18,8 +18,6 @@
 
 #include "power.h"
 
-static struct class *wakeup_class;
-
 #define wakeup_attr(_name)						\
 static ssize_t _name##_show(struct device *dev,				\
 			    struct device_attribute *attr, char *buf)	\
@@ -114,7 +112,7 @@ static ssize_t prevent_suspend_time_ms_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(prevent_suspend_time_ms);
 
-static struct attribute *wakeup_source_attrs[] = {
+static const struct attribute *const wakeup_source_attrs[] = {
 	&dev_attr_name.attr,
 	&dev_attr_active_count.attr,
 	&dev_attr_event_count.attr,
@@ -135,6 +133,12 @@ static void device_create_release(struct device *dev)
 	kfree(dev);
 }
 
+static const struct class wakeup_class = {
+	.name = "wakeup",
+	.dev_release = device_create_release,
+	.dev_groups = wakeup_source_groups,
+};
+
 static struct device *wakeup_source_device_create(struct device *parent,
 						  struct wakeup_source *ws)
 {
@@ -149,10 +153,8 @@ static struct device *wakeup_source_device_create(struct device *parent,
 
 	device_initialize(dev);
 	dev->devt = MKDEV(0, 0);
-	dev->class = wakeup_class;
+	dev->class = &wakeup_class;
 	dev->parent = parent;
-	dev->groups = wakeup_source_groups;
-	dev->release = device_create_release;
 	dev_set_drvdata(dev, ws);
 	device_set_pm_not_required(dev);
 
@@ -212,8 +214,6 @@ void wakeup_source_sysfs_remove(struct wakeup_source *ws)
 
 static int __init wakeup_sources_sysfs_init(void)
 {
-	wakeup_class = class_create("wakeup");
-
-	return PTR_ERR_OR_ZERO(wakeup_class);
+	return class_register(&wakeup_class);
 }
 postcore_initcall(wakeup_sources_sysfs_init);
-- 
2.53.0

