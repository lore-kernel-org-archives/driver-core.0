Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F71220F3E
	for <driver-core@lists.linux.dev>; Sun,  5 Apr 2026 03:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775359684; cv=none; b=bt+E5UASa8WInlH2E+Pfyrv6aJBT0H6NlmfpHdsB4ScXf7piqiFoBeEC1jEhmi+Y3IlRcBLTCNPJem9Skq7256NCecgVjznHbJ84KN5qVsW++2zw+D2tzixO5p0GjcuQSWkVQuMorJ4MmbSftHi4ArGqcdgQCUbG8tk/y3I6ic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775359684; c=relaxed/simple;
	bh=RHuAfpAtDI8q2ZAJvwlfLapMc7KWUO9JrIAFMlF/IOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxSTNd1Z96AIhpJ4757c2oSMSjLTpX4pdfZdayW9xoohtuQ8ihTHJ0yuB7BT8NFVCEw2WYTkzQCfmVWGhS1NJL914RrSggbjH7wA0NmCRNcz0uStwZP/W9Fbq+bsddVXfOmssSbrL91+IvuNTEmPKY1d9ZleiXU2sGM3y3QazJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BI/RsnQg; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BI/RsnQg"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c1632faeb9so5900570eec.0
        for <driver-core@lists.linux.dev>; Sat, 04 Apr 2026 20:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775359683; x=1775964483; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqQ0dY5T6aoukbdxTtADqJiwNgfD3DdHEcXDDm50GnE=;
        b=BI/RsnQgXD0lTCVuE4hYK/naPtASHAm6J2N4s2f741UBWxU7f05Aff4mJUng9h/K6n
         My6/Rt7rWpVi+LqaOxuuxRdYPzFsZZLd1n9gExHylhlXZt0bnHC3nJhDo2XR6ja8/SXJ
         mkLOocGi1X9ZhePQfk+FGYtYVck/rK0nsFdZ9DNALCmxAoRwLyQUG3f9V5e1iVOR75e3
         bcI1IDOjuxOtU9CJGZv6yaQwj6h8lCYcCF0rlrx0zyvTTf6zDflrWLOaVced8o3I3EIb
         vQ01IkslWXkp+SRmMofN4qbjfjCbA4syoNYsBTGwgDkhflv6ei8/MGAPnJ+ixEwNtiV0
         tvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775359683; x=1775964483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqQ0dY5T6aoukbdxTtADqJiwNgfD3DdHEcXDDm50GnE=;
        b=h1GmXifaUJ9PcPt3EZye/Im9Xtmgg5aUNF8GajW2Gy2Li0CwI93Z4Qfqy8EMj5PTqh
         5r4qJ8ppsF8H/TrL9dkCGFcEB6h1BdpgTCSyBDnJ6Go+dtneNcSrLnjz0WAd4BEO6KOj
         Mg59oniycoWsxQvnn+FVouKD54iGK+cV+84cxE29HkEM6iXurunw8KiLnv2pTA8CiOl6
         HZ0R13P15UO/ZLDMigkKSfAadARD+7AlN+TyLOrQRI8Sh7aUkc78pET64SADwkcuCyDV
         8dYQp3XUiDZI0ooAOl3r+Z7a24xv1T6q7JJ/EqkPCEhLR44C7G+8B/FaFhxP3OWWVs0Y
         92iA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfCpeAJTI8d+haL9WL682aKTidiC/bn9XU/VIfuQheRpoq7ZvYWn0r/qwldHmAEKhOSv+6CicSSp52A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUgUU9i4/sJzjspaD991RnxWitl8QWadr0R2vj0AI9U7w2AUNK
	ruHB6ntsIISAiG6vzT4lhPjUj4TP0KWFWzULnKlVKdEh+hWzIg1tIr6c
