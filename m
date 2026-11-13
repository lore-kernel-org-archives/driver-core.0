Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586437;
	b=chehyD4Fihie0X69p+kQ9KTyHof18QWPlVoXSN9s6VsDSSVMA6kDWxQV5D670O9v6Cf4
	 0vK11HlIsKHP3M7YwgQlui5dhU2MnbOo+HUAo+TE9KoxNO8Sn5b4vMEHkiSKPam3vfknL
	 JuEgFDOxpJD59rPqiHPjS5Hmrl5wVburkycgpabC5Z/ms+R45/UjKZ8KcqcK/Hq0wvEWT
	 LpE+Flyaprgac3eIxlH3e6Rz/lchk4wDS9dzyl/8ENVAdvk6SXMWQAYzJP+dufUzmrO52
	 f0oU67lxjsDwkdpZWHJHT+yk7iu/H/T+TMxaUaiXez8cIPDYaKjC9d6JERMFdEFEDmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586437;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=eqqPvAVweSDQC4nfMMrwbJ/e+VHUHrm3P0JfUhplYAg=;
	b=FAKxyk2QmTTlWIypxQmuHEFotIzf1bNou4G7l/2IyD1BwXYI7ANz5UT/+yUyQY+BZtkG
	 xIikmNZGXDnYo3Mxf9nVoX+MYPOvvq7IE62YjDFIINELatSGy/eg4ZH0NXKcmykD0q5Ac
	 ZIxpLaHR1+vp+jlvd2mmUOLySLN8JmgDKIFyKQAQpWN4mHY2Z7zUPdF+2xFJhpkv44NPm
	 vkztMEcqFCZY+1TjAnvOK/5tqSFqspAV0to6worgijxWOYP+eJLELoyzFffaEwMtZS3FV
	 OVZqh3UJBOLFcGO31AyeI6QAXwKJ4g38dI6rZ7ky4dfBj41jreYsxMzhCcy9vSM9ibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oImutv8E;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE31606A33B
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 16:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE31606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oImutv8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794586438; x=1826122438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZxpIe9p+77IfV97JqhNEZFr24LjF0d/rGyco+9n85Hk=;
  b=oImutv8ER3M7mK6xFacKWn2hja9yot24vxQvEvIjY0z0LrFav2VBiH1/
   haLZXkRnQmg7KDyjvkoxOXagswsz4Vl3xedrIvSgwN2vmEgTNcb1FS4Js
   D2SRGjrJFRb7HvQ9qRh7ThnAeNAfPNFEGETGnIk3j8YT+4I5gbSdP1olV
   NTJyX1etmdgxgh8vcID14rJi47emu84AP65p1SAw5m5/bPdCPDv3cnCzE
   75bIDGu/Djx/feVRzfzf656qykLsVJxQ+7FOWP2Za/JcOfgAhzXcxC/Fs
   STaUPa4WvUC2vJE/Qloy3Uc+fQo+rUZkXuIY2wZGG/e1G7iZwhO+hhBlm
   A==;
X-CSE-ConnectionGUID: bMBjT3VYTCOy2TB0fM52mg==
X-CSE-MsgGUID: gk0T4IPZQFSzFNph4kNDaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3405696"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3405696"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:13:57 -0800
X-CSE-ConnectionGUID: GqQHn3+RT72bJnuKPxw4+g==
X-CSE-MsgGUID: lakWYUizT3+tzJffm1SMKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="10859688"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.148])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:13:51 -0800
Date: Fri, 13 Nov 2026 18:13:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 04/10] device property: provide
 fwnode_property_get_names()
Message-ID: <avc3PNEMESd3ewBh@ashevche-desk.local>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
 <20261113-fwnode-for-each-prop-v2-4-4edc23d5cf50@oss.qualcomm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-fwnode-for-each-prop-v2-4-4edc23d5cf50@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 04:47:04PM +0100, Bartosz Golaszewski wrote:
> Provide fwnode_property_get_names() - a new fwnode function that allows
> callers to retrieve the list of all properties of given firmware node.

I don't understand why we have this patch separated from previous one?

-- 
With Best Regards,
Andy Shevchenko


