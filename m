Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAA81EFFA1;
	Sun, 12 Jul 2026 16:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783874383; cv=none; b=J6aHfmbnSrm4X9gbyED7iyHuJtFgeeoj3LmsrAy1RdDl/nvSleeq/fM7NOKAmlG3dDfIoqzHLVNjUSeFF79bTHCYEEb5E8NArv+t/1NWmptGPEEmKFd+QMVlfPY11CIcA8elvgn7Hqjyxhg5q1mwYAMAKReGE3qpylUIrNbX6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783874383; c=relaxed/simple;
	bh=zisVfG7hZ5QuwCbcz2lWUJLEDFQLNLqOhxJpJpiU/zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOZtCWY6wlipIGNBGMNR7Ce660l+eWctqhZjcUFouMIj66PjHP0Hg5iD2ynY5lZGd33Fq1/4WUOO8XRRg8rQQ76wVdsE4VFuQmw6/giUAHJuLaxJTA2dd6xXq+5ZFpL29SabnM7RzM/CpaL2ZffmbotO5SCLluVI+nb3baJYBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MRBxmBkS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MRBxmBkS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DAD1F000E9;
	Sun, 12 Jul 2026 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783874381;
	bh=XOXZzl/wqtTl5yuHdsgMNm5ayfth+cAGAnEtTVdZC8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MRBxmBkSHjkrIg4DDCeUGic8ifdMojji3b+V2VmUcL8MnohW2ZHcQLCzFKgmoZKxI
	 1NNELIf+CpbA9mvhlToe6QDEQsyZrspT+oEVl28SRLQ8/EEg0zjtuqwYuqDquSYNFB
	 Mie397tNK/RLgIDOLUzF8vsmEKejmFtAKYf62nJc=
Date: Sun, 12 Jul 2026 18:39:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: driver-core@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] driver core: faux: Move a variable assignment behind a
 condition check in faux_device_destroy()
Message-ID: <2026071222-barracuda-applause-51e8@gregkh>
References: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>
 <2026071217-fruit-uphill-eb0d@gregkh>
 <d96e797a-2d06-42e0-a3de-972b4f71a5ef@web.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d96e797a-2d06-42e0-a3de-972b4f71a5ef@web.de>

On Sun, Jul 12, 2026 at 06:23:47PM +0200, Markus Elfring wrote:
> >> The address of a data structure member was determined before
> >> a corresponding null pointer check in the implementation of
> >> the function “faux_device_destroy”.
> >>
> >> Thus avoid the risk for undefined behaviour by moving the assignment
> >> for the variable “dev” behind a condition check.
> > 
> > There is no such "undefined behavior" here, sorry, please fix your tools.
> 
> Please take another look at related information sources.
> 
> EXP34-C: Do not dereference null pointers
> https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-standard/rules/expressions-exp/exp34-c/
> 
> 
> See also:
> https://lore.kernel.org/kernel-janitors/d7a8e34b-e490-47fc-b892-886e1c799c4f@web.de/
> https://lkml.org/lkml/2026/7/2/2241

Please see the places in the past where I have rejected this very patch.
Nothing has changed since then.

thanks,

greg k-h
