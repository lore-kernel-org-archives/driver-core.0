Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED127FB05;
	Wed, 22 Apr 2026 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857257; cv=none; b=t2aAoIvfDDLyRke+tjh0mUiKN5o1isdomwaNXHHuF77BbReMIZRTUzYSYLcxTzST5rN17pA86gS3zx5P1xGUdyI4eUtUmKDO3zZj0r83hgr/yev7Y7St8O/Qo4Lt+D1+QuyCzm7KbMmuEtqHmSgirnpgwciz23tIfb8MklivDds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857257; c=relaxed/simple;
	bh=I3A5vzKKmr/BUI6ycsaCFjVHGYLX/XgpV0LIBxr//m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSlqB5R9pb+rOkdZcfMXmYvmVzTdBf7zqTVfPrjFN04ldvYmvxjBbvXG+UD6fBvqFhllyDxOS6+rv0sNZny2IAOlivOcaDtDNSjFVfeluHwCIYL5018DUwJDRziMbfqG7NuvL1aAypUkgs6PCJBx8JrtoGH2+I0ZHc656ZLHNqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YfLDCdPf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YfLDCdPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F691C19425;
	Wed, 22 Apr 2026 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776857256;
	bh=I3A5vzKKmr/BUI6ycsaCFjVHGYLX/XgpV0LIBxr//m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YfLDCdPfbKxE9Xc7LpMa2DM5pnZjmOevyPXZFaZE0gSZTKcZeYWXJXrdiDo8T9uJ6
	 Ab7ip7yS9aOhyVUAZMxhCMdqkjM18P8PA9zl3FSei8FD5Gc5TMPib7dy46S7SbXU0N
	 aM2gizjEpmMUr5XS49klkkfNwWulksbEsHVHpbsU=
Date: Wed, 22 Apr 2026 13:27:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH v3 4/4] docs: driver-api: add mod_name argument to
 __platform_register_drivers()
Message-ID: <2026042214-awaken-slouchy-4903@gregkh>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
 <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-acpi_mod_name-v3-4-a184eff9ff6f@sony.com>

On Wed, Apr 22, 2026 at 06:49:06PM +0900, Shashank Balaji wrote:
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
>  Documentation/driver-api/driver-model/platform.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

For obvious reasons we can't take patches without any changelog text at
all (and neither should you want us to...)

thanks,

greg k-h
