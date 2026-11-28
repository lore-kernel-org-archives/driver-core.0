Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795856705;
	b=G/RzJF0rz9bD1Qt4kJfQYr7isiv4wJu6JZX0Z3J6BlACrDZSuLXrQdbC0iORp0FwRi7T
	 aNbZENVINkPyieXnI8onsekfcyfK4Sc3nDQgFEoA5QU7IJNZSkMFuLo18sZZhZYjaDbZp
	 xeV1ouw3olaEUC8rl9tsCLC/ugVbbRM97DJGJvWnT/fErmrn+IZZv2zyqhPw/+o8GvHdO
	 YVDYO+V0qAfdEPLtMm2we+8a+MjEeGqzBm5UKWzdTjsKO7Vo6+54/kNGlf1Bj+v8a+KjG
	 S0IDSqmE3wwUUAtINToiUXhyHJ6uYDzkdlqtaTlDKVhF9sTA+zu333kM53ZnNikjfPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795856705;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fR8+AZzMPmjRQhe1cjtha4XcPJsaasrVYp7w8W00FRU=;
	b=TyCnZL5/GmHaLzmZUoOQkP2SlIBg9Xig6EZuzdwHRPs5cXUwGL+rkYrQtHejrLdW/feI
	 3dY7BmJPTfCouVgfUgrhB1Zc2JxMYcVzTI1y7kjKNJr4X9SNBsyknbRpmfoWVTp1Hv9tg
	 WkNDMWt5MbYYwnVmVZhlSvGhoJxoFci42ak9zpa0TMGODhmgfUvy6qJ+g7PXSkIAMDfqs
	 Aoql3/FRlcZYyWZ/W3Mpp58GBvDyjGxWlpNl4RaNm/vhWqoaMCvYe2DJn0eNblXoCHkU+
	 Unn8gJfloYVFdIWbCQa6ws64wBKkqrrd2p286KPuj+NPd/fbmGs9j1iga4K8xBSA/xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redaril.me;
	spf=pass smtp.mailfrom=redaril.me;
	dkim=pass header.d=redaril.me header.i=@redaril.me header.a=rsa-sha256 header.s=zmail header.b=F+rlBotm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.10
Received: from sender-op-o10.zoho.eu (sender-op-o10.zoho.eu [136.143.169.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C4D606A323
	for <driver-core@lists.linux.dev>; Sat, 28 Nov 2026 09:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03C4D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redaril.me header.i=@redaril.me header.a=rsa-sha256 header.s=zmail header.b=F+rlBotm
ARC-Seal: i=1; a=rsa-sha256; t=1795856692; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=BmvcYnpeszoCL0aV0up+uO2/IQJK/dik7UJsorD/sO+qAuWdGrWEQv5gBraLHzqJzZHIewKqI132vg8kNtRHv1YUFeZTE5x+1vPJhtrvlIip1WDGXdXdsk2WAqOuxCxNICpr8g6pfaFgmZlGt9Jc3Phm5Ehkuu7yjjkxSFxDKqc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795856692; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fR8+AZzMPmjRQhe1cjtha4XcPJsaasrVYp7w8W00FRU=; 
	b=RPX8LdONHctMB4NMm0AEyqOosUs7GFzDfOeieRNdSD6acmA+qXhBa/E5yd+1MMQ6kS4Z1HT7hUCXg4H95RpO55ODhFnKQrH9mOiInYEqsTz3lWi8cJa6ZFcowZgtkzs5Co0o/PHN2nhl0Z52Cj9tWE0zdboyDh8kUkunnBxJh8E=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: a=rsa-sha256; b=F+rlBotmIlf7etpnZWsD/sWPQmU4l9X4oUcTs4SgmfqiMrXG13YwkZAnEPjrp+P9XP0OLgzi75RblBhzkTlCk3JFRw/g4AC/bftLlZUmknMXdbGx3ipBKo1cj/P2NeSy8TUmSTqsYqFGznxEJQ2bJBst/NaEGyv3JWjz+Rg+Yr4=; c=relaxed/relaxed; s=zmail; d=redaril.me; v=1; bh=fR8+AZzMPmjRQhe1cjtha4XcPJsaasrVYp7w8W00FRU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795856689546186.7563515837245;
	Sat, 28 Nov 2026 10:04:49 +0100 (CET)
Message-ID: <a08267fa-5a8d-4945-85f9-a9476a476b04@redaril.me>
Date: Sat, 28 Nov 2026 10:04:48 +0100
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
Subject: Re: [PATCH v2 1/2] drivers: core: platform: Add
 platform_get_match_data() helper
To: Jonathan Cameron <jic23@kernel.org>,
 Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org>
Cc: development@redaril.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Peter Rosin <peda@lysator.liu.se>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20261128-iio_rescale_platform_ids-v2-0-4c35f16c4f77@redaril.me>
 <20261128-iio_rescale_platform_ids-v2-1-4c35f16c4f77@redaril.me>
 <20261128002732.7c47a16d@jic23-hlaptop>
Content-Language: en-US
From: Fabio Forni <development@redaril.me>
In-Reply-To: <20261128002732.7c47a16d@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jonathan,

On 28/11/26 01:27, Jonathan Cameron wrote:
> On Sat, 28 Nov 2026 00:22:09 +0100
> Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org> wrote:
> 
>> From: Fabio Forni <development@redaril.me>
>>
>> device_get_match_data() retrieves driver data through the device's
>> fwnode. However, software nodes don't implement
>> fwnode->device_get_match_data(), so for a platform device that is
>> dynamically instantiated, device_get_match_data() is of no use.
>> platform_get_device_id() can be used instead, but this doesn't make the
>> driver code abstract enough.
>>
>> Add the platform_get_match_data() helper, so that driver data can be
>> retrieved from platform_device's fwnode *or* device_id as a fallback.
> I'd have added a reference to similar cases like i2c_get_match_data()
> or spi_get_device_match_data()

Good idea, I'll do that in v3. I'll wait a few days to let others add comments.

> and perhaps have followed the naming in there for the return variable.
> Both call it match.

Alright. I think you want me to return NULL instead of -ENODATA as well?
The other helpers do so.
