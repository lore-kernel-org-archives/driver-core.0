Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795857701;
	b=svILhPAycexgAvAeKr3RPLPitA7p0JS4L9aTW2qIS72Qnnnug7jtGaFO0nh+aSPu2Y80
	 OC+nNH7dX7nOrwfTxH0PoKwm9HNk5N4nAu5eo/9uOWp+mWYf63lC166CRzXGAiHmmna+d
	 0tWgqS3CI3N8fDwr2Wzvj3ZFwJxBrQzodD6JolId5dQy2fivHn3qyikLru7313mnFgSxe
	 sokS9y2iGwW8giHlRNUQmMVzzI2RohPl12rJmAHmXURBfueln7dZO5CIcZRMGhNSwHISJ
	 P9rbohjSjKIxJmmKtBeUEkvl/d/2YyFJOWT/phfpeh+FcPldP71IdRd0DkJnmzUCv7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857701;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wlckpMJ074/wY0TNt41XHzSk8RPHuKfXuoWeAZ7xaY0=;
	b=oQVi7qYPrTruskV/grdmWP2ZWP3McPHtPxOaYjz8qYWM2ElB31y2JZxnb6qfpyI/EjlB
	 iLgiIRNE1x+ac37EsSOC6OwuQCSehFSJ6b0BTcQfUsxjiiglUp0CPLtlm7tmA7gVc91Ot
	 O8yueWSh9sV+Z2C8gPqA/HibmmeEUO524aJfpmYHs5SO9b6uBGHIqfls91U9rgSmj5K0F
	 rI6hRqAd9+K3vEhCXX7yeUEiq1Tayr0Rm1yomPzZRmjU59tZXDMgnSXnwZQyHMIgmgmKt
	 CRVHAuf0h0LbwJ18i81VIGzlZX/+DDDuiBUlGsxwdmdYnwKHJP63PHLF3hr/rRRSSFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redaril.me;
	spf=pass smtp.mailfrom=redaril.me;
	dkim=pass header.d=redaril.me header.i=@redaril.me header.a=rsa-sha256 header.s=zmail header.b=gZvnawq0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.18
