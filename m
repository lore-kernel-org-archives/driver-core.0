Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1A2D7BF
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518521; cv=none; b=AajSRChdO9gZfdM8ubxV1c+Gdun3+bS65XdBEt8FXjHi+TFMjAUqJQEOBP3kvjc/susUqhxmyWjFkvG+AbLFcK0RaPiHrPr1/bGy1jalzes1P9BD0f0Ep5XAwi0x0joSXx5X8+auqTbU9SVoqvbq5VjPLKOTn5ezXaTlHYMeIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518521; c=relaxed/simple;
	bh=Q5Qk0KHQjVZbp0lFmVKnGWZtxtkKr3ZAe8XmELX1/6o=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=PTI4Q9TixTIIBZ/K9mY8tIjhMx1hl8/XjjRy6qmF4OBsCIlRSKQU9SDKD1ODn1DfKFpNG+KQtTIyrDea3dlzVumPuSK8ik+uIPzsuAfO2oqoVERiKctL9Vm5RIqVMacbIPIrDQKUeHaXSQtmoRaeeBYWpEbFpdgLvAHdk4Wm7ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq3taXGu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq3taXGu"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so741335e87.1
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783518518; x=1784123318; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bzsuqGeu2ZztC5uiYt7ZwxUJKrCKRdPms1njvftvolk=;
        b=Nq3taXGu70vhf1bfTms1NkS8XpcfNdnMtErhXqJ2Qiu8eTKPut+s9u3DCIjWnNI9sa
         Q6Ad1RUJQY2Ta1uM/xJ7JOJ3skrwmJcuUDkdcip10JOiojIJIVWcD91dKE/zO6gT6mB8
         jrYCklT+05KtW+It/rZ/LoiQGQ2nKZH+snHKD+k+/4mc8Do4HgtMjpwleQnqdo8aXpkG
         bWFsbK9svoUyeI1VQHNmN/i6F9ZJTevaU2J5ClWFGyUCT9IYgIjiBvjbGyU6p2atkHdw
         EH+A6Og+35e3Y3JbqiaM0LfuHMS8UI++7lJgYffRCytJAHjZFuBeWdBszMxv7yhuF36O
         7xDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783518518; x=1784123318;
        h=content-type:mime-version:user-agent:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bzsuqGeu2ZztC5uiYt7ZwxUJKrCKRdPms1njvftvolk=;
        b=NT7av26cZDZl8UirpvOjJOWNKAzWoFg6GV7I/5jLUjEF3SKj8XmSTASdCqfZjXzRiU
         DXtZVDPDF1DCJou/8xrAjIN24rJ3Z5DC8cowacjg1uIxO0rxg//UgD9RB9YbqcA2gHdT
         HygSscu2JkdsdKQiWZFLh8JP3V5A8qsfAkSz2oEq7ciLssjnnQaMDpo375B7X3Sv/8D2
         DbpMlUtXoNu2ktW6l1zLn+5iSmHxuwj5cJ9jwgaeZgzgYafIO0HCVtsDo8Ke+7juRLY5
         tIjCeic/V5aCKjuwvpo+OtRSmC+DoIc4Uxn72kmSSxA/77K/qOjYx6LeUSEOlaHdE1uN
         Ztxg==
X-Forwarded-Encrypted: i=1; AHgh+Ro57hXyaMNbPGB66KnjtBJP+4FAvkLbR8MErHyj8JXkPOGgPO4GuzddGjHXK/Sy1vRHhv4sd0wyvSW7YA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRQeNlmde3/XYRl/q0q7U5BdJobAm2ZrpyiQ8SEgOmmXpuHljP
	NLP31WwHtMuvHNZp9iLYjjrbx3bCIR16UGsPRPnuR7EhsxxzJwfIWn6b
X-Gm-Gg: AfdE7ckCjIiBMoCnD3J9dA5yJ5wUq9iKzL6ynMkeCgYJijrf3KIACvuZUn5aGMgNScS
	FWhF78e2yfPvAOWB4xAMZDgJAty3p/jSSE0iuvPzzURT2FKSrrE9dxF3JhFtgUoQ5g/1NMYj7rx
	bjRbuvuoXWxONZdwhdvLaE3FuKxRiMB786AD09YGS9jq866oxO55L6HBNni3D9N1qe3le7fWysX
	mUWJGDcDtZUqdXMLYgDvofmnKZpoGrh5zo6uZSd7pKdFbzOYhqSDBCOQm38ZuW8uLHACWyuvENZ
	Wc6PTQpZ39nNRHAVgNJvyOSZQ5KgrHC4A6WxHsUDgA0dIjbMogWo2nbxISDr/Jb41TxUNzzmrqn
	cimjHeWcU/5Ao6WnvWWtB2As0n2OA47SbRRDv5j04rFlk/aSSOTIs3/dEwHqxBoQhIT3UG6ym8X
	wq+yNgZqykfMFMg5FK1BAD844ylgtph00tEc6Og+bpFHG2pM37
X-Received: by 2002:a05:6512:66da:b0:5b0:eda:de34 with SMTP id 2adb3069b0e04-5b0114ad7b9mr525977e87.43.1783518517539;
        Wed, 08 Jul 2026 06:48:37 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:eccc:7ea2:9458:892d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8dcsm4528257e87.11.2026.07.08.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:48:37 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev,  linux-pci@vger.kernel.org,
  driver-core@lists.linux.dev,  ankita@nvidia.com,  Alistair Francis
 <alistair.francis@wdc.com>,  Lukas Wunner <lukas@wunner.de>,  Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 01/15] netlink: specs: Introduce multi-message blobs for
 SPDM
In-Reply-To: <20260705220819.2472765-2-djbw@kernel.org>
Date: Wed, 08 Jul 2026 12:13:57 +0100
Message-ID: <m2y0flbuoa.fsf@gmail.com>
References: <20260705220819.2472765-1-djbw@kernel.org>
	<20260705220819.2472765-2-djbw@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Dan Williams <djbw@kernel.org> writes:

> The SPDM, Security Protocol and Data Model, underpins PCI device security
> and other use cases. It defines objects that allow for verification of
> device identity and configuration. These objects can be large in size 16MB.
> Netlink is otherwise suitable to define the operations, with optional
> parameters, and notifications for working with these objects. For example,
> operations like "regenerate evidence with nonce", "mark evidence
> validated", and "broadcast evidence / security state change events".
>
> A netlink 'blob' is introduced as a way to teach YNL that one instance of a
> attribute may span multiple messages. It enables netlink to convey all the
> data needed for verification and manipulation of SPDM transported evidence.
>
> The schema change to allows YNL to infer that an attribute may span

change to allows -> change allows

> multiple messages and interrogate its length to preallocate an
> appropriately sized receive buffer.
>
> The design direction to extend the netlink schema for a "multi-message
> object receive" case was the result of this discussion [1].
>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Donald Hunter <donald.hunter@gmail.com>
> Link: http://lore.kernel.org/20260318170014.6650d2bf@kernel.org [1]
> Signed-off-by: Dan Williams <djbw@kernel.org>
> ---
>  Documentation/netlink/genetlink-legacy.yaml | 6 ++++++
>  Documentation/netlink/genetlink.yaml        | 7 +++++++
>  Documentation/netlink/netlink-raw.yaml      | 7 +++++++

I suggest you drop the changes to genetlink-legacy and netlink-raw
because I don't think we want to support the blob functionality for
legacy families.

Can you also update Documentation/userspace-api/netlink/specs.rst to
describe the multi-attr / bloblen API behaviour.
