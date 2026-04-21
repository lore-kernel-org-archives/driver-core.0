Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD63C2782
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776784205; cv=none; b=C0EsXvXRLpqCfcpVYvvIfyDQrtwCQZVT1wlaohnVucjAwR/t7HaJT1NCRWq1Ph7f0euGnnGbtAfrry4HXmm9DaRsVWMicIsDV/pqboFT9xsAbxRYqujVgAbIcwdid4GhhbFD+WQUoes/Kf1FgdBCnUb/0AioCqe8w5DJFcZ+v48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776784205; c=relaxed/simple;
	bh=cmyaupRqmbN/ULerERzNae8aSi2Orqym5ZZqoD7wXoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccmAuAnuj9BsOBccu57ycObcRNjBK6qkJGWuWkDq1deXTItjxxXbsY8/cXOrZXDHuHq3Oo+kQiDaCr00uIJgP3+ofdJoSWJsHVLblPpZTIhfn31jSPIdTtc9QOrOvYHZKRdQtBQ9ezSJ0VF1S4gHYw5KAzdMG1NYtCa/WD+W4w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=nZGLOHWi; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="nZGLOHWi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776784202; x=1808320202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3We8v/cWP2gtcTXE3xZoQ0CkfHEqYxB8F5njBD+WhU=;
  b=nZGLOHWi6cQKtoN8ZXWoKq3vCqqugelPpflWkYaaeqzOgPb8dMx/WtWY
   YQYtL/YMFgDIofz/7hi13T9Mrjahn18b4fLt9AdHp/RhRbGs+RjBnV+YZ
   HEoEZ4RfbnNSxazzjBAIk40lJC0vKbYd2/CE0i5T6TJusxbECkRmzZgTi
   syjTOOmQyVdHiv/DqvXTBu8x+gjO+Edr/l/4JSuS/JFTzmV+hEC4stgvO
   L8wN+HuIOgprWHx1O9abocO6GefwtIuX3GboWMwH4gqklcvTyO5sBqvbd
   00ji7CGGLyBDt2mg3O9lN+08KkVCTSyiA43Nyz2V/vOcCepHMO/iDpIKB
   w==;
X-CSE-ConnectionGUID: jnw2PAp8TomvJR2196rU0w==
X-CSE-MsgGUID: /o6wcDPySSag4wDNbQMPZg==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:59:52 +0900
X-CSE-ConnectionGUID: 3RyYrMSERUKfI0QHkYxSQQ==
X-CSE-MsgGUID: 6ScaAiufTta8VQMfoRcw9g==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603084691"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:59:53 +0900
Date: Tue, 21 Apr 2026 23:59:51 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] kernel: param: handle NULL module_kset in
 lookup_or_create_module_kobject()
Message-ID: <aeeQ5x1uMKT6cyxp@JPC00244420>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
 <2026042126-majesty-skyline-b76f@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042126-majesty-skyline-b76f@gregkh>

Hi Greg,

Thanks for the quick feedback!

On Tue, Apr 21, 2026 at 08:27:10AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 21, 2026 at 03:02:34PM +0900, Shashank Balaji wrote:
> > module_kset is initialized in a subsys_initcall. If a built-in driver tries to
> > register before subsys_initcall with its struct device_driver's mod_name set,
> > then a null module_kset is dereferenced via this call trace:
> > 
> >      [    0.095865] Call trace:
> >      [    0.095999]  _raw_spin_lock+0x4c/0x6c (P)
> >      [    0.096150]  kset_find_obj+0x24/0x104
> >      [    0.096209]  lookup_or_create_module_kobject+0x2c/0xd8
> >      [    0.096274]  module_add_driver+0xd4/0x138
> >      [    0.096328]  bus_add_driver+0x16c/0x268
> >      [    0.096380]  driver_register+0x68/0x100
> >      [    0.096428]  __platform_driver_register+0x24/0x30
> >      [    0.096486]  tegra194_cbb_init+0x24/0x30
> >      [    0.096540]  do_one_initcall+0xdc/0x250
> >      [    0.096608]  do_initcall_level+0x9c/0xd0
> >      [    0.096660]  do_initcalls+0x54/0x94
> >      [    0.096706]  do_basic_setup+0x20/0x2c
> >      [    0.096753]  kernel_init_freeable+0xc8/0x154
> >      [    0.096807]  kernel_init+0x20/0x1a0
> >      [    0.096851]  ret_from_fork+0x10/0x20
> > 
> > So, return null in lookup_or_create_module_kobject() if module_kset is null.
> > Existing callers handle null already.
> > 
> > Fixes: f30c53a873d0 ("MODULES: add the module name for built in kernel drivers")
> 
> This isn't a bugfix.

I'll drop it in the next version.

> > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > ---
> > This bug is triggered by the next patch on arm64 defconfig: tegra194-cbb tries
> > to register from a pure_initcall, and with the next patch adding mod_name, this
> > null deref is hit.
> 
> So this isn't a bug, it's a "don't do that" type of thing :)
> 
> > ---
> >  kernel/params.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/kernel/params.c b/kernel/params.c
> > index 74d620bc2521..881c7328c059 100644
> > --- a/kernel/params.c
> > +++ b/kernel/params.c
> > @@ -752,6 +752,9 @@ lookup_or_create_module_kobject(const char *name)
> >  	struct kobject *kobj;
> >  	int err;
> >  
> > +	if (!module_kset)
> > +		return NULL;
> 
> Are you sure that making this change is going to be ok?
> mod_sysfs_init() should have been called first as the module has to be
> created before it can be looked up.
> 
> As you are wanting "built in" drivers to show up here, you are going to
> beat the call to param_sysfs_init(), so don't do that.  Make sure that
> the drivers are NOT called before then.

The reason lookup_or_create_module_kobject() can be reached with module_kset == NULL
is that some platform drivers register before subsys_initcall: tegra194_cbb and
tegra234_cbb at pure_initcall, plus roughly 375 others at core_initcall/arch_initcall
(208 arch, 154 core, plus 2 pure and 13 _sync variants). These are dominated by
pinctrl, clk, interconnect, gpio, and mailbox drivers across six SoC vendor trees
(Qualcomm, MediaTek, Freescale, Samsung, Tegra, HiSilicon).

Given that, three ways forward:

  1. Move module_kset creation out of param_sysfs_init() (currently
     subsys_initcall) and call it directly from do_basic_setup()
     before do_initcalls(). This is the cleanest fix from a
     correctness angle: every initcall level sees a live
     module_kset. But it touches init/main.c and kernel/params.c,
     crosses two subsystem trees. I haven't fully audited
     dependencies at do_basic_setup() time.

  2. Demote the ~377 early-initcall platform drivers to
     subsys_initcall or later. Impractical at scale given coordination
     across six vendor trees, and many of these levels seem to be
     architecturally required.

  3. (This patch) Guard lookup_or_create_module_kobject() against
     NULL module_kset. Drivers registered before subsys_initcall
     don't get the /sys/.../module symlink, but they don't get it
     today either (drv->mod_name is NULL pre-patch, so the
     else-if (drv->mod_name) branch in module_add_driver() isn't
     taken). Verified on arm64: /sys/module/tegra194_cbb/ does not
     exist on a booted defconfig with or without my series. The
     guard preserves that exact state while letting the
     device_initcall majority get their symlinks as designed.

I went with option 3 because it preserves observable behaviour
everywhere and keeps the series scoped to driver-core. If you'd
rather I do option 1 instead, I'm happy to.

Thanks,
Shashank
