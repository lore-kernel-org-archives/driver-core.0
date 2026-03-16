Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F5E36F42A
	for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698918; cv=none; b=omflmtFMisMEuLoQM4yeEajfdJgRq3D+52eTSKkfdJ24f1d9omV1X6sa4Anrw92+1zLHlROe82tBGsYtoaTx/lU9BNxOxpvhNmem8d93ajstbvPvsOJDdCgF8RQ3SS7HXKcaXotoe5UKeLbIuOElTWrvSsLfYVc1RFbCwlgE7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698918; c=relaxed/simple;
	bh=9Hq26TRhSBUT+kUtGoB5gXXS240oov8HRauCeIqWiEo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=M03MPdCNGkzq0UfIrulwJAPpyENgxVpb9AGdvtM/840IPu2rHih1On4BYXg8ABu5S23YCU3LRZEf+ZbFpdk8C/i07Oza7RZuBrVFcfEFU7peuA4yFrOo/I1JGLEJyODytwZ0ej2E7tGkvIX4nM0v1JGnLn3u6tsNi7mFjUpOHT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRYGzgYB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRYGzgYB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso45822555e9.3
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 15:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773698916; x=1774303716; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxsgDpGimFZWfn0fLlyFu/9xJqh6zQ+0+L7YzkdiFGM=;
        b=JRYGzgYBD7ylzpr6nR5uHsgTx+Erzbc6ed9S9vOx7flmqKAfQdnw84YsSWy+oK5RPB
         T3TbINrXdxaOdarUf3LKSXHLaykGVauqcvcCtf01SahgmaMOL7M1h9WMeD2iwGYYC71S
         qJkn48mlVlk6cyzbjFcMdQdHat6PHfPBugiSp/V3K83cyyH+ZJIkimzFS8VnzxaxEgdn
         eYIxMhW866tRJUhzUkn3HxA+zj2cd/A4yTr6c3y1reg+I/3FNCJ5IAA0AHulSsXc4oI9
         XClPIUf6YI5AxBh/sq/gVfTZO6h6+4m0EaPD1HgsmV8bBkqcWF4A4KtfAyUi2n65ZPBx
         DvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773698916; x=1774303716;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxsgDpGimFZWfn0fLlyFu/9xJqh6zQ+0+L7YzkdiFGM=;
        b=KtFfNsXo3cQRUQL7GAac4Si0RdBEIok/RisqtOlmB/dV8PXen6wNWLCnBO82kQ5oAO
         P3nyj2UkBEcXrSVf/cjT+MqDCYGH/51L1AAM8gIO8yVYc7q6mnHBNsTPTa+byI1RAB1H
         u65WMtX2YcR8MMGbyG4sf4z8iqh6E3vLXU/4uKvt1YyI5VpTL9j/OSdqqbBsCOakRCsW
         gZVy/UoBecP/pFJA2ZrJ23XRbcccTFYbwVJx7vGJoXPN0rfph+4Epq+NQbDj0HCEbcZJ
         JHtLz3L76VCmvRcbbRqLFd5bkfIs7T1dIuJFGpr4VqzHms9NnNdEpr9Ds8ZQNxw81WMq
         m2fQ==
X-Gm-Message-State: AOJu0Yw/M6vkB4froAeTOGxaLvpDghxN9OymzZHb+Z1fko7xCY+ZH5/G
	blzhAFHExKy5gUBfcsdxLPMWQlMyjwgONmsPDk5ttMMBdDhl4rqO/XFV3ObEZw==
X-Gm-Gg: ATEYQzzSL5IUoO9WBDY9E6agh1HKq0rD3zsD/jnHmq+Mqmc3Ehfqmaz9rr9l3ZGwBig
	sdl9lQiBUbR6EnhGHL+pT7o1n1sOZl47c+iBXh0pFNJKxRPv+868ZcvcRAY2hsheSnkC3v8Ecid
	jy0Ye7jZfYx7Qg2IfRwcBAS4YRFgdpnuDaVhSAZKpBrCb10992TJWQ6rmXT/akPQe1ZYVckxcCU
	GXLIwcDr5XYUFzyRN+mT7wDzP+zmk8NfdEJl/0QEEvAf+nARu0XYgJ6AlqMZu5n/dZ8TVS27kKW
	ecRjFfIstUrWLV2rHe7llPnSE0SLI7y6yEe1gjSiriB42UvL/caucDUwgzHwfqDm/373DQJB+c0
	LFVByfFnof2wvpE7DWkeU5XsZu8Oth278MLejmcsCqdVfu++PBTgQw257sUHpexEI0b2/qkm4+0
	JEbByZGI3PoWzBZk+V4XZMijnCSAi7NfdrfJFwBMtRVLVcm6hqlmkQqDeNj54WnZ+oCwm6VmKv7
	ca4okZ4+NJ0/8QEnrZAWlJNswsaeoOWue3fILlc/2dzAz9fGT0OffzODAGqCyiL2m841gZMLRGT
X-Received: by 2002:a05:600c:8488:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-485566d5162mr235354165e9.13.1773698915643;
        Mon, 16 Mar 2026 15:08:35 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f1d:a900:d899:a285:c20c:fd3f? (p200300ea8f1da900d899a285c20cfd3f.dip0.t-ipconnect.de. [2003:ea:8f1d:a900:d899:a285:c20c:fd3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2186e3sm50842426f8f.26.2026.03.16.15.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 15:08:35 -0700 (PDT)
Message-ID: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
Date: Mon, 16 Mar 2026 23:08:34 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/3] driver core: make struct device_driver and bus_type
 groups members constant arrays
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series constifies the attribute group groups arrays in struct
device_driver and bus_type, allowing to assign constant arrays.

Heiner Kallweit (3):
  driver core: constify group arrays arguments in driver_add_groups and
    driver_remove_groups
  driver core: make struct bus_type groups members constant arrays
  device core: make struct device_driver groups members constant arrays

 drivers/base/base.h           | 6 ++++--
 drivers/base/driver.c         | 4 ++--
 include/linux/device/bus.h    | 6 +++---
 include/linux/device/driver.h | 4 ++--
 4 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.53.0

