Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE203F1650;
	Wed, 22 Apr 2026 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886035; cv=none; b=DkFPUNSda5pW/2KqGrE0Wb0mY+P1xArcZIVjIF2cV4p9ipX4dHW0cEIeGYrMtCsaxTPsugintUlzKwzmZ7gMuMKXeeg6v+Qz4946f58uetcxTXavsxvPtzJnY3TQES9snUBzxQdqk27/4PQj20ToQRJHvZBxmwCdIXD27SQ68Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886035; c=relaxed/simple;
	bh=7zoZylwcEWMOqjuLY/70Dj7lzapBUSO1pXugxRyGOck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJXhBcdN0BEZ4MPBte974AGDkWKDMmD/KPhRLGlPvuAeKmGWwZLSPJ4H4u9UM+dqMXP6dnd1kKs0u7DjhGlNFfp6jDD5u+/AX9ySFbBBU8GRMV6OErQj6uMKpu0IPe8MF1FHmJg0QI4K8QJmAICKkOBS0GbX4bu3wr5/Z7uM72A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bf0sY5QC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf0sY5QC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776886031; x=1808422031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7zoZylwcEWMOqjuLY/70Dj7lzapBUSO1pXugxRyGOck=;
  b=bf0sY5QCYhOdI4UY6/ZnJUqtM18fhJGX58/7gnd2hx9o6cjMN2YLOw1g
   H9WmNhhdXQEqNmVmu7QYpbNIzvKly6pf8SJ5suyD1jiY/1zs5soIGhE9h
   FtTh1Z6aKZFAQBzPmRVXmBfpy8KAZi7nlkzOvHEKSTsVqb135HUMDbO40
   gjCidTXuvwFwzvvYxUkVRkSYNfXLZH0+8R8ZETQYX3HruIheOzPkE668E
   Xaj2BOAVqgWtW5lEAI2pvq1CGWtsbF+Z2bAcIkvLm56TO2WFfpSyJXQd2
   FdWtABoKJQ4Hf9nTsnVimoR+uRpRlUp0SGnGfF7MmR4WNodquFpEYsMHA
   A==;
X-CSE-ConnectionGUID: xfdQUgFRRQyeAvF8Ge2HjQ==
X-CSE-MsgGUID: JTp+HlYoQJKNKF4Xltvpww==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77552841"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="77552841"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 12:27:08 -0700
X-CSE-ConnectionGUID: LWMQUImBSCWyFacSt3JrOg==
X-CSE-MsgGUID: +r77+a0DSuqfO8QfU12sJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; 
   d="scan'208";a="231402882"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 12:26:55 -0700
Date: Wed, 22 Apr 2026 22:26:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <aekg_IELc65BFrWp@ashevche-desk.local>
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com>
 <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
 <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Apr 22, 2026 at 11:51:36AM -0700, Doug Anderson wrote:
> On Wed, Apr 22, 2026 at 10:44 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com> wrote:

...

> > > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> >
> > After commit f72e77c33e4b5657 ("device property: Make modifications
> > of fwnode "flags" thread safe"), this must be changed to:
> >
> >     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> >
> > With this change my DT overlays are working again.
> >
> > I guess keeping the FWNODE_FLAG_* names, but changing their values
> > from bit masks to bit numbers was probably not such a good idea,
> > as it fails to catch missing conversions...
> 
> Crud, I should have thought about that. :( Do you think it's worth it
> to do a rename at this point to catch future problems?

You can try locally with allyesconfig / allmodconfig and see the outcome.
If there are missed cases, and their amount reasonably low, I won't bother
in this case. But for the future it's kinda rule of thumb to rename when
semantics changed.

-- 
With Best Regards,
Andy Shevchenko


