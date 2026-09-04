Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0C2222AA
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 11:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519678; cv=none; b=BR9GN0t1ypAK6//WCN7yj5b8YgacR5Jtm3x9Z3qySDav+jBesrVkfGFMSROl1kZEmxTNYikU0BE4SS44b2vk9YfuxSQa/XRrPm/10E5S58lizD3mDRmFm/lAtcVMR4aD92GfuqcTsbzV6hRcj37ReQgw/xMJeBgxfUNu7DNXtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519678; c=relaxed/simple;
	bh=Mt2Jj+Hwx7fL6k6jmEeS1jYSGnq4BaMYTqfWVhxOnqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=unzleveAb/7z8h8uXIXPxo/ihz3psBoF440suaymWY4fPMWttUgiDexwvTa13ocI3ItKW8N9yDZ/C9iDES2sk9K8KhThV64iGKzoiSt2SX1lZ84K1I0GD4EfuB8EeFq+bAPyRHDsVs7UwgS7beO8VTbKff/Uag6+YMCLx5A4mmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyLtASep; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyLtASep"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1ab6d7239so693494eaf.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519676; x=1789124476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJXrdiZUgShSK5yk77/XBzx7jT+n2TJBOdW5oUv8dng=;
        b=MyLtASepZ0D3OTYKXug4rrmYx0c0g9pSAccvoTwu2VdE+N6cs96hWRBeWkH7m5nNH0
         fzuP86+6c3JGKI123wqaTaE4JwZWb8wA89ePgSSxZmrKn8yLBEtGyERR33p8GLw81IWb
         rqDCrc6ulkA+e97OlvMx/NhNFz4avwkjFCUJ0LkdlTL7cLL73ga+UWlifs6E7IbOxI2q
         JquoL9SmZUOr5ehEIkKqK+xOHFNbJdqg4tBJabC9ME905hOikc10SthaqumaFC6VKU9c
         OrI/Ii2DWNtkidjWcVsahVCTBtS3MBV7ZdZLOpjPvBmycBjGRgWt73Fa8BjSFXEyzTaq
         NNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519676; x=1789124476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJXrdiZUgShSK5yk77/XBzx7jT+n2TJBOdW5oUv8dng=;
        b=X+GTyD2mual2a0J5GDirsAWVNGfJb6JjNc57Sck2z9wtQo5auPRwiQwjfUyJeL37GV
         +ovu4FsqgSIjrKYN9h9/b/PZSp8xybr1Pt50fck9F6IQzN9dMnvpPyxvDOF8PJ13iPep
         //s42wyQ/CXG8gmh9qbjbCKYgUmuPzFidaLoO6On+dBOJAMOAcB1djm/+pMXorjWx9cC
         Xf+F9mJsGH9LzmBmyzuj1mBqPn48MO1fEWwJAnRLX5RdMhhZ+FjrNP/XderF0TCTj69E
         ONrCDNNaXeh58CsC7I+CbsGE9QslGO3d41dyOaTY7XEs4TXrIjh/4wKBJKXkAdVQh4IW
         2R2w==
X-Forwarded-Encrypted: i=1; AKwUvBxPQJjt/Hp+rkjf90E1jDff+LyVEGb1Kd23PUSATHWQQ1ZLVCrnnqiRbnncf5lRoh8luAvXWFb67BUXZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++k6iFJ3S1fVT5YJHjUS7aAABLRhKkRwFHDCBdWjXpd50Y1HtM9g
	F08jwEco9levOSnspb3cqcmbhd1aD0dEYWtaTFC7sgmkbgXdwM5srK/45Riv3cSfq6M=
X-Gm-Gg: AYBFou0xm8OWBVg1IcRJEIfwuMYYE0/aQhq+Fd5ei01QKVgBu4vxNpiYRpK0Ddr4mRA
	NaD4/ZcOqbRb1vgSVXlSpJ1+nLLiVdDHwssoiOBx2/3je85cMUJunhPQlIrnENmndzg+1UMdg1D
	RN6xD/ef0BOCkGatYE0OpzDlVu0oxK6wPWKJNrJumgxK5jINz88vUwrmRs6smC3GPBVcUiHqBUY
	jUDIS88/tfabpQAMRxJsWprXjAfua6hi4uzZxVi5DhSOIEq/o08oMyq/gQVKYGdawyeiqjEypoV
	eyGKRth6JNgQZJKKMCVjOmz8zfPop+e/cvhQ7/BKpLDc7t1FgQ7ulbzEEfoWyogiGUlJdF09+s+
	B3px+BTcRXq2D/7Q0fT5Tnz0lBymZ9nyLx4HVygMHIwTCc5e2JUG3uHLWP7yEP4do6WTjzXWkEQ
	oQWifc/GyBnXIVr3nfeObzomgndKlxJfb2uDGMH3qcsUoGU6xR09ozf6w+sqW7hX+VjmnScGLha
	7LoOUY+u1Njzjg=
X-Received: by 2002:a05:6820:208c:b0:6aa:e573:9ce0 with SMTP id 006d021491bc7-6b6fcbdd780mr3568725eaf.16.1788519675905;
        Fri, 04 Sep 2026 04:01:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm6431329c88.15.2026.09.04.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:01:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH] regmap: fix typo "asynchrnous" in comment
Date: Fri,  4 Sep 2026 16:31:09 +0530
Message-ID: <20260904110110.8823-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "asynchrnous" to "asynchronous", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/base/regmap/regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b02637..98184a00097a 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2722,7 +2722,7 @@ EXPORT_SYMBOL_GPL(regmap_multi_reg_write_bypassed);
  * If supported by the underlying bus the write will be scheduled
  * asynchronously, helping maximise I/O speed on higher speed buses
  * like SPI.  regmap_async_complete() can be called to ensure that all
- * asynchrnous writes have been completed.
+ * asynchronous writes have been completed.
  *
  * A value of zero will be returned on success, a negative errno will
  * be returned in error cases.
-- 
2.48.1

