Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3803C108E
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496213; cv=none; b=VzV74RanAjhjLXJtHDkD1WYpKipE+ET0Uzejoz8T6mAIsNgY5ufXFCOKsAGRXR5o2vkKkoun8lPUYWg4GixpgHj3viA1DotyqqSGjoZKIRmfKKWpZ3TuNSdH3fyMUbhPNmCqD8dA8TfXe1qhHaPKJYGPtLdQZVH1EJD3B8PE6lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496213; c=relaxed/simple;
	bh=4ZZ2di/+pb9o/IsfYKwMlhKyrT2armIhgZm0R4Ikzdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nsAUL155CGI3T26RnD2lCuRbjxbg50y10rkhlzEgCl5jMgZMnJF4Zhg+wWu0wW2b78KljN1aZk40donVq4s2gCbOj1Dja88aI4p/5aOCSheqV7HY09JhJV8wbicFcc4fs+4vyRCRPpykcEVD8qNjO4hCd8czSlb6tQE7ZbIWusc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YBGnUsZ6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YBGnUsZ6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso7613295e9.2
        for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790496209; x=1791101009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kH5LGmE2trMrU+13M5071tiqEPhiiJkpOWdRzaL+Evo=;
        b=YBGnUsZ6WhzpgpCZaoXq1IhWN1DjpGDTQ15iEeHfB030/Zp8NkZ/STVorwtvao0Khw
         zVtifze9kFlba2KvN6aSmalkGvHCeiLlGUz8Qhm4I982RjecuXqMQJSvvS3h2rwTiiAm
         JEx/JwXGAq0tFN0qW++VKcv/yGs2i0PeEUJx8+/MFxelhGAct2hzthrTc96ksFv8ze4/
         K/0f6st1XNfK9nWgX+wFBSvrEggNrMPC8hM+Gg7C6yRDfqCKtloKCTfg+RwJFKIS0cL3
         8Z8OWDMH5ejvmsK050GkWf6KKK4aLEX1DWqNCyuGd6YZYGG6ZoqXgA1EI9b0Xb+nGjqG
         J5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496209; x=1791101009;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kH5LGmE2trMrU+13M5071tiqEPhiiJkpOWdRzaL+Evo=;
        b=PXorrxz2wTpNxlBun64dlVuLSEEkRXu1/h1L+8ktkvYPMFiypUy1IG7MJSv6bXPGa9
         ar/AA9UK4GYMe/Vh2t2WfHCbYW2HXY7LseUlxPTt7zbeA+i79g7/Gr4R5c+2bMl032i6
         LE1OSPVMzN9bq4pQJfuSTsgHXqHLocaZ5b6sH3FiFFHOTZEZt7SOhp+K7WsrRITgmv1+
         QmZIS+YWrFbqx2v7dGBG+qPQMGQm7uJKd0j+CMWotMe9AKDxff1OfVvv3sxizsAkzxiH
         nHCl9lc6tXEGxk1wxKQKxm5IU6rAfvUz/tfyJFmo0HIVWR9+NOJk/CLqtzu2Ev5sHxsg
         N0xg==
X-Forwarded-Encrypted: i=1; AKwUvBw2tROTLEpPwENLjsEtjZqL1WG7gDObJQANjbbLsyvKKDhT9Ota7AeLJMkrWvrQkDkH7TsYP+9riqeuuw==@lists.linux.dev
X-Gm-Message-State: AFuF++mTuwlUMrG52r+7g8gs3xHO6MGtQTbfembuDqoKdw5gf1zoejwP
	EMw+4VIlerhIG9RWpffzk5+HYZdFt1gEFnsyZ8TJVUCJOJU/UUDbN8DuJo7sUvK3vrw=
