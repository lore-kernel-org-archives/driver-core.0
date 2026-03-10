Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F3D3D810C;
	Tue, 10 Mar 2026 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146615; cv=none; b=qMXWyYAyDxRqoR8vjbRMBwNXZt3PG2avp5eCa6sj8c6ji0TRFdq+94VinkNQIn8FiKSjZUxR0VKw5cC/yIhaTvr4Q41Vh4e+A/rz3KUHXQisEefRG+KXXMbT1Aun3Kf3NtSTnkJgRSdyPYZYgpVbikTIu4MaBA6I5LBATnh99Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146615; c=relaxed/simple;
	bh=LVPNiYTqGtHPeL+FR4qA9NYw3ULapGvTze4WNtxtu64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdTimgD7BC8W6vDtIFFKZR3PswF2NY1hC3n5hxzdt2H0oXrnHGVUIqYtLeg26sQD1MkGQoRjkvBAUFhjZXU8los07V2iNahWlGmWuVW/6FDLSQtNml8AoZDhQo4MYA1kEUGHKsTnEyE3LFHM3WJSrhxgCbqfFKJvxDf8EBzGaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qqzhxbMw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qqzhxbMw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 929AFC19423;
	Tue, 10 Mar 2026 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773146615;
	bh=LVPNiYTqGtHPeL+FR4qA9NYw3ULapGvTze4WNtxtu64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqzhxbMwKN74gphIwNVxc4uFq3iclMN08wc6YRPjCwHSD9/TW3uDaOPEli993Jc0S
	 0XaymFQMQ8CDOuo30GkusxQ2X8bjZTd3gYYqQ1ef4ZrvFdEe94jwn/KcG4vuIKi4g9
	 y+kbmWD6JYym7d+RCmPu9oKxRxvbDp5hnTOUpyMI=
Date: Tue, 10 Mar 2026 13:43:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026031034-blazer-equal-871e@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
 <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>

On Tue, Mar 10, 2026 at 01:29:53PM +0100, Bartosz Golaszewski wrote:
> On a completely unrelated note though - Greg: I think this patch could
> still be considered because we now have quite a lot of functionality
> put into software nodes and already have some auxiliary devices that
> use software nodes as a source of device properties/config using the
> same API as platform devices (fwnode). I think faux devices could also
> profit from it and not necessairly use custom struct. If that sounds
> good to you, I may convert one or two faux devices and send a series
> with actual users of this.

I don't understand why a device that has a fwnode would ever be a "faux"
device?  Why wouldn't that just be a normal platform device?

faux devices were created to be not platform devices, to take away the
abuse where platform devices were being used because the api was simple
and people wanted a device in the tree somewhere, but there was not
actually any backing platform device present.

So the use of a fwnode here feels very odd to me, what am I missing?

thanks,

greg k-h
