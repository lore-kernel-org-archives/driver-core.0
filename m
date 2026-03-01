Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D21D2E7F11;
	Sun,  1 Mar 2026 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389221; cv=none; b=ZnF5Gwu3np9tuBY0Sst4Rju0VK+YAlLLs3/b3odV5JP9SFjaJgcHosvmckS9FdYbIw/QZwUsDfh4N78nLnU7DJLhRdzFDeqQ6xcdT9yMzgl8bK5EZFHFEuUAsDZz53jz7hwm1JNCquxW5ZL51t4HeXx6+dPcvuCPpbi1fiAvPDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389221; c=relaxed/simple;
	bh=LOfszlBgChulbY8U+otOCEhq6ZFQdPnsHKdjOUT8Wdk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=hjXy+VXzuPlZp8iyddYYFUPcDCJ9Z8ZbPQSfO9Nz6S1uMDdWkxo2fnGPB6CXL2h2WMCvSF1kNPX7MYBU07/ioQqhpP9aJ3c1mru4Jx88bYv3C5RVr/1U4ioRsiCDbp0e+4HAt/5xP0MJSmiJcADs6zuS9csPQH+DzOrMIkDO6b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxOCFsJS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxOCFsJS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C610BC116C6;
	Sun,  1 Mar 2026 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772389221;
	bh=LOfszlBgChulbY8U+otOCEhq6ZFQdPnsHKdjOUT8Wdk=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=hxOCFsJSv+PekHAsHjOfPum55FLdyxAeEf1DnJlq8fBZ2igjsx+4qFK5nGAs6m5yG
	 27YAFFqSKvkn81v3/S2tGY5bqgTdcnKx8Cm2YYBgex5+MIsxthB1ORPJJbPRDqFcBj
	 Miar4uemoXaSEguOq09kceY7E0uHBq+fOIq0Kb3y6N7J+oDxTmG3NCWDSIRQ0RAJ5t
	 S70Ans2vjAP4wvF0DArE7OiWC1vMuKZrorVkKseOjiv2UpRyc9I3vpSTuw8ea+p6+l
	 MTjIbYuJ8MAj53jsfMcHy4rC5kP+gus0zXqDR1I/zs6Ze1Sla5azBRnQ/yVIpezudz
	 IDeDiBrcf4cKQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 19:20:17 +0100
Message-Id: <DGRNJI1NRJC6.1UW5W8NCV547@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
In-Reply-To: <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>

On Sun Mar 1, 2026 at 2:04 PM CET, Danilo Krummrich wrote:
> Yes, I agree and in fact I already have a few local changes to move
> driver_override to struct device, provide corresponding accessors for bus=
ses and
> handle locking with a separate lock.
>
> (Technically, the "move driver_override to struct device" part is orthogo=
nal,
> but doing it right away results in less (and much cleaner) changes.)
>
> I do not consider those changes to be complicated and risky, but I'm not =
sure
> you want to see those for one of the upcoming -rc releases (probably -rc4=
/5).

This is roughly what I have in mind [1] (partially compile and runtime test=
ed).

Given that we agree that the driver_match_device() change should be reverte=
d, it
may make sense to land the first patch in an upcoming -rc, split up the tre=
ewide
one, and let subsystems follow-up with those fixes individually.

Please let me know what you prefer.

- Danilo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override

> Independently, I can send a revert for -rc3.
