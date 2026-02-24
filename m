Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A529BD90;
	Tue, 24 Feb 2026 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771957934; cv=none; b=Smj930nUip7wTuOwV6w3ejAc28VBnFTY0xiCmW0Su8lqrUQncrtO95ImJiMaZ64hwyYe9Ko4AgyD5dkBdZtIoGy4Ml6NCC37Q7RzVzFFjXN8Gi6WA7Oh6PgFU4H455vTPevtC8GrpkAqxxsYLeVkQm3R3je4Xk3HcbSPGXrYe7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771957934; c=relaxed/simple;
	bh=pjvAYBrvNS02jtvepugyA12PJiegFiNTbfdgM5xo/i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdjDu1Hy6HsHflSILrdO0R46xTmW0ObDvIBHRt5C6Mwwz3pqEVA1e15SfW9Lr/IsnaZ/23HTygwx2vgLT6CdjuTChhrvoiL+0AjRhKHwIjby74pwBEvHmxcWD2RIvkY52+OtZJ2q5wjQruBk5+InMGgUVz7/9OiWJv2fr+N5nYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7knNeoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7knNeoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52733C116D0;
	Tue, 24 Feb 2026 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771957934;
	bh=pjvAYBrvNS02jtvepugyA12PJiegFiNTbfdgM5xo/i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7knNeoc9b86Pn0zEU+63t097NFo8V1DiirlR+tFZ1FEmys2K12aiKxgV26a+Iq89
	 RW6s0i4WgFsU7xqxe8QBZwCYJNTIVU3fAwl3MGD7Aj4aB1OoJndbEf2iR6U88immAp
	 lZ+ZXHG/Xi72zzK8VDXb1mAK2vZ0209HXQk7MRNvlQC+u2HbsY+3zcDZ+XYAve07YX
	 j2P8qGLxSyl/X5aalMr+ZIKOrye9wAb9AsuokDyn+o7qEDIc7rs0g0ENF+WykPsMJB
	 rB53ZMhwaMGyIXtt5iQf/o7438b0ko4vJZyN2r+EDkjhge4ukxBR8Fm0m2Acp8dlEu
	 cszWkbq8B5NMg==
Date: Tue, 24 Feb 2026 12:32:13 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
Message-ID: <20260224183213.GA3239922-robh@kernel.org>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>

On Mon, Feb 23, 2026 at 02:37:23PM +0100, Bartosz Golaszewski wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/soc/renesas/renesas-soc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
> index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10edd0d58b064650085cf 100644
> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>  	const char *soc_id;
>  	int ret;
>  
> -	match = of_match_node(renesas_socs, of_root);
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +	if (!root)
> +		return -ENOENT;
> +
> +	match = of_match_node(renesas_socs, root);

Doesn't of_machine_device_match() work here?
