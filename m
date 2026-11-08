Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145453;
	b=tdURNaLvoHTKBJQpAjTmWFQEfu2rnK7Xx2l7zLGwDw2dJmq/uJmMcIgGXFB4gLS7NmKy
	 L3Txyx34LmT9yxQP6uw6/mQIF22xOd70N9vIr+mTpvsId/seiH/yf+In8FP4lCDC9WJxR
	 uirx/dprdB3ajShKeQLmJFV/xJDT6DT/mWY1xYrLwyKTap18y+hEamu4/p6HoL+JWure/
	 heJ9AMIVJhYGxnXApKuwxbZtitPFCCKKymG7gh086g6Vqe36mIMPvHNRIySPsNtOfXXHT
	 P0SpBfu//DHOtQ6ZVozCMAG8I+iReHvX83ndUnDqH8JDzvVeNp4/owRaVN2eRpcNWBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=/slH5zszpOl1ltCk3nRrYIZgnTGPPYf7qmqiT7WcwHw=;
	b=q4UCesvpPVzo3N9greWBKoHsY1ZXrewqSFwUoId+LW7bmhp0SBzM5Hl5ngPe1P1U9uU9
	 h64ixOq0QiQLW15VCWUQ0/1IxXZTgwv8MVSz6ICu/W1Bi0Bz+0rIB31NXmd35m1iQsShf
	 LqZVqKEUz3Td2ytkdjCqDomQHEIxKDOL2DlgiMIjvgAHhbTas7C45cGaGlDwqsQOgvyC5
	 WP4jdrY7u79/OePQy9ODxJ//NGQdaIAXU5iZHy41Z/YyZ+K+NzWnYIXBnQEFSHbRHO0GL
	 FxzwYo/rGR7S9j8Cd9FQ7qf9mIUgEBnROAYyYIA6fGhs+qZBxhNLnoxwkBWPB3ul4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpktgJap;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A1606A330
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 13:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001A1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WpktgJap
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso39847f8f.1
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794145451; x=1794750251; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/slH5zszpOl1ltCk3nRrYIZgnTGPPYf7qmqiT7WcwHw=;
        b=WpktgJapX70ybSqDpsa+Cn/uwMEo0XSLQWCWNbPWfukavFQOIcyGa/y24N58j8kewE
         44uYd9jFT/JOfD4EaOPIH1PWiRPeQljiftyCvbakKUiLqfAZ0fRXkCpB+3MpaUh7Nwj6
         Hm0PsiEAipaD2UL3YoULK9hLeeVrfhgP147Yi7Ns9JRhzs7WOHzTAdlYLt2OiH0FWR7j
         ecXcVZa2EfjUZpFio7/zigR58yITFo+JJkF0iJH15w80pYsllKHFRqi9URqWlq+6Ldl2
         NyARuP1ORS0G4VtvqrLehq9IOo7Pt/COWnr8oObmbKYtYFGUFias/Qth5JrhtmHbmmnA
         vyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145451; x=1794750251;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/slH5zszpOl1ltCk3nRrYIZgnTGPPYf7qmqiT7WcwHw=;
        b=F7UvyNVQFFEQFJS42UDfXGZIoG6Tjns6dVPzO0TOI1+K0vviRBaie/mMk9T4zGZHzK
         66D+u/1QPxJwz0y/OcefCrBtSl0WZSWg/mzaIPk8auN7RI9vRJpEU9MfbWOBM5bhJN1P
         uIW8PGeM8oCKDvnCBGPCrKmaNJjH6cGpQCmaY/RhXSsMzXAUQkzkoNhgpZWcTDl0GPr2
         2ghY5jacABAhNzWkjeIq/CYzEBbT93t5ymBreOVdz43yunpzykuLRFZ1NeFOzigVXW1T
         4PmLk9/P4WDttmTzk6+o/yq1OHENdR/zQRdsBsJtFHCubVTmTm/MkShwYFgg82d6+bqy
         fMNQ==
X-Forwarded-Encrypted: i=1; AL+hErHwK8AA6+nvM3VjJ8yzHdVgPYPndcunhdml4R5b5amWO41n19XVSYw94E9c+VnUPt3IkcmvJo1p5y+Pyw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9PztgwA/QQYAoHj4Va83G7N3RbTIRL8l+jG2yDI/yR3VkZq4sE
	qa8p6gNCHfsIVZd26Ye4S6EjPXkectm2q3kZ3ZZqV+FTBfaV101s78qS
X-Gm-Gg: AYBFou0LN5urT8aBogAztiAP5x+mknoQa4C3sdstcD8tPq0/76y8qPEXZqX1+cP0DMs
	lY9rxo1i2Afzbhhh6MZwQLQrV8dwyEEB9YPzqVISU+nwu8T3bfQPl9JhXN6xcLqHBRt94kH7odo
	o3Hd/DssY3Ik+v/UAwVM9o6MqCO1qTY1PQi8y0FgQNyR8J5ec2cAJi2Cj3q8vl1bFsHF+s6nncR
	sMShXjWQr3zaqfcAMA8HFqo19rL/XYOeFk5HgA0pG60LHbC7l0SVbJCTdAuFUlp6JSJvsTXZK49
	VciZ5UA90Ta7VIkHR/mX9kc11zHTu7nliMynFWqnzm/GU49B6KMb+bhBLdrO4qzbeI6B+ZF1aS0
	/TvkCpNc8xJ+qywFPpSVdOdyPlPojMu3DNRNSR5WovkzgL6dRpETrUTznLsSEX4tpxMGv/n5qM9
	x4Mali5R6cZzBLs1SEiOjmAD0gd9aI4B+4cZWmVTBay8cm4cJ0g9fjPEvvvv9ZnMfKCfouph2RB
	NspF+UmQJzDdnb76DHnj+7lVl53XS5+OvhYNwSXNZSicdehPGQ0kpy6y2m8xoe/DewOXGGVtnCI
	5hPUclWvF5v533pdec3mBP9ombR4ZOOQwvxd0WPMJhxKUrsQSrXNR8zRIl3aUKpcy+fUh+q1Dz6
	9+KO+vSq1U+BtUvfT/a/NXr+dkqyNsQx6DNoQrOEDYTRy0Q0YPoO3jV/a73xixQr0WA==
X-Received: by 2002:a05:6000:98b:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-49583b08d97mr2802498f8f.35.1794145451153;
        Sun, 08 Nov 2026 05:44:11 -0800 (PST)
Received: from ?IPV6:2003:ea:8f45:7100:cde5:5d75:8598:b64f? (p200300ea8f457100cde55d758598b64f.dip0.t-ipconnect.de. [2003:ea:8f45:7100:cde5:5d75:8598:b64f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596509892sm4331729f8f.15.2026.11.08.05.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 05:44:10 -0800 (PST)
Message-ID: <0a0a7987-abb2-49c8-bc16-3938233ae9c5@gmail.com>
Date: Sun, 8 Nov 2026 14:44:10 +0100
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
Content-Language: en-US
To: David Miller <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/2] sysfs: facilitate creating an empty directory
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We have use cases where an empty sysfs directory is created.
This requires an attribute list consisting of only the sentinal entry.
It takes only to modify one check to enable creating an empty directory
with a NULL attribute list. Use the new feature in net sysfs.

Proposal: Apply through netdev tree, w/ ACK from sysfs core.

Heiner Kallweit (2):
  sysfs: facilitate creating an empty directory
  net sysfs: simplify creating empty wireless directory

 fs/sysfs/group.c     | 7 ++++---
 net/core/net-sysfs.c | 5 -----
 2 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.56.0

