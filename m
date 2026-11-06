Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987539;
	b=4manT7eWLEFlDoqpf+O5xCJJIFMgXrCcFI8YvNsBqNv485SauKk3lk4lYNgmJ8+LB9BE
	 IlhzUSbUAcrB5KOB3orGy8V3qrIeo/Vb9der6fmWwTrPFrIXrYCDCRhKJ3+/aO3Aq69Ec
	 9ZE04eJuhpcUGVCGG++KM+SxvbhNhYASHBynoxxNchdJLdAe+4ZxPLPXzQ6D7hdycaoLa
	 csSS4CrZ4jnUbhBckkJ9jsCN8i/eHbjgJQay6xr9h9UHBO41ujtpQf7ZTLig2Y/watMeQ
	 QWALmhG1DEOJoUpCVbX6rn6YESzxGbCbasUtTvm9wWk5lIoDEHniAhngU77VHzXJLqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=OhbBWN1W+Znxr4DvvAnmIHPGTVMobupDzycWw/6MYfU=;
	b=jH4sfvNF+peDxGGCEfvNaHGy576+qiQgNXULylmawnNFkUFLXSgfvu1CSsFAaf4xyph/
	 5IKWCdpiiUEjX0jcVKk+8KD5Uhb1M5iGTjYx8jhPgBPMDYbytf9C7IvVNfBYLJIQFHSwM
	 D27FVlOAV8o8cuqz/PLXWX4uos7DdaO0C2yfu0wAWWyo3RMFIk+NF0Ftx3wA82Ah4147b
	 Ht/i7QCKwe4G78glAWl+fq1JU1wSLJIbDMkvVNWnf3UPUUEUwJY/7yDjjgfBEx7KTV7Tl
	 zq4JNlBMMCf2K8N3cdTFCuO3/UJHdIp30sbnYeVfHpDsrzfgjKlVyydgrmEu7jxE3hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l48wDrWz;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEEA606A326
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 17:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBEEA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l48wDrWz
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36dbde64409so1251400eec.0
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 09:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793987538; x=1794592338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OhbBWN1W+Znxr4DvvAnmIHPGTVMobupDzycWw/6MYfU=;
        b=l48wDrWzFah/mcmH0ACyGTyF3v3mhe2008gALspT4n0HcxMzxxgA2h6uVMUYEsfS5O
         4yt3QMDoFw24yuVxuQTGBTBhlQCcqzk91PwsbXBs9o1oD83tlyJQet4VmH1q00Pzdhax
         ylNqR8qEcfG3/uJvvpJR9ts2MT1D0biWzwRrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987538; x=1794592338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhbBWN1W+Znxr4DvvAnmIHPGTVMobupDzycWw/6MYfU=;
        b=gMHraLRYIq/zRpHnv5BjuiSNuAEwz7MoAOMXcNv/jHX3S9Kc8K+Yfv4VRzLHJ5d4oh
         SHlbqQhBAR8kOkDgabch4+NTrCkmuJprylmR1TtqowoDpGRbczijvmgzT9XVRx6O/1kX
         F4ZRF//EPqbg257o2WKRWwVkyoWhMA1ceewc1UTvCH21Q0puAnUN2e1sahu/A3Oj0f/b
         8KiMn08YlayfbiV+xmxE+tJJ0PwCG+kV+3i/xK2dizBJrJWqney+b696/+IDoGT6X0SB
         hYa7m35cxqQEHVEqVlaUaYDr5+HUXD/Gx/rJcGGLDgZ4DZp8HRvYacStyXR0HImh6Kyv
         nvNw==
X-Forwarded-Encrypted: i=1; AL+hErHe3ZineAQsbCuQLNDyZ8eqoqMlJWBtETo3IW5kEX3pBDAd6en+9AvWgc5e8h7cmdpz69Mdcnbrao6l7w==@lists.linux.dev
X-Gm-Message-State: APuU4Z9wSX+LkJ3OHT1yEhO50pGZuJJlfkVyDAb5agVIwLZ+5mH7z15/
	0DDjmh8y1UCzAbXPMcywa3HGUlx5ZzdRYFMWjMxHgts3onnlqZSOUoWkfPs+Qrbb/Q==
