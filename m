Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0783336891;
	Thu, 30 Apr 2026 22:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777589087; cv=none; b=LrjFm2Vu9oNVJvRjYO0d7su79iGeAz/3A942CoMnbrKk4RieTHqyk3bX7x/cx1zQyP+u8YGHVnel7uuA9SgQiEoNVTRbQYkB8fV1ElzcL3qkICcKtK+HBh5jN+MNNtdbgyZDpMjMoOpWwMNVhwzEi76QMzDnhS3CWFLQRE+BbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777589087; c=relaxed/simple;
	bh=n+Pv6O11FO5jdN4nrFdolfk5ylf6XBXtpJ8xX+w7hM0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Ha7eEZzWvSM88uNBVjPDiy/BYpQg/g7B9dyaW62QtHXIs0jQynZ5pkDUDKW4ArPETcXc30CRdYwSZHBQNu4cFYbvGupDTz0If2zbZHCUltmcTpXvbb3KSzdFaEJG78SQlpk9c1v5+Ciy0MekGhpts0xiCHLMkNYcDBtbqPVvN1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3FtTdcR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3FtTdcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E69AC2BCB3;
	Thu, 30 Apr 2026 22:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777589087;
	bh=n+Pv6O11FO5jdN4nrFdolfk5ylf6XBXtpJ8xX+w7hM0=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=f3FtTdcRwTTRxnHgHd9ibxqeWmzBBnQnmH9ROKkjXP6rR0g6eMIJROW6lBN5McOT9
	 1YJJXSqOLsV+yAO9Es7OtzPQp4zZutaVU1PWyN0shkWNNSh/l22vSeOTIcTLyipNLg
	 8iU5qFvxJnVi046jETRvxdZEuyHZkKgP55zA4QR74KIpwr2Wz9CyuOJNYIfvrc9dYm
	 t3GZNXtQWhBTsGuJRLPoH20jCsag1QXAiwGY7dZkmPEPYHIs+kyRIJ8KP8OMO9Hq/H
	 WBdYvsays9/zWqSGG54JjeOf3NZitJ4TtEgD5rXqypADdqoMyjUlSYYeOVyMfZ0O0L
	 Z3WrjTuui3uDg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 00:44:42 +0200
Message-Id: <DI6UQN8M515K.3KSH2M0AXDTRG@kernel.org>
To: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] firmware_loader: Add cancel helper for async
 requests
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Takashi Iwai" <tiwai@suse.com>,
 "Shenghao Ding" <shenghao-ding@ti.com>, "Kevin Lu" <kevin-lu@ti.com>,
 "Baojun Xu" <baojun.xu@ti.com>, "Jaroslav Kysela" <perex@perex.cz>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Takashi Iwai" <tiwai@suse.de>
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com> <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-1-2c7d89cb3175@gmail.com>
In-Reply-To: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-1-2c7d89cb3175@gmail.com>

On Thu Apr 30, 2026 at 11:15 PM CEST, C=C3=A1ssio Gabriel wrote:
> request_firmware_nowait() keeps the callback module pinned and holds
> a device reference until the firmware work completes.
>
> Callers still have no way to cancel or synchronize the queued callback
> before tearing down their driver-private state.
>
> Track async firmware work with devres and add
> request_firmware_nowait_cancel().

I assume this is needed for manual ordering in case the callback accesses
resources that are not managed by devres, but are released in remove().

So, I think this is mixing two patterns, managed by the caller and devres
managed.

For the former we just want the ability to cancel things, this should be
compatible with the existing request_firmware_nowait().

Note that some (hopefully most) drivers already open code synchronization
patterns, e.g. a completion that is waited for in remove().

However, some drivers also seem to just check a pointer, which is obviously
vulnerable to TOCTOU races.

For a devres managed version, I think it should be a new API,
devm_request_firmware_nowait(), which should be possible to simply layer on=
 top
of the existing API with devm_add_action(), so you can just call cancel() f=
rom
the release callback.

> The helper cancels work that has not
> started yet and waits for an already-running callback to return. If the
> request has already completed, it is a no-op.
>
> The devres release path uses the same synchronization so device teardown
> cannot free the firmware work state while the queued work can still run.
>
> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>

<snip>

> @@ -1184,18 +1213,19 @@ static int _request_firmware_nowait(
> =20
>  	if (!uevent && fw_cache_is_setup(device, name)) {
>  		kfree_const(fw_work->name);
> -		kfree(fw_work);
> +		devres_free(fw_work);
>  		return -EOPNOTSUPP;
>  	}
> =20
>  	if (!try_module_get(module)) {
>  		kfree_const(fw_work->name);
> -		kfree(fw_work);
> +		devres_free(fw_work);
>  		return -EFAULT;
>  	}
> =20
>  	get_device(fw_work->device);
>  	INIT_WORK(&fw_work->work, request_firmware_work_func);
> +	devres_add(device, fw_work);

This puts the requirement on request_firmware_nowait() that it must be call=
ed
from a context where the device is guaranteed to not be unbound concurrentl=
y,
otherwise this may race with firmware_work_release(), which could free fw_w=
ork
before this functions attempts to schedule it below.

As mentioned above, I think this patch should just add a cancel() function,=
 so
we can layer devres managed functionality on top of that as needed.
