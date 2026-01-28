Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD81F33ADA9
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590765; cv=none; b=cmSljyJLmkMs4TyXxRRtDEEMz14+BiEKqmF36s2MCjCZtzOMdZLgF0YcgdP9516wACnMWy0mhzkoQOLqX/7lguqdBSQdcioFG2PONrl0n2w8DEFojCCbOUiAkACGil3ASrQtV47VVDNtBAh4Qz1l2TNkJGtXxfkN2gjGAoIv+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590765; c=relaxed/simple;
	bh=wtvDd4MG/vh5GJn296e4lYBpyntlnwuO2E7usxFRFEg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhUHUexsCRObY3qZPjr9sO7NXfHqHCC51XGXtLbZisRU1iafXm7BVk4sruPLNcjGDj5TqHgWPnJZYQEJyGb9kNIK5NYgnWVUVbnb6Nne1ju8CsKZl2iaGV6+Up5KgEFsz/hHLt72K7lo9Zs4jV1sg1ezir7uUEsdBmg8PrTHb04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avByFv9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avByFv9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E36C19422
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590765;
	bh=wtvDd4MG/vh5GJn296e4lYBpyntlnwuO2E7usxFRFEg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=avByFv9h76VnvwxsQUhTkFn1M4gxKh/ZJLDu+7ZjlBeULoa7R/fGLkdfTR/4mjP+d
	 gCDd5ACf5HbebyTD3edQVTjRfqzQyJaXhJlKHcA8U3TyZVOypSMEXU7J6Y/kBmHal9
	 55q6KM1TGbQRsQUiQAgTMGvM9i49fvW2R1MyKZFj228QPYALmRc9qL5W8LzidAKKgl
	 cTb80S9iOdJ2vksskUeJrfJzGBKNP3gljf6s0DJ72dKrKsxihGjEKZ+gLaVHCDGeQP
	 L1jA6Rv4SK+zINXGD15pYaXZmHsXbZP2fT5Xx02McoZyShnXnYckWbn/3uXMPjXEsd
	 lI97tNJqZ+UNQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dcd9b89ecso1014438e87.1
        for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 00:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWL5ql2d+xY9oPPXU2ieiXdlhhw5l1+D+ISVMRqeFbn2xk8KPsSFOmT2ArYJrUMB66bv6pys0RtBhBJ9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSIDq/tnBeMCl1bgRKCx6BtXIirIlQBcCGPzZqQJS5I9Q+Uwbu
	wcwf+DYY7CypsmTzBi8r95pBqIdhsbx7ghOHuIYAQGZPQn4Ml6k4pH/9+kot2YEpHcRQ6iHA8Ls
	BzQaaQRsy4jDWvoX2RgYfoL8GbzG/yaWp2rMou0uj9A==
X-Received: by 2002:a05:6512:3f1c:b0:59d:e304:e2b8 with SMTP id
 2adb3069b0e04-59e04131834mr1970520e87.19.1769590764296; Wed, 28 Jan 2026
 00:59:24 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 03:59:23 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 03:59:23 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127103325.3925173-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com> <20260127103325.3925173-3-andriy.shevchenko@linux.intel.com>
Date: Wed, 28 Jan 2026 03:59:23 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdub_CPeSCZPBNFQ0DMsnA6M2dcqvak9Ti6zU2aGsE-aA@mail.gmail.com>
X-Gm-Features: AZwV_Qipf9Bp4DggIomqpSFspQZHJWvAFfy5uZW0t7mARTIvjyslg0Y9hWMsW5s
Message-ID: <CAMRc=Mdub_CPeSCZPBNFQ0DMsnA6M2dcqvak9Ti6zU2aGsE-aA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] pinctrl: core: Simplify devm_pinctrl_*()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 11:32:07 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> Use devm_add_action_or_reset() instead of devres_alloc() and
> devres_add(), which works the same. This will simplify the
> code. There is no functional changes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Makes sense, we don't have a custom struct here.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
