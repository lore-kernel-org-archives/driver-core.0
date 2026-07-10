Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754D3ADBAD
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668226; cv=none; b=tv4VViHCv8z21H+SUFOXESVlFlcPlbzpTGP/wi8mIoG5UWXB/lDwWFV5cJ/Wwl8nfdfZOgNV6VfVU7EPS3egfBe8bUfH4v8rJAuuemSEHxXWPmBR4OQkN7TKrsDOM5P8crNHww4HPNthzh/lsYHMKha3ipcmpHQJw1rUumuw4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668226; c=relaxed/simple;
	bh=IOpv7B+XqxxUP6JaKskb5LnQnNg8HmLNK+R9eVVMLvY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dacwzh71R2bKlIecRx5e/x7kza4PdLOosfkMokSKi23cQNCQpBOHI3Nwyowg4DM9LaMcDEkLeOtOzH2ssfSl6WN70bo8v/EP3M3j6j1OoUttNctRDLuqXWAyYHHQ6j35Q7Ae0r1f2PK61kaZFPn6MEw3+XDX8MTyrEntc9HtjNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=lPUm3ys8; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="lPUm3ys8"
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260710072317a0214a8b29000207dd
        for <driver-core@lists.linux.dev>;
        Fri, 10 Jul 2026 09:23:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IOpv7B+XqxxUP6JaKskb5LnQnNg8HmLNK+R9eVVMLvY=;
 b=lPUm3ys8Lt3UervoAG53DZAGvuZsl5JBLleGryMrw1lWExvwUIg3gE9WbBcQnaS3zkHKaq
 deASGHHiGWZCE/KZnGM5utLxiH20i+cxYVeBgHgcQssZ1MjBJQxGUg9aqTx0oWY2UhlIpo2p
 7agWSVT8t6q+iY/VY9q3+ZyUKqEX3jrZyKUmJyDlLm35pZDZ342lSvecd4/JMWx7NmJ+LTqz
 VNsejp5fmb/frbe6e54unRthsF1GW/yIABk8fTYLwj6tW3Iu1b1MQ/eu+Pw4Os0PWISFfcZg
 4qyofeLiYowMjukE389zfO8vm5crsNQajnyOIwGE5YM3u3jRdxct2Jyg==;
Message-ID: <748a489687000b21d0e8f961fc2f9f963b0bc1d1.camel@siemens.com>
Subject: Re: [RFC PATCH] sysfs: Add /sys/kernel/realtime entry
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-rt-devel@lists.linux.dev, 
	linux-rt-users@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Clark Williams <williams@redhat.com>, Danilo
 Krummrich <dakr@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Steven
 Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,  Jan
 Kiszka <jan.kiszka@siemens.com>
Date: Fri, 10 Jul 2026 09:23:16 +0200
In-Reply-To: <20260709152214.rH1O_8SM@linutronix.de>
References: <20260709143108.UYeCUUcd@linutronix.de>
	 <2026070922-kilowatt-matador-5e1c@gregkh>
	 <20260709152214.rH1O_8SM@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Thu, 2026-07-09 at 17:22 +0200, Sebastian Andrzej Siewior wrote:
> On 2026-07-09 16:46:19 [+0200], Greg Kroah-Hartman wrote:
> > On Thu, Jul 09, 2026 at 04:31:08PM +0200, Sebastian Andrzej Siewior wro=
te:
> > > Hi,
> > >=20
> > > The following patch sat in the RT queue for almost 15years now. I can=
't
> > > find its origin on the list.
> > > All it does is adding /sys/kernel/realtime once PREEMPT_RT is enabled
> > > and returns 1.
> > >=20
> > > Is this something that is still wanted and considered useful?
> > > Is this something that can be expressed better by other means?
> > >=20
> > > There was an in person discussion about this and it was suggested to =
add
> > > /sys/kernel/realtime as a folder and having individual realtime featu=
res
> > > as files. I don't remember a single feature that would quality for th=
is
> > > today but who knows. This is all I remember so far.
> > >=20
> > > Now. Discussion go!
> >=20
> > At the very least, it's not ok as it's not documented in
> > Documentation/ABI/ :)
>=20
> :)
>=20
> > But really, why is this needed?=C2=A0 Userspace shouldn't care, right?
>=20
> So there is Clark who needed it 15y ago for some udev rules. Maybe he
> elaborate on that.
>=20
> There is custom "software" that is designed for realtime environment and
> if it is run on a regular kernel then it missed its timing requirements
> and the software goes usually in a fail state and people start debugging
> what has happen. If this happens often enough (booting a non-RT kernel)
> they tend to add a check so that the software complains early enough
> since checking the kernel is usually the last thing that is done.

That is an important point here, RT software should complain loudly when
the environment / kernel is unexpected, so we need some kind of RT
detection mechanism.

uname might qualify, yes, but keep in mind that this sysfs based API is
already used, so a removal might break applications. Yes, userspace can
be fixed / adjusted, but it remains bad style, no?

In any case we should clearly document the way how RT detection should
be done - and make sure this mechanism is available in all supported
stable/stable-rt trees.

Florian
