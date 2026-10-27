Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080993;
	b=uw6NXo/5QsEhQHjZahot6vH9Cd+3px6HgbOvwTiTDfWg7yVnu4AcjhLHXMQQS2IfysvA
	 vP4qcUgaVjKR7gweBfjzgS07w3VTd+eY19wQdjq4aKroIkE2EF/eKCWClac1LBWjEfq1R
	 lCzy+CZMduZw7BSZGBBPz71haOVhos1gsWs6dfD7YQeFbiPqtTZ8Hbr86xTrakWOGhzCW
	 o+nI7mFl2ybFj8xdHw+AqbRXbZv2RxPVopZsTEtBAOVBUnkMGguM2tul1MhqC52nnyKNS
	 DbQMzK6HYPvTTTaUrlGdHF6OhZ45bu7ZNnZ18Dg+2q1B1IcatHaNTW+I55zXZSU8TZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KtHkcu0sQsAK751caVzJBQDY0o4i7F/zlOnjMPPeE5I=;
	b=f4JwbGJKjNlYtYuHFXb8PFHbc+fLGHWzbps2c6M5s3eQ0Fhrwq9V0OAl32aAHPfvDFaE
	 dQWHRlKpNay6F0n9zltpmhTK1xfM0j2Cr3OtLbI6xgutZfsHyIa0rVKlPF0dZmcZB3dJE
	 4QOa5nUS+9hTgEG3PcLWprfplKBqFX029Lr+OAgc9ylinrnmA7kRpOFJfRCT/e3E6uuXb
	 GbReArXez4Haqsk7zlJ95Vgr8E0yqc+lJ1gwX05VYw3GfQosrYkMPjqFyq84JiR162J/9
	 M1JDOIs117ISsRX40brHPDvWYTAHfmoQPu5qklA88Y53RMalV2fkYr/G9s/CSDypzPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkI352YX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4927F606A31D
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 06:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4927F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KkI352YX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so19859305e9.3
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 23:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080991; x=1793685791; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KtHkcu0sQsAK751caVzJBQDY0o4i7F/zlOnjMPPeE5I=;
        b=KkI352YXbnXCug+dw47pXwQn53971MzWMJ3Zj/aFDzFSeMdPehc3Jcqg+6L7uSXGhY
         o1LPs6JE8vD/mpeVGsw9ckW4pEfK2qRr47VyfDw87NiARwhKmGJFio8JWeiUYXrTXjiZ
         0GSYVYsg0KmMk5bUB9jmZmEay1Dp4qFFB7YlLhyobhijtQmx2rGrGB8AeJ5Mc9j4rW3m
         VXhjbnV/DZN7FcvKURNYY07s1hCn4C1KKUlLY8gZS7P9SOEle8g7Cfw3Jj0IqCyNmv3i
         X8obqm3sClTYmS96uvszsOZwdYmPnmNOYv/MnReSW33mCBOkLb+kSi6YOTqrhWQ3GhKA
         B3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080991; x=1793685791;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KtHkcu0sQsAK751caVzJBQDY0o4i7F/zlOnjMPPeE5I=;
        b=ui3BvNuypG7Yz4BV90N2kHEVjBsCoYSa0ZibeU8gWyI54iQhK+dEAwXd2fxIZZJAlj
         tH7N5pPYv//Yqu3FgwkDWl+vBh1fOwyljr7Jd9pXxTvccJtoP0lj9RgrhqZLPFkCbx1Q
         vjOSNPNUHR2N0Vs6w3H5BO/Nu74ib74xKyRG4dNdiKBH74WEW13qBrA3OOzayVX0m82E
         EyiP7vzAk4OdRvQRarOlW7neSRQdEShuabEg4VJhFTTcQKWjHXGWgUn+uKyNY3mNaeAK
         VCmMNDiLzqPx95S3Eh7dQuRqAPqyNztU8NpXz5hJyM+9VMx7RKG2nDUax1y3HtA7djW5
         PaLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr07ujZrauzhU3BtNfgHBVH+mLMRDTzdf2/16K6acBflctJdcfJwq+ADeZj7hm39TcN3MEBbHo9YXNhg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKujnO/ArI5/3d4qyPsfE6cicaQwEprhqV97f6nBw41AKmwCjv1
	VHYO0r1JfaDZBUnDzXH/cwVT/xv+3FtOZBQQXjDpDiPGRt9r7vkE6G4N
