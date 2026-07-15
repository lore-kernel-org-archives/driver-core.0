Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA0C4534AD
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129155; cv=none; b=Nt/fTjncmC/TkAqxRs2ZG/jOVjq344QH1MPa9VFxRa9xqvl1QlFWsnijjWkEEO3Ks6NSjRU2NrwupN4OYCJf1egthP2lPznE0Y6ugmFCsmGVcc8lzMdQv64WGzBROh1uZ3HkKkGCVGvUiEmL5+p0ni969UqRe92DtPUrCk+WaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129155; c=relaxed/simple;
	bh=l+dMawsiqBAjB90ZyJKJ5sSPR/LEubgpLl4ZLsahjCs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cbl+VJ1GouJXxrUzPEiXzYnfWIoLUAJdMtkw+uEkcvbfwf9XSSzeB/8WiFG5yfk0nB1bhUpbNva7emMJBH3tobZ3zDQHN8n7elG0r8YXR8QTwQU8yDb5uX77h2+KREfa6b7kLpKKap/ukM0W/n02F9On36Jse4+eC8fR2JI9zhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIJL9qH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIJL9qH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5061F000E9
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784129153;
	bh=kpBhhCyE8a/aOXB8T00HBJ7WCwHQvbJNjhhMF2F/IBU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dIJL9qH+5SgAYQnSsGGEtZ3PYXxYv9EFpdsMpnqUnzLzSqBQajUFdayz8y1sGSpJT
	 vmmWAA0O34q70tKmPtk5p+3xi2kBpwZdwquzAKc0zAon8S+snHD7h1sZNk8pyLcMfl
	 hgfdtBpcnJyZfOlzstQnG8/ROFSKi/hjKrb9whqBY9kcJcJ6iNmPYeNsxiqUpwEzR7
	 qbz891spxCgRoZ3iaNfIOZhq2kI0GmRd+5oh8SMIwKRUh/Lwr8pLWcnSRLqFMlxfX7
	 r3MwV82QuNC96i8/ZXXTKWHOIFMfaIlDpFqGa4TRaVF5kqnIQO4k6XlHBWVad3SBxE
	 BqdtdX52H5UAw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1091506e87.0
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 08:25:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqzmvjcG4jWchRPFw27YHR3r0C2YK8QIEQp9OsVrb1cdsnqG1mQOS9FXT7bUXKNrHCTdwWUWj7ZgZm3Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnFXmOCD5wmSbALkcoBoIHqzkCuPfpORMzfN/ipSwdY0m1vUHk
	o85ALEPJyXg/zVLWJewtOvO8hHoed6YttEPhBnTw6AgWrEYXHUGA+284xS1XHCgWkBdeAN4r1qy
	9wALAC2aBze5u+gNrpSbGEucy3L0rqYvHPa+FKzdKNA==
X-Received: by 2002:a05:6512:3e3:b0:5ae:aa02:4c24 with SMTP id
 2adb3069b0e04-5b01c538ef1mr3542584e87.24.1784129152578; Wed, 15 Jul 2026
 08:25:52 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:25:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 08:25:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <DJZ8VG4H46XC.36XXT1A34B0TK@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
 <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com>
 <DJXNZLE3L756.K5DYSTKM1UHT@kernel.org> <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>
 <CAMRc=MeXwaRSDJYKeoM6PfqWqRPh9KCMF8HATFvaTWUf6N6GYA@mail.gmail.com> <DJZ8VG4H46XC.36XXT1A34B0TK@kernel.org>
Date: Wed, 15 Jul 2026 08:25:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdKgadBrcBG=Rp68WfLzL2PCUMhmcma85BY=DYqUmt0kg@mail.gmail.com>
X-Gm-Features: AUfX_mwe-rdJB7vkDhfOBvwpzhmFIn1wcxvcqM1B2tSsuP3qGUuwuwOUURXCTSI
Message-ID: <CAMRc=MdKgadBrcBG=Rp68WfLzL2PCUMhmcma85BY=DYqUmt0kg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] driver core: platform: unify release path
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 17:19:52 +0200, Danilo Krummrich <dakr@kernel.org> said:
> On Wed Jul 15, 2026 at 5:06 PM CEST, Bartosz Golaszewski wrote:
>> On Wed, 15 Jul 2026 15:52:07 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
>>> On Mon, 13 Jul 2026 20:45:13 +0200, Danilo Krummrich <dakr@kernel.org> said:
>>>> On Mon Jul 13, 2026 at 5:11 PM CEST, Bartosz Golaszewski wrote:
>>>>
>>>> So, either we have to special case platform_device_set_of_node() too (for the
>>>> case that a swnode is set already), or just require that the function must only
>>>> be called when no node has been set, as all users already do; I'd go for the
>>>> latter.
>>>
>>> This sounds good too and it should be easy to implement another test case while
>>> at it.
>>
>> Oh but wouldn't that require us to introduce an integer return value for these
>> functions? Or are you talking about simply updating the API contract?
>
> Yes, we could update the API contract; we could also consider adding a WARN_ON()
> for the case a node is already set.
>
>> I think calling device_remove_software_node() on
>> is_software_node(dev_fwnode(dev)) in platform_device_set_fwnode() be enough
>> to handle that case, right?
>
> Yes, we can special case it, but the "replace the existing node if any" part of
> that function is already dead code.
>
> So, if no one needs it now, I'd rather remove it and wait for someone to have a
> valid use-case.
>

Ok, will do that.

While at it: the other dependency of this series is:

  https://lore.kernel.org/all/20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com/

It's been reviewed and I think it's ready. It shouldn't conflict with the other
dependency that Greg already queued. Would you mind picking patches 1-4 from
that series into an immutable branch based on v7.2-rc1 and taking them through
the driver core tree and I'd queue patch 5 through the GPIO tree after fixing
conflicts with other GPIO kunit tests I already picked up?

Thanks,
Bartosz
