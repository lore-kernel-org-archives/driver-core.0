Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954226980F;
	Mon,  4 May 2026 06:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877566; cv=none; b=m6yizla7qAKeLBmk8NMX12oeGdtvZWk6mbydvKKMHJMe1oPEd1G+Gcuy/kuovy0PiVW4RcZYZWs/KXQ5sGItpNUgBmO+OCvl1t6Mr3KJmAfvH2LFbrx3NaAG8aCYG+UehYANDJec2/z2fxwrd5b09vEluV4O9F0PN+IAq75R1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877566; c=relaxed/simple;
	bh=wxUB3FegJ0IUECt3tu3S34ouRzr+87KU8dRvjuGN/WE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cv3wXdct8sfaOuzJfWG/qSMJaZcDoNdrC1uYbCLqd7T2I1SdQXG93pKkpj0RGBU+eeXHVEFP0HDqPkYMC/iCy6IQfTfymxBx+d7R0OnUjqhX2aLuZET1h5zMIPjzEnBdHb9PiPpDhIWQ85MK+qS4LTshl5twTXFPDt92L65go1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LJ0b+0xj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LJ0b+0xj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26603C2BCC9;
	Mon,  4 May 2026 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777877566;
	bh=wxUB3FegJ0IUECt3tu3S34ouRzr+87KU8dRvjuGN/WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJ0b+0xjRp5jrZfPtnLnmv6KXLtwbhL5o8r72eRvXFiMBc3zXe1gN8sAiyLLogsTa
	 H/eNdeq/S2deWiIKDPX0WMnX22IREQp/zZeNDXSp3Cc3MbzD5VhnZjHADZzI5Cft7Q
	 oS6LzMpiUoDU2bLvA9kikrvcpjWN3YSd77ouOuXk=
Date: Mon, 4 May 2026 08:52:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] isa: switch to dynamic root device
Message-ID: <2026050442-pleat-implant-e08b@gregkh>
References: <DI95SZ1X7Q2U.DG2BN03FERO9@kernel.org>
 <20260504063518.515620-1-wbg@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504063518.515620-1-wbg@kernel.org>

On Mon, May 04, 2026 at 03:35:17PM +0900, William Breathitt Gray wrote:
> On Sun, May 03, 2026 at 05:50:17PM +0200, Danilo Krummrich wrote:
> > On Sun May 3, 2026 at 7:08 AM CEST, William Breathitt Gray wrote:
> > > Would you resend with a Fixes tag
> > 
> > Devices should generally be allocated dynamically for various reasons (e.g. I
> > recently had a case where adding a dynamic lock class key to struct device for
> > debugging purposes caused warnings for all the static devices).
> > 
> > While it clearly should be improved, I don't think this causes a bug in the ISA
> > code -- there is no "real" leak as the device is static anyway and there's no
> > spurious WARN() as release() is never hit, since ISA is always built-in.
> > 
> > I'd assume this is why Johan did not add it in the first place.
> > 
> > That said, if you mean to add a Fixes: tag anyway to indicate the technically
> > wrong usage pattern of struct device, that seems reasonable to me.
> 
> Okay that makes sense, this is improvement of the code rather than a
> true bug fix, so we don't need a Fixes tag.
> 
> Johan, I do have another request. Would you refactor the changes in
> isa_bus_init() to avoid the nested blocks? For example:
> 
> 	error = bus_register(&isa_bus_type);
> 	if (error)
> 		return error;
> 
> 	isa_bus = root_device_register("isa");
> 	if (IS_ERR(isa_bus)) {
> 		bus_unregister(&isa_bus_type);
> 		return PTR_ERR(isa_bus);
> 	}
> 
> 	return 0;
> 
> I believe that makes the logic easier to understand when reading the
> code here.

Nah, for now, it's fine, if you wish to touch this isa code in the
future to "clean it up", that's great, but it should be done in a
separate change.

thanks,

greg k-h
