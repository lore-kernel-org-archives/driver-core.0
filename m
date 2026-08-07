Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9D21D3F5
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786125606; cv=none; b=Eh1sclYNnP6g6DrgxE3p0JQEQKuMMiBBQ8D63ljilQpsxNS4AE/V41PM9tYCrX/H4EkzAGSW1guEuYKHv3O3gGl3le1chp8GCl91JiHdqp6HLQX+Wj8o7s67f+LHyUUvFKBSHjSWzgnHJGQ0JUexhidYpHixP3N2jN+lFWI4xHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786125606; c=relaxed/simple;
	bh=5e9qdLC6Xp5xVgN8GJUCOswnAQFaDJoHI+AtoDhWC1U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=cWhod5bsK12miVterMEvBRHv3qVbmmBBBN2u/IC5MuwBow3DmOlfaZwPrt6/Q+tCSqtr7H2Va5gUIm8EnWeDAs1ijrgyLDhaJeXCc4t6fAuRgjRd6NacnGezH/HvvjJhXIy8J1lKAlco9OtbmFOnd51ge5+pICfY6RfwNWvj0uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5DmpWSs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5DmpWSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EF01F00A3A;
	Fri,  7 Aug 2026 18:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786125604;
	bh=5e9qdLC6Xp5xVgN8GJUCOswnAQFaDJoHI+AtoDhWC1U=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=J5DmpWSscCZQlMrIT7CBMpCKqRZNVXbaStFFr78UA9h5mB/5EcvCeHGTN4zGl4EpG
	 D3qPhstye/hyR1yMLxHFpHK389ZQUqYH7tuxST2ZkgKX8TpEujAy5104V1r/sbjej2
	 PZCHv2M1kYcvS6FIHgqrfTyNXHcGIIla72jvNtdQrHZQ19Xy9qkOHNMB61DQErLUjx
	 THBZCqgAvsCq3P0pAR2d6ZNeMHmZr2nXE6SO3a/RvF1lh8ZmJl49CtemONPnXAAEB6
	 SXS8czWkxj5FHfCkcGZddljLJxWifr9tEVLakrQ0ZoGHxH5uZWgXwSMB85rG9MhoQm
	 rTTttJGmZFZLg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 20:00:02 +0200
Message-Id: <DKIWOM1S6PDN.3OWKELDD10SEQ@kernel.org>
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove Russ Weight from Firmware
 Loader
Cc: <mcgrof@kernel.org>, <driver-core@lists.linux.dev>
To: "Russ Weight" <russ.weight@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <5o4r7r76h4areyfolngggnzcd3msquwgubly6xjbz6zdvoha2i@doazljuavhgk> <DKI3CWI7Y5T1.2DS54JYTFSVSN@kernel.org> <4562w4kmilphdekvzkfqg7e2ncdznxqc5tgzqh7g4ed2a6ulzd@acimaw5bmozi>
In-Reply-To: <4562w4kmilphdekvzkfqg7e2ncdznxqc5tgzqh7g4ed2a6ulzd@acimaw5bmozi>

On Fri Aug 7, 2026 at 7:24 AM CEST, Russ Weight wrote:
> On Thu, Aug 06, 2026 at 09:01:12PM +0200, Danilo Krummrich wrote:
>> Hi Russ,
>>=20
>> On Thu Aug 6, 2026 at 7:19 PM CEST, Russ Weight wrote:
>> > Russ Weight is retired and is no longer actively participating in linu=
x
>> > kernel development. Remove him from the list of maintainers for FIRMWA=
RE
>> > LOADER.
>>=20
>> I think we should also add an entry to the CREDITS file. :)
>
> Thanks. I'll create an entry.
>
>>=20
>> Also, should we update the contact information in
>> Documentation/ABI/testing/sysfs-class-firmware?
>
> Who should I put for the new contact for these files? Should it be you?
> Or Luis? Or someone else?

Either sounds good to me.
