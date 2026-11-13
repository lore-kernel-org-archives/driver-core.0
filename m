Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564705;
	b=lYLw2OyF2dbWZ4zHOYXoCL9vKBrRecg3Xx5Z5BMFf2oFBgbbEz7gKEbT2asRzyVAfDiQ
	 cOS5g7PzaGviCmtGtO40Ix8siQiPu/r2SWP+LW0gC23qM02UTidVuFncVHUKdTgUOowtq
	 GwkqHsoF/BlB9Uvayxdi10rvjOG5PCW+T/g54XhdwWDw7tVmoOa8ABq/YcKjpZ8R+ViRA
	 F6Mb6ICsybPtvv/Mc45KxoQS6ZD4JZsJlwzNdprp0Lbx+zQpKcR3ofZHXN+GmcqJDgvwl
	 VLPPQhaGmogrpByIEq+mbsJKcAoSRxM0vrtusapxBIu16vN16z5ZMZ4a0Wb8Aa+qJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
	b=Gt09e4aRsWFIJyCUtvLs9KezWt4G1r00ZaitV0WVuFy3bhvAPRxgWb1+7w1l3IcdiYS8
	 0gaohpvqsj2vnWib0jOP5sO/WyooS/0Nd0Nyk1LwTWBlC/1si7kEEvAsa3QRFnI/Vk256
	 1mypCSlf0G7swFG0AD5I7AcTyUjjSYxPsJ53+Nne+DzXkOKXHo1VHONX8PIjfGWA8e8kE
	 KhcZljZ1C/MSeGeX8hutRmskwVfxbskpWQ6DjP5yz+eacDEiyZvoXWI/fFT/ph+2OXI0e
	 Oq0x3TBsNMCqzNu5FBoErM8Q8JZxcI5ek+4+jhm9u9vqbe2zrVWG9+TkLIlIyTTQN2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="j+p/KZ3w";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977AE606A88D
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977AE606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j+p/KZ3w
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-497614c95f0so327664f8f.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564703; x=1795169503; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
        b=j+p/KZ3wnPwEFYF7F8WvNMoh50Zte0ElviyUo8TGwc6C6lwi3UkoG3t4wDiSzNyX8h
         z27ekuYt+mUh3b4RDsAVd7R8UfZjBu9et6oDxa0Hk+9g6UEzsjKR3SCcR1lLNn2RKqz/
         mKBysjufBSNI4rMp25/G8cklC4oX8zwxCaXbZpIUuEPrvDU2KbULI/UcekyN7NSyNul7
         bzQL4NYVP0a9I3LXIMKCXexHeKjRgS6bF53RBQCLKifyU351o8xMfNMp6ZB8Tg0bjxvf
         K2c3ncZU39Ck0OlZu8ev4rOLPihGJc4ZyDSU5ryvBFGL+DePL3iAg5xr5/Np60YX/h7n
         S9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564703; x=1795169503;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXMsjTg9KyNTuX1cuQ9yr2iJq2/VClhNCtHhh+FL0ZU=;
        b=XX/8s2wHJcHtOamT1s6c5RnNfcqJk3jxXYQPlgSyg8N0XSdu/XrZATBkO/0NWSgu5Y
         XkILSn/oYUdX0PSROAE0Ueam15z90857qUsP5uTflXXGgzj0E9baYIaB2FAZAFvxJ1eM
         z8reYLml+P7aPp2Ciz0E57Drwxm9oZ8amrYsPhAAm+ZxZKnzT/9KfY4SvDPGlE6KkpQ/
         nhyxcgpI7B9t3C2NLntR0ZGySC7cmtQfbyyf811zPVjcw4NC5CYXZLkK1HFLdqf5cU18
         yATXfT169zl1ZRgpRU/rDUGarGcGTT4moa9RMzjcpJRtCvexUTkhr6c5w8VBJae1XO/A
         givA==
