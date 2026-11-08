Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145508;
	b=G4lXHrXwVmVejNVIrmGaV5Y2DYvs7bPpE+Vi7Wlyzqee5L3BNqBWL5p8JLaklDFhJ7A0
	 5Po5MlKCUd2P8bj7eFpJFlnlWxtJMQzjqhdCcAlnkIk1WnHWrF6VqG8XFgVXAzlLOi8Zt
	 IMIuj8EGVb7sXj644B681dypK9frBJ/uxKQCSAcd+i9Y2a65ThbI9Yl+gttfXey7+Rz65
	 vWSv15JqYK83krVV9ug++knnmQ8ZYuBh+kdCmVn/YcNDZn8+nYv4j2h3j7arwKG7eSRr0
	 +Wm4iqU1auz0NG8HuVgb8nzz7PBSYQET/FOJpaE9jQ0c2hXvyRyLZunZF395U47zHIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y9JGx0xp9VYGX29iTN5G+CyjHNPMVNGZ9xkDhCs814o=;
	b=rG6IFQa9zZVnXVfEnB28CAQbZLLMg4O6q4/hl1QLL7EtQC4LRAM7FTXpirkWXj9zOPaD
	 4Ze8y/jucNpquQVT4S11GVKa8ydJ4VShFwfvt3WhQ2zSajlD78vJRZv9XVrA3HnA6G/au
	 Jaoh5Tu7nTp2JasV7VHwj20mHiWn8o/tE7hxryg2njP0zQQ74FnPTxG+TuZ+9coozvRBC
	 mOrtl9k9wpha0JpeRRfnyxvw6AgC6vV3RITtnc3oIS+olMlluigCbpLA3wXVwCTwrjToX
	 OhbnfYB1kMbYFV2saxuPxwf4mUiRUImC6xsDpGjtm9QEvqiFFdXOOr3qdLvCiPIkzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OVSE8zFz;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2F606A320
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 13:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D2F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OVSE8zFz
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so453975e9.1
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 05:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794145507; x=1794750307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9JGx0xp9VYGX29iTN5G+CyjHNPMVNGZ9xkDhCs814o=;
        b=OVSE8zFzOMyjTis/1VeCh0JNmIFh46ShNC1PwE2NlnAZjt+idT28+UH092wxhxGuBZ
         ic6viyOHRjGzLK+53ZXcOlmqEoyEZxsFK0LFFtsMdTuOq1Lp4i/VnjBbP5Zhd4uFuMld
         P3OT3TUJoNPZ9xRC+EuyPqYP+dlS7S4RA8AaHdIMQkfxFEtyt7BONRd6a3eoma3es1T1
         yvs15IGUUbdo+bwwGIUwyLuiUrM5vSwbIDhzOhzlu6CKvmD7+HW9ACoaE4W8t0KWvNcF
         ROXZ9Re4KKIwb9KeOjdB3Bicmy106RVhCLeqWPT1ymW0WVnoyz8EhSmsYW9JL+CJUtWI
         VtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145507; x=1794750307;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9JGx0xp9VYGX29iTN5G+CyjHNPMVNGZ9xkDhCs814o=;
        b=Mn5l6xSiPdo+kqjMPddTYV/HNvKUUizItqSdNJIQa7dBowlEahKmYP5D+BGmy9SwM7
         Z9P835/znbN3LhlVecoZZBNNTve4nawFtSe7kdwXdbv9kxALT5xPlSY1Qk+SOH7A2jxa
         /vvb3QVaUptTqNNx8NCYjS1PLDngIjRctW4Lq12LJthX9Vhtk6IgbVVNgMJmKTRMdWmO
         EkL1PpnsXA1rwUpMTfX7YQ/0CPXg7Vtf/FObG4cLWpShOnVAuX+SHFW3gmWt8nYV1XHe
         lg8NDg5Rf44sctlTd7CopDD96B1r84hZvEsVrbNxhPHwqu5UVnHJmNVoI56/zpxcgRKw
         dI6g==
