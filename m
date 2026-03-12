Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8703D35AC25;
	Thu, 12 Mar 2026 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329120; cv=none; b=Uz80KAhk4qJCrgKRBaZ61424kE3kq1bInTc2TvBFbhsTvFTCzQ05MS18NxO3RHgL4++d9Fo4UCoA0NSk1qLHQjp27h8tRgZudEKoRHZmy+wScLWJAM4eFaRyUjGqoyfLKTYKziK/JRLTSECi28C+wE+3bffmZg0DoB8I5XVSu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329120; c=relaxed/simple;
	bh=PRo1H3AkrAn5CN91lSlcAttTHvGYCwJejSgeqavNRoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9F7oqxrKFb4NIh91HjddwLNlYQe/zzgGZu0Sb/gwiYcX6nqPdijMu2x1hvq5eh0SDQ7JfJF6vDAxkaGtdG69clMv3NAlleHRUlIep8TPUAJqrKTTt+SzoxzTj4mm6c76UzWkJTmPAhUGro1BTT5R5Vo2gAePv2b5if2ylNWYNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lql86yy2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lql86yy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDDBC19424;
	Thu, 12 Mar 2026 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773329120;
	bh=PRo1H3AkrAn5CN91lSlcAttTHvGYCwJejSgeqavNRoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lql86yy2FN8tLqLicquRdgpjggL2vrKdD60VbViutWeYzWjb3pVajNhWIpEalgkZa
	 SfTBrlGWdJRdzpBoRbIIWAUMAE9nFttpvTYi1cmhoJ6oqku+dxeFZGeSFewu+KfU9E
	 RcqAoTiwPARxL4OF64EzwIvZnVpcGX4XJfxD6tQE=
Date: Thu, 12 Mar 2026 16:25:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node
 for a faux device
Message-ID: <2026031209-detoxify-rubbing-1e6b@gregkh>
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
 <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
 <2026031034-blazer-equal-871e@gregkh>
 <CAMRc=McwBYFrsxYYYjZG=0bnkaC2R4cYkKmusQBJ1H_dfcCH2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McwBYFrsxYYYjZG=0bnkaC2R4cYkKmusQBJ1H_dfcCH2w@mail.gmail.com>

On Tue, Mar 10, 2026 at 02:18:36PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 10, 2026 at 1:43 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Mar 10, 2026 at 01:29:53PM +0100, Bartosz Golaszewski wrote:
> > > On a completely unrelated note though - Greg: I think this patch could
> > > still be considered because we now have quite a lot of functionality
> > > put into software nodes and already have some auxiliary devices that
> > > use software nodes as a source of device properties/config using the
> > > same API as platform devices (fwnode). I think faux devices could also
> > > profit from it and not necessairly use custom struct. If that sounds
> > > good to you, I may convert one or two faux devices and send a series
> > > with actual users of this.
> >
> > I don't understand why a device that has a fwnode would ever be a "faux"
> > device?  Why wouldn't that just be a normal platform device?
> >
> > faux devices were created to be not platform devices, to take away the
> > abuse where platform devices were being used because the api was simple
> > and people wanted a device in the tree somewhere, but there was not
> > actually any backing platform device present.
> >
> > So the use of a fwnode here feels very odd to me, what am I missing?
> >
> 
> A firmware node can be a dynamic software node created just for that
> faux device to pass to it its configuration instead of using a custom
> platform data structure.

Ah, ok, that makes a bit more sense, but faux devices should not need
any "configuration" passed to it that I can see, as that would imply
some sort of "resource" that it needs, which implies it has some backing
hardware (i.e. a platform device) :)

Maybe I'm just missing something here, have a real example (other than
this one, which everyone seems confused about) that would need this?

thanks,

greg k-h
