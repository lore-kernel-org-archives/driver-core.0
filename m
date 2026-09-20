Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA8352018
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 06:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789884284; cv=none; b=rOlRb3vFLJ8KwEzkAxdppme3FQ8W7Eu4I8Xj4nNgy7AAXZhllQO4XWmfkpfazjN/Ghd9DsM2znpJgVAedmcP0dy4gbSsfwMEJRcVtLTclxyvzPo+yw2zxCnLVXJo5Rl/2dAaOQcQzGPQgDW9OaYPKbgFjHP0nfqjWRMtHeAEGa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789884284; c=relaxed/simple;
	bh=p3NeLi8ins64u5JQBofSLcm9tUC0LCLP1EjMwZP+QV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2af15o2+bobkxk0FGlS2okz87AomCw5Z8m4bZ/fgKqYq0ZWpz+UGcY2ONdc+PCqnU0wD8JG6uc7Ero/7hb3UVsDUjExIW+QwBhLT/qkA1d5jKisWHkmTGQ66gX+K511FHRC8HAGDMIxilcvDns/j0Ua1557DTZbRJglSbCj2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p8wHc45v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p8wHc45v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9171F000FF;
	Sun, 20 Sep 2026 06:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789884282;
	bh=S+lNzO7x/wkjYp1d4dCszYoZ9qNtziyCheIixj8mckI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=p8wHc45viQOTrzIxEy5n77Q9KrWtLYlZX4Hr1dCvOC0LOmyKTBhLq9n7APA2gl/2h
	 GskHrsC4SaBCrBcAdeKprZTOKyBJ48mY17apFC2uGgrzFHqhhZqxAJVrJSFGGMoq5C
	 qcEKarCirN2QpvwYMPjueJEY0jNqBdqqc9fE7leE=
Date: Sun, 20 Sep 2026 08:04:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: vishal.moola@gmail.com, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v3] kobject: fix out-of-bounds access in
 kobject_action_type()
Message-ID: <2026092014-lumping-datebook-0076@gregkh>
References: <16559d89.19644.1a037110cc7.Coremail.stitch@zju.edu.cn>
 <20260920053726.22626-1-stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920053726.22626-1-stitch@zju.edu.cn>

On Sun, Sep 20, 2026 at 01:37:26PM +0800, Jiacheng Xu wrote:
> kobject_action_type() compares the input against each known action
> using strncmp() and then indexes the action string using count_first
> to check for an exact-length match.
> 
> An embedded NUL can make strncmp() return zero even when count_first
> exceeds the length of the action string. For example, the five-byte
> input "add\0X" makes the parser access kobject_actions[KOBJ_ADD][5],
> which is beyond the end of the "add" string.
> 
> Check the action string length with strlen() instead of indexing it
> with the input-derived offset. This rejects malformed action strings
> containing embedded NUL bytes with -EINVAL instead of invoking
> undefined behavior.
> 
> Fixes: 60a96a59569b ("Driver core: accept all valid action-strings in uevent-trigger")
> Signed-off-by: Jiacheng Xu <stitch@zju.edu.cn>
> Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
> ---
> Changes in v3:
> - Document rejection of action strings containing embedded NUL bytes.
> - Correct the Fixes tag.
> - Correct the malformed-input example.
> - Add Vishal Moola's Reviewed-by tag.
> 
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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
