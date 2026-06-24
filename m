Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B1E372EEC;
	Wed, 24 Jun 2026 19:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328444; cv=none; b=nuN7Azs1rYdIDngUvOJihIUV1IjqmMMwDfINAtswd3qtioCTNr6V2VSCO52kzCtSMNMJpZrPlqynV26l2GBwJSXlgON19Ea1L73A7FdbzMpPVEtDCcSiWYOEUyjDZ7P/wNNxtPqM+9wKANHD9lQI4bFDJq6ZPEyKsZCG/CkUH0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328444; c=relaxed/simple;
	bh=TJrYqkEmzBcIuRk4NkFKPbj+WerEbvtlgsXw/+2tDE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+jFGwOH1nLHH2wS+zHYNzpiO6qmbqAiisaP46ENuVD4fJ++l8q7XGeenh++0M/QJJrxtDT7pCsZuIEovApenlyVOJYFUdo/rEA/of+n6DzbfkOO0ANvf9adh5l4ke6EKInwYifY/GJ9NpCq0q7ZHRcmrTtkvEHXg3Z9wExg9zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gFRWl17f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gFRWl17f"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18912227;
	Wed, 24 Jun 2026 21:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782328400;
	bh=TJrYqkEmzBcIuRk4NkFKPbj+WerEbvtlgsXw/+2tDE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFRWl17fewRBNx5IZw0ANyYPSgxXydfLNPrihsfkT0KjDgb+4aS3XufW5zBN+i2K7
	 Me3fSJ/Gp6uZkeqpuAXOP398GX7JFVCUvZDDSxI4OZWAazFuStseVJ+/u0GzXSbB3d
	 3dx270PDIVjhNVWXDtpBs9Mv5OX6V+dx3r/hN7Vw=
Date: Wed, 24 Jun 2026 22:13:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 1/4] device property: Introduce
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <20260624191358.GC851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
 <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-1-0a8db472af4a@nxp.com>

Hi Frank,

Thank you for the patch.

On Wed, Jun 24, 2026 at 01:00:09PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Similar to recently propose for_each_child_of_node_scoped() this new
> version of the loop macro instantiates a new local struct fwnode_handle *
> that uses the __free(fwnode_handle) auto cleanup handling so that if a
> reference to a node is held on early exit from the loop the reference will
> be released. If the loop runs to completion, the child pointer will be NULL
> and no action will be taken.
> 
> The reason this is useful is that it removes the need for
> fwnode_handle_put() on early loop exits. If there is a need to retain the
> reference, then return_ptr(child) or no_free_ptr(child) may be used to
> safely disable the auto cleanup.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Nice idea.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> change in v2
> - collect Andy and Guoniu's reviewed-by tags
> - fix indention
> - remove extra space in commit message
> ---
>  include/linux/property.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 14c304db46648..d51824c13d2cc 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -545,6 +545,11 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
>  	for (child = fwnode_graph_get_next_endpoint(fwnode, NULL); child;	\
>  	     child = fwnode_graph_get_next_endpoint(fwnode, child))
>  
> +#define fwnode_graph_for_each_endpoint_scoped(fwnode, child)			\
> +	for (struct fwnode_handle *child __free(fwnode_handle) =		\
> +		fwnode_graph_get_next_endpoint(fwnode, NULL);		\
> +	     child; child = fwnode_graph_get_next_endpoint(fwnode, child))
> +
>  int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>  				struct fwnode_endpoint *endpoint);
>  

-- 
Regards,

Laurent Pinchart
