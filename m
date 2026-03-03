Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A66364EA5;
	Tue,  3 Mar 2026 01:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772502574; cv=none; b=rHZdVIGbc+3tT1kS7v3vBFz0La7VelXCVX933eJi6hMsvyf0NSmyfWUYoyz8bKz9djLlU4/9hMz4Y1qSJE+aRyBsye8XJsyR30vsbJWP6U2laaNumSPR0L5Rn+if9rnYZ5FzzkTUbLRKMBJ6jlY78UjXLwJ0wR624/+W/GuA3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772502574; c=relaxed/simple;
	bh=Ww9GVsNKYrqVpQmsAtuHYERRrGX01gaWlgq77HrY/40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2ooaSAvQFO5xlzLRHjzpJe2eTZZoHxdeD++RSmWZUVcxWV8mVrbGr/58G8VFboWBiWcOk2w3QqQVhEwitABNiqR2XUUb92eBqAZm9LTaKmimMqlf5u69snDzal2XFJb/9kmmZNHkqTca2hIK+cWC36LkCy3c/x2m/p4bwhd8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hYQMWZnd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hYQMWZnd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07596C19423;
	Tue,  3 Mar 2026 01:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772502574;
	bh=Ww9GVsNKYrqVpQmsAtuHYERRrGX01gaWlgq77HrY/40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYQMWZndArrkLFcrG+lRfr/GA4QVKEKT82iGJ4OBTW6fj5fikbCgeqwVnw0sUfSil
	 kQLmkiAlcJ5XleyOIutW0uJ5+lj9sDoLfBRmA9WMwq2+/G7HXQVUQQ73GrnWL0M8O0
	 VqOz7O8NNrrL5e6EmXJiwewzSLuLme29bECRyNOk=
Date: Mon, 2 Mar 2026 20:49:22 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, hanguidong02@gmail.com, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Revert "driver core: enforce device_lock for
 driver_match_device()"
Message-ID: <2026030215-valid-ricotta-c54b@gregkh>
References: <20260302002545.19389-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302002545.19389-1-dakr@kernel.org>

On Mon, Mar 02, 2026 at 01:25:44AM +0100, Danilo Krummrich wrote:
> This reverts commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and commit 289b14592cef ("driver core: fix
> inverted "locked" suffix of driver_match_device()").
> 
> While technically correct, there is a major downside to this approach:
> 
> When a device is already present in the system and a driver is
> registered on the same bus, we iterate over all devices registered on
> this bus to see if one of them matches. If we come across an already
> bound one where the corresponding driver crashed while holding the
> device lock (e.g. in probe()) we can't make any progress anymore.
> 
> However, drivers are typically the least tested code in the kernel and
> hence it is a case that is likely to happen regularly. Besides hurting
> developer ergonomics, it potentially decreases chances of shutting
> things down cleanly and obtaining logs in production environments as
> well. [1]
> 
> This came up in the context of a firewire bug, which only in combination
> with the reverted commit, caused the machine to hang. [2]
> 
> Thus, revert commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and add a brief note clarifying that an
> implementer of struct bus_type must not expect match() to be called with
> the device lock held.
> 
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
> Link: https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net/ [2]
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/driver-core/CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/base.h        | 11 +----------
>  drivers/base/dd.c          |  2 +-
>  include/linux/device/bus.h |  2 ++
>  3 files changed, 4 insertions(+), 11 deletions(-)


Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
