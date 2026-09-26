Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342439184C
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790411289; cv=none; b=g99JzvtTW7a3bvLmkjg3b29GkoHAlrj9ZuSGl4ezNV2AUWuDavEJ85yTXj3LegrxFpjvSiuFnReruEcJ8k+ixbKi34IN+vluYRrtfeFMuzLHY6d5QTyxqSSB9kLedZXETiUTKoNCyhYNY/lUd+OW6Lf089dVXHYjoNOnJHUUyYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790411289; c=relaxed/simple;
	bh=95Vs9hoaKg76Ufz/33WhtAeKWKx39eNDm61SF5fsyOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZ/ga/sDUedc9A8gN2zz0LcnA5Tb6pRk8STpb5G7AoKDUduFPLu9bog9/ON6QiZRqjH/KrKMnnhXdBzQ0v4VBxVFYfwrSFj4nf5o+DNYM4JA/kL2Glm5iGZGUHEM+/WplPoh4L4R/Lc+R8dJ7jPTDo9RR26LX2XA7aFCAnYXpXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MoKRh9N5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MoKRh9N5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so12029265e9.0
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790411284; x=1791016084; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tPXUTB33yRiVb0ap+iiavNUW+iiPbvO+JMKJab+k0Zc=;
        b=MoKRh9N5Y3+6pOfsddhE4TvTM/TfFVAW8KBX5C9zYBshSm0Tti7gcWG7yw9LEIgxPT
         5LiSTV31hsMgB76wZ0C8qfJ0MLQHGRlRhEHIsnUaH4bE3HlEbcBX0cyb/KPFR7zlZVYb
         CeLCRlsVGmUHQHswMGXuGYrTKpzw9xZbKsDnNjuirt7QlnTrvsxmhJ0Rt9dbRn/GElNG
         PiOueCwqyJ9gf2N2h+MtYVwXwr6phEWxNZrLiKoCMnvHDpNfrvGkoJfEx0rm/392EktM
         J2uIfuQfHgx/ijQC72B+sv6QP/viaMoRHnAMxpappf+oaaXQZTARoDmpjdiFnl6gThLT
         fvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790411284; x=1791016084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tPXUTB33yRiVb0ap+iiavNUW+iiPbvO+JMKJab+k0Zc=;
        b=ahbVqxwomTxe3MWf8TW32Q6jEn3Z1C7So+F0G4ZWSCrZBEUQAbsD+lYHUcGFZiOcCg
         VazTdiJqBM0D/5h1aDMJNUXnepb9lSO33aPSJ97Y916l9oxgg9Bl34zAZuCWrOnngaDl
         caL1Mq1VEGH8dRSuizjfuMmDgZgz6APfXfRjrHmkarH8HLKZM0xSwUrknjbV6Hm0kzfZ
         DGX/tkEem0KdVGSw3VmmB9IVtZwCYpeZ1YH51gCDufvWk29txusromsiPTS9RCikIArS
         GNXeAx13BD+aJc5PTskJ69EKFYBO/RCCG5xQfd8f/65/BveliGyqUZWSflaKgBNViSWE
         nOkw==
X-Forwarded-Encrypted: i=1; AKwUvBz6zVPYKMhAhESsmkug/rTjntBZOcb1mnvaSLj7EZsoUHFLbgTqPFH8iGRObrbpczTgWcXEPJkSuC5lFA==@lists.linux.dev
X-Gm-Message-State: AFuF++n54CaVOxahtDcoC4dDsMAZT31TqVhZfTIBjbeZQ9KlLZsex8lJ
	85gfP//H3oO0rKpWGq+2HrmFyX6Z2KczpsIv2Z2ofefkq4gvTP/FiY7e
