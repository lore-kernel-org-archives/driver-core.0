Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484748;
	b=IBCMel6WHZ+p2NmUZrAOVo4iw4O1sO01xNbnCKn74u3aO7fS0Df2mMSEyI0Ecu6Q5hHw
	 1gph6w/cxPmocfYwP6KjLf7fsDW+o1XvhZf8NHmrp03WflzXgZ5KFRlxbpBF/9AuN4Kew
	 ziXxF2JdMylGAG27/CowA8s9rXd/vKVXiw6ByDScuB1QAWrXj3Nc7a63PV5IEjwnJgnf2
	 NN4PzdDH8G76zpXyczLq1Pq6PIEMy1WjiziY4ZO3aln8r6WtY1rpARPCY6z6/w+k5rfVp
	 2deX8g4T6ep1AC4pGlYABdPHKbIUSneO0nR5DZtz6Kuc77ZFkICtkYt61SMNjlKaBew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484748;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=jPxyRVxUkD8Td+9QwNyvaWaSg+CRoePkY9b5UHxne8c=;
	b=AckSaLcxhRgTRZGmHhLRCkyNqmhuk3oNvFFwe6dhVJTVqbEuDdTHytYW/nI/LHZEbjXF
	 lnEJcSwyPsLy/53mxfiCsp5jUPm5EVZxWBVoizIpMTMHPa0JBLzJSvy5q54z0LugnGcIH
	 i7yaGDJopj0h8/RYMDxq+J2Uh06cPiUxsmUOjxN2BMpIMrrgtPqDVX2ywxMsqILn9McV1
	 GjJtcPMEuCdqDtwiI47Fn5D57XUFukUTvs8bj8atNEgchwBAuaiiptPULz/tL/+8iUm+4
	 DQpHWuNevYikfrh8TGNwzkmBY7emXPGsul0QH1m+IGY0Qc41owra3C5k3SCGfPySVFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YD9ZRw1e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E65606A31E;
	Tue, 20 Oct 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YD9ZRw1e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792484747;
	b=hTIJtvSRH2k49nX6d+50Tro4sahNt4ZbWf/U/WUggzaqM6eD/WrJbIqTsr9vKGA5gB86
	 JMnRj8E4zDXskzRIBAOVR4xCZwv6m9g8PtGEkkXRwxU8kmfwmNr2NSKjctk3K0dk+bSfb
	 oneP7KxJACLm0g2tujFga0BY8sdiX/WlNSyAASor+bJh8nORDjrWH0H1RKCFIb33y8lV9
	 JBwLS6blfUWhhq7Zqn3u1+wPrsmsB6f1/pWZeX8thokE3l3gK6UBFANVhdwCT4+tmwJlH
	 3luiq/l+dwRnv63qjV0P5QRgIffiSqoTHU5R69iuK32Hxu9F8eCos9JDYup6XYTrA7w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484747;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=jPxyRVxUkD8Td+9QwNyvaWaSg+CRoePkY9b5UHxne8c=;
	b=dKatv3KDTnujupP71/V0C99ssfgpTxF3JbVdauQpPBOCNMxRkSp3Pbt3qBjeQm6yvvGT
	 lHA3j7u3ANXBzZR4KX9t/jPpTBV+1ag/fZMDTclTVoTlUQbIyLKn9ue4BzPMhJ2/LReja
	 olOBfiToR31xqTE5AEaDWKlPLfyT5vcpynDqJLZyo5hg7EevYW7FxAd8l7+Xn0Ei6Qn1Z
	 PQS25D7kLu7OtYWuEXT+dECQHOITTR0GsexOx+ogm2GwefJWLK4IZ/w/nIkHPSB09gUlr
	 sza3PUaBUO98XoeZ/sN4a7mqDEFg7DY7RQlKpKUpj/Uml9tkVWn6r7Zz2LTPkUuF0HA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4562E1F000C7;
	Tue, 20 Oct 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484747;
	bh=jPxyRVxUkD8Td+9QwNyvaWaSg+CRoePkY9b5UHxne8c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YD9ZRw1edhudz76MTNsrjlEf4hfWQ7z+8WgT/xIwtiZ1qTEz8z5rMMEmhE7vVzxcy
	 rQcNJd8kE9JVl+3MUoQJHpZXi8W7RkRL43FRMc+QRp35wvYeQuQfrqQe9EwMc37AJn
	 Mb2wmSa49WKkaY5OY01Cw5Y0F0QI+URCdsQLbIrADAkrKb5agEVOpjD+87zqtUIN/F
	 6yieJWhW8QwcVg6IG3CCP2oDVugkrQXKr/wBX7lf5pjfopRhRv+WYPgJXCN7Nm3RY/
	 wJrChpQCxPs+mgXTuTrU0Kg3ZljzjCGlyk+fJT1VSX/zzKTU8BL6Xl4fyye/NMU2Ri
	 pQ8AeWx1pYJlA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AF794430D7;
	Tue, 20 Oct 2026 08:25:45 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 20 Oct 2026 16:25:20 +0800
Subject: [PATCH v4 03/11] rust: sync: arc: relax `ForeignOwnable` for
 `Arc<T>`
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-tyr-ioctls-v4-3-704de77da223@kylinos.cn>
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
In-Reply-To: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 driver-core@lists.linux.dev, Ke Sun <sunke@kylinos.cn>, 
 linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792484721; l=1389;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=E65clxOu/qjNbqNDrRBBfaWHB/W/gvw7JStoVkgnAT4=;
 b=9OwCtSZSA8ESXlncgmFEdWkXp304HK2DH1QRwr3SpIWHFMg8uWBiTUZC5Hf5v+z/VV9+TF7dw
 4om5xcnMwqkBO3IoqCJ1E6WR15C8MP4tWxyhVdQb1+sbDG3gpEGztpT
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Drop the `'static` bound so that refcounted values borrowing from a
driver registration scope can be foreign-owned by the XArray
abstraction.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync/arc.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 8ae0fe6f19ec0..9b582a815f888 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -363,11 +363,17 @@ pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
 
 // SAFETY: The pointer returned by `into_foreign` was originally allocated as an
 // `KBox<ArcInner<T>>`, so that type is what determines the alignment.
-unsafe impl<T: 'static> ForeignOwnable for Arc<T> {
+unsafe impl<T> ForeignOwnable for Arc<T> {
     const FOREIGN_ALIGN: usize = <KBox<ArcInner<T>> as ForeignOwnable>::FOREIGN_ALIGN;
 
-    type Borrowed<'a> = ArcBorrow<'a, T>;
-    type BorrowedMut<'a> = Self::Borrowed<'a>;
+    type Borrowed<'a>
+        = ArcBorrow<'a, T>
+    where
+        T: 'a;
+    type BorrowedMut<'a>
+        = Self::Borrowed<'a>
+    where
+        T: 'a;
 
     fn into_foreign(self) -> *mut c_void {
         ManuallyDrop::new(self).ptr.as_ptr().cast()

-- 
2.43.0


