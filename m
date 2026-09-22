Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45354281A
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080804; cv=none; b=of6ATPWIp9kPMRuARPpfY+cLpEiDwPa/uViy2giMaGd9KhEsRl9jTU2CZuGu9fvwf3EMnMCtyiG+JoUjZEKBkpQyNIJEwpsUsIuuDKHKsxZjQDMIBbeihyEvFBpCUUrhD7/sksDf9N2dRz9rw1oV98t0023BqgWRT44Dn//LeEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080804; c=relaxed/simple;
	bh=wFmJBrwWil7bpAeYIpoN4GzUL1HvXOt5ldn6IIIiFHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M6Vul1G8kCk9QCc6ZAwk03kmzGNGFX2gAEshghWyARzraS7X2qQNefpFW4cFXc1GiyFmsKN1nT8hkWVJiz2rsR9/WPpwpm5Y19OyTBdfqSmJNnx0DCh2khKA6ETGfAwZLwlNxRHqtiV+qbX5hA4E9G8hsO/F9EMYUM8gy1NAGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=GV3lsffK; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="GV3lsffK"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e4d8d8aso2693698e0c.1
        for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1790080799; x=1790685599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9blDfaIlaDE7zWOzf7sAkl81n8mIgiGQIMLz8R8dVg=;
        b=GV3lsffKgYbMPBOsez8i7whbgaoi8Nj8eWM9E+ojKmpW+hU3iYxfpWZK6O7qs/GrOh
         4D14JOQlYmX//RblMcJD6GDos9U8Az2gZlCPnwXoiLHP9cYIv3D8IlyEtgzA634iaRFv
         NIpWneWMJKc8KKWR12bC9irKp3FQFzsswqGSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080799; x=1790685599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9blDfaIlaDE7zWOzf7sAkl81n8mIgiGQIMLz8R8dVg=;
        b=MIRT6GHpJp+z+3gfmIOBAY4iMQJYJf4aMlVnjUtL8Z/tu5YS+Zhjwb0a8vEv7SA9o3
         6Yt2OEObIB/WEc6Bl+AXal798tMdxSz+PP2VaEVN5rEH7XUaJBT7HlZ1RjnekPjaYuIG
         TgNP7l9A5Y/4Eu/ssD7skdiaJ7daaUjeJuyj/OzghDgDyP+jDmpODoY8YV6OAUpnoLXI
         NIICq4ihJlxuL0KyZBawR1XA4fs8Epr83WEkUjt1HKxBIb11OoB5O2aTX3Msw6XL5lWJ
         ToiKGNxBfAPOVJG8n2PiL1QaDCgG0YUidUvEcyrJVZXmXTIAB9ammnSrXPqmDBNh4dLS
         hFqw==
X-Forwarded-Encrypted: i=1; AKwUvBwbNAc06yiFdm06tuzyI/18VZYBkiHX89GL3TbpH9mXt6Lsa83k2fzgy4ztzUofI0FWC/Avl/wrPOo0Fw==@lists.linux.dev
X-Gm-Message-State: AFuF++lj8rsrW7UIfwH9hFRFmzOjukgNs9cHLfljSYCF0Z+TCuvEoUfO
	s6+trnahs2TfO0EInhSJidWihi68or/+eWqYZgbbMp1gk19SH/1hvPnIL/BBqQlzOQ==
X-Gm-Gg: AYBFou1Nd/jMBquU9z2+YOfSdkpFKxSosMcvTrP3IoRspRkQiqCGLLVroJfm7B2HbGa
	au7PaPc3HOU/qtG8p44wid5q2g6D3/rN0iOJUORMfO8FPC3sf0L5p9kJBbzHCIkCpcaTyFzFr2y
	Ov8cS9i/3XUo5SSWYf02Zd1fK5zsWl7ThWqoclARsIFiAZUBj2Ju0wT4+eip06HEa49pmyN3b6b
	mqzq4A9RPbYlE8p4P5LiAvRLtevLX3Jr6Fq4/TeygjSKY8PIoOS0mIsQOJTF0MQBc/Q5LCrcIY+
	Coa/tQG8srQD07w93fdF2lNs9Z3KJym8/Tml8RFE+EcdMPo6+rBYZq5WUHdycGK1IoQtNnHQrNo
	1bdeC0L+lBWJWurTCNlQFamlWy7t2i8jZRccc24RQKz6Uym8mouTMiPi91nWlU5zY+QyPu9qcFo
	cLaHGeVwXazB2/OaNQaNOmuyJ+HtFcJHLhADdu7uRFMiSXsYDlQ52yYqo81GtgJFXyBbFLoTG1J
	XC0
