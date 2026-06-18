Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A280244667;
	Thu, 18 Jun 2026 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811600; cv=none; b=hwKCTaGQeXGuGhTYw3ZjQNTWmM6oIf/UWvQohRvXO/rPB3zq8gA1ZNWzno+WoKa5N07rFFpQarVDdaFvjRGeTzGihnbME+7GvapqEuzBVSRSkGi0jL70e04HX5COpbIlPkW4C9DZkNjmAAYIkjmZ7qYKnNX185BDvTfS5ADT05A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811600; c=relaxed/simple;
	bh=y17TF/QKFgeSEEx00g5JXx69LBDwzGp8qGhlcUV467A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uES+M6sYCX7u68dj+Ge2Pu/vi/FwqgdPK92kiW1kXVZSUUCw/KpdQQm6+AFYwuWQE5zwkSFA5ganI82J2sWjQCX2p3lveBo3G5thvs2/AvAnxNRXtPS7zj4UvBWEFw5sVQCUHCKmCRThtlh3PmD+6GCcNjVpRT8oTbxOSk/4WdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZdvnTqH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZdvnTqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E41F1F000E9;
	Thu, 18 Jun 2026 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781811598;
	bh=ohLIPGXLzVroJ5CCm+QJ5zpbvC31UroFEKvAZUvcYEE=;
	h=From:To:Cc:Subject:Date;
	b=WZdvnTqHD+2jy+PUBLt//3CrMQLrsYvFN3Nu21bIKOFBGbXx+s3qGW5QwtKj/yFAv
	 lbxA9EbALNXYSVi+6yefTf/nqdmGeW/6l2pCGwQROm5hxou7XFwAqLTCt5UF19dEZx
	 /aUJyTXO1n1lxrqrx3H6Bp9kTvCww3tW86beXhc3p+B31nO6ChPVsIj8rzc91lz3/m
	 hlP237tnLB9hQH0FLa/PUJAqG1iqGrL+pzrWF1wBn4qKJj1yOGuR7WipEUUtzPXtUw
	 QwghNemL8jbFF48HHU6Tre2QD+uH0Do12DI74Wc+OdW8GtuB5LupmSlbpLgBhvrQQ2
	 tKmJrJDpBJvMg==
From: Danilo Krummrich <dakr@kernel.org>
To: lossin@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org,
	boqun@kernel.org,
	bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com,
	deborah.brouwer@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] rust: revocable: fix potential race between concurrent revokers
Date: Thu, 18 Jun 2026 21:32:57 +0200
Message-ID: <20260618193951.601239-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a race condition caused by not considering that Revocable does not guarantee
the wrapped object has been fully dropped by the time revoke() or
revoke_nosync() returns false.

There is currently no actual bug caused by this, but it causes SGTable and
Lyude's patch in [1] to be unsound.

Since Completion::new() is infallible but Revocable::new() is generic over the
error type, the first patch adds PinInit::map_err() to bridge the error type
mismatch.

This can either go separately or together with Lyude's patch. Both cases are
unlikely to ever hit this problem, so it should be fine either way.

[1] https://lore.kernel.org/dri-devel/20260612194436.585385-5-lyude@redhat.com/

Danilo Krummrich (2):
  pin-init: add PinInit::map_err() for error type conversion
  rust: revocable: fix race between concurrent revokers

 rust/kernel/revocable.rs | 23 ++++++++++++++++++---
 rust/pin-init/src/lib.rs | 44 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 3 deletions(-)


base-commit: 66affa37cfac0aec061cc4bcf4a065b0c52f7e19
-- 
2.54.0