X-Gm-Gg: AYBFou0XnwvZnptYKiu/OHOt7cqQ12ONkUu5ocTkSOUPb0Ibi1VheeOGXIewCGh43F5
	sQmPqB41uq08lcL1SyNtTBsY087FlUmViBI/MIRECtkPfcPEN8ECioHB1QNPm7KdzM6KuMx26GR
	9JDR/tbnX3h+R+LT9l8AT6QwqNahvLby+VSN1yUMNB0pdjaiIXdp0uNeYPjGZe5/7m2sRg/8ShN
	GCIMELUB2eo13pdMjerwVO/SwJmpeU4gG9QxOjaW4RbBacXFDJ99SQtQFu+nbM9rsHaqnswJFZb
	q2/FqhDMZ/CUkR5VNQbJMJk6IqIPrB7P/TD168xc34pVJXo9EuftBr1EomlgSbfH2X0fi/aQtDK
	Na8YJbXYP/YO1kYGXnzRvsthNq0n8dCYB7lQzwbQHEW+7dQ/+dFJbS2RBSUCyteWGTYZOP6MEre
	qz0ofIYQbWuxixkUvhwqgj42gFHwlnY6hFCk9cGQfSEH4K/5aBrGAWlUBE+fuTJzjEkRe+p7Yj7
	/hk7DiKHEWQQYlTkoxYhWFv4TLeHHervu9TdrzqKgQQXIFUES4oHkzB8FGHTs1iaa0JaVOXTgPk
	L2SvBl3WjcSuDs93tmFsSCMu66jel0XJvOsmxUrRKx06cRxY/r1d9uQTfXhJsZBxRiE=
X-Received: by 2002:a05:693c:884b:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-36f723e73cfmr640732eec.1.1793987537573;
        Fri, 06 Nov 2026 09:52:17 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:bb6d:e00d:d359:7933])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36fa9be7077sm8332172eec.17.2026.11.06.09.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:52:16 -0800 (PST)
Date: Fri, 6 Nov 2026 09:52:14 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v1] PM: runtime: Update last_busy in rpm_resume() for
 active devices
Message-ID: <au4TztbFDYqWR2BX@google.com>
References: <13032301.O9o76ZdvQC@rafael.j.wysocki>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13032301.O9o76ZdvQC@rafael.j.wysocki>

On Fri, Nov 06, 2026 at 12:31:41PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Setting an autosuspend delay for a device can be expected to cause a
> runtime suspend of the device after calling, say, pm_runtime_put() to
> be deferred, so the time between the last successful attempt to resume
> the device and its subsequent suspend is at least equal to the
> autosuspend delay.
> 
> However, that expectation is only met after the device has been actually
> resumed in rpm_resume() by invoking its runtime resume callback.  If the
> runtime PM status of the device is already "active" when rpm_resume()
> runs for it, the device's last_busy timestamp is not updated which may
> allow a subsequent pm_runtime_put() invocation (or similar) to suspend
> it right away.
> 
> This is arguably inconsistent and confusing, so make rpm_resume() also
> update the device's last_busy timestamp when it finds that the device is
> already "active" and it is about to return 1 early.
> 
> Fixes: 56f487c78015 ("PM / Runtime: Update last_busy in rpm_resume")
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0jTX1FgeS9FCV=+V4uacSgLQBVsSPnU27ybgUGg57GUOA@mail.gmail.com/
> Reported-by: Brian Norris <briannorris@chromium.org>

Ha, I suppose you can call it Reported-by, even if it's somewhat of a
tangent IMO :)

> Cc: All applicable <stable@vger.kernel.org>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>
Tested-by: Brian Norris <briannorris@chromium.org>
