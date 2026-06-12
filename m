Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930C39B960
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 19:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293508; cv=none; b=jG/1RSeghn3Zae2ZoGbtgnEVTHMOdbdMP/zA+qXBKG0lHiZIJ2nmbJw2oaXoGaVoTj+kpTOs9AgyqwTRaNg0xg/wRMvvIscZTRA2HrDeeGvIY+aytemmWR8+yU/WsqX76MFbl8zdu27fojxj8/x3/f/bv9eh57lP/01fgKrPZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293508; c=relaxed/simple;
	bh=wUKs8wOL7oZqorXMICjM4DiyHm7iouXQ1fTm952RXtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=kXz3tp4RlIZAaOgcJgMvldPDe5FheFlHPptpoboHPYoyrFmQBDJw6MgEzvGdpHvs5XB5cGHCuBk/WEb7o/jWOqL1hDeDXWyHy/m97lj65PPguCYTMyZYkv+jsrR3bHK9QEhRO6IVnQQxbeVw5kYkQ4WXmcjV/sOBQuie1kaVsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gkkYCuZM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gkkYCuZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781293506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7b8BfvuRiy4Pcy82h5os3g4dxiw9VsvNdGsH4ELAsj4=;
	b=gkkYCuZM9hPu6K9gBUpj5qiu23Ud3ktRC828mG1Vk9UVlWidFWb2k+Dr/8cJcIuYkPk7IY
	51YNiyRK/PHbqn626gLesh2YnuRKCex2jzklIL4RByOUOmdJ6FqZ3zcZjSVFYdBbI9Myel
	RTCCAs+oq5wziaHZrRk6jpWSfVDPODA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-192hq6shMfulbFCjN5AYqw-1; Fri,
 12 Jun 2026 15:45:00 -0400
X-MC-Unique: 192hq6shMfulbFCjN5AYqw-1
X-Mimecast-MFC-AGG-ID: 192hq6shMfulbFCjN5AYqw_1781293496
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 857911805C29;
	Fri, 12 Jun 2026 19:44:55 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.21])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D41B1404;
	Fri, 12 Jun 2026 19:44:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	driver-core@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	Sumit Semwal <sumit.semwal@linaro.org>,
	linux-media@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Benno Lossin <lossin@kernel.org>,
	linaro-mm-sig@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v21 0/4] Rust bindings for gem shmem
Date: Fri, 12 Jun 2026 15:43:32 -0400
Message-ID: <20260612194436.585385-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: SgBBDL_5wshG2d3FHgQ-w8i12-sBAW4RY1xnveMFqTQ_1781293496
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Most of this patch series has already been pushed upstream, this is just
the second half of the patch series that has not been pushed yet + some
additional changes which were required to implement changes requested by
the mailing list. This patch series is originally from Asahi, previously
posted by Daniel Almeida.

The previous version of the patch series can be found here:

	https://patchwork.freedesktop.org/series/164580/

Branch with patches applied available here:

	https://gitlab.freedesktop.org/lyudess/linux/-/commits/rust/gem-shmem

This patch series applies on top of drm-rust-next

Patch-series wide changes since V15:
* Fix some major rebasing errors I somehow didn't notice :(
* Drop the dependency on LazyInit, use the trick that Alice suggested
  instead.
* Fix dependency ordering so that Tyr can get the vmap stuff first
  without the other bits.
Patch-series wide changes since V16:
* Fix ordering one more time (SetOnce::reset() doesn't need to come
  before adding vmap functions)
* Rebase against the latest DeviceContext changes from me that got
  pushed.
Patch-series wide changes since V20:
* Lots of Sashiko fixes, excluding the comments that I couldn't prove
  weren't just bogus.

Lyude Paul (4):
  rust: drm: gem: shmem: Add DmaResvGuard helper
  rust: drm: gem: shmem: Add vmap functions
  rust: faux: Allow retrieving a bound Device
  rust: drm: gem: Introduce shmem::Object::sg_table()

 rust/kernel/drm/gem/shmem.rs | 547 ++++++++++++++++++++++++++++++++++-
 rust/kernel/faux.rs          |  18 +-
 2 files changed, 549 insertions(+), 16 deletions(-)


base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9
-- 
2.54.0

