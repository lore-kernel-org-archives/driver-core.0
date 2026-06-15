Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCB296BCD;
	Mon, 15 Jun 2026 06:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505217; cv=none; b=CkEi96GJjfESa7rtnlvmeJnOVhB0vbW8RQ4YeK7SUcf+w+axGRsgJW1n6If3994wAS2MseRMtLueMsxsiV2hyBzh1V/DOlKPi3RjYJ6VNkk0arVkmluMxWAjBTEYsAoTTTILVlioZnosQYJqTkSQ91OMCI1LE0jmfH2uyE/y4K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505217; c=relaxed/simple;
	bh=Xe9l67nGt4Kc4L+FUqiFs8jrQ7lqDLD2IBmMl0ujvGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiQjRBPrFYsh7fIM6KF+ENvDNz4579V/SviBspbT5aCe06RFMNHyBCy+r9BIMgoqPg7thlMtznbNgZyEqpf2A91TYMfUt2hGbre73lAx7SaO5f7syVQ0PBCKionPMR7PzkiAd4ByUiwoUhvqkxAwqpBHV54oGmplASJnLtrp4vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZx677jE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZx677jE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841801F000E9;
	Mon, 15 Jun 2026 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781505216;
	bh=+QxQVQJlIGn+2ZDCWDLM0UXRIyhO2e1DQA5DWZNrCss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SZx677jEm2tC5R3Hj+19phsHzay5QecVVID55jtGEu2sNMcLuhEjRPcs2DlaJ4oMQ
	 anUHZXaqQkXme9XedriIJ70mFzaCYDotvliDBif99LaO+cIBsYB4lsQKZ1aQUks1Ts
	 jZ+ojdEaQSXknVzIUkqDdaHY14O/TqF9gNtVshQ5yqQIatA8BVvePlZk0MpdKrhEFB
	 65p91kPXpEv+zZQuEgP8KOuCOESxd22SQwFVy4bX/s+1fzDkGvBesBRiY20LAu3XYk
	 IciQGk0QvXK7hOTZsgpAx3eh/C6cnA2YjER2beZuLrh3NtfMpGYgjR7cCti+7VB02K
	 OaRAm1r+w3I7Q==
Date: Mon, 15 Jun 2026 08:33:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH] of: property: Fix of_fwnode_get_reference_args() with
 negative index
Message-ID: <20260615-obedient-axolotl-of-argument-fb55ef@quoll>
References: <20260611102806.2643869-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611102806.2643869-1-alban.bedel@lht.dlh.de>

On Thu, Jun 11, 2026 at 12:28:06PM +0200, Alban Bedel wrote:
> fwnode_property_get_reference_args() should return -ENOENT when an out
> of bound index is passed. An issue arised with the OF backend because
> the OF API use signed indexes while the fwnode API use unsigned ones.
> When an index value greater the INT_MAX was passed to the OF backend
> it got casted to a negative value and it returned -EINVAL instead of

INT_MAX is not out of bound for this function. It is invalid value,
because OF code expects signed.
 
> -ENOENT. This patch add a check to of_fwnode_get_reference_args() to
> catch negative index before they are passed to the OF API and return
> -ENOENT right away.

I do not understand why are you fixing this issue that way. For this
API, the INT_MAX is correct value, but you claim that it is wrong and
should be ENOENT (even if there is entry).

Fine, if this is not a correct value, then EINVAL.

But more important I think this should be just fixed in different way -
why index in OF calls is signed in the first place? All indices are
supposed to be unsigned in general, because that is both logical and
readable when accessing arrays.

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
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> ---
>  drivers/of/property.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 136946f8b746f..eace2d1847b99 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1157,6 +1157,13 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
>  	unsigned int i;
>  	int ret;
>  
> +	/* This function should return -ENOENT for out of bound indexes,

/*

Please use Linux coding style comments.

> +	 * but the OF API uses signed indexes and consider negative indexes
> +	 * as invalid. Catch them here to correctly implement the fwnode API.

Best regards,
Krzysztof