X-Gm-Gg: AeBDietzjPvW92oM9Cb4PIMwzB2Dk8YfnvZ58h87Thz/hf3ZO8o4z2Vqs6TosnNFhKO
	QT988//9BgzL1Olwbb9tiBLh6E6DPp02zvw45ih/P+DPainh76/zMhg17xP2XwRu6WHfTHXvZT9
	gZijbDGAhGukDlBwCPzdSQNs0LLlsp8Izk+OswXrssYAaird4HcrEJpdkt5ev9m4HD7Ils0L6hu
	2FnLrYFKEUBLwUfhYJBCP24Efzp5YMzdxABpTBn7/CZiU/CkQt52DQA9tSKvLe9HeND7TaTFEbe
	kP/61BNwVQ5OV28s2ymPXLzDlThdhGnIGHdqHfCm4E8bJJZ7Zh89fl1fgDPksdqMTBEYIPSZ2Dp
	rTlcOr4kty18dB6AwK5TmgQbOqyBStx69VsEeSG5YnZgwkKbcNC0Ev+YR99dv14C0uWxsEIfN5P
	1WvE/rPAI/yMMGFGWWIoRAKChY5WRKuG7vkMbmCuov49gKJGVwei7ZZ144xj8NB89w
X-Received: by 2002:a05:7301:1688:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2cbfc365473mr4057705eec.28.1775359682847;
        Sat, 04 Apr 2026 20:28:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:d488:726d:822f:a13a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c151sm10108101eec.19.2026.04.04.20.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 20:28:01 -0700 (PDT)
Date: Sat, 4 Apr 2026 20:27:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2 3/4] software node: verify that property data is not
 on stack
Message-ID: <adHHVPN1O632XFf3@google.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
 <20260329-property-gpio-fix-v2-3-3cca5ba136d8@gmail.com>
 <acpRi0BOgT73pqpE@ashevche-desk.local>
 <acrvakIBxO76OAlU@google.com>
 <act_f13eyaBPrJ-w@ashevche-desk.local>
 <acuGxssSLHIYfUUw@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acuGxssSLHIYfUUw@ashevche-desk.local>

On Tue, Mar 31, 2026 at 11:33:10AM +0300, Andy Shevchenko wrote:
> On Tue, Mar 31, 2026 at 11:02:13AM +0300, Andy Shevchenko wrote:
> > On Mon, Mar 30, 2026 at 02:49:52PM -0700, Dmitry Torokhov wrote:
> > > On Mon, Mar 30, 2026 at 01:33:47PM +0300, Andy Shevchenko wrote:
> > > > On Sun, Mar 29, 2026 at 07:27:50PM -0700, Dmitry Torokhov wrote:
> 
> ...
> 
> > > > > +	for (prop = node->properties; prop && prop->name; prop++) {
> > > > > +		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
> > > > 
> > > > I read more about this... Any code that uses vmalloc() (or potentially may
> > > > switch to it from regular allocator with help of kvalloc() and similar) will
> > > > fail now. While it might be no issue right now, this may become a such. So
> > > > with this check in place you put a requirement that properties can only be
> > > > allocated from a kernel low memory heap and not vm.
> > > 
> > > Can you tell me more about this? As far as I can see it will actually
> > > have false negatives with CONFIG_VMAP_STACK, but should be OK not
> > > trigger with vmalloced memory... But I am genuinely interested to know
> > > more.
> > 
> > I dug into the history of this macro. It was added for the block and ide
> > subsystems to make sure that there is no buffer supplied that may not be DMAed.
> > As we know vmalloc():ed buffers may not be DMAed. In some commit messages
> > it was explicitly mentioned that this macro fails on vmalloc():ed memory.
> > 
> > Note, I haven't checked the actual behaviour by trying that on the HW.
> 
> OTOH, the check itself covers only 16kB of memory range. I don't understand
> how it can give true for anything outside that area...
> 

You probably mean b4a0f533e597 ("dma-api: Teach the "DMA-from-stack"
check about vmapped stacks") but it says that for vmapped stacks
object_is_on_stack() will produce false negative (which is tolerable
here).

I am not sure why object_is_on_stack() was not extended to also handle
this. From the cursory glance it looks like a lot of callsites do not
detect vmapped stacks... Let's add Andy Lutomirski...

Thanks.


-- 
Dmitry
