Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7812DEA94
	for <driver-core@lists.linux.dev>; Fri,  1 May 2026 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777606130; cv=none; b=cI7nzHiDAa/9PsCN2LNqCDLZ4vuS1lxlKjaq+W8nY2yu4JxpFVhCoDI/Q/G+u8cyF4iohq7JNAFyrRuFWuMmhdAHFxG7IhcJqgsvYk9Ak3taa9JZsO9sCblJcEdz7PpkPSsXAS49H14vjJ8v97ojef6hkPaNlg0kIvr3Scc1QIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777606130; c=relaxed/simple;
	bh=4md3m4LmrE4S3agwDm1tdU1h3LAXl6T1ke1Y6zrCyEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4jFgRVvjp5RsB80ntYTpch8KtbwQnyFdB8XAyq6AX8yxVlfjQfqV9VyFHyuaurx3kewwQTV9FWVqPcJCqZ/3ZC8wnp+J2J/4KFVpRpJoqMLutDXpfjMcuB+ImugzGbZKP8CIKMZMyzxHa0AKNjrkBwvpvvnfSMxxFkXtP1uKc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7WEtSdL; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7WEtSdL"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2354353eec.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 20:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777606129; x=1778210929; darn=lists.linux.dev;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYd7+zRIuqZpCWzJf7jANSx+Kankukycdkw0qBK1GPw=;
        b=j7WEtSdLzb35QEayK7Tu64lI9FV81r8pTg8/iBXCKqwDqY9hgMzfBvOqHdeR8bjYCm
         8VueGz8MF7oQr8nCvb7M0JkwG/VC0LdAfRnMLMIZrDV2zX6dyq/QwEd56SdbhV6jlKSm
         jaK7oCmqgcs/ljujOv4sU1YRHUct7ZASaz/5YxrSIPFrLcmLmWACl6o3zSLxqEthwAw/
         yoS4F+XWo6rdr2/VfKY3i9fJVUGmkxnkrB9Fhx1zuaNh92XHanFj3ESJ9k+tyKCH5HRZ
         ozFjGrWF6JhXL5c0Kr5Ex1lWSiABxSoNrQ1SOfqbtSBwkC0c7vhSaG5dKpxJxDGz20r3
         QmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777606129; x=1778210929;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYd7+zRIuqZpCWzJf7jANSx+Kankukycdkw0qBK1GPw=;
        b=YqOQzRBR/XqS5Oy5OCkcYQDepUB7FVRsdEAPJs+rGqtY557TEUoGDUVoKpbaFOCKgi
         0tPPiJFTvW3Z5oJYuDKXJGnt03Q9Rg/yRw1ozy2Cp+QZwoPymLXnc6z+2QMtCDJBEH/h
         7zKtVDakCMzmF4F9GvrQn1sVg2snaImtjoxmv/PqcMZ5qluTWczZAf7VXM2hQ1iXdER6
         pD8RuGkRXyXWPF1H2q6SnodIyH2kIT2SjiUxWOc4xGwvtW9M0ULMeisRuCqqXLEd0Rtc
         MnUAuHpYgGQOcHXaypTsRR1HC6goDl18XJMfPluJzYN3GTvTQmM13PT89s2Sh8IXS0E/
         Rl4A==
X-Forwarded-Encrypted: i=1; AFNElJ8tzMiGfCev02GU7tbSYOIsw1BCkH7zXhd5dsz5rjmCXMZ/iw4GGfUZf99BSpQ7LyEaZ62raq8lvUd8mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5tbQ26wGmOhzz0+AO+5E7Zr0xp2MV718SyNgwKgEXB8y78rBM
	67O6nxRIf5GqkQdCvsnKb/3pVPQWnPJ5TWL6Oh7UNq+3uD0t/yi3rHaT
X-Gm-Gg: AeBDieu5M9CY+0EsfJmpYHup3q3hPicTMcnGKmpQf89W9OjS9zCcD7V1mzAB067aIuc
	FoSMoxyW+2OIVcK1p1fqeXqywC8p6wW/GdFYk9HgYV/4r+EDnGcKeUfTRwiyghhUihaMeiS3Ld8
	XYbWuOPy9xEqjLB4a6QEeEBitnOtemb+wWLAgvp46i302yxlefrrMvfzXHzD93V7a4gDiCTTqe5
	F7RMHrtk1vuau6PJMFKaA/nJJtGlRbjRdTTSa+w1kAgDSMyJbuxfdn+ItyJfVlSOUezrAGC3YI4
	NYRMjbUZK6xpD13yEft/AKgSFd4hGFCSh2cvbkCFa1lkIZr4HUDf6wIcRJWEvtpuUtN+E6Zocel
	bhqaTEg1gOCWDLiP57Ga2iAY/ygxHDZi42GImfRqbCLUekM43W3kikd8j4TzQArHq8XK04A2oVa
	aML2ZELahk/fHTNkrUtUu8FQCIFUzSCW5WFvVxbJri5z9V73BqHlp31GnnV/63mN7mHvY34oe4f
	veasPBIIjIG
X-Received: by 2002:a05:7300:4341:b0:2da:d4b4:c85a with SMTP id 5a478bee46e88-2ed3d8b85a3mr2320272eec.11.1777606128411;
        Thu, 30 Apr 2026 20:28:48 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d634sm3714594eec.3.2026.04.30.20.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 20:28:47 -0700 (PDT)
