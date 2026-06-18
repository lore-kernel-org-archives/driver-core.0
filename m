Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B92EAB6F;
	Thu, 18 Jun 2026 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802569; cv=none; b=afvYzxaaww2iLNY1VJ4uuGQZdWM8xGVXhtrpcnQDLYmUZmbSwWEpVqqJqPrklF5UsZ2RVA2pdNICwfi1qOYmzfCpzoEv5Y/jlm1eOXQbMydrwYRyuQDmH6UFBYDZiZbZZv3pMB8zCUh7CgEyXxBKSjgI6bJ+oCUbNnaUA6tFCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802569; c=relaxed/simple;
	bh=Mkcm3E19KdUw8Ckx8jkzltzVQVP0q2tXGX/CgN2NxmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqWQPbjE+YKFlRUqMAqJXZ+GULeLl7b7caJ5Qw2E8JaFHaS7KNvG9xq8IRPHmJrtNtGA9+AreZ3eiWZ5fNcKKGOpVAGh72V0IdkMbnmLLEyjf7Z5RKEoUI/HMK+/ZDDJX+CkJNUCXEw8I9WY8iafb8SRUxhciO3VTVDFz9ZUklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrLIjvo/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrLIjvo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97861F00A3A;
	Thu, 18 Jun 2026 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781802568;
	bh=/2+acCb1uwg9tnAVHqermep9Dl1x6MIb4wqyepU6UEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YrLIjvo/G0a9ZJMwjxwi9JTRv9SPvuQg7++aoodKmsgqO5YCl/T2ekDxJyg6G2PTY
	 sUpPSieuHLXogpGCMslw995NXoWQQeD18w74OdCmpnpvD4XKp/szwxP51voe244lC1
	 3ts9XYsumo0ETpHIS2O3KTDLqH3+7o2J4re2q7o74+9GFBwkw9NufVJZ9YVyAyQc6R
	 djXu3YZoWiAfb9OQfaC+WcOW5i+PeKiAJ9VbO6Zv/PyrK5I9nd58f0OVfGHlpcrcbo
	 qpjS4MrzTciYDdQyuIX103FOHqfNDAOzsTNvzjQ2l447s2iVTfusRhVXCSn/Fq2DjG
	 jjdbw8FWjBnFw==
Date: Thu, 18 Jun 2026 12:09:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2 1/2] of: property: Fix of_fwnode_get_reference_args()
 with negative index
Message-ID: <178180256587.1928929.9142555115423601522.robh@kernel.org>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>


On Thu, 18 Jun 2026 17:20:34 +0200, Alban Bedel wrote:
> fwnode_property_get_reference_args() should return -ENOENT when an out
> of bound index is passed. An issue arised with the OF backend because
> the OF API use signed indexes while the fwnode API use unsigned ones.
> When an index value greater the INT_MAX was passed to the OF backend
> it got casted to a negative value and it returned -EINVAL instead of
> -ENOENT. This patch add a check to of_fwnode_get_reference_args() to
> catch negative index before they are passed to the OF API and return
> -ENOENT right away.
> 
> This issue appeared when the following pattern was used in the LED
> subsystem:
> 
>     index = fwnode_property_match_string(fwnode, "led-names", name)
>     led_node = fwnode_find_reference(fwnode, "leds", index);
> 
> Unlike the same pattern with the OF API, this pattern implicitly cast
> the signed return value of fwnode_property_match_string() to an
> unsigned index leading to the above issue with the OF backend. It can
> be argued that the return value of fwnode_property_match_string()
> should be checked separately, but I think there is value in supporting
> such simple and straight to the point patterns.
> 
> Link: https://lore.kernel.org/linux-leds/aimVRwJPhlGxsIUj@tom-desktop/T/#mc43cbf7e0599991b56dd0d9680714d28d145fbc8
> Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> ---
> v2: Fixed comment block to follow linux coding style.
> ---
>  drivers/of/property.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Applied, thanks!

