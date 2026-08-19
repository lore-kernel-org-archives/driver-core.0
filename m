Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964D835C1A1
	for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 21:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173993; cv=none; b=sfBjztR47Pfjv2/HD3vGJu8YIvL3HITdmDyVrC/sTqa474WJyq+qVxB2nTSimShFPgA+scF0Q8AGqhcBE87siAceDcnVggZrOzlShsSrBd77dUbyfeITa98odsByDVLroHyhJy+jkgNiCBqnxHdkV4a+F2ZmTBVWLgMfrxTNL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173993; c=relaxed/simple;
	bh=ep9rmA0F3JHcplJs4RoJHxews0NkNYZRYczOwHS6I78=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Njb4uSmey1lJjTLLtzShc2qm8EG9TqzcXwy8qliw4v2D2oJhLyY961BYxk/JPdhZxtFam3Jj3oP67X05OAaj10vgy4JN8b43VmrNtJuLudERgidg/CJNqRhp89E1Fyz+fTzt8pxqNdGYDnvjXunfpYTYyj2lGP8LXOKhCUT+Dsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bty0tXj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bty0tXj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2861F000E9;
	Wed, 19 Aug 2026 21:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787173992;
	bh=ep9rmA0F3JHcplJs4RoJHxews0NkNYZRYczOwHS6I78=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Bty0tXj0ll2SFD3RQh0vOz9z2CNn5LRK2ZQIC6tX85AyA6fHCdP3GU9hdJ+RnRmBO
	 9pJR6yPp6n1fihloU2LjCpAnR7vSyNQzhi7ht4us7o478reIW+V0e5gthPgtsC4XVn
	 mfs0tssB5Z5W6KlrH2QMTwKt4Y1k/tpSAInpK9YnAXvlgWiRE7WpESz6JT4UEYM993
	 X2yCLC0mHUPSw/WfUQvLxVcyF5qF6b8V4SdFR84Ywi2nGnkop7aKrTQcn0UF+2n6xb
	 Co2iWHV097W5nP1EzTrRk8u0vMG8RkbZ6qYAzYBFF5jgOqVQRQVrus/orjb1yE5wOF
	 RV0PzQ0E1/clw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 23:13:09 +0200
Message-Id: <DKT8B0Q4DI67.3W01EFAK765YU@kernel.org>
Cc: <mcgrof@kernel.org>, <driver-core@lists.linux.dev>
To: "Russ Weight" <russ.weight@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 0/3] Remove Russ Weight from kernel development files
References: <20260818194648.1014604-1-russ.weight@linux.dev>
In-Reply-To: <20260818194648.1014604-1-russ.weight@linux.dev>

On Tue Aug 18, 2026 at 9:46 PM CEST, Russ Weight wrote:
> Russ Weight is retired and is no longer actively participating in linux k=
ernel
> development.

Thanks for the kernel work over the years, Russ. Enjoy your retirement!

(I will pick up the series after the merge window.)
