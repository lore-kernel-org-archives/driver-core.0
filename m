Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD761139D
	for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 22:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699078; cv=none; b=PutWAlvXCZpyccYRRJRqJlWMLzgKBUp4+jHGhy1JRp/7ZTIfyXk7zqRnzXnI4EVt1Cdoq+yZUaDbAPMW0ukXfRyYRTMDYvTKE9sXFTGBtuVoyMfm7fKBs5PrZQ02Chno9ASMkaXuO6M8lXkAhH24oM7qd8/EpEdFH0Ta88B60iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699078; c=relaxed/simple;
	bh=jCx3i5w0Glr8xRtR4d1Q/Nu0yU6n0euF0r65GZl39CI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=smRyQTPwghfINyGJPsaJkqfzydNinxpviK6Zecz2wzpWKX3qkNTwcPMEzFhROAjOvYvJcPIw1lniB6jIcTAVpsP804l5o1nMuO4bege1l1I++Qm0G+cLoTuus5Eq8eKr+LU+YiEH8fx9zNVHQ5tBw75z3srFPUDwjde+cKbUH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3sHoJZZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3sHoJZZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439bcec8613so3845832f8f.3
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699075; x=1774303875; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JLWrhypsLr+7ubna09xG42kxGcKL/VTxbCynKfFMgxU=;
        b=A3sHoJZZMuIjl60Rbu2h8eJdF9WGxnDlvZEl8hsQ8oP/1p5Mg4pY9AGG4SSa0lWOgt
         iStZs7XEPl6h4HB3pCGu52xwQ/Jac/1FB00JLkEYutHatjQvCvq20cusYcSLni6Dpatk
         gJvtECAHB8BEeF4hvG8s1zqROUrEAfr8rNLRUcHeBlhKwwWppqgF+lEUmX3yiaxoH/Un
         tCvbsR4LmN/UPXHbxH9S+AjUXmTMR2NLcVUjwHqJbXo8G2tUW51KoKHN+PhJOsH8bZND
         3p+clv3L2M+Kkwqe6r/16ZRe+Q68EvnivAYued2LznlHrXAJhpsvUMa0XreO/htSOSil
         DtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699075; x=1774303875;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLWrhypsLr+7ubna09xG42kxGcKL/VTxbCynKfFMgxU=;
        b=KDR2S/ZKWTGD/xOuhzdLrNCLlHS9SgTvLiAUx0q/O6noomgzb8qk94dktYZCkZrDth
         BaPaeQDSPkDg13NoJ4XU1LZc2fFyHA4sWZv4zsF705js1zj0yupoz8Qmvq/33ZyXe1pM
         NXB6PALzBwtYclNMAhi6bYWWBlMYt1lCzdaMkTGao5z39VFZf33mUd9XR4LVGnLJyB/s
         jjM+7VDnXmIAf4am3LU4BujCGvPyPizZ1q9JMhIsMwvJErY6aktsf7m7INTDgj8VY28t
         +fEF0xXljUCCUY2P2PbxomRexD9MV/+JVnzHBP/vkl/SPrp1AccB/wchqrzVT3I2PA6k
         P59Q==
X-Gm-Message-State: AOJu0YwG2/gd3K1ovM54CuhA/j05Kl7HZxHv/r/dQrU+IpvM0rPoHgG0
	9TlQplMnqK6MAUSXIQ3ZLzqH6mbYVkxJZoHDJp1SYAgaBMGZ7uXTRDty
X-Gm-Gg: ATEYQzw7A54ZaLzJOzFMeK8QsLjUR820OHNWJM/CXFoZqPIGCba5/taOxbgOMZnlkSc
	QbI00t+6+yh50PIW+B9Ob9W+N66SnPZ5N/scrBNaef5pk9M12nEek256fbiPgFNnlJzafhCNdas
	r5RhwvAnyENqzVhV6P8kPulcQS0HLchxKoEJ3x6LAmaBacH0TeZK3jR+BRm5U9GAteaV6/rRSQU
	XIbiJIp6QhIhjmyFNhWNRgtNhyYAJv/klDLMLWWWoGA6LNvsiokxgAPekTQKwxAo6Mt6x5XeH2j
	/ihVI7xg4P42CjFRcb//LDbii0YJg0qjJlwtvd91lqSU+vEArQIp3ghsbMv5Ga+MDDb9jyilBI3
	waKrd9RL2j5yriefb53DE0HMFyJkYLJoiuA1/n0iVuoadIotscM+ovqdV2a1UnSbK3ieytFugaY
	cNhBguvlugpvagz8myTzEdqgQ0r7MIEdBpxiyz8bE//I3rbpZopEJC9ctzf2K2PESLNcbcbYcjE
	JieZhPx7RRDKDcSPQWrl672K5iqKwwIHJcnwNsQy+gRas40AaCdwrHxVLrSanRPqw==
X-Received: by 2002:a05:600c:c162:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-485566c94a6mr246133315e9.2.1773699074333;
        Mon, 16 Mar 2026 15:11:14 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f1d:a900:d899:a285:c20c:fd3f? (p200300ea8f1da900d899a285c20cfd3f.dip0.t-ipconnect.de. [2003:ea:8f1d:a900:d899:a285:c20c:fd3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778d268sm142440095e9.8.2026.03.16.15.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 15:11:12 -0700 (PDT)
Message-ID: <42624513-923c-4970-834d-036282e24e24@gmail.com>
Date: Mon, 16 Mar 2026 23:11:12 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/3] device core: make struct device_driver groups members
 constant arrays
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
References: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
Content-Language: en-US
In-Reply-To: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Constify the groups arrays, allowing to assign constant arrays.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/linux/device/driver.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec51..c882daaef 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -114,8 +114,8 @@ struct device_driver {
 	void (*shutdown) (struct device *dev);
 	int (*suspend) (struct device *dev, pm_message_t state);
 	int (*resume) (struct device *dev);
-	const struct attribute_group **groups;
-	const struct attribute_group **dev_groups;
+	const struct attribute_group *const *groups;
+	const struct attribute_group *const *dev_groups;
 
 	const struct dev_pm_ops *pm;
 	void (*coredump) (struct device *dev);
-- 
2.53.0


