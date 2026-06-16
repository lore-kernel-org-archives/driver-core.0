Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03183B71C2
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605486; cv=none; b=r8LQdk8A/1wDVpGeNwnO+nnArTa+XjDx4fU4hhG38KqDaMg6KhTb/Ib62B7VQflfZI5kHSgmYl6uIJwpibjBqK4HerkOp/A4N/fSVSLySBQhdXWxjUy681XsUzC2NZ0O7Eacy7i0fkrFWtfsbYRs9dq10t/eTeOtcprnyNzIKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605486; c=relaxed/simple;
	bh=2itV4gxWcrb+6K8N1sU6/sY9DgdyT/G2GSXmsaynKac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qumYxI4v6GFD9Dw6Qr/3u6xTGRPWs1FHpu7qszitsNmiQGiE/QDzGfsxqKPwuOAS8RWlmbUeR9qCgAgtZVIB5jqPvB2X9YnNOWd3zW6sqp9kdI+ZSuFSKsEXF6fLs5heO9FaNahK1maLE5gaTBMzF18gOIoLiI2SLeGArHHzB10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WuATAeLs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WuATAeLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5E81F000E9;
	Tue, 16 Jun 2026 10:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781605485;
	bh=2itV4gxWcrb+6K8N1sU6/sY9DgdyT/G2GSXmsaynKac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WuATAeLsyeOxZECjmMX1eMSGvyWxEya4YvdmbOJ4F2IhPuuNjb25awWkjYo0lV0oq
	 ckkmvdhd1w3Jb9htvTEGmXs8qKKQIntzHkR46ltX0UzaZ7fvp+0QnRUu10xNW5S5EN
	 FtiqrGKzGlwarM0XkZCjTc0Vc1h4oL4fgbWqCV/I=
Date: Tue, 16 Jun 2026 15:52:15 +0530
From: Greg KH <gregkh@linuxfoundation.org>
To: lijun <lijun01@kylinos.cn>
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add error handling in
 virtual_device_parent()
Message-ID: <2026061631-unmoral-directly-cbe8@gregkh>
References: <20260616082528.1220652-1-lijun01@kylinos.cn>
 <2026061658-grandpa-repulsion-f752@gregkh>
 <125b0cba-e674-4bbf-9a97-faa7c5c08c60@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <125b0cba-e674-4bbf-9a97-faa7c5c08c60@kylinos.cn>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top
On Tue, Jun 16, 2026 at 05:55:46PM +0800, lijun wrote:
> When i read the code，i think this is not rigorous enough.

When I read the patch, I see it breaks the kernel :)

Please test your patch.

thanks,

greg k-h
