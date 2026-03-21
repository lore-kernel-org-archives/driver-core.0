Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9013090C2
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774111500; cv=none; b=iHA8IwARqpB/7+r5HfKeX+AawNjjkX1Z4xE/zKe9OSnPmapDh2bQ5bNfwChJkF+A+VWv5uZSKWbbb9ug4HNQrAbXIxRDeqqXbzIsEXSi/jommxohfZH9JUQnSIR9hQM/BeQPFYpYtRRKAko5M0mS5WbIs9B0MpRCu7CT1kZq50U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774111500; c=relaxed/simple;
	bh=Zt4UMQZ//6KtZggunfQZtebROzJBqJg0zzTucuFB+uA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BimaMKyn/k/C74YDRye+FOk/PEBuhVHtQVRdpYdjrCGnH2MycRYepZIYOpwg4RQ3IZxVoXJXi8/FHk+ciAJz5GX2Q475bUb4ZMW7Dz6t5tapkEsXs7A7UJIEjR9ZJAD9nT9GdxxW+v+7jGnZqc7czeIU8XOFSjVXqTezVzrJ+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lt5BmbQ5; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lt5BmbQ5"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1674964a91.3
        for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 09:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774111498; x=1774716298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJlhfiYCvQV1jHibqndfRrSyvEdsnOiBBpniqyU0CiI=;
        b=lt5BmbQ5ME2yZmKTKDQi3e3HkCzPYpBfUCPgrCmrQHoZYQIsct6GdZ46qDI3AOTIjQ
         rPAG1Bv5vdRopp3cyLJx3MhFkaUDOg98ui4LLGp3vmJKowTL6UsKrSNFYujZ9D1xcT+n
         J2eynpABHmikzYE/fc6BXKYEmMwluerxIu7kwctJ47R8f1wip2Io1H4R/dOvbOcRrgiA
         PvHumeLsqe7uKYRFB2gA4SCqnkzDtY380P+V2iY8xXpqnt+jBvn2ybhM61jCvciKpzZ9
         81tikLctBIaAYHivZ6c2xNo9v0X/+M7CQz6/droIpBR76kNLYX0LWtoG/D83BOLfc0rd
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774111498; x=1774716298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJlhfiYCvQV1jHibqndfRrSyvEdsnOiBBpniqyU0CiI=;
        b=PGwfpqDznk56v71bEo8DScMSGAbvux1VCpwvqdBMoFogU0fo9qY5P6/90b5++pBGix
         7f13wsVRZo+jhhUQmLHR0bgRRHReSNtyeuNHUmXUXgMsTyfOUK1HYnTt3VVB7c969jqT
         eJ9Cffnsjv88D9vyxcyWkgkT1P7kSRSmLqTI5Av6Ei0nOKdSUystqjzisiJIrejJcD2z
         UlHQhQgnyk2W7C+EWr181KkE4f315dxi+rUAYjcqbnXJWQj//ABukvnpkmYnYEDgmLJR
         OtCC8Lt7EzJydUJglUKPx9yd3rViI1xDxl8YhFNKfVR0V/aHvAmKbdXtGE4yNtwpiFn1
         rKfQ==
X-Gm-Message-State: AOJu0Yz2OdhR2QZW0TrOzA2TodZQPcQo+kXfp44FOPap3qxnSyzvYL0i
	AF2PsWOMQNx9D0ewfzOIDim4QGq7VvKpFaNg82cO2LdUq8Qa/0pDM0OTM9zY8B0/
X-Gm-Gg: ATEYQzxVTdJCk6EFmHAEja4gbpVUwxduCg/e7Ww/8yjqglDSSo0d9L/0xrI2KOf5Zfs
	on8zE/cTnoYezNDttTRVv8HvD6cj+w6ltNcbiLY9semVcFRLWSTXlfxVg5kDvtbRXDxiTli35LF
	uW5CMzHoq1JxfZaWu/BtCzOX4vIy4yDFdw/cvsi0ZxVt2TBtijGJRZxurokX5Ot61OEEEpZdfvv
	JjgCISv5LvAmIaBSiP7bqPbturAc3Z5A97dh4UayfBw+qjMjLyO+87eytd5k3YzTDdbkoWbTvn9
	87E/tx4Zt3PX6q9+Vb6TwE/gsg79g2YW3OZrSV5yHLwM6WJy7fD7lcDqi+QWQjFm9loqgMNekdu
	QZLc1mAGvuiqmijyy1ZgtinCsJtZia7ov8TwL7ZGwOnkToIUD779poqZp4LmhSIkQli8nD0XlqX
	fg+oItqVPAdooP9Qww7+AnU8KLdUJkpEfoBEqmTrIQxXb0C8XEMUQKj+X/Ev19w9cu/BN8RI+hZ
	Nyn27+304eGzg==
X-Received: by 2002:a17:90b:164c:b0:35b:952c:43ae with SMTP id 98e67ed59e1d1-35bd2ba406bmr5868573a91.5.1774111498247;
        Sat, 21 Mar 2026 09:44:58 -0700 (PDT)
Received: from pranav.. ([117.240.152.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a81c6f6sm4088104a12.14.2026.03.21.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 09:44:57 -0700 (PDT)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH] drivers: base: Fix typo 'interupt' -> 'interrupt' in platform_get_irq_affinity()
Date: Sat, 21 Mar 2026 22:14:35 +0530
Message-Id: <20260321164435.60829-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 drivers/base/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b45d41b018ca..848f5fc95cf9 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -172,7 +172,7 @@ static const struct cpumask *get_irq_affinity(struct platform_device *dev,
  * @num:	interrupt number index
  * @affinity:	optional cpumask pointer to get the affinity of a per-cpu interrupt
  *
- * Gets an interupt for a platform device. Device drivers should check the
+ * Gets an interrupt for a platform device. Device drivers should check the
  * return value for errors so as to not pass a negative integer value to
  * the request_irq() APIs. Optional affinity information is provided in the
  * affinity pointer if available, and NULL otherwise.
-- 
2.34.1

