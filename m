Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B361E3B38A9
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064427; cv=none; b=dCmTIoCea49YMIrr30wFYklqoioUan3pTti4/SzD+T3cT5k6/DXgODSpLkRuGn8CT6C+3eQZ5QzzKw9j+aoIL1h3BtNuVZI3my0nbuG0PQbhvxrxD5/L+fJrDix5zp+BC/PY1qCn0Lndv7pa7mDqglcB3zIHZOel/RCV5n9pU1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064427; c=relaxed/simple;
	bh=cB4FZPFGZEQzYGYS86n3W200daWOvuyV72CbgzKsGHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 In-Reply-To:References; b=Cq8UCXLWEJSUWQZ3jswrXgBUbfOCHgIpD7SIV87ZxcloviuqB3GDLUSXSgTw6VP+lJc4BL+POH1fCcwpnbRAzksnvt+JM1RPwHPlql2jr0MWyfA4Qv0+TaAoFUZmyWpMsiYG6zDgVhyc3AowLLsLvoM70K6CfxJbyz30eEzeCBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Lvf9EUVm; arc=none smtp.client-ip=95.215.58.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Lvf9EUVm"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=cB4FZPFGZEQzYGYS86n3W200daWOvuyV72CbgzKsGHs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790064415; v=1; x=1790669215;
 b=Lvf9EUVmJhdRZQobQnfL0Rkgf4hnI5XohrOcCJbxr3bYMcUxXocm+zICEyADiWWJICZYnpcc
 t+DfaU8uJP/oIdb9FQJzIoELY3aURKIi2NEu9hASzWjqRXz079D5QULozg59Glblsfx5wtqEybb
 ZvlxYpHK12DA6kNqK1pVfESo=
X-Envelope-To: driver-core@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 426168b88e5d5557;
	Tue, 22 Sep 2026 08:06:55 +0000
X-Mizu-Trace-ID: 426168b88e5d5557
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 22 Sep 2026 16:06:50 +0800
Message-Id: <DLLOVHIKRXPY.3AGBAPAM8F9WV@linux.dev>
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Sudeep Holla" <sudeep.holla@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon"
 <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.dev>
Subject: Re: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
In-Reply-To: <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
 <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev>
 <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla>
Content-Transfer-Encoding: 7bit

--2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> Where is the associated bindings ? Am I missing to check it in the series
> or it is really missing ? It is essential to add any code using the bindi=
ng.

I left the binding out to get initial feedback on the topology model,
but I agree it should be available for review alongside the code.

The cpu-map binding lives in dt-schema. I have now opened a draft PR [1]
with the proposed dieN hierarchy. The PR also links back to this kernel
series.

> Also how does it align with ACPI implementation ? It is preferred to be
> in parity here, so we need some binding there as well IMHO.

This series does not implement ACPI die discovery and leaves die_id at
-1 on that path. I agree that DT and ACPI should describe the same
topology model.

RISC-V does not define topology fields in hart IDs. PPTT can describe
intermediate processor hierarchy nodes, but I could not find an explicit
die indicator in the ACPI 6.6 processor-node flags. Is there an existing
PPTT convention for identifying die boundaries that we should follow?

Would it be acceptable to add DT support first, keeping ACPI die IDs
unknown until that mapping is agreed, or should the ACPI mapping be
defined as part of this RFC?

Link: https://github.com/devicetree-org/dt-schema/pull/208 [1].

--=20
Troy Mitchell

--2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarI3GiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/dtgEAw8G9zoZFaHkE
oAhSnQKlX8ec/LwA/1LdZjuOaqjDmOsBAIqD7X1Vd3GQdkDDrnwDkXKuMRP0FRGz
9ZibisfJBz8N
=lRK8
-----END PGP SIGNATURE-----

--2e2b99b56de2a9e6360ff5979e30d653e8172a1b1e603da005f3ee51c34d--
