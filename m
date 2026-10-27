Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063210;
	b=G6EojMlMHgO8wJg4o13t0x+0896ffWE8W9N3Ibh+aQsga3bVY0CzwUrrMVP4476SQ1Th
	 dOmtOoD6va7Ag/fzbNQkNtRMY98Wda5IUK6rlCEJPbkxp5ARUyWCTOebXsnIyAQmyqoOu
	 YKt0djcqd+/Re6DPV2nPQCv86iq3gV3OkuKX3lFwlLwCqB8/dPH3HyublH/cNftLuSWfH
	 7UhUInCm/n7Py/TsdVnO6Qwe5n/EZldtp08PkHDa/iaPj6GO85QHK5PubiVRG/uo42++m
	 VwMcw6V7hRqwx45O2KXXeVbul4+dWKqVJm9or+m2aR3CaBuneRqO54sQ5MLP9Gx4V2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aJI0hb4/E//vLxc2EVc1E27ZXseuwybs0SN1EQUknec=;
	b=cPADm3oPxTUsU9zc/P/DCJsJS/bjNmOIXvkKW2X3ZpkCfaCrMI7+E+0b3sVT7KOFNYkh
	 KT/VXcatq3zM+2WaOTAZD0suIQcCIRTcSIdyZHy9RQdPnOibxaAjwd1TaAQSGPG7VImJ1
	 16WH71ADTcotik+EsZ1A95LaYN0dPPULb1I7Nzw1PEjzy45vp50E2JlFmEpi0xugRt9Xf
	 TrcOA5Xe3Lnw/sy+ZP3/YLoXZfWU8lcfNBEfKNRNMtJgEFR7Ax9eg1xj4Es+9FReKoom6
	 sumFZvhREr7S8aY48KSYB6l6OBkk+DjlW5W31OYnzJdXKtsMvTDNHJXQ/gCLHNnzpkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="O/Nc7m/Y";
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452FE606A31D
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 01:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O/Nc7m/Y
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so5268505a12.1
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 18:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793063209; x=1793668009; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJI0hb4/E//vLxc2EVc1E27ZXseuwybs0SN1EQUknec=;
        b=O/Nc7m/YJsu6RV0ulGpnXUa9RLkJ+dMX5dyd1bvs2cADA3hq9IhxwCN3rJMBYPvOUy
         3npygrZmKVyORAcgsOigrfpLmA54M2BGi+dKlZrxjQGhqY5wyPdaTJvDGzerNoct0muS
         onKkev4Dp5Q7YVV1BxGtc68rvHpIRPiCsyRUtpH1s1BrhWB0JQlecLkq+Z0AQLSuC6Jg
         /7qkHlK83IVfaZHZAjsbGaO4XPk24yG4UK8jxWMMOSddXk0lxeFmpwp7SWJY9dM3YsxD
         9A5XshOORmL2JmHkIh+BCIaAE1Ve9z+k9UKqjgEHWRVRCNDRpRYzDICn6XQ9Bep302s5
         pt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793063209; x=1793668009;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJI0hb4/E//vLxc2EVc1E27ZXseuwybs0SN1EQUknec=;
        b=fNuR0xwxfoVPZktLLfChRagGFfkSzY8uQ3E6CjkC+hii+Zp847jbSPZjVa5xccXXqg
         meQHrkL6lzdjBO+dbzlsjO7wzRoSyOEIpqv4rXpfQ9n430UmnwRiu1xjJTcPgqf7lm0Z
         IyWq15Hx8eq8Z2ulXCcR6B+/jvbPa+NfJ+gdsFxmManMah3z92Ya6+gGEvW7xYnyasbX
         kWIl3nznXnUOZGDCVowAJP1zMLxJB/ZY9wCsFxifzN10hTtGwlWY0alJe4JaccuH98Of
         aFCZEA6VEhOX/jTwbt3qH6uLtuokn4zyw5ojhF2439aBD8vMp2UqJkc0BMPcU0T5hcTI
         O9ig==
X-Forwarded-Encrypted: i=1; AKwUvBwNWWmZ37z7/AlWZhDP1Xh/BLXuOC6yxWMuoyNCzo1WlgfdxFvc1pvCW7rhWQaqFidMqrz7RRXNDy3Zpw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJvAzCTVmQPl+LO8D815ZznHGoiM3cuirPIkzRV9ivE5+VcEMB3
	1VL47NAQKX/KkfwKKAFTp0TMc65BqFsGdMgWjIW/oQDzlzwLUmE7oH2U
X-Gm-Gg: AYBFou2tW0I7JYZqsKLx8u4GII6/fu4nUcLF155JNDpm1mR+qUF3xUVsGSTjgZS7sC2
	FeMUivVV3Ge8bIChDCnwLNKF2a26STd4Zmx392DZ7do4YdTwIIMmea/T1wWhL9WXN64zLnbXiuh
	bJCBMycrjGxACFCQiAjlvnl0gchvJNrpNBVDe+CahSGkKQ1hr/r1z80Lq87/pE5Ygx2DYpnW9/s
	BuwnFXoGHTzr6XAqJdrc831p8+uaqrl+lPl39gwLzpn74aey+J6y1KIT4Qv+UYY+gVw4QVSr2pA
	BGGX5GkflB4melUA4cnvhCmXMnfco3GaL2TU9YcTSaQgce8QBUhPDsOXeVZtcQgzHgZlHQpMwvi
	KyTmxOvLnR+KMgIZoZNAn1o+fCoCAyhyN5Abm48eNcto1mdLsrrfb5O7vD8KYljeWZsyLM/xNqa
	hoARpV0+H7/+VUOIGtVoHoAGzEmMpxKPabpTlEfTGCVqN0KZl58ZEtkfwFyTRFA26ny/+zaMGTQ
	dMAkL4LPg0s61TWHAnx4IOnRw13K5/ZcFVJHQyEV6nBftGb3r1r9ddRhAqkIVgEDIqppZ3Y3yp0
	Gsv82dWaPaKpVA3OmJHFB7QShsl7vlX5hZ7RbWoqgXZTdvRvpGAce/s3IxktUFtinmCxUrkri6M
	d+gSMzEI4JRRdNSYmAWtk1bFPAbqsR6WA6JTSadDqLrMEuWV92OAnRQn9tp/pzPc7x8FJH046Mf
	ec6P8WF84lPPPnM5w=
X-Received: by 2002:a17:907:160b:b0:c46:6a50:40b7 with SMTP id a640c23a62f3a-c46bdd690d3mr894395066b.10.1793063208643;
        Mon, 26 Oct 2026 18:06:48 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e7c94sm373434066b.27.2026.10.26.18.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 18:06:48 -0700 (PDT)
Message-ID: <7c8d96bf-368d-4272-8cd1-94740a2e4a84@gmail.com>
Date: Tue, 27 Oct 2026 02:06:47 +0100
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

One additional detail I missed in my previous reply. I reproduced the
warning on the unmodified kernel at commit:

        93f51579e7df248780214094418f205253383cc5

Exact kernel version:

        7.3.0-rc4-g93f51579e7df #1

I ran it under QEMU TCG using the configuration supplied by syzbot.
Both the unmodified C reproducer and the original syz reproducer
reported the same lockdep cycle.

Thanks,
Krystian
