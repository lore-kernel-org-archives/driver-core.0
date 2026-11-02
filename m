Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608355;
	b=KiKThFHJkdG7An9e2WtytyGXaT/FhyYD4WpHJ3a3p04cwxGYVW9IXVQ2i1qmqQ5vMiaC
	 Gp1h8LL1K2BOJMVuSaQ3oWVX8LbEiCLkVb0wz3Yo+6ZTPNN/2dg1rRw7v4KSJWyXst8tW
	 WwA5lTwszeS76mAuRk2dZgHQaivIBr/vM5juwOPXaxywopvXWufQJQ8BtZBJf4Z9qkRMv
	 MKFwc9+fcDoTUsoMqJbr76Vfqg5ZTecMieq/0/cVEie+s5Yp+fJJdNl7NK4ANggH0Pc6y
	 k+/6RH9E2IQB88o1FnIOd8KQCuDo/JYTbA/r2bWBFAAtxexkaJgh+9jUjaUt+2q/uQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608355;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RzMvX/4kYH6XrpqdRwOjj7jHgC8mTYV+RR3L9mmvwWw=;
	b=yGiC6a/hgwLBLaGoF+/FvTr7CqKnOshTaF4jNO9cK3EO/Vlw22VvWJistpHSZG+VjUCT
	 1TbcMDBdl6YUKykAk4ynvWlukWejGetMlRvIGR8zs90rCr00jsLGng3+S5EFtE3oYKJpu
	 E3x1gZspAOpREr3DGERq35256LlJ6I0SjAfnvEK3bBGYMk86dfuoeuLSmqhMiJwolIcYB
	 hgnzP5HFnXs+NO1HmFwRMXwLpMit5sjFlrqqeapRls2MXIatEk7p17b0YIKwvDPNQRPbw
	 /PvgNKdtmPEqrSUnSu2klUCxOcVz50AnLkZvgDdStfnmGtpGtdY6JVIY7aFf6fuLFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgre8Vxy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40379606A32C;
	Mon,  2 Nov 2026 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgre8Vxy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50E41F000C1;
	Mon,  2 Nov 2026 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793608354;
	bh=RzMvX/4kYH6XrpqdRwOjj7jHgC8mTYV+RR3L9mmvwWw=;
	h=From:To:Cc:Subject:Date;
	b=Dgre8VxyUijsZO07AhfuYErppIj8V/Z7jqBIMBRE0XVE2Kop03U10dio+uNjCeMEk
	 cADmsjy+30QZO9UAk/mzgLhOFf0QcNj9G6Nj7A4c+r+dXetNTMm+AGqPbPYCoJ5Ks/
	 NuVR1ajJYXWNcI1eZoMgtfIWoOye20POe+4U+Vk8hOAkI+s8yjSeIJqrTUc2vOxoz1
	 SP5yQrEgLorzH/eTpE1RFRYD5xKvC3WLSMNVp0MejR8PX6r6MpZt4bv3nZJMMHw6kD
	 iR6LgRJb8YcdEDf2s8lR8gXQYjVpaEv2v6q3Y+BxSjKH2Ivk05dmI5XnDn98R7krHp
	 O9Oi1jIfFqs7A==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xNnSy-00000005Ltd-36ry;
	Mon, 02 Nov 2026 09:32:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update auxiliary bus entry
Date: Mon,  2 Nov 2026 09:32:18 +0100
Message-ID: <20261102083218.1275785-1-johan@kernel.org>
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

The auxiliary bus is part of driver core so add another maintainer entry
for myself.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..92401850930f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4484,6 +4484,7 @@ AUXILIARY BUS DRIVER
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 M:	Danilo Krummrich <dakr@kernel.org>
+M:	Johan Hovold <johan@kernel.org>
 R:	Dave Ertman <david.m.ertman@intel.com>
 R:	Ira Weiny <iweiny@kernel.org>
 R:	Leon Romanovsky <leon@kernel.org>
-- 
2.55.0

