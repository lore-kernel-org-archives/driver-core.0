Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2E598C1E;
	Tue,  8 Sep 2026 19:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894451; cv=none; b=OUgeX7ESh7z0l5ktjVa0EutBEzPOWBeKWItjHcVCZj0hYKi5UWRMJ66YDEB4ks2SFWQ1SLXPJgZxKAv97QecvD4kkDq0Bsv7wHGptzvgQKxmNz6XvTGJxErJn4thrlYV14kkHx+V2XZhDoSv23mUtMgdThoA6AcvNKGX4mUHy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894451; c=relaxed/simple;
	bh=uLvbxZ7YVcZVcQ6wmrZ2BA7TSPcz9JWmWdW1fPfs/fs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NgmmJbf1ur7Yfa83I+D8BDFj3jmmf5Tdap+s/cs5KPWHi9nLfF2LkzSFEGDXkHORxubMACZRWO7H4x2iP0JLjK08cXBdW93V/YZ8rjS22ScktDCcYI/1En5hvZeu2gv/o1k5Ohqrs4YCkqbgpk2pPqOLfujXVOQ2aExjHgTzMdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lg2NHhD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lg2NHhD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8372B1F00A3A;
	Tue,  8 Sep 2026 19:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894450;
	bh=cO5Mi3p1urFAKc+cA2bD/cPNMzmhAyvnIzzxrQNglxA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Lg2NHhD6neVhV82vVaR7lLfBFa8WHIxZR9uynhK/5byOKCIOqPijM3bWOWb+9MQIm
	 xaUa4dExHpMGmirs4YNmCj0ll7AXqnJNvDX4LZnTBCUIh7d6zRFhr+WhaOFZoaDGqS
	 /6Ro5G6fQM2t+iiAXzLe7PfsfNfoG+ltac69QVwXmt9PoDXR/u7BvCeG8faTaTZQ9k
	 as0Y7upe3ExOPAFn6+qnMyLJT7v2itJCzxIdCrScHNXli3igwUdU826MrJYS/yESuA
	 WtLMgEusTFnOvs0wjIiFCvEx1gPquFr5wV6x7DVWYD8INOOKid+GsdvbvprOZNIHL2
	 /RMKBpQJiS6FQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 21:07:27 +0200
Message-Id: <DLA65O7OWMD3.PSUP4Y4DE2VG@kernel.org>
Subject: Re: [PATCH 1/3] w1: use match() callback instead of hardwiring
 dev->driver
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260820225430.1847356-1-dakr@kernel.org>
 <2083d2e3-9e59-4c70-a79c-d8133316769f@kernel.org>
In-Reply-To: <2083d2e3-9e59-4c70-a79c-d8133316769f@kernel.org>

On Tue Sep 8, 2026 at 4:49 PM CEST, Krzysztof Kozlowski wrote:
> On 21/08/2026 00:54, Danilo Krummrich wrote:
>>  static const struct bus_type w1_bus_type =3D {
>>  	.name =3D "w1",
>> +	.match =3D w1_match,
>>  	.uevent =3D w1_uevent,
>>  };
>> =20
>>  struct device_driver w1_master_driver =3D {
>>  	.name =3D "w1_master_driver",
>>  	.bus =3D &w1_bus_type,
>> -	.probe =3D w1_master_probe,
>>  };
>> =20
>>  struct device w1_master_device =3D {
>>  	.parent =3D NULL,
>>  	.bus =3D &w1_bus_type,
>> +	.type =3D &w1_master_device_type,
>>  	.init_name =3D "w1 bus master",
>> -	.driver =3D &w1_master_driver,
>>  	.release =3D &w1_master_release
>>  };
>> =20
>> @@ -195,8 +208,8 @@ static struct device_driver w1_slave_driver =3D {
>>  struct device w1_slave_device =3D {
>>  	.parent =3D NULL,
>>  	.bus =3D &w1_bus_type,
>> +	.type =3D &w1_slave_device_type,
>
> This code is disabled, so probably should be cleaned up before we start
> improving it.

Maybe? I don't know if it was left there intentionally. So I just adjusted =
it
conservatively, as it's also technically unrelated.

If it wasn't left there on purpose, I can add a preceding patch to remove i=
t.
