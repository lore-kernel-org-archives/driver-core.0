Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13E4F3EB7
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613983; cv=none; b=n5GBv2Geh/mXcvCxi0ZRRv32ZzX+i1lIxdj2drGV9AItm8MyQRoQ3EjdI4kvLK05l3os+MYqDZpd/KRNo79zMxpfAQDFBU19k4fy7bSdop0CKeqCJR65/x3CsonJJx3jwYov8B8tCtNaH9plAW3+vyj0dPnQREHh+HVu6ZDnadI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613983; c=relaxed/simple;
	bh=jnnkpX6A9eUVIr0NRIFbVU++Wwtl6+NRJQ8AKjJzMGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtwOomx0qwdlXw2/GAEBJ/f5VZo437Ltlup5LGtykUDgWm26Sa+zm7XYMkdP9e+p5l57+S6KLI+V6Nsj4Fo9OUMbRa448fa6ZsfKrLVOBsXckANVDCd7/98kD1mepGqPHPPQcf+V+WVpz1kKbpQUjeJSD8nFu9DSJeF+oXfwM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=J/on4u+x; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="J/on4u+x"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b926f0so2069848f8f.3
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 09:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790613978; x=1791218778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAWwzEDYsdL/vGS/72cVPiDxquOMmSf2cMFzWqr5TUU=;
        b=J/on4u+xXFxJq2Zp3JREHmrwQ4ySY0KUAfuRLdJ+9pnq1XOpVdD/x7zDhPSW2ty/AT
         B2+IZSDO4Yu8vWWEVoHe573mul9CewW3YeJ6YawbBwSjhta4rNK8xHu/QE73ePG9LkKp
         9NNjuQMRtGK95EF93f8GrXBWFwHQyydWwUevF7kFNVzRDEFz0W70keBwx8O9gH3NiWHI
         wh6S3UanPpn1lJElwBByQRbkhZrUo9GrVgt0RlXOdkPtyzhfEBqMUwtKq2urCvBBOG+w
         QqnXbd1oLRZIE+Ml6IfYCf+YOOCkCq5C/khHDMQ6PdlLR00gq3YvsEyaH4gLlBwJ1kOu
         Wjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613978; x=1791218778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAWwzEDYsdL/vGS/72cVPiDxquOMmSf2cMFzWqr5TUU=;
        b=gPL3gWTTSvx2xPE7fEeWymHyy+qcY2A/fUHvuDmlkZSjdQ1aJgBaucu49ptT/5izUq
         BipYPywR24fwlH2W38jEkzrIloRLaJI5gz+lKLvOoFuIL3kMHXxaSlZpFETUlV8E1de9
         SiLHHN/boqH6EZQLKrTsfyFcQPGtd7/p3p64I3IScsPdO8vi9Q3tivnB3G2iW9+kBs17
         ukAKnFKi2x/f6mTHoVmUPIWYjzEjLVDPA7FAeiK4pyGPraYudmhmfXXp/fi1JYPTHtvs
         uqw0LIwwSGvO6vj2Ri4Vjda1j3VHrXHxjeUD2/hsSaW6OAMWjI3CGrkt0nbnVRCSf/LZ
         8Gjw==
X-Forwarded-Encrypted: i=1; AKwUvByJyEbIF5cHWiQhCRVzL05ZnyBse2rnyvCLqgw2AKsN8DpKqPGwEVmYV5JwMN/CZLtGmQJsQ+3JU+4RDw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKF+BZrM877zpgQsfggbDBWq8TpCLIDRZY9fFk5fHJ//Lvb8Mg8
	L1J0JqxsBGDfQzRPoDBWtgRsL2h+hCrfvibFKv++aT35yOCRDSpD5KT0V3vp3eFDYDE=
X-Gm-Gg: AYBFou2n5dD7inh3TerPuy4JoqgxOEgcVyxaRADinrnh2h9fB7IYEzjKB9WbQrROTjV
	BBoKtJVmUH3m+NeFsxc/NL9ziijT1PsekHEZngNCMbKtouWATX2Rsoc9mzo1ZTHVGQQ/iKFFzxI
	OZNQ9KpWpCOSfhnahIx/a/yRf/4A5YWu6zrUeod1+46TzsuWg+ZpVzgx5ztAAco4Q/HeOuKar/j
	pvkYZbI4sfssMgjZaMAc7xAj0II8RX5P/NVjwjylIOvXsFPn6az52R6nnuFu3MCSrPtVHXd134u
	HeI+XVHps7EnYtqn2qM4xJ+ER0y/SXTLTgpfoEMVmbu+j/Koyq7u7F2zgSKDxRp0IsTgjsStmba
	zp3gykzqlYYKBYhcHsSSNVXi6zZ9AbguXrNoCORVMdtbwrRnm+ATz2STLzJQrSk4xXlh4kLeYis
	WETHZW5HBKb8ln1UNAUB2Gnd4OHYI3w/1mSwdX+QAFYmIiH5c6Wvanu46re6cR4JqzDWoQ823EN
	VjKMrzFyXNO3/oCLzxjDapnAUfpw65D31MfdSkhjAHCrXQERl9GHb43nQCL6g==
X-Received: by 2002:a05:6000:2c11:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48871879aecmr25843657f8f.47.1790613977949;
        Mon, 28 Sep 2026 09:46:17 -0700 (PDT)
Received: from localhost (p200300f65f19a90433f74747aea68541.dip0.t-ipconnect.de. [2003:f6:5f19:a904:33f7:4747:aea6:8541])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4887a36189bsm27776092f8f.21.2026.09.28.09.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:46:17 -0700 (PDT)
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
	linux-trace-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 1/3] docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sys/kernel/tainted
Date: Mon, 28 Sep 2026 18:46:02 +0200
Message-ID:  <bf400c123ec86a7192388ad23cfe4194f536937e.1790612298.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
References: <cover.1790612298.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=jnnkpX6A9eUVIr0NRIFbVU++Wwtl6+NRJQ8AKjJzMGY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqupnLEWwU4nnlnlZA7LE5yrcNgYkA2pF5L5t0z t/9cwZm36iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCarqZywAKCRCPgPtYfRL+ TucICACN+AyTvue/mceH/MnFWJsKL8AdaDdIkUDXr7WE4JygrR48sB2yKoGH8oxBbmAFZoIYhLL eXVEf4JzuaTR8nbKlKfi7lq83HbmXbj186CwlftOaiEjDvC7N7byaFSHEQeifccsrovUBbdQ6SU /Z+usdibWVtAwKXxyrh0UqPVUdcwKMxUMIjL0zMCYp+4G54HXGNQftvqBg4+GB39wz6NrmkrbgM frDm9EIL5up886P/8NXiOiW0kYczKLp55okfL/YtBqUvmUHX9FdBRaCUCoZnJbHa6wn+DFgMQ+l 6rJwsvu3oEnrrBP9iw46CIRxF6YSQwGaae0qf6Nnzwecz7JC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

tainted-kernels.rst contains a small script to check which taint bits
are set in /proc/sys/kernel/tainted. Add one more loop iteration to also
handle the newly added TAINT_FORCED_BIND bit.

Also simplify by starting the loop at 0 and save substracting 1 for each
usage of the loop counter.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: fcbfaffee51a ("driver core: add TAINT_FORCED_BIND for when userspace manually messes with devices and drivers")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
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

