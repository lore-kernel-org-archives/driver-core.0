Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE8139D
	for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 22:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699035; cv=none; b=C7wG/84Rlr1tmh7vcYkDpyy4yJLgWnD8l5lomFmM+U8eYEBGILb+U8mjb6KGBvPaN/1cGD/uYlyX2zqn0c3EUDtb3QmNr9vK/1ljGByXFZ368BhqhEk0wh6yQWm2mi2lYUW0BCSex4X7iGbyddxj22gvP722jvPxNI4b6lbINC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699035; c=relaxed/simple;
	bh=zG96yvsfrBFkn36WORyR0zrDDYmg07v2u8eEPV6yueg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hi8XBCb5H9uRgu4WKiS6o8epaGTi2EtpGJm3dQ6ImrQQDJKAPQp4/h8blmu1ensnwRtc8oPqQupi5+mtUJ5+vYhTEGkkD1y7qPDrwmYgMI4jzn7fBPMzEqUpbuhkIJCeL4XBzMz/yJtpYzpMgPSAcuGJb70sa1cnt0ed0EZ73zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmlKAkNv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmlKAkNv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so45281275e9.2
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 15:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699033; x=1774303833; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MaOpH7n5RqdR/Q8QY6wYvCmTuVnAlejmfO3YZ2V6C8Q=;
        b=RmlKAkNvXXG6oVZpqO8ZV0dqwQ4HrYHLje7TcHtLKFxdlk9gygdOv0IHrR/nhMN+JE
         cB68q/cNfjvFpf6/j3DTFjXGTTi6r5xvnUq73AUqAmjGus4PPh7nJPpBKkURnwlHOYgh
         q7dLTbfztC4Oyx4d/MNbAQ5uyhlACYv0OyvbCTOLYAgVObwRhANrWnNMz7E46Qddt1pQ
         68WtSw8pn7gl+MzdQ4+749q5jd4dAjN1vYScV5ZuUnppNkfd51fd7HD13627zZ5Gd9qM
         BR6lWcm1or833naawO5IGz9/bynsV1C/zLafDus3er9GwYkv/sK8CByL01W1cY/g9AIl
         cU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699033; x=1774303833;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MaOpH7n5RqdR/Q8QY6wYvCmTuVnAlejmfO3YZ2V6C8Q=;
        b=cHrQBp6ZlDYhcJBZYATMXnYh1HVgJ09b8QBcvLQ3dlzwq67PKtiVF05nEExonQ54CZ
         EItbvh1NicjT3uRwgJIqO3TIgfjDJKK0a4PmqjPZYvR/hPc/lLUjIzF2kVlw941HuGS2
         iMpltzbtl0bg7Tnu+F2kgrHNIgS1F4xWpkZ8qQYh++CsCus2bsujjn8bP3rvWQ5hxCXd
         ZlYexRjomLlkCNQ6bu6QpufKVg32qXL2yWfCQwAWuAhPfLr5+xr67llqMoqaJE4BfGXm
         ZNVefpyqGLJzQyJoCQbnBlpdcs7EhKObBtAkh/VF9f8sHk0lirLdJ86yffro1lefkYEj
         v9tA==
X-Gm-Message-State: AOJu0YxUx2vnXgPy1LjNYIMyKYMCUaUJeUnNZAOHlNFK+9Enm36MGJpq
	+HrpMCQhV5q7W0CzrFI6pHtBzNFM9sJrqPfGTXvxeG7uZJZ53uekusiIBBertg==
X-Gm-Gg: ATEYQzx6dS0ds4Rxc6NJvTOC5oq+wVXoyZQq9uPRhsZE8zgHqR34oH/Rc1KLNh0bIGA
	rHT6j0aTQ9ks8/15BPsdb5t3rRqAhxTqpK7mfohU12eg5z6ks466qCRZO8V2gIF/zqdWRnCVwTP
	rkXbcfCmpsvJT0ZAxlgRYOq/5xeQsKiU8WgN1L7C8lLsrmUO1cTlJdPCCDTTZfMA2TESBLa0ClQ
	BE9MU3YuM2Nu/f8kG+Xv4/rkzm1oD2+obPHGjWlaWuHsWqaI+97p/tKDd92IP8XXFmUFSmxvyMX
	KcZ4jFscTIxEQKCs5fY0Yyaf9S7mh6PsVRobqA/d0WvLpjSY5f6sYSyAh9gKwB9XbsrAOrHDT74
	vUDppT2NtoFwocK+Q/kYeCLhsLO6C4XDuHdcQDWNTQiEAjphtwXdiRz6I64w6aUkmnnOEqwniTd
	4hhYJ4+k5gv5zmgCnHe4Y1njCuFMoGcVmBG2Mo60Z3hLe9h8LaAcYtTZQ0BV2ToYVCYTSxWYGtq
	yKvZi2RaF1JcvcCm457YPSAX5OsmjgL660yRV/DBTEQItyrAQQh37ccHgNvc5nExw==
X-Received: by 2002:a05:600c:1f8d:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-48556711dfcmr249593325e9.32.1773699032468;
        Mon, 16 Mar 2026 15:10:32 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f1d:a900:d899:a285:c20c:fd3f? (p200300ea8f1da900d899a285c20cfd3f.dip0.t-ipconnect.de. [2003:ea:8f1d:a900:d899:a285:c20c:fd3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm19776095e9.14.2026.03.16.15.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 15:10:32 -0700 (PDT)
Message-ID: <265f6584-8edd-48a0-9568-a9d584b9ec3a@gmail.com>
Date: Mon, 16 Mar 2026 23:10:31 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] driver core: make struct bus_type groups members constant
 arrays
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
 include/linux/device/bus.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 63de5f053..c6a3e16b7 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -80,9 +80,9 @@ struct fwnode_handle;
 struct bus_type {
 	const char		*name;
 	const char		*dev_name;
-	const struct attribute_group **bus_groups;
-	const struct attribute_group **dev_groups;
-	const struct attribute_group **drv_groups;
+	const struct attribute_group *const *bus_groups;
+	const struct attribute_group *const *dev_groups;
+	const struct attribute_group *const *drv_groups;
 
 	int (*match)(struct device *dev, const struct device_driver *drv);
 	int (*uevent)(const struct device *dev, struct kobj_uevent_env *env);
-- 
2.53.0


