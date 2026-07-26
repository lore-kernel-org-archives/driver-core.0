Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CD285CBC;
	Sun, 26 Jul 2026 21:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785100326; cv=none; b=P2mfi2Wi5Xx5dFg+Fbj/YAL234tuZNGnskGEIVbQDy+29WbT0QSMkVICwUyh6LI5F/7la75bfY89XS84shokLlXFjOUEoeOKNqC6ABDzJ3eedefc1JweegcgVimNSUOiwJZQrZXwsfvanz8ARx1QOCxnTzT/tSqFmHfn+Vy3wM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785100326; c=relaxed/simple;
	bh=qqOj1Ea1QawJpRx2QUPlNf6r7qfNhH8NMacwzxhNeUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TPIe5pAy9XvutsGTil+3dAQUGMx0+sgxVF2H1B3yiy7zGuo14WFvmqHv3L82GwUOepilC0+PnohMFrCs/RoHjUkxC7eVh8awgd3ewnAxuWYY7VP/rOY06XjMQe8+2ksUryK4RmkHpUV8aIPLrRy9qCEiChFWKxinOEIyJ9ZQU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tXvVbOy8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tXvVbOy8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=8vnwfxAw+coeesaG6pJV7RfrdbE7SzKfU7jfWQ+mZaE=; b=tXvVbOy8tRonF0+B0nOw2FDI9l
	u3o0QiUwJVDLZZQa4jeOVEWs924hYKHOfAI3GmpowA3OgHDOI+N2pCib0Lkw5Ly1LMAfk/b48WdxW
	t8bO9f7D05fPFo0Iit03V5lQVhEffRWEXhL3J2RF1UDaqRhwCsQdSnXTHsqOk/zLZ9sbBDfoicjQZ
	HCvljGwErmWKfoMuIL7Gs2joqbJr37SYKDuZiu/1DkuTGcSlXlI5U4oMlEnGICDihVfFGIvEhcyRS
	bX0Ten8umUzrjb/0O/LMmDQ3nTLM8w03ygokhLT1+XaTEr+JgXNzOg+wlxLfJzc10Vv1rFqLQlQNa
	yYaCG8AQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo68g-00000001enB-1hnQ;
	Sun, 26 Jul 2026 21:12:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/driver-api: infrastructure: add property.h and fwnode.h
Date: Sun, 26 Jul 2026 14:12:00 -0700
Message-ID: <20260726211200.2643484-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add more driver core header files to infrastructure.rst for
completeness.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/driver-api/infrastructure.rst |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20260722.orig/Documentation/driver-api/infrastructure.rst
+++ linux-next-20260722/Documentation/driver-api/infrastructure.rst
@@ -17,6 +17,10 @@ The Basic Device Driver-Model Structures
 .. kernel-doc:: include/linux/device/driver.h
    :identifiers: probe_type device_driver
 
+.. kernel-doc:: include/linux/property.h
+
+.. kernel-doc:: include/linux/fwnode.h
+
 Device Drivers Base
 -------------------
 
