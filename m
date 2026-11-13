Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583207;
	b=IOA/3gUgax9fxueb4V/VzRT7BjrxUWgLPhm6hRJA3C0AaAIZF9vYRrDRZu3VyJjNRr/5
	 koFfw44f9eeTQJUy9pkCtiUmPiFBU5RI5qZ/04YPMfOEEz3S9g0cHydUSPDnq/em2ic53
	 UqDs8UpW9SO95UVD9RgFiSdzYnI6UvmX9H2tFfETmLMpgOa/t8cZyL87PPCv2Lku4NHor
	 oo3tgAA1dpeFtIeQJvUOtvJDxnI7J7ngY0EM9We2i+ACv5REX5VT6rCBB8Mhtlqd/XFOy
	 kXQHMr0l3ig2KaaYe1mZeqcmc1ZNow+Y+l9EBNCdinlq0BswpPYP8YKbY8xq/rdQOMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6dIw/cEasDaTMuxY4JqRIaZBNhw3B2/VuC8Ktx1d1fI=;
	b=YvzsJ833EH11O3QbWkYDWa8U6GaSbvNJ/2ZKfR+Fdft3HfM7dp+PZa4Gh4bBbArbTkTH
	 MdU7E7/OokI/+j5n89si2XnmMzV9GHTaGLDF+540I3LrphIpXWYjjRbIzwhm2yd5mwqht
	 HNgm557udFG95Hd9Kdyp8dbpszBaipW3JKyUOmZmnhd1+YkIy97pYMXua+i40SYcB24++
	 YZhCjoVm/hOxK8VhEuWzz4Jeqg9+ojGJ9oqh8XQvVSe/haL0IiDwaIIZTOSPfGrwffZRV
	 tzA34we2Fi2lraHCdTBIoyhE7lm9hHUTmsqRSmWtSS1wLW1C4+MD7cjZhOJVE7Hsajg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujfLgrkP;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA6606A337
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FFA6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ujfLgrkP
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso15885165e9.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794583205; x=1795188005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dIw/cEasDaTMuxY4JqRIaZBNhw3B2/VuC8Ktx1d1fI=;
        b=ujfLgrkPzvdWlAby/AJuJRf8xfM81Xum9JpAD+hD+Hkc3LVhpwt1XeF8Kxo6fsnm1m
         jeLuagCRjKZa3LhnUb9JbB18wvuplxcciyU3zzwq1OpBMs6ant4CHPJfXzGX7hqiL/MG
         +x+fTXcrnYW08TKVigzfShDfUauFPpbC2oupC4MO3vuthx1fT8otgUfQpVOfRSHopfdY
         84I84InWxePkAraPbtgSzaX1Nw7BBuG93x4U8Ji8SCn37gj3bHjpBNQi9mzxs+AogAsE
         qs5LL+Uee0BBFfizJfJFLGRT3Uu3WGK/+9luxqimOgK7pQqN4OSzPIPjxIghBqKbxcdJ
         bnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583205; x=1795188005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dIw/cEasDaTMuxY4JqRIaZBNhw3B2/VuC8Ktx1d1fI=;
        b=VhjkyxAhJExmMY9Qc7mM2C1fJIl/ME2lL82LYBPLlnNnI8nHXpvBjHdmdOKvkpxH0r
         fo/r07n1rqqoxPeUFTuqujFM9RhqpM8FZzmBaS9xpL7154YtqtO5rfXXo+JmxBir3+ar
         Ezf/DJch6XK7NOY8/DzZ1Lhn/xvGgP8lxLxjui+nSeavEed0efn1J+7wt6KsVkOv1epU
         ZmXb9B4MOmkEThCwop9u6FVAGwR5uqDRUA/XtXu1Wo23AIwNMQafpqBZ3+69eHx4ecMm
         DcJ1gOHLuTXqpiDmrc1IcPiU+TQc3m35GBvRE1sSiL785Gjat5C6luZXKXJMrKFCcwaa
         M+aA==
X-Forwarded-Encrypted: i=1; AL+hErFuIm/n1uqJeWc2VHW2PMTiTtriRqo0O/X9VyjBqS/8aR9Y/Nc9UQ/nhzH/qCUoGtPeMCGwO1LPCiluBQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9cPjeNVmyzs5yo+INVX3ZBUY1knn1veDL7qjoLVgDCECFPq/eW
	EU0Wr0EvfeoXfVQqaizNQfsAT709mEeHdMtuexIzd3dkomZU/FlyWoCV
