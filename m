Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D1A26A1B5
	for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772285287; cv=none; b=AupNZhuaJkdIvhGdBQAyyouZAt6yyoB4q9PYtRvK6kAPs7FEo2Jq7dFc1ZB1bH4fqmYPS2JB3vcCWJPXzUQS1XBHoO2SL5OGsQztIctGYEV/P0a4cu4a/dSERFiISY4bqdi2q4RW3UAxCSbhin0cuX1FiNgdfbHgg63eYBbrV50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772285287; c=relaxed/simple;
	bh=rfkRArOuMWro32/W92AmMQ/GbJgWcVrU9fMlS2mPSms=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=oNDxAhpI8cWnVMTa2mkRuwwLUdnieEIYD+vQ0s5fERlsXUYsyMem9zCiyFL1mVHv3eUlnbRPrB04gnIRAUJ6kl7yp5vAEHDN+JxjCI1lUjFaZ9Vz4Ab/ZRfYYUGlMZVIREGHbq2jqkf+HpKBhyHfRH/CnT5u1cFWQmjk3s24paU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQZ6kbtk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQZ6kbtk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2887C116D0;
	Sat, 28 Feb 2026 13:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772285287;
	bh=rfkRArOuMWro32/W92AmMQ/GbJgWcVrU9fMlS2mPSms=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=OQZ6kbtk5nA3JhmOfVw2Cmr7X253pRDKm+e1OVo3nx8fGSfC2qL98bQjQodyVZwiW
	 cGX+M5Qptz1aECzOJRsx4DDHN5jy+QcP9aNAVyL8HH4kfC0jRw+BYG70fQ3V8owxGq
	 u5VfVEFtbJIbjZQLP/vWzYtpAw6mqLZBvsSd0beu4+HxHblN5SsE1rjZhZ8RLX/0b/
	 sWwpAXChadsFOkxO3VcHJQidfBic1YnuTYTJTRucEjpIbwy6ffG/Vmu7+AKs06nk0A
	 PPud+jUVmdtB7xF9dM5VbAM91g2gKEO9fncsRBzhpsiL/QTR3RHCu7vmPydnalAKr9
	 z225JGJNL2nbg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 14:28:04 +0100
Message-Id: <DGQMP7W3393B.21EXJDERDYSZ5@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] firmware_loader: Add null pointer checks in
 request_firmware_nowait()
Cc: <mcgrof@kernel.org>, <russ.weight@linux.dev>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <driver-core@lists.linux.dev>
To: "Abhishek Kumar" <abhishek_sts8@yahoo.com>
References: <20260228061136.6472-1-abhishek_sts8.ref@yahoo.com>
 <20260228061136.6472-1-abhishek_sts8@yahoo.com>
In-Reply-To: <20260228061136.6472-1-abhishek_sts8@yahoo.com>

On Sat Feb 28, 2026 at 7:11 AM CET, Abhishek Kumar wrote:
> diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_=
loader/main.c
> index a11b30dda23b..3395ba3d9066 100644
> --- a/drivers/base/firmware_loader/main.c
> +++ b/drivers/base/firmware_loader/main.c
> @@ -1150,7 +1150,8 @@ static void request_firmware_work_func(struct work_=
struct *work)
>  	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
>  			  fw_work->opt_flags);
>  	fw_work->cont(fw, fw_work->context);
> -	put_device(fw_work->device); /* taken in request_firmware_nowait() */
> +	if (fw_work->device)
> +		put_device(fw_work->device); /* taken in request_firmware_nowait() */
> =20
>  	module_put(fw_work->module);
>  	kfree_const(fw_work->name);
> @@ -1194,7 +1195,8 @@ static int _request_firmware_nowait(
>  		return -EFAULT;
>  	}
> =20
> -	get_device(fw_work->device);
> +	if (device)
> +		get_device(device);
>  	INIT_WORK(&fw_work->work, request_firmware_work_func);
>  	schedule_work(&fw_work->work);
>  	return 0;

Those can only ever be NULL if either request_firmware_nowait() or
firmware_request_nowait_nowarn() are called with NULL and it is up to the u=
ser
of those functions to call them with valid arguments.

Besides that, it would just move the bug elsewhere, as _request_firmware()
heavily uses the device pointer.

(Also note that a NULL check by itself doesn't do a lot in terms of robustn=
ess,
since a non-null pointer can still be invalid.)
