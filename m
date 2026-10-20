Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484752;
	b=XElHSAoIx/bzU1zS9eq0KnwgdvAFZNyPTposLoOgbjE5aGPK3lxB9UC1REbynK7g7/44
	 JuS00DTXhzdkvaK3ec0u4Y1LswdQpg1dWHe4BlTNpZ1jehim/8oB+RZ/ADV2w9h6sLyQJ
	 34YEuF4T8usGPBGpyERcDa38mJKKV7eyCcJYNUdUJZZ50ck1tGGYFdd7IClHS9hG1WIQn
	 rnMEegVko9TXJkb2vePfOajaH2aoOHTorhvYFWk4z8UF6onqbj1iG0JciMCuXypY1rVdE
	 tyDaXLKhVLVwkV9e+IGZu6JbiO7umKBQ7hrjALTJPydE9RFoNKvBGs6Zc7D6In57YDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484752;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=XH3G2A7GvTP/8THrs95qFRMJKqXgEWRG0Nu2DxafnUo=;
	b=oXH7Pu25hijy43s1AZxfiBlAtjGg9gWV0vNnJmmzDqI3/hulCBYVWA1VMRzuL4BixP7j
	 BDNxtljRUHMO/A3nVreJuOOhbBvB+nTGXdxE8bUAN5eMDKBqIcGXAnKHdojXZgOGG2NxT
	 08ka/OG30F1asfapcuclXqzCGJWDguRGMNrHbPjoiziS7L3ZSzVS76zeyBpRhLxWAy9Ef
	 CGSfyK0lYdpS4v1l1z4nrl6ebtLIlZlSLclTlN4b4tJO0ScgEFDnLRamBM+gAT2Lh1ALz
	 IsL3kuHDoOF2yp3Frc14P3IMXmEcuF7Gc+RasZ/Qx7qz3sdCVt0InRucVZ6MoZorJsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOoPCDk9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32879606A324;
	Tue, 20 Oct 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOoPCDk9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792484750;
	b=vFR9lBezz2eRygNB6k2yIKrBNOXBIOQl3bmVaUL0QcnmAQLHKZ5RHoeBzKmIoN3EM7WD
	 U7jTRpGdhTgHK2yvqN2CrK2NuN0ZFSgMWf5GKFKiKXwFctxG4XJsJ99iVUV7HEbnunErD
	 m4VAPNj0nE5D+nZMpyqAAd1idNG9FF6lRKdmutKP7ple54IpKUcO/37yz4ChoYAkTuHg1
	 /apoouVx2+a1xx00rDaVO2AFJ1Z0KrgQYtj4Kql1a2Iw1Ex2IGWSSkCyXXmzxIqeSeMVM
	 5Va2kTVJ5mfVwIfaRJ8HmhXO80UUeoLaZsUA7ZUJydElbav24VU+uKJXotdRKIhUjkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484750;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XH3G2A7GvTP/8THrs95qFRMJKqXgEWRG0Nu2DxafnUo=;
	b=Tayb36gh8myaj+EGWsbkQBdtX9Le36csgTtOgxVh9jC8vLazetu+SlcwVqG9odP+p3GO
	 EyGwsHPTW7wQuuP9esd64EvTvog+EZrIYU2Yg2f3zymEkj1X43E2F/XPQLQNwZIR2k+Y6
	 x52x8uwDgspsETS+kie6odixGseXMlphGu22uCEyM9v0NbX97vv2HXIWlPokGdNloLPjl
	 /pgKP75etxltccPQMemHkaQ0mzfdk3NTump4UOk4oevrJ1q8AfS6azvfQ8AWFsYA3VGcX
	 qT3UNHtS9p1mv3zeuC823Ci+1ydMZA9+PLmeQstIMovJTmX0z0NZkYEZJAK8HXiKyRA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 454001F000C6;
	Tue, 20 Oct 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484750;
	bh=XH3G2A7GvTP/8THrs95qFRMJKqXgEWRG0Nu2DxafnUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FOoPCDk9PzDegt6Ndt3/T661sc0aPvg+kg0CDgIGE0akL6hmy9hiozw2sF3tlnUk7
	 js3SKixbeKTvTfNMSOtqT/Zyvfpjqp/6LgRM/LkmzA9sA++W9niSL0sWy7HZypceHH
	 dPrkw7eAaDNCGY7pJw+VMswkN413HPB2QTGCbHl/mP7fx0C9AdPxWmCyfRQQzYrAdU
	 XadcvH2Z/qj9r0WgTC5LPsYk8bZwWEktSES58tKxNb28NdXfB07zoMNn0zUop4vIJ+
	 s/MXWAYeg6K0Eyq/3HgjFT7IixTGRmqcZG2l8ajUutvW31+Nu4AJdjgyhcFjzfuAJo
	 9KZhlP08kAQzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A81C4430D3;
	Tue, 20 Oct 2026 08:25:45 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 20 Oct 2026 16:25:19 +0800
Subject: [PATCH v4 02/11] rust: mm: add `task_size` helper
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
Message-Id: <20261020-tyr-ioctls-v4-2-704de77da223@kylinos.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792484721; l=951;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=JO+2MVB8/0ZEX96oFL0eP1mAOKrIibNCaD5F9FcB8NY=;
 b=QjR4/KrceM/lUJAWh1u5Li3pbdAeeC6usQbh1gPSp0AqYQSUbTxeaip2u8SiAsBDhfe3eTckS
 EzCvxT85ecCDWUZf9o/aQBSCiml2dioBcP5kuQUiKmf8Qu37HyuvpSh
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Expose the task's address space size. It is used by the Tyr driver
for splitting a VM's GPU address space into user and kernel regions.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/mm.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 4764d7b68f2a7..d2dfbb7d43972 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -149,6 +149,13 @@ pub fn mmget_not_zero(&self) -> Option<ARef<MmWithUser>> {
             None
         }
     }
+
+    /// The size of the process virtual address space.
+    #[inline]
+    pub fn task_size(&self) -> usize {
+        // SAFETY: `self.as_raw()` is a valid pointer to an `mm_struct` per the type invariants.
+        unsafe { (*self.as_raw()).__bindgen_anon_1.task_size }
+    }
 }
 
 // These methods require `mm_users` to be non-zero.

-- 
2.43.0


