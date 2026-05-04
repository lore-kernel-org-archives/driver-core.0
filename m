Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C2A37C915
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934427; cv=none; b=iyJ4hYuo4bE8QNR9zrJDHp9EZ5PRtPaOC27nfDMMBmFFlnqgC2ui1KqvHrmhvlJ6uLQo84nSt1oc3JyOafMIi2t9Ap0z+UpVDd91cmeZO5085TbuIDBq4iu8DHPqcivpUhww+tJEZtYngjfTvOR+9gJ5sTz7NX254lOwl7NB19Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934427; c=relaxed/simple;
	bh=IV4lIE/sAJGhfLhlPaCkFiYyIHmolOIEkTmTLS9KkxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQItRwkJfBVJ1CbOMucMXC0UElqQ6JBTkn5ChQzJqyuA5ibW4dmfIA7lJrMAi9vtWKyAwyHafDdpXKpvrwQJvJUS1wPmByd9BRsTJEVc8Ll6xRMY0i7rKs98qO0zEtUF/lhEsWyRT7ZUGoqZuxPHd++EMWwrB+ypt/LQBLiH3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO2kOD8R; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO2kOD8R"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b4520f6b32so7023938eec.0
        for <driver-core@lists.linux.dev>; Mon, 04 May 2026 15:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777934425; x=1778539225; darn=lists.linux.dev;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOyMVqWhiGWsLeCi4F+cbwxOvc3jINtzcH+2zOdTKlA=;
        b=lO2kOD8RPG2kqg/qw5wFVpYcJqrks8/VoP8PJctkZyuXvOr5f/fLRMaAEdTNA7FLNZ
         8u4Bfsn+oOWeBjFdCDpZ4nqm3DY/Qe6lVF7yOgzqb2VrJneOEjwNsWLvkURr9y7RACA7
         pw23ApQUl6EON7XUFi18c3pHGmUUOV32fkry1vafmtoe4MIIQwBBjPnBNH/SqTHmEN4Y
         TkpTaEiJfbh4S+vzhhDMLK5grYy7U+1m/bGzbXytgcM+xS97RhRs/2KEak6G2NRxWuEW
         WWGmyCZds+ko075H2I58oYlwAZd6OAVdUQHWW5MkYf4I+GlN+qM6CklftakRVLsLxPiG
         Z6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934425; x=1778539225;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YOyMVqWhiGWsLeCi4F+cbwxOvc3jINtzcH+2zOdTKlA=;
        b=BHAhrEXaHVMajYsMvaUwGbmWRSTSpqXfRrtr49rmVUNyhzeOlrRSopR1ViPDP/Y2P6
         VcKU3DKM0HX5y7vP2KE7+W6fVYjnr4JMnNFFJR9HfktyBA4H7C0+0MOOLzQn5yZZ0J/E
         rsWcnO3v6ELVQsX/SDMk5adihzLtEk9ql76y4YFXmepdgYnfuuhUelXXob88GPgBm5rs
         HqV0G2ZMDRLiaydN1P56OWoSMsTfFfusaQ22fQEDtvZbqOfWtQmTML3bIi4FdV/NNva5
         n0Zo41CPV48TidDJbkydHfqVNs99mWsmypOLwkfCPSTwNRy9EjvqoI006UBLR5NUKtc2
         n81g==
X-Forwarded-Encrypted: i=1; AFNElJ+BHe3R+1A/Qcg3axcc7EADcJcSdsrC35bc/NDPuETAr6P7A7/AKtJ84zY91+7DL6HT3LfsSo5q5j2EFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkdHqUh31Pk94cngRA1WTBaJ1f/NJwpyuTv3GNSthr5pzzD6Db
	Azf3VxxgYnpYk62ALRlCpeTJzSj2ZkBPAi+t+ZE+wCTB+LSL48Hy5/VL
X-Gm-Gg: AeBDievMcsGF8QuHV/M4UcHhR50Ds/geJVxmjPGaSvC693U7gGeXYWD5krEFbZUprOT
	kHJVamcKaigSZdrCviohBRGPZI4Uf4EakLwFQyu6AaXYgQ5ESThgZrSFXRv+SF00MbnhRrXdPC5
	RHkWwTotTbZe5G4/gm9AQe35DLdXaJtCFWLdxGW/EsOZS/pvR/Fca0Gt0FNxpUxvbXogTwn4VYh
	DDOj7wu0n9V1aX7+dv5LORiFL2FSlVqstlFOZX8Q7H4+2WnV3nSGHpM81ukeF9MJNl/+qWFPkTy
	xqeZnKNTbon9x4Nqi+SpV5RigJoQ6KvxnrvIHPrxiguV3e/rsCz/I97WFMI5Ds9SVa48unqURM1
	GPu3MqVQB+fZJaAjl0v4CNc35RhlnLpKHglw7qqy+hi+aU9Hqy6AYmjbxMwB5MI3cKERvftAk8k
	nISmkr6i3EsEGIyx8ruOXRbq2Xhc92ag8C5bT07fig/lFJZye8DiDPs8ahsNkmWkAMLsh1p/JTt
	h7+Sfam9h79
