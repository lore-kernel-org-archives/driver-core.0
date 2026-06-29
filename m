Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EF734FF40
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730284; cv=none; b=Zc3/1IzMSwir00zYp42VmJWt4NfJsZ68g+OHT+dxTy5OBHo51rsfvooN1E6UWuPkoSsO8ui0AEqf6jNiMt5BcYW1EHjXX+Ul5bIIk8FNCXtmVcLlSYVhTf16tZ2+sGJ50fydLNQwXLUzh9Zl1hlA8p/92PIFEgpH3yAVebraNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730284; c=relaxed/simple;
	bh=BcsGkNNY2Uu+xaRrzBlnpYhJJPydJAv/F0efOhwO0cg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YzGDPVkUnrAfYk7gMx/+VhDEcJwU/I33wzmTk/XEbx6pcuDhEXEILH60ujDLZQDJGEOQ0PowH38YfbCvssJpFaJVrdf8c1yF+Dj9XlSGE+pFZ9F6mIXXyuMWVwNTOg3FeRJ5FpCBTtODs+IFiTuR7qK7prZaLxT1LhT+860E+mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 1678C834609
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 12:51:12 +0200 (CEST)
Received: from OMT-CWNXR4TFW5-LHT (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 677CF780506;
	Mon, 29 Jun 2026 12:50:48 +0200 (CEST)
Date: Mon, 29 Jun 2026 12:50:43 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: driver-core@lists.linux.dev, devicetree@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org, Sashiko
 <sashiko-bot@kernel.org>, Alban Bedel <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
Message-ID: <20260629125043.3721e06a@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
	<20260618152035.1600436-2-alban.bedel@lht.dlh.de>
	<85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
Organization: Lufthansa Technik AG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-apple-darwin25.4.0)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 27 Jun 2026 07:50:12 +0800
Zijun Hu <zijun.hu@oss.qualcomm.com> wrote:

> On 6/18/2026 11:20 PM, Alban Bedel wrote:
> > The bounds check for the index passed to
> > software_node_get_reference_args() was failing when passed UINT_MAX,
> > this in turn would lead to an out of bound access in the property
> > array. Fix the bound check to also cover the UINT_MAX case.
> > 
> > Fixes: 31e4e12e0e960 ("software node: Correct a OOB check in software_node_get_reference_args()")  
> 
> i think the fix tag may not be right.
> for original express before the fix tag: if (index * sizeof(*ref) > prop->length)
> for UINT_MAX, multiplication overflow?

You are right both the orignal code and the version introduced in
31e4e12e0e960 are subject to multiplication overflow issues. I added the
fix tag because 31e4e12e0e960 claim to fix an issue but fall short. If
someone backport this commit it might be good if they can find that
it has an issue.

But if that's not an appropriate use of the fix tag I can remove it.

> > Reported-by: Sashiko <sashiko-bot@kernel.org>
> > Closes: https://lore.kernel.org/linux-devicetree/20260611103904.7CB131F00893@smtp.kernel.org/
> > Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> > --
> > v2: No changes. Only submit this patch along with the patch that
> >     triggered the Sashiko report, to hopefully avoid another useless
> >     report.
> > ---
> >  drivers/base/swnode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> > index 869228a65cb36..2bc76f01eb77d 100644
> > --- a/drivers/base/swnode.c
> > +++ b/drivers/base/swnode.c
> > @@ -537,7 +537,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
> >  	if (prop->is_inline)
> >  		return -EINVAL;
> >  
> > -	if ((index + 1) * sizeof(*ref) > prop->length)
> > +	if (index >= prop->length / sizeof(*ref))
> >  		return -ENOENT;
> >    
> 
> who will use UINT_MAX ?

A likely scenario is if a caller pass a negative errno, for example the
return value of fwnode_property_match_string(). But as you pointed out
there is also the matter of the multiplication overflow, so various
values smaller than UINT_MAX can also lead to a failure.

> This function is a interface function.  the best fix should check
> input parameter @index and return -EINVAL if it is not expected?

The index is unsigned, so there is no invalid values, just out of
bounds. The documentation of fwnode_property_get_reference_args() says:

 * Return: %0 on success
 *	    %-ENOENT when the index is out of bounds, the index has an empty
 *		     reference or the property was not found
 *	    %-EINVAL on parse error
 *	    %-ENOTCONN when the remote firmware node exists but has not been
 *		       registered yet

So this should return -ENOENT.

Alban
