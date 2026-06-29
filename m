Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD837DEA2
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 04:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707975; cv=none; b=SMAQB4Lww1kmpQzwWSImKtuyUVWONdqosJ5kqVGoxpjkjkVEnXgZlbfIT8bcyilxOKQlSgeB8nP1hQJTNeDydustK7EFyxJC15RXzzkTmolcbMnzGXjZscG8HIf3EPyYdmv5F6/gcc9VrUbZdfiQU8AXiOkEQNVH7Q1gbY6n71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707975; c=relaxed/simple;
	bh=1eU+2bDqdzNluinyylphYvQVh/IYBb3LxR6xoSyK7UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk7Gt215LEoJMK4CjWdLUx4DcDMLEz9bhmc9Sm/IISYcUDu5yjkBa3OeT50gD8AkCF8CFGwhROo2Ad19OrdytvNAgeLOqATPCRo/48334GNgJ7Sy9N0KCL6aG8ZFSuIAfjHHVKGNJTnbao0u+pbkSj4vFF7R8RwqEZibfpHlMiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AwWSWYl5; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AwWSWYl5"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so1381664eec.0
        for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 21:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782707973; x=1783312773; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAkDY+MQvqYfr4IaXyrXZrjWk09q7w3/qlUx+mpeOiI=;
        b=AwWSWYl5yN1oTwOyivg4NBervzmCnqQQeRj7izIZf5eAg/RGHPo/rNj0zm+Ctjsf46
         PQ/T5BKvy/yL/OCueBQmXr61yLVKG5hbQNUpn244c6+rMKEpPTnQdgat5AviuRnmcJGE
         R65tRCPdCP2fxh0wCFAVuKzH7UUNvxO6Xkoc3cxlSoFVr6wMEk5NQE8d22IRv7A2Lkp5
         AYAl2J+f1SbGEYti5snfFV/5A/AswPpld0Hwden/Bez4YuUby0LEC0X+0emH/HbUO504
         EpywXXAMn4BACAc5FHru4LE1G/e96+RUHD68KQBDQGoMnVzZxZxuek8/dH6FcgzsWdi9
         /52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707973; x=1783312773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAkDY+MQvqYfr4IaXyrXZrjWk09q7w3/qlUx+mpeOiI=;
        b=dfp7CGjMUIAW3skHmLKohOsYAvA6T/TJDxfu9mnaqENy3ZKsoCeX6XPA9lAKqKFtVG
         N/debwN1GEz2Ln9wFbriZitMfonCvIN4166fTgnkL6NTWSDqy42RV36yrOqR3earqpsh
         aU4AmYow/1Tk+65+rh9C1ZjpJTqYA/+46b5qmcKL+B4wwK8HWq/iiY8OhvlQOaVjlJXb
         Bl4VtmdJlrg8yvfU+ETZAyaMzwQ6FExBDkpeXYr/M6pzzruFXUauwusivp/OqezacVRB
         1J/VztjeAz6mpgj9zddqViJ00C40a3JKXguyM2Ksmo1yFT1q4hF7ueqYJtzofEpy6oVm
         7JpQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMrrwFRQiCTeru9hswMfx3I1IJlrVbUGGFOGw+dThLZeiA9U4VMrdyKQwX/jzL2zd6PdFdE+6iQVIZmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpNF0aj9RkIhnRD+dl8IV3d4iYUIjGIQe3siVxgfa62ubd6pmt
	KNI12YbaGv3RFofeSFl6qgDfw3XvM5KBfVCulThlpQGKpqbByjn8ekrmEVf1t9KgW6I=
X-Gm-Gg: AfdE7cmAHZnnen+B8KlMf/7Z0AyDq0IatWGd3rpqvTGJeG8OTj5SPgIILDrDYDHSKS7
	DjYjvsohiBKsRUenXR/N6DiqKeyQ19mirB18LA+ppHKHt2j/BD1/2GqVZiqiHEQZ3ehqafj+FdX
	9W5s1hX/dH9mlIpCTxv8HKMk7jCtGSXsAevY+sNxGlB6kwMeINBKyHBZEohQVvw1D/uNMuI423i
	Tc5I/iiI2ZfhaPnwHaJRRgZOZMjC3Wq7m4iVUJsd+aPt6xpEbtfP7vizwU9eG6LU1o/mTtHL97X
	p/9EVpMjYIxdtRzn0959LpIoKUeEYDNYxwyYuUm+FDMHPe1Iw+7yrj9fqRXiNECqM+7cMpCq06M
	yX72OFXUN5YyRoXGWPr/WF+owoUVUYHPWMkCkbFtJ8O2s61Eck6nBGjNDXy8J+L/WH4CHjtJXDq
	x+PFdWFp2issWf
X-Received: by 2002:a05:7300:5341:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-30c84f3cb8emr16773092eec.16.1782707972936;
        Sun, 28 Jun 2026 21:39:32 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30cac1b9751sm23319860eec.3.2026.06.28.21.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:39:31 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:09:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Trevor Chan <trev@trevrosa.dev>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	ojeda@kernel.org, a.hindborg@kernel.org, paul@paul-moore.com, aliceryhl@google.com, 
	airlied@gmail.com, simona@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	igor.korotin@linux.dev, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, 
	m.wilczynski@samsung.com, boqun@kernel.org, gary@garyguo.net, axboe@kernel.dk, 
	daniel.almeida@collabora.com, shankari.ak0208@gmail.com, lyude@redhat.com, j@jananu.net, 
	lossin@kernel.org, acourbot@nvidia.com, markus.probst@posteo.de, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	david.m.ertman@intel.com, iweiny@kernel.org, leon@kernel.org, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, sergeh@kernel.org, 
	matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, jack@suse.cz, ljs@kernel.org, 
	liam@infradead.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	ptikhomirov@virtuozzo.com
Subject: Re: [PATCH v7] rust: aref: make `AlwaysRefCounted::inc_ref` an
 associated function
Message-ID: <xak7wil2w2wdnmkfh4e4ijhlgnudzuh5y3ltlo72454e52tocv@434kdjz2eupv>
References: <20260628100731.64885-1-trev@trevrosa.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628100731.64885-1-trev@trevrosa.dev>

On 28-06-26, 18:07, Trevor Chan wrote:
> diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
> index 62e44676125d..84802f22b652 100644
> --- a/rust/kernel/opp.rs
> +++ b/rust/kernel/opp.rs
> @@ -1043,9 +1043,9 @@ unsafe impl Sync for OPP {}
>  /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
>  unsafe impl AlwaysRefCounted for OPP {
>      #[inline]
> -    fn inc_ref(&self) {
> +    fn inc_ref(obj: &Self) {
>          // SAFETY: The existence of a shared reference means that the refcount is nonzero.
> -        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
> +        unsafe { bindings::dev_pm_opp_get(obj.0.get()) };
>      }
>  
>      #[inline]

For OPP:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
