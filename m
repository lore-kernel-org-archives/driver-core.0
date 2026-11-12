Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492397;
	b=ePItzpCxrW64yZvXwskUraN8/DQyZLL8kJqRWST00SgWgqP1nazdrMjDRxVMruVeX0EY
	 1V6QLInW/bVpIi0mOvy6BzAf8eRoB7SteKvxW2EtBiqOjmW8YDg39DyHemvK9wVQoB/lD
	 AqSKGaIy/bxIaS9LLe1KFThN079HXbYPRgCTqIZhuJmCapHozQHqEDZhp9Or5jqvhMu0N
	 jrCuxmaK3jvLOVTQEAUxYFjjXyPCIVdiryccqZwgcLpiwGHaKrJevuXQOUXLZJqUjdRqz
	 j2xL1xXnXNTxAHinGkzqG9+6tl6nli95VvkophvR5uy8PdH6eKEk7yw/35WLAQUqy1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LXIm36iFMZ8kOBujPBh4eH/qjfWvYnVfBxH0cH6iwsM=;
	b=zccfMyHNHlwxX7t8/lgmlzCaHqfdCPrHm7rvofNGivlKKMa3MymICW6TShugq68havZr
	 EDisJ8otT0S0cn5RnRUPPT4zit/XhTyy8iJJW+S+OEh1ByHELTpBmkwEioOjlDesymYy2
	 snFaR0oS2iqBSKP9uQJFDSpX3YCNq5yGkXVoNOTh552C2fMBUCrxaa138h9CfVTJL4SRH
	 krggpY45OH0md9cB/X62BZz/4PXaQVvAWBOIdQAES6ORU4Gs4H8EHtmHLJ/eXvV2yezdL
	 /6iBeZWTGmGalI14ruXhA98lhpYZetV3SxSXKIFLQ7plDGTEGkZ6c0MHUbqiFMY2JOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTM5cbwv;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF9960A2613
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF9960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTM5cbwv
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c506094fd93so411398866b.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 06:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794492396; x=1795097196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LXIm36iFMZ8kOBujPBh4eH/qjfWvYnVfBxH0cH6iwsM=;
        b=fTM5cbwvLYz5Omo+Sm5sy6Ng2L1WZWWplwTP0JZzIGsWBy2GUXbBZXIiV9vudLxYgP
         GrWaiMoJiMbaLChO047tk2yLSQxzYm5+s6LHR8vlgVq7HINOn4awPs7bSu01xYXV9/EB
         Kt0V6I9v8HGbQkajtQYkbm1N9KaXUguJHufWvEjiRm1d8Uhhv8Mu623ztKCCdIlB3lwo
         FQgGSYBMCvBg+Xpz9ShleKOqutksQTtbn6QMlTKzoMxYdoeZEF2zJDSX8AWG4ndASegO
         kLX29gRc3GRRHHjVHNt5JsAuoVwh+jjftujH9crrVWigwc1YbIBvxio9nb0RUN3+Y5hd
         xwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492396; x=1795097196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LXIm36iFMZ8kOBujPBh4eH/qjfWvYnVfBxH0cH6iwsM=;
        b=edrXr9f8IwJsRQynthdQOwc/Rv7IlSsxvsh4WXe5Pjk8bb8GGgVNtwjsP0+qpH5GdZ
         MhT0I8d/1T24cozD8/8ryWSNouNz3FrsxhgfYb27dM2rYU08TTiqEX2+92Cw38062psE
         KDHvaBgMvxEv7Zci9I44CdSOEPIFIohOJpeDVPXeiRHTz4V/QMWz6M8GwcGOGUif7wSn
         UXbY+VNRbvsPIXTlpfEdTh7jTbm9E5tWeAlQCkhXtsdto8psRn83uFcgnoLof1u7Xhrz
         3Viw0s6541UsFUvv1JKQAxeuloY5GT/N1YaBdCdXK863ZosTNUohyT/QOHnkFlGl0Ybi
         cg7w==
X-Forwarded-Encrypted: i=1; AL+hErE/ClAVRE4LNZw99HfcB4kkrR9IY/6/VlhDFyqjOyrSOLTxLB9HRekVkK/adnvxhfwEd+f9Pu1iINR+Nw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Mz6I2fMxld1wIOvQeWVGjLcbr9Y4siSntfoWflf8eKw2y0ajY
	5eMn1UQ5HThuw+4R0WxxoTXKrfh/GX2Ffws32qI7ots0dU9bTXDOZVw6
