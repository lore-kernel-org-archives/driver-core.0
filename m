Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD6036195A;
	Mon, 28 Sep 2026 05:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790572473; cv=none; b=fbwL/IKt9YeKVoN28iqBXb7cUo8evejmW4V66Rx9nVAXd/sXNWlgIMKYQA2DEkdjHaD6FFDSmsgpv7O3Swm3p443ywEBZl1SvKyAnD04YeInGILRrGRGlRY7lOkDyKr8hj4NvMhhxLlL944Q4m88gDcuK0eyBNyiZ1pzl1RZ++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790572473; c=relaxed/simple;
	bh=t8vWTi17bZjzu97QihdDCBRUxbsMrReoLp+F91eNGlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9e/h7ur1KObOEjfDjftUP94vxWUR7UCrzODQoWH0V3hO8mxHtBpZ284QDXmZ/E871LnhHKf9AmMRW00TXZC4PHgDTTZIqW8RNATvvCVmJB3jOxGuzjkEvvkUJzfQUbSHlv+Sa4ZAQCIAW0DjJv/VHN7vXO7v2FL7Rw2zekSrMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z6I+Sp4u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z6I+Sp4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A091F000FF;
	Mon, 28 Sep 2026 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790572471;
	bh=d5G8KDzWD3+Z+7AlD6YRuKE+rOIimOn2l/IBQGRPiSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=z6I+Sp4u5aHOlATRBbNS2irdtSUeBXdKEqAYNkpGHDaSjOMWqq4FRo8Bv47g2cB0m
	 nnNxjezx2AnMeThsnOOZMVHnd7Tv2DzMRnNsia2AxoijEq7guP+bexBmSzClnKQxIr
	 VSTdVQavdFoISLnu/m5pibk9q8arYpd7G9tRkENM=
Date: Mon, 28 Sep 2026 07:14:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hyeontaek Lim <jennystr233@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+d164947c037324221043@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject_uevent: fix OOB read in kobject_action_type()
Message-ID: <2026092806-life-amazingly-e68d@gregkh>
References: <20260927174241.36888-1-jennystr233@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927174241.36888-1-jennystr233@gmail.com>

On Mon, Sep 28, 2026 at 02:42:41AM +0900, Hyeontaek Lim wrote:
> kobject_action_type() matches a user-supplied action string against
> the short "add"/"remove"/"change"/... literals in kobject_actions[]
> using strncmp() with a length (count_first) derived from the size of
> the user-supplied buffer (up to the first space, or the whole write).
> 
> strncmp() correctly stops comparing as soon as it hits a NUL byte in
> either string, so a caller can make it report a "match" against a
> short literal like "add" by embedding a NUL right after "add" in an
> otherwise much longer buffer (e.g. write "add\0" followed by 391
> bytes of arbitrary padding, with no space, so count_first stays at
> the full write length).
> 
> The subsequent bounds check then indexes the matched literal at that
> same, much larger offset:
> 
>     if (kobject_actions[action][count_first] != '\0')
> 
> which reads far past the end of the 4-byte "add" literal, into
> whatever object happens to follow it in .rodata (observed to land
> inside uevent_helper_sysctl_table on the reporter's build).
> 
> Fix this by checking the literal's real length against count_first
> before doing the strncmp()/indexing at all, instead of trusting that
> a strncmp() "match" implies the lengths agree.
> 
> Reported-by: syzbot+d164947c037324221043@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d164947c037324221043
> Signed-off-by: Hyeontaek Lim <jennystr233@gmail.com>
> ---
>  lib/kobject_uevent.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index xxxxxxx..xxxxxxx 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -78,10 +78,11 @@ static int kobject_action_type(const char *buf, size_t count,
>  		count_first = count;
> 
>  	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
> +		if (strlen(kobject_actions[action]) != count_first)
> +			continue;
>  		if (strncmp(kobject_actions[action], buf, count_first) != 0)
>  			continue;
> -		if (kobject_actions[action][count_first] != '\0')
> -			continue;
>  		if (args)
>  			*args = args_start;
>  		*type = action;
> 

Hasn't this been resolved already?
