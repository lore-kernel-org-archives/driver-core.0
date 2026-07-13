Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF6235C01
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 05:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919034; cv=none; b=O38vrfvcaEJadb7xG7ONLKNU0m1LmV/LfpSXEw/xwiELZTZFbmQE3hQaDTerk8B2I3YqqNkE0e7SQKeqGoZO6kR/OVeTp/aHkvFkCqVlmcOs+Z4epr0f4P+3Dl8YikGe4pE9qLsRDKS610WwdBg0Xw6qn5zdW96UHWy6d0Jx/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919034; c=relaxed/simple;
	bh=rqn2PoF5poebkTCa6B8Yxh36blX/B8UQ1my3nZhOTFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sp0+LPzeME8z1w3duu1/JqPJQMtyAEFiLWQ6bG/sKH0xBS5d9MsWMgU0ukkRdIJq8yz5pOcUVmqEe8UF0ceB4XyLKYmOx9U6BsTwQqZ16uI4Sao29r4bBYJriitQePQfWmiShQpf3EM0Fu61zY0J1d1EDFp9KOwbqLudeTIZc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqSxJGIy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqSxJGIy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc97653887so30238925ad.1
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 22:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783919032; x=1784523832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rORoi9vSF7J7ID6gWdWITj/vYVWNW4l6d/liasSf3G0=;
        b=rqSxJGIyqq0YAlI/X+6wfIOEdWx+6+8emmViAGyeaXjx34VQhU32VD0yqhGiYMpYY4
         cE6EPkafMswkRs8pl1ok0hZOoORaIWbbJfMAWV/+eNnVdUYxTrxzo9JSV3RFe2oXHwsY
         9CsyiuqkM8U9aZny1hjO9sj66MpyMFbltIGyFK2VToL8lSaV/esVXE0mse5h4YL5RcIq
         Y4s0oQJjmnc1xyjTZkHkwGv9XTflmaOTVuUlFxW15CBI7KGhagBZQzpUDvL0XmWgdO24
         EmuQSPA0KfWtLmNVG21uPhOmIYPkIQFa0HogtvwsiXyjSiLzCfIjsOFa+jPRFo3IN/s1
         toPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783919032; x=1784523832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rORoi9vSF7J7ID6gWdWITj/vYVWNW4l6d/liasSf3G0=;
        b=YXn3jeETSwHSaMnNgK2aq6yb79pBKNgnmktv/29PYjbx/sXYZyL1Cmnj8/93HWF5cO
         urlLwaF82ZOdAAUnatN0oBjeAooL/79N79gAyzC4THZcboU/B0mVNSH68B1YR4dRb9fw
         P3GGiG/8/7FCSQXDLsTQL/BoIV6Q0h3cajwOaT25x6TqkSNuSqhGL5z1+e7CEuUO72i4
         kwm2zo31TVQH+8DRzul4ywCghLA5jBKQDy3Ej8J3Sx1lu1Mwxn7Cvcwz3x5d6vAcmDnk
         Nmgq4NebQ5+AjaomWhmZLMD4UrN5xB1neN2YsvgbD801XJvwkx0ghBCqD0ZUfnh1yOuD
         4jIw==
X-Forwarded-Encrypted: i=1; AHgh+RrbzQnuaSWW5wMkeqmZPDu9i7memY+YWwFMNVhZtDxx3M4c6jFeqauNMH3xPMKtFXt+mnedc5mPBpsHwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQNJxI0Eiyk+qEJaIrDaL61zxUv8msWAtDJLQZw3ENuxcjSYCG
	at3KZbQymJOzYFM1o/zW01p6y92zIgjv7ACTzESn0v/LIb9eUY0TCJUoQpCBh5qk
X-Gm-Gg: AfdE7cmfSqk2P6eP6TiecEn28fSA7lrM/8mxHsL2ro3fyGc+XrP3B5rTnFxEbuoCh0o
	ZFi6kKXGELnn3YoDiNmRTwvEKrtpuU1Biv+Zyv6ZvJfbBaZF8q+tCTVnSEeK4F28g+hVeHRUKVs
	3k6S3MicpiO76xbgDuW4DiUk5vrWr7ZWNElXeOoHtS6S+AO3LChVyLQ3N1PqpckJGJ434RoTDMq
	FsjJn9/IOEChPFSturFXP0EGr4w6FCkA6Kzzg48v7isjnDTZfukjKOmIsaLt+p2maIfDqGkboIe
	4oS/n6NAocjnDtmAUz4Uu5IRsJI32JFuzjlqoDPCR01vigEqoRxREy/NJmFK5EeE1o6nW/gQRYi
	DKF5Nk3DQjqg7JwVEJAoh0Ip1fgG5yeRwPxm5tCTDcoZ65N2HxIOkEazCv/B3JdRdoHZ354PmZU
	TWZgbf40rOWqpZKkANVpPJsdQ3dWLNqm19ttDw+tRSlX4wPJT5gc/hGP+VMw==
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr8215956637.50.1783919032100;
        Sun, 12 Jul 2026 22:03:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm21927368eec.29.2026.07.12.22.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:03:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] regmap: Improve error handling in regcache_sync()
Date: Mon, 13 Jul 2026 12:03:10 +0700
Message-ID: <20260713050312.38729-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

While working on a cleanup series converting mutex and spinlock usage
to guard() helpers, I received review feedback that regcache_sync()
still has a goto-based error path.

https://lore.kernel.org/all/95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk/

Since guard() helpers should not be mixed with goto-based cleanup, 
I looked into whether the error handling could be simplified.

During that review, I noticed two issues in the current implementation
of regcache_sync():

 1. Cache synchronization errors can be overwritten by the result of
    selector register updates.
 2. cache_dirty is not updated if rewriting a selector register fails,
    leaving it inconsistent with the cache and hardware state. 

Together, these changes make the failure semantics of regcache_sync() 
clearer and eliminate the need for callers to invoke
regcache_mark_dirty() after regcache_sync() fails.

Best regards,
Phuc

bui duc phuc (2):
  regcache: Preserve cache synchronization errors in regcache_sync()
  regcache: Mark cache dirty if selector register rewrite fails

 drivers/base/regmap/regcache.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.43.0

