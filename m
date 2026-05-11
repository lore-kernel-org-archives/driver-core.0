Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8743E5EC9
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505596; cv=none; b=F7hK9Hlb/c+Gr8fDEVpzp8D6R+36zybiNhcSJlxq5fpaEdhYuZ/5XkuJoOqv6T/0+NWp/qunhLMTzG9qrZMihTXQXon0ob07JxEt4GOExGlqMDK9lcqv6Us13uSoKq712WPCfOW1DxUledYjYYJRsoTDL75Y1lY4mHam745y8Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505596; c=relaxed/simple;
	bh=d7UugrGvTHVZ5x6A2v3kOZ5TDSHieQcjxA5S4lHpomY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbSUuMJ8UstZ3rbBksMGB4/eIwxdS4SuXbuRyYGhEW7FcpmfI2zPhS+sklbruid9iauYov3gKYvL/pKZcecQ9TpXlX1Y5ivmpM1n72i2uGB3Fse/NC/5k23QgqZw+Ft0G4rwk6c/2CSfGw3NLTH4pq6O2pzjEmHehi/mlSoHxpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+HaHQTq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+HaHQTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04760C2BCB0
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778505596;
	bh=d7UugrGvTHVZ5x6A2v3kOZ5TDSHieQcjxA5S4lHpomY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=V+HaHQTq0y4rQ3LrJfw/i+rCOL13kXMnnah907+ffZEk4wpwwoVAtymps0dY/wqCk
	 +lwcuVVuxjltWj+fBO2iARPElgr7rVh2TUvWp1qZv9OwvfK2B6hA+NzvqXdw3nxhPv
	 teSX5RQfKnRTJVvUJaYDCoBENTX3ai+/nTeDF5b5mAvtcEWRX8bpf+yGmYmYWl7w+p
	 DX/JceA//7hL59AdZYZI08vzt1WcpFzJ+M1EkusMd3hpr5wg8mBGU0qGZgwp8dDDOY
	 HmOS+7a8FhMffDaQgW7tMzxfY+ovgLNsmotJjH4VS7OKhsPfFbciqq0I/FVIZyJ1KI
	 EZMFVjb8Zmnaw==
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12e332315a8so9586746c88.0
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 06:19:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8hkHIOOa3cDV1smcIDwnb6ybUz0pN0lSHByc0bloJ7R4kZMOghv5M6ftFqKB+8DueO7llzhaI4yeLNPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFdPMP1nuht+K+fvg8uwle+huhlsFECI/fblPjodNC+Vtpddh4
	bFGEBxvi48/wr+U1c6VKhYjge5HfwtxgH2cfeLAtgVAJ7cSEHowGrMwGEwSwrXNxmxQC6d4R19p
	9SzdHhqeFGkuyYWRo0dzL7eYUS2Ugmk1zoFUYClK2Aw==
X-Received: by 2002:a05:7022:2508:b0:127:33e0:ea44 with SMTP id
 a92af1059eb24-132a82ddb67mr4949446c88.29.1778505594800; Mon, 11 May 2026
 06:19:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:19:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 May 2026 06:19:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260508115309.GA9254@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508105448.31799-1-tzungbi@kernel.org> <20260508105448.31799-9-tzungbi@kernel.org>
 <20260508115309.GA9254@nvidia.com>
Date: Mon, 11 May 2026 06:19:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfks9HAGHedQhZY+3UgRJwg_RF9cVOyA3jGh7oiNqDn-w@mail.gmail.com>
X-Gm-Features: AVHnY4KJ3daWyTdJHgf81o2MnLKt19plZceoNb1ciLx1gSE_TrwC8qpPQuR4MX0
Message-ID: <CAMRc=Mfks9HAGHedQhZY+3UgRJwg_RF9cVOyA3jGh7oiNqDn-w@mail.gmail.com>
Subject: Re: [PATCH v10 8/9] platform/chrome: Protect cros_ec_device lifecycle
 with revocable
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Benson Leung <bleung@chromium.org>, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Johan Hovold <johan@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2026 13:53:09 +0200, Jason Gunthorpe <jgg@nvidia.com> said:
> On Fri, May 08, 2026 at 06:54:47PM +0800, Tzung-Bi Shih wrote:
>>  struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
>> @@ -47,6 +49,15 @@ struct cros_ec_device *cros_ec_device_alloc(struct device *dev)
>>  	if (!ec_dev)
>>  		return NULL;
>>
>> +	ec_dev->its_rev = revocable_alloc(ec_dev);
>> +	if (!ec_dev->its_rev)
>> +		return NULL;
>> +	/*
>> +	 * Drop the extra reference for the caller as the caller is the
>> +	 * resource provider.
>> +	 */
>> +	revocable_put(ec_dev->its_rev);
>> +
>>  	ec_dev->din_size = sizeof(struct ec_host_response) +
>>  			   sizeof(struct ec_response_get_protocol_info) +
>>  			   EC_MAX_RESPONSE_OVERHEAD;
>
> FWIW I am still very much against seeing any revokable concept used
> *between two drivers*. That will turn the kernel's lifetime model into
> spaghetti code.
>

I gave my R-b under the API definition and I'm fine with the GPIO changes.
Just for the record: I don't have an opinion on using it in this driver and
don't know if it's a good idea or not.

Bart
