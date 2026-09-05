Received: from mta0.migadu.com (out-217.mta0.migadu.com [91.218.175.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590B45474E
	for <driver-core@lists.linux.dev>; Sat,  5 Sep 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635787; cv=none; b=UBBlEks98IDOLrja3i0qVUclgCgYdC8ctpOoqERsdrmpKsYHV3F18/yAEL1KEhFK45t/1742AmEaZWZXhw4wr0Lm+a2dLolBnV4lxIkcIgMDPDEERlF89M8YP0eKK8UYHJ75ssJNFaLmsL67Igg8YZNnLf0i4TTuzCkCU+4IBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635787; c=relaxed/simple;
	bh=u9fFDnh/HX08vif0Nt+Ooqgt/uHmAmLe/vnqwAZkxYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2vLAlofHoK3rgVUjAlW42JNsMUXHRdd55JZcOjDI+QC+NQWHyAXgR8aDaiWeKxpUVIZ+Hzz4XdFFTNIy5+TLWFA2au+LGo3LLcLgfVpGdVeW7djUZrZIuhE1elIRZv298UUzSRr0/GP0CTumQIbScOSOgf5BDCAWFfAtwXo27E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AQlx/WxF; arc=none smtp.client-ip=91.218.175.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AQlx/WxF"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=u9fFDnh/HX08vif0Nt+Ooqgt/uHmAmLe/vnqwAZkxYA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788635783; v=1; x=1789240583;
 b=AQlx/WxFy4kOkvH9ThrW6PQgsel5jSx/PAxMTilXKzDOg0QUceCmRXE28ge8lDeBF68u/w04
 +Eq7HeXaDIpBs8AJCBOn651uq/ZosmHx3te4egyqnmGLR1vty8ej5k9/PVGodJa9PkdXovBmPYF
 snCNb2uloUr3Srqi0gsgh+lg=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 5645af5361584614;
	Sat, 05 Sep 2026 19:16:23 +0000
X-Mizu-Trace-ID: 5645af5361584614
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] kernfs: three standalone fixes
Date: Sat,  5 Sep 2026 12:16:09 -0700
Message-ID: <20260905191613.3143937-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three independent kernfs fixes, plus selftest coverage for the paths
they touch.  The fixes do not depend on each other.

Patch 1 adds tests for decoding a file handle and for a rename that
keeps the same parent.  Patches 2-4:

 - kernfs_rename_ns() takes kernfs_rename_lock only when the parent
   changes, so two same-parent renames inside one
   kernfs_path_from_node() walk can build a path that never existed.
   sysfs_warn_dup() is the only caller that can see it.

 - __kernfs_fh_to_dentry() creates inodes with no lock, so a decode
   racing rmdir() can hash an inode after the removal's ilookup()
   pass.  The inode keeps i_nlink 1, so no IN_DELETE_SELF is sent.

 - kernfs_create_link() reads the target's uid and gid unlocked, so a
   chown in between gives the link an owner the target never had.

Patch 1 applies on top of the patch [1] ("selftests: cover kernfs
dentry revalidation") with vfs-7.4.kernfs branch in vfs tree as base.

[1] http://lore.kernel.org/20260902014050.499002-1-shakeel.butt@linux.dev

Changes since v1:
http://lore.kernel.org/20260903040253.670020-1-shakeel.butt@linux.dev
- Added cover letter
- Used approppriate tags
- Updated commit messages to be more concise
- Replaced data_race() with READ_ONCE() (TJ)

Shakeel Butt (4):
  selftests: cover kernfs file handles and same-parent rename
  kernfs: take kernfs_rename_lock for same-parent renames too
  kernfs: don't lose IN_DELETE_SELF when decoding a file handle
  kernfs: fix up the unlocked attribute reads on the creation paths

 fs/kernfs/dir.c                               |  40 ++-
 fs/kernfs/kernfs-internal.h                   |   9 +-
 fs/kernfs/mount.c                             |  32 +-
 fs/kernfs/symlink.c                           |  17 +-
 tools/testing/selftests/filesystems/config    |   1 +
 .../selftests/filesystems/kernfs_test.c       | 296 +++++++++++++++++-
 6 files changed, 362 insertions(+), 33 deletions(-)


base-commit: 47fc64fb3b433abb9f2242a85ba808ac6f87df22
-- 
2.53.0-Meta

