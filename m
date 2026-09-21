Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736245D5E7
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 10:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985219; cv=none; b=mHOwPD7Dmek10adrpPqOt4RsA2aLkunsD2e1swWBDHN6gADG+rC2wYYnD+7FO1QHkzDI0w5r5UaWs71sD0ukKa0O3Qboo3WhTVmzFcli+S9FjBjjxWyhMxIJhixxzhNOUlQxwerhbTStwn6zkflliKi2VYnFRq7Q6LG5dLL6ftY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985219; c=relaxed/simple;
	bh=qjxNDGZRSox1iiMB6SnmMNagxZd9u/kLfpnd4P1L180=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hBltQorWlxLp21xfypAblelQhkjt8UbOqnLXIN8FbN8HSG+JhPZlnxBANTK5AxUPwa4ZcuzbIZECmsLpkh6Ek36YrMTIP9VYzKs62dQMU6iVE4MJJgbAOSyu7UBPJxKKP7L/cD8Z7bS1Oni7u2gVjUvY5dABNj9iAWfnYRVXuuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l4yUviIS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l4yUviIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985213;
	bh=qjxNDGZRSox1iiMB6SnmMNagxZd9u/kLfpnd4P1L180=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l4yUviISlNFUpqJsL8dMM5sYb32uoC+XpVNNrwIvWtCfI5HCNTq8mCfuNccddmYWu
	 1T8AdiWnWRDWafK20MdNpBExx0MJPRx27VmAY2F3PUhcgxW18MkuYI/zGu+najSO0F
	 CgY1nnzPS5NMsu6u4zdVmGx0kbaf5T/msrac9sM6uFxD5+FT24zmiJbWYw8nqPHZ4V
	 Scv7SPk/HNYUD8ftMeXqti5Lq6Jixw/xC51PJ7rtYyoDUQXZAU1vYjtq8xKlg6yXqJ
	 jOzUcKkyuj2SJXVjuOofjL/pKm6YElLIDgBkW4+g6GdyQgYsnPD7YmVSB/N4yTnY2n
	 XBpVGNurTONTw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDBAC17E09ED;
	Mon, 21 Sep 2026 12:06:52 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: gary@garyguo.net
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	airlied@gmail.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev,
	frederic@kernel.org,
	fujita.tomonori@gmail.com,
	jstultz@google.com,
	kernel@collabora.com,
	laura.nao@collabora.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	simona@ffwll.ch,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev
Subject: Re: [PATCH 2/9] rust: io: drop the CONFIG_64BIT restriction on system memory u64 access
Date: Mon, 21 Sep 2026 12:06:41 +0200
Message-Id: <20260921100641.228824-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <DLFUKN84E2XS.33S0LZHBMAWH2@garyguo.net>
References: <DLFUKN84E2XS.33S0LZHBMAWH2@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Gary,

On 9/15/26 13:18, Gary Guo wrote:
> On Tue Sep 15, 2026 at 11:57 AM BST, Laura Nao wrote:
>> SysMemBackend's IoCapable<u64> impl is currently gated on CONFIG_64BIT,
>> copying the MMIO backend's restriction. MMIO needs that gate because
>> readq() is not available on 32bit. System memory has no such dependency:
>> a u64 volatile load/store compiles on any architecture, it's just not
>> single-copy atomic on 32bit.
>>
>> Drop the gate so u64-backed types, such as bitfields, work on 32bit too.
>> Document the non-atomicity at the impl instead of enforcing it at build
>> time.
>>
>> Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>
> No. If you don't need atomicity, please use `copy_read` to read the value. It'll
> compile down to the same volatile read, just without atomicity guarantee.
>

Ack, thanks for the feedback. I'll drop this in v2.

Best,
Laura

