Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538349;
	b=znaGsbLbMvrALGQGPC/HSmm+zw/nWYUGb6X/HQsA4h/cBS6reOiEPmTmlQTNNUwdrgvy
	 ibEv9dTcfgmNc/jUEPY5M2Wbtp843a088mF6McztVINOXDR4RpIBwxzrwS90NZSqedt2a
	 o5byhkyg16037kEb0qdABx5M8GqUPQv0YYyGJp1IOhWnEkMxHkn60/AhtdyRo9KjL+jQG
	 xnBNmqtakQ0Zk5LwrozGkZpXd3SMB3M52eqSDamw6QBRCyzTup4UDV0AuCN+Rqs3plMkk
	 Nxr30CEGiNEp6GHaN34V32uUbQtaWqYmDhYuiVAQmRMXKfUKHNq3gEC76X7N6POso5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hX9If82pAfpMeK436h6UILTlGZu6cFz55fiDFmFfVLs=;
	b=WkJDoGMZhRQz3jeJoznx7n50U6p7Js05OGZYyLqM43JLNGeWKbxsl9J5ZIyyzfaIgT7g
	 NB49k5E63YmFQWyhIqTS/6pX9TVExt/KaWH0QOx5br+x144EfsV4bGuzsc50YPfSLf4cl
	 ymtW3X9KOXfM4YKS4ZSEUP4s9kPSqhe0HQoLkF7QP0C9ocPyUe7CZoqhphYDnBm1RyJI4
	 fQ+laP78EGvAB8MUZvgNpCBqidXQF6v/1dgBw8TktxcUA57BwUqqcc/FhFD8D0nkkMNsZ
	 UwJHYuTVjLcwFvEkF+t8s0Rq8lCNlcGRuwv5gzij6a9914j04BCJNuan4kcge1Jac+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GOC6kV5I;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626FC606A329
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 16:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626FC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=GOC6kV5I
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso6590590eec.0
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 08:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538348; x=1796143148; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hX9If82pAfpMeK436h6UILTlGZu6cFz55fiDFmFfVLs=;
        b=GOC6kV5IV7AMBzNkBsQxPAQiX98K/v7N5Xhm8FvpVtarN/j9SDxosGxNaiLfyVTh41
         7RrS0msVOH45Mop2fkvE4Q7V94l7EXpSIjUIzc8ybOtO6SVXNeT717XcIWCseoPEfOjA
         I2ebGRtUP0/kSXyBXD9YOcj2LK+mbZFTHFI5dUiTa+EPRjCJnTIzLdekiv1Dak510tOm
         89+jW7T/0tyZHpDjGx3bR8e7SdssTa96Wd8oDKpiKgzFvwjVwv/HC6hzppNnONRp1ZLp
         53Kth6toHULwddbw/zvGxRBNFEEQIFOnuNbBpLgazfbKAma2cco8BkIdYOyESlZk3sJf
         qgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538348; x=1796143148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hX9If82pAfpMeK436h6UILTlGZu6cFz55fiDFmFfVLs=;
        b=R2a0KbkZ2J8v3SBdNtCz1dAVurovy4LXMeQY8oNiuHtt0bDdlsy8ZbtGGnup4FnqC6
         XiGRKASAiv2RNmVjPpjxwXmH680i7EzmY85epySW1QF8VLZOQLCi7ZlFLkSjeDQbzhMO
         /aPqdE/CpOrxsDC/0G4QZidnUIs5hCZWGuFkyJ9R0GJA+1z3K4dzY5yqtotwEiq9zv2v
         n6emrnpW1PU7oqhQt3FxaVpIH3ef+XgjRYR4c0vu0V3Mgp24MMep8P3Df+lRJskps7dZ
         us24csVFToln/cM3cjAsAkRB4yX0KLbneoIQrujn5amnfdeWTQQERJalz3Eo5Fxw3MEj
         K2EA==
X-Forwarded-Encrypted: i=1; AL+hErFZI51QVeMeDaUu6TTXQ5pHBp4Z0noLljAd4h8ewSdv+cfu98//aNmK4x1FWoPhWY2KfFUpiYhSnkUXiQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FXSj3AGUbYY2VqDwGWd9t83q2R6PcDVmOsI+dFLH8PaKiJKc7
	1JqSJ1Hd+No78riKruZyrdVslqEd96rgVuz3lJN/0mnkheyrVNqsWNkl+sHUf+5znzTRHxSxaJ3
	d+UyW7HivfS2DcZs4/g==
X-Received: from dybkz9.prod.google.com ([2002:a05:7301:1a09:b0:37a:8a0f:3aba])
 (user=zhichuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr5074472eec.34.1795538348114;
 Tue, 24 Nov 2026 08:39:08 -0800 (PST)
Date: Tue, 24 Nov 2026 16:39:07 +0000
In-Reply-To: <20261124161713.263759-1-zhichuang@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-11-aneesh.kumar@kernel.org> <20261124161713.263759-1-zhichuang@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124163907.476312-1-zhichuang@google.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
From: Zhichuang Sun <zhichuang@google.com>
To: aneesh.kumar@kernel.org
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, kvm@vger.kernel.org, 
	driver-core@lists.linux.dev, djbw@kernel.org, jgg@ziepe.ca, leon@kernel.org, 
	yilun.xu@linux.intel.com, aik@amd.com, thomas.lendacky@amd.com, 
	ashish.kalra@amd.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	bhelgaas@google.com, jonathan.cameron@huawei.com, lukas@wunner.de
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 04:17:13PM +0000, Zhichuang Sun wrote:
> A short clarification question on this check.

Apologies for the duplicate. Jianxiong and I drafted this question
together and he already sent it; Aneesh and Jason have replied on his
subthread. Please disregard this one.

Thanks,
Zhichuang
