Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35888356771
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783873474; cv=none; b=dW790OpgmSHhyi3JFb+Zbv5bNlOAEcttU0nNrWHBYb7eFyvKxAlaJmCLcEwOfIXH6afYAOEdXxRWvE5L6ao5s509MIAwrfPc6wB/LSBv2s9/9aeJ9b07srogYamAPGKgau00EnDL8wV8/A1LEma8qWB26NrNy4swR0gEXUXCSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783873474; c=relaxed/simple;
	bh=jI4hEr4hmlVz6iutU0drlmWDqpXznYLy/7dSsorKm5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtSugmzNJm9oRs8H4uwgcSckFSJIEzT7uyaPKDgmZ93qONA5wIFVF03cNhYP6CS9Rn+gQqIVxj8hgi5nAcOgLptHEgiyhnX0J8bmXOeTwNOsrfzoRbHY8vlyg6WIlXKVN25DTxd4dNy5X37w4rbWowygTi09t7CEiqzL10+1MQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wAW2lz70; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wAW2lz70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783873432; x=1784478232; i=markus.elfring@web.de;
	bh=jI4hEr4hmlVz6iutU0drlmWDqpXznYLy/7dSsorKm5s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wAW2lz70n5mnPvP90PvpDBSVh/gnHgmYyxernv9VCGtrCJcUmxAM/LQKJTqtVLvr
	 vczyBuOH85cTcbU7FQ5uVNq9k/bTqFdkso567JAXrbw+BoHU8UukrxP/PskReyiA9
	 aS+GbONzzbpujP98zjK4RLKSKynzxMujzzf+rIOmtYNa7ZHjokaaZtOkLEfoayi06
	 rxxVcp9dLiBKHQneWmE5caulCfEr4yy5dt2VYIGmaocHfFI6ccOfedZ6edn+wa4/R
	 XhQaryMJDlaa1mXB2cwjbqgjJgqeL9lEvj+KI1TG5D7ArdTganvC30zyv6mgZq37u
	 xQVXAurr1xP26Ldc9w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MECGX-1wsXDu3utB-0003jO; Sun, 12
 Jul 2026 18:23:51 +0200
