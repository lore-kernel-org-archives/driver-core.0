Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280558;
	b=cZoYNRGWAm0ffeovSlz72c4aQtnNzdzKcewB8wBZYLUDabJxNwsIamHF+Cp9G280kbuG
	 flp7aRrpCbJVjVjt9H/3ze6tANaRmi/SclkmzfXsAvnXIhB744qqwUeddN3X2lmSYAB+X
	 KrNxy9MhlgYhDdPMYH5DnU0JFGz+bQJWKB9ky27IMdClIRFx6sp+23gFPDXKmj+o88wfX
	 25nWBsINVNzIYRgyJNm8KDj3dHX/BOyxpFUBqV86df422zb4X7EYaNjoRMoAdbuBkRrKg
	 AoWif5u8siBbEkSu2IH5TU4oaO0OnwBBJGNL5jCCj/29WIfZsbms7hIG+6bxeexD0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
	b=xWzO9XRhZ/gXFc2EDw4G6U+Voo1HM54tlK3mLkdvFHT27cKFKFshWTgJdvxZ8zUT3pbc
	 y1zMO/UItEZzlhtHyz56Od1pwDRIGoiPKR2pqbNa6QUn8cuyia6TP+sgss3fcAWsYB1Qb
	 D9ZZLctx26KUGmbYZzPf55bZfZD8hgCk3UB57yd0Ua365OSCjNx286slb3T/6zb6AowMd
	 hHUQriORGboQDc2O0zqlt3m+f3CZeOhIOnUEflYMAeMVAZYnufPkFxaHf47eFBE/jNtgr
	 YEAq9E6VS6tX+QYqee7ZBWTQ/dLY0QXy2ztXbFOz77ZK0pENO/yylRoKWuMjw/q20+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grdncc.com;
	spf=pass smtp.mailfrom=grdncc.com;
	dkim=pass header.d=grdncc.com header.i=@grdncc.com header.a=rsa-sha256 header.s=google header.b="P8svN/Oq";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E25606A31C
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 03:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E25606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grdncc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grdncc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grdncc.com header.i=@grdncc.com header.a=rsa-sha256 header.s=google header.b=P8svN/Oq
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso584037a91.3
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grdncc.com; s=google; t=1794280557; x=1794885357; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
        b=P8svN/OqoZFVw9WyALXmSkks3+C1/PuwxQluSdRx3cOdJY6j4Mf0ghb4KSOciRRFpr
         2qltsQKmlgSXtUp1FTK0beHkolzxlDbtoCSh0m6x0wfXHwkoVzvLHTq5UAQRQJ3WieG2
         EpUZy7Hzj2m94G+ADZaLJh1+NZG4sq+OEhWNpXkezpvYcG3NNY3FNcpRIKXsKJumdji8
         jurzKZCOhlhKYLKJgnDDOTl6lh6ncDgrNyNZi+4LRD/jYMzuflqoC1d1EorelPpszVkK
         LlwD1tBu6+lZvdBuDfOd2lkOAQ4/E8t8FEq8fQIuxw5XNnGwOnpf43U6xYNjihDeLOT4
         4lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280557; x=1794885357;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKM22T/D5/SO/MGy5jLdaGL7gHjLOi5ZLHchOauKsAg=;
        b=UcJGxwKfHvG3+KwaCDnpqFrDHjST2qGo0UlJXmn2xf+n9ANBlLNfnBVI9Z7c1usMMo
         7LxDC1kRSBMU3WlsMAxY64CQCnS7Bpno0XJ7EWedYYToD1jHP5/h4Y7d7c9/PQsFvFJD
         3gwyr59FsdMYow7a4uuEVr95ydZ6VW2unzwnqFmn+MIJfORz+MCsRQpy0dTmNz+BQmdO
         U22yK8XkiLuK0tfyvFKpvAyAvPgDfq/QMV02kjyecPH3+gtDFZ2ups3iS6t+v3C2uyao
         M7jo+8FpuDZw/6uWehtI5ag0sya4tzmO6hsdah6+aZ78T960uZpokOL4BkxaAw4gKRNT
         /xIQ==
X-Forwarded-Encrypted: i=1; AL+hErGrVJHriNrxcJC+VZivK3/vhyqtNZMziOwXnHFtsmVTbCi/gQ4gKAaFy6tMBHbzjSbPjho/Wji6Iuy7qw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8RQtggtpF0CNnKg8+f3YFm+z83uJNzc8QNcAdgYKiW0vU6JK8K
	nOiXDLgV/ydBj1d846MCXEyY71T+Lo5NbuSKPpNHwm38Pp7/IQhyCkMzzCkgrVWtB6M=
