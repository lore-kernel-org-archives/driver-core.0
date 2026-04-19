Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1F15B0EC;
	Sun, 19 Apr 2026 15:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776613401; cv=none; b=RWC8r9r8LTCJtNdmKcEj9ojzcDDLPpJ8M86VHjMyeWxl15fzCvTWsIuxYoQAgTsFn7VkMZhzCQS8aijGLNqrEXwr+zySLw6sUW+kVJa8uI8wqtWdmLaHi76UlhF3LVfqQlNv+EbT9MaUTmTygwtLNR9s4emVlAc9QlSBIfbaMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776613401; c=relaxed/simple;
	bh=AX/Iyr5QL37hmbSUQW2pfugCHLwipkUB+0eB9knFmS0=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=Qh3xE4KGnzOSb04jgsmZPKl9lwgjGoE8wf0QBaGe6SHXeubx2Wms2D+IN+6EYanaTGIefeGOcpqqIi7gSl8xQdm344XBfNSLrghaD+tjq4RaE1b5bwGse+/1/9871naYm+J+MaLOenzhf34WypOcko6cXsjTsTPRTkXn02ZvMJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjUrQB1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjUrQB1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2032FC2BCAF;
	Sun, 19 Apr 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776613401;
	bh=AX/Iyr5QL37hmbSUQW2pfugCHLwipkUB+0eB9knFmS0=;
	h=Date:Subject:Cc:To:From:From;
	b=AjUrQB1hAjb6NZqPD59WTlyFYg8CFgJV0BTf6xYHX9XCC9YBTwLoFqPRrg2Ls+Ggc
	 tUtdF3JCH7Cp2+pWScflquj5oWHdt3mo3jblUjnFimog1FxVJnyKqcecwew6ol0CCg
	 uGSDVHAKWxdC1UPklSd3vAGqRkK/Jb9d5Kt1Mv1cO4i6u2SnPQGVYQP81PQoKCmFB5
	 mnMIbP0ziKlzgUPKR0FMWZCB7mEh0grUqLlhNJ6EFjPyOswg014CZ5DFH8FAkt6aOH
	 Or/w3KmGI/fb9jGLUwMYsJ+H5iXptFFyK/QhErzv0thfNnAj0wBGJ+LaNI2n0F37nS
	 SQ52A+G4//4ig==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Apr 2026 17:43:18 +0200
Message-Id: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.1-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Linus,

Please pull these driver-core fixes.

All commits have been in linux-next for 5 rounds (4 for the kernel-doc fix)=
; no
conflicts expected.

I also included a software node patch from Bartosz; it's not strictly a fix=
, but
he has follow-up patches building on it across various trees, so including =
it
for -rc1 still seemed like the pragmatic choice. I hope this is fine with y=
ou.

- Danilo

The following changes since commit c369299895a591d96745d6492d4888259b004a9e=
:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.1-rc1-2

for you to fetch changes up to 5b484311507b5d403c1f7a45f6aa3778549e268b:

  driver core: Add kernel-doc for DEV_FLAG_COUNT enum value (2026-04-14 11:=
27:27 +0200)

----------------------------------------------------------------
Driver core fixes for 7.1-rc1

- Prevent a device from being probed before device_add() has finished
  initializing it; gate probe with a "ready_to_probe" device flag to
  avoid races with concurrent driver_register() calls

- Fix a kernel-doc warning for DEV_FLAG_COUNT introduced by the above

- Return -ENOTCONN from software_node_get_reference_args() when a
  referenced software node is known but not yet registered, allowing
  callers to defer probe

- In sysfs_group_attrs_change_owner(), also check is_visible_const();
  missed when the const variant was introduced

----------------------------------------------------------------
Bartosz Golaszewski (1):
      software node: return -ENOTCONN when referenced swnode is not registe=
red yet

Douglas Anderson (2):
      driver core: Don't let a device probe until it's ready
      driver core: Add kernel-doc for DEV_FLAG_COUNT enum value

Thomas Wei=C3=9Fschuh (1):
      sysfs: attribute_group: Respect is_visible_const() when changing owne=
r

 drivers/base/core.c     | 15 +++++++++++++++
 drivers/base/dd.c       | 20 ++++++++++++++++++++
 drivers/base/property.c |  2 ++
 drivers/base/swnode.c   |  2 +-
 fs/sysfs/group.c        |  7 +++++--
 include/linux/device.h  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 88 insertions(+), 3 deletions(-)
