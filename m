Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794135955;
	b=1IKPt6QFp0+xqE0OwtLVcB/uMkxpylxGirtnM88AUR1sGLvlGjDv0zsXI6Q/hgtzQ0ka
	 sPvnup9Q6uUS3r/TyY/5RcfyuQ0/NtqSPQ0qDGpjm5S5Hg7xM59bSo2GG+igvNY6SrBrY
	 3TtSX8IP2GMGv3wuAMDk1cZ5jWH1vZe0xuO+Bqs6MPURup9sltOPEoCdE9eLe+QIvqILz
	 RwFHPisfpJpNPtfHNukbQozL+z8kBR0SvSjrqd3SBKU3kaT2inBbV3Mfn4ayljvbm1fGB
	 OAzl05grpqPNq50zkAVdKljrmhLevVqxVRI0Are1M6SFaZwQ7x5FDR072DwouKPDbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794135955;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=3DMCEU9uJLN9UYqXvXMsQsanZjfeIlMfMgFvG1PBcwc=;
	b=Hah8knxcg9v7ni5P6uYSFuYndAhkLlruUwkrWm0pX/QLOkXppMFvhxalqeuFJvGD7wM5
	 wWnJe3i8GtgwRNtcYRQnJmgtBlDLPTPZsz+14KjbsEjaSDUfZ2w+/5maatJS9uyP84hXR
	 OywVyzIaVTkOfdiaO1nFVbV8BAUQqonhuUJWzA04qYIe6wujSDa0AHiRk6wUdtNTn413m
	 XblAoWZ8Bqr4YkWMsBvG4KXbqemk5+tttIGXd4r7X+Vno6XIGHjuAqRA1HdsZa1sZ10V+
	 Hv3K7ITC5IDifX4MBacTF9BVL56q9ahLgPS+vsp9Co8CamLUqLoCnDg5NQ4KPzzg+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD0F606A321
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 11:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD0F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7A12C92009E; Sun,  8 Nov 2026 12:05:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 73FC692009C;
	Sun,  8 Nov 2026 11:05:51 +0000 (GMT)
Date: Sun, 8 Nov 2026 11:05:51 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Alejandro Colomar <alx@kernel.org>
cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, andy@kernel.org, 
    bartosz.golaszewski@oss.qualcomm.com, brgl@kernel.org, dakr@kernel.org, 
    devicetree@vger.kernel.org, djrscally@gmail.com, 
    driver-core@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    heikki.krogerus@linux.intel.com, hverkuil-cisco@xs4all.nl, joe@perches.com, 
    johan@kernel.org, kees@kernel.org, laurent.pinchart@ideasonboard.com, 
    lenb@kernel.org, linusw@kernel.org, linux-acpi@vger.kernel.org, 
    linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
    linux-kernel@vger.kernel.org, namhyung@kernel.org, rafael@kernel.org, 
    robh@kernel.org, rostedt@goodmis.org, sakari.ailus@linux.intel.com, 
    saravanak@kernel.org, schwab@linux-m68k.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, zanussi@kernel.org
Subject: Re: [PATCH v2 1/2] string: Add strprefix(), and deprecate
 str_has_prefix()
In-Reply-To: <au7TvMP0YhW2e_oM@debian>
Message-ID: <alpine.DEB.2.21.2611071115110.17804@angie.orcam.me.uk>
References: <d3b325ecefd1d991ca25a4de2a859353f3ad7cfb.1793882260.git.alx@kernel.org> <20261105125154.83478-1-geert@linux-m68k.org> <aux8LYQkGSNjCGHv@devuan> <alpine.DEB.2.21.2611070223510.17804@angie.orcam.me.uk> <au7TvMP0YhW2e_oM@debian>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 Nov 2026, Alejandro Colomar wrote:

> Hi Maciej,
> 
> > Date: 2026-11-07 02:44:23+0000
> > From: "Maciej W. Rozycki" <macro@orcam.me.uk>
> >
> > On Thu, 5 Nov 2026, Alejandro Colomar wrote:
> > 
> > > Do you think strafterprefix() would be better?  Do you have any other
> > > suggestions?
> > 
> >  FWIW strsuffix() seems an obvious choice to me.  After all what the API 
> > does is request the string's suffix beyond the specified leading part.
> 
> Actually, strsuffix() is something else:
> 
> 	char *
> 	strsuffix_(const char *str, const char *suffix)
> 	{
> 		ptrdiff_t  off;
> 
> 		off = strlen(str) - strlen(suffix);
> 		if (off < 0)
> 			return NULL;
> 
> 		if (!streq(str + off, suffix))
> 			return NULL;
> 
> 		return str + off;
> 	}
> 
> It finds the start of a suffix in a string.  That is:
> 
> 	strcmp(strsuffix("foobar", "bar"), "bar") == 0;

 Hmm, I'd have called that strskipto().  If that's not possible for some 
reason (I can't see it used in Linux), then strskip() or strskipover() 
could be used for this API.

 FWIW,

  Maciej
