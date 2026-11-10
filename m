Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323278;
	b=FT9rugKkZs9iPHB/m/IDFIEdqXKyWL0xYSmhMeZ2S9YBRoQc1Le2wmNgkTlLxPunAzHD
	 QZfon0oKsQwYWOGIhcIJKFk19gW/h7VycUq1ML3jrd4BhpuHNYWZzh6piL3H7YxuJvLtC
	 uLkJYEmoA5YayiQPS2/N25wEJtoWYNm9FrFZulhb1OqoiIi2ZGm9+K7vYifGBj3wmXOkd
	 +v6vHvSH3B9+najVaVovyzmh5TUOtpT5cZLnLXih35uu6S3tRTe3kThjzUaNeft6scTIi
	 IwGLl/t6d1EM9C8u3tKzODaSLnEfO+ej7vb12fGhuwiXIGbSdIN/0GNCPj25pN7rK1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
	b=MYI1mMXyRrE3aZ/dQ0OqCDMAxgCbRUix3jdIXRfCCQStHxEtK3sdN0YP+R3ralBRwf2J
	 rcoWuwooHhgifC6WZXwLdNhAqN62gGJk/t1DnQ4qOuGJPwiYPUTW6hQGUkmkMGxmXNOc5
	 +QT1Qz/OovvNQu8JRtahG4Ma6LSwtEcPu3i8mWi8Xhe7cKts2cwofMqADxnS2I3DMuH9m
	 j++9tRr/aduxAdNwMHVGn5rgEE39USv9sGeuaOPXwYy9nsNQP6IFC76M3tt8y4XYvLvXr
	 BrKjozPuqn7L/AQRX9YJHqrfgSt2vrbihkH7tNSUX2DPHOA5xmrjPCo7DVc2P6doJmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY9WLqSe;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621760A261A
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 15:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1621760A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WY9WLqSe
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed2b4348fcso8360955ad.2
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323277; x=1794928077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
        b=WY9WLqSex8zTA98AgsCgsvySnBnti3hsAcNXSCUIpk1n/rzXAG6GAfga+1NK/udSyr
         SRI7l1rlipLhb5CeOOXpc51O5sUCOLc6scggxIDDDQxlMMulFmAggTt2iI5bmCpV5tLc
         tBicqpnm6fO3bxU7QH56qQDFvqaJ+kouxYSkKpCUx+CS1dXZUsURXQqWDuISEKKB4QIv
         myUAdiXOI9r5D6c+i7gIpsMSXWUpVEemJbNAfDlg7+hbhlTOIIj+bDq2oN7DGeDaQwWb
         ryp22JkxxkpUNiwZ92Sp5yT/DqN93ABcFetLPDaVyN3X/LwmXxu60AId4gSK3V82dtU3
         XDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323277; x=1794928077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
        b=L1NP83SFnNDExXojswI0vE8oq3qljqkmPOTSbA0XK+dc/jl2GjTVVA7bJywhENAyrm
         MohJlUHRl2v0tDZK1a/crMpVKD4XnW7KgdWKKsYK6wRZhLFfuqV9lFlmA6nOMABJo/9K
         0LEG83kJh2zU7yKis/8cYTaBj9zvW+MSV1zqXndXLJT6M24LNYEJExPRGnNsdJswtHh8
         5pZ8A/UBy+yUyo0PwraBewodAXzIQW/eVutk2AWymuuowK/rW2I6MT9S0qNRRGIr2lea
         nXakvbh8F2pl1o9YOhOXwNjuA7oIRALXNC9AFIjFznV+vhKXhkcEyZkbtPwbCGMhxJK1
         edUw==
X-Forwarded-Encrypted: i=1; AL+hErEbe1qFPH9GMHBMiKcpV3g1VLDNSW6+3gPWV0yv8nHWvnjgyVEvD9/B8ImLTSGQKPyRCY/kKqMp9xXCAA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/IIhp2Zi6cbPvGchL04T2zbviRA+OUsb4totktur1a2LKZzaiT
	8Eg3f9W+1I5c37S0cU4mBmVsxRLvFA/wh+onX5XtGHqhgs1Cjul0CX8z
X-Gm-Gg: AYBFou0LZio3q/5VXqw/i9uC73gZCMd53np7yoNiaYAfCzwbZL9QJ9FRQGXfX8p4wZf
	KAfHHRVn0rFi1JtJMSCyJwiaWlU6oz6DIIzlzZUpFnJaPFiMfk88wABAmlb614ha8p3rv6LMxOj
	9321ZbuNeqkU8dkz4jddoED5kb3O6UBQiiHUVZu59By9d8CbBP8wQXPaipyXH1+5N+lKq8ka9mn
	boDdHv8Q4ogBm02nOBF2kVoDIrwgbOVVJL5MYwiJ71wRXByA+fvvxPCjcvXOzZ4lHhgeRiL/vIM
	mpUfVabGpuSNew7vvgm5EcQ6ttDKFs2oiG9PvZRl6aodNmu2KecJnkpgJ0ALfR1j0+wE0B9MRsw
	meY1NAxL/fK1dCA4U76yUpDr3vUt3K1S1qUoOnyr3DA+4JkPpbOhnfZ4xI6eLMf9biiQzJk2HUm
	pgP4C9sYiggeNNCdNHeycsC+bDEkBg4dfYV5sF9EDmHTNNen6TlQRgMqruAiEuNGAnFx1TlDQq7
	wB6VT3S6df7Q0GHUiB0hhLPJxqYkvHDT3bifrDoKzHuLX4E7+IEcRd0Q02f8MWPI8cLkixuJT0R
	rnjenuYtTuu97IPCn0EBi/GyZavOisTJgj/ntQICBcHGIDwYW3qVajd7RfX/o6QvcAxrQ+vZ+m3
	0RpjUlGnWg6Y=
X-Received: by 2002:a17:902:d481:b0:2ed:1ef3:9ec with SMTP id d9443c01a7336-2edb9172a2dmr26826345ad.14.1794323276968;
        Tue, 10 Nov 2026 07:07:56 -0800 (PST)
Received: from [192.168.2.6] ([27.75.101.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d78dbcsm10397575ad.27.2026.11.10.07.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:07:56 -0800 (PST)
Message-ID: <71f76e5e-ce24-4a71-863a-169ad262c510@gmail.com>
Date: Tue, 10 Nov 2026 22:07:46 +0700
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
Subject: Re: [PATCH RFC 36/41] nvmet: refuse files on pseudo filesystems as
 namespace backing files
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
Content-Language: en-US
From: Bui Nguyen Nhu Quynh <kaylovefoss@gmail.com>
In-Reply-To: <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2026 4:14 PM, Christian Brauner wrote:
> The file backend takes any path that isn't a block device. With
> buffered_io=1 that includes files on procfs or sysfs which then get read
> and written by a kernel worker on behalf of the host. Refuse files on
> pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  drivers/nvme/target/io-cmd-file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
> index dfa8aa46188c..71c69bac5394 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -52,6 +52,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
>  		goto err;
>  	}
>  
> +	if (file_is_pseudo(ns->file)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
>  	nvmet_file_ns_revalidate(ns);
>  
>  	/*
> 

I noticed patch 41/41 doesn't include a test for nvmet. Would it make
sense to add one with buffered_io=1? The test would need a pseudo file
that can be opened with O_RDWR and supports both read_iter and
write_iter. Otherwise, it could pass without ever reaching the new
file_is_pseudo() check.

Thanks.
