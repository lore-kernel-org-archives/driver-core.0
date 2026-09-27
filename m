Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD3439F9C
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536821; cv=none; b=oQwCMeQkSFUBBd6Pun54BowcxcAdHx77qyrCnAKS92NTreo45SflU+FFOt2zYO2zCT8uEVeu9oJBki2ZEGp7B0Pf3Toz66dAViwcBPZy0O35WBlojUfO7Oeycrnvgyqdw4Eg8rUZCP2TOFjQHfoxYD/sCLAWoMMyhbDPn6yCv0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536821; c=relaxed/simple;
	bh=Dsi+PgjO41x2VtjYExfHIy0tp/9a5bzvYlJ6M6e6TFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mU0Bgm4HcxE1jQvCozbVtEp89UyLqBfZzMc6vmmxg/HxaC2Dvr7JM1MMvEeX7sP56OTTYJRi3CitVWfUzEIp+0ZIoE09C7mXgPiQi1EX1tBBbW1Rmh1YXpb8I6KPQZ+3jrsrCjbm4HQNwjmZWbYwcPFqQTsgAlkxAlcrq4L5sec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pa7wHPxj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pa7wHPxj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso6352345e9.0
        for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790536818; x=1791141618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCahJ3O+tXX0CfGzclDhULcHGoByJJvACQgWnDRt+Os=;
        b=pa7wHPxjlwgwL9L7rwyxJr6LFJIjt0jddTeqxw36dpyUonjg74bSKh7/qPaL90BGp0
         qJgEz6rf+weVMo3RqGZNF6uita1deZfKA8lp4trC2QSI3n6i2TOIbhbk1WL4PYNkjbBz
         VIyvd8Wv+d1kg7ijjbzziVMt9GZM1pwTl3xNjtLoKRUlpVTNhPihj424x8YAjnM7XPKu
         rw/D2w2Rv4dOtCY4RP/7IRc6lm2YqZA6g1aJoQtK1oLRUTUTODhHx6EghuwAB8teWVPo
         LeYmh+8h7XNhrJOYF07l2AY9uX/XXS3LS0KqMYyO1TxY+8v6mVh2p6cZIwbfjNc/mH43
         PNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790536818; x=1791141618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCahJ3O+tXX0CfGzclDhULcHGoByJJvACQgWnDRt+Os=;
        b=1cIYFO+DRkrvlw4nG4PMgSsJnu7tCoBLQkm3QGw+BAT64bQJQgS9padqJOKA8QV0PP
         BihUZo5fgszVFzWJ8GhEyYapGlPRSnR8B1EZc+SyWde2bNQE+WCzBUbvQJ0+BRGpFc1g
         TOColSTZJhPjUlxaHn8BfBK/MuWcad/2YgAUOn/YoVoflXXeU3ynpQg9mn+mvOGYVvor
         gAZBahiqAIO7n8vPPfp1h7FrR6keAumzxdYxgJUJmPDx+EdiQkHyDwpxM+mv3hBASEix
         TjbrEBYIc97MXfcvog7cF5XUHfO7j0v34EUw6BqRnCn3v7WD3yBJrbhiK0gSsglewuIs
         v5tA==
X-Forwarded-Encrypted: i=1; AKwUvBxX0Q9H+0Tn2xQHJ3FIBa8znlakAA+bHdLiR7oj8Uge1HKstoe0x9HOACuySCTY637zo7DQx7VKJwiy+w==@lists.linux.dev
X-Gm-Message-State: AFuF++lDxFvyyzGKj1q3mjcUClu4c5v064Dj9wXvb3pCXCK6dtksGQmb
	edmZL/RNI2WMin+kV1e2ZnoUu3u77sYUBQowsdDeX2nnSX1S+1fwiU+h
X-Gm-Gg: AYBFou0o9EN8y1UTVfBJs3jOtuTyquqcf53lVdZWdQWVpOsn/1/wDMGrSbtzky1EP3X
	ccsp9GAuyXu3GW8LdYYqsREoIoXAyRhoLnVvx9mB7DTPWwJsCy7zAQXFkmYGPo9+ZyKNi8U7nIS
	6WxkI6JC64X9/2Ty0eIb3rj4zpmTtkroaHVgM0O2REJSIeo4iGV7IBdRcUrNCYusUM5iv+H9P91
	yV5BnmFuK7hFW+9SYZzeLFKCFtYgryULK01g6ABvy5DDpmWDU9VoyG4CD2gZS3Q2W17o8+bJiuF
	G1YHJzr2GHecCrrzmit8qk+25eX0TfF1w8ERxxj+AQClAx9QKQdy2f3xo8ADqX1gRVlI8p7HVOa
	mPQWiTgnuIE3o7IqzFlRvlV/ihnmEivWGpLUD1b0clw/GZkjFnfp+xKeEl0TQ2xguaiameJys99
	CQOYMphqmh7MjqI/NSuweu0V20+/87OP6mIBcfjX59nPE9J4uYB5NLmPqSg4NPztWUvBssgBYP9
	4T+wkBV4W4ZXYv546JEaTjQEnSTSbqXvA9/Vy5msUzkJID/9Akt+2zRLug=
X-Received: by 2002:a05:600c:4f89:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49fe66c80c8mr198488725e9.2.1790536818014;
        Sun, 27 Sep 2026 12:20:18 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0017998dbsm117774805e9.14.2026.09.27.12.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 12:20:17 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: david@kernel.org
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	brendan.jackman@linux.dev,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	hannes@cmpxchg.org,
	jan.kiszka@siemens.com,
	kasong@tencent.com,
	kbingham@kernel.org,
	liam@infradead.org,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	rafael@kernel.org,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	surenb@google.com,
	vbabka@kernel.org,
	weixugc@google.com,
	yuanchu@google.com,
	ziy@nvidia.com,
	David Carlier <devnexen@gmail.com>,
	devel@lists.crash-utility.osci.io
Subject: Re: [PATCH v2 10/13] mm/sparse: remove SECTION_MARKED_PRESENT
Date: Sun, 27 Sep 2026 20:20:13 +0100
Message-ID: <20260927192013.144672-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921-b4-sparsemem_cleanups-v2-10-54d81d65e125@kernel.org>
References: <20260921-b4-sparsemem_cleanups-v2-10-54d81d65e125@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 09:59:02PM +0200, David Hildenbrand (Arm) wrote:
>  enum {
> -	SECTION_MARKED_PRESENT_BIT,
>  	SECTION_HAS_MEM_MAP_BIT,
>  	SECTION_IS_ONLINE_BIT,
>  	SECTION_IS_EARLY_BIT,

Hi David,

It seems dropping SECTION_MARKED_PRESENT_BIT shifts the other section flags down
one bit. crash hardcodes SECTION_HAS_MEM_MAP as (1UL << 1) in
pfn_to_map(), so it now tests SECTION_IS_ONLINE: offline and
ZONE_DEVICE sections no longer resolve to a struct page. makedumpfile
only checks bit 0 and is fine.

Keep bit 0 reserved, or export the bits via vmcoreinfo?

Cheers.