Message-ID: <662ed68f-dd37-4a3e-821b-e2f715cb4a47@gmail.com>
Date: Fri, 1 May 2026 00:28:40 -0300
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware_loader: Add cancel helper for async
 requests
To: Danilo Krummrich <dakr@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
 <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-1-2c7d89cb3175@gmail.com>
 <DI6UQN8M515K.3KSH2M0AXDTRG@kernel.org>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <DI6UQN8M515K.3KSH2M0AXDTRG@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YGdOVAJBVEA1TPH3T13ph9kG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YGdOVAJBVEA1TPH3T13ph9kG
Content-Type: multipart/mixed; boundary="------------aV2TDdxkkyQRlrI9J4ccR6AJ";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
Message-ID: <662ed68f-dd37-4a3e-821b-e2f715cb4a47@gmail.com>
Subject: Re: [PATCH v2 1/2] firmware_loader: Add cancel helper for async
 requests
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
 <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-1-2c7d89cb3175@gmail.com>
 <DI6UQN8M515K.3KSH2M0AXDTRG@kernel.org>
In-Reply-To: <DI6UQN8M515K.3KSH2M0AXDTRG@kernel.org>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------aV2TDdxkkyQRlrI9J4ccR6AJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi!

On 4/30/26 19:44, Danilo Krummrich wrote:
> On Thu Apr 30, 2026 at 11:15 PM CEST, C=C3=A1ssio Gabriel wrote:
>> request_firmware_nowait() keeps the callback module pinned and holds
>> a device reference until the firmware work completes.
>>
>> Callers still have no way to cancel or synchronize the queued callback=

>> before tearing down their driver-private state.
>>
>> Track async firmware work with devres and add
>> request_firmware_nowait_cancel().
>=20
> I assume this is needed for manual ordering in case the callback access=
es
> resources that are not managed by devres, but are released in remove().=

>=20
> So, I think this is mixing two patterns, managed by the caller and devr=
es
> managed.
>=20
> For the former we just want the ability to cancel things, this should b=
e
> compatible with the existing request_firmware_nowait().
>=20
> Note that some (hopefully most) drivers already open code synchronizati=
on
> patterns, e.g. a completion that is waited for in remove().
>=20
> However, some drivers also seem to just check a pointer, which is obvio=
usly
> vulnerable to TOCTOU races.
>=20
> For a devres managed version, I think it should be a new API,
> devm_request_firmware_nowait(), which should be possible to simply laye=
r on top
> of the existing API with devm_add_action(), so you can just call cancel=
() from
> the release callback.
>=20
>> The helper cancels work that has not
>> started yet and waits for an already-running callback to return. If th=
e
>> request has already completed, it is a no-op.
>>
>> The devres release path uses the same synchronization so device teardo=
wn
>> cannot free the firmware work state while the queued work can still ru=
n.
>>
>> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
>=20
> <snip>
>=20
>> @@ -1184,18 +1213,19 @@ static int _request_firmware_nowait(
>> =20
>>  	if (!uevent && fw_cache_is_setup(device, name)) {
>>  		kfree_const(fw_work->name);
>> -		kfree(fw_work);
>> +		devres_free(fw_work);
>>  		return -EOPNOTSUPP;
>>  	}
>> =20
>>  	if (!try_module_get(module)) {
>>  		kfree_const(fw_work->name);
>> -		kfree(fw_work);
>> +		devres_free(fw_work);
>>  		return -EFAULT;
>>  	}
>> =20
>>  	get_device(fw_work->device);
>>  	INIT_WORK(&fw_work->work, request_firmware_work_func);
>> +	devres_add(device, fw_work);
>=20
> This puts the requirement on request_firmware_nowait() that it must be =
called
> from a context where the device is guaranteed to not be unbound concurr=
ently,
> otherwise this may race with firmware_work_release(), which could free =
fw_work
> before this functions attempts to schedule it below.
>=20
> As mentioned above, I think this patch should just add a cancel() funct=
ion, so
> we can layer devres managed functionality on top of that as needed.

Thanks for pointing this out.

I=E2=80=99ll split the two lifetime models. For v3 I=E2=80=99ll keep the =
existing
request_firmware_nowait() semantics and add only an explicit cancel/sync =
path
for callers that manage teardown manually.

That should cover the TAS2781 case without making the existing API implic=
itly
devres-managed. If a managed variant is useful, it can be added separatel=
y as
devm_request_firmware_nowait() on top of the explicit cancel path.

I=E2=80=99ll also avoid the devres_add() / schedule_work() ordering issue=
 in the
current version.

--=20
Thanks,
C=C3=A1ssio


--------------aV2TDdxkkyQRlrI9J4ccR6AJ--

--------------YGdOVAJBVEA1TPH3T13ph9kG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCafQd6QUDAAAAAAAKCRDQXT8aWv/ug+RH
AP9HQg53zZJFnXm7+M5h8QCkDPtpDeepvobxBCADZe8uSwEAt0sk2q2cf9VilZUUkqneF3Bmy+LY
vffG7i2is5U9zgM=
=pMut
-----END PGP SIGNATURE-----

--------------YGdOVAJBVEA1TPH3T13ph9kG--
