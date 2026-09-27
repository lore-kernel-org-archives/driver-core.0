Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D9A3CC313
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496216; cv=none; b=fa7odqqxP8jx1kOIVlgC7jRxnpAa0yuyTWfBDtInTKRkSCC8oSXfZM4wrOV7rXyJ85xgyoqbIfbywRze6AzFqMTC2EGhsh9kc3q6OcgtpMtUmECBZgDdnf5Z9Yyp972da4GkSn/e0dH8lvb6/cRt0UQc0qnqPBjlE2VLpYydkFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496216; c=relaxed/simple;
	bh=5JYRdb5CubIKord83n51B6HshJXJEfaqJZWg8t5lUxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5Ffr2gnpNJ7KZkkzlAQPGGaj+7BbQZ0QwTVMPmUCRsLPqrWI1090CcoXVo7vbU3LWWBK41OThD5exl78LFmj2QpBBWAPn4RmuVHX1ipDQJj3EpCqd+q1MiESXeVVpIIpc9a7wQn8s+toZM1OjH1PosnPyHT1IF36QbFkBvFJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MkKP9Wqc; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MkKP9Wqc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so15291535e9.2
        for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790496213; x=1791101013; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hBW+H2pM5yXqy13aycas8629K/W3qz4NR3q6Vfp4ik=;
        b=MkKP9WqcN6JuH1Zmhxh2aersYBEvgN9+AQz6BLAK4PvolACePrx6HYtTFoUPyCyO1N
         8WEG9H03WxBk4xKNb/UU7hMfhprqXsIJ8DFnFrLR5dzuJnouPVkXJ78BBF/zB8d0eu5y
         3KsZWHgH7RZKMF0tDfH7Zdv0jsPGjg/kM8D9/tXqCMICoIarfw9BM/XA3UCMYVJ1pTXb
         Cgf8PwnE/vc8etEC/zRn8uGOY5hQ186WouwruoAyfF2HeEntKJDl3n2Ve7joyiQn+qaz
         yfyRqG3YtDeP0sFHlZcHgYDqL1guQwticHQ4VjCumcYaH8qZ4PauPJEeQOzkWvb7OA1w
         OyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790496213; x=1791101013;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hBW+H2pM5yXqy13aycas8629K/W3qz4NR3q6Vfp4ik=;
        b=iyr9i9jMgNIVC5ZX92xsiYbO6KcnmB/bRPiichgKMuXtVPsZbklhBS1P4wLF8DyiwV
         nZb7IvljDIECBzGLYQoqUHoWwPLKBmE/hWmdTta97/oymNiU55vTaTOmO+zOHxD0dztJ
         bqtgiRClF66btvrvT6Eh+pTz+5jGUOR7LR/6mvuJEvEyU9CDl2tnp9DqPcGICVWRLAlg
         UUjnKGS3i9GcWQgFrVmt6v1SILj92R9PFiDuaTaFWaDs/+m5qsY290cPu0v+TThJDXp1
         mS1DOuvIoi1aHYEgZ8gBVC2tnOpQ6Ko/L1MTYl9RFcOi9hNTNHjO7xUN2GWKbpjUH4l0
         OpQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqYIDFy5AU9LuulPu0mRfvltCIhI4lnkpbqPUvxvetJY4dQ5bw0adFtPTNGIYXp8kV/B/EJ8Lc38laDQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nvU7+U9TJjyuV2CORG8zvHa0IcYDNhgi0cc4E8Mo9/JxUT90bL
	4z+JKlP+AvPDlpDZt4wrCkv2vFZU0OmZ1/lOaLWhJsG8vW0KT0c1CwTEqMQiUXrSsuo=
X-Gm-Gg: AYBFou2OwrpZX0vXtDIybj9igE0q5Mw4ZajeMJ0mp6nXbi7aBS1VhxpZtfkQdWYdF0v
	nCmRAfmy5I7cXYT4kbxsxcPoAsxwYkeyOvYJFkVV031IcC3mkQ07Y8tpgDXEP6YbNXXC3DabPDx
	9APJ0FbIBNkYwFF38/rGxaFNdXcXJ5JW8mP3fHVvQObgHejhYGvTBLtVJ99HRG6Q/sMLycF2z8i
	Y5Z0TgK3H4GUXHSlGq4KgbN+HeF8VumBCYU6Y9mm1eOJblAD2IlMd18SWqBgOJdJ4M8erYpAL6o
	T6+El6cKnHaEi9RqeMT49iA/94nISy8/jdQ9Z7bvw/UZD1cVAS4df6vQbwvK7FDaqJhKmLplB+R
	TxCmBnuzALBxb8EVcDkfheUoVQNP9ORMOCB+7rmmJss7z2OTdhEaUFL1lFX/8f9f0Qk44VHZOLo
	8OKgP8SWUiowExQtEDpmwqbN60CKRQmHg6mfY4qYs1FsvZRkZmJ/haefsvzzMtYhlcjwi02igh9
	Yb5
X-Received: by 2002:a05:600c:8b34:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a000b647f1mr21695095e9.0.1790496212803;
        Sun, 27 Sep 2026 01:03:32 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fef4fc959sm168298325e9.2.2026.09.27.01.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 01:03:32 -0700 (PDT)
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
Subject: [PATCH v2 1/2] docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sys/kernel/tainted
Date: Sun, 27 Sep 2026 10:03:14 +0200
Message-ID:  <4f89ceaf98172dbfb788832ad3204c8739653b31.1790495516.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
References: <cover.1790495516.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=5JYRdb5CubIKord83n51B6HshJXJEfaqJZWg8t5lUxk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBquM3G+ZFB5imtmjExFcjHBB3VSXhHLpkWC9Tvz 53VfMyUYnuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarjNxgAKCRCPgPtYfRL+ TuTOB/sHd2uUsDvxA87zU7ZGmE50LoJsMNGwmO1PGLn/QY+HoFqdCO7ZPk+vSUIZbJnipa/8TNp ZZQxbZ3SqpGrJX5vJcs8g9cUNmz/WVjEHHenTEPMzqq437IsNUOZOzvfAQMINbzHsBcxRsK8SJM 6Ht/z3nX6+63uD+cUOCnYt15ZZtsElFXcSVRRBXCMpX2BvPHDBakZvAq23b9tqHzDuEJv+LFQCW CE6C1XbKcireXUkoPgQz8M7Z/cMlzA/vTSbz0AaaHCZUruIVofHd46aAMAlAO/iJpi0HI6i0Wjt jf9JesveFpqosl5yyGQPcbBXqJV/jtBAqg3EM8lq55jKMleJ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tainted-kernels.rst contains a small script to check which taint bits
are set in /proc/sys/kernel/tainted. Add one more loop iteration to also
handle the newly added TAINT_FORCED_BIND bit.

Also simplify by starting the loop at 0 and save substracting 1 for each
usage of the loop counter.

Fixes: fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when userspace manually messes with devices and drivers")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

feel free to squash this into fcbfaffee51a without author attribution if
that is considered a good idea.

Best regards
Uwe

 Documentation/admin-guide/tainted-kernels.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index abbf5e3dd749..a208811ad525 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that to the aforementioned
 script, but if you need something quick you can use this shell command to check
 which bits are set::
 
-	$ for i in $(seq 20); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
+	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)>>$i&1));done
 
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.47.3

