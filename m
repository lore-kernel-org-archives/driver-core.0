Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188740B6EE;
	Tue, 30 Jun 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817035; cv=none; b=DXDaDIKRDUzwNx9wnx18pnAs6owE8u33GQVIg0sHtmEEy0DuN0On13sNfi87Y/ubJoL2mzH8lpxnBRPJWKHAbqi7dwpw5wXJIKIB16pjCWtwNQvyfkevE3ETkB/uHE1aSgKkfcZglu0mcEPzqkK0aj5jAX8ByN+g2QaWw4uS1ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817035; c=relaxed/simple;
	bh=Mk7cmaCuKjTXSYx5cjGd7SS2lcqLvl0RO42fZJne3Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvh0SOJMAhlNECKQHp9bEQvFtANUwkBJaHrgZgoeOEybaoSdvtIoAPtOcTARgHV6ueZfx/CVF5WkwBwL5Uk90f88CJnDlE3e5CaVLF05pSMNnamtnsrlluObY2t2T3+zp9zv3kwWdTadwCvcKIkz7fKCQZNZWsWe4kuY6R36niY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wc0vz2aI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wc0vz2aI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FD21F00A3A;
	Tue, 30 Jun 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782817034;
	bh=RmQIAmajKm4ep4KgfJpTO0+qVN95gq9bESwuUI9LIo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wc0vz2aIWjzyHKAZNmC1uXg4Qlx5hb5p/PLsgsar9qxwnDPACskJroOmxCsKwDyfB
	 X5r80yAzMGAK7/jb68n7I8KlnldCXCKXB5p0TeyFDgA3twTmiUyjCPmlY2WqkTD1NQ
	 UAeSO4/m3+ciw4DGj/JEtAAAzvco6Kg+KtIEpyjw=
Date: Tue, 30 Jun 2026 12:57:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-uevent: add missing bracket
Message-ID: <2026063017-refold-entering-a5e5@gregkh>
References: <20260612145331.189632-2-manuelebner@mailbox.org>
 <b791c2ae4a541f3794dc8c4a170db0082f513ab7.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b791c2ae4a541f3794dc8c4a170db0082f513ab7.camel@mailbox.org>

On Tue, Jun 30, 2026 at 12:48:01PM +0200, Manuel Ebner wrote:
> Hello, 
> is this patch still on it's way?
> Resent for context.

Please do not top-post.

This was sent during the merge window, please give us a chance to dig
out from the hundreds/thousands of patches sent during it to get to
stuff like documentation updates.  It will be a few weeks.

in the meantime, please help review other patches on the lists to help
reduce our load.

thanks,

greg k-h
