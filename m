Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6192B2D7;
	Mon,  3 Aug 2026 18:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782411; cv=none; b=NVzZdLaFtZtOvqXsCK4AHImr2msnECijPk3Bst7u+rFeEUyL8pOsHWlWyiLj5z+GKFt6L9fP98rkzjUeNUY5rer2S9/tHHwfqVyY3hvqXwfnFjGfvgx22eAkT3kS1edC3IQGHk5Al6OinAdH3mRoLRYCz/31qLKgMSg5eOoFi9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782411; c=relaxed/simple;
	bh=3rykt3V6TqE8jeWkfCPOs1SLA+dZvZzOFcZVq3iMy48=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Dznt1jVkCJFgSHuulALT29uhQsmxktDMFB0/7ttutX578Kg35/6GIiTpSJjzdwAoixnxoLSWrKsmpjJ8dgrPVF47L+Btw5Wy+Hk5FqlyIc+VS+Xd1/DPjzJL+5j6+ea1U7woMOuvuH6E34c8Gio5rqT9IrtGP91P7Q4weQr7RBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKmvTSZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKmvTSZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8E11F000E9;
	Mon,  3 Aug 2026 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785782409;
	bh=iN9XmnxV5dboFhFFWbF1Ihbis9lMU2mqHetagr2m8kE=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=cKmvTSZ6RakjTXbuBq3X6WDRs1HHTIgDGyrUfIrUoF26G75XqRy8xQcQV9YopAq6J
	 GQ2XEg/alOkNAfYMmywXbh0lJ/XJhSRGPqQ2dodJRrKI8KfGubgNvKr9EEN7lv0xCx
	 J8xPlglBEiB0BXtmitwTFSv3OIYc7XEM1sh/9vbE05tOoAG42ta7YucEgbj3/FInJV
	 mx8+4Wij1jdzNdpqOsIfF7lWOQBvxsjKErEbbZ91ZRCY8p5Hb+19FsKD2JFLl7/0/A
	 yA7hlQ/A2xG7RcM532xreabk69xbFMnV/pPcjrnxqGKZaiA6FsvcHYznpWOjLj24Tl
	 SORACMpQ4xOnQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 20:40:06 +0200
Message-Id: <DKFJ13ZEUX8M.29CDWH9A0OF6U@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] firmware_loader: do not queue completed sysfs fallback
 requests
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Anirudh Rayabharam"
 <mail@anirudhrb.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
References: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
 <20260803181237.kkfi4mtmmd637e7w@hu-mojha-hyd.qualcomm.com>
In-Reply-To: <20260803181237.kkfi4mtmmd637e7w@hu-mojha-hyd.qualcomm.com>

On Mon Aug 3, 2026 at 8:12 PM CEST, Mukesh Ojha wrote:
> On Thu, Jul 16, 2026 at 01:46:01PM +0530, Mukesh Ojha wrote:
>> fw_load_sysfs_fallback() calls device_add() before adding the fw_priv to
>> pending_fw_head. device_add() publishes the fallback loading interface, =
so
>> a userspace helper which discovers the device by scanning sysfs can writ=
e 0
>> to the loading attribute and complete the request before it is queued as
>> pending.
>>=20
>> In that interleaving firmware_loading_store() calls fw_state_done() whil=
e
>> pending_list still points to itself, so it cannot remove an entry from
>> pending_fw_head. The subsequent unconditional list_add() then queues an
>> already-completed fw_priv. Once the request is released, pending_fw_head
>> can retain a pointer to freed memory and the next fallback request can
>> fault while validating the list.
>>=20
>> Only in-flight fallback requests need suspend or reboot abort handling. =
If
>> the request is already DONE after device_add(), return success from the
>> fallback path without sending another uevent, waiting again, or queueing=
 it
>> as pending. This preserves the invariant that pending_fw_head contains o=
nly
>> active fallback requests.
>>=20
>> Fixes: 75d95e2e39b2 ("firmware_loader: fix use-after-free in firmware_fa=
llback_sysfs")
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> Can we consider this fix for this mentioned issue ?

Sure, how did you come across this issue?

>> ---
>>  drivers/base/firmware_loader/fallback.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firm=
ware_loader/fallback.c
>> index 3ef0b312ae71..ffe1b3784788 100644
>> --- a/drivers/base/firmware_loader/fallback.c
>> +++ b/drivers/base/firmware_loader/fallback.c
>> @@ -95,6 +95,15 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw=
_sysfs, long timeout)
>>  		retval =3D -EINTR;
>>  		goto out;
>>  	}
>> +	/*
>> +	 * device_add() exposes the loading interface before pending_list is
>> +	 * linked into pending_fw_head, so fw_state_done() may run first.
>> +	 */
>> +	if (fw_state_is_done(fw_priv)) {
>> +		mutex_unlock(&fw_lock);
>> +		goto out;
>> +	}
>> +
>>  	list_add(&fw_priv->pending_list, &pending_fw_head);
>>  	mutex_unlock(&fw_lock);
>> =20
>> --=20
>> 2.53.0
>>=20
>
> --=20
> -Mukesh Ojha