X-Gm-Gg: AYBFou2bP9ERXkROene3lloeGHj4e5cEFVVU5z9yj8X2sCUgtiXXyq8sAH9/jPiOGMO
	L2VJNUokQuAgDxIA3n4BRJVc3JI1xAMImam/2quY+xbYT9hQMpC7X42aKr1JG0pER5ZC42BupOf
	AvijM24fUShEQR0tcr/DKOI45NogioVkA/3W//A+ZuZpP5MUO6ZXRiZf4ndgYwHBrKBu0TDEZ0s
	MBbWNoA5lZvBdkETiHf2yPsQcyNxWvGg66aE0h8r+Q5WmUAcyZydyGoaxKQWO2oAaXuMhbabmNx
	E73GJixyIJP5nfNGe8F2tLe0njIQtxVKRP5bP9/UDEpYzSOrJlByjyVdox+9V9oVIljFwCSeRZM
	tyzXkuBy8ed2w3gID5sQAWUX6+pNK3a4py2JbVea8rm70PGfwoFHiHyWpjhyuZofNfBegH7Zihg
	esyzFNxkxyTSQS0UbYr9EZPd9zNv4kRIWStA+NjO3/xM9IV/EzFun+NmcfU8gSOWT4W9qoABhec
	0mRc5ZPTyTmJZ1VRxqNZJM=
X-Received: by 2002:a05:600c:621a:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49fe7b52ed6mr138634065e9.7.1790411283366;
        Sat, 26 Sep 2026 01:28:03 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm12711265f8f.32.2026.09.26.01.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:28:02 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:27:57 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Cai Xinchen <caixinchen1@huawei.com>
Cc: mic@digikod.net, gnoack@google.com, paul@paul-moore.com,
	jmorris@namei.org, serge@hallyn.com, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	dhowells@redhat.com, code@tyhicks.com, linkinjeon@kernel.org,
	sj1557.seo@samsung.com, yuezhang.mo@sony.com,
	hirofumi@mail.parknet.co.jp, cel@kernel.org, jlayton@kernel.org,
	neil@brown.name, okorniev@redhat.com, Dai.Ngo@oracle.com,
	tom@talpey.com, miklos@szeredi.hu, amir73il@gmail.com,
	senozhatsky@chromium.org, chenxiaosong@chenxiaosong.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	stephen.smalley.work@gmail.com, omosnacek@gmail.com,
	casey@schaufler-ca.com, nanx95726@gmail.com, djwong@kernel.org,
	daniel@iogearbox.net, linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	ecryptfs@vger.kernel.org, exfat@lists.linux.dev,
	linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, linux-integrity@vger.kernel.org,
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	xiujianfeng@huawei.com, lujialin4@huawei.com, bpf@vger.kernel.org,
	kpsingh@kernel.org, matt@bobrowski.net,
	alexei.starovoitov@gmail.com
Subject: Re: [PATCH RFC -next 00/12] landlock: Add READ_METADATA and
 WRITE_METADATA access rights
Message-ID: <20260926.e0135fe7712f@gnoack.org>
References: <20260924104831.1081137-1-caixinchen1@huawei.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924104831.1081137-1-caixinchen1@huawei.com>

