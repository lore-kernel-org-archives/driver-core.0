Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1FB361DA6
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783875286; cv=none; b=gHhFuhOW69aTTuUhq/Pim0TbSNgf/RAlrx+/kFIQjwVIhswtpwLScvNrmVjI7riVvOZ2tcRs5fpgisXt+t9pI4BCDIUyxfF8aovomlKHJTCxJd2fgKG8J69af3fEtZ0ws/HRN8i6ersnGjjO1ML71lKfBVfUXV5+nk5bXXMDknY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783875286; c=relaxed/simple;
	bh=6ICRJq5d94cilGosBUqVJq/dK5P/rem/afsU/T3MRo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p1ugXYJKYs5U7h2GJ5iT6UCpjYNUXqzRvMIJUzOJQV4LpahuPAHguFWW81qW60Q2mH2s7jfGG/mix/9YFA3oDcFq9pnUuVgcnBgC6pWSjIak9Rt8ky/GIQKA9H2NRuV3PMbVtHthYMjH4g6+6zQcoeWSaQVDFLY54eLLdekGFtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=J/wlXhzs; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="J/wlXhzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1783875255; x=1784480055; i=markus.elfring@web.de;
	bh=6ICRJq5d94cilGosBUqVJq/dK5P/rem/afsU/T3MRo8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J/wlXhzsU+v/NF/qJuoZtOs9NuJovk91K44cCm8Q7roDbF5pWIeqZRCmHleyrO7A
	 tslr8inw37JN5HWVqpsDINJ0Mj+O+4zeqGy/94J71uyJhvu7t8cPhJvkME0ZA4WsH
	 iyCA3QfU3DSK6qz2W7CfMklhR2cTJt8yjMR67liuiW3e8iIi2aAXH49mZ7pBC6NYd
	 KPdh7JkSltXeKCRun+H+t0CdN/nXvoDvIFFL09SBxHD/dZyfd57AdGiUAy6hcZX9x
	 Dut+XXROqSp3qGYEIGVwY5rD14PnDGMCEhvXaeRl/dT9WftXzgIzBXFkKOa6SrFaZ
	 YPVSu166pSndGj4ciA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MidHP-1xDu8e2cCd-00n609; Sun, 12
 Jul 2026 18:54:15 +0200
Message-ID: <16f32db1-03da-47be-ae6f-54304199a3f4@web.de>
Date: Sun, 12 Jul 2026 18:54:13 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: driver core: faux: Move a variable assignment behind a condition
 check in faux_device_destroy()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 driver-core@lists.linux.dev
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lyude Paul <lyude@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Zijun Hu <quic_zijuhu@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <1fe66c80-dfa5-4ef1-aec0-8f7fc3f2fe21@web.de>
 <2026071217-fruit-uphill-eb0d@gregkh>
 <d96e797a-2d06-42e0-a3de-972b4f71a5ef@web.de>
 <2026071222-barracuda-applause-51e8@gregkh>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2026071222-barracuda-applause-51e8@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:olleNfF6K8vhochbix2eBQO5Y8PMJznypbkdXn/qkQwr2scQR+N
 p1N89BuX90BdA8ze3d4y21qED1Ts8UoinYuKPaM0e8bd18RV8yPE7hMcdTPVQErFSBO34tn
 DEHc9ejthbogY9fXUUJwyre0BFIkJTv5izxB/2n9e3aY7Kvx/IfMutxncUDrxxtQpD2HRvd
 PXMVL4lktk6FQNFn/QlBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yUq3bJP2BNc=;HT6wNr7FhtrjmqfYERTzmzBNZIp
 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

=E2=80=A6
>> Please take another look at related information sources.
>>
>> EXP34-C: Do not dereference null pointers
>> https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-sta=
ndard/rules/expressions-exp/exp34-c/
>>
>>
>> See also:
>> https://lore.kernel.org/kernel-janitors/d7a8e34b-e490-47fc-b892-886e1c7=
99c4f@web.de/
>> https://lkml.org/lkml/2026/7/2/2241
>=20
> Please see the places in the past where I have rejected this very patch.
> Nothing has changed since then.
Can involved special development views be resolved better by applying scop=
e-based resource management
for the affected function implementation?

Regards,
Markus
