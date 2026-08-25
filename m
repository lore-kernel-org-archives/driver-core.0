Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8AE355F49
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 05:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787636133; cv=none; b=LaCH1E2Y7GoCH0Sa1FNpAquRZI28kj8cpdTJJLl/oQ53cBmucW8e0uKJdDnMSwdKWlxu+v8yOXbf/+nPBNNCWXgQ05FyCZ70Fwevo7gwdNC5gVS/F8s27+awKJtpfozRnb1LuCQCDYHLZuw2jmKHsfYdmiGaoaQ9DDEIghw32Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787636133; c=relaxed/simple;
	bh=NFb+bMVNsCinOn8xrKYyQEdfCUi+hPTRbkJAvwtsIXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBF2vXHXjItT+kxOugdy8F3hOUlf2HT2gqyVqojWh9TLGEIzMOM4ldesS9dVwv9J4XwMVlQzQaG1bd1vlMbgoDSTWeXVv+vIglcwvKV9WRoJORpIUItp2CiKSUfye/aelHGT64u5d8TmAEjXrcjMQr3xMVDbSYOBmX1J1BXckjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SSB3d4g4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SSB3d4g4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AD61F000E9;
	Tue, 25 Aug 2026 05:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787636132;
	bh=NFb+bMVNsCinOn8xrKYyQEdfCUi+hPTRbkJAvwtsIXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SSB3d4g4stbgTM2PThOuzHniOgAKI3R3I5XDyRdhQJpFrmVyk2MB2/jj04Q4slbJn
	 TNfRumzhZJTLZp3qG/buTYZwKXALBi5qsNpZ01buIIsOK+3DYfwOhDs07CqekWJ7lL
	 ufGsFJTKxLSJodIkiX32hVOgAsu/ZJxrj3xzroh8=
Date: Tue, 25 Aug 2026 07:33:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiacheng Xu <stitch@zju.edu.cn>
Cc: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>, rafael@kernel.org,
	dakr@kernel.org, akpm@linux-foundation.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2] kobject: fix out-of-bounds read in action parser
Message-ID: <2026082518-swinging-wildfowl-9c19@gregkh>
References: <200d27f7.1471a.1a0138c92da.Coremail.stitch@zju.edu.cn>
 <aoyARlxyR9c71H8Z@fedora>
 <16559d89.19644.1a037110cc7.Coremail.stitch@zju.edu.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16559d89.19644.1a037110cc7.Coremail.stitch@zju.edu.cn>

On Tue, Aug 25, 2026 at 11:57:39AM +0800, Jiacheng Xu wrote:
> kobject_action_type() uses the position of the first space in the input
> as the length of the uevent action. It then checks the byte at that
> position in the corresponding action string.

<snip>

This is being sent in base64, and the tools can not apply it :(

Please fix your email client to not compress/encode the message.

thanks,

greg k-h
