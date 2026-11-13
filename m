Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564161;
	b=IOWDN7k5DYpM99PUt8MMhkG6AbFN1MOq6cODGE3nciCjEAvRdG36UhXTgCLp2tyLurVO
	 zT9ZePqXe2aAKUCpbfvk9rTbueYjElSDGeBAL7n9xKoj+8XsjQse+m64ekxkoDvJPzSm2
	 0fGaszcRDX/+7dzPgQPm+5201l+Syw7Zl+ebGJfybKT8MYlih+PdlaRz6RUUqszpCe7yE
	 PB+AECcrLxsBm9EUkEZdgoYPCVs4SggDufSNZoD87kf5FrRw9GTpnfXwT4aiiMQz4rQ/t
	 a5yhMf6ozFk180fEG+/G6upIdc7on1LaKSUu3ZZf8u96tH0D53uN1Hm0wZWk40ejLcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
	b=FbNbNGW44HKxgOdDayz0pRpOGk+WzUra4kkwE2E0U1eRiz6hlcm2w1T0hysOr/tmVYlJ
	 Y8wF1EZYT/STsCHjk4/MZxs66gk250mhfRarRY3YU/nlh8xACVJyEcqRIFH2X+ka+Ai1H
	 NAADcRiccX66EkUsB7bbqosQ/h6vvMqHB5SLkxAH2jPNgfmr87bULMVWW9Mfx4dMmrFkW
	 FoyzJNnJ88m8oQoIzogzx1bYKWWIFtQP1+Mg4C3hkg2jXSsryxZvDTi6wUcCM/lq5OgWs
	 wR+jeQrd+DhkqXPy+LIiePkpD/8Am2JoEKICjBsMBjkDkcpMMji9xaR1PwSyIG5Snjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ntuGkCAM;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD46606A899
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CD46606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ntuGkCAM
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c506a231b88so130912166b.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564160; x=1795168960; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
        b=ntuGkCAM4aWXV/nBhniX6yE94msfC9IfknTe2n/Iule0D/GO9gcIHSQutZ67lnyJXg
         IummEkR2mfMzfc9caRoBsqj2KqL8bFs8PaJCLA5upvdxhyEXOxLYJArRNP+JzUEjSmgW
         QYP5trRdAl24ZhUIeORlwiuQTlccBdh44EPdTgB6BtpG+/5GXsQ7lGM0NlA19pep85pJ
         iQ8jlDOsi5i2kG7DB5N6OLIWxcwWimjpwZpxmMOSF6j51PQ5P7ZzjfLZAu8bASHnxQOx
         Vf9rIRBpF1Df1EKmS7Sryqw66G+/NWDu+A4eRn/Tkz4eUlqXTNGwprmz2dD5FNFjKxcS
         rzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564160; x=1795168960;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oHy35ptJ0fLQb2YrI1vdssfNtJpVRQvJ6BVJKFTHRg=;
        b=kB4HSM2M0irh7kvpVz8JFzHS5ZxgMjfvOGbtPK3Kl5joLN5r0TV2m/XZoCceeV4olv
         lUxYaDer+zc2CVQlUCDXCu+yasqcDhhijDMwkNNMjvLn0osZyHhy8VExBael4eTr4+Xe
         rdoUF8oGqUURtP4SkcodwNOJezVVazFD5w4K4mpNQgJX28O/oSDohlGdCtyo8BJxbYcq
         hT9i0tcg4mz4/3yjG/Eg+7QDA19MUqtvoV76pQSD++JfN9/przjusS+4zde3FEw6W8Oq
         nmaJ6TUao2UsRrcVirEXw9sTFK2Rd5eO4ughrJxb8SZ8V4JWaV6D3tzzhq3iJYSAwMRW
         utgg==
X-Forwarded-Encrypted: i=1; AL+hErEu810Sf8t/OKK9lFswHmh/gSSshoqUMCklN1rzVYKCfEC4eLvbARzE5V2GU2FYJnjV9XBNYwMXiVoDbw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sZgPgRYxKf0Z2+TAASetBOgXVqM933Q1B6QZb0xIN6QNzusPn
	BSmAY+9pX/3O9Qpz3TNnYgfCkPQkcxR6HHVsQtoHq7FEAuCbqtCotP9liZYfJQUVXdXY
