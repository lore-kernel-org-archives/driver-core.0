Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A382848D868;
	Mon, 21 Sep 2026 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989278; cv=none; b=c1JGh7dOtxJ7q0sBgdPhPVZxVTntyBOHt4Bt/NFZHYvTFoqwLD+egtiyR2zTG1626O54ci2rVNA/umek6vvQNFvOQxnDFBt8xToIQUHF1KN2RNJoxbd+FMJ+0Xsjt0ZA9txx457sjhEaYyCXDfTHpOEhBaroDEyQphxy48+BU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989278; c=relaxed/simple;
	bh=tH/74DYnUM5fA7K0gAZxu3XU6JX7KDrSJcjLf3K+ozE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/8m1n1DCCTkSyKwneaNYrxKaTNmCrqkeo4ptKtGiFaCn9n/kr66W25MG7BlswcHFG8/vosC/Ma7OVaqNgm3gVgMqUM5LiJ3+mTsRvD1Kh3P3J2P+NYttp2cV04RMYTmmizsDma8SP8xEkI3RPtMoR0538bKfEWeXRXZwWszjsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXmd1bjU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXmd1bjU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6DD1F00893;
	Mon, 21 Sep 2026 11:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789989275;
	bh=FVPnbDPg6NPVwGQT/C+W1Qu/uMpuyNippfZ5fBWEgG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fXmd1bjU8aLo6SvjWyXlK7EgKy3qhO9x42gtcVQGXnYHEQrCLkXE8KnqfNfeN4pG3
	 3HP2dQ6OkDabXncrsuTR0D8KQH5PJd12zw6G4bKcv+hg64C3AclNq190EgNjAUkbG1
	 1KSo1r9tsi++b/VDebVqOhOM8NaKRtk2MAJqOSbXDby25wNecnx0JX3QkgRJVPXj8J
	 DW+A63pV82bCeSQGN0SrW0C7Fbb2L9RS/eUEtDZT9x20EhMeyY2vMLuxMm1o+nyM1v
	 gjI6nfFi+wKOLyHAqhsXvjQPW1cNaoqf/moX9ZWUtAY56OwDsJpgtAGiFQvGrK3HO0
	 bqDkmc74T4gTQ==
Date: Mon, 21 Sep 2026 12:14:29 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
Message-ID: <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
 <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>

On Sun, Sep 20, 2026 at 11:18:03AM +0800, Troy Mitchell wrote:
> The devicetree CPU map can distinguish packages and clusters but cannot
> describe multiple dies in one package. Such systems have to flatten all
> clusters into the package, making cluster identifiers package-wide and
> hiding the die boundary.
> 
> Recognize an optional sequence of dieN nodes between a socket and its
> clusters, and propagate the die identifier to every CPU below it. Enumerate
> clusters independently below each die.
> 
> When a CPU map has no dieN nodes, continue parsing its existing package
> and cluster hierarchy but pass -1 as the die identifier. Legacy maps
> therefore remain compatible without being reported as an explicitly
> described die 0.
> 

Where is the associated bindings ? Am I missing to check it in the series
or it is really missing ? It is essential to add any code using the binding.

Also how does it align with ACPI implementation ? It is preferred to be
in parity here, so we need some binding there as well IMHO.

-- 
Regards,
Sudeep