Received: from sender-op-o18.zoho.eu (sender-op-o18.zoho.eu [136.143.169.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E6606A31C
	for <driver-core@lists.linux.dev>; Sat, 28 Nov 2026 09:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 028E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redaril.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redaril.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redaril.me header.i=@redaril.me header.a=rsa-sha256 header.s=zmail header.b=gZvnawq0
ARC-Seal: i=1; a=rsa-sha256; t=1795857688; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=TrHrhQJMjSLKmgtcrGYeI8/hpod9FxQkl++KebPmUenmpVKOGxKhi5xfrGvuYEP2tlOXZu1131syz2sUOpknAnUUyUApx1cQMOmzBSlvpHvL+Mj8UBAFoswMprm69HFTM8QbnmO9tqrWzs+kQNXd1ROjJZeoPb7frXe9i2QxvKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1795857688; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wlckpMJ074/wY0TNt41XHzSk8RPHuKfXuoWeAZ7xaY0=; 
	b=fh86+1oTVSIirsHzrNQK+4U8mBUOtU6TZdeNG4xl3mtZp4tnBqFTGz0U+O8bWnUzf7eQ22DniQVzXIwXWfpg/d01git94hKsgAlR/fjj/GtMYjdwVp++Ahj+lABzfQhqdmDZi3eto49XZIDNq7ydq159PnudrPBKJbLz20bC4+c=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=redaril.me;
	spf=pass  smtp.mailfrom=development@redaril.me;
	dmarc=pass header.from=<development@redaril.me>
DKIM-Signature: a=rsa-sha256; b=gZvnawq0Y8vfoCXRTSIQE9oKTGrgXth7zsKTkAXyNn9pIag8EP32d9sHrlbL+TJzoi+FCLy/bzpMz1UhJby8voQqaGgHZS2gTql5YfHzIcldQDiHb/SQSF8x9a5w+STenJQOayRn5rj2qB8Z2uxppvwE3IEVj37DnK0jOg4Zuas=; c=relaxed/relaxed; s=zmail; d=redaril.me; v=1; bh=wlckpMJ074/wY0TNt41XHzSk8RPHuKfXuoWeAZ7xaY0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1795857686218484.3481136278716;
	Sat, 28 Nov 2026 10:21:26 +0100 (CET)
Message-ID: <bad51b29-1bf5-4603-ab63-bdcacc7ffd06@redaril.me>
Date: Sat, 28 Nov 2026 10:21:25 +0100
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
Subject: Re: [PATCH v2 2/2] iio: afe: iio-rescale: Add platform IDs
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
 <20261128-iio_rescale_platform_ids-v2-2-4c35f16c4f77@redaril.me>
 <20261128003010.6b36fa7b@jic23-hlaptop>
Content-Language: en-US
From: Fabio Forni <development@redaril.me>
In-Reply-To: <20261128003010.6b36fa7b@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/26 01:30, Jonathan Cameron wrote:
> On Sat, 28 Nov 2026 00:22:10 +0100
> Fabio Forni via B4 Relay <devnull+development.redaril.me@kernel.org> wrote:
> 
>> From: Fabio Forni <development@redaril.me>
>>
>> When a rescaler is dynamically instantiated and configured with swnode,
>> device_get_match_data() will always set rescale->cfg to NULL, because
>> device_get_match_data() is unimplemented for software nodes.
>>
>> Define a platform_device_id table (a replica of the of_device_id table)
>> and call the platform_get_match_data() helper, to deal with both
>> swnode-based and non-swnode-based instantiation methods.
>>
>> Signed-off-by: Fabio Forni <development@redaril.me>
>> ---
>>   drivers/iio/afe/iio-rescale.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
>> index c01292a15a29..c268dbaaaea6 100644
>> --- a/drivers/iio/afe/iio-rescale.c
>> +++ b/drivers/iio/afe/iio-rescale.c
>> @@ -518,6 +518,21 @@ static const struct of_device_id rescale_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, rescale_match);
>>   
>> +static const struct platform_device_id rescale_platform_ids[] = {
>> +	{ .name = "current-sense-amplifier",
>> +	  .driver_data = (kernel_ulong_t)&rescale_cfg[CURRENT_SENSE_AMPLIFIER] },
> 	{
> 		.name = ...
> 		.driver_data = ...
> 	}, {
> 		.name = ...
> Or
> 	},
> 	{
> 
> I don't mind on that bit, but use a few more lines to make it easier
> to add additional fields in future and generally make it easier to read.

Will do, but to be honest I always have a hard time syncing with
maintainers' own style. Why isn't clang-format style simply agreed upon and enforced?
Automatic formatting would reduce cognitive effort, and chances to argue :)
I think Go and the Black formatter for Python did the right job on that matter: one
style, no questions.

>> +	{ .name = "current-sense-shunt",
>> +	  .driver_data = (kernel_ulong_t)&rescale_cfg[CURRENT_SENSE_SHUNT] },
>> +	{ .name = "voltage-divider",
>> +	  .driver_data = (kernel_ulong_t)&rescale_cfg[VOLTAGE_DIVIDER] },
>> +	{ .name = "temperature-sense-rtd",
>> +	  .driver_data = (kernel_ulong_t)&rescale_cfg[TEMP_SENSE_RTD] },
>> +	{ .name = "temperature-transducer",
>> +	  .driver_data = (kernel_ulong_t)&rescale_cfg[TEMP_TRANSDUCER] },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(platform, rescale_platform_ids);
>> +
>>   static int rescale_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -548,7 +563,7 @@ static int rescale_probe(struct platform_device *pdev)
>>   
>>   	rescale = iio_priv(indio_dev);
>>   
>> -	rescale->cfg = device_get_match_data(dev);
>> +	rescale->cfg = platform_get_match_data(pdev);
> 
> Can we get a failure here?  Forcing a driver bind to a device not in the tables
> tends to end up with NULL and it is common to just fail probe if that happens.

No problem.

