Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830FB26A1AC
	for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 18:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781546872; cv=none; b=OPDcjRn/fWPq80C/NoW/HWSPrJkI0znDEou/MjfeZS7kDbvGCDzWwV0ooTG3gAf0J/aguzVnA/c9wcr6lu7saXzt4iUfI3CuNwbNYhVRIMPAA99AgbjNe20QWFGWyBVKa6DUzcd5ze1iVgPzTEW9UzjN12nio8tgnNQafgN2Al8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781546872; c=relaxed/simple;
	bh=yy8qYpMu/qvx0MaX0eKKn0gnX6JlDAP5Q2vLiSAzxDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVjzZqSWJcuPJMXGwfbHu/k5rsjt4/RysxLl53GJJQHjUZPJ+WrFIoyIb4Sy6Kq5FwF9fAhKYVm6yBi0hMK9SfZp4otzQf3/+PeTriH/pXtb7EQpw7/xEjCZR47bNo1SLYb4hGizXhp0gy12QN76FStaMf3m0YzTCG0+NPA1xL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kx82n81U; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kx82n81U"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9185503e6a5so304955585a.0
        for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781546870; x=1782151670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xlEHlIP73MalHhAbT/i7sY49D1aaBfLCIuZGXaOO5o=;
        b=kx82n81U/q2IzsTPj8y7BkxNgUlSzMBJ4uyeLSxVyaSR1tQAIN5fFHTGs5+uQBJBlb
         aWpy7nNhDej08rWZiGEF/lvinjHkG6ODNi6ahx1pwXCs7bpWZPZ4ADttat0EHDh3JLcx
         Tz5QP25/y2kGQm4N0AhtbjmBGeeacVAR/ohBvy5YYDVkN3Cdr2DaOAlnlDci1+ojlJzb
         jOlCz71a/tSI10Xt1FX5LXzieJy3ey7hLxRWddhg7KD1itJ1O9/IV4+uitSkZ4+sNAgH
         3H9BCZq6ceT0R3aD/pB2nl4jnHrGKZrlie2ZDH8lWPK24lHKCQeMubUlAMmA/+Fv94A4
         uf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781546870; x=1782151670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xlEHlIP73MalHhAbT/i7sY49D1aaBfLCIuZGXaOO5o=;
        b=iucbw92LTThz7EeiEaHkZWAMHPkpU0aTjou6VN04557GqmefVdLwNM1SPCsL1EPups
         XjG9v6MCXbmCaGU+qbLvge6F1gTg22ws2EEn+YR269ATDyP+WzRmf6iXTkMXB9qafQmA
         246jB2lnIFXpMGxHoq6dFo6AKvhL4oLLrNCW15qThgMMqqKiH+SMALKesPRifx4WPRiy
         3qlJjdwGvv6lGsw3rd8dvlgfZ/MJ/dh088CbmfestE/MFRWJrkSRVxvYtKGF1Thlkb9b
         xNDnf98rUpH1DijmqMq5a3Fh8VZxbyVnG/mTBYhKliURB1MSVVQUc6zLms7OAdJKm62s
         5L0A==
X-Gm-Message-State: AOJu0Yw+dnJMgh9IAW4CRBtTieyMYCaR0Ya4Vu6V4YfdG/RBNiGIHPS5
	ixwa3eMgvWl91ciWoew2SzXWswmQvlndQMDmkA9FjxEjHQKL0VEVKFw6K8Agnm/0KkM=
X-Gm-Gg: Acq92OGi+bWF2B1hCy0zDD5YQqLB6pXysdP9rcObqycQhTgtFULY06q7Rj2S3nR6Rgi
	ghmMfcogYVV6h1gkS/oFdhhsq4/cINR713xWbrKzT9NvnLjJoQ3h4Vnpz18SLh3U09LRF/u+kZn
	SGvdXnkNaOIMfE0rrwVDIivLkNs2vXbqDw5tM/4EWYE9BSs8SCvxcvkD+5pOzfcnEkWvXwbeHPW
	qJ++pMt+CBJ+cpNsqDakXeJp788vxLUKMEZDGYmfQzESq+9DH0Xt/WcEdgtaU70Qpl3vbULo3hk
	bAIfKdo9tNHyt+OarGicAKT1PMXk2VsGGwxT4q6rKotRQvRE8XJ4PnMg8dkUoH9ovAHgn9RBEfu
	GyxHL/PA4hy8XR8cL5WgiOyo9XHpWJ0VM3FT4Mnti2qj60pwENiisF6LF7wbGgi0NQ6poVXRo1W
	9VUaPFCT9CjHfm2/MNMu0RcomcmSQWXpOVWyWv29z9
X-Received: by 2002:a05:620a:7109:b0:915:80ed:8327 with SMTP id af79cd13be357-91c2fd810d9mr78092685a.41.1781546870502;
        Mon, 15 Jun 2026 11:07:50 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a005a49sm1187435685a.23.2026.06.15.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:07:49 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] driver core: soc: Unregister bus on early device registration failure
Date: Mon, 15 Jun 2026 14:07:46 -0400
Message-ID: <20260615180746.713540-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

soc_bus_register() registers the SoC bus before registering a deferred
early SoC device. If soc_device_register() fails in that path, the
function returns the error directly and leaves the bus registered.

Store the returned SoC device pointer explicitly so the success and
error cases are handled separately. On failure, clear soc_bus_registered
and unregister the bus before returning the error.

Fixes: 6e12db376b60 ("base: soc: Allow early registration of a single SoC device")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/base/soc.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 65ce72d49230..af7d71393774 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -191,6 +191,7 @@ EXPORT_SYMBOL_GPL(soc_device_unregister);
 
 static int __init soc_bus_register(void)
 {
+	struct soc_device *soc_dev;
 	int ret;
 
 	ret = bus_register(&soc_bus_type);
@@ -198,10 +199,20 @@ static int __init soc_bus_register(void)
 		return ret;
 	soc_bus_registered = true;
 
-	if (early_soc_dev_attr)
-		return PTR_ERR(soc_device_register(early_soc_dev_attr));
+	if (early_soc_dev_attr) {
+		soc_dev = soc_device_register(early_soc_dev_attr);
+		if (IS_ERR(soc_dev)) {
+			ret = PTR_ERR(soc_dev);
+			goto err_unregister_bus;
+		}
+	}
 
 	return 0;
+
+err_unregister_bus:
+	soc_bus_registered = false;
+	bus_unregister(&soc_bus_type);
+	return ret;
 }
 core_initcall(soc_bus_register);
 
-- 
2.43.0

