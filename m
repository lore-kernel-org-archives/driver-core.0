Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B2B3EEAE5;
	Wed, 20 May 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288336; cv=none; b=gcnNUjqTEROk0O0AkLIJd3io/30K6HAhua1Xk++zcpkgG7WH9tTq04IsRedFKjLIlwDLEh94oNmEiJHW8dhfkzENmAiPm5aDff86R1aufdMbSEALOFROo1bQ5MGi5LVK0ICB956UDJ/kA6+y/myTc2bq3/TDjwHWensGPIVQ4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288336; c=relaxed/simple;
	bh=q928mIHuOSyZiUMnWyKbrWbp69BGUQ1T5Od8+pmy5vA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=iT21CZDsgQGX5vjHgyUVdXh56Tz2GQm48ReEqO2mDFSQaK3izAn+CkwnUWvVNtAgnYDCRb4uI0jIP/cAq4Va1hXFPvoW1yI0bHMczVX+OzDgEQYjPc8dXri/2RoY9xlxSj31SCE47Zyc91z0GDULdB3btOExAdaUvxGIywlFKc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2wvwg9v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2wvwg9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D535D1F000E9;
	Wed, 20 May 2026 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288333;
	bh=w5Z74C3/Voz228AenWJUhW2uSRjmcsxtTqWJ135EKPk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=a2wvwg9vggHc4vwJ4oi+ZTqwrv0Dw69AEUpEuliImHK0SExiO1Uax/tbtNJpXBGwZ
	 b+56LPmqeqxoNbfOnOJg50cxEOoWwkSJYwe4Wz8l7ueRfZRYRT4tUMjYrz/jpKeIcy
	 n4CMgwopqdSli7rV9OxV3HUDQEYnVyAe880sMsglCu4WqijZznqQV7toqg7nMRwgav
	 iPsbdXjiVvj38ZayIpEI6Zh2yFC8rtC4LhZO6ji/KpHjxviqLuggO+PsTHMSARjZJL
	 7rDZ0zvM1BZM1uJYeUL+a5cW6NPjSzt3M2T90oAOCvIxJjfCSWjV5iqYe38Nrxu/1P
	 GNwaOD0CIZSPQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 16:45:30 +0200
Message-Id: <DINL2MQVAJUK.38K7BGL323D5U@kernel.org>
Subject: Re: [PATCH] sysfs: don't remove existing directory on update
 failure
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, "Rajat Jain" <rajatja@google.com>,
 "stable" <stable@kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <2026052003-uniquely-hastily-c093@gregkh>
In-Reply-To: <2026052003-uniquely-hastily-c093@gregkh>

On Wed May 20, 2026 at 3:05 PM CEST, Greg Kroah-Hartman wrote:
> When sysfs_update_group() is called for a named group and create_files()
> fails (e.g. -ENOMEM), internal_create_group() calls kernfs_remove(kn) on
> the group directory.  In the update path, kn was obtained via
> kernfs_find_and_get() and refers to a directory that already existed
> before this call.  Removing it silently destroys a sysfs group that the
> caller did not create.
>
> Only remove the directory if we created it ourselves.  On update failure
> the directory remains as it is left empty by remove_files() inside
> create_files(), but can be repopulated by a retry.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Rajat Jain <rajatja@google.com>
> Fixes: c855cf2759d2 ("sysfs: Fix internal_create_group() for named group =
updates")
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
