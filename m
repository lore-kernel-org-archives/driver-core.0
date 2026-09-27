Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA03B14C3
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541097; cv=none; b=mZRvpwhBSNH5I1BdvdxKq5qY/z/Yrqzmt+r9UHJoUatAx2GXiNgIrQolVWNbL5Rkb4mp0WqaTpjnmnzGUkEtnCQrVbLUKXglSKqYNmtwWqN/ZIEuI4xqLINbAtjYCwjF246VHYjdibp7Qcn3e9YGEeD+nhZNeL3FnbLXJUUgdFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541097; c=relaxed/simple;
	bh=ECmiUnCsuf0PP00J9EUGstc34FNcT446eF3bYmlaxYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoyB6gMTGEV1JEGo0fL+SBJ+52/v9jHIqBR2UksfETgWAynoqh5X6THeENYQBOX+83DcKArjAvWX4rnbuif8eMV7SI90vdg9oRhB//C6W0nAQ+XcNusgyxDwVtoubZhjd++glTSibFSacpcE6RkDZLdCBzSCSNpX8CAXONFoJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMhJ+nCb; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMhJ+nCb"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso650546e0c.1
        for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790541094; x=1791145894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Kdmoy3jfQwTDOQRMgPKKjPEVV/7jynijwAv/AC0y/g=;
        b=PMhJ+nCbO2mgDiqHiy1+Rwu2VBAuu+DeOEyEwaKNoCKA4Bk+X5qNaomFKhI5k4BuT/
         mDw6mSp7eZ5ry0cfwd4DF8On0867cgzSH0dak9oROi8F0a4+jX0q5wM6sT+rzin2dPAz
         oQfGuXFe6h8IwKmMoACXy/qoS5o425/1Itc/srEsbEr7Gr863LBNDxflLgAO025K0GTP
         We+4A1A0RJtgfup27FgQ+xIHMupT7GRhlR70NtpweZUqQUATtprKc6SwCzaa+QvWfu1K
         qZOzf2vRlL+a4KNgnGZDJp10oURbN50p+tFQp3A2//6kcqoydWvyxj3fY3J2R3TV0rBm
         +4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790541094; x=1791145894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Kdmoy3jfQwTDOQRMgPKKjPEVV/7jynijwAv/AC0y/g=;
        b=OYEbYHbMkJQlByieSj9L9GTztwystZB20JWm7NxpIpeU1gcyL8H5wa1Q7q2AMmYDtq
         NxczHWhEtevXzo6fCW0WkzJisNAwi3CDBpz1RC6txzxtgSVJu5Db35brbmHpKn/lKSUj
         Tx02Ypn+7U/x1ee2X2NlBERpCmLZCIhcZAcjEVtkjyeoZyu2S7P78I9U5whMw4sSKJMK
         0JN3nsAzoWYkfEi99pwccCPmqXfywHQLT1LZeECbF7zg0bEOUhcx7U/YxwkwsCRvl84n
         LUkWLqkEb0KiadeHMLDovxCoa8GRI15Gbiazpk1pOy9rEfHl34GMWnX7G4K+UFzExqJd
         ZcAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTjCPu81B4sUkbYwXQEkVsSS/dquLyQGWExKJQJrZGAKct4N4ehwA5HWz7tQizrvwgW4fh6ZWzIkijkw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ4mIwptPDqUO4DmNKMB6UUM8XnIemluK2FEhg9ahOXRW7Oe5kn
	ldP5sDnnMF72MhjwWBVjx09WHaG8iUWdxT7Eue8bMA8iVrhgunAjB71i
X-Gm-Gg: AYBFou2SHYoQW0xUuSlRMXxW7tT8fhXOAXnCI3dKC96F7G5ojR4NckDaJqZ1lZZzm9k
	RvNBd938dMrbqZNmxgCyX6sjAwTdhwpuO6Ebm7Lxn9ejfXXM1kNvHQUjbvD4Qea9a7iI6TPwe5M
	eYdUKu8beAcUW1J0zrgrS8TS27Xr7XU9DgHwV3QE6tEVIJeyJuRo6o4ekYOGJmWOPogBlWz9PWG
	eH/C6cr6mOxc0E1+Ycg/ySaN6owRT43625Pu4sG6/5LQCq5B1gYZB6azhCx5v/v5tnYWi0DICR0
	WUQQ+l8XQ8wFX16RL3k0vFW8Y7zRFgBp6JHbqXKq+JVqEGvYvHPbeYHq81sgRPdTX5cv700RQKC
	JQL76M98krGA9oDWwKvvNNN7HPnqIpcULY72lAS7KE6k03BYNvoihnKT63W+wXHYlNSyvbsNuwq
	VelYBgrCQ/vLl6CFixClco2ABgm6n4DARaf8KM9eKc1cU2Dqo6wmJrgERzGtFxDgA=
X-Received: by 2002:a05:6122:3d10:b0:5c9:a618:bbf7 with SMTP id 71dfb90a1353d-5cb0c628f53mr4928551e0c.23.1790541094465;
        Sun, 27 Sep 2026 13:31:34 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f99222sm6419782e0c.4.2026.09.27.13.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:31:33 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	sashiko-bot@kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH v4 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sun, 27 Sep 2026 17:31:24 -0300
Message-ID: <20260927203124.2060754-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092720-sandblast-heroism-30c8@gregkh>
References: <2026092720-sandblast-heroism-30c8@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 06:37:40PM +0200, Greg Kroah-Hartman wrote:
> Please don't use a LLM to write a changelog text without crediting it :(

To clarify, I did use Claude Code during the process, but only as an
additional reviewer for spelling and grammar, minor rewording, formatting,
and as a sanity check for obvious mistakes.
I wrote the patch and changelog myself, and the technical analysis,
implementation, KASAN testing, reproducer, and verification were all done
by me.
I should have been clearer about that when you asked earlier, apologies.
Given that limited use, would you still prefer that I add an Assisted-by
tag for the LLM in v5?

My background is security research -- I spend most of my time auditing
code for memory safety issues and race conditions, among other things,
which is how I ended up looking at this code after sashiko flagged the
missing RCU protection.

> This is probably not right, don't do loops like this.  Either fail or
> succeed, don't loop.

Agreed.  I'll follow Danilo's guidance from [1] and keep the
implementation simple -- single allocation with GFP_NOWAIT, no retry.

> Again, let's see the real use case here, what is hitting this in
> userspace today and what debugfs kernel files are causing it?

The writable callers in mainline are:

  drivers/interconnect/debugfs-client.c  src_node/dst_node (0600)
  drivers/soundwire/debugfs.c            firmware_file (0200)

I am not aware of this being hit in the field.  The race exists
because the write path uses synchronize_rcu() + kfree() but the
read path does not hold rcu_read_lock().

[1] https://lore.kernel.org/driver-core/DLPDB44JJRGJ.3K6JNS746M7QC@kernel.org/

thanks,
Aldo
