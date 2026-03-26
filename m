Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C744391839
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513624; cv=none; b=pcV0fgGrue5kAaKZhdqlQYJztzO511Td7J1Wbc//5MV1Eob6YkoD8TNA4j7ugGqwuznlC7cko3IS5G2K1CWEcIN7h00hPYnHOwxsvnWTDbs3sz0h8llMh7xRFW/AN8M/42vPt35anmXD05o1Mti7bBDDrCsa7N0jRMYYWyT6ZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513624; c=relaxed/simple;
	bh=HBp2j9Q1ov2fd84WBShvOFKTPqzCl9iEnpII3YzOTMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZV62qCirRJmfYu3cyaPvsmPxTaBf0qRx5DM9WHDx7tmpjnU++96BlYUSnum3bBqB+F78BCiSvZNbo2E7icTHxoXvjWZf3PMWwk5cbJ8tZNlXSTsJ8Q46mmDdQGPF18TfTAj2Vu7jygGILRWAN0dgqXu+on/fVLoYyFoTd3MzVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idxtASck; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idxtASck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774513621; x=1806049621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HBp2j9Q1ov2fd84WBShvOFKTPqzCl9iEnpII3YzOTMs=;
  b=idxtASckIBgdMFPMhqS33m8CuYdJLQDuJSlQCFYOn+rmiL5XpaU/B62x
   9KgjMaQ0qpNs/q2Jjz2G9IfRwfk62IVRCeU1wlMCMydBX8/fZI062VeMP
   vRpyY4naTZ6zZcKnwEHgiS7xbKjUqupXPYyj2K8XMcjmScEk8q+ZAnj4Z
   Ha++Fl02+zQ5T8WeGO6g+nbi55N69QeX5anKBOEveYbwUj1v+wK7t0JWI
   8ZF8hlbFs8o0AefNy6UxtKZoC3rx2SPq0k9hkuvxuGKdxkn5i/oVe9vhk
   5f9lem2SfqOMx2jYcJUAStDNUG/Yc0+47EPpcOsfiF6Oht8QqwfUXQPrV
   g==;
X-CSE-ConnectionGUID: ccHTT+ooRk+a/zh895ocwQ==
X-CSE-MsgGUID: gwnPyDbeRdSQy4SNq4gB2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78160843"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="78160843"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:27:00 -0700
X-CSE-ConnectionGUID: nV+LKWJnTvOOO2bi+MYKbg==
X-CSE-MsgGUID: +7FZ2b1vR0CrZIxCAdly/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="225196255"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 01:26:57 -0700
Date: Thu, 26 Mar 2026 10:26:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] software node: allow referencing software nodes by name
Message-ID: <acTtzuGD-K5XvVir@ashevche-desk.local>
References: <acIV6xF8mY-8wd5e@google.com>
 <CAMRc=MdJ0U2_ZQ5rP0Vmbv7+-xurf9F+WOwD3LwV=n5Fx33U=Q@mail.gmail.com>
 <acK69OColNT7ViLf@google.com>
 <CAMRc=Mcw66QpjQt4+_JdMq9JiAY28hjzNHa24gfOCCXyie-uRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcw66QpjQt4+_JdMq9JiAY28hjzNHa24gfOCCXyie-uRQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 05:32:06PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 24, 2026 at 8:30 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Please post the reworked version so we can review all the details. My
> > concern was that it relies on notifier chains to notify when devices
> > get registered and unregistered, and instead of matching node names you
> > now need to somehow match device instances and software node instances,
> > which again likely is done based on some name. This just piles on
> > complexity where a simpler solution would be sufficient.
> 
> I will post it. Hopefully before the end of the week. I want to cover
> both OF nodes with paz00 as well as ACPI with android tablets. The
> latter case will have to wait for devices because there's no way to
> look up an ACPI node by name that I could idenfity (correct me if I'm
> wrong).

What do you need from ACPI exactly? The ACPI namespace in the OS is represented
by set of ACPI handles, each of which is the object pointing out to some object
in it. Any object in ACPI has a unique path. At any time, after parsing the
ACPI table(s) into ACPI namespace we may get a handle based on the path.

-- 
With Best Regards,
Andy Shevchenko