X-Forwarded-Encrypted: i=1; AL+hErGp6jhgy3Q+vLxdUFvBne2Oem8c7N5BFFPFpQervAsI3KmNQmyKuB3cuyWpuZJzHKK3EIEWYSd1WIK72w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+sLnhdIT1pSjKos+rK1txxJO0zO/wUhtxpe7HFJ1MfLV1FnWlU
	Gkck3Kj2x7XylNBz49iN6OGbY4BD72wXqykkPSk1XqpPZ/N0LfCsom6ylkCOXU0RnYgb
X-Gm-Gg: AYBFou3NAJd2ZHSUt3KBGXbSCe+0eAUZqnYHtCAPdZqMJWJPa3MAvIIgAUkUF++owry
	c+sA0/6e+Kfnd5VLkeJlzlJuj+G/vjTFYmzBUkirl3wHpHvW/gQyY7jbCkZsDCf2EQHfimEsfiW
	KAsG/+IGJzNm9c0OsxbBEBDnZ5weDuDdjbysXJFFMdvf7z5aAfYfnZOE5tt9XMO0NDsIWtmZqY0
	Wjl/v6RWolQEw38FZUPQJI6diofjInydx8Bw+w8fYjt3M/9CHF95VUPtWdugGpmToLSSSaZVaIp
	OSXABEIb45+K286eNN6jhV/x1R2m6nIpFVSqkdeR2JdbKNp+5lWshMCC57Z54O6Yqp/IjNsGHSo
	LNj30QXTJ+8uliNsCF0aC0hOP1wzokDWSiDXWLxKpQJ4GY8nFTtaRZJHeyimaoss612dSbLkGjy
	QliWDc316SFquKA4SSpO56Th7sTuoSa+DgNl3VnaRc3xf1uewswRHBnqOg8gNZQJj4s9dL1VMrK
	aXAnWgdbOwdOaevH0KSP09q3mqkDdAMxgh6X5E1jk4Jhakoh12KW14lrHcsFtp0v6Mvarv0nbdV
	6tc+dxFNTpjU/xr7/yJAfGWTMb4u/jiz4K+mOkKiq5wQdcV6rloiJW+1VnX1wMk=
X-Received: by 2002:a05:6000:2501:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-49c73259cc3mr5012611f8f.14.1794564703010;
        Fri, 13 Nov 2026 02:11:43 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm4931434f8f.11.2026.11.13.02.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:11:42 -0800 (PST)
Message-ID: <ff6d2a8c8623f5476d5c352dac1ad98ab3da303c.camel@amutable.com>
Subject: Re: [PATCH RFC 18/41] selinux: use fc_init_pseudo() for selinuxfs
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
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:11:40 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-18-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-18-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize selinuxfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> SB_I_NOEXEC. selinuxfs never holds executables. SB_I_NOEXEC also
> refuses PROT_EXEC mappings but the status and policy files are only
> ever mapped for reading.
>=20
> But selinuxfs needs device nodes. The kernel replaces file
> descriptors
> with /sys/fs/selinux/null on exec via dentry_open() which doesn't
> care
> about SB_I_NODEV. Android init however opens /sys/fs/selinux/null by
> path as /dev/null doesn't exist yet at that point. So clear
> SB_I_NODEV
> again in sel_fill_super().
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
   I.=20
> ---
> =C2=A0security/selinux/selinuxfs.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/security/selinux/selinuxfs.c
> b/security/selinux/selinuxfs.c
> index 310e19efff1d..d7ae853b6d68 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/vmalloc.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/hex.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/mutex.h>
> @@ -1852,6 +1853,9 @@ static int sel_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0 /* last one */ {"", NULL, 0}
> =C2=A0 };
> =C2=A0
> + /* Android init opens the null device below by path. */
> + sb->s_iflags &=3D ~SB_I_NODEV;
> +
> =C2=A0 ret =3D selinux_fs_info_create(sb);
> =C2=A0 if (ret)
> =C2=A0 goto err;
> @@ -1955,6 +1959,7 @@ static const struct fs_context_operations
> sel_context_ops =3D {
> =C2=A0
> =C2=A0static int sel_init_fs_context(struct fs_context *fc)
> =C2=A0{
> + fc_init_pseudo(fc);
> =C2=A0 fc->ops =3D &sel_context_ops;
> =C2=A0 return 0;
> =C2=A0}
