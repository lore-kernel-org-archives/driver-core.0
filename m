Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6571C84D0
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786042875; cv=none; b=rNIKbl+GhNJOkY8OB+GpqaF9tl4lK9LyUxI8jHifgXQYFO3G7+C8VGxSuXd58ElL3mghhvNJf4zTA7MZfD6ryUi9fokdr6Ji0VebieJXypI3v4FGLUwpaDudhw9Jo6Wr+5VjEqdz8tNnoPaVALn30uRtSAeZbT9jnRzIrc6eKlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786042875; c=relaxed/simple;
	bh=kqmQK5zg44qvP9aNfdr+OVgBwoeTUSCbo/q4UOkyxGc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=lzwtPauYVssyZHtmM8dmXl01Qqd31OqGhENnDTo5T9wziwQS2hMqMnMWViSBUnnJl4m4jHGyfj0poAZSyKacifZHqZ9bBG0G5ax+5A9zJM62CMjOhpV0YadBL7SU6XoVoFT7RP0dUyuIgWc6dN3ZE3AN+ybT40A+8xLUXt1HNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYh36jig; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYh36jig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F261F000E9;
	Thu,  6 Aug 2026 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786042874;
	bh=kqmQK5zg44qvP9aNfdr+OVgBwoeTUSCbo/q4UOkyxGc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=IYh36jig7nWytfztAvhEefvU3VF82TOiGfVlfboulF4qblg2yhAZTb45VDS6LvNyN
	 LXcAGsRsM9tF/8V73PcCDsa1Olr3LdKiKfkR+mWbzHEb8veNm2UQw89xx3oj0FeJoI
	 /uUPx+jqm4Re63TJ9AERjwx1zgFrihwPiQsqjgbTlJfKxZd30j/Solmv6bj8a080pv
	 EbJMHT7PYSndU00JGpfGJPBHPZLrgJj5A7ebKzjTDNYnDegbqidOQ9SVXNrHWYCsSw
	 pKt/QBqk59WKfJnQF/H9b6k++Wh4RhPo+3qYPLj99pKIxSt/BZTZR80ZvAK6hUtGzU
	 RTI4vrKpW3SvA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 21:01:12 +0200
Message-Id: <DKI3CWI7Y5T1.2DS54JYTFSVSN@kernel.org>
Cc: <mcgrof@kernel.org>, <driver-core@lists.linux.dev>
To: "Russ Weight" <russ.weight@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove Russ Weight from Firmware
 Loader
References: <5o4r7r76h4areyfolngggnzcd3msquwgubly6xjbz6zdvoha2i@doazljuavhgk>
In-Reply-To: <5o4r7r76h4areyfolngggnzcd3msquwgubly6xjbz6zdvoha2i@doazljuavhgk>

Hi Russ,

On Thu Aug 6, 2026 at 7:19 PM CEST, Russ Weight wrote:
> Russ Weight is retired and is no longer actively participating in linux
> kernel development. Remove him from the list of maintainers for FIRMWARE
> LOADER.

I think we should also add an entry to the CREDITS file. :)

Also, should we update the contact information in
Documentation/ABI/testing/sysfs-class-firmware?

Thanks,
Danilo
