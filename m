Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524565;
	b=eM0LKgbIsv8t/1djLI/dxMKPceLI1BO6B2nOsEsT7pkSsLR09g3x1XdnPXiFgCqf/GTF
	 T4jurdm9TgQUT1EHgPOxYsHfyHbM7PSYaLQF7QlZ5LKYBpPg4/0npB1z+pkD1UK5nd/7E
	 fnWe7pP9lL9skUY/QZkvKi3jtEj+oiq2XV4LOQPg8rt8Lo0GvDg+vSzVwkS4clM8MWIKO
	 LHD1FYoKXIu4NyyQiUx66pOeO3Q1kB9X9hix7Mvx3wf2wtkctTlLfwiQTnrpxHqF3fxKD
	 bNaRZhAdlxY6rmeBReW+1fjBXtasWEYRty+5jI1czZ24O2VMUn2EabLNv8C4B9DuacA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=UdI2gv0nE+PpiDHQRvxALGPPGMmK/uE84Q/kSWgFWc8=;
	b=Mc6QocqECR01H6V2dbjqjUxd6KpnwqMT8YcSCEAJKSVXi+UAgVYqlR6rx71QVvhyVXPB
	 qNmozFXAoxhUkJSiYHj6zIWSp/eSofIqkCesO5H4ZPfmQPc/+kAKgWRt0ZH4NmLVeJqeO
	 gvfsmH/BggnrkndSmQUyWKp4DB5/1AcdJLlZ9RmTbfUQ3aj1l3kPur1m1eWKlrbKvpN4N
	 CqybtWFWRCDhMeAkQlTYI5pe4hswJcWYkdEfm4bvH1jLmgPys2DHV3eubXD9LFZ2R2vmH
	 LkI8DFkozZxnsuWfag9rRFGqktdP+EfXVpwovUvkHo2fRCkOz99PHKNnykigwQOZWUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=KGF3GQEe;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158D606A327
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 23:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0158D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=KGF3GQEe
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3200175e9.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 15:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794524563; x=1795129363; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdI2gv0nE+PpiDHQRvxALGPPGMmK/uE84Q/kSWgFWc8=;
        b=KGF3GQEeOG9vMvJz1349tVH4BD80vgB8iMycxeAh5PqpyCPsrxRtfhI/Hr7rzJ7Ew7
         AMt3+MuWv2M6ntldGKOQrHbJlNRHPhdLhN8UGGNNax+izebb3pkWnzi0GHcF9ynfVlc2
         jW7mR8PsTh8E+is0KlfFp3GZOLmTHGCgRGWhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524563; x=1795129363;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdI2gv0nE+PpiDHQRvxALGPPGMmK/uE84Q/kSWgFWc8=;
        b=uD1FldNpdaNTWvGZG9H1KTBy/3bNs+ocnjlWmTqWdrsxfI1/ZCwREvoiSa1jIsRUtC
         qAlbjOKN5290yi7GWxCbuhW62hyAOK8ude5dMR0dnbK6V5uVYx/epfXDxa8OltLI1rqi
         3s9uzsCTNrrLVfSCiEQaJF7ehb6ffvpG7cUybMoEvipbgMBX1KCo4uAXmPQH+YtOHfiw
         ovtkGci6X9ACYtYpC7RV7fyv7Ub0fsJH40MBcoSp6VPSB0yL9WqTCkHJMgozW3SaW4T/
         1snLFOIFcaDGL52A73IuumTcsKC6okV6jd6I74Np2/3kZ10K6TBJvPEMvKCQFIpKBI9g
         FJuA==
X-Forwarded-Encrypted: i=1; AL+hErHVAKGLactA3L3BD/MYfFxlgwU2WMEqylW51kSNCMOmMkj3lSvO4qeNzBtcl2On2Ry3CfFeBqbkwLUF1g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/aqRoPINmXZ67PcczaXvVW0ApaxPz0dk0zA/j5Aj+JWbENPc8G
	eOCvgSmXnWniD4NeB0smlsqK3L7fgfAsQkMaNE0CA61p5ff24ZWbKyz2k1r9+lNpdFA=
