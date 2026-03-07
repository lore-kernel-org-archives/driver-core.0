Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE1F21CC7B;
	Sat,  7 Mar 2026 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883561; cv=none; b=oSJntOCJH1hGBOHZ8E/BcyMn3PllIrnucr6I9tB993TfShqHHIcwH6q7Nn5Fzvo0eEcGTglBWLj0ouNh0tq3PSJh0ZFGsrOhZyOQ8L+iDEhjO+jR+K9FeVQDvREI1PU9x5wX9eLhsIDe4tlD9D8mvX38hbj4iIKwT/aD4SQq71o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883561; c=relaxed/simple;
	bh=BQwyt2A8vhfnnyi+6vk+YVp7UcTqkvdvh5PULriWnaQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=e7u8sFIV/5FCAxZJjkDcl7KO3Y6Tv4ilubki4OEF/IuwX7KQWDKkByyMmff1+I8NULjnVNA9H37YDjtXc43jZ5CrHE1mGGLVgkyxtir1s1321UgCqXmy11JMhJ3Pxl00gXpNoTnRXnB+QW1bLjVU1Y9ImYB8AhGJb793sYeY3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbRGoNUi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbRGoNUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF66C19422;
	Sat,  7 Mar 2026 11:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772883561;
	bh=BQwyt2A8vhfnnyi+6vk+YVp7UcTqkvdvh5PULriWnaQ=;
	h=Date:Subject:Cc:To:From:From;
	b=pbRGoNUirh20v1Qp+2oWwQ2M67xhR16TT5V4KDEpTXSWu67bbKVgivwJHQj23rlX6
	 YY6xBd6ermeBiuAusdlWg9BOX23wYD1ggIUTCA9kFNLnO5eQyfD2wue0NYFK7eHJFo
	 AxWFg0NsF6WIKQXPg1j2mzYH/zuo5Y7iltfmapDd8qTmhWruAkjkR4ovssaE9SAqfy
	 8VvfoBEX49rQFeA5UTPaNbk42d12RZadQDCyiRfP3lDE4C0WKU+GqgXbDrtJeleMTO
	 5RaEUEtXqxewuiv8Y1XWptl03/f8ccWYzBHcZqJQDZodDAtFkVJbaQdEQXmUne76NG
	 mKdPX0tO+jd3w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Mar 2026 12:39:17 +0100
Message-Id: <DGWIRQLTVEK8.24EJBMC8LDQWJ@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.0-rc3
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0

Hi Linus,

Please pull the following revert; no other fixes included.

It has been in linux-next for a couple rounds; no conflicts expected.

Please expect a follow-up regarding the driver_override issue for likely
-rc4 or -rc5.

- Danilo

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808=
:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.0-rc3

for you to fetch changes up to 9de68394a61528d40f575c3e6719cc75c56f62c3:

  Revert "driver core: enforce device_lock for driver_match_device()" (2026=
-03-03 13:12:42 +0100)

----------------------------------------------------------------
Driver core fixes for 7.0-rc3

- Revert "driver core: enforce device_lock for driver_match_device()":

  When a device is already present in the system and a driver is
  registered on the same bus, we iterate over all devices registered on
  this bus to see if one of them matches. If we come across an already
  bound one where the corresponding driver crashed while holding the
  device lock (e.g. in probe()) we can't make any progress anymore.

  Thus, revert and clarify that an implementer of struct bus_type must
  not expect match() to be called with the device lock held.

----------------------------------------------------------------
Danilo Krummrich (1):
      Revert "driver core: enforce device_lock for driver_match_device()"

 drivers/base/base.h        | 11 +----------
 drivers/base/dd.c          |  2 +-
 include/linux/device/bus.h |  2 ++
 3 files changed, 4 insertions(+), 11 deletions(-)
