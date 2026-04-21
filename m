Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334436166E;
	Tue, 21 Apr 2026 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776752683; cv=none; b=sc3xiUZAI20Ig09xoaNwijchDkQE5gMtTpthMwd9N9YXcZ3TdbqpwJmxRN0CuzJiOIEWqCL7BhFGz+t4eXCVnVOayclsYdSh24ewsDKE+KrxDUdmExcImMuori225uu3FVJgRIBtO3EdteWMsY8lORjJINaRIfwPtYre0Nz+ch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776752683; c=relaxed/simple;
	bh=H5LXpbWQGHxrc690vZi3I1NXcc8PBNmHG5EXIPileng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1kIzAqnSiXUikTf8VBiz+xy0LSOpuXviqe75MHx7r16narKDjOrAP617DpgeAW3SnrlSYtuwnwhCA2u/joMba9SRbW6RZTrhX9MiGx7CsXSbPt5iX/n6N5sW8gzZk7hOfYlGDhON2jYs7vkNf82Ez3+wC39qErzurhikbwwVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MHRyEvCi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MHRyEvCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0CBC2BCB0;
	Tue, 21 Apr 2026 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776752682;
	bh=H5LXpbWQGHxrc690vZi3I1NXcc8PBNmHG5EXIPileng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHRyEvCiJwOiM47m/JOUhPsVPiZhmNqd+ETjA9Qw5OPdUkdDHCmw92AqHPh6sVVF3
	 skFxtyEIAAxmVfdtDdH8DdiEscuhBCpLtoW+oCzZ+gNqC2psYokVRq9vjgP8DTxg3L
	 p4z9Wofbd2qbz+6HF5COqPIDFa/Hb9XL0F70A+iM=
Date: Tue, 21 Apr 2026 08:24:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
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
Subject: Re: [PATCH v2 2/2] driver core: platform: set mod_name in driver
 registration
Message-ID: <2026042156-bloated-lushness-c28a@gregkh>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>

On Tue, Apr 21, 2026 at 03:02:35PM +0900, Shashank Balaji wrote:
> Pass KBUILD_MODNAME through the driver registration macro so that
> the driver core can create the module symlink in sysfs for built-in
> drivers, and fixup all callers.
> 
> The Rust platform adapter is updated to pass the module name through to the new
> parameter.
> 
> Tested on qemu with:
> - x86 defconfig + CONFIG_RUST
> - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT
> 
> Examples after this patch:
> 
>     /sys/bus/platform/drivers/...
>         coresight-itnoc/module		-> coresight_tnoc
>         coresight-static-tpdm/module	-> coresight_tpdm
>         coresight-catu-platform/module	-> coresight_catu
>         serial8250/module		-> 8250
>         acpi-ged/module			-> acpi
>         vmclock/module			-> ptp_vmclock
> 
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Depends on the previous patch, without which the kernel fails to boot on arm64
> defconfig.
> ---
>  Documentation/driver-api/driver-model/platform.rst |  3 ++-
>  drivers/base/platform.c                            | 21 ++++++++++++++-------
>  drivers/hwtracing/coresight/coresight-catu.c       |  3 ++-
>  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  2 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |  2 +-
>  drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |  3 ++-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  3 ++-
>  drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
>  drivers/hwtracing/coresight/coresight-tpdm.c       |  2 +-
>  drivers/hwtracing/coresight/coresight-tpiu.c       |  3 ++-
>  include/linux/coresight.h                          |  3 ++-
>  include/linux/platform_device.h                    | 17 +++++++++--------
>  rust/kernel/platform.rs                            |  4 +++-
>  15 files changed, 47 insertions(+), 29 deletions(-)

That's a lot of different things all in one change, please break this up
into smaller bits, this is not going to work.

Especially as the coresight changes are incorrect, no individual module
should EVER have to list THIS_MODULE or KBUILD_MODNAME in a function, it
should happen automatically by the compiler using a helper #define, like
is done for other busses.

Please fix that up first, then you can worry about the other ones.

thanks,

greg k-h