X-Gm-Gg: AYBFou2chv3LwyPhylZfK2ExzvBAVn8OgNvKQUlf6ClwHERE96C8J7VU5kIr34Il4Ee
	vYfHI9RcttOjp21EcgFgMaKQodcu1oV0iZGU+oD6y6TgkVma5fYUBS/51dNrgxPUWZjUzd3i3WF
	aVJN1piKVXi160GLIZ+vOyB67tHtkP6ja7zO0dt7BUuAYwnivy2Hcrih2087+7zoVJ3tqKOsC+8
	1PJEygH+3EtNLmEahgHBpKa3221/HA+8oMnS9p3IrEGI+8ZSdMtKVDsZW/FhgO5c0nJ4arnXeVs
	OmFyD6Z5BU1AGni5RSYPcVqJ11E7dx25gDz4pTB6mkNcBgNCtUf6mHO3LyDJD0zHgL84eKVfmuC
	mLLjJL1nSK9Buw0BQgA28OzTjxPJdwbLPgBCKWoqSHNKQlof6xQaVYCRMK36TJN2wDS9OcS+Yoj
	ohNZPwbq1P/uhHXqwsXfOPr0ll/nIrzJf0ONpbVrHDB81RVvJ+Qvo3WjbS+6fKY5/c4QZN/BXU1
	FQ23JSQfCg0UaX7nPudcUc0YPwz2phuWcHgtY9q9id8hhjURmZGJ67s54x+lrkEBWB8elv1Vcwi
	IbVnj1gu0g+eAXUgtcjjXvPIrcBR8vuq2xuvmIEDNPeCiJ1kwZrsNQjYln4mU1yZGGz8UMiWgwI
	BVXl5S7XfdXI4v2T46ircyEsCSj5Pge/mvQ==
X-Received: by 2002:a17:90a:e7d2:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b166d11497mr1560555a91.42.1794280556688;
        Mon, 09 Nov 2026 19:15:56 -0800 (PST)
Received: from smtpclient.apple ([103.243.98.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm1826210a91.14.2026.11.09.19.15.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2026 19:15:56 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH 0/6] sched: Expose writable interface for preferred CPUs
 mask
From: Maxim Kuvyrkov <maxim.kuvyrkov@grdncc.com>
In-Reply-To: <20261101192203.6979-1-ynorov@nvidia.com>
Date: Tue, 10 Nov 2026 16:15:31 +1300
Cc: Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Yury Norov <yury.norov@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrea Righi <arighi@nvidia.com>,
 Ben Segall <bsegall@google.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Johan Hovold <johan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Mel Gorman <mgorman@suse.de>,
 Mete Durlu <meted@linux.ibm.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sven Schnelle <svens@linux.ibm.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 driver-core@lists.linux.dev,
 linux-s390@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2B09626-39F0-4EC3-B57D-CD83D77DD208@grdncc.com>
References: <20261101192203.6979-1-ynorov@nvidia.com>
To: Yury Norov <ynorov@nvidia.com>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On Nov 2, 2026, at 08:21, Yury Norov <ynorov@nvidia.com> wrote:
>=20
> The preferred CPU mask currently lets the steal governor reduce vCPU
> demand when physical CPUs are contended. This series adds manual =
control,
> opening more use cases.
>=20
> For example, setting CPUs aside for selected fair tasks at runtime =
while
> steering other fair tasks toward the remaining CPUs.

Hi Yury,

I've been trying to do this with crutches in user-space for a long time. =
 Thanks for implementing this in the kernel, and with a convenient user =
interface.

>=20
> A user can mark a CPU non-preferred and pin a workload to it. Fair =
tasks
> whose affinity includes preferred CPUs are steered away, while tasks
> whose allowed CPUs contain no preferred CPU can still run there. The =
CPU
> stays online, task affinity is preserved, and the selection can be
> reversed without rebooting:
>=20
>    # rmmod steal_governor
>    # echo 0 > /sys/devices/system/cpu/cpu3/preferred
>    # taskset -c 3 ./my_workload
>    # echo 1 > /sys/devices/system/cpu/cpu3/preferred

My use-case (being a compiler optimization engineer) is to pin =
benchmarks to specific cores, and stop the system from using those cores =
even when the cores are idle.  This prevents L1/L2 cache pollution and =
makes performance numbers more stable.

Thanks!

--
Maxim Kuvyrkov
Garden City Compilers

