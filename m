Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDB21ACED5
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640519; cv=none; b=WfxKnfOxk1e2MLDwjYVHU8c2mar8jg1+Hsg8lwSbUQ/u+C/kU28bY9dwItIC6Uh8/t/mYIQhl/KGaXKx9MAQmyxOZqFmcuYzZyWOlvjthqRZAJ6/gXk7eWVYQ+R1Us4bfYD2/DXH5YKiJq5siwtH+bdSroDQgGfyQlAy5qf1RIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640519; c=relaxed/simple;
	bh=ImT2VGKXlqkb5IruzmwBz7J2AuPqSBwLx9h8OJV/OYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0xMU9pw9bZw0ijxmwPMikBuvlM9axufrake/PHiX5Dnf7JyVgQtHTzDGEnGMWEnRbdgwLayFlMtpPa3+QVP90OxAG4T9tRII5eF+2D2uNEJvHfw3J1LBXapaew/Zxan7CPOB5mWHxicXUy4sNbqAMNFPV7jdUNh4L/siIAP3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o8h/szgE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o8h/szgE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190CD1F000E9;
	Tue, 25 Aug 2026 06:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787640516;
	bh=XJ/Dx77QZsZBDnWdPca/egfP8Ey4QT1e9VV2VO93w/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o8h/szgEf2xTGh029pn49qWgdrwZxR1lHkJCG8N0uUZmL7uA3nzoYHbZ191QaCh1T
	 qw0P3VFk61xJo4ODAzk0Lh+1hgo0OvNsXnEg9OtQkHBUSFAqwv4EiMpyJ0qvS2scHb
	 llVe5SerSArl4CmvPfNiXfBwvZcTcBIEfK65clng=
Date: Tue, 25 Aug 2026 08:46:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: vishal.moola@gmail.com, rafael@kernel.org, dakr@kernel.org,
	akpm@linux-foundation.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] kobject: fix out-of-bounds read in action parser
Message-ID: <2026082543-ceramics-overdue-f278@gregkh>
References: <2026082518-swinging-wildfowl-9c19@gregkh>
 <20260825062620.63807-1-stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825062620.63807-1-stitch@zju.edu.cn>

On Tue, Aug 25, 2026 at 02:26:20PM +0800, Jiacheng Xu wrote:
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
