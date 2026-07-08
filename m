Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC4B44103F
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783534411; cv=none; b=Nu3G3kxWR9N80OSiJX971JEzo3tetPwcRhuYLjKdS13f2TmA3KWDI2+WteHSLuYSHRyVS+az6XLcJiQL+WwmCbYOHINUaqlKZIKY2IZpCl5b4WMkIu8HNNbdV0c3PvKzAoAfhyDAJmeGm8hTdoasMswdx2Kt9QR1iZdjbBXlLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783534411; c=relaxed/simple;
	bh=mKB64eFzBwevlbfHP4GHbGCdzZzNbk41FGpjUYsfux4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba8J3YdXAAW5saTJT2KjFf7z3VHhP3dT8ABp9FZxRU0r9tZ7JJZNXDbw7h5OuE7AqrCVdCLpr/pYXAPQzMR8xMkyj1GJAhWS9USgkiDYofe7Z1w0vHH2q0B2Vw53rfUU5q6FwlifO8Ek31KJ5C9FneAQBqqEgXkGXbDTRz5C8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W0RGk0B3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W0RGk0B3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4720f3bf164so64209f8f.1
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 11:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783534407; x=1784139207; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEMJWE1zcwQ4UkLGDHzDIo1wA9TMgoKtQk475YCTe6o=;
        b=W0RGk0B3P+wqm4AgZ/vsB1z8Yw32zZNsMPsLdsSgrQ4ja6BX7OqqjG0GHaEG7jM2kR
         0MLCkfHo22RaGnDpPiix0O6gVcZgeRBee6fxPVw3Gc2f4B+Cp2wZK/o1sVxtz8QDxfMh
         +sssDK7iL8L0VWIPQl8/Tu/cYKt1Vw1pDVt9z38vxqHUBJrPeCZ/5fY9vVAM1XZjzyqu
         +NvI0kuqgDbuKjPZl5/jF4/eUHH+m0QKCQ0BgDqrRbHza7ncE5mEjyHHazbQBJ7ICBY0
         yl6qprqBLuV/vgXXxukaxViq53nJMTtUF395uQof4qCJ65/KfakHKr3PHCAnzAoPuR3I
         NJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783534407; x=1784139207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEMJWE1zcwQ4UkLGDHzDIo1wA9TMgoKtQk475YCTe6o=;
        b=Wx4dVNgl1oOUBBsMI7jvgUwZEg2WtokO/yj5b6z9Xr303oIP2svIBc3ltsHifClx5A
         PkxqQz0bulwYW04m76oekJ64ScvbraVU867GEviI0tbNpXhiU+xXvikhc4gtlVMEvkLl
         9Yd/SvubVR3WPpYpXANmSwmOBYMEIJDRc3X8XrFl7q9xB3gmdvv4J1lMe80sMbNtX8u9
         VjKbJNnT/pm9p+Nb3snGaQ/kb0igk0WC/6Js14+5225Dbn+bAtAGTkP8xybfRXNOYath
         IFdIA15CwkiZiW8WNfBYOc/tyncr1ZrRXU7oaRfgx95x3qnPsYLaqtAtnQ1aW62SPT47
         EKrw==
X-Forwarded-Encrypted: i=1; AHgh+RqxAfqVyp6xIFHlzmFm7asHGzXI5JYxtNdH82Fx4+C3at1gXvmOBUAQUbn7bjV9dfEmbtSv/ti/W/rrrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YykxhfzdyVCTjsnyS8ZeQATy7cW8mgqo5yNMMS1n0KKiB3BNdCe
	zv2bTP74e7RvLC81/rIal47aTbmcn9GkAv23RpYMPxyDQIe7c2/32RDg34S2EcsTDYU=
X-Gm-Gg: AfdE7cm5r32R7kg+d55ybCEEXGLUlxbHCGlMKgU4wmgeS6rccBfHDZTMR0lltw/+oE3
	z931jkiLBcP97Iwonrf3wzT5J/VIybRx15Rb3h12LO0RcIO6MIH0G71Yz1KQlnTh6G7Fr97mStL
	+85sgFtx9Z5VK7orQ+6LTNxh7rcIq6AKQBvpcoueKHay3n0XeqD6efAXojqnGDbqraaLr+j66/Z
	zANdUgj9PPTvKjxmOcc46wYyzCROtK4NOQP0bz7qmFOokIEt4SjIbpMH8j9dsNmBpMr67p3gn6p
	uTswqc9HOfKgy8Hd8NU/yKvSbXsxPpdNt6A3To9ThqZ41/jfE0nCQTnRAjUCf9uRJWsVOHi+057
	K2klfDls54rI3MdS8uWl0DXDa54GgviU9tQUpH2gxql794qlWgAz15C1FZcOPCXCXaU2+hemDE5
	6JQKiTIwVLtDtEsb7GXNa+pfvO7q5GAh1mSXWkhQ==
X-Received: by 2002:a05:6000:460c:b0:473:c608:eeb5 with SMTP id ffacd0b85a97d-47de9a4f159mr9196162f8f.29.1783534406837;
        Wed, 08 Jul 2026 11:13:26 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d910sm43325516f8f.6.2026.07.08.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:13:26 -0700 (PDT)
Date: Wed, 8 Jul 2026 20:13:23 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>, 
	Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Michal Januszewski <spock@gentoo.org>, 
	Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Mark Fasheh <mark@fasheh.com>, 
	Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	drbd-dev@lists.linux.dev, linux-block@vger.kernel.org, greybus-dev@lists.linaro.org, 
	linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, cgroups@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bridge@lists.linux.dev, 
	netdev@vger.kernel.org, keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH 1/2] umh, treewide: Explicitly include linux/umh.h where
 needed
Message-ID: <ak6STbqZd-Q-c56v@localhost.localdomain>
References: <20260708154510.6794-1-petr.pavlu@suse.com>
 <20260708154510.6794-2-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kijzkd5xnaepafl2"
Content-Disposition: inline
In-Reply-To: <20260708154510.6794-2-petr.pavlu@suse.com>


--kijzkd5xnaepafl2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] umh, treewide: Explicitly include linux/umh.h where
 needed
MIME-Version: 1.0

Hi Petr.

On Wed, Jul 08, 2026 at 05:44:29PM +0200, Petr Pavlu <petr.pavlu@suse.com> =
wrote:
> diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
> index a4337c9b5287..60eb994c32ae 100644
> --- a/kernel/cgroup/cgroup-v1.c
> +++ b/kernel/cgroup/cgroup-v1.c
> @@ -16,6 +16,7 @@
>  #include <linux/pid_namespace.h>
>  #include <linux/cgroupstats.h>
>  #include <linux/fs_parser.h>
> +#include <linux/umh.h>
> =20
>  #include <trace/events/cgroup.h>

There is kmod.h in here too but it's unnecessary, no module lazy loading
in this code.

Thanks,
Michal

--kijzkd5xnaepafl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCak6TOhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgY2gEAgOkCGIEUNQ8/AFfxYtdb
0XG1ZQXkD0d1Rm0cAq1+u8cBANw3nWI/wHkp5zcHmZWevxdnweU507gsyVTXzMGQ
ZwsB
=k+w6
-----END PGP SIGNATURE-----

--kijzkd5xnaepafl2--
