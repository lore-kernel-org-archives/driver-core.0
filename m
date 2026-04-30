Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECD2F99B8;
	Thu, 30 Apr 2026 11:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548547; cv=none; b=HPedE3nY41jCC4UcG5nQWBtegLu96e29SK6AykjGaCzWfp6jP90hS39j1ol4qxQMJqWD/VYQTrtMz7e1uNjIrwlp4DxUE78Ts8d9vH4QqWY0a516q7E7uHzV4c95fJhI9u4UGEDn9A2PdmJMtRnYVvjmW3IlAL73WIyT3xDMZiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548547; c=relaxed/simple;
	bh=yLEKq1jEfnnqlEr5lHsldkCFIgy70K9+JW7Gbwr78W0=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:Mime-Version:
	 References:In-Reply-To; b=fohtDTPzDfKfx1mIiTomrQ++CBhOQWcwRAy456e1zww7DdcMOnYHbIyVZaQD+jLzEnr67Vo+O1fygprRVSk4dcQDrpiGxGdQpdx33OYjb+cIr1qvIeERbqSQmnOLbVC/FJTTVm7NXPgk2OSXX6JRVPuujDTvq5nxU4WJlyZMgDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbD0u64t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbD0u64t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDEEC2BCB3;
	Thu, 30 Apr 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777548547;
	bh=yLEKq1jEfnnqlEr5lHsldkCFIgy70K9+JW7Gbwr78W0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=gbD0u64tsTTxDcH3z0Y6EGCWAApAz8zEm8MoCarw+ZxCYm985pFLRl+93nZFbwCnB
	 xL4VabaPfra7CBBmCSGiavSai5TeNgp1NLKJgCzHoVyu76Dveu+TSpvgnQgo9RLXt7
	 eQ4/Iv8RgzI37ahK0qXEIZuk795YidYIlS/lrtKj5HG0QX4iek7+4d7jfkUUriWHiv
	 mFKqQQZx6idGINfNCloWoYk6EaORpmcoqMUqxmOPXM1vz9cGaWlGVxiS+RAf75FqoY
	 BqTqcW8awB5uohSoI6xs/tKh1JxrulxfKFYHBlyHK0ZNqzvQPMMsOb75/TCbKDUEUu
	 sAQ2WGlXLgnHQ==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 13:29:04 +0200
Message-Id: <DI6GDC8EWUB0.DECLMP7NIIRH@kernel.org>
Cc: "Johan Hovold" <johan@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] driver core: faux: fix root device registration
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260424153127.2647405-1-johan@kernel.org>
 <20260424153127.2647405-2-johan@kernel.org>
 <DI54XY4CNFCD.30M3UJGK1M3BE@kernel.org>
 <afHapCZz5C42euaD@hovoldconsulting.com>
 <DI5KV97TNS9D.28EQTYL46PKT1@kernel.org>
 <afHpUxQ5U_4RWjDZ@hovoldconsulting.com>
 <DI5PDWIV7N7X.16VB7OPUTJ6ZK@kernel.org>
 <afIdl9VcaXxBb0Ll@hovoldconsulting.com>
 <DI5WUT6CUDAN.3SI10HVHF3NWJ@kernel.org>
 <2026043054-limes-simply-e9ad@gregkh>
In-Reply-To: <2026043054-limes-simply-e9ad@gregkh>

On Thu Apr 30, 2026 at 9:00 AM CEST, Greg Kroah-Hartman wrote:
> On Wed, Apr 29, 2026 at 10:11:31PM +0200, Danilo Krummrich wrote:
>> It's not so much about what I want -- I just try to stay close to what t=
he
>> guideline is, and only deviate when there's a good reason.
>>=20
>
> Personally, I think it's good to backport this.

That's good to know, I personally also lean more towards backporting such
things. But for the above reason, I did abstain from it so far, unless I co=
uld
really make a strong case.

> The rules are there for the stable maintainers to say "no" to, not so
> much for us to be extremely strict about it at times if it makes sense
> to us.

Thanks for clarifying!

Generally speaking, I don't think this is about being extremely strict abou=
t it;
the stable documentation itself is rather strictly worded I think.

I wonder if we can improve the wording without giving up on the "stable
maintainers reserve their right to say no" part to better reflect this.
