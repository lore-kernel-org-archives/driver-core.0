Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686757;
	b=RKU6uFiY2ux13n2B2zt7VgV+owbJfgzVyK07LXIJaU/3tQjp+OX2OTYCdHS9xDU18PAK
	 V7+4gpUG08Akn0DdNJdW3aAx+A2tSqRGAPgh/J3Tk++f3t2orhrrWWkhXlz+YBVIrAFq0
	 vvYO9eZieEvifvAsZM/qA9zxyW3JmrRfKKnHHD7UL0ScbLOnt3vSHsuIw2Deinjk8Hkcr
	 9FbUYF+LE/gmU0FgAJWbDKMJDM0Jatm+K8BUU7w52hzRTuAPulZexdGPfSADC+51Ol05m
	 k6PcotYTtbxSeAdfLOXpuYphRx0oH9xzH/JSEOjlCbGEBjjZzRoLHSD/Sf4d41ApsHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
	b=DLUGqzWoy8HQevJlJVOGf+oI1Fp7zynPxBnZvQssrx+H5hxYzuq8q5sCrwFwL4d07xQS
	 4O082W0sqWkEYoBkNdWTg+3IteP8yhIVa2bnBC9tt/xG28XFWFzjv7q2q8v0hfFYzjudT
	 +qxfR6xWIQHHFtCOfOd19ldGbbmamIgPXXxdl9PBNyfPEVYH1lORBtwiFIGS0nQEKM56O
	 7eAcM08oAqb6np47Ha6AD4IBUfepgeGr09XcwYPL2gnORorxwabH4IJoHWq878oaQRxh+
	 B4iLzCqj8f2DUHPnOzFLM4lCw/1QEEozghL0V0eesFcDefxFzFWs9g/e9d8Ynidz+pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=PzooN50t;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A0606A331
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19A0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=PzooN50t
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1463751b3a.1
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=PzooN50tk6Jvo1qz/TShfwPqaa4BsD8Gg+GfDc5bzng12G37IHsCyHW+pKP6tifk2b
         oNjoJBEHbYzEmeMNWndVLiCwfsU4HSoJbv52m1N+6sbHWEHQjOS48HDR4XQmwrbDuJvf
         BAxSOEtWBW5hNocnz6dgI+fhoEkWkh91+mn7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=2SLSVzCXzi9k6vWLQKaz2Zhp0fWGN+/5k3N8FRGvPZorZv0yQPhDkETndS8sfOSVzQ
         9hw0zv2Sn6vXMXbAoADac1OvnxcVSa7WX86Y8qiGkqIs+XJa6De0INSyAjV8BeyHEXUP
         zFKC30VoXV7bTbbZCqGZCkHH1F8oqYcHUPv9PIuwFDxUEQ4n2dTs5eyZ8fUDugQkjXXQ
         l8dyjNh3ypuN9YsNc1pfIQSLSVjPeGTml/B9i4SDZnNPAlZKDY+Vw77tM66B+0ZveshX
         D76wSqHpIiq7Siv2fKFaEQTRz/SdBpYKdwc+n8TvY+hqMcyzixL9bZpLNcgxhxNp89cL
         1+Tg==
X-Forwarded-Encrypted: i=1; AL+hErFmC3oPE25Av0SoZR/G6V4v3BE7BF5YpnQZJpdFKVWt4krNoryOjr5LdQWsRtvmTWTaAihQcQu/y/gd8A==@lists.linux.dev
X-Gm-Message-State: APuU4Z/0srHohcgv0HJ9wBuH1RghSc7ncCglJcA+bIksfKiKuNGAyPh9
	FJskyzSm2BXdAoz5vQWNR8mq0Qvvfzhy6fpQIYACuwP7ImAWF9gcjL0n1+qUVXG65kw=
X-Gm-Gg: AYBFou0Pg1smVclwszACWFdYwP/UJKBagcD5PYJtI4iz03jP2w0/zcOqnui2tcF6uEJ
	bdxyrKRVhxNiw4NabG//JzsDZtRNwvSU71KzE5S5z+7PFW7QVqHZGKbAXeKMmjfonkgmRdM0xK5
	SKuABSqYrS6vBbZnqLgSxTIM48kv5FXaFmvUCgRq7WLrs84utiC9H7oQrI4LaUmfR56um66Bxkd
	RjdqQigxtIriEes78OSg0XqUlvvubisu9IeeL9YsrIk/8iZ+3NMfduJDWnLWtKh5jR4yAdbcwPR
	h+HFnueHzaDju1NZi2/JC6siMpmg8yDvuHWhNvjouXaV4vjxfnSXWIriSjLOjJVQMenReXbsVWa
	x6AuDerrtHcGNH4miCqBHXiEfp3wHcGDub7MsTL3uHm9wF7zpK93FF0a6XuELnwTnRl+TfOEkQF
	LcpkSx/ZZsrDhppnOThS63tIY8z2ApRyzUBO0uZLtVLAsXbDdm3XQq8M+gF7sDjg5IftPiIeTUn
	CefmC2NYz/yP+tmzfD5qHLusQu2G2ndGaAzkemEQfSmejwTd+DjRd6m/VNF+wO3gfkq5nWNi5gP
	hZv5mDWtP1UMLShw69Uov2EGMMwmNQBa+i+zTGMFwb5DVc/SEKMAlpHkc+PuK3h4CdnIL0A4G7V
	IhQ4HiA21yU7im09SEiz/LYPR+Sns4ByrmNYNkbj8ViBXEVJaxPcBU5EMyih5aES1HsPOcOUSgQ
	8wmVj7e94+5UmHlmLIzQwlGJKzdjOsDddcbNJMrthKm9fz9vrJVilymXbF
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:54 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris
