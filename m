Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A13A6F19
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 21:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907398; cv=none; b=IgRz8axKHbfKUKWACzdoI+z0NLtDga4Bm2l5hsitsU7GuQoVi2DBsEBfqtFvzZuHzr7JgSnBDkGpRIjeT1t75YXD6rO9N8OIcnB6RC0J7XukweD2yv2uisSSrmz9JUT9nRf4YDjkczLFeq4nx9vXhNOgJBQxTqNcm4EnH7YvKzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907398; c=relaxed/simple;
	bh=l5INRuRaEyv3DR+fe9MbM7/2rrIKYN4BPu7Os7f6DQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gyl41iN+G/pbfFlaWaDCW0Ll8TvYlqeh0qVYyJB7kGfiUdT1uZ6bVeNMGyIv61lmZgLg/KMQK0UrEdZpPLS39Om8oWazbGvtFpPtgq3XepJtqEDOOW9SjU+xZN4mgRj2X++cP0xaVVQkfhbijVE+NxEv/gWA5BmeVMvBESsc7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTTgIWT; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTTgIWT"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c7e5f38b37so276052eec.0
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 14:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907396; x=1775512196; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ne+NreH4GL7rcymdn4Vd9RUHDjCDNb3QWyD6st1ksRA=;
        b=hFTTgIWTR/U5LjyL+Q3LfxNaZ9NKM/I0zI/j2B7MW2T1gxtEwGwH5jxqoiJkBEILrX
         5v99rmPPFFZGx/H8H33V9diqjNZqw1cXCNxPtV5mhls4oea6vmb9oiMrgxQUyXRG1SKX
         FertAKcks1gaTS5UIZV6bKADJIir58O0kbx6cFb2QjYhzqh9V/6F/Ti5HQJ19flCyJpm
         EgvgNo8gK9VkZdH81gBkuUYmIN0uFeFSMxkshR3NjhAKn2NCRvPJrvsUVyfyyRMUWUsC
         hEv+ZFW3qpg82/Lo3obiHuGnrkjvz+SAWjv0MwwU3zXH/58F8XRyDZyevAput/mDmCTV
         QCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907396; x=1775512196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ne+NreH4GL7rcymdn4Vd9RUHDjCDNb3QWyD6st1ksRA=;
        b=a89HsywddIEQBs97elptnKboat6Tkqg7+zOjngAu0T7Ymx/KkQyOFxadcRuTOHCHhF
         RBtzXUfye5bdY31Urn03d7Y34MumxNG0xtJvb6/uHMf1/BiUsMOEwJPCn267PYM8//0U
         ZQ1QVCGAz1KWlrpYplPHUK6ac+XqaQ0D+OBai04olRKhjuDAzCKU/vKKxBvwbHeZdUH6
         jdgKtSEC+AYQnrsRIWEbLYdg8hg+cGSUyaCLmf00ZV7Z2egKu43FxdWZadhDJ3WWLFfK
         jZ9L9rPObYBC+ywRjuSyBWkXIDVUyKLI0lifcjHul7RGUYKCGV5YooeKhP3rC0jaFWTF
         C8Uw==
X-Forwarded-Encrypted: i=1; AJvYcCVticY+CUhcQFmkin9eJO4l3Jdi4CVauLXqWpdnJ3SsU/vtT9men8VKD5jQ9/asil0+5JIjl3PoPVY//w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLUxuQ+ByTsitrj0Q+sHPWypuvqQLb3R9NEE00K1KHsh/+MiAn
	YaD14AELJPV2J/idR6QB/75XUt2wPvVpAdggWYzrK2UAgh5b4YJCp0uG
X-Gm-Gg: ATEYQzwStXOOLDqpTMbE5VE8JQ3F1EOzf2iax658jtHeONHBCz6cuPzZSsqf/V92kzq
	DsvQ0yKU68KBWJCaG7QcE7RISkqqCPCWgYv1TdpPH10NhmCKXDSPIMiD9R1IaLc6CoI0EnwCA7+
	NcGIyMSozl6ANO2tPe6L030LzcaBdlaZVfEzk+TG9R2IWBUju2WSguF9e6m1CxH6v4XwaS6+MfO
	CKCnX6kWKu8anImAQiHX2xzjYDSX7l2zP/ztgTjXG5miyogtMRn4efgZs+gHIU40/7FfcCPR8aX
	qJLux1wVGhBDDL76DwC2ZBEBmoaJL0nz+OxAgE/1dZiVdx8D8v6G6lZTY1li3bPWF+SfGcDVQ+5
	mtaPw7PaOGaine4EqwCic/L8ee42OB0W7If6KarenV8WzmSQbNFXzSeyRYLQ1rs0zaufSX+K9Rb
	sM/26Hp0jyRS3N9b2X4H3rqxk08QW4Lt7LJZl81SkkaVJpjQppXxL0KZgQ+XDlNdGq
X-Received: by 2002:a05:693c:3106:b0:2c0:d9e6:7eb3 with SMTP id 5a478bee46e88-2c185f383d7mr7769698eec.23.1774907396065;
        Mon, 30 Mar 2026 14:49:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7f4e:2749:b37a:e9d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c747e410sm8325528eec.25.2026.03.30.14.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:49:55 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:49:52 -0700
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
Message-ID: <acrvakIBxO76OAlU@google.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
 <20260329-property-gpio-fix-v2-3-3cca5ba136d8@gmail.com>
 <acpRi0BOgT73pqpE@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acpRi0BOgT73pqpE@ashevche-desk.local>

On Mon, Mar 30, 2026 at 01:33:47PM +0300, Andy Shevchenko wrote:
> On Sun, Mar 29, 2026 at 07:27:50PM -0700, Dmitry Torokhov wrote:
> > When registering a software node, ensure that the property data is not
> > located on the stack, as it is expected to persist for the lifetime of
> > the node.
> 
> ...
> 
> > +	for (prop = node->properties; prop && prop->name; prop++) {
> > +		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
> 
> I read more about this... Any code that uses vmalloc() (or potentially may
> switch to it from regular allocator with help of kvalloc() and similar) will
> fail now. While it might be no issue right now, this may become a such. So
> with this check in place you put a requirement that properties can only be
> allocated from a kernel low memory heap and not vm.

Can you tell me more about this? As far as I can see it will actually
have false negatives with CONFIG_VMAP_STACK, but should be OK not
trigger with vmalloced memory... But I am genuinely interested to know
more.

Thanks.

-- 
Dmitry
