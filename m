Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF43E639B
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505504; cv=none; b=QxPr1hqtuI2i1/2Utpq34WRk3jEEWkzprLuoIWeAeGWCtay0m+cMlZCmqyo6EJDtlVOXefsF/r59GEOeivja6D76ZStRzFNwQN2sfDt2WYxOXnO/HhgOBUDlcUeQw66IPgF0tg6Jzjsy7LlHnz4lvBnAYdfLktUIGyFuDpSDrYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505504; c=relaxed/simple;
	bh=6ww6fy8KHu5Q4r25LD1oz0EJ0eun5LdGvUPbUpVENSw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fy61VQqmWETbnhHe9e3MdsEMiNJK86L3+h2m28ejpfnHBGCwGr2c8coNAEzHWqKcXpoZJYKm8hY9vDq07p+C0J/2nAz8O40Ev6HlHGTXswa4vf7JDIJwdvN7OOCm1Uyx76NPlWVNHCgtR233rwqqarpq/4SayCsD1GKTPOmTAzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+CyLtwR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+CyLtwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738B8C2BD05
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505504;
	bh=6ww6fy8KHu5Q4r25LD1oz0EJ0eun5LdGvUPbUpVENSw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=V+CyLtwRpTOPi3pFnRq2uXpBl3wcm22vl+CncbAS0ZI7EBRMfLRHLsEAloIqRIrV3
	 4WnezmBG3FeVjgvq3nEwpeykbKT2hBFd3fGAjwhcyMV/lHNnF6AMqOtN9cs7Z2y5vP
	 TgHVQV//02XCCETov3XbZGtwyaJOFHCaOzI4WF8G9YkJMcTeX0tEglyADjMGO5iaVR
	 waez7zI86y7zxY2pKWchi0jZ4y8Zb0Yyye/9l3l33fQpl7K+no4Qy7Z4pYkErywVB8
	 YRQ+68olsRZATkq1gm6g2aS8Vef/yO2o8Efrr2IuDwYSYunBHjj+J+9Ec7r3N+zUU9
	 AE7Hyo2Bab7LQ==
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c156c4a9efso5663180eec.1
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 06:18:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pvWniFm7+X52e2q2qeGxNbN0D9JzPOXnif8nXwpVWKFugFweksIWm2qyNqi/COwkqeNAsaB/Xeb+e2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLlo86VWWnH7BDFtnYS9TfKm5JDK+ftuadmdVa2uAeLfn+63my
	7+Y4dWvhwH+CgCUsfswhaCZoW/HrrLYfpwsdCBAY00nrnfJxL3WWayaxxgWMPupJTTKIqO4Z5vM
	tEhY1n2ulJvseMOzKCVWtjRMyhu8KmJwrmQxfvqUvog==
X-Received: by 2002:a05:7022:3881:b0:12d:de3f:f3ec with SMTP id
 a92af1059eb24-131a6af4638mr12966282c88.44.1778505503820; Mon, 11 May 2026
 06:18:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:18:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:18:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508105448.31799-8-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-8-tzungbi@kernel.org>
Date: Mon, 11 May 2026 06:18:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com>
X-Gm-Features: AVHnY4LEB3rFVjF4-wPVWZyZFCnCkvF9FgRQm4PIeEemYGwXCVjb8ySvcJRKDiY
Message-ID: <CAMRc=MfZL2ZEmNEdVd6NeZJDjTzh_MbDy2kU+AYi-CmgRnWZmw@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] gpio: Remove unused `chip` and `srcu` in struct gpio_device
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2026 12:54:46 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> `chip` and `srcu` in struct gpio_device are unused as their usages are
> replaced to use revocable.  Remove them.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

I'm thinking that all the GPIO patches could actually be squashed into one. Is
there any technical reason for the split or is it just for easier review?

Bart