X-Gm-Gg: AYBFou3ncrOdd40+cnoixUip4gG28ZHgGys/ALLCO3+KtkOOLWcbVPDucFMW7j9eaT9
	/9YTLF/G94eZkNl3i1aNM/VxMdXFrwZgTqdRqphPlMioWT3P3hwAaB+kD/5ZNnxzm84Bm+8boNs
	BTDXaiKFKM7mT14zuEAnCYrKeeSPXtRp2pJC/z6PVw5u2VY1VoTK1IxG1sw3tY5Kjvw7i8LjUnB
	1OZ7xmX05E9FHI3/pwscxqnIwqlTmoXBTRrm5dnUhVNDKvBSm4QApJvA7YngGyZD+L6PttseQqz
	ZI89xI7gzdXa8Q5OfvcWE8S9xr48a42tCZFRgyHtroQ/qIWZK0tdehFGwbg7J2uMWRHLO5f3Mci
	q3YuWvjMgl3CpYRMWHAn94jIvau777b+uDQmi/MiIrOJmDAuRZaZ6OjJzkeIFLrEUj4p5xZ7mAA
	T1b3794FZeBTbVg7gHKXdGrObAOmSjaaaH9BWyjfhdtWEM3d0UMyYkpZfClI9UIOEAdG5Hziwud
	8xvEurFr9Mgu9zuxESjaT7aYBw0TWa9IC+46K/5Q5+P07IYrhtZE1NbwT+22QKC
X-Received: by 2002:a05:600c:3acb:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4a35aca4fe1mr159192175e9.16.1793080991458;
        Mon, 26 Oct 2026 23:03:11 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm240600745e9.8.2026.10.26.23.03.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 23:03:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:03:00 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Williamson <alex@shazbot.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>, Armin Wolf <W_Armin@gmx.de>, David Lechner
 <dlechner@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Bradley Morgan <brads@mainlining.org>,
 Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Richard Weinberger <richard@nod.at>, Thierry Reding
 <thierry.reding@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261027070300.4c45616a.michal.pecio@gmail.com>
In-Reply-To: <2026102637-buggy-mothball-2a08@gregkh>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
	<arIvG0nx4LXG9nlW@monoceros>
	<defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
	<9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
	<2026092321-province-yearly-44aa@gregkh>
	<arOfHEsGGglNse7T@monoceros>
	<2026092348-victory-erased-0e5a@gregkh>
	<20261023181326.0dc2f7ed@shazbot.org>
	<2026102437-vista-unsoiled-b089@gregkh>
	<20261024103512.4601ee4f@shazbot.org>
	<2026102637-buggy-mothball-2a08@gregkh>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 21:34:57 +0100, Greg Kroah-Hartman wrote:
> > Even if we could come up with a set of device IDs, it's a policy
> > decision whether a given device is intended by the admin to be used
> > by the default in-kernel driver or a userspace driver.  
> 
> Great, then have the admin never allow the in-kernel driver to be on
> the system, or be loaded (modprobe has deny lists) and all is fine.

As some maintainers like to say, it's not the '90s anymore :)

Users don't reboot systems to kick a kernel driver off a PCI device to
try something in a disposable VM on a whim.

Even if they did, it's completely normal for desktop users to have two
GPUs from the same vendor or two xHCI controllers and pass only one of
them to Windows/macOS while using the other on the host.

bind/unbind feature prominently on every distribution wiki and forum,
this cat is absolutely out of the bag at this point.

> > That means that at one point we want the default driver bound and at
> > another we want a vfio driver bound.  Coordinating this is exactly
> > why we have driver_override and, building on that, match IDs that
> > require driver_override.  This allows drivers to describe
> > themselves as vfio-pci compatible drivers via modules.alias while
> > requiring userspace to enable the match via driver_override.  
> 
> And as said before, that's a horrid hack and one that is breaking
> things today in all sorts of ways, which is why the taint was added.

Are you aware of bind/unbind breaking things for PCI specifically?

Without also involving 'driver_override' or 'new_id'? Everyone agrees
that these APIs used for anything other than pci-stub or vfio are foot
guns. But your patch targets something different.

We can even bind PCI drivers to wrong devices *without* using bind and
hence, I presume but don't care to test, without tripping this taint.

> If you wish to override the kernel, then great, a taint flag is added
> and all is fine.  All this means is that now developers know what you
> did and can decide to ignore your bug report or not.  No functionality
> changed at all.

I believe people pointed out that it's a functional change for users of
panic_on_taint who also use bind without being idiots.

Does this taint even solve a "real" problem? Those bug reports weren't
coming from users, they were coming from "abusers" like syzbot looking
for trouble. They were quite obvious even without a taint message.

And at least on linux-usb, they seem to have stopped after Google and
one other copycat were told to stop sending them, and before this taint
reaches released kernels.

I even told them to block not only bind but also new_id, so there will
be no second wave of reports caused by syzbot discovering that it can
bypass the taint by using new_id intsead of driver_override.

> Why are you worried about a taint flag?  So many servers run with
> taint flags enabled due to out-of-tree or questionable licenses with
> no problems, what's one more informational bit here?

And what's the point of a flag which is always set on countless normal
systems in the wild? If this feature survives to April 1st, I will send
a patch to rename it to "VM passthrough taint" because everybody (or at
least those dealing with desktop users) knows what it *really* means.

Regards,
Michal
