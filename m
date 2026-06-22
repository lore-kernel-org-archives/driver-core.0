Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F1D2772D
	for <driver-core@lists.linux.dev>; Mon, 22 Jun 2026 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118168; cv=none; b=nW379bpmg/3D3z/inM+n6EvnQb+gQScNxE3SvE1qNH3yfF01lmVFcZmfZi03tWrvN9Ib6/MgMWZJuJKXkTmfWmDbLwUTJfzUIj5Q5KramaF5Qbx01/590sRnkzlDflI7IaMFmQz1e0XPbm7/uGMPah8CLGfWd4CHTyPA8Rhev78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118168; c=relaxed/simple;
	bh=KyxDJAoRFnaLQrYcq/HUf1sgrpDNp/VADW0wgtLXFo8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjeROmszhO56iwii0G69Xvl3SZaw8OZeYqN/ZrLwNoTvNJjL5LyjrJzAixmCbaP0vfZAriZy6Cyf/9vjIMfNObahGMAotJk55ZWES5YGs7XuibiLT0QgtzfPaG5L16uWHGkYZLL9djBwe9ep2XE0DNObU/g7z/aN9mzwNG/eSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 31B92428464
	for <driver-core@lists.linux.dev>; Mon, 22 Jun 2026 10:41:50 +0200 (CEST)
Received: from OMT-CWNXR4TFW5-LHT (unknown [IPv6:2001:9e8:633a:1900:359f:c35a:9518:62db])
	(Authenticated sender: albeu@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 76D9EB0059B;
	Mon, 22 Jun 2026 10:41:28 +0200 (CEST)
Date: Mon, 22 Jun 2026 10:41:08 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, devicetree@vger.kernel.org, Daniel Scally
 <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, Zijun Hu <zijun.hu@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org, Alban Bedel <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
Message-ID: <20260622104108.715d8295@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <ajQ6j5roSZ16Yb-M@black.igk.intel.com>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
	<20260618152035.1600436-2-alban.bedel@lht.dlh.de>
	<ajQ6j5roSZ16Yb-M@black.igk.intel.com>
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

On Thu, 18 Jun 2026 20:35:59 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Jun 18, 2026 at 05:20:35PM +0200, Alban Bedel wrote:
> > The bounds check for the index passed to
> > software_node_get_reference_args() was failing when passed UINT_MAX,
> > this in turn would lead to an out of bound access in the property
> > array. Fix the bound check to also cover the UINT_MAX case.  
> 
> ...
> 
> > -	if ((index + 1) * sizeof(*ref) > prop->length)
> > +	if (index >= prop->length / sizeof(*ref))  
> 
> It trades multiplication for division (which might be not always
> power-of-two).

This code is not really performance relevant and using a non trivial
expression lead to the currently buggy code. I find that easy to
understand and obviously correct code is better suited here.

What alternative would you suggest?

Alban
