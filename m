Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6753E4C81;
	Tue, 26 May 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797391; cv=none; b=VcpDqXNqLdTohZjvV7+qI05iK/V67VseHoj+3t4Oimyg0LACb/8unj/ez4KsjTR9wFJBVr8eBNgf8/GtrVwwVCSD2Tb3FmoiJKLtok2QbzaGm/vvucmab83+zGaLkZYy5+BiXF1m1W/W/4cNdD68kAa03ga3g/o49CVDb7u52YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797391; c=relaxed/simple;
	bh=95VJBcmImw7T+cFGswTr7XUpWB3sE+6tss6ytkzEa98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsT34Nv0teB2QRLUT+PFo/TxDR3gyYXx81zdkpnRaMAPQLMa0VtpY3IEnQlWc8xb0z6KaT5B7lzCfLZ41NUN0all/qn8u658mh855o3cqdbv6G+ROxw+H7rFtrJTKbK0sb+DbSxVKHchi5dbV51QPK2WDwG85Tc0jOb9XGw4AV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9O9eX36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9O9eX36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31431F00A3A;
	Tue, 26 May 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779797389;
	bh=AtMFYqEtdCuJrcazBXUODEBZ7PTudSVOUe8VhIjfp1Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=e9O9eX36S7TX/g1kHhDT+o+aL3QMnGaEBVft7LJr6Usq7OcN7qarLBu6x3F/hWEOb
	 H5Gb6fuay5cKMJ3vo0+cZwsUC2kTjZEWmUfPjoGAnJJ4IkV9N+7GIJG7JfieV3SHMW
	 aouZrofH7ChtJL/I+prAuyVZ3nGS06mAYlFYcZzrYMhIxKS25TFTzBRWElnqn/1giL
	 eOMwnsT835KpIJejW+Y5ZSqLsbvueULMOevGv2gIEU2iOKYqtZiHw8Bj63oDPrSpBL
	 FsTfelVrlOHgcraTDHTIp/FLtd5sTAmweUJbbTGyjwa8Fw8SvolrgcZZw2J0g4DfG8
	 SxWnCubEzxUdA==
Message-ID: <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
Date: Tue, 26 May 2026 14:09:46 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost
 deferred probe work"
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/26 2:03 PM, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
> deferred probe work") introduced below regression on Renesas SMARC RZ/G2L
> EVK:
>  class_for_each_device called for class 'devlink' before it was registered
>  WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13c, CPU#1: kworker/1:1/26
>  class_for_each_device+0x12c/0x13c (P)
>  fw_devlink_probing_done+0x58/0xa0
>  deferred_probe_timeout_work_func+0x5c/0xb8
>  process_one_work+0x150/0x290
>  worker_thread+0x18c/0x300
>  kthread+0x114/0x120
> 
> Reverting the commit fixes the issue.
There's already [1], which should also fix the issue.

Thanks,
Danilo

[1]
https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kernel.org/t/#u
