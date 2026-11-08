Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154345;
	b=fQZmaM2sjOp0lSR2h1MOn7pBQZsn5Yo8gFGyGjazfuJu1lBbiEJ7SX5O8MOi26kJ1Q/S
	 0g3Lp43eAcZa6cyeH8To8uMbNN7ANGCpfwuhGmaDFICc5y8FH8l9oyMOccCTHCbxzZ73B
	 DGqu2DqkIJ89+43XoNcvz0DsG15Tx1gD6W/oTErbK9loeL9NDP3Rs1vlZXrD62o01bYLY
	 M25wNmrjtVZSJXd9W0MW5eTbMziFj3i8YihHa49THuUJSG4CzMiZr/TL5dhFB2FOUftVd
	 Cw/YRsAy7rfnaNTyLT8UKO1X60R/FSBpvbUR6gb1R19zzLoLd3ftulEYhsy3B65robw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3dQexnH2CQPCd6uomqpp+F0/o0hfCHm4JSVgBUNYqmk=;
	b=d0Vo7xwqIaseadRihilZ0lxRGS9reM6HYbjQQNAGyTtXfxM06PgmaNGpKTbOFxjQD8y+
	 CJYbjR+rV6qXksE+kkT1RqgfZVvJ7fBtr3HNPuiDSQBFTOiWl38OgFRkwpH74X7qC7cax
	 SONEKvtZ2mpzw8dILTOr4tYqtBre9KdutLbcrS0Zyn3sp0svxsB8GPhi98V7P74SYjDry
	 XhqdD0CJlMp2mHRhhdLWG1aQtxfrV+a0UVBY7uCYsbIHnZ0b50bpD+C0x+jizo3Xd48jv
	 6fPayWbWRfTtnihhMeIuUtgGEIB8Wgh0rZfQSRy+M5Tgv2OeHtNtaEiaSmw9k/vP4rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5nH+ljB;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D1606A31C
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 16:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5nH+ljB
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so1938705e9.3
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154344; x=1794759144; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3dQexnH2CQPCd6uomqpp+F0/o0hfCHm4JSVgBUNYqmk=;
        b=i5nH+ljBCYh0UBDpLdmZp9vuN0CbPMPiNn2nZ+c+ZVwwR/Zd8XIi7IYEVOO4YYyHzj
         wX6OjpUMAmJ/nBLGXTa7M/Br1sCekLJ/zf3HqGX0BmGRBIgD9Njt7RCXSzvwSBRsb/sb
         uAyufpuSDf+TZYkYf0LDg5CymMdXVGvq8Adl8WcMk0QqJzkkgDhLFL4xVi4oS7p+/wma
         hLvCMkgWbybfxEy9kN8PhZB4TQPH0v04lAdvWjAjQrOrcBc5N/9KgqhTM77FtDxOZUgu
         jh20YiS+iK/VzqJ6j4tYBBWtPhVMEJsVjSOtOlH2cHs7uCDeSZqJ6A3rxD9RAqPz3km3
         9Dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154344; x=1794759144;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dQexnH2CQPCd6uomqpp+F0/o0hfCHm4JSVgBUNYqmk=;
        b=Nek5u4JiwRC5H/nKU1O0fV1QAbgN933omOdmhlxkkFNpJATk3NYxOubp++O7QvRvCJ
         GTtBiF8I35Ch3fg9PPfEJAi0l7VbuwS4J0wTrZ3+gzaFBjq37d0N5lgfkJ5kIWo5xjsd
         RlETsL7itxdR+UzSEfv8M/caqcXhEEkwYSMgDkGYwQE0sBDQjhshGhSai7td04FfO1le
         bASyQvd8x/4fXoceG8xdgcz0xVoXezLQGTQE90YG3KaHME+GK45mbXingp9YjsRvFAH8
         Pu7QaW8VIE7z9eNRqU64Zjuup97PZyVVqD5DVTTl9foDzH93sGMlOnMcVKZQeAI6UhgN
         4sMg==
