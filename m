Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528B3EB7E4
	for <driver-core@lists.linux.dev>; Mon, 18 May 2026 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100366; cv=none; b=PkLnhsLRkkPFykPZxHEuHsYEkDZ0RLZUgbU8ThYM42K5crS4LW2iLzze74Di9Jp6LIrkItN6G6q7AsAvR9qe7fLQmlC/1u5WCkNpt/bWH2FgVY4Gqf1gM+/g9YmaIAD0Tr5l7/JyJ7/tdpo0OaOrnMWbW/+bHQAGll3bJChFDAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100366; c=relaxed/simple;
	bh=y/ZSU6WO76m6NnoFZ2UHtM+29I7tmfGcQeI6Sr56gGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4gsazCeeYdEqLl0TArLQJkMAwqrLPKLPayU4ENuDp0X0R9Zq8wj+hAb9YViqTq5q2P1FM2x3Ucp8xkoImaNNBd8eU70cx8sJGAcTx0uyyh0w2Mla6I9y9arGTGmnZ0CnHeDt++Z0u9OQJcMH4ZRakxpIAVirGQIRrVlLxiVa78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=TmB4RApA; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="TmB4RApA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779100355; x=1810636355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qg52IZakrDwa+7/YtZM2VQOBVW4gzCDrQLRgDaIE4Fk=;
  b=TmB4RApAW8vfSx2mrRnW2AAGSPI/iGJkKFyo5VnBQZ3jNO8NsKJ6ORZN
   aWWkE2JniBLPyPcjKAgP4mL91FPrQ2x1oLZMmyXyFeQlkt18z0mZFX8X2
   S+6aeO+Wz7P0GJ4PBvGgmt1++PixDDhZg0bth4fVJRqs/mmOQh+Q6BPYg
   uESWPyfmW28+X8SHeE7Rvs25CdSkqaf8/m+GoxVTo8JQYXDbqjlylMPKk
   ViFY96tllSAUse1Wi7YoyE955rsc0F9HG5vKUujZRd4fEH7C13CQnsXyD
   B2bqx81+a3PGqumW8VihrEssRtV5UeTvdQiYB9n6vrdHn7pDncpWKiXnF
   A==;
X-CSE-ConnectionGUID: i5eTbcABSwiWymZ79WX1rg==
X-CSE-MsgGUID: L7wEvpUySOyjoPBIOBlRBQ==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:30 +0900
X-CSE-ConnectionGUID: LE5Xik2fR8SdQOdHHPC7kA==
X-CSE-MsgGUID: tneGe+ukRCC0giD8+owyPg==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="66945202"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:32:29 +0900
Date: Mon, 18 May 2026 19:32:28 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 4/4] driver core: platform: set mod_name in driver
 registration
Message-ID: <agrqvIiNWrYtGvTk@JPC00244420>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
 <2026051827-curler-disjoin-c83f@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051827-curler-disjoin-c83f@gregkh>

On Mon, May 18, 2026 at 12:27:13PM +0200, Greg Kroah-Hartman wrote:
> On Mon, May 18, 2026 at 07:20:00PM +0900, Shashank Balaji wrote:
> > Pass KBUILD_MODNAME through the driver registration macro so that
> > the driver core can create the module symlink in sysfs for built-in
> > drivers, and fixup all callers.
> > 
> > The Rust platform adapter is updated to pass the module name through to the new
> > parameter.
> > 
> > Tested on qemu with:
> > - x86 defconfig + CONFIG_RUST
> > - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT stuff
> > 
> > Examples after this patch:
> > 
> >     /sys/bus/platform/drivers/...
> >         coresight-itnoc/module		-> coresight_tnoc
> >         coresight-static-tpdm/module	-> coresight_tpdm
> >         coresight-catu-platform/module	-> coresight_catu
> >         serial8250/module		-> 8250
> >         acpi-ged/module			-> acpi
> >         vmclock/module			-> ptp_vmclock
> > 
> > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > ---
> > This patch depends on patches 1, 2, 3
> > ---
> >  Documentation/driver-api/driver-model/platform.rst |  3 ++-
> >  drivers/base/platform.c                            | 21 ++++++++++++++-------
> >  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
> >  include/linux/coresight.h                          |  5 +++--
> >  include/linux/platform_device.h                    | 17 +++++++++--------
> >  rust/kernel/platform.rs                            |  4 +++-
> >  6 files changed, 34 insertions(+), 21 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
> > index cf5ff48d3115..9673470bded2 100644
> > --- a/Documentation/driver-api/driver-model/platform.rst
> > +++ b/Documentation/driver-api/driver-model/platform.rst
> > @@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
> >  provides helpers to register and unregister an array of drivers::
> >  
> >  	int __platform_register_drivers(struct platform_driver * const *drivers,
> > -				      unsigned int count, struct module *owner);
> > +				      unsigned int count, struct module *owner,
> > +				      const char *mod_name);
> 
> Why can't you just use the owner->name value instead?  They are always
> the same here, right?

owner is NULL for built-in modules.