On Thu, Sep 24, 2026 at 06:48:19PM +0800, Cai Xinchen wrote:
> This series adds two new Landlock filesystem access rights,
> LANDLOCK_ACCESS_FS_READ_METADATA and LANDLOCK_ACCESS_FS_WRITE_METADATA,
> which control access to file and directory metadata such as inode
> attributes (mode, ownership, timestamps), extended attributes and POSIX
> ACLs.  It picks up the work from the "landlock: add chmod and chown
> support" series [1] and follows the coarse-grained grouping discussed in
> that thread [2]: instead of separate chmod/chown rights, metadata
> operations are grouped into one read and one write right.
> 
> Landlock evaluates access rights on a per-path basis, but the metadata
> related LSM hooks (inode_getattr, inode_setattr, inode_setxattr,
> inode_getxattr, inode_listxattr, inode_removexattr, inode_set_acl,
> inode_get_acl, inode_remove_acl) only receive the dentry of the accessed
> object.  Patches 1-7 therefore first pass struct path instead of dentry
> through the metadata-related VFS helpers and LSM hooks.  This is a pure
> refactoring with no behavior change, split so that every patch builds
> and works on its own:
> 
>   1: notify_change() and its callers
>   2: inode_setsecctx hook (must come before 3: the SELinux and Smack
>      implementations call __vfs_setxattr_locked internally)
>   3: xattr helpers, which also drops a redundant EVM xattr size sanity
>      check whose vfs_getxattr() call only has a dentry and therefore
>      cannot be migrated to the new path-based signature
>   4: POSIX ACL helpers
>   5: inode_setattr hook
>   6: inode xattr hooks
>   7: inode POSIX ACL hooks
> 
> Two deliberate scoping decisions for this refactor:
> 
> - The hooks consistently take struct path rather than struct file.  The
>   VFS call sites involved (chmod(2), chown(2), utimensat(2), xattr(2)
>   and ACL syscalls) operate on paths, and several of them (lstat(2),
>   lchown(2), llistxattr(2), ...) have no struct file to begin with.
> 
> - struct inode_operations->setattr still receives (idmap, dentry, attr).
>   Only the VFS boundary (notify_change()) and the LSM hook layer see the
>   path, which keeps the refactor contained to fs/attr.c and the LSM
>   infrastructure instead of touching every filesystem.
> 
> Patches 8-12 then implement the new rights, their tests, the sandboxer
> sample and the documentation.  Semantics:
> 
> - READ_METADATA covers stat(2) and friends, getxattr(2) and friends,
>   listxattr(2) and friends, and POSIX ACL reads.
> - WRITE_METADATA covers chmod(2), chown(2), utimensat(2), setxattr(2),
>   removexattr(2) and friends, and POSIX ACL set and remove.
> - Only explicit metadata changes requested by user space are restricted.
>   Implicit changes performed by the kernel (e.g. timestamp updates on
>   write(2), size changes on truncate(2)) are not, and neither are
>   chmod(2)/chown(2) calls that change nothing (e.g. chown(2) with
>   (-1, -1), which never reaches the hook), matching the SELinux
>   inode_setattr behavior.
> - Kernel-internal accesses performed with override_creds() (e.g.
>   overlayfs, cachefiles) and kernel threads without a Landlock domain
>   (e.g. nfsd, ksmbd) are not restricted.
> 
> The Landlock ABI version is incremented from 11 to 12.
> 
> The series is based on linux-next commit 5c4d4169604b ("Add linux-next
> specific files for 20260921").
> 
> Testing: each patch has been built for aarch64 (gcc, -Werror) and the
> landlock selftests (445 tests, including the new ones) pass in QEMU on
> aarch64; base_test reports ABI v12.
> 
> [1] https://lore.kernel.org/all/20220827111215.131442-1-xiujianfeng@huawei.com/
> [2] https://lore.kernel.org/all/abc960a1-e66e-792e-6869-cfd201c29dbe@digikod.net/

Thank you for sending this patch set!

Some meta-remarks at the beginning:

* You might want to link the bugtracker feature request:
  https://github.com/landlock-lsm/linux/issues/11
* In the final version, I think it's preferred to merge patches 8
  (adding the access right enums) and 9 (adding the LSM hooks that use
  them).  Having the feature as an atomic commit makes it harder to
  accidentally mess it up during a backport, because you can't patch 8
  without 9.
* As Paul alluded to, the changes to the LSM hook interface and to the
  existing callers in VFS are likely the hardest part of this patch
  set.  Alexei from the BPF subsystem has also reiterated recently
  that he wants BPF to be looped into such changes.  BPF hooks do not
  give the same backwards compatibility guarantees as the syscall
  layer, but there are existing users of LSM hooks specifically
  through the BPF LSM.

* In https://github.com/landlock-lsm/linux/issues/18, we came across
  statfs(), which returns file system meta-information based for the
  file system that a given file belongs to.  I have weak confidence
  that READ_METADATA would be the right access right to protect this
  with, but it's a somewhat related operation.  Maybe you have some
  thoughts on this?

More concrete questions:

* If a "inode" LSM hook gets a "path" argument now, should it be
  renamed from "inode_..." to "path_..."?

  (Maybe the BPF people can chime in about to what extent that would
  cause additional churn for BPF users, in a situation where they
  anyway already need to make a change due to the changing function
  signature?)

–Günther
