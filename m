Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD64D9905
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618533; cv=none; b=fQc3hssA6dC2zWkEot1dFO/EJ2ThXemN6nHOhQa4KKsohmXaFfyefZdrBfPhbVUtTyfQCl6QbN7SZ8aKqI9rWySF0KMCRLt1ZdvW0QQsQwj74o3XNSThQPuG0kX+tUkeawo24nyru5OZofATSr+q9rMbYh0OA7t3QvRdMS50CC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618533; c=relaxed/simple;
	bh=lsP6huJ9ct03Z1zKO/sCXP1Yr6xrLwhLc0mSXcIgtsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyxjQyR9FVgt3XqiNGtxLMiLdCdbxRIIvr91CQXsJKK6RssYCVgvRyasKhdSCzGTMtH5U/3FdI1kxs9ZahLJTx11xgrnkdS4G34RZyEcs9qL8U5v81AVvuFV37yTeE5eh0xWK2cmKw/Cz0dLfVy4M2cFOGANJebmC1aUyCoDOXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mIIEumld; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mIIEumld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19311F00ACF
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783618532;
	bh=hoLMINlV3QqsEhjkSKeIdqYNPL53JDMS7s0+KJ+FeeU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mIIEumldZR6U8Vsyv4uN8iTJ9ynjNG5mE+fXNsti76WpUMH0GHVCrajUR2B8tWP18
	 +YmlR3JZcgl+QesapPEsAJo8jBtRXwQmGlQrZR1Eg0OpTbDGRpbchBJH3jASgL8aeZ
	 1c7BHlV3rBiKYTzP+YdqSYlG99mXe6jrQHtEjujE6WauG1K3k3Zmsz6/DA/4YGQZs8
	 QMpVaQfy1KNwnxSy3fYB0pMTbtvsf96GOdZ5QaFzHoYG52HbiF8OWPeYZIDzQLwLgq
	 wsDt56MqteZPeqUZmEWeqJKLd2CJmLpyXZekYDv8FwHcqr9Ku4GOSEpFkIaz97jChs
	 9n4FinlkBnh8g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebd52488cso58605e87.2
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 10:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqe2IrfTW07UyIQJ8VTvzsqmOGzga47allQJiIyihlU+ksbF/5ek0w2VjgETa3fTVmQpq/3mNr2pui2pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyctK4P+5VpiaNDWveUFWSPg/Z2C1XonkVKSxPs0ZiE8MZOFP8M
	jI8OgTsVZ43Q5RH/yuy8fowUqlG9++Hn04PRdiYem/27GAI5CV9xUhrKOlAA07XKKnk4WX1+Uup
	OzRehVE89/jiQLaA0+DJYV4IVrnbhg18=
X-Received: by 2002:ac2:5984:0:b0:5ae:b9b3:8ba8 with SMTP id
 2adb3069b0e04-5b011477c4emr1214774e87.57.1783618530978; Thu, 09 Jul 2026
 10:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
 <ae915278-2f21-4bd0-8651-d2e02ac04aae@sirena.org.uk>
In-Reply-To: <ae915278-2f21-4bd0-8651-d2e02ac04aae@sirena.org.uk>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 9 Jul 2026 19:35:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ga8qqYg79+hQVtO8T=FOCj8XLmTz3HpEKoOykV_K-HSQ@mail.gmail.com>
X-Gm-Features: AUfX_mxSopoNn7_P9sl3mlA1rhOj4sbv78uOl9S8bWEr1uQf2zt3I7w-icfoGgs
Message-ID: <CAJZ5v0ga8qqYg79+hQVtO8T=FOCj8XLmTz3HpEKoOykV_K-HSQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
To: Mark Brown <broonie@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Girish Mahadevan <girishm@codeaurora.org>, Alok Chauhan <alokc@codeaurora.org>, 
	bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 6:35=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Jul 06, 2026 at 02:23:09PM +0530, Praveen Talari wrote:
> > When a runtime resume callback returns an error, rpm_callback() sets
> > power.runtime_error on the device.  This causes all subsequent calls to
> > rpm_resume() to return -EINVAL immediately at the top of the function
> > without invoking the callback again, making the failure permanent until
> > runtime PM is explicitly re-initialized.
> >
> > Unlike suspend failures, resume failures should be retryable.  If a
> > device's resume callback fails, there is no reason to permanently block
> > future resume attempts on that device and all of its consumers.
>
> runtime_pm.rst still says
>
>   * If the resume callback returns an error code, the PM core regards thi=
s as a
>     fatal error and will refuse to run the helper functions described in =
Section
>     4 for the device, until its status is directly set to either 'active'=
, or
>     'suspended' (by means of special helper functions provided by the PM =
core
>     for this purpose).
>
> which needs an update now?

Yeah, it would be good to update this one.

That can be done in a separate patch though as far as I'm concerned.
