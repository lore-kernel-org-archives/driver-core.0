Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356930EF63
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 06:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208973; cv=none; b=IjgZNiH8HV2Jlawj6g6wk14DQdwhvxFa8awDzfh2FR/zmyPP7ELfeD4EnMLdZROAmcRxBHz8uifyB7z0A46mKEAnKXsaXVZwsGYOgw+SWFIKgEjzktNZTQh/GScFo3II/Qy7d/bxb/vvMZ8Dqu1l8vycAdkJtyXj7BGG7jjqZUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208973; c=relaxed/simple;
	bh=xKxXER1QLnt9AaiiPM5WSWAX0uD27DHUOeBFaQxfKM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tttgdC2IrBZyDrKIr4biCz4b9ME5N1E6lppqRyDfnyEBozysKdepb4RrnOl4wqgrX7QzajjV7SX5zCsOw/+sx3Wz6HdyAKg7HHk+bAU+p1qiOaLVBcvlKzG6VtBxLSjAFYMHHLftu6aVjsIdVua4eaI51DVbv4UzJnAMzStnBZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrfDpVIA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrfDpVIA"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cedda2ce6fso10581015ad.1
        for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787208971; x=1787813771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKxXER1QLnt9AaiiPM5WSWAX0uD27DHUOeBFaQxfKM4=;
        b=LrfDpVIAJMJoHcyU3pY4IWsfIw/yIJQ4NhgwmNko7IGDd3gTHofyqmzk427XLC/Axi
         mSHKa/kauXgpBvwASMEAsmAuSxFgTjKRoaDuxSl6N9sAwAjTpFqgpvxEmXIFrrvmR3LL
         2yntsS37TMV65NUgYIUMdfEtPjdeUk9FqHCFnep3+vJOjPqSXG2i71uB2F4gWrLzJZVn
         p1jTikcxWymyGixpJzkjIkeh5Ld430MNDDpoD1AZ0C7CD1XHjcMAIXmsqcdOlvzvt/N7
         dDIIaAnMU14l2hDjC59YVUFR7gE2x80tWMBtDDKlq+LAXrVxQZVcGcXLFT9Mk4sgV0EE
         o91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208971; x=1787813771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKxXER1QLnt9AaiiPM5WSWAX0uD27DHUOeBFaQxfKM4=;
        b=hxekfnoDmKqHCBiLm5kFihfzbmjU49ms22kAEw0bj+Noq+dF0ZRzVJhSLigykulhwm
         mCPcOlTlVvE5i/hR/9YcltkcFtQFJq4GsuCSPE82ITVmu6rTkHccuXfpdCwV/6Ncket9
         NIapLz40CimJwVXzhKpTxi+Hl3R8HLTv2F+CvKIhu9l7gvcUHJFP2CkOUAxGsyL71F4h
         vOlqGUPZdrsES228MkoFglBBeeBlkPcfNqU7DwcwtsiDY8osrb+BSu2JOYF2hCbvOeeA
         8ilttZVVXAuT+jyFYHPfs1qIkCluI9vabfeTasCirMc05UdOMUqyXjkHKSnifrmizIe+
         4/gg==
X-Forwarded-Encrypted: i=1; AHgh+RqdNyJZ1nG1a36KfiWwOEfHeHhJSGydwDGp4QiuYKgHAgfHKXrwEWUc5PSQEAnSYVB+5liiz4ZJyYppsA==@lists.linux.dev
X-Gm-Message-State: AFuF++k6nz1rXSiNXLBr6PSUYTsn7YKEtP9NgdZKtFRZOy+LwOKQNDBv
	SfO+jNlX2MnTlDGVwUmhRjzeGNiM7846MwKI12twG5B0PjfPHB9HK0J7
X-Gm-Gg: AR+sD10Z/GmDt8Pw02IEoGJVRNz/o4AUzqSfEqUwR5jvz7wpXOCf/+n6roNdSxBa8n5
	kGdtLKsHJZH/ejrGA1Sb1bMYqbvZ5gbrEN5SITlAVbK2sdE9MYcLPTF+pPir8fMW7OsbfhULPUY
	/hVIHFwIz8K0PwY6OnxjAif1FhmyiWyW+oXCWOGZ0PD1mQvZu2NaHyBqC9vPeO0XZB9eYExw0W9
	AT5TxwxvNs5G0NhcAlWKNtkZuGErBMbiJrcwULZw9qBX0z9rjOi6T1y+o/BO4vnshQel3+tKTst
	NhPf7G43QmbtCB5OchboI25rpFuA6YqZKqXP5ExS+zU6ZtyQIH3L4gTUVnVhO+eViX11+5PiovE
	9C3k9pPVcM67E2Z70gRJiCZMLICZhwRUz+Is7t/sQRHKmVaXYs369+CTTGsjEZ98ZQLGXgmaHTO
	RcYytanFzPLUA+MtezkNps71o8s830s8oGgcaJNTiXCkFwOfEGOBEsYJL3So3MoTuQdnTnugi7D
	FJdCM/6yojk5Q==
X-Received: by 2002:a17:90b:3cc5:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39580f3bcdemr20614021a91.10.1787208970791;
        Wed, 19 Aug 2026 23:56:10 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10b584sm22999099eec.16.2026.08.19.23.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:56:10 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: Re: [PATCH v2] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 14:56:06 +0800
Message-Id: <20260820065606.78768-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026082048-malformed-finite-4e61@gregkh>
References: <2026082048-malformed-finite-4e61@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

v1 used klist_node_attached(&dev->p->knode_driver). v1 passed the syzbot
test, but after reviewing the code again I realized klist_node_attached()
isn't really the right check at that level -- it's a raw klist API.
device_is_bound() is what driver core uses to ask whether a device is
bound, and it also handles the NULL dev->p case. So I switched to that
in v2. Nothing else changed.

As for syzbot -- it's just where I find kernel bugs, and it can test my
patches for me. That's all.

Thanks,
Kien
