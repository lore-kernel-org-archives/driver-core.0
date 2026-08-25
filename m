Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC523D47AA
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787643366; cv=none; b=ig1vRs0uRrl65/mTBwXKDWwYG7EOYgrOwk5MWBYS4zlhzY1E63P28tIkBmCyxSriRv9IzGVsjL3j/t/36Ha5l8MJUKpEpd7DOX5imvs0XPaP4AfbAPWeP/FcB3D/oGzB3wsvFwgJeIOdZ3Nqy/vK6e/gFq+dMYUytrSecY3pJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787643366; c=relaxed/simple;
	bh=IPIKtlwBUKUutrL2mNlcZi8RxDpQPH/qum39uJhzJQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd272TCTnHUayCfm+KWfnBzPyK3TTDyISd5zAQ2cRgXuCpcCU+0AngcVZHpekO547pbHWuMDAxbE0w8wylOnQ+o5/xuWfnWv9GmtY9Bc/mKsNmVpgJKZUzkPOHoJmJ8PImNlbDncWdqIOVwTCsIqgcWIdvPGBbngBwUm9P5H7to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lB1oldSp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lB1oldSp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10A11F000E9;
	Tue, 25 Aug 2026 07:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787643361;
	bh=2qCrP7MHp5ONEFe5/2F6ct7PIUrE5L31jDJUy3gtN0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lB1oldSpi6yZUJuQ1L889+827/TW1WuoExxoOBOIR3GThSVxPGt3VRDPAmkASpyof
	 ct8q3DsunUp22AAPknktPmy0+FkbRNH0+Cm/eCkrpRtQk6pn0a1RpAOlwyoCeX1lB1
	 opuNP1JJ1iMno09PJj++aCTLT5rZ4fDw1bJyRdPw=
Date: Tue, 25 Aug 2026 09:35:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: vishal.moola@gmail.com, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 RESEND] kobject: fix out-of-bounds access in
 kobject_action_type()
Message-ID: <2026082544-impromptu-proposal-2ecd@gregkh>
References: <2026082518-swinging-wildfowl-9c19@gregkh>
 <20260825070525.76409-1-stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825070525.76409-1-stitch@zju.edu.cn>

On Tue, Aug 25, 2026 at 03:05:25PM +0800, Jiacheng Xu wrote:
> kobject_action_type() uses the position of the first space in the input
> as the length of the uevent action. It then checks the byte at that
> position in the corresponding action string.
> 
> An embedded NUL byte can make strncmp() report a match while
> count_first is already greater than the actual length of the action
> string. For example, the input "bind\0 ..." makes the parser access
> kobject_actions[KOBJ_BIND][5], which is beyond the end of the "bind"
> string.
> 
> Use strlen() to verify that the input action length exactly matches the
> known action string before accepting the match. This avoids indexing
> the action string with an out-of-bounds offset.
> 
> Fixes: f36776fafbaa ("kobject: support passing in variables for synthetic uevents")
> Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>
> ---
>  lib/kobject_uevent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index ddbc4d7482d2..b03562301bfe 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -83,7 +83,7 @@ static int kobject_action_type(const char *buf, size_t count,
>  	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
>  		if (strncmp(kobject_actions[action], buf, count_first) != 0)
>  			continue;
> -		if (kobject_actions[action][count_first] != '\0')
> +		if (strlen(kobject_actions[action]) != count_first)
>  			continue;
>  		if (args)
>  			*args = args_start;
> -- 
> 2.51.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
