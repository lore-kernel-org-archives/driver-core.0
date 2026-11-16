Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830458;
	b=cC2N68kYJVAuxAI9JRvQpOV1eZ6j2cRDkF+TSe402MQY+gSSQsq2T4cDQr0SRX0nkzrD
	 zOsA+ODomAx6KI0tbn9f3fh0nTiU7fNIXDyH5tCbrX+E/hrYBoM110HBo0ugvA38u3tih
	 TthZZneBhPCNM5+pmMlNt2sd7xrYnDn1Z/y3mCb41Jn/c7tQOETLoFHwTzB9xFTm3SbgH
	 bqnnNuHr9a1T2sklB7iqbIvVxy85eNNzURP5xCN/4pEUX5x8ArdcHprYHY+YcN+QSv8jg
	 ymWHbtDPfRPFWQs0qzmzPwwZO6xAK9PR+Htxlm+Q4+mE8o4cEjA+WuE4/kml5aqG9/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
	b=fUgWNK5oXGKSEC7NHViSHQFfsXUGHN1IJN3IBPT0iaRJW7g2bJoKf0Ir/NbPayAV5Aw/
	 T6Lgqq5k6gs5z1j3uICANE7MAijWFBeyWQ4af7DyeRoqQZTbtEzkyDM/UntPE19lBT+H8
	 XnTXN01Pw0rnSOrHBnKba+adm97Usvolr9jwUi6E6hIBxanbpDlvkewgnAnJK27kbQzwE
	 jX2hMir0j4yD9mGqOkYvB8j4dDHdLXTqDwZUoFAlJZPzQJynVeCCcZihLU0ZgA40EU4Ze
	 UXsWeSoCNlKWfaY+UrPty26HLkmt8MgCkWfKae2wKyAaR/I/EjQtLlmOV//4bBezhUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CVWVNvSq;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD21606A31C
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD21606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CVWVNvSq
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4923b9fdd43so2415773f8f.3
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794830455; x=1795435255; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=CVWVNvSqZ4Kvef9qLV13IEC3wrRDMTDLd1UcYfVh3RelG4sKSQwdvnpgNda+b8r1CS
         eli/q4umBwmNIrBBRVOSKSN6xcvy4LUaUh2LOGQRiQ7hXSigawtn6iNVRbkygI3zV7Pv
         uTHA5OlJFK1RtoFT38tnvJ1gsUTqMy9BWqCDcZ9fxYE+WfSCGmwpZfpwnx/yMaEQvdU3
         VV2CJd+AJFB+qDkTKJIJpCE77NldlBXcjqe0PbecLfz/BOm3ZNYcchBSAs6OoGUXDJwB
         gNyEKrURC7L1yFfUoGyPkyybCL/CsRYBWTncrou+S+70FvW8ktjvogRu5VIIzmhynoEF
         EdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830455; x=1795435255;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=WAf1EWdgRoZeYC7roKKIEVeycc/RqvojRXanQ2CYVSWkv06AwXzqyyFSIY7pd7PoLW
         9GSj7Ew9IDQqdPEux3glCtRZzxBvfDU+e2So1AWcnYBYNeEQ1obprrSPPaNydEZW1MiC
         7XiN67LkPgB8G5V7v1s/xoGCumelHIn/ga37eXNc072mhuZS8YLnuQ0nFfAgpvyGLZRe
         3jvkZ5GjxtJe/vv8GrImlw3G4tS7DT6+e+5FgqQb2PFfMPzd7/eP1VDgaV2LQH7USTT4
         wI2ao0vndQwZlwOBiL3ZVLu/Hf3u81gLA803oh/STJyCfAgS740obSn0CzDo4etuFuYP
         LLmg==
X-Forwarded-Encrypted: i=1; AL+hErGcYpwPFZF1RvKl2MFS/R6g0Yj9iBw1HrYMBUxGYfvku3kqZNcs5YSaUh5LpYKRZXtieMOlhxh2eFOw1w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/So1a+SZfjN/RgmqTflBmse8ZEtlAHn8Cln5qbiGuhXMyWM4EO
	XdsKNu/v55fxsiiAWYKuxcpEBo+5t/AmP+O+Bw8tyYVCEb+KtsZV1b6Dt5N4K+KOks6mb3FoTSO
	ctzeAZ3uLzWinNhzuvQ==
X-Received: from wrso13.prod.google.com ([2002:a5d:474d:0:b0:493:3d97:6e88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr16698595f8f.12.1794830455230;
 Mon, 16 Nov 2026 04:00:55 -0800 (PST)
Date: Mon, 16 Nov 2026 12:00:53 +0000
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116120053.371591-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 12:04:45PM +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
