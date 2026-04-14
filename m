Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E02609EE;
	Tue, 14 Apr 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776138034; cv=none; b=DtfOFehRKzFcH1as69+ykHi7ot8ZQdcoS/w+lUXaPR21qhxBcmQYi3xe9LvDsjKJxKdRG/3XOXKLW9z10QXXvZzvbzNhhq0J+rgi5e99bo8ZpUqVyFa0GVb0GBCcuJhULl7ykJOjHk0eg3p5ZvvuvDfzsYM0SRawiTMl+bS1kPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776138034; c=relaxed/simple;
	bh=j1xVFGCrB4zgdY1O3hGnpFlge6lRBxtF8+v9tgOoMXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oJO1+Lw5a7jkZo1tqehoFbTPbPU7K9Pi/2kG7c15mNfWl+R+C2ubtjjG62r8PSpFC6C63g42Y71ysAZ6vofN+edDWLA0HyWeWqdjkpdv9zOUQj7BTgx6ucYBp62kNZGiMbl6IRTAHR9tpMfWgEKOWP0A8TzqlbhB3sitdICFsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=xQr1MUo5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="xQr1MUo5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/9XWY1M7XX1bLO3S6EUxio1VuB76gbgR7SaI/2xskm8=; b=xQr1MUo5PziPD4pmwwNkwuxD4G
	uKt4vS5PsoTg2dX/ONJ9pttHetCskHqi81YMlgdktUVr+jNYDBM62qmntMf3Fgi6kAxHk0hnYv/nr
	G2ja96Y6Pem/joBODgGDOFoXIA1iPnJjZZlBd+wM6pkseOqoQpAOBLwi/HsE1nOaCdtuPTPicyynB
	P0eUmRPvVhwSmPf9UpQ1xgT/+TsT6GV17QOnU9nH3rybr15/um6awv28WM47gyH7Qn2qj/Yf009xk
	UvugRp8iu/6JsA2ln+LbsLrIxG5aCRMDNsinDXMWQLTMMeanIFAgAFyHAzhRjxwheWPkvVcAJgdiC
	003Bn7CQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUdX-0000000Gedl-1jfL;
	Tue, 14 Apr 2026 03:40:27 +0000
Message-ID: <20c77561-34db-43aa-959c-5cfa4e946967@infradead.org>
Date: Mon, 13 Apr 2026 20:40:26 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: Add kernel-doc for DEV_FLAG_COUNT enum value
To: Douglas Anderson <dianders@chromium.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, driver-core@lists.linux.dev,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
References: <20260413195910.1.I23aca74fe2d3636a47df196a80920fecb2643220@changeid>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260413195910.1.I23aca74fe2d3636a47df196a80920fecb2643220@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/13/26 7:59 PM, Douglas Anderson wrote:
> Even though nobody should use this value (except when declaring the
> "flags" bitmap), kernel-doc still gets upset that it's not documented.
> It reports:
> 
>   WARNING: ../include/linux/device.h:519
>   Enum value 'DEV_FLAG_COUNT' not described in enum 'struct_device_flags'
> 
> Add the description of DEV_FLAG_COUNT.
> 
> Fixes: a2225b6e834a ("driver core: Don't let a device probe until it's ready")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
>  include/linux/device.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 1c27505476bb..9c8fde6a3d86 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -512,6 +512,7 @@ struct device_physical_location {
>   *
>   * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished enough
>   *		initialization that probe could be called.
> + * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
>   */
>  enum struct_device_flags {
>  	DEV_FLAG_READY_TO_PROBE = 0,

-- 
~Randy
