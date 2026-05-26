Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA4D202C46;
	Tue, 26 May 2026 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799725; cv=none; b=UeFYUv+GEVWmEH7rT46FJnH7usj4gNNDLsUKgNUmcrK4mxYq6KUuzsq/t7Xjq3ud97RQScAS/7BzDGmmr+oHJ4AUDKkssrHUfmGfqPZ52b1mZj9HbsBSmigRCbK0qw9Ev43QDNz1KrMd60WnBiJezX7stwC9rW/86PPtCwg0dFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799725; c=relaxed/simple;
	bh=UOwpEywvReBxlJSa8WRr6I5xlE3BfWellL6x5zMCw3U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=C17aibnuNn9sIBwL4wHLE5aY0hgP2Z0/PECgi2EB2f9TLawQH1uUAQuBtELCSYsDWxqPYEne0CAXyadjV1w7gPEIB4YEFC5OHA+wXaYpw1sNIhGdAalq1WUjL4iTIw3JdIWsacMvCSwGQygXPF46CGTlBgLKEt4hxh6gMgbqad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7ogpmwZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7ogpmwZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256831F000E9;
	Tue, 26 May 2026 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779799724;
	bh=10S1dpfFVjq5u8j4580dT/3QIvhP6wAbEOriHQiWZqc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=X7ogpmwZXKkaTaTkL707Tu5fVBAEfcia+FVfbK/bSH1oVmwW0htQhsWaYAkr88jmV
	 gJSrpJQ2B9soag1bgKLXme6SeNNvRUuRhHEjSFdJohFvttHGOB2unbveGyl2SDzLQj
	 F0imoBN1kw9JGNaBCFW+tsKsaT7VrbQ+sIg0QRRcSd4yXT1flCZObIqKsMYQXRWNqq
	 G3rR3buQj/INq1CthOi8nYnwctm/uY2I8zb7Uehq5RI3PJBatRalb24DoV4fA6xlcs
	 QCbL8NpJEIIaQ9MOe83Gq+ua3Q3S5hJ73gH1TkOCe/y7E93fBmE1kd4AfeDj0kW+HB
	 q84rTPd7iiBnw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 14:48:40 +0200
Message-Id: <DISMCG7D9WRT.3BLQZMEGSWXDB@kernel.org>
Cc: "Biju" <biju.das.au@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Prabhakar Mahadev Lad"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-renesas-soc@vger.kernel.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] Revert "driver core: Use mod_delayed_work to prevent
 lost deferred probe work"
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
 <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
 <CAMuHMdUzjj3dE3wQ84XGoP7RAfKxRAChPnbzkAW8NnrPhtoeoA@mail.gmail.com>
In-Reply-To: <CAMuHMdUzjj3dE3wQ84XGoP7RAfKxRAChPnbzkAW8NnrPhtoeoA@mail.gmail.com>

On Tue May 26, 2026 at 2:46 PM CEST, Geert Uytterhoeven wrote:
> Hi Danilo,
>
> On Tue, 26 May 2026 at 14:09, Danilo Krummrich <dakr@kernel.org> wrote:
>> On 5/26/26 2:03 PM, Biju wrote:
>> > From: Biju Das <biju.das.jz@bp.renesas.com>
>> >
>> > Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent los=
t
>> > deferred probe work") introduced below regression on Renesas SMARC RZ/=
G2L
>> > EVK:
>> >  class_for_each_device called for class 'devlink' before it was regist=
ered
>> >  WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13=
c, CPU#1: kworker/1:1/26
>> >  class_for_each_device+0x12c/0x13c (P)
>> >  fw_devlink_probing_done+0x58/0xa0
>> >  deferred_probe_timeout_work_func+0x5c/0xb8
>> >  process_one_work+0x150/0x290
>> >  worker_thread+0x18c/0x300
>> >  kthread+0x114/0x120
>> >
>> > Reverting the commit fixes the issue.
>> There's already [1], which should also fix the issue.
>
> Thanks!
>
> FTR, that patch is not sufficient to fix the WARNING (on RZ/Five)
> for me: I need both patches from the series to get rid of the both
> the warning thousands of "sync_state() pending due to" and
> hundreds of "deferred probe pending" messages on other Renesas systems.

Yes, with linking to [1] I meant both patches.

Thanks,
Danilo

>> [1]
>> https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kernel=
.org/t/#u
