Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955810F1;
	Tue, 26 May 2026 00:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779753899; cv=none; b=EMuQgd2FfNafOpeYhDdoe9UneWNYfGnnloS8TKl5QF5Bzwn2JIPv5MPUsDk4OD0GRjkgORnd2OjldfehZYZAbAzOxF4vWY0DkF+pwROj1noAfWQW8Yj2fBDYokcyC4rYZfstBxetd/Vh0ZOVOBnv/C0CS1Y35P8ju+w+BjzB47Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779753899; c=relaxed/simple;
	bh=S/KV23k5E+ZHvvYsv3BgN6hxlVDS53QgQDx3k1VZNDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u75cielDKiXRufSE/hguzfz5Dw3YcBtBL4THIHpKq5CmNXNOICm30CzTVJY0WL2UWQDAEYholvCfZbZVAnDb447FOuXOAO1nODPEqsoi1QOR4z9bcPppAgOGOIF9ZRzmNivSLp6DNvyhXot/JgRrYy/F4QPSaj1UVq8JjfJYvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzgUhAMs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzgUhAMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6051F000E9;
	Tue, 26 May 2026 00:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779753898;
	bh=pgU0amePLd+Vep5Wq8QDJmHdCM+RZhR+ZJLB9OFFZRQ=;
	h=From:To:Cc:Subject:Date;
	b=IzgUhAMsqp54bm8XXC2Wt5uoavLjZBQ1QJbuUIQnUJRrDKph9w7T2hXbatxnliRDB
	 2cI+gHh5hqFRDFFT3w6eBBoXFKE4WPBMTs/CdzhuJ8nyk7hUdlTsOT2KkT7tVCxw5Z
	 US8/TM8Clq3XrKhqG8wMVVcYBaCfBIVBOTKH+fwv1tnSe4HIk4swWwxDDgVOuGkQ1g
	 QE2rmHRsQQdp+sHAPwzqhwcXs6lYC+rKffhwHUin03EnJRBC5I99EKaUVQNOm3bSNr
	 hSZ6ZtoZ06/Je+Fmt9A/7kfy2iOw0f/drNRklArIUGt3/9tguTJfpD1ke38gvLvzDJ
	 F9snbgvvfW9PA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: devres: add 'static bound to Devres<T>
Date: Tue, 26 May 2026 02:04:41 +0200
Message-ID: <20260526000447.350558-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devres::new() registers a callback with the C devres subsystem via
devres_node_add(). If the Devres is leaked (e.g. via
core::mem::forget(), which is safe), its Drop impl never runs, and the
devres release callback will revoke the inner Revocable on device
unbind, which drops T in place. If T contains non-'static references,
those may be dangling by that point.

Add a 'static bound to prevent storing types with borrowed data in
Devres.

Fixes: 76c01ded724b ("rust: add devres abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 9e5f93aed20c..2e258d31a45c 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -122,7 +122,7 @@ struct Inner<T> {
 /// # Ok(())
 /// # }
 /// ```
-pub struct Devres<T: Send> {
+pub struct Devres<T: Send + 'static> {
     dev: ARef<Device>,
     inner: Arc<Inner<T>>,
 }
@@ -184,7 +184,7 @@ pub(super) unsafe fn devres_node_remove(
     }
 }
 
-impl<T: Send> Devres<T> {
+impl<T: Send + 'static> Devres<T> {
     /// Creates a new [`Devres`] instance of the given `data`.
     ///
     /// The `data` encapsulated within the returned `Devres` instance' `data` will be
@@ -349,7 +349,7 @@ unsafe impl<T: Send> Send for Devres<T> {}
 // SAFETY: `Devres` can be shared with any task, if `T: Sync`.
 unsafe impl<T: Send + Sync> Sync for Devres<T> {}
 
-impl<T: Send> Drop for Devres<T> {
+impl<T: Send + 'static> Drop for Devres<T> {
     fn drop(&mut self) {
         // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
         // anymore, hence it is safe not to wait for the grace period to finish.

base-commit: 56785dcb2ef6d3cff82ac33f2e34db94377416a3
-- 
2.54.0