X-Forwarded-Encrypted: i=1; AL+hErFqFbF7DRWzuoVVN5KWuvJKL5HmFjjyIcHTgYw8CRBeQhOzxdb5+t3thGX6kDrq4mm8CVsvPsN0ZHE6qw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/dz24O0wjwiCklEK2l0gjy9Ayl4m4w/v53C23mBcFydtmlvJqZ
	GqzM+I57SoVl6XspIxw0USzAwDoOgxsm3NcqTT5gvd9KxagcUW/WFP+i
X-Gm-Gg: AYBFou2VbwHcaX6fQ0Pwb58g8dgcmkIwFuQIGHGNc50mLdxlPskvBq2/1+rn30q0d9G
	ppm1eX55mqOuRjF4FbFr9JsHy7FBrHnyOPaVF0/V80tLPpGHjRbUv3CgZ+ikg+MFJSmxj43R6Wq
	NSRXBLCFXWaGDDMlB1bBLke9GVLjNJapBRBUiQXdSXBKKDbVFsUIlW2ySoOcNEscTQQv4HatYx9
	OPyZGaxSG0UWyjkR41Y4uk48VmgIf+madk6R17K3qE5vQ7TsUmBUPVQgr6TJuFcuC9JCYiGA1CL
	fD4mNQ2WqMMqTpLSUO8E2rokW/H2pAc+AYYG4N6OMSkoHgaxRCNfTs/xPD9OHnmX02s1Gbj8itD
	iSadV6nPpU/VRqcODtQ+XJOwiUJqTJeCE5k7qlqj6B+X4yS3SYwSZeBr4AUk0DaNLvUbMsn5dYb
	z6YKJ8g4msDfl0HTXf/eX2YmQOQgU4yxdUDybKs+RoOh/Op7vEzefAS2tt5vRVzCpy7bKzQb0Sb
	4BxTD6W1TIPUBTY/5zfSmJR4bxR1n5SWhCCclKU121VGYe5TXB4K0+GsbsWgRNbBqM41KKfGSrW
	p0IB7aYEKbdFm8+Q4EruDvYXwBxfT1AMwV/ZVfrMoqwK+aSKwdTSnb0jbjGecAZW9U0b/Kjcht8
	FsZOiazeEQFuZ1CJ9qRkImfHiizS7Y4j0mGuvPCeRguwurkhZ3lqEhV8kvDLxE0YgnA==
X-Received: by 2002:a05:600c:c174:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4b963c675c1mr30195885e9.12.1794145506839;
        Sun, 08 Nov 2026 05:45:06 -0800 (PST)
Received: from ?IPV6:2003:ea:8f45:7100:cde5:5d75:8598:b64f? (p200300ea8f457100cde55d758598b64f.dip0.t-ipconnect.de. [2003:ea:8f45:7100:cde5:5d75:8598:b64f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee247e9sm62857665e9.6.2026.11.08.05.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 05:45:06 -0800 (PST)
Message-ID: <340683d8-83f5-415b-b54c-b2916817f860@gmail.com>
Date: Sun, 8 Nov 2026 14:45:05 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/2] sysfs: facilitate creating an empty directory
From: Heiner Kallweit <hkallweit1@gmail.com>
To: David Miller <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
References: <0a0a7987-abb2-49c8-bc16-3938233ae9c5@gmail.com>
Content-Language: en-US
In-Reply-To: <0a0a7987-abb2-49c8-bc16-3938233ae9c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We have use cases where an empty sysfs directory is created.
This requires an attribute list consisting of only the sentinal entry.
It takes only to modify one check to enable creating an empty directory
with a NULL attribute list.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 fs/sysfs/group.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 4e1e4f18a16..031cb6f36b5 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -141,9 +141,10 @@ static int internal_create_group(struct kobject *kobj, int update,
 	if (unlikely(update && !kobj->sd))
 		return -EINVAL;
 
-	if (!grp->attrs && !grp->bin_attrs) {
-		pr_debug("sysfs: (bin_)attrs not set by subsystem for group: %s/%s, skipping\n",
-			 kobj->name, grp->name ?: "");
+	/* If name is set w/o attributes, create an empty directory */
+	if (!grp->name && !grp->attrs && !grp->bin_attrs) {
+		pr_debug("sysfs: (bin_)attrs not set by subsystem for group: %s, skipping\n",
+			 kobj->name);
 		return 0;
 	}
 
-- 
2.56.0

