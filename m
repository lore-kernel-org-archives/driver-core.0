Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F342D29ACDD
	for <driver-core@lists.linux.dev>; Tue, 31 Mar 2026 05:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936190; cv=none; b=EGp0z3tFzt3OmMTkCwUnXt5uj3gf/KIWHTNd0WLY6bH83xSRk4ddk6/gF3Ig3/rzEsC4Kbn8J5floQ7M2SBhoI6QCeqRWrzUimMQzf5F0WH6J9SCaX9sFPV4NG6h1EfL88HpWuWUTsV1V1OInnQH190V8QpJP2pZcS5S8D4qllo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936190; c=relaxed/simple;
	bh=s8uPxYPuNODo2d+i6hzGWmLatHFJixudqC42WwqrVl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfhWkTIslxYwQnxRiWAjtJqHl0RgDhkkjlRXUQaH6ShVJsQGoHb5fB5GLPCteIku584cOKsM4qVyKrLB/0QtnUiDyaPnsGLuIkO7Q40N0RMr/dXXhtKLTlr/+yizP9q/mLv7bC553zBZpcpBmFNvKnR0WcP6gRWg0KYnrpmNG2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxVosbit; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxVosbit"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b4520f6b32so5814484eec.0
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 22:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774936187; x=1775540987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6ZalXvRcEM7eynFKSA3Ox/Wlzblw8FW9y63x9o9NVw=;
        b=hxVosbitJIt31BTb2jTe4DdslMEpK/AqO4aUHmbmaPgQd4GE+s9H3XAym7TxXmq9y2
         aTuiMD260te4BZ5xQEMhm6qcBZ9WmLjrLNYZDBt1apwZ+xa3WmoN779ywxD+5zfQKkLl
         a0ztTwpv4gtz20I2mNu9HCup0EYxEpmCofZT55pRaWeGFx+0vNEk9vyLGSARwifPEXFS
         fiVWunPzSR35JEot4dpuAmiWUFOeckPi/g4ZmZIyJA0U43kJbL89QZA/zf8MX+LidF7z
         nOXsgWxLv30n89lgCAtTSNTMfsddiCEcD4Oeo3Yfxa6H43xzvbc93cHpHXRGZuffbLWf
         zHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774936187; x=1775540987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6ZalXvRcEM7eynFKSA3Ox/Wlzblw8FW9y63x9o9NVw=;
        b=cbfEaDbkP4ANnV3rw9tbaWSrM4UtcN+c41p0n/F2OxVRxWFG6UR8O8Js+rg4fg0CZO
         HJvV0SDUBwb/yY/qJKKOlRfPmB6ixitBAhBXEA3yBaFj+A/vDnzLQyNCBniCH9K7oQLA
         M2h704FU5ciqDRaf7cM0qgIG2iAhHvuItOxXw5KDt1Vrgr/k14cidQEue2M1e2uZ5W9H
         6Ck5xDgYpmabtc486yb82QwCR3bWYCtcLQEoyuQioHbQ4ibS+Z5+9g43a3tXjKrk4Pmr
         4O8bGC1Clng16XkNTtEtoLmZOzeTSBEpjGkSQqARU2+W+mj2edbycn8P4AoCI4Akmb3w
         50lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs/xkt7D9NZGMq7o6pwoxLWouvAKmNU5kNJp8tp9ralLRcpRZ44xpi5v0VzId1jWyrRaJp+EOlyA5//w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUOKwcTtwR0ZZdgDQXOmogW327e96JON4I9RsmCX1Sl8VvqlrW
	Ipr+Qq0DB+zg//GjiAQ5qLnDH4FkRSJjRRuGkQAYuSZHVeAyh5OATymN
X-Gm-Gg: ATEYQzzIlZW/6wJMCP+Fdto2iiFHBqILrIYtBvo2b3PbJuo+VKOEA3XKs0+vTPehFM4
	XaZhO655pnwXepwSsVujnwe7szrkfa8KNfEQMD0MIwy/TozfVlIf818hUQa5ffC4CW0xRLkw7Hq
	CczFjvxbH3PuiV4P4LwqJ1Qy+6TFarIDe30UaYytoOw4u34K/KozYc2enzrLrVFAwUPkyBTGsNs
	Je4cuDUNYNZQYFvO1FWnRrOpfmtFIvWbFeMaJ4X62cTQwAenzhJdEcd3ejbQ21pGMgEtl3gjHC+
	6OPaUeFOXQBsQcuKsg+Ekb3DJm6Gu2nOs2VOB0L0xB90m3PlbYxVMfAvXZ8cflhfodecF5Aztp5
	vdHeR7sCBt5gQ9limWVeiQbxUt88zVxP9sBL1yU9VZlhSNaFw5aUR9sSqU4+eLQY1st/IedmvbS
	uddqaTsPxU+3KDFSw7xtAYO0Y9WiRVo1jwEY+W+6r2c/bymmNVeynOEVyY9lQrdwaO
X-Received: by 2002:a05:7300:e60b:b0:2c1:85a:d25d with SMTP id 5a478bee46e88-2c185d74157mr8785111eec.1.1774936187043;
        Mon, 30 Mar 2026 22:49:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7f4e:2749:b37a:e9d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda13csm9275122eec.6.2026.03.30.22.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:49:46 -0700 (PDT)
Date: Mon, 30 Mar 2026 22:49:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] x86/geode: fix on-stack property data usage
Message-ID: <actgKlES7sfLk16q@google.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
 <20260329-property-gpio-fix-v2-1-3cca5ba136d8@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329-property-gpio-fix-v2-1-3cca5ba136d8@gmail.com>

On Sun, Mar 29, 2026 at 07:27:48PM -0700, Dmitry Torokhov wrote:
> The PROPERTY_ENTRY_GPIO macro (and by extension PROPERTY_ENTRY_REF)
> creates a temporary software_node_ref_args structure on the stack
> when used in a runtime assignment. This results in the property
> pointing to data that is invalid once the function returns.
> 
> Fix this by ensuring the GPIO reference data is not stored on stack and
> using PROPERTY_ENTRY_REF_ARRAY_LEN() to point directly to the persistent
> reference data.
> 
> Fixes: 298c9babadb8 ("x86/platform/geode: switch GPIO buttons and LEDs to software properties")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

While we are discussing with Andy patches 2-4 maybe this one can be
picked up? It does fix (I hope)(I hope)  a real issue in the field.

Thanks.

-- 
Dmitry