X-Gm-Gg: AYBFou3XYm/Kq3ToBlI7d4bUGe7rxAG5lvwzp04i6bdwr8/YqDinAxz9CxmPfYB6M+K
	Wbl/RrEEdFJ7tTyWtqF+WRyQejSDjTpqIwI3QHwD1Ahc8RtuEck6neRuy2YXxvUB1DoJzYNSkn6
	9Djk9OMfrAx2urNyU0QlaaRfUljzEUvV8V9cJtT8Dnm2BVXqmy3fH8BNx3FAYH8jcWOkNEkNPrk
	oq5NC+r3eptKN7rOisk5uaieC0K+A50dQSnP58BBVgJRhqE/Drfsz4onB3rU4zSu9jAh9Uf/KeV
	fXoB6bnbllxAcsCDpxrRWeQViwgKLCSALK8dPnVKFpB3DqpAiK+Fw5qkxAVy0/RsZFFoD8o5BeE
	bdoLVtm4Rvywkk8P/o7B7Vk8z7GCtKScXQYVSTiwKZ76w1PrVjYCxohvUUnESWQITy6n0nFzSrN
	L9ExPuAIeUt4tEpJyCVw41bi0GflvOt6h4Z0ox/wLDIaJv01gfnFRdJW/Pas+YdFQq+E0f+fcgX
	bifNhExWkOXczVXEofLBjSACwybd0ugOXWmCjQag59NIXw2DHtIk1YhyeRep7+eOOxkDdJmKSsF
	qJL8hpat3iOlvnkgbq+fx4l5QnrJvuQ/CE/gA0moFWiYlbR3btha1LW/rYNHkkMGj/oH2j2qIL3
	WrKOOlOUrBJiJMy5i+DJigIwmZm/8kxNceuAk2zOfPYT88e5c00IZFaI0rYfAVzrInPQS5nxOet
	xcEg08gt48UO4CBGo4P2AiV9NT7wnx4CfC4HDsERbWwO5U1nhrgOcOBzPJf8iTxX1ibzIROmqEl
	xgDWVTFJH3yRg==
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb55a58e1amr67471255e9.20.1794583205214;
        Fri, 13 Nov 2026 07:20:05 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm159789845e9.15.2026.11.13.07.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:20:04 -0800 (PST)
Message-ID: <a0a6a72f-0ed5-4f1a-a93e-30bb99338045@gmail.com>
Date: Fri, 13 Nov 2026 16:20:02 +0100
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
Subject: Re: [PATCH v3 1/2] kernfs, sysfs: add SYSFS_NO_SPLICE to refuse
 splice on writable opens
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ian Kent <raven@themaw.net>,
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
 autofs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <cover.1794479968.git.krystianmkaniewski@gmail.com>
 <f9f3df7a60ecbbacc3186b700deb947d7dc23e9f.1794479968.git.krystianmkaniewski@gmail.com>
 <07d063ef8ebcfc7f4e05c7318a423728@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <07d063ef8ebcfc7f4e05c7318a423728@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 16:11, Tejun Heo wrote:

Hello Tejun,

> Hello, Krystian.
> 
> On Thu, Nov 12, 2026 at 03:17:01PM +0100, Krystian Kaniewski wrote:
>> Read-only opens keep splice support because they cannot reach
>> ->write().
> 
> The patch looks fine to me, but I'm not sure whether the read-only
> exemption is necessary. Is it addressing an actual problem? busybox, for
> example, just falls back to regular reads when sendfile() fails with
> -EINVAL, and refusing splice reads on read-write opens while allowing them
> on read-only ones seems more confusing than anything else. Would it be
> simpler to refuse splice for all opens of the file?
> 
> Thanks.
> 
> --
> tejun

The read-only exemption was only intended to minimize the behavior
change. It is not addressing a known user or regression.

I agree that refusing splice for all opens would be simpler and give
SYSFS_NO_SPLICE consistent semantics. I can make that change in v4.

Thanks,
-- 
Krystian Kaniewski
