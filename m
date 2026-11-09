Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201719;
	b=EnY6RBwLVh4QxoKVpXhhJW15kOL7ZlY8Xw6vF9RkbQryopPvEQjA69UVarL7ntR8r+VT
	 QCOYCnYy1Gs6L8ac73CalDNYWNEGg48Mo6LmbIEubBrjf4/kP1yTajlOKECv8j9JjkjJG
	 +J7McXWr5Opvci9DloTxsxvltQJZ7pyOJ9DSjV3i3HpHb/MULQP9p7sV6IPtc7h9YY/bt
	 JIKAG3Ft2h2TofBy8j6Og8U/CLOVdaA91lnEsobGFh9tsE0W0a/qgVeW0SICjmrEJISwm
	 +au2eVg5CZ1T+rGSz8ijDNx+evQdGqDIC/s2Q/lmnXa/COnHlj5TjSrPvC8Jv8a/XyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fj5sb2gtvT3FWrqFiToHxiIHAqMkz8L6XNg5kh5KYJA=;
	b=LaqmgI8IznIOwgZzJQdNAa46eiLT7dcQsI3HC7gu7SjLINrhtoqqmrv1w1D3lGUQRxgk
	 LpplYiHFZNxxg6O3Gd3r/1yp2fIdUsiSNDySud2gHaagHDQ7hyH4ZNZ8gtHoZGzZ+pIJg
	 bXVJjlq7FJxPMp57roN1vlimXopQgbv+A7AdCZUXr3vZKa7cRbL4fooJIRner3uRYF9ZY
	 lysPXr1cDq8sbQlLIZr/68otKsYeaA4eg4fH09Inr0zC9INEur1KAH3pvjvAOcEZ0MPOu
	 abYnJJc3bZFVxK4qreqKNrhlu0n21zy+QN7o2J9cWb6wqecCPm7ZnM5h2kHhA4bLZOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=quora.org;
	spf=pass smtp.mailfrom=quora.org;
	dkim=pass header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=Bs3ICTCI;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB83606A326
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 05:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB83606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.a=rsa-sha256 header.s=google header.b=Bs3ICTCI
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so893050eec.0
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 21:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1794201718; x=1794806518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj5sb2gtvT3FWrqFiToHxiIHAqMkz8L6XNg5kh5KYJA=;
        b=Bs3ICTCIen7EdGZEtC6kd9Kjh8KVCLk0dzQli6GSaYvc/a+JbvUcRTjqSwt55e4MTd
         U2aN42mRgJKWoPxtImJWGy10Hi8x0opxIRvYP6yiucxfOYOFoMJOB6DLpexeWmyLMUig
         Ob1kwSc1QnEmX5iMHkUdRHSVbqgNGJ5X8j7Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201718; x=1794806518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj5sb2gtvT3FWrqFiToHxiIHAqMkz8L6XNg5kh5KYJA=;
        b=sI0uvdYwWlgo8PvGQmc9N6CwGI9vpPZYJCUT+kaHyD7Kq+sYBmBxcEACDcSikHTwBm
         cAWfKSuihhqlVNej/eG4wwDQyrA7UQFDtF5oaTCdiPOCqe9eoe4TOanRDMvbi7//Ibx9
         IVcz2XysRgOiB4KcmmUak8sQMHMNUV9yEnZYwa+4bjt/HYoweENZVS1yFAp6wvq9xif2
         NUVReBbaWHK2YOQ5QAaGrHiLv/sXCFJK5f+jPO6JgMlXDUWyXnuRl9yE/uM3l293UG6d
         f3zUgavmXqGC2YP8Dyvo3WIWgkSkOXB9NrsAbOJuf4dg8Vm35h5z6KdBJ3CYQ89lkBkc
         VN9w==
