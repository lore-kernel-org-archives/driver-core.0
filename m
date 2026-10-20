Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500770;
	b=n6wtehvUKq0VvOK2Sljajo+BRBScksTdTnMOnm1fMB0GbXftNqqkQ5/9D34vTDUAKw4b
	 7s7sjXF8xyV/HtVHvK2mjOcPp4KZ/RlWb9I/ajFyJZACzeXWom1Rnkev7+hum98W/gcIL
	 Xvc7y9oJDL+6ZvKzDuH5u0ouJPVa6jJy+/63cnU6iUmfqV1daNaDJsr08jaPnHmCcPk5+
	 sdMeyOVbbpnD9zBhrJUZf0PguJ0MKFmBUtCEAjUP6zuBfXNzSsFvFZWBbNRlGDT32kZ8Q
	 hbOLlkw01CsdqIRGZxUcL2Fidy3UBgkP7zI0cMiJY/8rpmXDNhDiiZDRl+wYf4X4NJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=h4dSeWA0TZhH/a30MaXIOvSiMoTtdnOH3PXIJsbEBS0=;
	b=I7nP3VxWMQc4f3u2/DOpV8i4hFc0CsYrShIlsZYtVfjP/s9LA+U1aTVNCQZ8bLZtaVd8
	 C5QM16CfWvYFnTgb/K6ctSTNDViimMfMuQMDKGNWc+UQJB/PDaa/Gl2sPZTlg5geXip08
	 AqagMzXonlRB/h/sLcHGidxAMDuSfoy9s2ATC/9rujGmwNrNpMjH782m1JAU9HZUgDiox
	 ZszCcNuFJwS/yU5eKFBMXAQhi6V/JkjVkUd5P7Ae6gvGANekIpB7bAM3fsCV2aAV5Gl1Y
	 lKocOk4cxgrAtLqVSpp7KPW82QXZKBHnmC2NDhXtXBnPtcQqlz6g62xD8YezcJKR7PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=V2E6BYLs;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF7606A322
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 12:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADAF7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=V2E6BYLs
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48dfaaea30cso2186716f8f.0
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 05:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792500768; x=1793105568; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4dSeWA0TZhH/a30MaXIOvSiMoTtdnOH3PXIJsbEBS0=;
        b=V2E6BYLsuKVz+/ymGlwLtUeIm49o6pmnzkdSNAu0aeUqH6RQjOBxvmk4XiTCVwkUkS
         XdaUaskMpZvMvFgBd6yKoXw5Lp7Ea7F9R1bIDKerHJC3WMqRfZfcljvqXUzkUIgqjqiL
         O6p5XDJclBkq4H7BpjT0crJRY7D1JkWy8nzLHYYj815EH7vur3t0Y6Xqxv7rPmod1Uev
         mbTBAgc1iSpWpPaB3HYIYO1Hh7UycV6nIdOEAdilllDUE/D/4c4Oi3YsaoCbavAEGHye
         PmxW/bcJCwlwlgIDx+Q77UkfU4sNaAhsemo3u1WwXbTo4740Mu//SJzansBKFSkN5akW
         EIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500768; x=1793105568;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h4dSeWA0TZhH/a30MaXIOvSiMoTtdnOH3PXIJsbEBS0=;
        b=kE5KaDUry9TWJTKIPB8TsnqRBcdyJ1+w5rjGj6N/M5d+9Usw0CvQ4rY0KHPzO2h9F7
         Lv4mE4O6ZJsymyWcDiK4UC6ZXw3c1kRDBsvobP+UfkCDwrG03k2k7Cu55uM5Qs3WMDlk
         eU2wltFLfK29NWaC/2OUJojQx7l+hOGXMWkj+e/d6U70wf5r/FM1cbzhZQGvLlCWEQoN
         NOPA/hF1QjpI9xbjpJegiaH+ClzLDIlSgJsb14QyOYaQuuc/qOFJKqStfzMgAm/FgT76
         CXO5yBBSuz2Dm6cPkUb1D5wlE8FABi6qnSWgVyGuFFM7WB2AG90C89K+l52zKzToQQK/
         uTkQ==
X-Forwarded-Encrypted: i=1; AKwUvBztFf6XWURGOeyhpY4dP8EaMxqnO6G+YssdQg9psLJDaNqrgTGBdGoVkBoeaHnpKVfqTN+K9ysZz9mFTg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKuyzed0CiY5BIBKYQcPfVhk9O6mNIgnflIg5wsVTgUlKTYLHUE
	HXqfklO60mIhXhsdtx/JbFxMbdXQBwP3FHnYzB99lhIOMBGnYZvfm5N8PRw4T3s/Rij6JbKR/Eo
	khWp7o3KuL3a0y39dRQ==
