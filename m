Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B43EC2E1
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142667; cv=none; b=OwR4wJlMbMGokq54Qw7JKYIB2FTgEQm4IWxfpitN8PslTTqDCT9nJgWs6HGv4UAD+u07m6PwD2ywiAFNm2/WWAnIRLjS/n9Hnkgrb/P1voVWaMv8U3FZ+xKPpf1SIkc3hJZNIi2SMBzy89P5Lm+YtwpbQ+tp/TVFVKI+rhq3NII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142667; c=relaxed/simple;
	bh=x3+f9bgO8nywhdsYgg5vbZ4IKJPljB/7d4UV99RCEjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMKTh0urHcd3uxdv53yDESRjXQ3rgsi6BpGIWcWRcB3yMoxOpPYcX9S0MCFS4x/dRm+CV8fz+wzhxKgF5ApxaSroLYymCE2XS/1/MInIl1CV6xKKYUuwNAvsz/c35ygULPNQlxRrTLX+j1xp/BEWd+CCBtdDJEvh7iEpDyWCgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wRv8sV9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wRv8sV9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8197EC116C6;
	Thu,  2 Apr 2026 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775142666;
	bh=x3+f9bgO8nywhdsYgg5vbZ4IKJPljB/7d4UV99RCEjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wRv8sV9f4KDraceyCcdJje8nn5lvnZoqoO6FYXPhQD0C/J6mImtodcWlMrF7Po/vj
	 IKLP2xsu+xRxALXPjuH0iNxuFAmjaTOgVEcaEDeFrci22NO8sgkoM9KKeLA8T4+2Rw
	 3bbKhgYljHyLCG3YAKHBjIgKLUHfPRirS257dJdk=
Date: Thu, 2 Apr 2026 17:11:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH 1/3] driver core: constify group arrays arguments in
 driver_add_groups and driver_remove_groups
Message-ID: <2026040222-progress-thrive-220c@gregkh>
References: <fae35d74-f1b9-4785-8d7b-e553c22387ce@gmail.com>
 <21a1e5f1-c6a0-4f6f-aa86-1e6abd25f9c6@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21a1e5f1-c6a0-4f6f-aa86-1e6abd25f9c6@gmail.com>

On Mon, Mar 16, 2026 at 11:09:37PM +0100, Heiner Kallweit wrote:
> Constify the groups array argument in driver_add_groups and
> driver_remove_groups. This allows to pass constant arrays as
> arguments.

But do we?  How down the * const depth do we want to go?  :)

And does any of this series require any other fixups?  If not, does it
actually do anything?

thanks,

greg k-h
