Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794849420;
	b=mnQPU152xsD1ubfGuoQpY5PFScva590e71m8uhhHGmGemujfUN6HL3D7QI1M4rPfZtE/
	 5stdYsUpd2hUOayM05hDeiv+NvCfWQO+l6YJCb3qK6aVG0EmYfWw0+P2gz60IVVt5nhG6
	 WwQrr7spxfWsOwgd59ME604aN+CH6v/cNt3YBRNejjo2WS71k35ThbA4maPWMIwZVSl8l
	 UzUNIcRFzDX1zerKJTdnw2+RKH63cHw4eb29WGnnjapHYVyjD7bXA030OJMNksb55YEaR
	 yzB8QgYttN1SLBmGOzVu6Pr/BdzNP+HQwUvfdsXIf497ZjmHg4063T8BwkKT4FFp4Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
	b=kT8pPqL5S+AHamovdNebhrLr8AL4rDv/DuUkawub1Q2rTEPnC22XeH7SrZq5MzIJT7AJ
	 pCLb3qeBzgchngruIgO/Yl4aepfybGTD0yXMGeFTsZYcZ9f71I0bFBvjP4Fl3pu16l/9L
	 QMNNbBF5gzK94ZzqQYHq6zKnjBMJG85nV6EckCOa5wRQVh6kDJaRDE8xPY+EGF3I8OP5k
	 TKp0GVAbzWOqC81uGIuwviyBUSxZjeVcV30ebNEPU1GP48Xcb3ULVIvruFWN2R4uFLCy4
	 lNcwJcJ9Y/NNQn4KY3Ahly90G+fp1WfTYzVOSt9aH4NKPLPYAogk4phfPUw4faPLXMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rijk7zwv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67DD606A89E
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 17:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E67DD606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rijk7zwv
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so5737917a12.0
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794849418; cv=none;
        d=google.com; s=arc-20260327;
        b=Gga4Nyp8/6Xah0YtfO5c/qjigSkOs/tSqMZS0nptLBDx4V0PWakpCz+82QpnEiZJkF
         gTKz27I0NJfsNetN8bqmb16XWCNNdVK7o0RQWNk0etFqIpkITZ/ejGLC33v6YgkwTrX7
         yAFR/UqH2rAnqPCddLSve25VWudA2xdDNZor8APIsOZ5jCzCauM05BrnrgTa3bG3wVfR
         PFtY9yJzc6N3yIhgHCpXp/pKaICab2gA2H+oMM1kVfGBTYK8at9oK/zp7BFTneUmyvLR
         v4P0kaRAqXG/CEBeQoRHrlYZn74FTzgjg//vhglK30Lvwo3ugYNszzCitYdc/JCd1cwN
         SFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        fh=cgfOGe4TvJa7r+psSOSxG45QVoSwdyNcSIAbcLK90xw=;
        b=QEefauscp7hlwx3tXscn50PPIR9/zx7mzpaTswJtgn19lCo3BTfMdCkQ33BmmnCRwc
         rR7Wc4ZBv+7mh/3V8BzcK6vdxXRmy3vyRaZxJpa7y0Deozit0Gj1MaYT8MntpfY0bS8G
         GEM4Bc1AoKQUFfgvz/iQjSVLeNhsVooBETU9/95B86O+qrEfKIid8t89E1+ZbPC4AQ28
         OVjXlJEZqgGqwB0IGe2BneTNtF4kVO/tW4c/bcXvWUVGxNDKjrVdJKvSzxrt5M2Zyq53
         SokcCS7XofxOzJcIm2pkWJwGsi7o2AnOml+LU+yfw4rdxFCYFLARizdopi6EiVyY38Q2
         dzKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849418; x=1795454218; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        b=rijk7zwvxvIN2K/SO4BzSPDnARxVE8Hp/iNu9dV8/uKqxAYxhlKb92ELGOg3G857hw
         XADzmQKP1SQwSXLWcgSnZROMvBsJNTqf2TFOydlXoZU/Kj3x5eiFJ5Z+4maNOxf9OK6Z
         v6WOrCmbk/N12YoMk5/UiW85Zp1RR8EocRBVQVipzFk83mJ/VB0QN/VxMvc7cQETzdPP
         S0ZtiEFJaXIJK5iaE4gJ4CZORpxE4LLgxIsLhoL7/vGSp/yGY1EAWPb4w2QoztQdWn57
         ulvHofyoa3bctRJDuE7EEum55vjWA+IEki3y98AEaGtNOSVPxR3JnU7DuuI6FQn9tsCa
         IgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849418; x=1795454218;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvhlwTnVB5qObUR1donDWKQFcI5lhmN3ZPbArGLp5LQ=;
        b=J4j6QyfICtQpE+h/w/NJwbzZKSPTPW+4FNhRtq/88EbfUkaVy3WNq+/jmoAYz5P9TZ
         D6E8tzOH7bshMbNZzeEWvTscQi4Mh9ST2XYotYTJxj74AGUIChVcayS/dPFPy6CKZ8b+
         59TmUNx/bv7rgUmic3I4ZkGS7uye++xRcO1BSbOlDS7/FrTucegaecdfoHKWKWOu+Ub2
         JTRcVMDP0gjM4FK6gJwynHUwHjegI+8ppQmkTr1BLQXClr6cCM27N8uP80qh2ew4B/SW
         sEpHPGApDmsUku1dhHzo+0yDcxsG3jCGNR92lqsix1EG1lfBG8WCiorEqzDXcdnQH9Yi
         Y2hg==
