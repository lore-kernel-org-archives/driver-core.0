Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78AC330D25
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839855; cv=pass; b=oiji43b4ulH6UjpEeah7RVUng1QPGV6Ciccj/a5uqQqTcpiBoKQfUdXV4jLmnYCFS/YzDjgSQTYwvv6kz2b+7t05qLESw724o2xxop04J2R4e4XdFBwmFqcvK9LOKAK7rcomT9fEt8744OA//CcSZElkUMMPmLyfVaDDpLRfWhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839855; c=relaxed/simple;
	bh=vJNm31b5KNRXMSRY/n2jC9U2FK+Q5ufjW2UsUuMo5KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx9GRl3RRVhpxzZYdHmd3u14PianuEaNCNpFiLGsbQhTHJ61bu41KUZd6O74egMW7hda/VJKfvxYHpFJcQ8F4JsAheGMQUp5bPDj9x/oN9UIhno5CDmIBVdPxbOSMsAfTJipRCG5UnDD/MOp9kSRLO0xNEzCM7M1ButFhPVrg3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=pvomOjLb; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=u6e35uso; arc=pass smtp.client-ip=185.56.87.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="pvomOjLb";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="u6e35uso"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-1cds.prod.antispam.mailspamprotection.com; s=arckey; t=1782839853;
	 b=Vh7iOnSadKHxWtziXkGl7JbPVLxJf70ufNlfzE+dcM6tSk5s/YsIuLmUoXhifKqzOhPo2tL9Iw
	  rXBsf4Kpra/hxJ1RujiwcfreTTnUnsGL9YW+idAxmludte9dA147K3gE9Je3hAFzva5I3D1bNf
	  jWDfTwY0ajbJVttfTFDm8K2K7ooGagOaL8OF55Wuueik7UFxhM14xYLcFZFDgTvNcTObBCPeRa
	  6O8anM6oW37AFju5sllwgVTEy3zaG13nhEnTtGHKwdHxQl21VE1y3nIDYHafBabzi1ZxLsqOrN
	  60QA6QLTNL1bnFsop/5c/9nUICf7Et7E67Il5rbimeoHfQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-1cds.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-1cds.prod.antispam.mailspamprotection.com; s=arckey; t=1782839853;
	bh=vJNm31b5KNRXMSRY/n2jC9U2FK+Q5ufjW2UsUuMo5KU=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=JnIjHk9Yh3BCVH+JWTBktVvqiGlL4pEKuYgFbNUp2g+60IdMyrWptD0qQEcN5WE4rf2aNw7j3I
	  vjHlFO3Un028TCSIbMO/pjn+uBI33n7RmSfOUBzfliIKQgYOWjEvyIeEePRetm3PEMRnvNvwSX
	  fo4MOXq+lXIsi2b1YjXS1Su6yW3COpssNI/LcJCuLIZwdp4lIp/NKkrkbbIapwXbiKTSVMd/2t
	  nS9So5CcFamf6DPs8DaQgTIx28yGYfphZ85pO8LJ5IoLwKwkmqqX18LscYkocPB1fFY5fCK18t
	  S25FqbekkOGAI5Can+npy5ECRtWFewaesdBQW6jC6g8pzg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=JV4FQHEE4ZRaOa//ceOCiM1bm5WUF6oe4tAxHYSD104=; b=pvomOjLbI7Qc5LIPJgmzZMTmy6
	o5E95OMNnFHf2f3tEGLikAZ3UIoJutRg9sc6uqnKS7438qUcAhleavbl2UnN68t42TKD9ls/5NGU+
	LPOvbeUWqQtBMsYYwY9SJ+0I2vCeWm+GqsGFvctFdBF8eJFHE+mbcEEcMSk8RXr5jM5Y=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-1cds.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1weass-00000003NGs-2V7w
	for driver-core@lists.linux.dev;
	Tue, 30 Jun 2026 16:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=JV4FQHEE4ZRaOa//ceOCiM1bm5WUF6oe4tAxHYSD104=; b=u6e35uso3H2fJgHbjuWPiy/VnB
	WP2pqtaAbAhg0o3HdpIOmnVLDdgJq1G7wH/8sOn6CKfF0WFkDOdGhhk9UHGVI/SYqFq1zmTsACgnQ
	/xl/8gDEyK35bCGlEj7SAFoR9gjQVlS4DQL9fDmxsjy86GUcTC1rF8xDLJaQrvIaP+w4=;
