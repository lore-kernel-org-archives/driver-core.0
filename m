Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.235.229.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047523;
	b=jxWrCtO1eJjvnJKsuO+GZvRbulpVJQa3irjBYaRkpYwnbzviqL8v3jcqrey2jKTKyQ/y
	 QrdnevfEK+uxxNL0B81EKKCvf4b+Ab7P6uU/xZbYHYThl/LBlZEGWKEJdj7LTOYJEabCP
	 wnxNiLEQ8UJo8Qly8/yGYj15vQrzYHzesX1gGfr1MlpwuVv4KJ9G8BVYUSTBm7cUygTxU
	 dakh9aeZpLnw2m4Ef6vAprdPzZ70Qw4F3QvzN2358CQSplgeg+PgITAbfaKvXO36rdcJO
	 W8CFIaHV3bIw/vDSNLNaMVVqQZJjGvYwC2YH/9zUvrRE9IBVwuDgikvQChJHIKaMcgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047523;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dGo/XFyymha+MBhN7Y2DLOp0ldBKQ0WfUSuAmwPjrs4=;
	b=d5gehhlB26MQnh9JLjHONXVcetePRpE/6fGk+/6TV08Niek3+Mjp76XWiBuTNsBb5EQc
	 E6eD4TkFZX5CQ067URHMyAY3Mn1MUTcluPbXw5wbQCRBD+WrzbtF27ssNLrRjOt11HqVJ
	 K7H/NxJEU8RPvqXiYxpcHKuy4AsnuxYi/arM3IGXhTPNW6WczwfLH2686+8q7O3QtZMhb
	 C0eSB6nqBqOmw9mt8WH+NY2ex+E0XlhqNxjb+UD4gm4FVsA67Ea0PutITam/ZDAQjOez/
	 rZaIi4J8lWcL9zhxFzSKX/jG7AEc2E4ZZd38EUKr6T5oJOUmi4ZSGa29ajrMJ8Q5UTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=treblig.org;
	spf=pass smtp.mailfrom=treblig.org;
	dkim=pass header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Ps4UZkYf;
	arc=none smtp.remote-ip=46.235.229.95
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62328606A31C
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 00:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62328606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Ps4UZkYf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=dGo/XFyymha+MBhN7Y2DLOp0ldBKQ0WfUSuAmwPjrs4=; b=Ps4UZkYf6bxO9+4U
	GI7DheNbl77LymU65+533gWNSR9l6qadjoXtIo4w73jo60iFKJUd0andnY6N0DDXjZifVysqzHsB+
	Vwi8gzuuUGiGKByap6nX1wJDeGZZUmhxOzEvQ97Vxjt0d3LdNcVoZYNv08xodm1apRMKnaqi0pEX7
	+dtuIj9dPAHQSAE7Htg9CF9pkcqtiNT5d7ewPpTRcpI6xDm5FQLMorRNMoLqvGzedOs5td6aAzBM8
	I89f2b1DHagHlDwsIN6NgnQ9WTP/5UiqslTV2UWJYOB6D4BMDdWG0XivISLYdOrMSgmwB8O3jMfSQ
	adFk5ayaIWJO30cfZg==;
Received: from localhost ([127.0.0.1] helo=dalek)
	by mx.treblig.org with esmtp (Exim 4.98.2)
	(envelope-from <linux@treblig.org>)
	id 1xTprG-00000001tjr-12az;
	Thu, 19 Nov 2026 00:18:34 +0000
From: linux@treblig.org
To: dave@treblig.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org
Cc: driver-core@lists.linux.dev,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] driver core: platform: Check for NULL name in platform_get_resource_byname
Date: Thu, 19 Nov 2026 00:18:20 +0000
Message-ID: <20261119001820.168018-1-linux@treblig.org>
X-Mailer: git-send-email 2.56.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Drivers are calling platform_get_resource_byname() with a name string
derived from a DT.  If that's a DT that's broken without the field
that should land in the name field, a NULL is passed and it OOPSs
in the strcmp.  Check for a NULL name and return NULL; turning
a crash into one broken device.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/base/platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 3593d45f4a7a..5ef1cf79e57b 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -464,6 +464,9 @@ struct resource *platform_get_resource_byname(struct platform_device *dev,
 {
 	u32 i;
 
+	if (unlikely(!name))
+		return NULL;
+
 	for (i = 0; i < dev->num_resources; i++) {
 		struct resource *r = &dev->resource[i];
 
-- 
2.56.1

