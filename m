Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87254199FAC;
	Tue, 16 Jun 2026 04:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781582517; cv=none; b=D3Ui55E0wcIt/3tKugQtdym2o/DsCD5sSeWjwzHRhItGNM6bdC03ZgjuCKJTc8Lz6lUEZPTf88XlpeE7vPlILF6KYGSlZyPiuIr1APbh2m46vGvkKsERtzlCHviOrLZJw1uUDVzCXzlGbWGbgnELknGIPsy/4YAa95wMSpg12+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781582517; c=relaxed/simple;
	bh=wmUsjk6pyP9Tl0MiDhLIxUgnzl/9Xoq5CJfQxnJ4OR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhWcwXAGeDaGiROqe1NpYul9cjMBCYUFdorUJnYbZoPINeistM5RW18sXgtxVeraoz7v+IqyYiefcZnjL6ebtMR5VJmjTo+KJm2gMnOzYVHImJlioSIsqtKflP7KWs33kbX4VG5bG0hNtlVAjfL8ZSeHZXuVb4XL4imjB/Zy36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgsDYF3S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgsDYF3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB681F000E9;
	Tue, 16 Jun 2026 04:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781582516;
	bh=ZJfpUqSrQXaYNcIGQfl1oETFjM3wowS2khH2aNNjQIs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CgsDYF3SpcNIe62DrHbrp7PxNqH0K8xRo04Yu3HAvvlynNb7E7TwuXFVwstlfP48c
	 iyGRW5rW/7FgOCMZV6HlSrQBz+8dmmMWhnPVjzCKTitEDu/ZyTRgcuEIwnAtbNBNzK
	 55+YBh1sub8zZ8+afevvVDHMv3iNlqx6YHWcnkpflb1Y6TrFbTPpkWUUhzeX2fKwNP
	 BjO0VSkwowDqKrctH/tJCV2R+03iDrgT7dQU9vhKa+oXf3G2aORwXu0uUSkVlcHtRr
	 BwEuDicNp1cNZj8IblW3Gx7p+2b7p+AUli4LvE6AUdiM3E8H9HZZ+mIB7x/1HLH/T+
	 jSc9rqmtVsRvw==
Message-ID: <00d51781-0172-4334-986c-0701ae4c58d8@kernel.org>
Date: Tue, 16 Jun 2026 06:01:51 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] of: property: Fix of_fwnode_get_reference_args() with
 negative index
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
References: <20260611102806.2643869-1-alban.bedel@lht.dlh.de>
 <20260615-obedient-axolotl-of-argument-fb55ef@quoll>
 <20260615113330.11406fbd@OMT-CWNXR4TFW5-LHT>
 <f21486ea-db76-4b71-9b68-86c861b0be53@kernel.org>
 <20260615134747.3cdb9599@OMT-CWNXR4TFW5-LHT>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260615134747.3cdb9599@OMT-CWNXR4TFW5-LHT>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/06/2026 13:47, Alban Bedel wrote:
> On Mon, 15 Jun 2026 11:54:01 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> Indices larger than INT_MAX are valid in the fwnode API, so returning
>>> -EINVAL is not appropriate here.
>>>   
>>
>> Then neither ENOENT are.
>>
>> But really, EINVAL is correct here. This is OF implementation, so this
>> implementation decides what is EINVAL and what is right. Not fwnode API.
> 
> I think there is a missunderstanding here. The function we are talking
> about, of_fwnode_get_reference_args(), is the OF backed implementation
> of fwnode_property_get_reference_args(). As such it must follow the API
> documented by fwnode_property_get_reference_args() which list the
> following return values:
> 
>  * Return: %0 on success
>  *	    %-ENOENT when the index is out of bounds, the index has an empty
>  *		     reference or the property was not found
>  *	    %-EINVAL on parse error
>  *	    %-ENOTCONN when the remote firmware node exists but has not been
>  *		       registered yet
> 
> It is not explicitly documented what should be returned if the index is
> not representable in the backend, but considering it out of bound seems
> to be the most sensible thing to do.
> 

I agree, I did not consider the docs for
fwnode_property_get_reference_args().

Please send v2 fixing the comment style and with:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Best regards,
Krzysztof