X-Gm-Gg: AYBFou1F1ne3rT0xGs+aOR7j2B74JCxszCX7gtSMGKP4m3c+1jyhu24bolK5BkYSWy6
	3qr4C/TDVgsi6FKJX4cWJc4ayiSOpnKUMrE26sMtwo96rL0gTiyu59LRGtmvXTzRkv5otlU2hyw
	BxkoSI4hMSSAhtLwcoSREaYf88DaEWAlrvs35LpFjAtVWmQzy9lJjFticX9SspKDPMs1VVnBScc
	cjHfAu3a7XVj3fIChQohhhf4Pv37eWberO312gK898j5u2o3CyhcHL5mocIuYsxfgmoV3mnKvcG
	ENl0NVJSp+QfJFvgMiCBRaMvBHX7oQr7Yt8vLheZZet9yNn4Jkcnu6gpdUEjFvT80IRTqpvBs1H
	DO8K1qZt0YjwuB2KeGctnFdQaF1FHP/3qk9e2mOelnCIQhQu26iqczP4TmiVyP/0fJOrE8caQM2
	aDh7SC++eIWFO1Oum/IK0zZ2trlFOYINZcFTwhlSWn83dlOHb9wnvbeLGdgWKO2sANTR53/NtJb
	jky4Qx7YmU9OhrrH63kwptZfO2QTCk/SWvDEXVpvw58yqfmKCRgBiOlruCZSQGZVnzroyRehU5p
	7L/dq4pnrWglfUJdKWobx45ZA66woIOVyYeIzY8DD2hw/66pyPYQgl3Wld5xHX1gsMt5A8ODosu
	1xr5EK+ZtHNmxF9rI38yRQYwi+98rQIc734Nt2VxmRW7wxZiRpnOQBZXLKfErILYqgGMCpGJIUi
	6YNsLlDmSI58jtMQ/Dm+vox5mYucfc/ne4RPhJEeGH8GyBt4ESYjcWwKScwA==
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr7941995e9.11.1794524563487;
        Thu, 12 Nov 2026 15:02:43 -0800 (PST)
Received: from [172.18.0.2] ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm816285e9.4.2026.11.12.15.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:02:42 -0800 (PST)
Date: Thu, 12 Nov 2026 15:02:23 -0800
From: Chris Down <chris@chrisdown.name>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] kernfs: allocate inodes and dentry outside kernfs_rwsem
In-Reply-To: <20261111215058.1837351-1-shakeel.butt@linux.dev>
References: <20261111215058.1837351-1-shakeel.butt@linux.dev>
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
Message-ID: <20261112150223.f13e8b526933f9fd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Shakeel,

Shakeel Butt writes:
>+	new = new_inode(sb);
>+	if (!new)
>+		return ERR_PTR(-ENOMEM);

Not a big deal, but one thing changed from v3 that the changelog doesn't
mention. Without an ilookup() first, every caller now needs the
preallocated inode even when one is already hashed. Before this patch
iget_locked() returned a hashed inode without allocating. So when
new_inode() fails, decoding a handle for a live node whose inode is
cached now fails with -ENOMEM, and a stale handle gets -ENOMEM instead of
-ESTALE. kernfs_iop_lookup() does the same for a node that already has an
inode.

 From a quick check I did with failslab limited to inode_cache and an fd
held open on a cgroup2 directory, open_by_handle_at() on its handle
succeeds without this patch and fails with ENOMEM with it.

Now, new_inode() only fails there for an OOM victim, or in a memcg whose
OOM killer is disabled or has nothing left to kill, and those tasks are
failing most other allocations too, so I don't think it's worth
complicating kernfs_get_inode_locked() for. But it is a second case
besides an inactive node where an ilookup() first changes the result.

Not a problem, just an observation, so feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