X-Received: by 2002:a05:7300:7fa2:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-2efbaa9db2amr4361109eec.32.1777934425254;
        Mon, 04 May 2026 15:40:25 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bb60811sm17636248eec.24.2026.05.04.15.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 15:40:24 -0700 (PDT)
Message-ID: <0b52cd6d-8845-4591-9b5b-0e3b97221c80@gmail.com>
Date: Mon, 4 May 2026 19:40:17 -0300
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] firmware_loader: Add cancel helper for async
 requests
To: Takashi Iwai <tiwai@suse.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
 <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-1-8d9f873b97bd@gmail.com>
 <871pfrxkmj.wl-tiwai@suse.de>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <871pfrxkmj.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iUt5MEuhmb6OXhDNeLznijJx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iUt5MEuhmb6OXhDNeLznijJx
Content-Type: multipart/mixed; boundary="------------WwOXLcl06XP6tUs7vz394GjH";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Message-ID: <0b52cd6d-8845-4591-9b5b-0e3b97221c80@gmail.com>
Subject: Re: [PATCH v3 1/2] firmware_loader: Add cancel helper for async
 requests
References: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
 <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-1-8d9f873b97bd@gmail.com>
 <871pfrxkmj.wl-tiwai@suse.de>
In-Reply-To: <871pfrxkmj.wl-tiwai@suse.de>
Autocrypt-Gossip: addr=perex@perex.cz; keydata=
 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

--------------WwOXLcl06XP6tUs7vz394GjH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/4/26 12:25, Takashi Iwai wrote:
> On Fri, 01 May 2026 12:22:12 +0200,
> C=C3=A1ssio Gabriel wrote:
>> +static void firmware_work_free(struct firmware_work *fw_work)
>> +{
>> +	put_device(fw_work->device); /* taken in request_firmware_nowait() *=
/
>> +	module_put(fw_work->module);
>> +	kfree_const(fw_work->name);
>> +}
>> +
>>  static void request_firmware_work_func(struct work_struct *work)
>>  {
>>  	struct firmware_work *fw_work;
>>  	const struct firmware *fw;
>> +	unsigned long flags;
>> =20
>>  	fw_work =3D container_of(work, struct firmware_work, work);
>> =20
>>  	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
>>  			  fw_work->opt_flags);
>>  	fw_work->cont(fw, fw_work->context);
>> -	put_device(fw_work->device); /* taken in request_firmware_nowait() *=
/
>> =20
>> -	module_put(fw_work->module);
>> -	kfree_const(fw_work->name);
>> -	kfree(fw_work);
>> +	spin_lock_irqsave(&firmware_work_lock, flags);
>=20
> This is a sleepable context, so you can use spin_lock_irq().

Thanks, I'll fold those in v4.

>=20
>> +	if (!list_empty(&fw_work->list)) {
>> +		list_del_init(&fw_work->list);
>> +		spin_unlock_irqrestore(&firmware_work_lock, flags);
>> +		firmware_work_free(fw_work);
>> +		kfree(fw_work);
>=20
> Can kfree(fw_work) be in firmware_work_free(), too?  All callers free
> it in anyway.

The worker and cancel paths are both sleepable contexts, so we can switch=
 those
two sites from spin_lock_irqsave() to spin_lock_irq().

I think we need to keep irqsave in _request_firmware_nowait(), since that=
 path
still supports GFP_ATOMIC callers and should not assume IRQs are enabled.=


>=20
> (snip)
>> +void request_firmware_nowait_cancel(struct device *device, void *cont=
ext,
>> +				    void (*cont)(const struct firmware *fw,
>> +						 void *context))
>> +{
>> +	struct firmware_work *fw_work =3D NULL;
>> +	struct firmware_work *tmp;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&firmware_work_lock, flags);
>=20
> Here you can use spin_lock_irq() as well.

Thanks, I'll change it in v4.

We can also move kfree(fw_work) into firmware_work_free(), since the succ=
essful
completion and cancel paths both free the object after releasing the devi=
ce,
module and firmware-name references.
=20
> thanks,
>=20
> Takashi

Thanks,
C=C3=A1ssio

--------------WwOXLcl06XP6tUs7vz394GjH--

--------------iUt5MEuhmb6OXhDNeLznijJx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCafkgUgUDAAAAAAAKCRDQXT8aWv/ug0wh
AQCvNSrFEuyv65YBjhmuNlt+EUnhgQRb01N8wKDW21JL6gD+OPBeif+WJvgkS9BmUxkKEh3smoKF
WF2wb96tbDdFSQM=
=H1yK
-----END PGP SIGNATURE-----

--------------iUt5MEuhmb6OXhDNeLznijJx--
