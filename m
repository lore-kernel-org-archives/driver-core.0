Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794107974;
	b=yK3Q25/Qf7NOoNbaRgIlyleEZHt2b60v+sdWZF00XZN3lZmzzbtHhIrJ7r9NZ2+ne1Qd
	 ptd5DdhpuCicSXjIoVFO+13HrO14d7PCvovveeJzSF0RkNszvCPZpG9To5VIlW94rVug2
	 mBTgxvSDx3/jnahnaM/GrenpuxpYxkns5C3jKRl6MfrSzPTvfW+Np8RyPuSsD5gDFXPPl
	 30RnGnkhNzJke0BmBTSjo9GR/KI31OkdPUOcUx0hjx5ZppB4+qtNq+MuXkiYER5n6OVkC
	 a/7diIeiI7TNZp+pkU0kCHNnBH7mSkz/NOGlGvOf2n6y3Mq2XNPDZjAK9wvkf5/vtUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=U6DLFlcbi1+1eg52kgp9yC9/Uu8qOaRC/eauhKtdYFw=;
	b=csKwbDwy+51hzbvqok02nDJ3l24xnj1RXA92ddSoTpHnNoc21QN9mfNNoZ7lbH3pj71k
	 LVYPqI/3GshoUQcI4fOkQiC4jAshF2oBJwtaDqLHMq/Q5eRPjKjvE9Q0jfQOp4UqaTb/9
	 5gtwvPLkvSugrRsAxRPoFcPQSjPAawTr+731iW3e6hEml1vHuwTwrM1p9BbuO+ZeqenQ6
	 Zw8rsASdGInQH/BuMpL8epfulWhY4UbHj62Ca/N6SMrF2x3G5yn5/b0dexvwb0uBJj3YN
	 HbvZDgth9i8dDxNjLdziCjJWlSLbthszh25M23QVqvmbLqMXpsTKHpncY9pIXOhV0Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TJeWBxnW;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25007606A31A
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 03:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25007606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=TJeWBxnW
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so370145ad.1
        for <driver-core@lists.linux.dev>; Sat, 07 Nov 2026 19:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794107973; x=1794712773; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U6DLFlcbi1+1eg52kgp9yC9/Uu8qOaRC/eauhKtdYFw=;
        b=TJeWBxnWpiSHxST8Ec2L8lXHVdf6uCgA+5w4/catiWM1AtO3hkGz0e0TAyBtJG0f/S
         S2J13tq/U0kTy6Dvnm0K9aaDFatiusszVvDgvtKvzKGOKlzsgGkWflTO4k+ip9cw+Td3
         9cuE3EslYoiuDoD72n5Z9uwJCuaexF0p13+i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107973; x=1794712773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6DLFlcbi1+1eg52kgp9yC9/Uu8qOaRC/eauhKtdYFw=;
        b=wlbR3xN4fZf49nQRyZ4v4AbgCV+67Ca4p8LU+arHeT53SACwSE7OVz138PghBmHhxN
         Nc68efYqC9kUM7YKWzKjtESjZRbRY9U36syIxUM9IGNXQRE5E4aY109gPCtffcwW2zv4
         /uofWdX7mlPo1pLZzOo8jnEIbiYlM3r6980OATowdXiGz5UZ2VxKFJaz2vDusxGIx0Pg
         zCz7yugRp+8fWeQVd2vMLPjT1MRvzvixcCmrEWLQoeeMEDh0gy1RDjCd9FyrulIg9CZ4
         /WqtrD1+oxQzrtPoBG2Tqp7aMMqpBPtDkSiPvcNMr3Qll2YzcKFGSgtHTT+aULkWIRKp
         YeXw==
X-Forwarded-Encrypted: i=1; AL+hErGDMNhFyUMvLq/k/DJC0YVemsszKH2vM/TUipZuC0zJ2I7uWFu7tjuqbf2pfUK0ogalPlaTxjm+vj4PiQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kAMNiToy/RLQJOW99NqdPdMIt4+uhrGow7AhyFJXSedZM+0j2
	BL6C46WGnjkzWz0kt7krdXlLX9r4D/du7AQD4Nr82Ej3ujfVb7yg7nCzakAF/Z53UTU=
X-Gm-Gg: AYBFou3HnTkmEDEaHCLwO/AP3GO2Ei3xnYSE8JN2WGDTfXEsuxfLt+Rtt0s0oA3UnA9
	fSSZCiMIfBuga+wpgoI8UICa2PriFcwrm4wXThfjfok8LkoPrgZhZv+e5jbOWHskx629jCzmp9+
	8il7nwe5lQTQfFty9hgYbHqLf26pDPLwRB1STahKqX3KdyXOM9vIuswmykkHHmpr2TtHt/+R7cN
	QO5BCe7E91XGLy3vqQVoP0vskNP2qHUMEPBSXBThYD13evNmIBh6B0A4/7SJCt27JU/+skE2McI
	QaPFV/7QvZTk7PIcsYVgYSmR57FVqIzmcM4JUqTjv2wQbdhQbBGQLN6oKfvnIhcw5crT0YAwimk
	tsXDaLMLDKlJE5CLGEM8ZMZEv7x7/f0Bjbur6K21fxtDnTqhJTfGdSRD8NeloVXe7UHlmDpOhy3
	15C159zq40NFHkBfVSRvfEXHcLeZsWMUdA4oqHE1L93WSC/pYWT0Gzjr4uyJz0+XGqD3piDZ0lt
	X77sfUK1IztAFjJiyUjmAaijjyHErzAfZZk6WUpRIFjtbBK54v3OvQGPm4Eolu7rHQ3bzLG1Qlx
	xGhe00WE65XNvVdCNvl4E9jIp7cf1XUnljeYGsvUyzZRsMRzt1QSIeyF8MSQBpwYzH3iHCJ7vjL
	HRCmpgGe9Fmr8AJRdIAWYmmvOKDrnBxCmv32crkWPQ9emkBi25cRElaDsrWdSZ5ZAJOHTy/PRwz
	iJpGIf37uSNGaZ73D2DgQ+GClzGxlw3OiyDmu9WNAVTUeB1Gx3n6iLkw==
X-Received: by 2002:a17:903:3c50:b0:2e9:3f41:4212 with SMTP id d9443c01a7336-2ed8375ee02mr4790015ad.13.1794107973499;
        Sat, 07 Nov 2026 19:19:33 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e7416sm1411875ad.17.2026.11.07.19.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 19:19:32 -0800 (PST)
Date: Sat, 7 Nov 2026 19:19:31 -0800
From: Chris Down <chris@chrisdown.name>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Serge Hallyn <serge.hallyn@ubuntu.com>, driver-core@lists.linux.dev,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] kernfs: Build paths in linear time with respect to depth
Message-ID: <au_qQz3C1yNFRLOL@chrisdown.name>
References: <au_pnu4s141ylqHD@chrisdown.name>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <au_pnu4s141ylqHD@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Chris Down writes:
>Fixes: 3abb1d90f5d9 ("kernfs: make kernfs_path*() behave in the style of strlcpy()")
>Cc: <stable@vger.kernel.org>

Note, I am not sure whether this is worthy of stable. But I have noticed that 
in some cases this build time can be pretty substantial with these locks held. 
But on the other hand it has been like this for quite a while, so maybe it 
doesn't matter :-)
