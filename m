Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ECD424D42;
	Tue,  4 Aug 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873186; cv=none; b=RS/vOBmF7Vh1wKqs4NSCRP0kjZAR1wdI+qmrfMwavmPezo3KIK5KfGeQ+nxxT+DF+30IRmy1QIS/ord0VJi1LCkz1v+/a029G8rZ6g5+TJ0xtqVgfnwVjmm2HqSvA5CTJ+/+Ha9r/QTyD05wEnXHqXqhNxVqMry42hTDGDbyfZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873186; c=relaxed/simple;
	bh=G+emVjrWGnj593PsBxX0UlQ4KdgibQCqjwHsn41CZds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UbMnCZ28F1Hnv8zv70unHC9qxOQDt07lncM2TzBOAi16hDkYvLbl3UPbQhizyWz6yOsVeY6FJvC1mYxv+bMpLPitV8vA79FEXxdjvy9aY+m19vQFKOdMPDilBo7fzI6XS5Edzya8hdyw6QayHx75ZYr+YyrfFEWo36OZZmpzWms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7skavlt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7skavlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29011F000E9;
	Tue,  4 Aug 2026 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785873184;
	bh=xu+GksaCGgOMwV9hU5Wdn+RIJ/qpkfvR471e/po4eyY=;
	h=From:To:Cc:Subject:Date;
	b=Z7skavltvZDoA5kAZTnGt8FIJO4aOQw7Z/UVrKhFjkR9jvqg+s7DKeG47rNutPi2J
	 jKAqifz2XyQGi8YDe7WGHyrcRTafet0p8kUv2kYNuVM+/izln2aJDA7Ol+xEmSY2Vy
	 1Fohn913s3ozDKWd7NXCi4irQkfncC4fcEOQZ9s/Ot0uMrwAwHci6fL504F3rnJiDn
	 QJ2gVOZTaF6Qa0KQwniMKsuJURw+Jn5X1HdzvZOUCEgRydZNbF0Rq1YP/rxRRIGPcH
	 a0wKKFG1ts4mmtOOYOJgFmu5WJwUt9pqm0OevEknzMszLDezY+gokthx5uHPdjqytt
	 7IFcIQnlQFA7g==
From: Danilo Krummrich <dakr@kernel.org>
To: tj@kernel.org,
	jiangshanlai@gmail.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/7] workqueue OwnedQueue, ScopedQueue and ScopedWork
Date: Tue,  4 Aug 2026 21:52:02 +0200
Message-ID: <20260804195248.665636-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series extends the Rust workqueue bindings with the ability to create
custom workqueues, enqueue non-'static work items on scoped queues, and
introduces ScopedWork, a work item type that cancels synchronously on drop,
allowing drivers to use workqueues with lifetime-bound data.

This picks up and extends prior work from Alice [1] and Onur [2]; changes I
subsequently applied, if any, are documented in the corresponding patch.

I also added a patch to replace the deprecated system_wq with
system_{percpu,dfl}_wq, which I originally sent with the WaitQueue series [3],
as it makes a bit more sense in this context.

[1] https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com
[2] https://lore.kernel.org/all/20260617144645.253444-1-work@onurozkan.dev
[3] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org

Alice Ryhl (3):
  rust: workqueue: restrict delayed work to global wqs
  rust: workqueue: create workqueue subdirectory
  rust: workqueue: add creation of workqueues

Danilo Krummrich (3):
  rust: workqueue: replace deprecated system_wq with
    system_{percpu,dfl}_wq
  rust: workqueue: add Work::cancel_work_sync()
  rust: workqueue: add ScopedWork for non-'static work items

Onur Özkan (1):
  rust: workqueue: add ScopedQueue for lifetime bound items

 MAINTAINERS                                   |   1 +
 drivers/android/binder/process.rs             |   4 +-
 rust/helpers/workqueue.c                      |   7 +
 rust/kernel/sync/completion.rs                |   2 +-
 rust/kernel/workqueue/builder.rs              | 389 ++++++++++++++++++
 .../kernel/{workqueue.rs => workqueue/mod.rs} | 147 +++++--
 rust/kernel/workqueue/scoped_queue.rs         | 202 +++++++++
 rust/kernel/workqueue/scoped_work.rs          | 290 +++++++++++++
 8 files changed, 1009 insertions(+), 33 deletions(-)
 create mode 100644 rust/kernel/workqueue/builder.rs
 rename rust/kernel/{workqueue.rs => workqueue/mod.rs} (90%)
 create mode 100644 rust/kernel/workqueue/scoped_queue.rs
 create mode 100644 rust/kernel/workqueue/scoped_work.rs


base-commit: f2687db25dd52319cb06ef4aa8cc2a13fa0203fa
-- 
2.55.0

