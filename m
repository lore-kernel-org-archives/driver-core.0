Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74CA2BEC3F;
	Sat,  4 Apr 2026 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775324162; cv=none; b=gZegJGFofJxPsXDD3kd7QGm9pkWwsIFxsobxqzp1YIc1dLNEAXnlPCm46CjxW2nUxVN2AW1Lu2Mc3keM0f/kXwecG8gHi1cE7EApUf9wnq7cTSb1JciitIm02GUZnjI6EtlDDpq2fcZ88MRiziizHfx8OfawME1oVpE1RLegobQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775324162; c=relaxed/simple;
	bh=TORpb6Dim4e0ObGPv26qx2pBCQqY7zm//VWYhZcs5Ew=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=sYqjb+PBIb7HX1tlcp7V2Ei5zX+lste32PMTkUJubtuDq473ks2MSuiIvczvhJjOBbpMe4IuG9I+5+idHUsyyi5k2FOFC63oPiVph7qlqvTbr4nksE1eL/Ibw6aHBMSKLNXKAK+5HrLr05TlPoz43LL6QJz9oltJSJAk9/VylkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCXtMTSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCXtMTSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BC9C19421;
	Sat,  4 Apr 2026 17:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775324162;
	bh=TORpb6Dim4e0ObGPv26qx2pBCQqY7zm//VWYhZcs5Ew=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=fCXtMTSeY1s+cEghv8fg1hUgrYZrP4ZUSqZ+XfsQ64FiCBIJ2eziNx1rna/TUVCxu
	 ZfTnDHK5aaLKpXBQZamTVtXwrIYYuNYs0CF6GWc6+mg9/CYFd0kr3xvdQV5/lADJ2J
	 WOvJWD5UIAq0rrLqdj7jju5cZfCuHxsLq0PwywCEq4geXo1O6qJkH0EdGblV6/Zdtd
	 TSR3Y4IsB2cgYzkH2R5Mj+3jQjdBU4wt3p6Xm8G700VODD65EEYz8J9KSIjG9dvOuA
	 p03VaQOVvIrCITmxAEWjh08tIFB7ew9uR9MnAn9oKEMR5hZFo30Gbmu1WnktjV1AxR
	 saboHIoEN3+KA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 19:35:57 +0200
Message-Id: <DHKJW2WZSMOS.10UAHGDKGHHOB@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/9] driver core: Don't let a device probe until it's
 ready
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Saravana
 Kannan" <saravanak@kernel.org>, "Christoph Hellwig" <hch@lst.de>, "Eric
 Dumazet" <edumazet@google.com>, "Johan Hovold" <johan@kernel.org>, "Leon
 Romanovsky" <leon@kernel.org>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>,
 "Robin Murphy" <robin.murphy@arm.com>, <stable@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
In-Reply-To: <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>

On Sat Apr 4, 2026 at 2:04 AM CEST, Douglas Anderson wrote:
> +#define __create_dev_flag_accessors(accessor_name, flag_name) \
> +static inline bool dev_##accessor_name(const struct device *dev) \
> +{ \
> +	return test_bit(flag_name, dev->flags); \
> +} \
> +static inline void dev_set_##accessor_name(struct device *dev) \
> +{ \
> +	set_bit(flag_name, dev->flags); \
> +} \
> +static inline void dev_clear_##accessor_name(struct device *dev) \
> +{ \
> +	clear_bit(flag_name, dev->flags); \
> +} \
> +static inline void dev_assign_##accessor_name(struct device *dev, bool v=
alue) \
> +{ \
> +	assign_bit(flag_name, dev->flags, value); \
> +} \
> +static inline bool dev_test_and_set_##accessor_name(struct device *dev) =
\
> +{ \
> +	return test_and_set_bit(flag_name, dev->flags); \
> +}
> +
> +__create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);

Since this is a public header included in a lot of places, it might be wort=
h to
#undef the macro once done defining all accessors.

> +
>  /**
>   * struct device_link - Device link representation.
>   * @supplier: The device on the supplier end of the link.
