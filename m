Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D540DB3F
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763662; cv=none; b=Z2IApnSFbeMCxYw8T1ZJq4rnVoNns1Hz69/9ReFKIOXURVNLLzUCdxA6jtbzgquaPUNtoC3cbUaFHmxRlFr7bSaUXz2WXTG70XFqP5i2gdXdGtW2H9XWt61ImrY1DEerGgBMcBYTUv1+9XbmAFetZf5LK5Dw+7Z412a7KUvj3nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763662; c=relaxed/simple;
	bh=Q3bBIxz90yEEYsWH5ikWyXfUpYba5QGg5QwQbHT02IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcW7QqxIXcUyie08QGbmiQwdCti3YS0b0iYMGeIOgPcs4p6dZRw3CY96b+60c2g4o0ICxz6XmiSWe7mSDyL2gAhnwrXzsfL917CMWN0Lor698xG2RIM0zo7Tp3pp/HUxuHlVmzCYPn4qdGGBr5jVa0vTIUGb5L879QwWSmuY+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raqRwJzT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raqRwJzT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3467231a91.3
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 23:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763660; x=1789368460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh6WnyF7wCSbyOvDJNwh7JY6+tMlKujEj6rsY7bD4mU=;
        b=raqRwJzTEQlXROMO+KNtuMgMiqv9iMp2KnpYHQhwPZwZHvbcVu41RgwoDj/jWZG5nE
         StIwBIZJu6jS6cNeQCIW5fCEwHMScgRjPlHAqw0WAWyaQrB+0isKxzZTp0IiuOJhjZlO
         Lyo8XHbM8XBtDmsl2LPGNGf2q4Qc7nI+vBU6Qt/85oXuNGq2YjnkhnQBnyvHg73Iulps
         8Ra8ddQiATGLSvVlkCl7sFQkSuyaOwvwS13ZmRaERPSDEigXYhMCwfbfa7fvFRZe5F8y
         wyhvjoPcvVVSbw4iQVQmxGNjLa2h8C9sPUiJwWNR61u7EzlhxJ3z+h01oaLk5OZJyHCq
         MZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763660; x=1789368460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh6WnyF7wCSbyOvDJNwh7JY6+tMlKujEj6rsY7bD4mU=;
        b=f6wojv7SSEYFeUmwkruZSxxaMpYdpG0GAKfUM3K1x12BCwrgReZcfh/+gyv+TJ58IZ
         ZeJUsa+jzfJSA6qDSFcvfrvTwAsH9n4HLbrkdxr63oZn9pKLQmLygU3Cp/7YLXUwit0/
         mDLh1qVxv8h83YuIsxwcFcCU+x/4maYrAGGDGuySCX+JrrAlVnaLiKZijmkBGVUVGf3W
         NbEGGbrYfUcPjFCpAoc3LSxoWsj1eGsVXQZFviZseDhoLqdatTd02K10j0rKSzbUwzw6
         SX5OG5avLBFpjMFIiejnZHHZHumUeS/TvK+B6BF7sx+OKZTwls/uVWMbp6rAV6NFC8Hc
         UkAg==
X-Forwarded-Encrypted: i=1; AKwUvBwHOObD3zOu9ZvBC3flG36+v0JsncAO4WfqYgrRqK16orWBMFMUla4Hzw+LG+DiOz6PCDC9Y5awAYhsFQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nyPxHIzTO30QgO49i5rY+PwS/aOcc1RAkuIfpPhJqa8k22ZiA0
	/fPtUcKvOY+KOkBG6pmPad6MNY7pDd0BNvYLeVLQQDCPXGplddePsT0o
X-Gm-Gg: AYBFou3t1rnIsMGy2ptiAgP4WcrQZgq3zUb4MtBIvrGC+QIP965WWTuthj4HUNNV7Ea
	bRZnloNeU1iM9s1p+nFvt73JuhOq0YfFQhjMCz8JF4kojHp6rH9dlWs922BCGVEI5lFIwOslhyx
	QoEkCmi8EY37Z7vcUbkhujs7mUQZnOh+06J76JsQ8RJWNHzZeyiQ+0a9vkWlFx8j2jnrTHQJ+jx
	6QG19t4/xCrMmNE9RN3KxRVABEvF6hIBPGqBo0Ob64fZD7G/sOKiG82gaAMpO1lIGilYnZ1Ecld
	bQoSaDCjAqOEUkMzZZ+GP0OR9D+HGq6LIsdc6x88hIgpWZpiasZOikvSObwWQ1HACT97raCuIgH
	ESmssjAq2Gpx3x3pKKRce8AvxqDkOKd4bV/J5VqD0ERnHsvXm2VzmciL04cNp0wUjtLncoKiYk/
	T52CfN+pk5nUxLaUS9+uXZz+HXckJG2wAJwggYEfXzF1eVc8Er4ZrMJE0Q3MoDyapkPl5vOHgEp
	BWUBktB86ocng==
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr31452068a91.23.1788763659995;
        Sun, 06 Sep 2026 23:47:39 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:39 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 1/5] driver core: fix typo "sucessfully" in comment
Date: Mon,  7 Sep 2026 12:17:21 +0530
Message-ID: <20260907064725.10686-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "sucessfully" to "successfully", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/base/power/clock_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 59bb37e8244c..3b8ba27802a8 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(pm_clk_add);
  *
  * Add the clock to the list of clocks used for the power management of @dev.
  * The power-management code will take control of the clock reference, so
- * callers should not call clk_put() on @clk after this function sucessfully
+ * callers should not call clk_put() on @clk after this function successfully
  * returned.
  */
 int pm_clk_add_clk(struct device *dev, struct clk *clk)
-- 
2.48.1

