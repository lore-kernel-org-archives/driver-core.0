Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104820;
	b=j3vr2kh55kjohrccBA5xEWf8w+ajLZHZD8N0dIWtro33hZXqQOKCN3LQuWkGUeP34FLA
	 ku8WqAtR3yzQ2Rtn6TowR9GauEJqFvj5j0F1JCfV5djNcwTA5k5DxB49VrNEkXTMp6dUV
	 HawmHoJCZIhw/diPTaizOsfwOh3rMINybB5N2yCJGffzQFXiSRNpJbd4jUaxsPrKzAOyF
	 H5HkJc99EUnYdBQhwoCArPfAC5yR1yfEISLSbTQ4eXujzaLGi4n2dUwloiuU5W51kHnFk
	 gu9gDjrGRvSvSsX8rSlSPzyzQ2DPFiAHVonVsAxWbLIpHFYJ4qNfNi9OUjF2bZE29Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104820;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=XBLr7PFrQoAcpf5JWvM/iGuYbX4pMdxP25dDwW6E+mc=;
	b=IE25LQZ78Zl117PSVH1h+TlnAtBiRQxLdM6llSCP1QubcCDPUzkAkFCaloe+DrljLSwF
	 32O+F5JQSTn7ueYVx5bWf6DWk+ggtRzO7t3fqYDS6VvJMhr2R5gwUD5q8F8cRdRJpZnFg
	 MD2oKYEG5WzgVjigLKIQN4XPtkus6JbjLp0cXYCpplBTv7Z0h0eGIYY9J+ZmV+wEFsk/5
	 NqbmfY3jzF7uwy2pwbIesprK45mVLeyeCGOLqF5e10m/U+Laff/O59CCXJhLICXkvuMb/
	 tX9oJKMQL8OfcFmxUmPvJIaLmtpFg6G/j3O4CuFwN9x6lzW2UH4TJwjDBaxY+xcCuag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oldschoolsolutions.biz;
	spf=pass smtp.mailfrom=oldschoolsolutions.biz;
	dkim=pass header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.a=rsa-sha256 header.s=s1-ionos header.b=Hfo3XJgP;
	arc=none smtp.remote-ip=217.72.192.73
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA4606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 16:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08CA4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.a=rsa-sha256 header.s=s1-ionos header.b=Hfo3XJgP
DKIM2-Signature:  i=1; m=1; t=1795104811;
 mf=PGplbnMuZ2xhdGhlQG9sZHNjaG9vbHNvbHV0aW9ucy5iaXo+;
 rt=PGRyaXZlci1jb3JlQGxpc3RzLmxpbnV4LmRldj4=;
 d=oldschoolsolutions.biz;
 s=s1-ionos:rsa-sha256:VNu53lTVB13MXzeb7om1qsT11VFB
   KK8G/xcEQJRzHxfTfQjSgt69kYNQau9/HYIv7Fc7WyrTmfwxuH3jZ4pniENN2Y7p8XhZROwAoZr
   wj27nTVJOZ7P6u7qLWyrcW5pThda5WrPtFs3+udnUctWTokx2BUY58MWFAJHv/K1Ie1ARAYmf84
   0HgHZNOW9s/3f7qjVFm0tmAa24U6JiRr70IEMgYnRkw+pbZC1LqwqhfqgbbxALdp2qU6zRYcZNq
   QPAgDUygObXdCAKxNfyG3QE6CjRvLICPNTQt2E1Dug/TB8/WuL7/0jcEAMqWjzsX/b1TBwiX+ah
   tB/4wheKxhjs1A==;
Message-Instance:  m=1;
 h=sha256:
   b3iW+BaNy3/F3DRlny5xqr+y25MeL2G7t8zCFbSHu9Q=:
   XBLr7PFrQoAcpf5JWvM/iGuYbX4pMdxP25dDwW6E+mc=,
  sha512:
   g169vRbKiJVCOcOgcO7QZ8f4gJJYCdQUX9h9vkQXITbeo3hXhn2MJY32jJivDrs5lKFdGEKDEHMIVmONxhRnNg==:
   MKQDFeam1T146EBg9FNM/Jyw7MM+8Qlqd7GhC9ZqVXb+JT8UTJTIl1q9MYINNOv5LbPIQH4oGo/YUsLNX/Bn3A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1795104793; x=1795709593;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=XBLr7PFrQoAcpf5JWvM/iGuYbX4pMdxP25dDwW6E+mc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Hfo3XJgPG97W+K4h33szhXwwg1QIH/5KtPDSIs93e1lojfbcHOkSbSTKUrFmxVOo
	 RmvYDhM+hIUd3Xqa6HhMWos42pzXi9YtCmgBKXXz3U0RKQdX+iKFuDPiUNxHD5sh1
	 VNJ1foZv2Knc8LkWt4JriLhs468WQqI4iB7UUEv5P3QBd3BOy4yZD3lG83+/VUPvj
	 McAtibajJOr0IA/CiHSv6D/7J2ZbNYYLC6qXoZqcOZCgOGijbaryErMvjV2rvaCZD
	 QwPL9FnPlqEOF1GuyMT/muaavfMXdmjvrQP6QkYfs6vUljSFeaOc3/+6jzCcHm7Ro
	 duW9/7ZJ1hQLlJ4Ngw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mzhf5-1wYpVA1njl-00ySK6; Thu, 19
 Nov 2026 17:13:13 +0100
Message-ID: <5d6e2669-bec7-47f5-9533-31715cb48063@oldschoolsolutions.biz>
Date: Thu, 19 Nov 2026 17:13:12 +0100
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
Subject: Re: [PATCH] driver core: platform: Check for NULL name in
 platform_get_resource_byname
To: Greg KH <gregkh@linuxfoundation.org>, linux@treblig.org
Cc: dave@treblig.org, rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
 driver-core@lists.linux.dev
References: <20261119001820.168018-1-linux@treblig.org>
 <2026111930-swagger-emit-3a58@gregkh>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <2026111930-swagger-emit-3a58@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JS3InuT4CE4fY0UtmCQ+OT4qhzliI+7HLT5fbOHBFBGCzKhRuhX
 aECXOmiT5jxMTf7e2hxi0OBxnMmIMoqBwMjFvVUAbZU/boaMFX2VhU2RaR3Y9YeKKSuNRWV
 VZt2LCwf7EaR8parV6t864gO5S6eLpAG1xaejTJjGKhwqZuOQy2RNQyWo6vKCMQhq0xB+WU
 Y+bKU+qAuqBN63z66XbYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Df1UAVXLmrU=;tDMjrdyNeD319M4LVw3df6Ikotf
 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
 gb2inSTrUs7tp89lSwRg==

On Thu, Nov 19, 2026 at 01:37:51PM +0000, Dr. David Alan Gilbert wrote:
 > If your worry is that it'll just leave people shipping even more broken
 > DTs then perhaps a WARN would help.

+1 for this from the aarch64 laptop corner.

Sure, fix the DT. But most of the X1E laptop DTs get written from
DSDT dumps and guesswork, and broken nodes are just part of bring-up.
No serial on these things, so an oops in some probe at boot = black
screen and digging in pstore. For a webcam.

WARN_ON_ONCE + return NULL would be loud enough to get the DT fixed
and not kill the box.

with best regards

Jens
