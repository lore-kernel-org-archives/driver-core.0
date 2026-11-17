Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904007;
	b=gvzxfBwSPWBWP5CXozc6do+6A/kU1MUiXIBmM56UDA03o3esy9+lHcFELd2yu+C8C62G
	 NH/J65k94Hw/at8PQiumAb62NnwCrhHyqWTZ0U+aPAVx1lmI6NFunsZABfIKiYoc+u/yM
	 PR+F/1bxPvSRlEQtKY4A+WtBqgTpE9G0cgri8yRLGOg+4gPr9yHZDJvcB1H2DKFrqf8pW
	 9C7IRGqmF/XbNECeoR95H6zpiHkAhVUFQOMIAMfciFtvQlYPnqjweNeeSO5yjb8bXjpgl
	 GTLdPMjrcLs4awG8n09Tpky0zpYOaRl46gtV0nwyQ/TKpD2bTvEHLdnVXscfDtoIj1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
	b=yBwBS2QvmuImQowUNeKpAeCnmLNfVPywuWyFwhNeV+tGtD+2k5fBJFuTej+uRYG2XxCb
	 C+yW3FS3+XdEpqX4IfUohfeMu876hX88V/+ekCj5ZgQZYeFTgWqcVRj5dlgIVkdiiwXyy
	 YyZGrdUxsiQOIvO+46qie7zxYxlK2teW8SJ2jG3pTkzBV7BW7oHhWRIdiqf7cmFcdnuOT
	 8GKiAWU0P9VI7CeWt9hiAjQvU6GOYHkc3HNBMR5zS6dAXVgLSiciQvk+fZXFYySeAyhhL
	 QUmeJr7qcolItgrcj2Ne9B+NiSfayTKkLbX+G7pQBYiRds2ux6kCGDgr93g6FMFWlCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="UKx/RrPm";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C6E606A329
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C6E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UKx/RrPm
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso174955f8f.2
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904004; x=1795508804; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=UKx/RrPmhTGldtHcfNG1qU06hYbmnYn6ZCuGn4+mgezWIxVLxDzivpXn6Vdm8/jTeq
         rkLosPz8rrOmfca/qo6oc3FA6PSosLfoEh6amUpvZmrfz2vaxIR5gCAgV6vOXoxrdF6S
         ywgoLmnbiCyWISTpdApT1lx7El8xD2MZvlNS69BIkgbPo4T1pXiil/kIMSgFWS1eTDed
         jhQkUclN+rXRAOcCLj5SaNCl+w9clNstd6Ti45plGw4Shd7+4/vjtp3IgtVeyFsrSSzP
         XvLxVPUJG5W04x9O+YEr1sJtRRNtNb59KKdhN6pYjAoASAxuPjxC6jzgtPFHNxsSGppk
         jlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904004; x=1795508804;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuUcsMvbqw5dxN0Fzu67367bPJAUtTqv88LLlRQCTVU=;
        b=hWpooltXd7S/OWzuzreUh83KcnqaYcYtPAxrkmTPqWHReIUMZROE0XP94m2PVY+us4
         wR0lQLz0XAsD9akkc2fvhMQiIHzTze59lY/xofp7+kNZGbGYHzZI/T3lIHgVaoF+YKZy
         x7OeUT43RztpYzJZr2pb4KcMHCwFF8he9GEdVtKn6PaWtF3us6Eh/5ZeaQEdPr01cXLP
         5WRs620X/MC6qkX4TBmLZpeAN/aXZoscfXjPc0p3HCy3l3O7MbiZo6e4kDMmUztAK3lk
         ShefsWp3rgxVO7dPmrtuimdctxZ4ksqsYZuuSy8fGEkE40VSzSwm3MNrCmL2srjxiH8t
         z8cg==
X-Forwarded-Encrypted: i=1; AL+hErEFjBlvNIR4Ojv1ix+T5bQAwCPOGp9dY97PlYM7RO71ySogms+iYzhY5hMAM+04X6OmzotUEQt8YIudoA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+3m/xCSVInwimgwb7SHUKFN4Mjr/Pc/ZV/mEdQWn60eYFR+xAw
	+fWTqGZuabSjNHcMQZ5ddeLe4xBHKoC497QQYxN68VqdLIB/RnMCmYgNRm3tr7TKOwQc
X-Gm-Gg: AZFdTZdy287hh6QnvV46LxbLTxudfBtV0fSK5lsnohKkGsINyE6TpA0RC5yavik2Gpc
	cq+RuDu01b/O0VnU9CJl1MTRZVUKYUJy0qqBSLCj1w4ZPdBM6Qz9LN7Paaa5AELMNSWdBvsHHEM
	dz2dKMTGomUlBH6ANNAMcvMYBlwDjQLbd1C5B2lZ/9J5hiWWVIziZYL7nvHaW9oEUjbyK7u6Uyn
	eMytsuUo2hBrEBuGhKMBhCbWFoSpakW/WFusWbKeE8160ynngRpvYSTfgP2nTS+hW0PVPyry+00
	Ee3y2KceLkBXKOA6yQcNpNBd224JVQOznVKM4vI+hDr/bKBXPkNLJ7IhP8VUX6Yirh6Dv8M7MC5
	15LdKD0VVZs7kcYJgE//hJsy34yXlZ7fElGcZDHu0RXtrgt4k66s/gBZIBZhHnO6V9AfWDEHh3K
	Y/qTjZk1J56y9EB2fG4jDHXM3guAOKpiWrXvzPsy5WBXePGfe+y7orwocvDq7XooHLAlxPYVfDx
	KIT1vw36nYSUoGSZNW5RIMVp5Cr7bl0+wI3yEkjg6nz1zPC0OhFpyqcVOkykHTet8vQ402h4p0M
	5pORy1wKBxeJHa26Bxp+hvNLfS/f+MU0kwDvI/FArQc0x8xKjgaKLNa4jzJulwdkY/+5I3zKHA8
	kmKawF+p0FE4iWkXY4piTGyOZaZzGuEo0TxNYUs/M/6CJDcT/EAeNozDG
X-Received: by 2002:a05:6000:2009:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4a52e6a947bmr243585f8f.29.1794904004601;
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm977858f8f.8.2026.11.17.00.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:44 -0800 (PST)
Message-ID: <c43d70badf41f62f8e149ac024bab3df979fa756.camel@amutable.com>
Subject: Re: [PATCH RFC v3 11/44] failfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:26:42 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-11-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize failfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/failfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/failfs.c b/fs/failfs.c
> index 437cdc981c2de..f03334f361c0e 100644
> --- a/fs/failfs.c
> +++ b/fs/failfs.c
> @@ -3,6 +3,7 @@
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_struct.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> @@ -132,7 +133,7 @@ static int failfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fc->ops		=3D &failfs_context_ops;
> =C2=A0	fc->global	=3D true;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