X-Received: by 2002:a05:6122:e22b:b0:5c9:a60c:2736 with SMTP id 71dfb90a1353d-5c9b598e442mr8405960e0c.14.1790080799199;
        Tue, 22 Sep 2026 05:39:59 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91402535ce1sm14566906d6.48.2026.09.22.05.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:39:53 -0700 (PDT)
Message-ID: <d2052425-3fb4-4104-b1ed-f2d53e5a710d@ieee.org>
Date: Tue, 22 Sep 2026 07:39:47 -0500
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] umh, treewide: Explicitly include linux/umh.h
 where needed
To: Petr Pavlu <petr.pavlu@suse.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Michal Januszewski <spock@gentoo.org>, Helge Deller <deller@gmx.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Nikolay Aleksandrov
 <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 drbd-dev@lists.linux.dev, linux-block@vger.kernel.org,
 greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 cgroups@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
 bridge@lists.linux.dev, netdev@vger.kernel.org, keyrings@vger.kernel.org,
 linux-security-module@vger.kernel.org
References: <20260911-module-include-kmod-v3-0-6ebccc3e0731@suse.com>
 <20260911-module-include-kmod-v3-1-6ebccc3e0731@suse.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260911-module-include-kmod-v3-1-6ebccc3e0731@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 9:46 AM, Petr Pavlu wrote:
> The usermode helper declarations were previously provided by linux/kmod.h
> but commit c1f3fa2a4fde ("kmod: split off umh headers into its own file")
> moved them to linux/umh.h in 2017.
> 
> Add explicit includes of linux/umh.h to files that use usermode helpers and
> remove linux/kmod.h where it is no longer needed.
> 
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>   arch/x86/kernel/cpu/mce/dev-mcelog.c | 2 +-
>   drivers/block/drbd/drbd_nl.c         | 1 +
>   drivers/greybus/svc_watchdog.c       | 1 +

For Greybus:

Acked-by: Alex Elder <elder@riscstar.com>

>   drivers/macintosh/windfarm_core.c    | 1 +
>   drivers/pnp/pnpbios/core.c           | 2 +-
>   drivers/video/fbdev/uvesafb.c        | 1 +
>   fs/coredump.c                        | 2 +-
>   fs/nfs/cache_lib.c                   | 2 +-
>   fs/nfsd/nfs4layouts.c                | 2 +-
>   fs/nfsd/nfs4recover.c                | 1 +
>   fs/ocfs2/stackglue.c                 | 1 +
>   kernel/cgroup/cgroup-v1.c            | 2 +-
>   kernel/module/kmod.c                 | 1 +
>   kernel/power/process.c               | 2 +-
>   kernel/reboot.c                      | 2 +-
>   kernel/umh.c                         | 2 +-
>   lib/kobject_uevent.c                 | 2 +-
>   net/bridge/br_stp_if.c               | 2 +-
>   security/keys/request_key.c          | 2 +-
>   security/tomoyo/common.h             | 2 +-
>   20 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/dev-mcelog.c b/arch/x86/kernel/cpu/mce/dev-mcelog.c
> index 053555206d81..af4e76babe7a 100644
> --- a/arch/x86/kernel/cpu/mce/dev-mcelog.c
> +++ b/arch/x86/kernel/cpu/mce/dev-mcelog.c
> @@ -11,7 +11,7 @@
>   
>   #include <linux/miscdevice.h>
>   #include <linux/slab.h>
> -#include <linux/kmod.h>
> +#include <linux/umh.h>
>   #include <linux/poll.h>
>   
>   #include "internal.h"
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index b77f901fc3ef..6f5d059394b3 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -14,6 +14,7 @@
>   #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
>   
>   #include <linux/module.h>
> +#include <linux/umh.h>
>   #include <linux/drbd.h>
>   #include <linux/in.h>
>   #include <linux/fs.h>
> diff --git a/drivers/greybus/svc_watchdog.c b/drivers/greybus/svc_watchdog.c
> index 16e6de5e9eff..b318eb34bcca 100644
> --- a/drivers/greybus/svc_watchdog.c
> +++ b/drivers/greybus/svc_watchdog.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/suspend.h>
> +#include <linux/umh.h>
>   #include <linux/workqueue.h>
>   #include <linux/greybus.h>
>   
. . .