X-Received: from wraz5.prod.google.com ([2002:a05:6000:4685:b0:48d:f161:cdaf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4694:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-48e07f9da3amr16892672f8f.29.1792500767961;
 Tue, 20 Oct 2026 05:52:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:52:35 +0000
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABNk12oC/z3OSw6CMBSF4a2Qjr2kLfYhI/dhHCC9QINSuaVqQ
 ti7jSEO/8H5clYWkTxGVhcrI3z56MOUozoUrB2aqUfwLjeTXGrBhQRKcYF3oHFOmBC0sq3j3Q2
 N4SyPnoSd//zAyzV3R+EBy0DY/BluuRFaSSXLyh5P1igQ4JqRziPShPcyUL9ThHPKl5bd27Yvw 3h11rAAAAA=
X-Change-Id: 20261012-rust-workqueue-658cd0fbe770
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3393; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YrUDzBvba3x+3LL60N6o4S9VKs85idwu0qTHG71exFU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq12QZrkSDCsbkM2IX5DEGwRjx/zHb9Od523ya1
 3XI8gry9hSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatdkGQAKCRAEWL7uWMY5
 RoBfEACiWD0gE1O0ceXwL9CpqVv8XFZCxtiaC8q3opv8DXffNsmlHiTwX9t3gu1d2PnsimZiX/J
 xRXEmLvsTQihvJRGkI8BLiw+MB+EGfpWbp8bVlmS9UkHLnY4OoNH41NEsV4RKz5RVglf5DXV4m+
 I2RQTDrB7EdjbWHR/Pf4KHVHkwSFNkG+KlFb1RLTwmUDMOFo0OhT/CpX/1z5Ody6yYVLGuuBgn6
 xvrsiFWPN2xW18EJ/ZE+IzfeSvTLHPKx3ypx9bA6qUc2EvxvEy6gLKTzt3Eza3Sv3oTdaUNl6Em
 z0N+Y5R7KU3Zy7W7sxKPCyFldpmqgo+2NkA0lzXgSyTd4PGgsZDUDXpyNTKupCQO5Hlc1xqiw1k
 XZWD8xYbYnfzK3V9Ysh++FH3YI6Bdfbqq9ZX8dijM+S70wCC4Biy11xB1rQcm7nOI3qfGaWIxtT
 jflXXxPY6hueGgZY26K9ClhXjpGoETj/KVFnY4kbDcD/azMte5yrux6XpqtP+9mzyDLyKB38x3D
 u2WVj53xlkxHxAcBJqHfpQkZInayArnmGke2Ghl2k89avYmneMftOltaeASHkMjPX46zeqG8NrV
 k5gVY6oqgYLa8sq9vnGaOM1jatiaZ8yKit/grQGO9nkZBH2h/Ay469VwgjejNx6avmzxGw7FRIc m0nsqlMabHT3GoA==
X-Mailer: b4 0.14.3
Message-ID: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
Subject: [PATCH v3 0/4] workqueue: OwnedQueue and ScopedWork
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This series extends the Rust workqueue bindings with the ability to create
custom workqueues (OwnedQueue), and introduces ScopedWork, a work item
type that cancels synchronously on drop, allowing drivers to use
workqueues with lifetime-bound data.

This is a continuation of Danilo's v2 [4], which picked up my earlier
series [1] and Onur's ScopedQueue work [2].

Patch 1/6 of v2, "rust: workqueue: replace deprecated system_wq with
system_{percpu,dfl}_wq", is a fix and has been sent separately [3]. This
series no longer depends on it.

[1] https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com
[2] https://lore.kernel.org/all/20260617144645.253444-1-work@onurozkan.dev
[3] https://lore.kernel.org/all/20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com
[4] https://lore.kernel.org/all/20260807165252.3849875-1-dakr@kernel.org

Changes in v3:
  - Rebase on v7.3-rc7
  - Split out the system_wq patch and send it separately as a fix [3];
    this series no longer depends on it
  - Drop ScopedQueue: with the ScopedWork changes below it is no longer
    needed to enqueue non-'static work items, and it has no other user
  - ScopedWork: make ScopedWork::new() unsafe instead of
    Queue::enqueue_scoped(), which is now a safe method accepting
    &ScopedWork<T> on any queue
  - ScopedWork: drop the WorkItem/WorkItemPointer/HasWork impls and the
    public ScopedWorkRef type; embed the work_struct directly with a
    dedicated callback, and keep the Opaque-wrapped payload private
  - ScopedWork: drop T on drop (Opaque does not run destructors)
  - ScopedWork: propagate the initializer's error type from new()
  - Builder: new_power_efficient() uses WQ_PERCPU | WQ_POWER_EFFICIENT;
    remove the now pointless percpu() modifier
  - Pick up Reviewed-by tags from Daniel
  - Link to v2: https://lore.kernel.org/all/20260807165252.3849875-1-dakr@kernel.org

Changes in v2:
  - Merge scoped_work.rs and scoped_queue.rs into scoped.rs
  - Introduce ScopedWorkRef<T> and wrap it in Opaque inside ScopedWork to avoid
    &mut aliasing in drop
  - Pass &ScopedWorkRef<Self> to ScopedWorkItem::run to enable self-re-enqueue
  - Add Deref<Target = Queue> for ScopedQueue; remove duplicate enqueue_scoped()
  - Add Send + Sync for OwnedQueue
  - Fix stale workqueue::system() references in docs
  - Drop Work::cancel_work_sync()
  - Make sysfs() available on ordered workqueues
  - Add #[inline] annotations throughout

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (3):
      rust: workqueue: restrict delayed work to global wqs
      rust: workqueue: create workqueue subdirectory
      rust: workqueue: add creation of workqueues

Danilo Krummrich (1):
      rust: workqueue: add ScopedWork for non-'static work items

 MAINTAINERS                                    |   1 +
 rust/helpers/workqueue.c                       |   7 +
 rust/kernel/workqueue/builder.rs               | 370 +++++++++++++++++++++++++
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 108 +++++++-
 rust/kernel/workqueue/scoped.rs                | 342 +++++++++++++++++++++++
 5 files changed, 823 insertions(+), 5 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261012-rust-workqueue-658cd0fbe770

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

