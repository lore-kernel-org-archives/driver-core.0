Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB202DF156
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858757; cv=pass; b=F0Jgruh+hyAkvzFc7gACdz0LkmZ/pIqM0oHA4ZSCx72y+BmK/Uy7pr0FPO5VRaaP46o5ALiI+XwwO02OUsI63PQRT8iK67gGq9LJT/XznJyQLGakaQF0Wud4p7iYzIWQKZkL9HboAskZxdcKxXKBS1Cc4NccrEpb8FPx7g9dlhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858757; c=relaxed/simple;
	bh=MD0U4lj9oNt3HXVVb4B0anm66u4zECKkhBtjzWGEK1Y=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oEWwxEI3dEflWzEQBrVwuyLKs4CstYIegBYEtyYux9Z6acQ5ovy0GfqiNPgBdAchkRl5OtNZOKHzqMgVbYgHye3cXEF54auxalwALsAQCL3IjVi4WdeXjnIWSOddWqjC4YPp7eACBr2E88U3QX9BhFMkxpaTdxeBGxjTTcSqF7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CwnZBoV1; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CwnZBoV1"
ARC-Seal: i=1; a=rsa-sha256; t=1787858740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ON4GMAIzJLkuhoPCmJWZWsyHLf1kKGgAsrqLmxkLGW/SUtCJvp3/v56ELvAaCMEkQYsazpzhuQQwlytZZUELopxgr0Tjhn95t++shAGJEWMhjMREdc9231Eb1yD7FC0J8Oipi1tHsj4zHKVft7YNF8SYYos0kqA8Q85IskJBq8s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787858740; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZLr1JZ2GZVmAHXXv6XJXbxnlozOQn31bgu1ukaX6T64=; 
	b=njqc0n2HLnBIePVAPPNdMVSP5MekE4bWK499+A2NkWXfBWpBn/HwjLb8OFz0mBAkHPj3VNpCxUwBshh7ogodpFUXG6A5BQcBFgij6AhUzTpKdkOZwiA7sB5Mg9vgMjqXnkpohMijQCeOrotiuDaBlUGLhWTuD80MYCknbl9GuhY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787858740;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=ZLr1JZ2GZVmAHXXv6XJXbxnlozOQn31bgu1ukaX6T64=;
	b=CwnZBoV12CT3JZdWeZyCNi+iK2yNi39Iuez81ZWfwL4Uhp1oBFelrwTBjQ68juS/
	VGgsoCah3ngwhKe0Vq9bxjW+ITNIRePY+7AdKhKN2V3aRYOkaYaEhkcMJXcadjJqmG1
	6uFh8IrLf1fou/vw4Ac48OFX4Ol3hzTWlXQkykFE=
Received: by mx.zohomail.com with SMTPS id 1787858739164639.6405180160978;
	Thu, 27 Aug 2026 12:25:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 4/6] rust: workqueue: add creation of workqueues
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DKJ2MYL3TYVB.3K1LIVYMLX0SV@kernel.org>
Date: Thu, 27 Aug 2026 16:25:21 -0300
Cc: tj@kernel.org,
 jiangshanlai@gmail.com,
 aliceryhl@google.com,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 acourbot@nvidia.com,
 work@onurozkan.dev,
 jhubbard@nvidia.com,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <60BBDCE8-195D-4D64-814F-28863A547964@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-5-dakr@kernel.org>
 <DKJ2MYL3TYVB.3K1LIVYMLX0SV@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 7 Aug 2026, at 19:39, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Fri Aug 7, 2026 at 6:52 PM CEST, Danilo Krummrich wrote:
>>  * new_power_efficient(): WQ_UNBOUND | WQ_POWER_EFFICIENT, add
>>    .percpu(),
>=20
> [...]
>=20
>> +    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
>> +        Builder {
>> +            flags: bindings::wq_flags_WQ_UNBOUND | =
bindings::wq_flags_WQ_POWER_EFFICIENT,
>=20
> I actually meant to add WQ_PERCPU, which should be the default for
> WQ_POWER_EFFICIENT, in order to avoid the warning below.
>=20
> But I somehow managed to fix it the wrong way around and made =
WQ_UNBOUND the
> default.
>=20
> So, this should just be bindings::wq_flags_WQ_PERCPU |
> bindings::wq_flags_WQ_POWER_EFFICIENT.
>=20

It seems that if you make this change, then
Builder<TypePowerEfficient>::percpu() doesn=E2=80=99t do anything =
anymore, IIUC?
Perhaps it should be removed then?