X-Gm-Gg: AYBFou1w4v0eAZkPy4/YDqtoxCMmxqx1pLReDiNdn1dzuwsZxRqkdE12GHuWTg0PLBr
	BgonALCCrl9z8dIc0L/KTEEI7/RbMjjXz6UeajHJtYa14Jv91rw5KF2rkuYLw81l1I+iiuj14e0
	jgz39oUb6BleWxHSKeLSIyaFoUKFO0VcyZj/SfGvtsB8zeX9nB/EbIjPVFlZKMibb0LpLHrRd+L
	gpgcjZT9+Ucj2om0REn4cWG3nKd6LDhb3+qpoDSZogHMond9eiLbbQogiqsRX4MsJ8IAeWE2aZr
	lDb6n9GpJafi8VWSd4RIfrKS3Kx40F77sg0/287fCQTmkJkjCphJMkP40goB+/HNYsH0g+xffV0
	vnw9TZvIEid5ThCGHxp5DJUKI8+EyZ9rlCzHX9VvdyMW+whvPbN1GkSUMPpFHZ1BxRuU8jT8KZC
	WVaHIV7Nu66CReQ6+D9ziAIZYiQ05xwhnUfN5Je+Mc9l2CFC0pPcppNoS2AK33TtVB7lSAs/iqf
	i8JYwzSKaaStNay+6IMI9iwksVlHhrJDgffH7Dg+ngMNLWFpm/f18hhu4+kmVr14P7xc/UuxA/I
	L4WcYqWgrxMAcaVT2H9EGbVu9GQ40q/0OIo4C8CTaqe3GE5UHs9hGD2vitWI34c6EDXLL5iW/DP
	nhheX4a1i0A9zfZ6o+kLzWi4dLk9GuTcHrHg3us52sBPGKrutpD+eaRSDnSL+3picS1jMUBWIpA
	JxRTnaxOk9ret8gcTvfkpthsb94NAoX6051Z+blLyFnSJRp2zRc/LEGbuR8nbnGQdQedhSCzsEl
	hVST0wJ+Skt3A==
X-Received: by 2002:a17:907:1b1d:b0:c4d:31c5:e30 with SMTP id a640c23a62f3a-c5066d3db13mr442488966b.49.1794492395421;
        Thu, 12 Nov 2026 06:06:35 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a593b5esm363017266b.34.2026.11.12.06.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:06:34 -0800 (PST)
Message-ID: <c1af6845-bfa6-480d-a240-7b918331234f@gmail.com>
Date: Thu, 12 Nov 2026 15:06:33 +0100
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
Subject: Re: [PATCH v2 0/2] kernfs, sysfs: refuse splice on /sys/power/resume
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
References: <cover.1793715774.git.krystianmkaniewski@gmail.com>
 <c943b8e768ef766b0f6563b6085e99fe@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <c943b8e768ef766b0f6563b6085e99fe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 16:51, Tejun Heo wrote:
> Hello, Krystian.
> 
> On Tue, Nov 03, 2026 at 03:57:41PM +0100, Krystian Kaniewski wrote:
>> Patch 1 adds SYSFS_LOOKUP and kernfs_ops->may_lookup. Writable opens of a
>> marked file refuse both splice directions. Their of->mutex and seq_file lock
>> use separate classes. Read-only opens retain splice support.
> 
> Can we be explicit and name the flag after what it does, e.g.
> SYSFS_NO_SPLICE and kernfs_ops->no_splice?
> 

Yes, that is clearer. I renamed the flag to SYSFS_NO_SPLICE and the
kernfs_ops member to no_splice in v3.

>> The new property cannot be combined with mmap or preallocated buffers.
>> Kernfs rejects those combinations for direct callers, and sysfs rejects
>> SYSFS_LOOKUP together with SYSFS_PREALLOC before selecting operations.
>> Binary attributes do not support SYSFS_LOOKUP and reject it at creation.
> 
> Can we keep the rest minimal? With /sys/power/resume the only user, I don't
> think things like the mmap and prealloc combination checks or the binary
> attribute rejections are needed.
> 
> Thanks.
> 
> --
> tejun

Agreed. I dropped the mmap and prealloc combination checks and the binary
attribute rejections. /sys/power/resume remains the only user.

I'll send v3 shortly with these changes.

Thanks,
-- 
Krystian Kaniewski