X-Forwarded-Encrypted: i=1; AL+hErFLrdxlaqL+fSn54E1FH+GrO+aMigZNZKzhruOMuxFgld8GqYwiGjjY2nZgoWeiOfyvsZs2Sz/mDwvMLA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+K52HJmh9ELi4emNj8t1YXW3Y+jBECD/PTSUwsTpuoMBKc7oUu
	Uz2KFH3s+nRw/1bmKb2naNdKBPyhUrzx+l7tjIG7g2mLgSxjEvsc9eDMz8jSZlbXv3A=
X-Gm-Gg: AYBFou3tvtmYEdm6yEl13TNuVLgSqgVfFNtx/Q3cHmp0mQFtkTeyTUrlm+Zp44EHpPF
	2Z3RTXW67oQIIEKfezp8jM067wK+JGM/t23iB0hfex50jS7b4HbjTwthYzSzsHx5nrmcP73KdIB
	ihi4R+c0lam+1GWGsAokC7WeMVeWl5s0XaN6gin7/P/lu7A5mPmYjGemEg099GG1ivsu8GeuUF2
	kp95rK+n9xySRSX3tNdg0l/ToobshA1/TNbMCgPbB+wUfNXv3AfjLKsLC1JXCseCS0pmLFvSdCp
	3xNRAc72DkT2wgzLKHyaNhOSK3LiYij8JZ6IfB1jM0K25VzGy4XpNMFk5/QjNXX6xXUcD19yDmg
	Z4X6EqrNQFJGDMnCyF/emFp8hRh7mx27rugfV3XTR//AU2PFgqLPgToUMd9nyjdv6LRIMStZxBP
	o6FR3YfXg5XG1f4CPezuPEakQWMntin2icgWTqpWm0nV00inYAoXdZfpZ/RZh41+P0MlfpLkiIo
	LOh3s4bG3RQv0uzgMfKbs+BbxSGyD2Vu5VCjEDUjqvRgwW6SAsR4VPOU+UAXgChZI4rvFYxFey+
	dYOkKmFQOoHxchQgn7V/Cl3J5Nv2aFl22CrY5BvghpNLPHD4MmaG9dcnRGf92vigApdDDyIvJpv
	PRo9xmVBB/uO6zAuL/z80bBHnkQm6KMhU8QzWoxSiWBwyt8cg45DzQ3t7dC7xDgd/rPtrl1ebOb
	wrl4vOiI/wa1gGl62olQe7GDpaBY4knKZ0XmpbmnuHXd4HHO7ePYJOMn47MH29Bop+
X-Received: by 2002:a05:693c:6009:b0:36a:43d9:f2a5 with SMTP id 5a478bee46e88-372576c22c7mr5669312eec.32.1794201717818;
        Sun, 08 Nov 2026 21:21:57 -0800 (PST)
