Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273413A1697
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369044; cv=none; b=ePbPky2nYMIQo0dvam1FaOUakemTUqwCN7PeQtRLItl/MTR3hBkryd8F2DxNEQjUy8zg5eqRbpleMkDI1icFWXcqhfEmtC6UDUPizjydF4+YvA9SQ9FsOG1UV/mLBqjmx+gLVbyhzGsHPM99j9SJ97V2sQ54w8ZM3K+6605Vg3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369044; c=relaxed/simple;
	bh=sRax9/w4iq++WdyC81daMYS46o9HtAGnGATYpcTvhOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrADMzdRxgNvI3W/gvyVOk192wWF3bYXzayVR1pdc504LhCAWVlBDHQ8IW3wSQjNpehqiH4ooLSmK44voAjO3urC7EhBYuV9JUIK+JOgTjcZI2I3AllyxEZSCR0lAstZtYkftC9XVvX9DqPRv2ilimKkJupx7CeVrzspe4zlu4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiKnROHH; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiKnROHH"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12a71ade78cso1876937c88.0
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774369042; x=1774973842; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsYMF3uBNfq2eE0m/55s8BW6rwAAzjLFvcLVF8SzoTo=;
        b=ZiKnROHH4/EuZlw+k3Fh13iK1D/1zxP8NeTS+Y4q5tibvX8WP7Pr1+RNPMtPD/St7G
         cZtqXr3k8SOysqA6Bms8Pfu8w6g8kyPVF6hFoOYTCmvbjXStWBE6VOGl95HFEHC0S/w0
         oH6Se8JUIjbiIdGOX69trbnAL38jvuAmbz9rJA4CWpFYhYDOudJuCXr9t90tOdEY+N+k
         zA+UFTVEqO//f6Ey0LdoyFtRJGGrytFGm0QXzVrNvDkMGhZ5RwqpiLfqYqeintNbcKo4
         fsAtHvYySpmFCVaoa5/qo8JsZnZ5dB0TFRqISbvHU4+nR9A2TQdRnhqsa4UG+2S0JP04
         LqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369042; x=1774973842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsYMF3uBNfq2eE0m/55s8BW6rwAAzjLFvcLVF8SzoTo=;
        b=AWSjeO/B0x0zCATsFgNw9I42kkSsJ17m6ppJKC5dtb9yenhmFpWFDqrOeUmkx6FOCV
         VPREoFZSt4HFUw5VhPCbOiANZ1EzZm9ysUbsNvc80gFlouTbrUDliIO2RSI3YHkctG6f
         x0zvq1SGxBCrYRta8oIRYQZQ8Q+xHN+lktGZfIwDeHcANS1+NLgVhFP+9nBfUi7mQkUS
         6Z7ELBH+1uKoBpG1EOfdkUJzuKymskD+3CLpdtg5Q7uZw4JDXOGzUSHWqFne8S8m6VWk
         w6znMp6FTJfJtlFcnWt41l5s+yBY1wb21pCP81k5ppGq/klp7D9+kGHMWsOWHFVzrHO4
         teoA==
X-Forwarded-Encrypted: i=1; AJvYcCXhl6cqecdfNF70nO5I8QHJRmICS/Qek0TpOg3hlL8SAE9lVXH2hNnN0qprjKYlnuznz4K6+LnAk0Ag2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlnvEp3op02mGst6DMbxyzO303968R0bJrwEtqAwCe3WAYEpgn
	S6LlSMsEWoqAzvUGt2ix7s35r5aKXU+PlyqgWAIxPWvm3KjPHjaZH1v0
X-Gm-Gg: ATEYQzxckFJP98PUpHjDUTPBJo1MjoenfBHIo2h3geQJXIDY3hyNO8vuYU6JryDjd3R
	bH5jz/B6z6McOfrt4/vWz9eHSg5CCEfCg0RbodB/QL+3Iqx07uWMJwzPiOFWEo0vBl8LQQoZKjI
	yX/pwjhSfFdMjkCZ/6Bc61vJCIbcRAu/ZXnhkoU04rVQepuhQJLM34tKP5a5Uv8b6VAbYq3gIfO
	kO6UPQeszDAF+rwNdOe/XENw92NNT5h0phm7yoJM4ewRPfpE/FxIC+cU2KRrRg6yOdmClfd9maU
	HGa3ki8t/VFGgB/5rSEXV205OKiH9GYrAtA9wUjp2Ata+K30BCsx7wPRTL5L2PDnoxwb3UJS/t+
	l6xpsjkxMxraeKgf1JDFDCLBt1bGF6mViJH8tlkDe05oNwclCcilpqGAsukiAzAKtYiQGh/hZ0U
	ls6UqHzTOckXXbtp+YvTmEXJ00WCU7Gz/sqziTNdGR4/3jtdXlEgnJbrFzsnBJ4f+Q
X-Received: by 2002:a05:7022:45a4:b0:128:d4db:447b with SMTP id a92af1059eb24-12a96efc733mr50667c88.38.1774369041982;
        Tue, 24 Mar 2026 09:17:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733e794esm11620232c88.6.2026.03.24.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:17:21 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:17:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH 3/4] software node: verify that property data is not on
 stack
Message-ID: <acK34X9vBmvgHhLU@google.com>
References: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
 <20260323-property-gpio-fix-v1-3-9cb46e5fe7df@gmail.com>
 <acKEm4EiZBqJ67nM@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acKEm4EiZBqJ67nM@ashevche-desk.local>

On Tue, Mar 24, 2026 at 02:33:31PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 05:39:39PM -0700, Dmitry Torokhov wrote:
> > When registering a software node, ensure that the property data is not
> > located on the stack, as it is expected to persist for the lifetime of
> > the node.
> 
> ...
> 
> > +#include <linux/sched/task_stack.h>
> 
> Looking at this name the use of it here doesn't sound right...

Because ... ? object_is_on_stack() is defined there.

> 
> ...
> 
> > +	for (prop = node->properties; prop && prop->name; prop++) {
> > +		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
> > +			pr_err("%s: property data can't be on stack\n", __func__);
> > +			return -EINVAL;
> > +		}
> > +	}
> 
> And again same question, why we can't simply dup them as we do for (string)
> arrays?

Because majority of users of software_node_register() deal with static
const properties so duping them is waste of memory.

Thanks.

-- 
Dmitry
