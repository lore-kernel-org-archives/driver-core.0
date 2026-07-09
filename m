Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAB93B14BE;
	Thu,  9 Jul 2026 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783638172; cv=none; b=X0bplram0o0IPFRfV3TXe0gLFT7/eR1/V1+JBTvyjWnRXj3O0QOVf/2kY2TvHACkd5CCUvX5pRhqsjHOmDFAchARio/Ocz/75SOr+2Vd9p7109TODPyzLaD8yKSp9Kui3NYRN7EKIea6yjaKZ82KTF34hcIFR/hRlGpB0I7L+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783638172; c=relaxed/simple;
	bh=aW4xO/VtBt5ehNOnabT456FsYWX8jMGGsgUpghX0eg8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=V54SIvR3V7eN8Log8WqfQxcE1K2UQ/NNvbm6hddv5GvGkNlUZBg2MvIywXcQeVXJ38DfqmLCI5paJ+bGSQZt4TpxXjTMIjYeJlxZ7PA+/HDX+1DSBOJj+4TyHAu2mS6+3HWH1es19BhzFvp23XXe4padxtWZMCY/HmAUC3vWjVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW3sKdFM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW3sKdFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D1C1F00A3A;
	Thu,  9 Jul 2026 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783638170;
	bh=crMUgsgGkKj7RzHC6egRmVfoE3eMawCinxf4FpCtf8w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=JW3sKdFMdIkwSQaBdqa1kYpsJ0O697HcEca3t2c8/4FCBal2dWsA1eGk+HfCSF1OK
	 nNRmolmpEQyzQbFq+Upz+E2eWh8w+ht2QGzF0YSBCe37TpwuYK60B30eX8fCMqql5P
	 4BhCzNRjx1n7lbCzLDRbpzvHSSDME+pG98q7rh8kmsBsuJKJ4MThAYUWMivXCqSkrZ
	 v8vd09moStOSTpjPZOY2Mhf3W/2ndsJxKPC1xBkOLR4wZpM3d2e7Pqf4GKag46n/Q/
	 3KK3QAw12rZ/zyuBdK14PhnjdR5pkq0DCplpJ9IJkl12kbN7fwtS0hoBE7xH0+RMVu
	 slgmzVMSoIxSA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 01:02:46 +0200
Message-Id: <DJUEYLRTNB69.M0HK3VUOOSSW@kernel.org>
Subject: Re: [PATCH v4 1/7] rust: firmware: add request_into_buf()
Cc: "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>, "Alexandre
 Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260709213915.520109-1-ttabi@nvidia.com>
 <20260709213915.520109-2-ttabi@nvidia.com>
 <3449b6a458c3c95041a51281ea4bca8964ee0dd6.camel@nvidia.com>
In-Reply-To: <3449b6a458c3c95041a51281ea4bca8964ee0dd6.camel@nvidia.com>

On Fri Jul 10, 2026 at 12:46 AM CEST, Timur Tabi wrote:
> On Thu, 2026-07-09 at 16:39 -0500, Timur Tabi wrote:
>> -=C2=A0=C2=A0=C2=A0 error::Error,
>> -=C2=A0=C2=A0=C2=A0 error::Result,
>> +=C2=A0=C2=A0=C2=A0 error::*,
>
> ...
>
>> +=C2=A0=C2=A0=C2=A0 if buf.is_empty() {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return Err(crate::error::cod=
e::EINVAL);
>> +=C2=A0=C2=A0=C2=A0 }
>
> Sorry, I just noticed that this is wrong.  I'll fix it in v5.

Please also drop the imports above and use prelude instead.
