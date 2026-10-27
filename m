Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793062678;
	b=PbySExISt8QUQVeUs0y173UM9rxco19mm+cX9zqEmUCD32s8IVhCnuuDtLF8hQSjoNja
	 wYEiIYV1IPEZfggO5CrQCdXkruA60J4hvUEgBYRNHNuAi62n8vCEt1SrhEua0ZsgSk/kH
	 8KwmcVH+RP6CC5JpxAoNXda9NWz+r84GF8wMdF/kzXcf0+MTgRkucTFNjCMygNOucKtRx
	 3YevE6AuGRb7UXvFvEvrnskbDdpGEfNhReekHuBhMw0l9tGKtJvasKqZzKJkKGlhR0Yjb
	 u20rnK5XQRsO4ALCC0OH+6KUj4c3Mv+d3Ri1y5IpM4b9s1TbjrLfSUH7pyjatEkohUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793062678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PixEuIlz0J326DRKLzRZTRCRckMWEmO8LrFWZwm2Ojs=;
	b=TKmrRE6EFojm5XLP9Oed/6lBWOQCAbdvFKo7PxjXLH3cua+NnLkZoFxyFuU35w3QNIg8
	 8VmwpLOeiFtC5ZgSbGLCK+8werIDCiuhxSHCcIP51z6fVkx9lXN89EApu0Siw+eVVbXXf
	 8CvAKoFMHe2S5JWTpTcnpeRxSNUJX988lAMpgwlAD7VeOt4286xtTCuzWe5BYXyvevDSz
	 /cW3WYG0x+Utw7ZI7BlTcxjmEGX3J+3w8TP1pDdIrEuKhrxJZVzz6Dtxmzk9GpPWqRqa7
	 alNe4wbzwSYFJ+ItfA6+wXrR5d3pLCc9gYotV5Jj4nq1L3zgdWZr7ACDIbCMG5oNfeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TL345Uxx;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED14606A31D
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 00:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED14606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TL345Uxx
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so5621602a12.3
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 17:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793062677; x=1793667477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PixEuIlz0J326DRKLzRZTRCRckMWEmO8LrFWZwm2Ojs=;
        b=TL345Uxx8ZNfx3qSO3MfcTWU1oMvrsQcQX4GsZbe0/6EUH3qxKhSuefKlFEuIzY/A1
         AxcwRZWpJVzDbjpee6SVPQYwaPJlVVYLCyIwZ25/AprLnzZ7hOa0h2bMYbeG27R9hnxs
         LWmJKh6DLIzoRnKCK/NRo3cHzFwHQAAHpx4k4taZWmoLsaRi2xu6WnWpWAp+t4+yYXh9
         F3vYHjOEqWHzasw1X9xExQzUmSE6pCqwCP7SrI6qg6KrJhj/2atv/7Pk4yHrZnju/cmd
         5vedcUXoCuO8k6lvmzdd5TzT+s9fV4rr4P+Z/tmuapxvkEzAPTy/deIR/LhehmxSgvzO
         AtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793062677; x=1793667477;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PixEuIlz0J326DRKLzRZTRCRckMWEmO8LrFWZwm2Ojs=;
        b=EFa3vCx2EsO+vifhH96ICEtqYNsOUp1B4BFZVlNf5e5GfQCUFR1AAy8R+niriqUswc
         2v3TP7q35xbykg8o581JcxFSbr+GXPqWnJoZRWclhLu7i3KcnqZQpom7cIloXL3FcZ+m
         jClqLCZs6SW/8HU6DB37x+2BD5qS7suu1CFf2OJBtQRahOLBXQfIiCUChK8o29dY8U4B
         dNLAiWanoYY3025BMD99sxVzzSpj/GL+7nuptQX8vQ2tlab2FPacK3jsONopQQYn6/xd
         91XQjp8+wPyjgvWs0k0tg3Sgm6o/gS8XUALb5zRdjW/jkh8ocqe6CCBG1g/6W6/IYNvL
         jE5A==
X-Forwarded-Encrypted: i=1; AKwUvBxyTh/BDWTYbn8e2Z2sfRhhPCsVztgkLjsoSGySnBgQACBL3aqoCrXDmx9OPt3pQ75mXxABljSc+Hu8gg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJjm19UamjTHwdSED3InQOl5PkBoUpGDlqKfP4fIhIqV3YFtwTt
	J0GbJBXTOjJ/1SbCNJXcu9WpL2BROnLhspzt6sZ1fBSwUybmYmJUjbLK