X-Forwarded-Encrypted: i=1; AL+hErFNQ5e/VDtJS9fcNhWd7l/t4OM93f//u5mYAw7XzGHoPlF74GIR/uZOeEE96UQrl2td0JUkiiqYQ3u5sQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+a4C1e3qZlhiyGSi9KjjgSqU+Hp0hvEObtWXJi5fCQYOG09PVu
	NJeM/0XuLw7sX2yhhDE7TntRsSvWP3DmsrspfrqQGLE33gfFq7w7aLn8QjU+FJcedHPh2HkFyPR
	V+mQW7lZgMNVwzz/KJsUzlL8HdIkETuw=
X-Gm-Gg: AYBFou0pGLDFPiETubZKtW41gQ8Jd74wqum/0fY0/08M3P4dRoxMjULsLfkXENWIIbJ
	6YJqK6yukAHONFGy0cbzlDYfUZjRHXaeZp2j8HDYZqJkTEuLqKq3TKym6rQ6xavh3FayL436eTE
	wP6vmfYKi2k+aWEyAKKg/KVBnCLMCfEbUWUhzAM0F90DgcFvbU4L5xG0pgRlqZAsjr3nDU3qavZ
	GDqx2dqtrIyNqQ263P5xCoVabvDN+YmBB4mILuKVuIDpGDHC0PhWN3OS/Xj0BvKxH+E6y1eW27h
	sDPPwoNwldX/YnzwgveU8VwVT24Y1uyEVsCyWNJYYHdFg1Bz6l9bRxtwXoe25P5W1KX30Ew26wG
	qV8beP2Z8fQ+UxuRILbWunJ8bCH+Z7LoaT/wYf3ADn3AcPmzrkiwB3aS8rEqoAfM8E85yHf8vnX
	8lvQkt8MUoFgELDL4=
X-Received: by 2002:aa7:c258:0:b0:6b7:d69a:a3d3 with SMTP id
 4fb4d7f45d1cf-6b7d69aa8fbmr5089335a12.39.1794849418257; Mon, 16 Nov 2026
 09:16:58 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-34-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-34-8cbbea1cf34f@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 16 Nov 2026 18:16:46 +0100
