Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565562;
	b=V8ixYsbIeAsT23VX1HBYkoY9ajLy715mFoL/orRVL/TMDPW/eeefkiPrCf6hpp2t9U3X
	 sEumykRwRhDw9l1gonNf7ibJUoCc3YT1zzYShnO9cDh/kyQzhpOMkMKutxuA//zHlzU5V
	 qQ0B860kUWe1GKCyZ9UhrgSDYSxrb1D/1kv1Q7V8Jl0aWPAmOmNt33TBc/fV88MAnwk/U
	 fv0Q0D9TGGFSCitJeQBM+DNeTNK9HjjcQprot+xub3D12JlO3CaV26FcIW79tEXkqE/Hg
	 xcDW6RVOi7Dip/Lo90PgcUcQCQ6Zp1Mfsxe8gqyiCoCLJ5mexM4iriwATJzW0Bq276g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
	b=1iiMsO6zSsNjgB5ExpSUhH3QUbzbEcV2R1DEWvlSQzo3IzwE9ZwUwp51yxol+34Uub5D
	 pLLPCBbqWmaJZkvSi1RESyHuwDULvXiGKsqxPso1gK6iLXw6/4KUGoTk+Fs7r0SXi2q0s
	 c4/eWVStXJhiNC7oMmWOiAHVjpwurExu6ci/ADITmA8ZeH2RLXUDATmgZOoLAMMEZB4v6
	 9yvpEkjSkWgKiJgi752hM+CeSOIripMX+5FKUUzM01aUlRp9Pyqhm1WWuLTjz7/PXUnh4
	 Hm1tZpiMTMbAdlXs0IV4o5OyuFnFrhGltEvOkTRqw4G4Gg6R7HxaNNCj5iSX7e9rVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NKq7lQZB;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EA5606A894
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EA5606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NKq7lQZB
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b80834ce1aso1170605e9.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565560; x=1795170360; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=NKq7lQZB3gGM0sLLYfuaugZJma8go/eKSMPykgYyCjF01TolC7bOUFBph2QfysOfyL
         vp5NvROZpjYewkD09tEtztgs/Bv948KTGCgFAFE8W9m9Tgh1o6kqs3VlpiYgXnoZFa1E
         6dOKrEmaHZUiMtoZoELRCbkOsaA5u3w5DAe9hrgrfIytB4mkbb7vof/aPry42XRjS2Ge
         Mx+YEdY1+gC7h5G8rcsMvEpUrdF6p/l2J7IOEy17IDREEYE+uoM7ZRrVwsF0plr4N9dV
         9QQD2tyAyye/Q4u4AyHVswy28OrFuzWzjCWEh+r5REeK2kKNplPJ66d2gj/3wUst4EE9
         IlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565560; x=1795170360;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=Kn2SpjIBnw89uMfChjCBFkqGX8QkRnYLLZVo3WzpnsAuiV2bpxcYbFcUnyNC6Bd+01
         O7h4sUAoHIDFnh3vjyJWsEkLIfXV+rhWtVrNIX3EQcx9Oqnuoxtven1OGA9GhFBmguXa
         vzbkXPYTNZUEudZpLvNOIx7EhNjJwW/foI/eir+nheK0wS7O6u+vrcdO2+ZKhMdl77eh
         6176qsuINv9Q5hVViMQTNZD0XunMWHuRy5CTBmyRJcxuUh8VRSNK3SB9l0ryGbDPOXx4
         frAfQ9YxO4XUKHYmgT2XDRp7ezDS/+2jAT9xGd+o31MXu1pp1PSWLPKvBC0KlZMP0jJZ
         xQTg==
X-Forwarded-Encrypted: i=1; AL+hErH4inzfF6ltIXSiYRviBgjk0JG9/jVgUqh8bm4E4gZj7Z+xqhaAe59IZ8tkxrL7OEADg6YPSyoEzK4qZA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+4yRCBEI+tnvRo2mb0LewCX3+iXETqsarf1QZzAFAtsjoLpgRi
	+2fMMOexlugYPTIpL9S4xdwuOcQyw3yJcvinnO7vR/4l9XwbSQMOWJUzIris7fx+RelbTZEq9z5
	Ods8G7scDPDSbGQ==
X-Gm-Gg: AYBFou3tQDfk7fx7uAi90DGy6aCPdXBZWpjweQME+UgjMPO2/5BhBkTgX5YNKpaRWw8
	VHQ6sk1hl2huJngiqePlke0ocuU6RF1qllTaYXCjp1NoJU9cnQqqPTl7OENXGVrfNsd26Vsr1q7
	fp1/OwspUk8n3rjonL2IjKF5rFRJHssn1XFTuK1X43Z2nKxfl35sK48LK2waSpuak7BXAVPZRi5
	VJ3d0LPUOhUz+Mp0FK/OR/zhSfLeQok6+HeCpE0Ny32vZ0FjFkClStf1w0F9n8hjhqd8ngX3Lwz
	SMqKEidecrQdPbzeiX3cXt55b4IeFWr9S7XqWciVBR4LT75OAH3BB8XxX1t35DDssnI0e0WwVjf
	CbPa6BjpxPIFYa3KJZIp+34Fu4DcqnC4EbbfxPy1i/tkw2YV8/qPyKDJ3/U598NKKfFtbbkt4Hn
	5jwMzYR9byxdZoHFz5IikiWgOW3+lF73WaMgDW82Ed7mrJOAFq4POEpFrjCoHhNlEiaAA41n+1v
	wDt7gI+CnzpKhVBp3VJ6DW3x3Fu+UqFf0B26AxOQl9puUDs0meyeC7oc9fvbQ74ODiiqlNJtrR5
	zRaJZFcKhV+TBV4RyoRiwSSjCU8+rtFmXWzop3PTN96E5BUIWdWakNT+dooeA6Y=
X-Received: by 2002:a05:600c:4e49:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4bb55aa999dmr38995625e9.33.1794565560090;
        Fri, 13 Nov 2026 02:26:00 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm244439965e9.1.2026.11.13.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:25:59 -0800 (PST)
Message-ID: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, Chris Mason
	 <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:25:57 +0100
In-Reply-To: <20261111151202.GA11391@lst.de>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
	 <20261111151202.GA11391@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Christoph,

On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> I've seen setups where people use fuse to mediate access to sysfs
> sysfs in odd ways.=C2=A0 No idea if that's still around, but if so, this
> patch will break it.


Oh, that's painful. Do they use backing files for that?
It's a relatively new feature in FUSE...

Kind regards,
Alex
