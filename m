Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397DB2F7EE5;
	Thu, 25 Jun 2026 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782422658; cv=none; b=jSQqecdAtQLak4MAskE4xyra5ftynHzI37QO0qWlC0+7Igif1eDA9Ti1Hi6AVH2+T6p1qbzHerLrspdRCKw6MPEoeoYHFC1giwYkY5UUWhkhpzyVJIV3rgOj/TAP5o4v1u25hI+BL0jwtjiZkrnqByECmyfXlQEayYFSSUAF+9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782422658; c=relaxed/simple;
	bh=O9gPrPRtnPkS6+0VIPhtb0MaLnk8hupHxF+uQV1gV3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAqsbBga+uHkmdquoHeb96IZu0NFXz7FqY69YTZXoNXu9yhZ1QMiqBjUUWbkHn2NQc5SyA8ars7gUBf43HO2PlM5nDRg0VnIGdypUDtpoCKrpHJ4fLM/qDH0JkzGxSPF6bNXFSQSTqaCB32lR4CTX+O7yqtbNxtk9QD78bNbLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXaG0RFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXaG0RFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2671F000E9;
	Thu, 25 Jun 2026 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782422656;
	bh=wImZ55sVV9nR2X0lKBaLNBzw+hjAxNnCMhbKwyH8aIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aXaG0RFQ2QD6DQCWgtnBEW1Fo/ftIhfkexvZt0D32is5v/ZS9+MlTaUQxnm2VZTtM
	 31Usjl5AD3CIpRNfKuLtC8jRxljf2PvrSCxTddGaQjlQdbzll39yCZ2MmRqGRigE0g
	 pRhiopc5kg8pPWvHV19qK2yS9tSQd/yhOTthcgysbZ1QpJYUEfnbKqKJIjL3f3UTDw
	 +HlM5LHosr86Kb5JwdOTzjOKmdrpkYiVceZlFFLGul9zpuSN07HYcEVb5q45eEV/f8
	 lAezZYXiEtZnmvqYFKw5mfV9phwf5qNel1z4R7V+EnnjGYn/Y8sg/YRk9vg/XcuVIz
	 8tgYvK0DJe8yg==
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Alexandre Courbot <acourbot@nvidia.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: (subset) [PATCH v21 0/4] Rust bindings for gem shmem
Date: Thu, 25 Jun 2026 23:24:08 +0200
Message-ID: <20260625212408.1618423-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612194436.585385-1-lyude@redhat.com>
References: <20260612194436.585385-1-lyude@redhat.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 12 Jun 2026 15:43:32 -0400, Lyude Paul wrote:
> [PATCH v21 0/4] Rust bindings for gem shmem

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[3/4] rust: faux: Allow retrieving a bound Device
      commit: fa8cc4e3067f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