X-Gm-Gg: AYBFou0GE2u/tubMG6ZDefGWcmJOd2oy+XKg041QlX3NX+Q/MKDzFFs4bEyWhNTXfw4
	cm6t+HkCP96fDAtP37XiJuLA875GeyLU0HDi+T12DcIhyOWVLstUrtZ3swpzWrmZGEqYbTUdSNS
	HPMLunczGLBecQdzlm30XdnZ9TMfewBLdzPLVvfdFXOrLsdeU4trOdHFhsjsQsK09LsPg/FHn9W
	snPwOL81tWQS6ONVIR3fGSEQhOozbXFT0YI616FnLUxOSDNiqr+HjzGCXSQkWd1vj90SYcmC2qo
	TBaj/9EBPuYLByGowSabL+dVGK2WF583qz32/dxPbY909ntzu5QY9sUcbGFkd43GZeInzLgEp2w
	Z4ieutkeuGGTCi3/AlTcNXX5BDAN6BMJJhLDCLTma+4VmNFmZFr219albKzyZZ69C7ptF+jxCX0
	3aCgd/skf+DIJBdyIKb/iS5a5uix11DSP6z6CpZUIFvHc4Bsqwxwty3SKWfd1snzZinlV5FfZLD
	aywanEtgVhIDdEUlvkFiZhLYalh9ox+hwohVbsQx1GY1nvN6OpyNZxKvyxxuKo4LujnJXLHuBHW
	u2bIYaFK28ylD5PY8FnyuHEkrGG5DsApPgxIRsHSOoVqKBXIxQoIi6gz9p5KCk53N2wGs2DqY/l
	Jnh77Y1qn94qtcmu1UC8fsB/pP8DCnXex860QwGYwBmuYguw/vFmgPB4wShzajRZrke+15va1/B
	8WTEcjTMqNhoRX9nI=
X-Received: by 2002:a17:906:f593:b0:c31:8984:7fad with SMTP id a640c23a62f3a-c46bddf6451mr917653766b.15.1793062676398;
        Mon, 26 Oct 2026 17:57:56 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm4283637a12.11.2026.10.26.17.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 17:57:56 -0700 (PDT)
Message-ID: <083c2bb0-85b6-480e-afcb-bd2f386f2ddd@gmail.com>
Date: Tue, 27 Oct 2026 01:57:54 +0100
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
Subject: Re: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs
 stores
To: Ian Kent <raven@themaw.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 driver-core@lists.linux.dev, autofs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
 <cover.1792577179.git.krystianmkaniewski@gmail.com>
 <dc65c28e408d6b64d4b13b7ad30e5fe70ddaa441.camel@themaw.net>
 <4f56c93a9fc5fee152364974773df0a319c84af9.camel@themaw.net>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <4f56c93a9fc5fee152364974773df0a319c84af9.camel@themaw.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ian,

On Tue, 2026-10-27 at 07:11 +0800, Ian Kent wrote:
> Commit 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev
> in resume_store") looks like it's been around for a while so I
> assume the reproducer should work on 7.2.12?

Yes. That commit entered v6.5-rc1, so 7.2.12 contains the relevant
code.

I used the unmodified C reproducer linked from the syzbot report:

https://syzkaller.appspot.com/text?tag=ReproC&x=11c0f4c9580000

I also used the configuration provided with the report:

https://syzkaller.appspot.com/text?tag=KernelConfig&x=7d012d9c67977ee4

> What should I expect, a hang, it doesn't.

A permanent hang is not expected. The result to look for is this
lockdep warning in dmesg:

        WARNING: possible circular locking dependency detected
        ...
        &pipe->mutex --> &of->mutex --> &sbi->pipe_mutex

The reproducer records the first dependency by splicing into the
cgroup v1 devices.deny file. It records the opposite dependencies
through a normal write to /sys/power/resume. These operations use
different lock instances, so the exact reproducer reports a possible
cycle rather than deadlocking.

The write waits for an autofs daemon that never replies, but the C
wrapper kills the blocked child after five seconds and starts another
iteration. In my test the warning appeared in the first iteration.

The test needs lockdep and CONFIG_PROVE_LOCKING, the cgroup v1 devices
controller, autofs, and working hibernation support. It must also run
as root. Without lockdep, the program can appear to do nothing useful.

> Also it looks to me like the reproducer is trying exploit an
> invalid request similar to what I described earlier

Whether the string identifies a usable resume device is separate from
the autofs request. resume_store() first passes it to lookup_bdev(),
which performs a pathname lookup before the numeric fallback.

The reproducer changes its current directory to the root of a detached
indirect autofs mount. It then opens /sys/power/resume using an
absolute path and writes the relative name
"0x0000000004000921".

The resulting lookup is therefore:

        <autofs root>/0x0000000004000921

For autofs, this is an ordinary lookup of a new immediate child of the
indirect mount root, so it is a normal mount trigger. There is no
autofs mount under /sys/power.

In parallel, I am preparing a revised patch following Tejun's
suggestion. It disables splice for writable opens of
/sys/power/resume and gives its of->mutex a separate lockdep class.

If you send your autofs change, I can run the same reproducer against
it and check both the request and the lockdep warning.

Thanks,
Krystian
