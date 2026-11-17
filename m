Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904513;
	b=jK3/m7ry1dIBPQSH3G6O7PARpuUBX7tq1YNvHVSuBcAznKPb4+p3ObvSUKulbH6YR701
	 DPh6ZhT1zyo7hvZob5RIO4np83FhLN5TmqZ6IKaP0nlq7SFzJUnlsADWbDB+pU3HPHg5j
	 OvUFF6b6SB5z6F+TQFnF/W2B7gFtTl1cWiSKZE5z18nL8GOE4tl65Nr1nbp15rZVddp7z
	 vfoJnIULl6wR6C8HOKmSKinST0kZkLrl7th9zdEhu0bFtNPUdM6AJxw1E+c2ZhswOWW96
	 I/nFHjzWLI2G6Gbjaj88lIfOBRY8IYTlkyuxSWTHU/dlP/GtQX4m89MwYKnLfNoqAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
	b=lV/Ynlsbty5ohekzoTW60oO6b7QCHwwckadOo3F5zMqOJBTkaROdJjHNagte9q+xoqAI
	 QbBuifTsWLzrO6Jc0noZagPc2hbRATkNDpoHZZPGkoqnT7/MN100Fko4+KKxG+3obBkQB
	 2xMxx/MsqIswsaqzs80i7fCoALkVYCIjYLzrYvbTc/mZjVcc0gCay97tZgFyLEZfZ8/tI
	 C/klws6kS+wSQhV5x45a50jgAFIWKLd/z4UOFAAtAmTA5aydy3p/YbQ53MjnJgdEoeWxZ
	 wCMUp8+Jf1AOCOFeoZO8OFgLFRn0A6hPxg/xNjDA9JFRAKLxBPznRo1DE85iOJ60Tlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gDWwaTQp;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE24606A897
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE24606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gDWwaTQp
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so506522f8f.3
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904510; x=1795509310; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=gDWwaTQpVljzKPt0b1i12p7H1TZf563QmfedQ5NrN9tZKYATj1Zi0/KbfPOB2c9mS0
         dnBq5H/sWRUXlf5znKVZ3+w4LsMjH8xr0q9nuvX9AkfaAZjg0d+eMaQwPq0fuXFC/hcm
         xxh4RNGlYMYWbnlORdg+Xr6rB/kp79Lct+VXcJmAmghQV+Li2GIC4yhWrQbyywmL4FK3
         V5PvE/qYYZmLwJx/hwYtJypHKGG80cEWjq+T6tx25YZQETdUyuFJFvGiyZTjq1gTinML
         QDXCuK/D7WqGiR0SXmPyfYa7bTkAxIJOKNdQqDgIAJGmnmiNfCdsYa/Jq7dH88fyoI0y
         TgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904510; x=1795509310;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cVfVc99Mj9JzDjRqkRlx7bbwk4z1TaP6S9xba6j1G0=;
        b=SICCqvxn4eYNvgsu/+D9GYDMwUtG4YJGz9nAuzKLCCu05m42ENOOp1SNZGFFapgdop
         l74CKzK5kURfLXGBAzZYBNiE2MoB8dQgbu0ZnhTao9xBGKtpQeiPCD+g65PcdG1mTP+U
         6Sszu2pk9oQNca4tUx04IrLHAhCI5yCk7w9UCKpspabhmzkvS8cid46lDwcP9Lh4SEqT
         Wg5ApthlV4bEFVwQfS9t2w48fl8cu1EmE1CQyIMmjnlOk0om734LBJMsKC2RObeXQ4/z
         2eg1g9JyvZtU4kBtZZW5KXjKfj3ixpTXpw820jk8F9Yem6Yc+Te9QQ1k3sqLXEBP7yhV
         qo2g==
X-Forwarded-Encrypted: i=1; AL+hErEFe8UqdtDVGHCsHd13vVzZ/PtZkpoEQdomXI0aAgoRdeu/nJyM7OTFqAYyrdgZK9zxWxD6MVNUy4Yb7w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/y5zOY+VyGL097TkVOR5JkJ35Im6bbXJ3Z2vINtXljciwnGRC1
	z9jk+dY+9M3rHwG8MDoeKUfqKA9AxIxot7NpRbdPsmA2cbPc8xfRHF5p5MNP0Rj3TNgI
X-Gm-Gg: AZFdTZdj6eCGdH9loWPhapQ5V1dOJM8g/1+cYnIimXi/Sn8CYM6BLi02GhEqC6DK2lg
	IRmqSousxvmf3duR9/8FsqFi5ANP5P3IPVuVvjLt0Xg1NHs4L5zuUTK7Ko889FSAi0WVWsAOs+/
	h3qe4LIMbPaXnH1QjiDkDEeRJXOJrowIAo5CZutggj12zF2qG2PPRbo2/W5m9Yop+xrRcXH9330
	npnbr+eMEzG32KG/jMcmrYiIgZPX3KdrszKjvWSP6Hq6q02ixM1LCHGd4VfuLnc+rkbgZDgrVJX
	TeVjXOLmCIni8grjle9h/Nyi1IRPpKxeiK42gNTOXm18pk6LYJ2Hmlv69DViBRr/qRr3bZnjRFS
	ySfMPBxqQHgk3l/C9xIiZu5K9Yu+B9v2MxLeHk23OHdF6Eu04GILtUhMSNAaFtjKn0RG9svR9Pz
	swIk+2Jnoajcx2zWA3NZrRxYWvuwCzjqNmrmT79C6H0B4Cu741SymVyHA5YPXauax42ie8TkY7g
	jjzaJn7DxA0zPt/eUiTwkoRFh3UaAK3Sjt/WyrfyPBCyMA+mwWvDaJAogZ7U5gkjPpBJx0OvI5F
	T712D3Y4PsLiNyqDYbJVjBacjq8ahZmDtmGxnVW+LfIej3p8VZMfXBgk5ZmVSK2+REbfcO02LUH
	yfwfp90gK5vJfy91ik1FMutDtoWhQbK/7ySFJCeryhjlvV1kDBfYdfYC6
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr26569239f8f.43.1794904509932;
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm26338505f8f.36.2026.11.17.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:35:09 -0800 (PST)
Message-ID: <b0ec2cd8f9b7a6a2e4a54c6df2fa897bce068cbd.camel@amutable.com>
Subject: Re: [PATCH RFC v3 28/44] ocfs2: use fc_init_pseudo() for dlmfs
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:35:07 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-28-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize dlmfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. dlmfs never holds executables or
> device nodes.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/ocfs2/dlmfs/dlmfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
> index d3bfcada3e3bf..1789ec96dc130 100644
> --- a/fs/ocfs2/dlmfs/dlmfs.c
> +++ b/fs/ocfs2/dlmfs/dlmfs.c
> @@ -21,6 +21,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/slab.h>
> @@ -563,6 +564,7 @@ static const struct fs_context_operations
> dlmfs_context_ops =3D {
> =C2=A0
> =C2=A0static int dlmfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &dlmfs_context_ops;
> =C2=A0
> =C2=A0	return 0;
