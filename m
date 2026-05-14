Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7E2773D3;
	Thu, 14 May 2026 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778785637; cv=none; b=aZ5yKCkJxO902hzR/AdyRSgYuhZZ6F6LMJqpJYQE7T/y8cClOHBPrxHJMXUjtkI30t3lyBEwHN2lhSSmUtHEnvgrOvmR6En7KGvHstycGBfkKzjL6+Z1LwxKgmcHwBm/0PiGVy+NmQLw7ivj8mTOSpHMUNQ7glrRUCSIO+xS0v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778785637; c=relaxed/simple;
	bh=eZ/bsr8dELRKsVaQsmQQFycLQQvD5qTpWQ3063ouFQQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rRNxKTSYsXIcqOe1Dwn3ifN4uswMahLzpCLVY7XdcTgMyBaum6KbNK0NtTMZNo4heBwNeXodOPNwaitxRNlDJVophRYbw9wKvK+NoIIstmtutrXTi1ReX9isO3TmTm+keGzf9IwhJOdbawlSVvrg7PT4Wlz53k2G66DcWe/vHr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T021Zb7q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T021Zb7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35E3C2BCB3;
	Thu, 14 May 2026 19:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778785636;
	bh=eZ/bsr8dELRKsVaQsmQQFycLQQvD5qTpWQ3063ouFQQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=T021Zb7qWOYy/Ua5pZN5V8DGB71g0T8UIfLIRegjU+lPCG01pTw7G4g9jqXdGMl6Q
	 Y6RillbUbaAMeAuDcrWm2oq0nDWe9g+1h40zuEtsYxG/DfZjxl+YTPB26ED1ON6L9u
	 I6e+rSHTRnwVtbZb5dW353UMhOEpVN9A4SLTYfg46ul8pIl5mxtF+QSmNWwE5R/nTA
	 oRs3VQsYBZHfrW66qep83BW/w8rdZ3mnUJfgGHypIt11Jz2GkiueA6JDu0wiWBgreD
	 XyUiAJTGOC3ZCy562689R9cR6A8ojSz9sXCgthQnHrlX4KJvv6KwNmUnOikpqLiq1D
	 Wva0bd3gXp6mQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 21:07:11 +0200
Message-Id: <DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
Cc: <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <daniel.almeida@collabora.com>, <acourbot@nvidia.com>,
 <apopple@nvidia.com>, <ecourtney@nvidia.com>, <lyude@redhat.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
 <DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org> <agYbppHWXk_hW99M@um790>
In-Reply-To: <agYbppHWXk_hW99M@um790>

On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:
> let unreg_dev =3D drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data=
)?;

You shouldn't need this anymore as the drm::Registration itself has private=
 data
now that is bound to the lifetime of the underlying bus device, which shoul=
d be
the correct lifetime for juggling the GPU page tables.
