Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21733CCFB0;
	Wed, 20 May 2026 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301176; cv=none; b=mAvobrI66fwsMW04AwrBiGxOpVNgmPFw8YqoB/q+9ADaSqI6/y7wr/iOmzyS2v4GkCzZjjtuX326q4YueM39mdYdfG40GJq/BM8FPc/hyoMFxmcUFw+FmpBzirZwJvBNikv9rhCHj5YS8mogPt1V5GnLmaVIMPYymKhDN/s4NSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301176; c=relaxed/simple;
	bh=VuHUWHwB7gVrowq/vm9phUdpZZgq+NKCqtXaFehR50s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=RDs6CqHsZBshbhzJ/mTj3fcNhhItFdf/92vRMPdlEakkTI0oF7zCH4AaWXjYzEVd0xifqoI0O+iau4mbOVSxm/VrLShfnfxptz+OiOVZJzf2B8a0d4M3jE4fuh+Pp02Gb5xW2+cpwBA9pbyAKCYbWQ1xQaI2BHHvfSZF2X0z63M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOhauweZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOhauweZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9451F00893;
	Wed, 20 May 2026 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779301175;
	bh=tg093BcpkpUpDBMTayGuZbAedTRk6TygM1DRnS3fC0A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eOhauweZaGNc1BQBb4gBsTghxexO9sLUNZiSxpP0Dqrg5zFXrOkGVCCZfkg9eexrg
	 +Q1vKlpJhM06erL+glYDCVE1/yHKbAUTXzfV+wk2VVqtZQ2q0KUK61PtvkcvchrX8u
	 /zWgiPe+r4J+FL4KQn0SDwStr2qYS1WwmmhVpJ+oA7B4Yag5SHzH/1Ggtn4Ik2JchZ
	 vgfUkd6wwZIQnG5km0iYu5xUQLNogfoe2AxeNs1twbY/GHn37LwT3GDcs8V5k+C873
	 9XIxC60iMo1JwwNJ8RelDVtx2hV632PrCvf7SOqDyjSOJ8TXKQfBpsKWSjzQS2mU/U
	 /tE2VbFfKZbVQ==
Date: Wed, 20 May 2026 08:19:34 -1000
Message-ID: <3fb84b4c71fce994cfe1e06a5fe3970f@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	NeilBrown <neil@brown.name>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
In-Reply-To: <2026052000-drove-unicycle-d61b@gregkh>
References: <2026052000-drove-unicycle-d61b@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

Hello,

Two nits:

- Buffer is atomic_write_len ?: PAGE_SIZE, so probably better to clamp
  to that than hardcode PAGE_SIZE.

- pr_warn() instead of bare printk()?

Thanks.

-- 
tejun
