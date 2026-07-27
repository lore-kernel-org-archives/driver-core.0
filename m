Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536EE175A7F
	for <driver-core@lists.linux.dev>; Mon, 27 Jul 2026 05:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785130310; cv=none; b=JbpJYdTPMQZNTW/BVadU6zx+ESNSwOaCir8/qorgMjI5Ievu/Z1n+m6NQ5cZ/ZD0SvOjIjckyCnEfOdeXJLY+vFEOmG7gGsr6H2afkR7ibDtXB66FSR2MJuIgQ/ung+Z2NbtC7Qe1YVxtz6WU/lYVHBEnOEnA2R5RVtnFISrASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785130310; c=relaxed/simple;
	bh=lpdb5Gm6hxDQQsH39lkVCGM6F9nZVRoMPuZAoenMwaE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJGPRqTKEjqYyEZpxMKQHD6OaQZDpVWi4yFnBlm1vPiZcpdbbuxxcWfiJm0a6LYQvhqRAvZLvkr7T1xVJFaMFkoXqenFly+ax1cXy7PsWW4dQ2BfvuS6u9loe6bcQrXgCadmDUzlYpA1VWX+E84FYF4NWYJdH1kYRd3iockYZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VG33c7Ut; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VG33c7Ut"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1700177a91.0
        for <driver-core@lists.linux.dev>; Sun, 26 Jul 2026 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785130308; x=1785735108; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omjjRVD8i5LphSadX9Fqn62uij+zBEpbBaeWrs9DOfw=;
        b=VG33c7UtPLXr3VvuzF49KuTHiBp42AIbgPHsVNKwk5wy8vmRsjX2wvfk4fTjSqeBL2
         hNBclG+JGiqUa1kGx1iQPeEjtoL8Oz4WJl/Du23Qb58Ir+U78rphNaAo41O9DQcl1tnw
         tUE4qlHKKHFoqDSqye6FBhd7/rvjHwKH5IEf5irbcyI92VOp00jDNyt0k6Yo3Aj0NK6z
         UiVKZfGJUM0S9N9xtYKezZ6eGk1CY+MclpMlFOVwn/z3/FS7xp6GMHvWA64BU1YsQwjj
         gU/9mp7vcttbrFJet6AN74jIWdxiQh4BEsi388UHTeU070v/K+MKZk2/Es9/ojHrTHig
         0tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785130308; x=1785735108;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omjjRVD8i5LphSadX9Fqn62uij+zBEpbBaeWrs9DOfw=;
        b=CkqRE4eGkb3Oj9/GhlcdeLG7Y960mN0G6+hOqz4ykzc0mwB4qGrTwBhJic/uAwXvk8
         1M7hS2soFIqdm1prrUhLuBA4M2xVROhfNVe+HJ/4vLxOkTTq31Jf6MstqaYHqI3Ave+t
         ZtaBrkAXjWOztow4Of6Jg9nmPeqKobF+ryZrnmg9CXK4TbQgXFksYZvSdsnC37gdEEWV
         h6zc4Z/pkIIuTqwArNyAFUwO9N7hP3stN4LXcfoFjyIb9p0jDGg5t3aJDspisWuqT+gf
         0fFJ/6MZMu8ZZjr6xUT8/hu0V39HkLaajpRrVXaDbt07bamQMyZDKTGGqZQ/PmkSe1Te
         +JZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbifHqfMKRqltMvNaI/zbI1RvrgE5O8KCtd3r6tNyfYylunMPUb5Wcy2u+9ObqPPVLTk6OzzY+QubgDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAKS3r00XGDeZBE/cPZKXB4cFexd7o+5dL7TOS8dJ8Rr4DqygL
	JJCbC67ZR7r/NTzZ7CJjj9S2rwsRbi1mCbD2zXeaZlLRskfzwgOcik8Z
X-Gm-Gg: AR+sD11cLZAgmPeIpLu1K4jwuSLxoyUVEv5bUBCG1LfXjWgshGLwK9NuGkYTm3O8rxt
	N8cfekTTNIZn9ctVOstWrQ4/qdt1NpD29/Ube0mx1JvH1mOfZS/HWmdHvw0t4owai5w+bypkVNE
	dI8EQuBz8kv/mL1UgPRAaJ1c/IHLphyMbgSr0qNDrYpS6yRwzW18usu9hOnZu0l5mC1W7HQyFas
	5cZKpLb/GV5vhPyod9yzcK5vbP/I+moBWXxmfThDi29GOPR10gCBTzubnF+SxPT/1CSG2BgO7eP
	6rU6UCOsaMQCsFpFFGYaB/vfJnZMJVFzVzEyDMxPfwX6IJyK0zA0YogWSDcBg5CFvFYHRnrXFgn
	ZQWNbAbxmFyjCa8OE37HvngjFxd1lJtKghVW4Qw073upuOP4EYPw6RCAQ1egFllrxW5R+M+T6H+
	oAilSsVkvaEuRebIFzXLCR9PV2f76DigogpmrvvRItsmo=
X-Received: by 2002:a17:90a:d00d:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-38f2965e5d5mr7050447a91.34.1785130308496;
        Sun, 26 Jul 2026 22:31:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:fc2f:1878:e714:ef41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm5562517c88.14.2026.07.26.22.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:31:43 -0700 (PDT)
Date: Sun, 26 Jul 2026 22:31:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <ambsuv_6mCK8U9IP@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
driver_allows_async_probing() to allow asynchronous probing for drivers
marked with this type.

While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
preference. Subsystems that require asynchronous probing (such as slow
legacy buses) need a dedicated probe type to guarantee asynchronous
execution.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

I am planning to rework serio and gameport subsystems to rely on
asynchronous probing instead of rolling their own implementations.

 drivers/base/dd.c             | 1 +
 include/linux/device/driver.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..34df7b4416ac 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -936,6 +936,7 @@ __setup("driver_async_probe=", save_async_options);
 static bool driver_allows_async_probing(const struct device_driver *drv)
 {
 	switch (drv->probe_type) {
+	case PROBE_FORCE_ASYNCHRONOUS:
 	case PROBE_PREFER_ASYNCHRONOUS:
 		return true;
 
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 768a1334c0a1..4b3901a35e85 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -48,6 +48,7 @@ enum probe_type {
 	PROBE_DEFAULT_STRATEGY,
 	PROBE_PREFER_ASYNCHRONOUS,
 	PROBE_FORCE_SYNCHRONOUS,
+	PROBE_FORCE_ASYNCHRONOUS,
 };
 
 /**
-- 
2.55.0.229.g6434b31f56-goog


-- 
Dmitry
