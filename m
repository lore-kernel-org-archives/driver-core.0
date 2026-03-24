Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1094D37B400
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368728; cv=none; b=MezFRiNgc+BGCnYJsL6dlUWUVWDZVz7v4+BkkU10WMeDFj0R0VXaxszbIUmz8VL+O40ZmyA68kH0qDhwmoyvg37qlWBeIpnBVfva6cKZ/OegSaUG7S5Uk27ojTscSzgdjgPE4LSP1QxVHI5HnA0OcrJC6K2jqHDs/aNSplj9vT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368728; c=relaxed/simple;
	bh=NGWihRTNsEWvA+3bIr1m6OPw9i12Umx2EgNgoDF+VGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l99M3EOqKdPC4fXhHvlF09zBcNVi2gryaR4borNeeOD5BB1KD7sdy37JyvDF8LqzXrhNod/7hyKcKdNUF9/k+sTvQHJvCJtlliZi/h7OP72NX3LbxUuo7H298P0nkay36kqnzo8eU0BA+A7ogfzMKiblb4rkMg5FwNfsF7h/C8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLY8YfJ6; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLY8YfJ6"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c107ef474fso3386667eec.0
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368726; x=1774973526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xzZRZ8nzRuBK7fzKOuILCAb/KGtosM6PHlSFuG6kcjU=;
        b=gLY8YfJ6tD+bfXq+OHI0D4Sz+JTQvOpo5pEzFcsb9Uogx7142VxKABnQtP1VYUKjoi
         rR/NRMMnqQo/X4ACSInKOuqA00qQ+3vErMMuXpJOc5T2HfiC02x0MiglPokjgaCb1aTj
         abcqX/DgAyKOky3WKVzHaFudGoUqF3PD82OYAD/7eGcfCOliw6VoA5zEe77j5+sXMupU
         GYDePYiV3B6xwEP03GhnKHLSNi1HHYAh2eKApx9iegE25MP2zSlL35UDaoDmi7bGTgkG
         T7bVkpaGvK37thwC5ClbZnTnsItQVjXux1mnEHZVbUwf3J/prEtqdJk3d7vHUCkhYNxN
         c+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368726; x=1774973526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzZRZ8nzRuBK7fzKOuILCAb/KGtosM6PHlSFuG6kcjU=;
        b=hTjOatm36g7gihL3dzirpFQalkqz0qHM/Wa0sgVA8UZ2sL2ncydQrHlYPyR08rojnn
         cQYWZczxvOV7GO8aSG5boeTmd7lKH4OLR3o1GBV7XUUbQyF/r/lmhfzXjs4i4oFlvRZ/
         r+Y4s8wXhVdDUvDj/fRvuEIAVDd3W6PeG16msmypnt/qLTHrk2BKUPj7ylB4Z+wHOFOJ
         8FaG0EOR4Ur8r5y9mr5xVrtP8HXLdm8lMXoJGdnaQLsi/kAA8iRiGUixgeGfAe021Pcs
         pL5saWKsKHmQpePNgGG1PB9zlVMhaC90VjDFa84e1mSvn3XLpnDBppILWUpEP1rAjrKg
         CfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsojEU+Pz3x4ogoj3Mt4GgOJwnaNM0kbFW+IL2uPxem6ry/5h8Q9s6n5J/d0qzCvealCzwCgWZdy4cPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhIadBJrmHSY+pd0p0fGvWy3lHRmyHx2uH25pEct9jG8z/u9ax
	ldmtAEN8QgUAg9QOHZCwTbx6fxFtUEA07suMxcPSj1MU89mLyRHP79cR
X-Gm-Gg: ATEYQzxXc9q/Im9ZHkLJYt2kThEgcs7knqe58sN26kWUxxywZgoDw+wpRMXvGQtapBs
	L80Eqh+bj/0sIWw072ZC4jth7gIA1qPDJmE06UrGYIamJTrTHv97zdMvoXXY904t/sdKEMdlaH+
	mClUO5Gmk3yA3otlmzjj9AwsXhrVtKlmLibbODP6LQlmZ6axf8kt0e0nG9/wZ285L5iSoEOaihd
	EP3QQ24phLLFruRZqVSJMgqwkOnej1fJrHql4QqcpA2PwPqA/Ve1wjgZ2h1uWI0q9AiavMAtxTk
	7gaSKWiAHGT9UHGlfOipBMYIyU94sc64QopB2q0b/5QiXgm1iVwPPod6sE5dsrN6C8vq+P6uuYV
	HLzSLbK5S93gSBY0zvRjvr1dnp9mQhRptb9vTRPSx1CWhT3sfOH89LU1LFA6zBOJpmmlMXLjdn1
	fRCkMyVQ5UwfeLrFuTjXOHcIPWZwqAlBHJ0E+U7J40FWMHnzGtVJhY+W092grNPP6Ngvmom5rmy
	Ck=
X-Received: by 2002:a05:7300:a994:b0:2c1:59ea:1103 with SMTP id 5a478bee46e88-2c159ea1872mr567954eec.21.1774368726006;
        Tue, 24 Mar 2026 09:12:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm15686055eec.29.2026.03.24.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:12:05 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:12:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH 2/4] software node: allow passing reference args to
 PROPERTY_ENTRY_REF
Message-ID: <acK2vN5ZmN4c5fD6@google.com>
References: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
 <20260323-property-gpio-fix-v1-2-9cb46e5fe7df@gmail.com>
 <acKD_vzk_8bX17ZT@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKD_vzk_8bX17ZT@ashevche-desk.local>

On Tue, Mar 24, 2026 at 02:30:54PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 05:39:38PM -0700, Dmitry Torokhov wrote:
> > When dynamically creating software nodes and properties for subsequent
> > use with software_node_register() current implementation of
> > PROPERTY_ENTRY_REF is not suitable because it creates a temporary
> > instance of struct software_node_ref_args on stack which will later
> > disappear, and software_node_register() only does shallow copy of
> > properties.
> 
> Isn't that the problem and we should take into account how to dup the reference
> inside property core?

Sorry, I actually need to drop the end of that sentence.
software_node_register() expects the caller to maintain the lifetime and
therefore does not do any kind of copying of properties. The majority of
users define static const properties and we do not want to make an extra
copy of them.

Thanks.

-- 
Dmitry
