Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447312;
	b=ifgCykKq9hFi+uDVGKKXSEZMu3norHd2jo1eY+Ov7ZkV7whwssbOe2uShQC5+D4c6ptW
	 rVLVDNq7oyNbHTy/yHL1bmeKf+hKhIsjcXmnW9AZ960jmwUoqV/S0jvk0+AMW8Q40PAdH
	 vm5u0GafLlJg03f5KILvsQFOAmn/jTVQaLMK78i7vHDG/eG1YFjuPpFFi2TJMoa1zyNWR
	 m5adfPaWybpnpAeNeWnNby09kKlt/nZojysJOWNvf23EJz1oR+lztTUcW0GpvbiJYtu9B
	 aDgPnf32BgAwiq58llJIOoQNAsqRB1O/Noaq0leqObNvZ+1MtJjdIh0rM1pkCkkP/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447312;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=oEWcDzUkBN/dT8CmFHFEEK1XsOoB62A8zz65Y+tVTBg=;
	b=S4gISCKRqlmGriqdGrsSVO5aCGUzEA7X9bcfyrJhio2TwR3/sJa6SuQZRvQ+RlxHB8q9
	 +rZbPn9hDTOgUMzPKYmVZfOSaF0BiAhcEmWGsNSPmOU16GESRkRqM0VSmRQCBKMj72RfB
	 CaFXKK/6a9GsY19k38X++vQ8EP5AXeW8WjF4gW/8ch8R4JZNIYNRUUy0HwOH+xMkelVvM
	 q8OGj5jLGH8J3/OxB0ihxxlOt5qP9xDaXszxoJX2tqpPiewofm2eQT5R48hTLWXC9nZbt
	 9Ug9znHDGJS7vKebOBt/q+/fYV1GcOA4LNeTMYVcqUHA/YzMfHsG6OAB5+2naGEfbEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=px31Q6XF;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59E606A31C;
	Mon, 19 Oct 2026 22:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D59E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=px31Q6XF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oEWcDzUkBN/dT8CmFHFEEK1XsOoB62A8zz65Y+tVTBg=; b=px31Q6XFHmlGM/i503reHhHHuT
	pGYjVwxfAn5p4i086Sl8u8u5hibm2WgRwvGmCLA2ylk39WNaJ/QGNhb75/1cNpfJqxZGXxJtNzVFW
	163P6tVAnsBEC+CxCZrj8rVMMbGG8nwIwPsaFhgDsNOjv4tlJPIuZuyRIGm0KL4TxukbfButDx6oX
	4JvLk6tDtJVXn/qj33/ukN93zvRcvkWZ9xc/2ySrUbpQ6F95XRXbLHKZMCCtNd4oKSZ68GocYBURY
	aFqCCoqvj9uAjXNaXPIld+dLDKewGyu/ZH8PblijW03jy139NaANTOKVEaVUtZUH3ls/GcwjcFcD3
	jPiOj7HQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIvQV-00000008RX2-1HDo;
	Mon, 19 Oct 2026 22:01:51 +0000
Message-ID: <7ae2c0f8-4c8e-4cf0-ba51-92b48835838d@infradead.org>
Date: Mon, 19 Oct 2026 15:01:43 -0700
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
Subject: Re: [PATCH] debugfs: clarify return values when disabled
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20261008171547.3084466-1-rdunlap@infradead.org>
 <DM37WR9GUVEO.1ZJWESPXVQ8X5@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DM37WR9GUVEO.1ZJWESPXVQ8X5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/12/26 3:37 PM, Danilo Krummrich wrote:
> On Thu Oct 8, 2026 at 7:15 PM CEST, Randy Dunlap wrote:
>> @@ -820,6 +826,10 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_rem
>>   *
>>   * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>>   * returned.
>> + * If debugfs is not enabled in the kernel build, the value %-ENODEV
>> + * will be returned. If debugfs is enabled in the kernel build but is disabled
>> + * by using "debugfs=off" on the kernel command line, the value %-EPERM
>> + * will be returned.
> 
> This keeps the old *and* the new text.

Thanks for catching that one.

> Besides that, when debugfs is disabled via kernel command line
> debugfs_change_name() checks
> 
> 	if (IS_ERR_OR_NULL(dentry))
> 		return 0;
> 
> and if disabled via kernel command line dentry would have been an ERR_PTR and
> hence it would just return 0.
> 
> (There may be more functions of this sort, I didn't check all of them.)

Yes, I'll check all of the exported functions for similar handling.

-- 
~Randy

