Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686759;
	b=PCr/1iQXrt/jc+vnFfI+BYBaupmc1AHEwsNJsMj/anMyxFAm82bwmy8hW1lngH20fNoJ
	 NmjwIa1qTcWxgo/ntBhS/i8Kcqe3KCyaKuikhFjosy4VbIlJm75oWl+LnOGG+HD08xsSc
	 1upDPT6/kxabo/M8kXwM8AA8yRRF7mVxsQoIHxDsLH6OQbOoVbaNev8Z6PK3rKvxj5T/X
	 MXgBPoCwBAu6WSXFGQNgqgaITVBK3MvgKo38BlK6pSMhIUb+wpDelqyao2FurG2mieJn8
	 LDdM4YXpHA7vUQ+w7A3DDmm1WgoyKdWz64CeQFIKF0eH5M3XVC1WBJgoHoAFZrjsf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
	b=XBAUXnUx2etAoBEyx2IZuQxAn8GsXAx3fF9yKLG2qOOkpc6NYSkulUvcWJH1+OKWWvVi
	 9HLniLAEP0DATw+jr5AiEUX/h6B3YtgCs6pwRyRxBtMR2RzsY3dXWDDdeI/jB4UzAtDWy
	 sZUjrkFV88uV4d6L20mI2lSD6mu54WUWn3X2q3ukd8K9Zga9nccW7Jtg/eagJaEfGZ7yK
	 5r+AJ1TG1gH7XXlSduCbmTLoSUQDVGYZb1bdi0ZiaM9+/9EFp7cEINqfrh2HuEL0e14MU
	 pAFQU4FU23NspRDZmEZKZ/WsYXXT0mT4uVDfnK+xhTF6c8YxUTMFEAoTTaXtyzo8blA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ilNgJ3Sn;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE9606A8BE
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEE9606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ilNgJ3Sn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1206759a91.0
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=ilNgJ3Sntu0pY6pPhKI4uGJFNo+SlMecdZqgvb4KrTI7WLdZO971A0V9MrNandO28S
         3vq7hz/1ioS8xtDUN+qhNyWcbsmmyr7GBo6THELHDCEv1pF7e2vj/AFb7hRivjqepu/+
         KGD+4B6G07KrlhCpXD1iQRYOllpYE8oNrUeWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=Ws313DNiihB1DFVwC0YvIcnHti8wBVc3FfoFWLx4WxaUibCbeINeNVr7dkVatE50z7
         PSYNUXtNe4Fzrb00hYbaH00JDyzsrtvfKMB0Y02pA/AVXQvwJHy8v8uy//Boxm0HwGwc
         WiJAMNiEuZpVQailQSYZb+5fxRqx3oIQOZ0RZ/beiIC1UgLhzRbh4p77gua7wbKG+u3v
         +B3yM2zUio2VHLODChhgYjz/I9kliGN/DTshitc0FtVQNY/YinHj0s40H4fSfmgM8WnQ
         BXU8ihHesGgmlGk4Xv3Hm/tyQ5ocPnnmrbMRcitOUMMSI45OPsyJ/x0Qq+aBY5fyd50e
         2gyA==
X-Forwarded-Encrypted: i=1; AL+hErEiVuSbmWduINbVHnTvYBj2ZVatxEjC/htD52Y28hfsLJ9PaV6mT5xI6i7LFXGCuYupBEMdjsP1VtYhXA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8hlEtYWSQdK/2ImuE6Kyiu82wcHPzb43bGZzHeOwYhplv+l6tF
	9tMEnpo8iVoZ3AZdNzTL89KWhPcDPhYD1ihSjxPyePSbtPWFfVs3sKUSIo8uVuo6u10=
X-Gm-Gg: AYBFou3/vdoK00T69+LB2CwmZq0GOIxGJnU9SuBNpr3Z1+o4MXU+JS71zLIEAA+xJxB
	2KZuP3b7P/K37bhskwdHGk789fX5PWkfnbN4oTh8r9CsOhQfm8FqOQsVYwhutR3I3zLYX0M/g35
	0hzF/6XzlU7nxWaen9Bf/NN/2975Co4ysckLc59dtix1sWUAxgNA9Uo3qMDoY/9uZGmcEwJMu++
	ujgdMlrQisITQ435NeSmB/GYi/0/3Gu2gYq908NQDSslhe1PhdSFilM9P5slrUx8EgX4V9kH39g
	00ujHwtaOi4zVE3SWAIjQJH0yptCeAWrIUblDdTdh4AR8pb0WBidgeYFutDFQPNuNVfdhWmn1i6
	224J5j6d+pUz9vLaIwCKD8MuXGSGrYtDvUmLMtC/Xc5j+uZahSTHV7pIWvRBFafxNfKbiQvCKTF
	lPu24rUOrGnEuAOu39gXNsMOVCKbnY6/EIpuS7R9TPz/MLXSTiV8btBxAO06QdLxS6qDd94N5V8
	5yg7E+T0xu6SRzAiBgVCe5Hb3qiZP/V7pc/cu3Qin8a8ECRwb2ztiIhlh0fwcJVTKKMtVygKREW
	jhclKzzQmLInUs5MOoTZ7RZG/aVtTyY1B8EDS+oc7K488OtpqV9jn3SkdRkLkyiV5xEDFsuqeoH
	oJ9iHRAQjoyJzRVK2j3gV24CEmIUw2xQ1uWVO2HNb8tZKEPKTDj1DfOkCNZ67/jpkp6emK0ye+N
	S0qPU0IwSBoDo1mM0RgoAJgAWZnpCpSqScoGtnW6W9k478BAw3RDWu0xPj
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
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
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
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
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
