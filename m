Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5DC40BCB2;
	Sat,  8 Aug 2026 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786193490; cv=none; b=gSrDUXUHmzy5E939UUxAaAhnDDqvlzXKPFicYmsQQlNY4zDvNnu61tr7xaDIqKrxeVZaNhCbbj1wipot1CTCxEvTpg2jQ8gASQQDRmFx9z0deJLnPFjJkcL3Mm3sJqfciHm5HRKS3fJgJUjeLFKLoSuFSLbS/bQKRa/4RSw9NMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786193490; c=relaxed/simple;
	bh=LVRB2jRTzHoGUDyZ38hv5VgcTRwr+o/ekwzeptWrFys=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=e3SlrUaAEOT1C+VX1U+kVgGOEYmhUw088wx2gDbkH43xlhOKI4rhLEThBS8q9YUwJBEtgr96mjikMCH97naJAVy14hOfB2S34/9nQwiQIsOvLiScJL7Zuc7YXo4v6ozwcxWLwpUSy6jD7UR40zH4oVMRvhxLYuYPIZK+uXqnkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9FDcd26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9FDcd26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4761F000E9;
	Sat,  8 Aug 2026 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786193487;
	bh=oXL8G1PuYXoGfBFLeIxP7VDVqBkCegIIxCE+yt4WF1g=;
	h=Date:Subject:Cc:To:From;
	b=D9FDcd26Iw8fwDnWQs/7Sx+oE+cl7t1Hj4OTAxQfCwCCf4IzzwWFg4ZNdT5f36Bqb
	 8wQZyaaiGDLOpiTIpgGVMcjXfTJ4jakcoZE1rn6woy58FVUQ4QQeB+AkiQ45xigtZA
	 ssMgY5fWnlGPSAqVQ69uKI0dVc+2RNLk7nUseWu1BUE7XgSvGIAPbyHYbLUDRFaKj/
	 kvcc959UoUBYBkeii3YBIRNjQdKj4247N6xomtSSFcCdlHwXb/o+PzQQ0B4zooUjlq
	 CZLUmpZiMUN6ZcAVdYbo3vhPHZ9AhQBwPwIQH4EbQwzsKNbCK39MrxY3cdyZvsPcAH
	 mn+mNd1eG1Ruw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Aug 2026 14:51:24 +0200
Message-Id: <DKJKQUUIZTWH.3KW3FBXD1831M@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.2-rc7
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Linus,

Please pull these driver-core fixes.

Thanks,
Danilo

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.2-rc7

for you to fetch changes up to f88db65aece9f9d26287b6377b7c7730ecf9f11a:

  rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM (2026-08-06 16:05:50 =
+0200)

----------------------------------------------------------------
Driver core fixes for 7.2-rc7

- Fix Rust build failure on s390 by gating ioremap() / iounmap() helpers
  and the io::mem module on CONFIG_HAS_IOMEM; gate affected doctests as
  well

- Add missing kernel-doc for show_const / store_const union members in
  struct device_attribute

----------------------------------------------------------------
Danilo Krummrich (2):
      rust: io: gate ioremap/iounmap on CONFIG_HAS_IOMEM
      rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM

Randy Dunlap (1):
      driver core: add missing kernel-doc for union members

 include/linux/device.h  | 2 ++
 rust/helpers/io.c       | 2 ++
 rust/kernel/devres.rs   | 1 +
 rust/kernel/io.rs       | 2 ++
 rust/kernel/platform.rs | 9 +++++----
 5 files changed, 12 insertions(+), 4 deletions(-)