X-Gm-Gg: AYBFou0Tb41H0dlnWJo0pCKFEQDaleBiB+3F0cGLSQNn/B6cujFMGztyQJI8ZfL+bZT
	DIq630Mm1VLg+M8t7Ckc0Bt7IVICc+s2FtDwKrrGDbhACKKyAPEka3ivxHrJX9MlOkJgNFihzkW
	TEQNk6JFKQgVuof3NjD70elMvvqC3QMxXB2OzuDOmHZkGGagCMd2THfH3YNCqYHeA4dYSxxq7wf
	DbUU5+12UT3VEp9w/aZfRuQgAn03snkSBjSm3248A4adoDQ8HiukzkH73yf9lwQagGtXNro/qeD
	4cTPYjvJEDRJqwCvGjC8hAb3uT9tiEh8hyFAPSVrai3ZeKnAVdsHaWWtSb/r1a/klriMaBAmq4G
	NE659CKvkfXshiHjCJCEunFQ+PFFSjYqwA/8HUiEawsf4cNuKnbsony7TassfLx4ZqqZviTie/l
	s6KDLvebv6Z2CxkdGYAUTPahh7o7mrkEXE77n9YSBcwcqElNz5BRrGRHwJM/rn2zSqcqJh5xjLh
	6AVMXCKwJokXtec5vDyx0I1nMKzTApwSX0tTyC6QCDYLbxETLOi4RT28OuIheCQRa015yORttkB
	j9iYmsiCwxRY5IyKR0waDe3Q3dayslP4P0IOt9E1ZP6G5Rp7GPXpjRttoLHD4PA=
X-Received: by 2002:a17:907:7b93:b0:c29:f5d5:5a9c with SMTP id a640c23a62f3a-c509654de57mr163595166b.38.1794564159104;
        Fri, 13 Nov 2026 02:02:39 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23afdsm74417566b.13.2026.11.13.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:02:38 -0800 (PST)
Message-ID: <8c51aa1ad231dea30af06ecf761a971f5958d063.camel@amutable.com>
Subject: Re: [PATCH RFC 05/41] kernfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:02:36 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-5-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-5-4c998976c6c7@kernel.org>
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
> Initialize all kernfs based filesystems as pseudo filesystems in
> kernfs_get_tree() instead of raising SB_I_NOEXEC and SB_I_NODEV by
> hand
> in kernfs_fill_super(). This adds SB_I_PSEUDO for sysfs, cgroupfs and
> resctrl.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/kernfs/mount.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
> index a0be784bfb06..6b60d212b003 100644
> --- a/fs/kernfs/mount.c
> +++ b/fs/kernfs/mount.c
> @@ -8,6 +8,7 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/fs.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/magic.h>
> @@ -298,8 +299,6 @@ static int kernfs_fill_super(struct super_block
> *sb, struct kernfs_fs_context *k
> =C2=A0	struct dentry *root;
> =C2=A0
> =C2=A0	info->sb =3D sb;
> -	/* Userspace would break if executables or devices appear on
> sysfs */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	sb->s_blocksize =3D PAGE_SIZE;
> =C2=A0	sb->s_blocksize_bits =3D PAGE_SHIFT;
> =C2=A0	sb->s_magic =3D kfc->magic;
> @@ -388,6 +387,7 @@ int kernfs_get_tree(struct fs_context *fc)
> =C2=A0	info->ns =3D kfc->ns_tag;
> =C2=A0	INIT_LIST_HEAD(&info->node);
> =C2=A0
> +	fc_init_pseudo(fc);
> =C2=A0	fc->s_fs_info =3D info;
> =C2=A0	sb =3D sget_fc(fc, kernfs_test_super, kernfs_set_super);
> =C2=A0	if (IS_ERR(sb))