Received: from aegis ([216.247.15.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm10638817eec.29.2026.11.08.21.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:21:57 -0800 (PST)
From: Daniel J Blueman <daniel@quora.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>
Subject: [PATCH] PM: clk: Fix false-positive recursive PM clock mutex locking
Date: Mon,  9 Nov 2026 13:10:05 +0800
Message-ID: <20261109051007.371843-1-daniel@quora.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_clk_suspend() and pm_clk_resume() hold psd->clock_mutex across
clk_prepare() and clk_unprepare() for sleeping clocks, with every instance
sharing one lockdep class. If a PM clock is provided by a device that also
uses PM clocks, clk_prepare() resumes the provider, which takes its own
clock mutex, triggering a lockdep report.

This shows up on the Qualcomm X1 with the LPASS WSA/RX/TX macros and the
varargs macro providing the "fsgen" clock:

  WARNING: possible recursive locking detected
  ...
   pm_clk_resume
   va_macro_runtime_resume [snd_soc_lpass_va_macro]
   ...
   clk_prepare
   pm_clk_resume
   wsa_macro_runtime_resume [snd_soc_lpass_wsa_macro]

Lock ordering is always consumer -> provider, so this is false-positive,
resulting in lockdep being turned off.

Fix this by giving each pm_clk_create()/devm_pm_clk_create() call site its
own lock class.

Scenario analysis and patch development was assisted by Claude Opus 5.5
under my instruction; detection and validation was performed on my Lenovo
Slim 7x with a X1E80100.

Fixes: eb667d0fbdd3 ("ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM")
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/base/power/clock_ops.c | 23 ++++++++++++++++-------
 include/linux/pm_clock.h       | 19 +++++++++++++++++--
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a8..94f2aa090ce1 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -398,17 +398,26 @@ void pm_clk_init(struct device *dev)
 EXPORT_SYMBOL_GPL(pm_clk_init);
 
 /**
- * pm_clk_create - Create and initialize a device's list of PM clocks.
+ * __pm_clk_create - Create and initialize a device's list of PM clocks.
  * @dev: Device to create and initialize the list of PM clocks for.
+ * @key: Lockdep class key for the clock mutex.
  *
  * Allocate a struct pm_subsys_data object, initialize its lock and clock_list
  * members and make the @dev's power.subsys_data field point to it.
  */
-int pm_clk_create(struct device *dev)
+int __pm_clk_create(struct device *dev, struct lock_class_key *key)
 {
-	return dev_pm_get_subsys_data(dev);
+	int ret;
+
+	ret = dev_pm_get_subsys_data(dev);
+	if (ret)
+		return ret;
+
+	lockdep_set_class_and_name(&dev_to_psd(dev)->clock_mutex, key,
+				   "&psd->clock_mutex");
+	return 0;
 }
-EXPORT_SYMBOL_GPL(pm_clk_create);
+EXPORT_SYMBOL_GPL(__pm_clk_create);
 
 /**
  * pm_clk_destroy - Destroy a device's list of power management clocks.
@@ -451,17 +460,17 @@ static void pm_clk_destroy_action(void *data)
 	pm_clk_destroy(data);
 }
 
-int devm_pm_clk_create(struct device *dev)
+int __devm_pm_clk_create(struct device *dev, struct lock_class_key *key)
 {
 	int ret;
 
-	ret = pm_clk_create(dev);
+	ret = __pm_clk_create(dev, key);
 	if (ret)
 		return ret;
 
 	return devm_add_action_or_reset(dev, pm_clk_destroy_action, dev);
 }
-EXPORT_SYMBOL_GPL(devm_pm_clk_create);
+EXPORT_SYMBOL_GPL(__devm_pm_clk_create);
 
 /**
  * pm_clk_suspend - Disable clocks in a device's PM clock list.
diff --git a/include/linux/pm_clock.h b/include/linux/pm_clock.h
index c3b46fa358d3..d54681547f58 100644
--- a/include/linux/pm_clock.h
+++ b/include/linux/pm_clock.h
@@ -37,7 +37,7 @@ static inline bool pm_clk_no_clocks(struct device *dev)
 }
 
 extern void pm_clk_init(struct device *dev);
-extern int pm_clk_create(struct device *dev);
+extern int __pm_clk_create(struct device *dev, struct lock_class_key *key);
 extern void pm_clk_destroy(struct device *dev);
 extern int pm_clk_add(struct device *dev, const char *con_id);
 extern int pm_clk_add_clk(struct device *dev, struct clk *clk);
@@ -45,7 +45,22 @@ extern int of_pm_clk_add_clks(struct device *dev);
 extern void pm_clk_remove_clk(struct device *dev, struct clk *clk);
 extern int pm_clk_suspend(struct device *dev);
 extern int pm_clk_resume(struct device *dev);
-extern int devm_pm_clk_create(struct device *dev);
+extern int __devm_pm_clk_create(struct device *dev, struct lock_class_key *key);
+
+/* Per-call-site lockdep class, as clock mutexes of different devices nest */
+#define pm_clk_create(dev)						\
+({									\
+	static struct lock_class_key __key;				\
+									\
+	__pm_clk_create(dev, &__key);					\
+})
+
+#define devm_pm_clk_create(dev)						\
+({									\
+	static struct lock_class_key __key;				\
+									\
+	__devm_pm_clk_create(dev, &__key);				\
+})
 #else
 static inline bool pm_clk_no_clocks(struct device *dev)
 {
-- 
2.55.0

