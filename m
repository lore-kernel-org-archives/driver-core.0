Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548BA3EF644;
	Thu,  2 Apr 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142069; cv=none; b=rqEr3FEq7UyKdsrQRsKUpfRDDkMqIQZeqOMT9F+3muaMkAUka7D2cLU2sfsPItGKJhtT7q7+tnyCzYEtiM29AZqXjAcj793ilLwvCE6UzGWm7c3rkQOFG6mtPeLLkk3OWgIF8GeMKieklPU7lH5nXBYs+yueo+jjaMrVjBpa4sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142069; c=relaxed/simple;
	bh=toPnkFXi9Ikbvgnfx8487K1V5XpjxN3tnvJRnQ0GPZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdiOcCyimjcWh5OLeTh64knh2/JlWPVY1VwJpudnJ9kBz8v+mWHJvl7F7wFTSwVO4rpxx7icwEWAGyGykLe5yGjj5Duc7I7l+NbowFT7gzuHrAoBe1/GpnHyh7SpL004/1Gzwn6f6S7CNWQxGx4/fVTjxFfQV7P+5OW6/NnKJTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HmUPN/bB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HmUPN/bB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C786C116C6;
	Thu,  2 Apr 2026 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775142068;
	bh=toPnkFXi9Ikbvgnfx8487K1V5XpjxN3tnvJRnQ0GPZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmUPN/bBB9pXvDwUOeF3LyG7C28GKUXs+AYXZOUaEJc8D7GBT8dMzT9etgFIvM0Ly
	 lo4ICPVuXczycIaPx4Qep6Hg127+AlDYyO+2aYFV2SJKSnVCnbJv++0vZPy8VJDuJT
	 bC9L2+gRez8klii09049ZFushK6kEDXE3C3+oitY=
Date: Thu, 2 Apr 2026 17:01:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pranav Kharche <pranavkharche7@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: base: Fix typo 'interupt' -> 'interrupt' in
 platform_get_irq_affinity()
Message-ID: <2026040255-washstand-little-bd85@gregkh>
References: <20260321164435.60829-1-pranavkharche7@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321164435.60829-1-pranavkharche7@gmail.com>

On Sat, Mar 21, 2026 at 10:14:35PM +0530, Pranav Kharche wrote:
> Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
> ---
>  drivers/base/platform.c | 2 +-

I can't take patches without any changelog text, sorry :(
