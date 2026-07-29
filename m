Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A86476CE5
	for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 11:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325137; cv=none; b=WXsd0kvyJ+oMHQDHdo3yQoPDSO5L6WBRvfxG8nLJ9cqxc0cuybxIaDDM6UK9bV2teoSkTlLCE4L+ZpO03uRUpfP/XoVyPBkEJN/c/nKqfv2apCS5uKNfhHlzE6VJg6G9TwcVPDNNRHi2r1TEO2IFvdiFY9cXof6ypeMRhi2MzOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325137; c=relaxed/simple;
	bh=+bl7W/DghJ2lNo8ihHQByUSlt3smL+/7HO/f5BD68Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu3QIEHzYAVVX02H5EgrfC3aQBe380rBWg54JQ2Yd+8AI7HQIRkBwxpyI7ds4EoLfbXP+GSPrLIXibm7PApDgXmA1Rz+y4UQr+64cEpvuyHO9dNSSseE4gcyyePBiAX3o8hRBTHvenPBR5Fd3io1+dH/HCMvpI9ZDRZvN2OrjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl8nOEUk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl8nOEUk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de008b020so532385f8f.1
        for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785325133; x=1785929933; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=Hl8nOEUkd25VFh0f2IJNR29l4ZfX301FkAABlRvfNcYxlrgbd6oU4SG5kBszmGp+YN
         n1LMPC+BZ9kraIzzzRYp/Hebb374i8qDCww/OzdNqQRwBYwg4gqwOooTW0uc1u2JpDAu
         wOqvMN1kyBlqWbb6DNuiEuMz80tz/CPmICK3jYKHfeReKuRSlo+o63BBTd4x62FqSqMn
         5rUCIyTwD1ySFjI0rbnkD/McsUTshpRdqrPOHvDhDdDJ2fCnWIPZSCwjwM3IBWH3s2Tw
         cHWGirfviprW+HbiyJnDRU1mwSc8HUpuJu9ViHRR9OFnKcQ0Iy4UX28iJJaKDldYdhvZ
         3w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325133; x=1785929933;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iX3sEVovVYi3DpvUrl6PGylYfhOnizJPhWXlTW0MXY=;
        b=ead9KnTAKV7lpKrsqp2S1WCwHRzkir3g39RendpyMXpSxUrqotnZeTCVzIOVzx47ek
         9ssvwCoQ+PObFhvZsrv7mRykfbPjOGCE86OXceCmzZqKKcj4oyRF2uaGGGqTMcL5+MNz
         qWY/Ej2xaSUuSe9I2gKmY5xWNTdnjSXVhEq/QWko1v9meUd4WqrEubHBCQs/+uSWbGik
         ZmFRsalTf7jSKkgYT6w+zwyOXMof5VoMwFtSbbjhm5QE2z+7IDeXwa1UWeKTnvdwgRWB
         ukk+G4tXbVqJSdDDCbxn6+V0ElxoFio3eFNz5dYr7O4+lQG/NTxwzG6ARfBhgh9Gg1Dg
         z+fA==
X-Gm-Message-State: AOJu0YwkQmuOOxNuwW+U1l5zAycuiQi3kp6aph5OJA92AH2azER/Q0vq
	eWQE05zGEn8S6lv9Dab85xDd0VuLlBh477a1mYmSz+uYKFru9R1XIDL1uhkE9ZEh0Hs=
X-Gm-Gg: AR+sD108egpWJ8vy7YiNGpkWkIabgzoY11dwGCA7qI7dErcXSF0b5zxUfC9b+3+kLk9
	HWXdnbvm0klaMp2BztCMvLKsRPNrFRL6kz4f/L5JWw+gNxgX6LBqf0S5CaLltCnBNkwcBMIIGPa
	sAEOVEOZ3ML5DUgDQLuO5hcfHAy8pah1mWN8+mt0ck39C0gzymKEk9qKO507dP5LvqkOwu717Kb
	JFOdmp0BqsyQCpUjQYyrMKQn4kkMOrmBLgT6UG/Ap47SCizkykFD9113l3RVZ+Rk1Z6R+SSCYGu
	lVGywYpwthEMcBL3qzmC02cfpGpatiWY8P4NdjYUqjgK88eaEtrrf0eh3gpwF+fzftJMwd70/s7
	6cPfVA+QiXygy7nlWp+KwHzD4IKs4lh+fQZmsZT9KPC1rgePF+Iz0RkG6UVxWLOnD8AGzqBHtZA
	MBTrrPZIkKmruAkt3Ijk6SkEme5cbpBlWu7fMdyRMZUocjOco+sFCfKJeVjIHXyKGF5yIaFew=
X-Received: by 2002:a05:6000:2c05:b0:47f:9763:9864 with SMTP id ffacd0b85a97d-47fbabee850mr2432854f8f.19.1785325133163;
        Wed, 29 Jul 2026 04:38:53 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b0f039sm7702125f8f.18.2026.07.29.04.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:38:52 -0700 (PDT)
Message-ID: <f77aab11-0e1b-4962-9d53-0bb2fcd6486a@linaro.org>
Date: Wed, 29 Jul 2026 12:38:50 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] media: qcom: camss: use
 fwnode_graph_for_each_endpoint_scoped() to simplify code
To: Frank.Li@oss.nxp.com, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 Guoniu Zhou <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20260625-fw_scoped-v3-0-ffd0868e498d@nxp.com>
 <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260625-fw_scoped-v3-4-ffd0868e498d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2026 15:17, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Use fwnode_graph_for_each_endpoint_scoped() to simplify code.
> 
> No functional changes.
> 
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - fix typo simplify
> - collect andy, gouniou and loic's review tags
> ---
>   drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct device *dev,
>   static int camss_parse_ports(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> -	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
>   	int ret;
>   
> -	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +	fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>   		struct camss_async_subdev *csd;
>   
>   		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
>   						      typeof(*csd));
> -		if (IS_ERR(csd)) {
> -			ret = PTR_ERR(csd);
> -			goto err_cleanup;
> -		}
> +		if (IS_ERR(csd))
> +			return PTR_ERR(csd);
>   
>   		ret = camss_parse_endpoint_node(dev, ep, csd);
>   		if (ret < 0)
> -			goto err_cleanup;
> +			return ret;
>   	}
>   
>   	return 0;
> -
> -err_cleanup:
> -	fwnode_handle_put(ep);
> -
> -	return ret;
>   }
>   
>   /*
> 
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
