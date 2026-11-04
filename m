Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827284;
	b=JoNXHOqZ1EJDbcbnwVVhV9Iu/NG/iiM0q6UuvcYOJFikw0yOMMyAg6+c5mxzAkAur2C7
	 qhgWnTaYzIFMxJsb5iYpGZKi4H4TcSg3yDIsLKEhe6sDPhRVYl7gBG3minfVmwRl/YGe5
	 t/gXOMaGxnCzbZbZMaEj1fZvLK1Z2J92/JatFbq5NxcD4C9TDUZVECbbcC3sd32cQBUsw
	 SA2CkkKUXyN33gIA6dtRyLviL4nyZy/UsbEwv1t+ArN4CArfh2UjJZ0l4BEkI+xo9e4CE
	 8JsXTiQwHeVt/+fq4wXJ6P7CpCfr4xWNLvB0PaXTv9jBKVrj+i56U0W4Jbq53kIrKBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827284;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=IcksJualoxCD+RbsRNqMUhCl1MksyKQfsnT7rrH9XWg=;
	b=b7YJnXdTnMOPLjgOsuALYdfBmM/tKzKmkEsVZ32dBsg4XfGXEoW9W7gaW2QW6t95Oho7
	 aVTiLKUOR0+BhbZR5N9/dHnow1acXBdaQWPwMYOMEx37JfFDp91/AA3nPJdqVC4puPeqK
	 ycq6kbGqTFIRyQIUz6kq9RmUlj6b+TJkd/ZB/qkjEmRGmcMyS/pXXNr12JWU2Hd2yPdCf
	 +kQTkjyIRBouIZY4hjquqoPGw0Ly4utlfkNzXpSESGjH6/BLC4PRCSbFIs6v21WNdbtDi
	 KjS4PygIjRnyMHKvv6KDUQ2SW+vNNJ850SRuKTYJxVIzTst+ZEl/9afKPL82fg+vEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=evX96KzC;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5F3606A855
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 21:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF5F3606A855
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=evX96KzC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793827284; x=1825363284;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0pDrHm/5JF1z7CNDN38W+riXTwGcVCO/zqTm7h3PdM=;
  b=evX96KzCJB2gEAtv2WZ+YpAX+YcvvjQw1ERqzl/cASCdtLDzfX5zhzoe
   7KF1QVd/gehr7Xx3mBV5ceX0do1kDpEUK6SDXrfZm/E6ygbOo5Eo8kxmk
   AD8K4WaSmAKNieWGBQDUbOasDPIMV9xK4uKRR5FhW3q/uu37kVjuWs9pi
   7CCN/tQ2fhzBiesTVyxG6N0m4Pn9I3z/c9MayX/KJkmZJKsqCbRrd01Qx
   cAYhLo0KBVFqT4TO8EShE8Ycq8KA0dkuDzW909mRhV2hjWnDX29a5D6V0
   u8uvP5u1TZZuzQXl9/WHDY4uaqhStzLofg9iWAAr67lIqhMfXkq4ZRA57
   A==;
X-CSE-ConnectionGUID: rm7r8AfTQiGnhSmo3Xcddg==
X-CSE-MsgGUID: OHQLaToJQQurJ/HF/YcIWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2483721"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2483721"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:21:23 -0800
X-CSE-ConnectionGUID: Sb6uK8xjTTyP2o/Kx9Qy3A==
X-CSE-MsgGUID: DA9Y5zsOTMiL5sB/0kTVaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8603557"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 13:21:18 -0800
Date: Wed, 4 Nov 2026 23:21:15 +0200
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
	Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
Message-ID: <auuhy40x1BMoW96-@ashevche-desk.local>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
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
In-Reply-To: <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski wrote:
> Implement the property_get_names() callback from the fwnode interface
> for OF nodes.

...

>  #include <linux/string.h>
> +#include <linux/string_helpers.h>

Same comment as per fwnode patch.

...

> +static int of_fwnode_property_get_names(const struct fwnode_handle *fwnode,
> +					char ***props)
> +{
> +	const struct device_node *node = to_of_node(fwnode);
> +	struct property *prop;
> +	int count = 0, i = 0;
> +	char **names;

> +	for_each_property_of_node(node, prop)
> +		count++;

Hmm... Don't we have a helper for that already?

> +	names = kcalloc(count, sizeof(*names), GFP_KERNEL);
> +	if (!names)
> +		return -ENOMEM;
> +
> +	for_each_property_of_node(node, prop) {
> +		names[i] = kstrdup(prop->name, GFP_KERNEL);

Can property be statically defined somewhere? We might want to also optimize
these duplications with const variant (here or elsewhere, for fwnode generic
path, I believe).

> +		if (!names[i]) {
> +			kfree_strarray(names, i);
> +			return -ENOMEM;
> +		}
> +		i++;
> +	}
> +
> +	*props = names;
> +	return count;
> +}

-- 
With Best Regards,
Andy Shevchenko