X-Gm-Gg: AYBFou3AIZ0qyouYKFcESYkTnrbXIARdrLml3eMJ7mZuTYv7cU1TABR91/NY/V5q4JG
	TqmUkVGjB/kqUZ5ozZDTvUTZEApIy1PrYhCcRxMN1v39IeXBm9vewxWjvfpHMDAJvUA4KoGLd6O
	ZSLy3jRmz0Dcnu/7rtborEIvUxrUWQEH2GBZM9yLZ+fcIgDntKbkb3XVxWFrc3JdGixsxANKxRl
	CHeOf8neZT5oEdcJwhd0TXQ3CZwX368+ahyr2ZlqQRamfokpBmybKQCzTBvU/aVctPcx6CxPRq5
	jWBpZAjAs6IcsAO9pKru6mmtMRnw9BqP49sUqT1dgu9GnGsIPsMWmh74c0pzVuWLsbFyyp1qsAe
	eoCBlrGx0K6svTrYTlulj+utS0L9rSOOpb7S0N03zFqUYJWkXMk8lLdnY5EcleOm26bavlvGq8I
	3bm5VHmdptk3KMsi7mE12isuyxPcUbyASm51QaASEhr1mkSe/tC1Znfs+KMchT4KXTOkfIDh7Fd
	qzY
X-Received: by 2002:a05:600c:4e49:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49fe66d456cmr171785125e9.9.1790496209196;
        Sun, 27 Sep 2026 01:03:29 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a00179c729sm63585265e9.15.2026.09.27.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:03:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Bradley Morgan <brads@mainlining.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add TAINT_DRIVER_OVERRIDE for usage of driver_override
Date: Sun, 27 Sep 2026 10:03:13 +0200
Message-ID: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4ZZ2di/+pb9o/IsfYKwMlhKyrT2armIhgZm0R4Ikzdw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBquM3DZpAEY/1qXSx1yNsHVv4KnRSueYBYOf66H f4NSu623b6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarjNwwAKCRCPgPtYfRL+ TmedB/wIL1pKq46pdok16UqLQfrrEc06L1+RBQndLWnrZ8UNQ/TmrVWJXZrAgdr3BPlQiu/LT8s y/6xrF/vMS/zFp7qIdnb8anTH6ixuPChaSqKC2DnX1jqkKcfFMjACp0TnAX4n8Mx91T02TysHdv 8mOCkg7/3j54MfdaS65xcMfplJNqO2KTkpp5fpgvVRquIjDU+FKDtMn2osdxaTOZvRV02pJ0TIx SOhppFGxQvDqR6bHtQvBxon93JPG/CL7EcgYBG23tMtfwTeLg0LC38uF1il7sIUrDM+fpjX1Wqn Wise8We5/fL1fQsQECI75oj/miYcTq7DLgPuqKXYJg/QSkub
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the changes since (implicit) v1 that is available at
https://lore.kernel.org/driver-core/20260925182041.1025371-2-u.kleine-koenig@baylibre.com

 - new patch fixing an already existing tiny issue that Sashiko found
 - Fix a build failure that I found before sending v1, but failed to
   squash into the patch
 - Added review tags by Bradley Morgan and Armin Wolf

IMHO this taint is superior to TAINT_FORCED_BIND, but I hesitate to drop
the forced-bind one. On the other hand it might be better to drop it now
(before hitting a mainline release) to not burn the used letter to
indicate that taint?!

Best regards
Uwe

Uwe Kleine-König (2):
  docs: admin-guide: Handle TAINT_FORCED_BIND when parsing
    /proc/sys/kernel/tainted
  Add TAINT_DRIVER_OVERRIDE for usage of driver_override

 Documentation/admin-guide/tainted-kernels.rst | 6 +++++-
 drivers/base/bus.c                            | 1 +
 include/linux/panic.h                         | 3 ++-
 include/trace/events/module.h                 | 3 ++-
 kernel/panic.c                                | 3 ++-
 tools/debugging/kernel-chktaint               | 8 ++++++++
 6 files changed, 20 insertions(+), 4 deletions(-)


base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.47.3

