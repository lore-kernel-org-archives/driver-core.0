Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5EC34D926;
	Wed, 29 Apr 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476545; cv=none; b=oqj50zBfgGjvAn0NCp8oh4KTm6T0tV29i4sznyINMI42YIZFlHTWQ5N4f/ABJuj5GiMceREnwyTMRlLGa0pYwHnflpDU34fsVMO75eQyk5csMWmJH0rAamicd49SQoG/uPmHRNTC+9GKxbeWg8mCeX3pqh4t8gIlqgfm5tx76+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476545; c=relaxed/simple;
	bh=YeTMeJkDmWUV9scj0Qx6X9iodupxXx8OHcr5NE4U4k0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=lajSLJGUH4xlGu8qamlVC/tH14kgAlre0P2HapGh2wXzk/VhIr8fe/ATzLae008HebN7LKpn3pPqDwlwkfSSh3jG7ERIDsUCICLfLMo68oFchtodd0Pjvldzn4DwqviDlp7ZAEsNKkdRuR1Vfj4vvVzSJGSWpGyQt0jk/995Mv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikpIL1yd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikpIL1yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DBEC19425;
	Wed, 29 Apr 2026 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777476544;
	bh=YeTMeJkDmWUV9scj0Qx6X9iodupxXx8OHcr5NE4U4k0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=ikpIL1yd5tWJdLYpskJKgadcmn2FD5F2fw2zXb5UuS736kISuW73HET7FHgtI77NL
	 Rw2IJn1/khRA7OD5G0aIXdj1JyQT3LpQe37+4xE98NwYgkL1fV8ysBdzFJUebUoWdQ
	 PJCmmy4k9GNJU3BjNfH9+gWnXttYXah5TZUR5EeDgJdInwB278qIacudUfQ7UZHmbK
	 MmuN8fE+v5nDkk6i5+RhbaaALBGBAOTNkfCIG8UYFFHBoSDHwtK26ALmu1SfAqMCW8
	 XF8zLc65mueePNWKfejfb1MOZz8dCYpSxaYYaLNq4bm0pCX/vgwgL9+5K6ShkZIMaS
	 oWYj9jlqurizA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 17:29:02 +0200
Message-Id: <DI5QUINEJC6U.32I161SD0KU76@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: reject devices with unregistered buses
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
References: <20260427102852.2174-1-johan@kernel.org>
 <DI50WG9XK1I4.1R6DXSZSWFRDC@kernel.org>
 <afHZWasOhRaeBCnt@hovoldconsulting.com>
 <DI5LDIQW45PE.LPIWCARJV7WC@kernel.org>
 <afHsgv9SUqfn-G1x@hovoldconsulting.com>
 <DI5Q29QMNVNH.1B2N4VBA2ZVQW@kernel.org>
 <afIe495IbAe7EeDt@hovoldconsulting.com>
In-Reply-To: <afIe495IbAe7EeDt@hovoldconsulting.com>

On Wed Apr 29, 2026 at 5:08 PM CEST, Johan Hovold wrote:
> No, I'm saying that it's a bug in driver core to silently treat a device
> that is registered before its bus as a bus-less device.

This is an argument that I can buy into, but in the previous discussion (an=
d in
the commit message) the whole motivation evolved around "reject devices wit=
h
unregistered buses to catch any callers that get the ordering wrong", i.e. =
catch
other people's bugs.

What you are raising now is "the driver core is conflating no bus with
unregistered bus handling". However, the commit message does not reflect th=
at at
all.

Can you please adjust the commit message accordingly?

(As for the stable question, I don't think this changes anything though.)
