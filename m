Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97130C37E
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774124773; cv=none; b=U+/C7JAo3jJNKGyGHalGIXayEqnd0U5GJ63ye+ejG3/kUhkW/HAbsPRFlZ1JMbH2E21b3slaSma5mo6uZegaZA6r78bDNZ7PJqIk1Pt5Hi8cy2ERiBoUPJI1pnXx/YEmH1oRMI+Y9a0OhbN/T+lwdDKyt8PmQJlGJ5CfB6IQsvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774124773; c=relaxed/simple;
	bh=obKTfvDrPHUMXXc31QDvrq9BpeYWv4/jr2p7QImX12Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject; b=lpWfV57bKh/gKaCAwTcA0XjiBt9S2902Fm+xPBfBMCPsFOdfexGQPNGGt3SJQhoKhfWNX5qrcqdtxSHicFCx7mbxrCPEgx9oy7fGcWmwgvivvSSTj93PhIAcquPx1GjuVBScozybtuOJzDGGHjeFE+lT4F47APeLh9Rlg0ZdikM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkwb1Tka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkwb1Tka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0CFC19421;
	Sat, 21 Mar 2026 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774124773;
	bh=obKTfvDrPHUMXXc31QDvrq9BpeYWv4/jr2p7QImX12Q=;
	h=Date:Cc:To:From:Subject:From;
	b=hkwb1TkaXAMWGVFZPx355PaFnjiieQj6ZaybvebJ0I+wvQpvJcLQAarwG/wqw+qjL
	 Kyc6N7w5Z4zZCifhjDuEz71tbxAPzoXgfGoI4J2leknJVbORgYLNQzQqs/P7gSfHrT
	 tWD1KCTwPY54jSCsFORG2i81h7lnSNdNm0wLUbAQ/RD1vCGsGMw4pAjV7n/PIcND72
	 M4NtlpLoc44imnpb1Qs5agQP0/qvYGMdwRITB/6BxyXOvlmf+SpAnYrMZvR36DhDqT
	 8mzTPNOHCi5mUaFd6/Rgz/0dAXJQ2vWZ2OX66DJvNaGvNv7yLIrXYDbEfFJKKkgNea
	 zn9g0X+Vx8c7g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 21:26:10 +0100
Message-Id: <DH8QQS82HLSS.2ZHNTN0U14A2E@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>
To: "Roman Gushchin" <roman.gushchin@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Sashiko for driver-core
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Roman,

I've been adopting agentic tools for catching issues for quite a while, wit=
h
pretty good results -- better results than I've seen from the patch review =
bots
I've been running into so far.

I've going through a couple of patch sets in [1] and it performs impressive=
ly
well!

Any chance we can get the driver-core mailing list added?

Thanks,
Danilo

[1] https://sashiko.dev/#/?list=3Dorg.kernel.vger.linux-kernel