X-Forwarded-Encrypted: i=1; AL+hErE49IcE0bc6nMfZbJU27Xiqi2Y+oenUpuPVxannU4KTpvpLIW8RC/H1scm+5KdUXxkJDgxOum9I+Y/Miw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/EA779kXcj/h8mbGJ99jnYp9cg7IJ3jL8ATtSLg3z1gFBOWBXn
	huI9mHZ8YCEZzfWiVIc47p5tQbfsCDST7ATdoZkwEfzezirUXFGE1y69
X-Gm-Gg: AYBFou2vV6+gn+s0+1XDYaG4sJXzd903RQ4FAGoIfUf0yAGRxm31hWLlBDwBidnoucN
	vqB0jJ/4+nO/5sXwYAGQcuA7Qf1FoK/rH4d04ceSqO/XmOYHhRaP+vQNXB47auKq7YJLk5sjCFz
	L/dY+/I7H3BMy1+v041oqpEwuB+iw0a2qDqa6taO3Pe1Js7W4tQIbJlVMNlV8IHAcFYdTJVOt9H
	JLnqsCMNrO/IX7IAh6Sf6uIGb4vO1OKclAX3iy93I9v76eLHoS21dBRbVRIU31bkckLN9+mLyaD
	9rOQgJ/Y+Fb3QmA0Tmsl9WOAozLQTymGJ3hcAly6dGWlfafFEfrdykKCwH8FbK6dszGe1XVcknc
	PlJQ2XZT6ZFtKg8AhVw8KonFzmFoP16Rd4pqKKP0aDHT6KVUo1jBE8L7l3+7SjHkEz/4aB05yOO
	LQS+1u1mEmfxeVsM5JEbaw6Sft8VA9ooYKmYj2Pir33pUKYfD6UY5RWP7stDyg0vo6mfzM13SCB
	oaMxZm2Pgs2su8lY4fkZeboUOvUIEByQGRpa0Tp+oEqQCQnuUnDd+qxM03lmQdTM3s5QALVz1X/
	cSZDQOGnufPCtv3UhLDsbFWPtDcVu3wkhJhQDWHfHIwroWTECoEQGI+4RizT2sKNDKciPNgd4H2
	c13BV/BBHMJ51Yf3anZq2AD2Dl2j6iuaNqLp+7N9gM9kfJCQ5q+B5Z3qCjLHvWhrfXUw=
X-Received: by 2002:a05:600c:1d08:b0:4a9:2a92:231f with SMTP id 5b1f17b1804b1-4b960d9b26amr34842195e9.7.1794154343463;
        Sun, 08 Nov 2026 08:12:23 -0800 (PST)
Received: from ?IPV6:2003:ea:8f45:7100:cde5:5d75:8598:b64f? (p200300ea8f457100cde55d758598b64f.dip0.t-ipconnect.de. [2003:ea:8f45:7100:cde5:5d75:8598:b64f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb75913sm124864075e9.0.2026.11.08.08.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 08:12:22 -0800 (PST)
Message-ID: <62fcd666-ea7d-465c-87e3-9a15afd25624@gmail.com>
Date: Sun, 8 Nov 2026 17:12:21 +0100
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
Subject: Re: [PATCH net-next 0/2] sysfs: facilitate creating an empty
 directory
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

On 08.11.2026 14:44, Heiner Kallweit wrote:
> We have use cases where an empty sysfs directory is created.
> This requires an attribute list consisting of only the sentinal entry.
> It takes only to modify one check to enable creating an empty directory
> with a NULL attribute list. Use the new feature in net sysfs.
> 
> Proposal: Apply through netdev tree, w/ ACK from sysfs core.
> 
> Heiner Kallweit (2):
>   sysfs: facilitate creating an empty directory
>   net sysfs: simplify creating empty wireless directory
> 
>  fs/sysfs/group.c     | 7 ++++---
>  net/core/net-sysfs.c | 5 -----
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 

Will be replaced with patch to remove the deprecated wireless directory.
--
pw-bot: cr
