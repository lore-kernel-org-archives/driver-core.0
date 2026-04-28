Received: from jpms-ob02-os7.noc.sony.co.jp (jpms-ob02-os7.noc.sony.co.jp [211.125.139.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A75464D
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 00:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336645; cv=none; b=tviDxF6Yun3gKWWXULiXueZGO4sgkzCwoJxShxV3D6wH9mCKFO57l9Zx0lFc5blPzblXAlPs+5bLL2XWvn6owJruX2smE5D1pN7ugMJcg9cIxmqMineiMboYaaZHJEXG1tyEhKqsFMpfwV+Niil1vFdaEJ5oGm907TDeepu5pCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336645; c=relaxed/simple;
	bh=BHJBLt+nE4AsueTS+IRnK41MDsfpFl09fk2rkAOBGfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvCi99wJ29IjcaGKL5sd3vhJlwlGtJs31eJCTPBTonrOIJQevFPCCE2qvarwVv7Ej7/bzBft0oO8T225jDw30V6CEJnfPPGQvT7m83KcJymrvsnrxPUajCJOYIPVtNtDAQESdS0T+q2MYGe9jYOmEBBJSFqOMjXeJQU6fNh0dgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=ul+G11fT; arc=none smtp.client-ip=211.125.139.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="ul+G11fT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777336644; x=1808872644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OLmIYYgccj61Z7Y1BhmUJwFYcoGweKAe0uPk0qWtjNw=;
  b=ul+G11fTdLLzqvWmx8LCH0TVhT/Udz+3gb2/O2nx0VH6iUlmelqKTZD7
   1KzatpBFM61MHDbasXWm/Y5O41QXheb0M+MnD7EcymW5qCjoAXVDtHp43
   qR/NhapGVPRbCGyVb5N99PVZcv2njE7L5U3K/DLrFhv4Pz5VGe8P0eyvI
   ODGP+qnO0pEHkYIuPk5Cc3HRxIxhPIPw2r0o76s4vTB01bV1kLcvytczf
   W7kKfpmemw6gZJdIZqsMr70Ue77W1f6c88KltVndztjvjl8nUY386ls87
   EAshwnN9sXt33OoJieR/A/0Mm11Ybd4yHBPulNFypidfDRo7RLq+Qi2QS
   g==;
X-CSE-ConnectionGUID: SU1WNNr7QVCC/SybNAcFDw==
X-CSE-MsgGUID: bfrh3MUJQO+pwGHeT4g5Fw==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:37:17 +0900
X-CSE-ConnectionGUID: /GTJxWLWQ4+ZYLnZbAxakg==
X-CSE-MsgGUID: b3MnIMCXS6Ww/7MJqXJZlA==
X-IronPort-AV: E=Sophos;i="6.23,203,1770562800"; 
   d="scan'208";a="52460544"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:37:16 +0900
Date: Tue, 28 Apr 2026 09:37:12 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Gary Guo <gary@garyguo.net>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>, Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
Message-ID: <afABOMT_s9DvF6NY@JPC00244420>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>

Hi Gary,

On Mon, Apr 27, 2026 at 02:29:55PM +0100, Gary Guo wrote:
> On Mon Apr 27, 2026 at 3:41 AM BST, Shashank Balaji wrote:
> > module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
> > of platform drivers register themselves prior to subsys_initcalls
> > (tegra194_cbb_driver registers in a pure_initcall, for example). With an
> > upcoming patch ("driver core: platform: set mod_name in driver registration")
> > that sets their mod_name in struct device_driver, lookup_or_create_module_kobject()
> > will be called for those drivers, which calls kset_find_obj(module_kset, mod_name).
> > This causes a null deref because module_kset isn't alive yet.
> >
> > Fix this by initializing module_kset in do_basic_setup() before do_initcalls().
> > Modernize the pr_warn while we're at it.
> >
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Suggested-by: Gary Guo <gary@garyguo.net>
> 
> I didn't suggest this change :)
> 
> I suggested `pure_initcall`, which is just a one line change.

Oops, sorry about the misattribution.

> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..ac088d4b09a9 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
>  
>  	return 0;
>  }
> -subsys_initcall(param_sysfs_init);
> +pure_initcall(param_sysfs_init);
>  
>  /*
>   * param_sysfs_builtin_init - add sysfs version and parameter
> 
> pure_initcall is level 0 so it happens before all other init calls. Does it not
> work?

tegra194_cbb_driver registers itself in a pure_initcall too. We wouldn't
want the ordering of its registration and module_kset init to be link order
dependent.

Thanks,
Shashank
