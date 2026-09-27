Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF5F253951;
	Sun, 27 Sep 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518054; cv=none; b=qLW0lLvRkmk+03ADFm3QV2sUEfjiSl8hNF3D99Om8jENfXVOxD1IaJyIbCuzq1UJzE1BFZ7L0DvLxhnW6HUPNB0FYLrXppAMQ14QT9C/DotvsmPqMmRhfuj2GDl8RbODVYhM52m46CPEk46TEYPlKVNArX32toZvc7UKPXYIYkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518054; c=relaxed/simple;
	bh=4XxtY1joI+GxK7rNlfy/ULaHWIihMCj3oltfCGsOwts=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=nyCb1zXKgWhqvC9WNWNhZafOZoXYfo3rshL17Uy4lfCVKnxngFISD3uIM+ILK0XEW4DOIwkzinodtwE5vRGyJYZ4z++NgKjZ9BaZtei0P9Bet+WJFdh811J4ATS7Hgf0IZXsbKytcshCm5NH4qJ0OXLntAy/B9oKVV2bHnXYWIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAahmdhu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAahmdhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB371F000FF;
	Sun, 27 Sep 2026 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790518052;
	bh=2WioDkk6Q69qVFg/TCcbAyo5qjY6ls9WVGEgvrPuON8=;
	h=Date:Subject:Cc:To:From;
	b=WAahmdhuvWlEpWXvJb2p4o+K740q2VMlGEur4rv42QmeNBq5UaU6IPXxbOqJWqM7q
	 Ywwk9b3pVnzDaRnwzZC32ENvVEKx6WE+d/c0U3hLuNzlY2Vq7mHlK+wjFyvhJoRZmF
	 S36/i+s54FY0KeuaPN7gNHI3Ugr6Torbm8RsisEVR6HuSG5CXcXvXeDi5/FytAOTIy
	 nrlL5LZJ9JTTLTvqcwrtRGVfT5QyAHrnAk689UzhTJ9htfu66zOeRRmxlMB4BnlijZ
	 oFyuqmFPkSSCFMp7ZIVqIvosyKLwKkSXy+rAbcG4Ra9reEDAk6ZFkY3wo0UG5y9blH
	 4VdlOko2i217w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 16:07:29 +0200
Message-Id: <DLQ5OCF91IVM.1KEJWJ4BPRT27@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.3-rc5
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3

Hi Linus,

Please pull this driver-core fix.

Thanks,
Danilo

The following changes since commit df2908090cda368b01ff43709f51890076c56157=
:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.3-rc5

for you to fetch changes up to 77be3641f3e3a56e42a5ed889372ef395a933f3c:

  debugfs: don't warn about uninitialized debugfs for an error parent (2026=
-09-11 23:13:07 +0200)

----------------------------------------------------------------
Driver core fixes for 7.3-rc5

- Suppress spurious "debugfs is not initialized yet" boot warnings when
  the caller passes an error parent to debugfs file creation; callers
  propagating an earlier failure should not trigger the warning

----------------------------------------------------------------
Mikhail Gavrilov (1):
      debugfs: don't warn about uninitialized debugfs for an error parent

 fs/debugfs/inode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
