Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96FB28DC4;
	Sun, 12 Jul 2026 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870563; cv=none; b=fcuRSmtLXx/Nq8g4zcg+YtWuf370R4EV+1QGGpvlg/5y6NHf1gGnMkixqkIDzO67tRZkpdiR/5pcBWORVJ7XsG0Er+JWWL7MafgUiypqVRic3dT8TQ6JvKHdrbcBgu8bJWNhnRDLPJ1ly4NgOYLV2QOp/FrI/yd1myYvuHEfxgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870563; c=relaxed/simple;
	bh=B9rETD3vA+o8MvcBCmO5gs8wucqijoyXazRRPYjA+Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jjiZXmgkfztfnHBpX31L5Kk//gecZ7X8Yw8z8LA+7CnZoULMoxzvAsxUJhzyBYZ/gLhPg1SZ5sKfoInb/DqyaShPtfLDVfpDaakeMa+iwkbXwYz2PqpodbnPEdVYEet+PEsf8babGG7yr9zzWvNFfu9gKjgfpZfh1OIHUzS4AhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YM1SkcF7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YM1SkcF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6B81F000E9;
	Sun, 12 Jul 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783870562;
	bh=/c8dQlrD+UopIRGkuo0OWH1leob6jgbBkZdHtJYCJ9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YM1SkcF7SY84HKWxBJqeyCkrPQB8hvipq1YbGjaTSOLWX2edqyfRC7/aRJY46FRVQ
	 8OppOKhkEskZ1hFCJd8S15txrxcTrRJmIb/NqLzj49jVXwk3QgP4vq8zC4p9A8mBmi
	 CxjTipfMBJocq1yS3ImtkUJJgX4VYcgU4E60RQRYVPmMFUv2j0sJ/zhOPTPedhTHG/
	 A2WKkWkva4pDBjhwgQeL/3PwoU0A/3kGrtD8nLcDUrtjD6OG4vWC+JcI4QAwNZreMZ
	 QU98zlLyaGlSsvG2T/X34wZJvv2XbSrTxW6uWGr8nrYkuhVbDUSKuvCM2U471/109U
	 h1ezctZwG8/IA==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ecourtney@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	deborah.brouwer@collabora.com,
	boris.brezillon@collabora.com,
	lyude@redhat.com,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 00/19] rust: drm: Higher-Ranked Lifetime private data
Date: Sun, 12 Jul 2026 17:35:51 +0200
Message-ID: <20260712153551.1097724-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260628145406.2107056-1-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 28 Jun 2026 16:53:20 +0200, Danilo Krummrich wrote:
> [PATCH v5 00/19] rust: drm: Higher-Ranked Lifetime private data

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/19] rust: drm: ioctl: fix unbounded lifetimes in ioctl handler arguments
      commit: 68b151bc6145
[2/19] rust: drm: rename Uninit DeviceContext to Normal
      commit: fd0f827c532b
[3/19] rust: faux: add Device type with AsBusDevice support
      commit: 893f39dadaa1

      [ Drop redundant 'struct device' invariant; implied by valid
        struct faux_device. - Danilo ]

[4/19] rust: drm: Add Driver::ParentDevice associated type
      commit: 49e27d58a06d
[5/19] rust: drm: change default DeviceContext to Normal
      commit: 903001300874
[6/19] rust: drm: restrict AlwaysRefCounted to Normal Device context
      commit: 506a7d63dab0
[7/19] rust: drm: restrict AlwaysRefCounted to Normal GEM Object context
      commit: ec8b2cc27c76
[8/19] rust: drm/gem: remove DeviceContext from shmem::Object
      commit: 7f994b8912eb
[9/19] rust: drm: split Deref for Device context typestates
      commit: 1c8a1f88ac32
[10/19] rust: drm: pin ioctl Device reference to Normal context
      commit: 499eb35cd477
[11/19] rust: drm: add Ioctl device context typestate
      commit: 86b20b11505d
[12/19] rust: drm: Add RegistrationGuard for drm_dev_enter/exit critical sections
      commit: 2455d5f2d5e8
[13/19] rust: drm: Wrap ioctl dispatch in RegistrationGuard
      commit: 478da53e5b68

      [ Use imperative mood in commit message; clarify __dev_ctx_cast() doc
        comment to reflect Ioctl-to-Registered cast. - Danilo ]

[14/19] rust: drm: return ParentDevice from Device AsRef
      commit: 47f600d40bc6
[15/19] rust: drm: add AsRef<ParentDevice<Bound>> for Device<Registered>
      commit: 453197b7cc32
[16/19] drm: fix race between partial drm_dev_register() failure and ioctl
      commit: eb197f7d60f0
[17/19] rust: drm: Add RegistrationData to drm::Driver
      commit: e15b88223dc1

      [ Move registration_data_unchecked() to Device<T, Registered> impl
        block. - Danilo ]

[18/19] rust: drm: Pass registration data to ioctl handlers
      commit: 3ba210061c29
[19/19] drm: nova: Use drm::Device<Registered> to access the parent bus device
      commit: 354a8f8b098b

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