Received: from [87.14.44.248] (port=63799 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1weask-00000000Kks-48Om;
	Tue, 30 Jun 2026 16:00:19 +0000
Date: Tue, 30 Jun 2026 18:00:17 +0200
From: Francesco Valla <francesco@valla.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tim Bird <tim.bird@sony.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
Subject: Re: [PATCH] driver core: add driver name to probe debug print
Message-ID: <akPnMERmg-QO6kjC@bywater>
References: <20260629-probe_driver-v1-1-fc58117581b5@valla.it>
 <2026063043-slouchy-outgoing-a958@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026063043-slouchy-outgoing-a958@gregkh>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: dfde660183965a6a7945d27334c5125e
X-AntiAbuse: ID - dfde660183965a6a7945d27334c5125e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1weass-00000003NGs-2V7w-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-1cds.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Greg,

thank you for the quick feedback.

On Tue, Jun 30, 2026 at 12:21:39PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 29, 2026 at 11:51:18PM +0200, Francesco Valla wrote:
> > The initcall_debug command line option is a useful tool while debugging
> > and optimizing the initialization of a new system, mainly because it
> > allows to see probe failures and deferrals without recompiling the
> > kernel (e.g., with CONFIG_DEBUG_DRIVER). However, matching a device
> > with the driver it is being probed with can become difficult, since
> > some devices use names that are not explicit, at least at a first sight
> > (e.g.: '1-0:1.0' or '1-0060').
> > 
> > Add an additional debug print to inform the user which driver is being
> > used for a device, allowing for a quick match. The print is inserted in
> > the same really_probe_debug() wrapper that is already used to report
> > the result of the probe, and is thus not affecting executions not using
> > the initcall_debug option.
> > 
> > Suggested-by: Tim Bird <tim.bird@sony.com>
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > Hello,
> > 
> > this very small patch comes from a discussion started at the end of
> > 2024 after a Boot Time SIG meeting [1]; I decided to reduce the patch
> > proposed there by Tim to the bare minimum, as this should already be
> > enough information for a developer to work with.
> > 
> > I was unsure on whether to add information to the existing print or
> > introduce a new one; while IMO technically worse, I opted for this
> > second solution, since the existing print *might* be viewed as
> > userspace-facing ABI. I'll be happy to do otherwise if there is
> > consensus.
> > 
> > Thank you!
> > 
> > Regards,
> > Francesco
> > 
> > [1] https://lore.kernel.org/linux-embedded/MW5PR13MB563277AF5972FD2B56026CF9FD3C2@MW5PR13MB5632.namprd13.prod.outlook.com/
> > ---
> >  drivers/base/dd.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 60c005223844..3c0930020050 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -782,6 +782,9 @@ static int really_probe_debug(struct device *dev, const struct device_driver *dr
> >  	ktime_t calltime, rettime;
> >  	int ret;
> >  
> > +	/* Don't change this to pr_debug() - see comment below. */
> > +	printk(KERN_DEBUG "probing %s with driver %s\n", dev_name(dev), drv->name);
> 
> So you now get 2 lines per driver probe attempt?
> 
> What exactly is this going to help out with?  You aleady get the probe
> result line, how is doing 2 going to change anything except explode your
> kernel log?  Why not just modify the one existing line instead?
> 

I was being overzealous with the "don't break the userspace ABI" rule
and included the existing print into this kind of ABI. Given your
response, though, this might not be the case. I'll wait a couple of days
to see if anyone has something to add and then send a V2 that adds the
driver name to the existent print (solution that I technically prefer).

> And the comment "see below" should mean that you move the comment up
> here so that it doesn't need to be repeated.
> 
> thanks,
> 
> greg k-h

Regards,
Francesco

