Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A418A6DB;
	Sun, 19 Jul 2026 14:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471496; cv=none; b=bvaz87oUWB3ouqhID5Umv+aqCWGopT7lY+NW4EZdZhcPmv5A2nb5mBqHdX6KQjTWLw6QizZIsw5JE9lXB2Drzuc4iFIJ6y29ow0ceZ6QErxVbphp1zNKIho9FIsAMFqrN0fATorepeUT8z3DhX1n1cW6SDLs6jShPpWAIOr5+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471496; c=relaxed/simple;
	bh=00l0Qx7PnVMOxC9+YHlyeNRyISEnIIhsAQrtr14rMlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K58hu1ILov47e+X20Act1Dmnw11Chig1q7pBKaZEg7KXyvtNpGM76tJ/5DvgHebI1ow0JCZIcqy7hmP7Sjpl1jDQAA9euuKXiSvzU3WeULXMWMDt6gjcpZFmPJAbyd2bP0DRot+CiIf/Qs4F6HPXJrh/Ggtvw8jlNsucFoe/KQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNNO4bjj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNNO4bjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C381F000E9;
	Sun, 19 Jul 2026 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784471494;
	bh=szVMhzooG/B34WQ6dzLOuzfmQb1+VArjeKiPuW05Z+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iNNO4bjj4KKqHuVldT378l9V/wMtp1dRSkfvsUNsDX8GKyYxKSnMza6quDx4iQ+Ze
	 zoYRm0s8Bwjfm+zxKl328iJZYfOTEuz9kT40sJ1Tj268tamtPS7s75boqAM+IV6t/z
	 uCWWZewh627Q/LjCFeY7w1AYSp2pgx/B2ntGG/EzvKiWDllWpW4Th2fEDYNSuMehkT
	 ezS36OYibPtcmyORCFoKdPGW18USnX+7ETxt0jBS7va+DXq3fR0q7vDDX3TXUBf3jw
	 K3WArvEra4BSsjsMWbVwswyLeSYjeiO8yLk9snoXkzGzg9lWQ60eytLQgIijhQEM8V
	 kjsQS3MwEOqWg==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] rust: io: document const-offset requirement for infallible accessors
Date: Sun, 19 Jul 2026 16:31:28 +0200
Message-ID: <20260719143128.452808-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260716142545.3622278-1-gary@kernel.org>
References: <20260716142545.3622278-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 16 Jul 2026 15:25:43 +0100, Gary Guo wrote:
> [PATCH 1/2] rust: io: document const-offset requirement for infallible accessors

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[2/2] rust: drm: fix non-const `read8` in unit test
      commit: 22e77d81d0a9

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