X-Gm-Features: AclHuK_s2Kpb4OdbgPngYJl9gLHjfhlAmiJMqLtxRnpTDibz-Ni4SZJspSV9laM
Message-ID: <CAOQ4uxjJVgy-skUbbScfz=eAEATf=iMpqRHNshX=eKu3oiwnrA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 34/44] selftests/ovl: test data-only layers on
 pseudo filesystems
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:10=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
>
> Add tests that overlayfs refuses data-only layers on pseudo filesystems:
>
> - sysfs and procfs via the "::" separator in "lowerdir=3D"
> - sysfs and procfs via "datadir+" by path
> - sysfs and procfs via "datadir+" by file descriptor
> - tmpfs as data-only layer
> - sysfs as regular lower layer
>
> The last two must keep mounting.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
>  .../selftests/filesystems/overlayfs/.gitignore     |   1 +
>  .../selftests/filesystems/overlayfs/Makefile       |   1 +
>  .../filesystems/overlayfs/pseudo_datadir.c         | 131 +++++++++++++++=
++++++
>  3 files changed, 133 insertions(+)
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/.gitignore b/t=
ools/testing/selftests/filesystems/overlayfs/.gitignore
> index b343cc430051d..e1410fee2269d 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/.gitignore
> +++ b/tools/testing/selftests/filesystems/overlayfs/.gitignore
> @@ -3,3 +3,4 @@ dev_in_maps
>  set_layers_via_fds
>  idmapped_mounts
>  automount_in_layer
> +pseudo_datadir
> diff --git a/tools/testing/selftests/filesystems/overlayfs/Makefile b/too=
ls/testing/selftests/filesystems/overlayfs/Makefile
> index 382a59bda5e70..ace75f5627e0f 100644
> --- a/tools/testing/selftests/filesystems/overlayfs/Makefile
> +++ b/tools/testing/selftests/filesystems/overlayfs/Makefile
> @@ -10,6 +10,7 @@ TEST_GEN_PROGS :=3D dev_in_maps
>  TEST_GEN_PROGS +=3D set_layers_via_fds
>  TEST_GEN_PROGS +=3D idmapped_mounts
>  TEST_GEN_PROGS +=3D automount_in_layer
> +TEST_GEN_PROGS +=3D pseudo_datadir
>
>  include ../../lib.mk
>
> diff --git a/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir=
.c b/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir.c
> new file mode 100644
> index 0000000000000..3b59fd3e9f5c2
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/overlayfs/pseudo_datadir.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "kselftest_harness.h"
> +#include "../wrappers.h"
> +
> +static int setup_tmp(void)
> +{
> +       if (unshare(CLONE_NEWNS))
> +               return -errno;
> +       if (sys_mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL))
> +               return -errno;
> +       if (sys_mount("tmpfs", "/tmp", "tmpfs", 0, NULL))
> +               return -errno;
> +       if (mkdir("/tmp/lower", 0755) || mkdir("/tmp/data", 0755) ||
> +           mkdir("/tmp/merged", 0755))
> +               return -errno;
> +       return 0;
> +}
> +
> +/* Mount an overlayfs with the legacy "lowerdir=3D" option. */
> +static int mount_lowerdir(const char *lowerdir)
> +{
> +       char opts[256];
> +
> +       snprintf(opts, sizeof(opts), "lowerdir=3D%s", lowerdir);
> +       if (sys_mount("overlay", "/tmp/merged", "overlay", MS_RDONLY, opt=
s))
> +               return -errno;
> +       if (umount2("/tmp/merged", 0))
> +               return -errno;
> +       return 0;
> +}
> +
> +static int set_layer(int fd_context, const char *key, const char *path,
> +                    bool by_fd)
> +{
> +       int fd, ret =3D 0;
> +
> +       if (!by_fd) {
> +               if (sys_fsconfig(fd_context, FSCONFIG_SET_STRING, key, pa=
th, 0))
> +                       return -errno;
> +               return 0;
> +       }
> +
> +       fd =3D open(path, O_DIRECTORY | O_CLOEXEC);
> +       if (fd < 0)
> +               return -errno;
> +       if (sys_fsconfig(fd_context, FSCONFIG_SET_FD, key, NULL, fd))
> +               ret =3D -errno;
> +       close(fd);
> +       return ret;
> +}
> +
> +/* Create an overlayfs with "lowerdir+" and "datadir+" through fsconfig.=
 */
> +static int fsmount_layers(const char *lower, const char *data, bool by_f=
d)
> +{
> +       int fd_context, fd_mnt, ret;
> +
> +       fd_context =3D sys_fsopen("overlay", FSOPEN_CLOEXEC);
> +       if (fd_context < 0)
> +               return -errno;
> +
> +       ret =3D set_layer(fd_context, "lowerdir+", lower, by_fd);
> +       if (ret)
> +               goto out;
> +       ret =3D set_layer(fd_context, "datadir+", data, by_fd);
> +       if (ret)
> +               goto out;
> +
> +       if (sys_fsconfig(fd_context, FSCONFIG_CMD_CREATE, NULL, NULL, 0))=
 {
> +               ret =3D -errno;
> +               goto out;
> +       }
> +
> +       fd_mnt =3D sys_fsmount(fd_context, FSMOUNT_CLOEXEC, 0);
> +       if (fd_mnt < 0)
> +               ret =3D -errno;
> +       else
> +               close(fd_mnt);
> +out:
> +       close(fd_context);
> +       return ret;
> +}
> +
> +TEST(datadir_sysfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/sys/kernel"), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/sys/kernel", false), -EI=
NVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/sys/kernel", true), -EIN=
VAL);
> +}
> +
> +TEST(datadir_procfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/proc"), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/proc", false), -EINVAL);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/proc", true), -EINVAL);
> +}
> +
> +TEST(datadir_tmpfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/tmp/lower::/tmp/data"), 0);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/tmp/data", false), 0);
> +       EXPECT_EQ(fsmount_layers("/tmp/lower", "/tmp/data", true), 0);
> +}
> +
> +TEST(lowerdir_sysfs)
> +{
> +       ASSERT_EQ(setup_tmp(), 0);
> +
> +       EXPECT_EQ(mount_lowerdir("/sys/kernel:/tmp/lower"), 0);
> +       EXPECT_EQ(mount_lowerdir("/sys/kernel::/tmp/data"), 0);
> +       EXPECT_EQ(fsmount_layers("/sys/kernel", "/tmp/data", false), 0);
> +       EXPECT_EQ(fsmount_layers("/sys/kernel", "/tmp/data", true), 0);
> +}
> +
> +TEST_HARNESS_MAIN
>
> --
> 2.53.0
>
