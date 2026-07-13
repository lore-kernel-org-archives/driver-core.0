Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBFE35F5E5
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 05:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919040; cv=none; b=fmbgAw5HMMYFnYKPnky/KaUqkJ0QYR2JBKZtGgSmGoeSaQ8dRBs+pEQioSjcCWtdkzlmAI+sB/V91Ny2TQa4gSfW9kb7k1Vkiw/9v9ROT0a8UkZRf8fay+CPd5ChVlFfgQKEfsEku1MRnjggkRi53ArX19tN5reDHYTj1oZ+/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919040; c=relaxed/simple;
	bh=4Ofl7c4XuiU9yubmP+sbGrbwHh0Guw2M49NBZqW7Wu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhYX6zjabW8Brw9hjuqNcal8OeVVzFjzC5dvc6EDp5wJqkO7RR2vhWD65zMCDkzNHoxOS0ZhY4RDzbiZOSYa8zK9m5/nJTtOVlt4rDm7XNSa8IkphAordaS9t6A8YYrMWGeq3rbp86ZwiT7Wd1Opo2pFMvvuSH0bD5mXXa+EFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SP7vRe5m; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SP7vRe5m"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381b831d535so3169215a91.0
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 22:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783919039; x=1784523839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4XbT0k0lKsSfpNrP8FAu4PkmQPnnCtH2o+K7hTzDeM=;
        b=SP7vRe5mPPADgne4fRLBUhUNU6ueX8RQAhZpAEmzM+RhtCjdFubv0RXztlVIOCqP8M
         4EzkUx6D4D1QW2ShbDbqDNDB9FPsVlsryuCkEiUe5FzuP5jM1g6KCcFBYHHZE9bHvrY7
         8KwGM0MS8xUjqY6WP2OuJziED7mrWetIfNnNJtEflnHPiYujHymf0yC0OKQrDPZSajbQ
         LLTnzswsPI/KTuaOAZf+T/ciH8zmJ26CYYRj8S+QT5PPXkV8kCCm8rqvWokpYz7zEvSb
         fss2BtbVAylpv5cyvEB0t5+zlvFdWRYqJ8SrX3Z2uuxh616Xklct7BHJeXfTu0mzs/vo
         swuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783919039; x=1784523839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4XbT0k0lKsSfpNrP8FAu4PkmQPnnCtH2o+K7hTzDeM=;
        b=YFI0J5cG6HVAxcq2UrX1aCHVqy8XwypvXsTD2carl/Uc5GSxlp3S4X8vBiGZuDoK3V
         q9ntS1Py5PQeuKSMruLFHyObicSYwa59RNHVXWP6Lg/n4mP2UJWBnAzynDeADgVksn8T
         kn0DeuG1wqO9AMxyJqVeZzv70qNQw5dVGpp6KhWYrXof3iMwqo8SMWnhidIyFdK3yZWV
         AX36a8boZs1Tq58mF+npQar8/+R3a+HKF6LaXrYLmkFNKI9UGCTsiuuv4T4xLft4w6xK
         JXg5oJDFi955kOkQkhg2YusIHRb9X/dXA7AL7/kJglfe1mhL/CFOywrLdPVqMxnd125Q
         rQpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnYxhZZ0zzBdRfiSMwFDngUfWFHrdOyLg4CURQWHvFAoklZlb4NIVLMXdnH32yNdE8cD8bch66xe0F5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSakeryp5ODVElaGHJ1xFKPzp3C96LcqPj/djGIv2KYkK0MELA
	zmhVuAjP7mf4aWvLTSuTBjdPIbm/QHJa1tVqRIES/TIC1YsdF1YCzsJmTvFD7mYX
X-Gm-Gg: AfdE7cmp8erhn7XLoRbSmkrsE+G4mJPMH19Qjymx+0m/cv8WmBLP6+9RfT5FXeL4wrm
	X8cUBzaZYRivK/2jWpRu6w6j78LW0Tqz4Nsrbkupvg4CsD878CFtY0oNUX+gFW7KAg1K1m6RLf4
	3pN+ZYVXPCijsjf/e7Hh4M6d8+cEvUzO3PTwPL7RwqLxqwNNC+Q8cNsVKNNi/+xCMwe39cahUf2
	NvGXUefJKexsOn1Bnl7m2y2HPpldVUevrmooQd+oTva5SHBowXLZO1YJveY4XoOBjXhs3oklLz6
	Dbd5kEOHXpISBY5QGmpxuw25aBRdaeSAPhPiVY4g8wDdJaAGzzpKNUw34zZ331vpYbdevg//DoZ
	fzJYeem7LMFJGF5ikThNWM+t9bnpSNFcw4ER5gEqibe4cx+5FERZzJ/ZW3gcqXi6Vj7rzeyDRmz
	bU3Ynpm7H8OpXOR131gHb2j+ksfEsjUkXsIN1EpEk1Vj4v5aE=
X-Received: by 2002:a17:90b:1fc8:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38dec314a44mr3575846a91.41.1783919038897;
        Sun, 12 Jul 2026 22:03:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm21927368eec.29.2026.07.12.22.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:03:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] regcache: Mark cache dirty if selector register rewrite fails
Date: Mon, 13 Jul 2026 12:03:12 +0700
Message-ID: <20260713050312.38729-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713050312.38729-1-phucduc.bui@gmail.com>
References: <20260713050312.38729-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

After a successful cache synchronization, regcache_sync() clears
cache_dirty. If rewriting a selector register later fails, the cache
and hardware become inconsistent while the cache still appears clean.

Update cache_dirty to reflect the cache and hardware state when
selector register rewriting fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/base/regmap/regcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 040fd60c0d59..96cdae25b9c4 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -465,6 +465,7 @@ int regcache_sync(struct regmap *map)
 
 		selector_ret = _regmap_write(map, this->selector_reg, i);
 		if (selector_ret != 0) {
+			map->cache_dirty = true;
 			dev_err(map->dev, "Failed to write %x = %x: %d\n",
 				this->selector_reg, i, selector_ret);
 			break;
-- 
2.43.0

