Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A83A48C2
	for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655149; cv=none; b=IdzMqJrOr7WjXCa/r3f+n7GHdna+lRRVrX5oE9yhAu4U35gsd57ZmhkZXaFGuWQt3LY+JFrwq2v9cLsWCaUfDF3E/KM6Lp+jGAWr8+z8zBZKXsXWqRLJ2MBYk6lVGl2Hrj09FzRhvY5MnDEmf1SeQCBxXggKPxQ3u++14//KrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655149; c=relaxed/simple;
	bh=KfOdwpZ6UcjnNT71lq6ZanFOh8QYLHlj2ySCLZxk5n0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=plxfC/aH/8CpfncZnV+ylVXa+6hyKGIyAh4iviDs1cXbGWMR7lUhb00uH33f4LgBy59HySRPbCGmOUfteeN3heW9rnEn3hcEscnFT/kz+BCHZ3faursGpLzijAJf9C9ZMYo0kEFI5NmfFeysoOfnUyfkpFcHMRC5hvpHxfJyewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7UdArIQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7UdArIQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84780c95e2eso87720b3a.3
        for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655148; x=1783259948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AT8kLsvyzfUdZljtqGgd86QBG9Fqk9hCYtkfnv4Fb0=;
        b=C7UdArIQFwTYoHuuIini0VS1DKcNUCb8S6bzHgViJPeRqDlm/xrnZBveGXcbwkQO3c
         LghU9K5iGrEs94vpykrJ3EINv8XDmR93Z5bPvEOibR8h4nw6IIvtvCQVUQIVc4399mVR
         1OmDLri0yNF4hVuKwC6LOds5DXl53NdF6QEeC6IFwPUasIygNiF4gqAj8FIOwCMHK1J4
         bW0YrEI6u2fSE/eMnCdgtlUIEg587WOT0pP3YP7uX3IEDkgS011/usU81WzHA3tSymeV
         RJJuF+doEOArb9OuZUfuktRutMbJwwM69YkSWS1ct1TEUMl+Yq6S7VsSE2APCSmtYu1G
         uLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655148; x=1783259948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AT8kLsvyzfUdZljtqGgd86QBG9Fqk9hCYtkfnv4Fb0=;
        b=lHuatQkGYvp6b7fuP35ChVAwDaqBCWXPQspa/SxfL8cP9qec3DXQMEOX7odgw3Pwbs
         CWWpHcIcVvGs7HN1mnbR0Fy4qa6+sXnGFahA6Hq2yYl2bajSB+zWA5GYiBLzxjo6O5W3
         KP0cEIIm10foGDftHnVq22Fg1qFo8YROqHMVQ3H/ArfV5VrlS6ahPUgIKqx9MvApx3vj
         fOhIYvqcTIYGWfFpELOs5BDhk/xdJeB1GkDxJEK6kSQpzrRAtfDeVuMNtTIJr+UekOWG
         VuhINdRF/RfgXITJTlDTFMrvQg9UsZiAwa0/F8txS3s81Jdm9V5ORrFDBYFRNrgYHCft
         QjHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RL7isw58O601cLkAm/kXJA/4gNvZqwiKoXcyvsQxGf0cyoAhU2hP/TA2Z0zA1fODS0FJyXUJvaRvc6A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0IpjQLz72rmuocaFgO/JOCd573h3zHfyzp8T60l81yHq/vIuv
	mrwlIGdbTE4byaGDHTA9S9lBD36dmqq1/2eN36RVhCaE31gloLETFEqH
X-Gm-Gg: AfdE7cneEzC3y2vQD4nEK8MkuIBPxU2MIny/lDuwSLNFtfhq6xwYUibB6kUnav8GZ3s
	iw2gB8D5ZuL0+/QkyuONHhPooCurObeL8R5HCfEafX8Or7Rs4w3KPPfdk21QTYOaUuUNAN7nYQk
	tKgzzZxjcFBzz3oMw1RwF/P4F8wt6RhECuQRxJ2XfwPB65e0m9rECl3THmQIylGzydNPqX38HhG
	p1hfbEPE7ileInDgEBp9C8Zp60as88oR6W2t6seBTgx1JiKvd+Vz9I0k/IwPk6hUACOmGmZQSV0
	F6QvTTcysfwZIUbWijwmmZ42bR36W0cja2WC7QbfPxoaoPX8DHKVeY4rg1vZMDXM3SHDKsGf6aR
	7ImXqEz4CvOZ9z48YD/xzvJv2Cf+dqc8aPv3MX/nJ0S3PxWHrSMkPhySsijcp15MiRNAAl8qlFn
	E0u46OurytlemtmDXQww==
X-Received: by 2002:a05:6a00:994:b0:847:7010:f3e4 with SMTP id d2e1a72fcca58-8477010f774mr1544520b3a.25.1782655147718;
        Sun, 28 Jun 2026 06:59:07 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10041108b3a.30.2026.06.28.06.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:59:07 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	driver-core@lists.linux.dev
Subject: [PATCH 8/9] arch_numa: remove redundant node_possible_map assignment
Date: Sun, 28 Jun 2026 22:58:22 +0900
Message-ID: <20260628135828.1393120-9-ekffu200098@gmail.com>
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

numa_register_meminfo() sets node_possible_map to numa_nodes_parsed. The
later assignment in numa_register_nodes() is therefore redundant, so remove
it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/base/arch_numa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index 19bc806313c4..d4e426aa51c5 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -221,9 +221,6 @@ static int __init numa_register_nodes(void)
 		node_set_online(nid);
 	}
 
-	/* Setup online nodes to actual nodes*/
-	node_possible_map = numa_nodes_parsed;
-
 	return 0;
 }
 
-- 
2.43.0

