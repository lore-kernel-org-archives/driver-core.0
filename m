Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729993;
	b=0yObND70LHljIOw8Olj/+ws8leESvpgqsRKYXuOsj7x7xqTx5uq0WXpilmPyFsmsgG6o
	 tiIqTXfnPZECs8A8lS0vs50RZxf+QNwTC8qO4LvPs4zXdj3+TkOUtVp3E0vfgAwe5lFvz
	 LRWxvqfep8BU5FJtREcN2E/iYetA9cFjGsCqpjgWjGHNJLsFRjmDxV+O6L2cE9M3Bs3Ca
	 Ucc+d0Ip+EUmkPdQMCLyVbq+s/e51Iexvw+uzL55pwUqlzCjyMjxPoCQF7GcEwxgiBDgu
	 y0njIq2XHfp+B/Yl36cr/xJ/6QZy7uI31enmEiiCbE/f2lNQqmCAtrOI1tgJw1kj6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729993;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=CxPmNkrdL66AIfJyn1xViBqXlyUc1HsQv2fthprM7Ng=;
	b=H7akFOlQQWzfqiwQ3dcX13vntXMNbtXf8csJdJZNPBkx59c7DVE66E9q//wC0EYAkvxr
	 qHNf4EpNWT5Op7ZEc0KKFsfM6qI78zCpGUNKEGC33LtqUwyY0wuURP5n0vyZvGQ3EHNfk
	 Jzdnb1G28mAf+uCXRnD98QyouviLRZjOIw1iu8mvVlq75QMX8e2g4CuRVbI9gH18PcWD9
	 Tf3PpYDjIqEdwv4fPBOGTYBnBJmYNqjJgoIDwHgQD87IjIHrqOJ9nhy7MZE1HZalRXzg6
	 dP80r1rHeba8ViZpUdOqTYzoz6s2bN1fPjmrXy/dfDQIl/H3+f1tgcKHPV9HeFo0pSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE3A606A32C
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 18:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DE3A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so44778485e9.1
        for <driver-core@lists.linux.dev>; Tue, 03 Nov 2026 10:19:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729992; x=1794334792;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxPmNkrdL66AIfJyn1xViBqXlyUc1HsQv2fthprM7Ng=;
        b=qbzPdqbGVhPFUJFwz4ysT2fIan+cmdPAoSYqyyTwd3uUY8WyF11zBAiVKk4E4j0m20
         2XeN61Je+5DVngtbWq5gNoHcIZ6XWPUmylrcacscEsfkPJmImrEyhhuPv8N2m2hmiGpy
         7BkC4DgRKf8K3LqXz3rBU6rtiLyc9+vjWQ4qFk+po1JoGPEqyoUaZPRE6NwYHIO/S5MO
         nvkcS2cF06WWDFH75FZulM0AEjDXG5e2F6V1t39VUnEgH/LgsNgWpV51pOJFYcKU4pxS
         IzNc4Jaiqox63S0J6fTMLcCZtVKA6RpCe1pVz3itXJivpjTEEmdGcg1iHaUMY5nr8jqK
         sk7A==
X-Forwarded-Encrypted: i=1; AKwUvByHQ2tbFKnvYhD7cMIExsiz5/NqPK+Eo71y2QMM0O8qwnZvN2Sd4mlak04jDJQ4M68WIWaRmR1x3nZ9CA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9NnwLmfstFn+DKsetphVGLJcdMoJoxRhBv23S9SxhArrSBXfZA
	e5medBPVeCWG8O3EvCKeHYtXB6n2uvPv0rqFXU7+6PRwHxpsLhSJdD0=
X-Gm-Gg: AYBFou26b+ekpeuDhwQef2Z1LEzTUNliNGu8rVH1RYpvy3eUlntRyX5wTv+o0PBakdX
	KSBJRHhfFbr3uyAVAPAL66zkhJ9KlazxXrtt4C2I5g8n0egExS+W4YiGMx1qNT1as4v6e5mak9I
	+6GW3FE9Qc8jRhf8exIaXfOWpsKhB1+SJew2uFL1D4/H/bm38Mv0wtFfBzXbCmwNsTAcs2gD0Ij
	hUUM99uGI6M9bcyy8j/9wGM49hAklpv/hrXOoAN4I23r9ZW9rdBU6RnWCodkjrr0CTSPX3IdP84
	8nLzl8iI57re9h91x1wmF7aI2izYlkP/JA6GFA4jUe6/URwFiZl5hf9LCoGmlLHU73nQFPpxnFu
	ft7ZYFgH3Q2odb/Jp2LCZULODZDPFVROv7A+nmPjMAd9RR130Eq1ABrX0KYOKHb7R18UGmdgOcU
	QUPN1OYmLT2KYNWyHoVglgHaZS1ffePjZENvcE2ASg6VweVLF4VnPwbXdD6raRecYpSE4c3tU7v
	0YxFMtAS7HrgJkdL5rhuLq8mfZIUrel78ZPvGqVhZkzIXYf1v/u/TucP9LijltWCiG/ANYuUNJ7
	UPBwCvoKmhwx3rVee11N9sdG5vY817mN//iI8iBI
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr284037035e9.29.1793729991346;
        Tue, 03 Nov 2026 10:19:51 -0800 (PST)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm777745e9.0.2026.11.03.10.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:19:50 -0800 (PST)
Message-ID: <6aea25c6.9efe04cf.11c115.259a@mx.google.com>
Date: Tue, 03 Nov 2026 10:19:50 -0800 (PST)
From: D. Manresa <dmanresa@gmail.com>
To: brgl@kernel.org, bartosz.golaszewski@oss.qualcomm.com
Cc: gregkh@linuxfoundation.org, rafael@kernel.org,
 andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
 driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] driver core: fix unbalanced reference counting for
 software nodes
In-Reply-To:
 <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
References:
 <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Tested your v2 on a Surface Pro 7+, where ipu-bridge attaches the IPU's
software node with set_secondary_fwnode() after device_add(), which is
the case the series is about. Reading the node's kobject reference count
directly across a PCI remove of 0000:00:05.0:

  6.19.8, unpatched:  4 bound, 3 while removed, stuck at 3
  7.3 + this series:  4 bound, 4 while removed

The 4 is one registration reference plus three child port nodes. No
refcount_t, KASAN or other splats either way.

How much that covers: the rescan does not re-probe, because mainline
ipu-bridge only unregisters its IPU HID node on the error path of
ipu_bridge_init(), so the next software_node_register() hits -EEXIST.
Separate leak, unrelated to your patch, but it means only the first
cycle really exercises the fixed path.

Tested-by: D. Manresa <dmanresa@gmail.com>
Assisted-by: LLM