Message-ID: <d96e797a-2d06-42e0-a3de-972b4f71a5ef@web.de>
Date: Sun, 12 Jul 2026 18:23:47 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: faux: Move a variable assignment behind a
 condition check in faux_device_destroy()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 driver-core@lists.linux.dev
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lyude Paul <lyude@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Zijun Hu <quic_zijuhu@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>
 <2026071217-fruit-uphill-eb0d@gregkh>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2026071217-fruit-uphill-eb0d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8W04i8cFBh9C2jSqwOyalNLauXUhZirB2buT81FEksnjKYi6yRX
 3WF1mhzlNyqtM57iYtzFBaEXqstUd7Uw4Skt5IVFainBEHqTQSdnJO7TCzrhE05FmWn2OJx
 D73LTSIzNcZJk6kqWkTfhHjULqUDZkLQ2Jod9U+rVGuMKWSU2b6dWdHJ3IKloGgBVm+HPjo
 wpAOwwveYCvA5tkenswMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:61h/OXFiPu0=;XN7dNXHQEA8L6nw9wSLgGG8WlaZ
 OMaNLvlHKwbYaJtoctokZYCMVN80nStsHi0dDQ9Y6fSF2ckvZF1hXJW+PXznQexCCoHho+m3h
 f4UJcF+1DZs96ennczPipoSRdXSVxGAb6VhTfdo23VEKXWXuK9an00SryFmDzWZr5BltcXffY
 +7kBJ/6OgR9WDwPoyRC+d07aykLNlmt0dS8NmDdarSkbTg6G1h5dTNKOfHSBxlhJnnIGQ001a
 FlRJPoexzHGGD3gU+MTLS67rgeXm/2AGrJsfHx2qy0c6UPnYZB3ezkIczntnsQMUOEuNR2gxM
 OBWW4XC73uJsSjdtSCcasRLo7h2m2ThkHndkNv/7nnQHG2k3MV8LUEloFWVHzU04twZG5XoOv
 d0ywjAQxXKl2fmgQIQQo+eyE1vKA2kUfo+pY01F6atBlbqs2wWmru7JiZKDn4j5UmOHWX6ONN
 d535wgcy+ePBqXJrMwE7NKlHJ5qHYfqc3w0UA1rQJetAR66ynGvaQ4mBHKZpA3nE4O8Y54KFi
 UGa/yc0B+befPfG+IKS43VASCoqO4PMjtH72kTenHNwx7rH+4GzgAslBwv2bFE655UGMbw9Jr
 BOC7FOTMMMBr0UPgyg/D16APMvOpaGeBxMXoQbviZIeNMy82kWTFxKmrQvmcNdKuNlRRcJwuT
 zFhe3i5rFIx6iGOyw9rrTbr9LN4mQRpgxS82d/airnAkwvelqUXyqDaNAJIeKGL4VtOQo31Sr
 35UfbNUZUKiINTDab57n010VwGcuXHQJfjEPCLgvFwt7Nis9mI3I5A/OoFIP9uwfe2LnqRfQF
 OJcfNrbRmZ3nGs/4iP9rlbCNCYzUZvr63KOXiqGQTnx6Ur3wE8rfOxj/zAJebgIWyaJT9Am/M
 64ZDaHWNu2fXOeVrDOB7SE/Yuz5HUTaK4DxzRdJtIWjno7OyYL6oGoysBEXcbKtWHdN18zfeP
 E/Ij9SxUNnyeYETPY7WW83f/Y/mhka7zXma0EJEZDAeVZNYCvR+RTmzt+Bsfd4wZjONwJI0gD
 5GoFqdvnMDVnCvLJy/8+zDly4CsRZksoefq1WRHaVSyYDU8U0mCVfuC7R0yk3I8PC7Q752nfL
 eWJuBQVRzZ98ksyMzSTWUZTd56L4QujY4TEq4Ajiu8ly/XuPT4ftpPJVUTlNFtQFT77VX567y
 MjZZlNq1BLuEj48vbmWccR8LglGUn/YfFCfr5YLJnAB2aoMZ6LyoA8Bw8ykFX1R+mLd8AyPFz
 c2oqyRiPAhkNM9Gi9eYaviVnmMxdsjMxzu5IBLbCt56E+sF8ADLN7cBpSnTbeNKIL6euIVtwB
 N8jWtnb/lI2iMU9aLs5vpY7I1jq5xP7M44toA/npjx0S9MC2mMHjthAfMD1UV8C+IK53R16Y9
 z54dChtZEYvsJEjswbyFpmIUN2oFlzecArEwzYl6xrKLEyjmMDvIYIpUAbQvG7Pz/xeo2dPMy
 V86v1YrwxPFzAg9iKtaNfdsphSskUVrqQtJxTUyNFzvewYEysap1bunT45lwjY7N+3XMOis3Y
 Bdn2cHNgKK++7ifPYqN/VZoNYCv/Oc8xFFJAUpM6t3vzXJIZcNN16XP4ZLhloo4VZqFBa4Dqk
 dEfnW7kX2zEDydrh1ZLiGZ/B8lXMkO5piebo736e01CnJylDDEfBTPIiQnqZ7qZAF6yH7s/Qf
 dtxrKhf4Xdb06DnarHuSghXDzHGvobbnE8+FqlV6LRHH0521821xp27X+7sZm3Gs19yTvFD+X
 V+gh9MSPzc1IdE7Gq0qsb+4KxHV1rvK15i+u7AG3YvlRz5Riekq+5bnqNTcGc1tKQSVTjqyyx
 9IQjT1zVFpN0WeXl9zzaD4iqXpOhQNJ260CE9MgoaSlsW2F518wl9n2Ee50lQLbLbMLhtDRAQ
 xHIX4Lxg8EYpuohSFfRwYgud2ddRIJXViakGyo/0X1YuSVsuCd9TayNAIA8XWq3Z7Hz74y35O
 LoS2ifmKEuMVcz6/ksuyB5eYgOJgxspKcLdwdZCiWmNNqW1h70Muh/YMeTgi46XSk6D3Meu8o
 GZbA7rLGL/CoxRvRETXruUofLaYSMFDbHdTfkd+Y8wFTEDM9/FpReiZYXy58omxf7N2vZsEZV
 baoPTnqoEnMpcOPt5q//7bmkjbE5+GuBN+n3qUbOkihDEkYfOItDDWyPeZvD9nuI+LUeDtbTz
 YtxSuQEfAA0HLQdPgNCJWhFdes6+BL8xKEr4emLauAODv427SuF2HWCK88dIY+aJlH+uecFM1
 1gsG+DLgD7ogKnxMFVikpc/H9n4QghuTlTTirmdQzOCzLpw9OM60BO2k9pYHKlRBp/BkCXW8P
 PmgmGoi+4UmS4nMYKwEdvfHLm86JHAwX9Unfix8bPY8HF5DYxaul/uNs5jyff1LSZUHLgoV8w
 +JVVOsLqW1h4yGaUU5V7K06d6E7UQ3Ipu/52LrxMMVT0qWyNcHY3WtAxrScKKt0y3NIWgill1
 y/dorTaQzaW1VDUnkcSeTB8bjfpQwf0xaTOEmWYvyAkwTGTgXb3RrhHI6BqzpZ4HC0Twx9Yys
 2xloDywkFwTLIK1tplBAGxTzUoekYgjeebQTqmJvvSTLmmNvTb7/ThFL/6RssYqF4ec1DRWyl
 YXomLKu1bjyN8vRejJSmOlnM+BC8ZnrPbWnNG5LbjXzmMsixIK+B8vLw24ZZZqFizSysfqjW0
 1yiDevSFd7hr8qh7GHef/PdAeSVnOp/bIMoRBXix5f41gP8dwnDkuIL5e3IRKVdwzkw20JgBc
 CeGt9XYoS+ufbw9ur1XtEotSIHxnEtMpEOwSm4PE/23xKkaXoyOu07Wtt8PrOixCcXxYjUCzn
 PpBgN4w+64k8fiktuYp+5Ytsybtu//J4YL/KUOZb/JUa3Asi+Nfl+n9YgM5FKQFwBTiyx0AdH
 CVmaHIcaZ5iRJ6t5EEWBeeIri9EBwZL58XmKRFaPbmE8qqvfEq4tgzx9efSNIvKyg8L1pMYMm
 OKGjits7zBPbZCFo3f1qNotaq2XBA0o/ezUBq1+m3mHm0G+W/EOPMhr5uHXSh86hq3pNh9Lkc
 BhvtG7SGZr35COFIqQ7ti6uUwDku+/vA6jzFbw/rc5ODet5AzeS69r9qmQH7DqFWMs8DP90Ko
 gyQ9x46rJ/0dwOOUeRyqIAYsYpVdRHkrRATPa42BrF8nuYQOyJ6IwSEWBMec4lACa8kLh4byr
 x7Ebpsgz1QbqrEHUtPmPUjfghsjJ/tvhFVa2wrHHIxb4WzW6vqZdd+hUJRtb5JPsyyoy2wu2X
 W3DgUNPe9wGakUfbReU1Ad+0nzcpQEMut98CiK1Fg2p6XxCJ0fbgJv5MBNu+aM+cKrMEZcyDp
 pAqy+8NW0zsdefF19TVHrdHro6lvKLWgQ+4UjoJg9m1VSmxI1umgxIFYOfesmbqlIE0zps0WM
 AWf1XJZ+0l89InYxdNiAdrDMeH2IXGrZOGujV3AlOCMmIs9DqhEjzC5SMuC/Ul8zIGsRySUCm
 QhtSPVinpBoQUBQuioKJJ70JRACFBY52YasOZcdI5Yx2hVV0uypDYAHi3Bt13ASEvF366QP1R
 65PqR1oJAbVX8ZAz2EixK5aqfqraspjFr1vnQ+PeP0hGxjI38cAN3efTZ99amsTokEyWbALOj
 RijQiJAFxfqBDBsifznqC1y3FceKmkeXbaMk3pLbTi03AwDWS1diity0OjHgrfjc9QFJiZBQ3
 LHMKlSOtRMMZ8UgZz1k1CJy34EfatbevIskXfXJQ8ZgdpFABV5BB20o4NfiYA12IQDKduHLdV
 EX9fYV4LUVHwhIRe8cmFhpZDWhOzfH2HAe3MLgwY91GVfKgvwwvxu361wb+w9mIthuCEfneAo
 RbGCGU/xS5G1lg7zl8dClkFjDs1ZaCqcLVgZu7sjtI1i9z1zZJsUi5zgkfpvXPeIbPb2McaiM
 Lu3qPssXlJE1VJt7IMtGRR68xYxKhV8rOxNt7vXc88SbUmGf02nf49gTjm5m+eYobnrGvttVK
 ZuQaOlu2B1GFaykREvFHoWYmqIoBgpQidjc7fGucqlwfqR9NePxtWzLcu/WUsIceHxK7zdFFY
 yPuwMHsA+3NpOgePemS063eXBCnnQedBIj3TKzi59n6krbne8pJ4idny4b8AAa6zqqQA1lB+3
 YSstTnRTh/MRTqE4f2EtuH6U/2FaCWTRyDPKDyBvfCjEXCHW9oCwXeu38iRyGbHXyYzTQcfQz
 fiCLQbTO8R52tqDVeVyRiQ0z++pbam99nniOtBvJD7SBIQax+jHJWM75DwYY7/PMslOGUVMip
 qD4tZPTi6xpqDCysVqVdLHTbTTrQ48fzuk2k0bkcdmrNWGP49RvscepXW3x3NYzCw7YiD3yBA
 +iXyiFY4jUY5AN/i4ja6RggUWQlTubYJlDbOp+IfitKHnGtNvzUvSCDdrjdilTFmQhGLmXCpL
 Gs50cXvjX4cR9yOVEAi11JXv+fSDM65PlgfPlFywHuzazc5z4eyl69W/QNeW0ecrAXsIRQxCW
 2G/P9pX5Lf30uE7LiA8y1E5Md5Y4iiLmCa/d4UlddRl/k80OoYn8gbPV8s08HfwLxnYrnvC6X
 KthkbGJErH+zVYwHVHjf/5vhNKYRB8XYj1hsqQ3xb3PHcoHKE2JVX+TV3tCsDOfD66HI3v7ue
 fjjyZsul4s4f4+T3nonIr9fcspt7ByWu5iItUVSJ7H9HWr3BV1vAwkMQrr6hE/biSlIlOZt+C
 HCl/yrnL+zZwvZRnotCw05LgsydeRNJjNm73JFQKpGtISQ3eRtjLuSitWqcZsEFTwgeEX0O/l
 vyGEKpXou9TmcIyYpZYPbhneGz/kc8eMfF4Uo0Q0lAjp3AqZFwVU3v0jBPvnuIYeZ2rf5nS08
 6+sWynhyWp9Wr/WZIsYje2JuMwricrJXvPuaeg9VNDIF8wQzo8NeWuHvsJepjmnXrMua1cX/+
 oh22tYIxuxbdAfzpJbp62W4GhCiiN99+ijNxZol+YI2vrmMpySkf+bjHFw7Br7sY3dAnRCFF/
 GSxMNfzcDS/6XBXtV4kJTBWMWUFFYZutmTW+91dQ1mIwoinSCyBQM6JWDEv3qQQL8VVpQC3rK
 OfX96mWB5xUabB6A4nKcjzEzRQ3/8vzwrcbsPbsFck1D7E64BHe6/0ieC5EZJ2pP+Bd++UXkV
 LtFMaKDb1MQ9UZPh1xFvuDZzgjrxh+I24/cpILGCwR3QWoYpcG/FY0Swheg6FoI+QglaDanwn
 UvCJra+zKqjkktGVBLbTThKMdXeVQc56lj69dE02hI9+LXB2MosWi3aba1IQLXT1ezGXOLCEf
 n0L914ktVtAemfUUdvmjQg+cTyepw5vyJV1KqA6hcpHievqevD4IgPhl3cDHL7TKxbYMg/dK7
 +Yr+gZSadJUZcqVMPnjBzSDOB6DT5epePmXz6uYXgW9vrODg233+luRyUWKxnJzv1PK0iiw0c
 xIpgrisQK9A3wMtmRX6tEEDK0VqANWVr0cPMUyGVqaDBK58xg2gUPReFJ+7R2+4vKKe+6GEsn
 x2Wzhrk22orh0Psw3WUs44vHhCMCWjoYvYP3nnbGzxRntCx0th/gknG3lfsC9w7Ly5yeo473a
 u1j1w4FQMra6PTa6LmrUc6hMj4b11UjbbTaM7uFQ6l/rQm8YuFq7HtkOercrlsKJVWC62gvY2
 cJabjf6L8Rooxw6fmvKJg9VG8lM8n5ax1CPx5fgW0Cykev3z56hiGsmFTejXud08RGyQOPRID
 2oLhOQ8S9kE18d4ab7nFcsLa07VkceS/sXTSOyleiRVQ89K76k0eezN1sRtzTLThUBa260dTY
 n0DZXeXSPYR98Rb37Q/r9/cFdZe57rjKeWd1wpZ74dw==

>> The address of a data structure member was determined before
>> a corresponding null pointer check in the implementation of
>> the function =E2=80=9Cfaux_device_destroy=E2=80=9D.
>>
>> Thus avoid the risk for undefined behaviour by moving the assignment
>> for the variable =E2=80=9Cdev=E2=80=9D behind a condition check.
>=20
> There is no such "undefined behavior" here, sorry, please fix your tools=
.

Please take another look at related information sources.

EXP34-C: Do not dereference null pointers
https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-standa=
rd/rules/expressions-exp/exp34-c/


See also:
https://lore.kernel.org/kernel-janitors/d7a8e34b-e490-47fc-b892-886e1c799c=
4f@web.de/
https://lkml.org/lkml/2026/7/2/2241

Regards,
Markus
