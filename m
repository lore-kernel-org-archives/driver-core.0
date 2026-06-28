Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176403A7591
	for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655139; cv=none; b=pSLPTHDiRQXy+LmQ5kdviptBaqKMHsbi4KBpy6lHm90cyBWMI7BthMJPpYLW/kwzzjfVC4vpI/UoFSuTmKuGVr+GCtz/qGHiLKWDgz+UFNCHVavn/4di2I6BDk3npE7qcsAgciAdyEP1YBx3w0ROW6GnG8u7+szHWz2pK89p+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655139; c=relaxed/simple;
	bh=NPuW9Lukwed5ftM8/yQt48JO1yKS7gJdSaK8lXuIV/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U26OqVIEYE9uD75+72S64KMbaip8Ap98c7OG+lHktu0cJIxnvHEVRO7F/DDFhd+4txIZsdi/ySwcEXplIKwNfogtVutc5+RVK54GttCT/4ON4gumY8J6Laolt3GrSsnaPP6sqQWUTtZwc64oOCacK28VnBOsygcHU97a9R0jVsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvPM155D; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvPM155D"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8475eca3a66so352476b3a.2
        for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655137; x=1783259937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnbjMsfDFjC29YX1ZlRyH8TQsSepe4wVbcBKWbi4x2o=;
        b=pvPM155D9a1I2xdNjyH2KCT0cpzNxJjndIo8GWQLsoheeWfUx3HmmftNaYIeLtS4xs
         ykYKjyoWo8rZtBnlgoaS/7MPEAs1u2ojolOXhLVGGEQ7MjMl/mIjiopZ+HnAjvugAaYT
         EEp1QdlZDCwvymIie3XVeEESD/pXGAfumdpnRT8qrpiJwfzfEZG7G6HpokyVp+zsierJ
         RGgXk/GHZnQIkb/BnSzCP+rPh1iwXIf6Cc/htEsDy3LCSYFC9bm81qY2gbo9Udp2D4QR
         PqKQ4LfOzLMUxvvylHtmhImau5+P4qcDqSUzV8J7hkGd4k/yE6wNnZacbXBwmHE7wVPW
         D6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655137; x=1783259937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QnbjMsfDFjC29YX1ZlRyH8TQsSepe4wVbcBKWbi4x2o=;
        b=K5nQ0QUYyZ9Y0OfA6OcbmeEFR/jIjGQniwj8GO/HeZnGQiKebBAqV5sBiUTSXukd42
         ndVuSpcc0H1dy2ISzwREhlKppHklo6lSI7ABei4owe95mK4chpaskQt37h6RQ0nru0Zx
         n5JWBjat0yzwazhgWC5N55Ysm6lL2oHB76yYVXRg/G7M5tR6TGeT4l0EzcJAzZCJgIlc
         hWlYm5FqcKJHaIWnkfi4dg8as3CpYo2IQS+5/K74RcOLRzP7F0p/od1kVdvUbJidZygM
         zDbe/GzXaKmJQUR8yvQ1jHgO19/zUy8kyJouolYEYLG3cuAxb8vDZVTyjJY6s8zpdbov
         dnSg==
X-Forwarded-Encrypted: i=1; AFNElJ8YqxVeqiSgxLnvVsfVSGPxlwUFixq5JR1Maf50Ho7mc4675Fcn4YBhQdHrDs+xl5cbR1qCmatP8uym+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt3FUE4Zalz7PsOZ4uehQWvvyxchX9ID+cAoFwr4biYTA6aKXp
	aVVjUxT2MKv2+F6AUV7dq5Us6JRkOVY47ogUeo7sa204N+YhKt5sFF7sdOcMOg==
X-Gm-Gg: AfdE7cnQVl6EK7aEdtS+kIBapzdZGJ4bI5Q6Y7CwtNPq2crSAD+LkwrbE3rjQPwPCDx
	KRB9v1w2501eD5gNS5qW/nAhVtIB5F3caTK6YDqjFk9UI3e8cu1iDefH1TWFBu/Fs4Rgtj2loJy
	okCMTUJtu5IDABjSap2UtO3DUyKp5oExicb3qlzU6KtSswZuYJZUqhDZGChslfZhyRtGA09T1Fl
	7WnkAiCcVa0zF7BxVuCI6gNcJuoPdLuiPIuzxCwlsmjAOkFhWmaJl9bYKdt8nzAPhCSBZ9MmJjG
	jh7WKIyzHsRasVVbLuG9MkzUGjLBhlGGkU6d8sYeM6o1i/d1wL0GFPZ2c8ttMVEMgNUYsFVJOJ3
	XSClRKzeTVhvCAr8AQQcoVUzqakf9IWqY9QmY6VcQGt9n9r1nYBuAwsRgSqoEzQrY1Dz6zFH1SZ
	MwUslE2F0=
X-Received: by 2002:a05:6a00:10c8:b0:847:8250:2b2b with SMTP id d2e1a72fcca58-84782503010mr636752b3a.52.1782655137217;
        Sun, 28 Jun 2026 06:58:57 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10041108b3a.30.2026.06.28.06.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:58:56 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	driver-core@lists.linux.dev
Subject: [PATCH 5/9] arch_numa: remove redundant numa_nodes_parsed node_set()
Date: Sun, 28 Jun 2026 22:58:19 +0900
Message-ID: <20260628135828.1393120-6-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628135828.1393120-1-ekffu200098@gmail.com>
References: <20260628135828.1393120-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
caller's own node_set() is redundant. Remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/base/arch_numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index c99f2ab105e5..19bc806313c4 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -283,7 +283,6 @@ static int __init dummy_numa_init(void)
 		pr_err("NUMA init failed\n");
 		return ret;
 	}
-	node_set(0, numa_nodes_parsed);
 
 	numa_off = true;
 	return 0;
-- 
2.43.0

