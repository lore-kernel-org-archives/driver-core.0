Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131574;
	b=iNk5cbSbk3xhJEJhzT0n9RZ5diw4s2idAwF4Ymnv9kDrl8f2R8cKggKNbPrx7G1+EGIX
	 cpuQTqDmUz6dCAGSn01Fc+Y5M/9jOoTQqh8f5x8aWvDwf/jZXI0VDJ8c5bwdC4PfMK/dB
	 8xBTwW/sxEESGw6nzaen5H93WLrxdtcQMY0a0Oc7dOptNcaNv9nTvRvfdzPYPLvAnDBGa
	 MAp87kTICTUbAMJ3lJ+7L+TBJKo7u/au6cf8S7vfXVCPhnkklXbWooHBCXNNi188GbsMP
	 R75UDsqNeV/YsCsMOI770Uxv9Fbqd92f7ZQyVEfwMHRbGluEkkYeq0O9i2ChbpVJPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131574;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=cI7neNdWWYht8R2pRpPC6a7OtjZ1bTsM5Lm87GMQJ8Q=;
	b=5RdrhFYS1Lg1N7Sq5MvDkJF8cwDPW3rPHmXPE4wIwZLNXbg/IWfSD6BEPOOJafrXe8yn
	 smPR8BhpQPxhC5TxC9ZN42NCQYxBCtHF0+COhFKot5WcTet63EsXuO+m5IxMnGB2pZaqd
	 c5GgPJr+Xl0gh26bPA4u5XxPwqGDnLpOexKzKWwAcLx6qVu8vopBFJJ3dPC5JKJMqP7WZ
	 2X87BGpZy2TQRBUbCFK5Ii6p83o6qfk08ukPjRDDCIpLO4PLGbwoIFSaNBvr9De4nedFR
	 Lyk0A05p0qchC4dw0A4WTESv7JVAMNiNG3j5TeyZ9okQLgPJwjXoB6ZXsWGy1IexzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agmQRaBl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48AE606A326
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 23:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agmQRaBl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E111F000C4;
	Thu, 19 Nov 2026 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795131574;
	bh=cI7neNdWWYht8R2pRpPC6a7OtjZ1bTsM5Lm87GMQJ8Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=agmQRaBlnRQz+4i2K34hHiWFet3cqNaGy+rIIuGNDMQyS6CCXYGX4f48su1vNmqTH
	 lcWPu/37Ig2eOx3MisZbCN8uOn0eYQYK4As+PXpuBL8RPb6yhiBgIkTN7uCe9ip4RD
	 ASwPDmxcgqVeGE0ekThVF+/G3URZLtIhCnE01BUQnMutEtMI5kKzV5e7CTMmgt3XiG
	 u0iTgpes0A5UD9jLbGmE8Vtzf57UKmzeCEDWgFyTnRK7ooazfern61n/++lcQ4djh7
	 37YrgNelUeFr05yRxj5FJ4ooavph5VVbSDca7+8KQ48JgRk+pTQJN2O7Y7mXrCIU1n
	 8BVcyjloWlN2w==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 00:39:31 +0100
Message-Id: <DMZL176U197K.X7ODAO4CRAOY@kernel.org>
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "bartosz.golaszewski@oss.qualcomm.com"
 <bartosz.golaszewski@oss.qualcomm.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
 <av9hGMZz0SZyxCQR@ashevche-desk.local>
 <c45020ffef39314cee4093ba54e6ce7e0b1b187a.camel@intel.com>
In-Reply-To: <c45020ffef39314cee4093ba54e6ce7e0b1b187a.camel@intel.com>

On Thu Nov 19, 2026 at 11:37 PM CET, Stuart Summers wrote:
> On Thu, 2026-11-19 at 22:50 +0200, Andy Shevchenko wrote:
>> On Wed, Nov 18, 2026 at 10:30:23PM +0000, Stuart Summers wrote:
>> > Cover the pattern used by drm/xe + i2c-designware, where a software
>> > node
>> > assigned as a platform device's primary firmware node is handed to
>> > a
>> > second device via device_set_node(), and make sure removing that
>> > second
>> > device leaves the owner's node intact.
>> >=20
>> > A potential fix for this issue in the drm/xe driver is being
>> > discussed
>> > in [1].
>> >=20
>> > The signature in this case looks like this:
>>=20
>> > Oops: general protection fault, probably for non-canonical address
>> > 0x6b6b6b6b6b6b6b73
>>=20
>> This probably was a single line, make it so in the commit message
>> despite its
>> length.
>
> Thanks for the review! Would you like me to fix that up and resend?
> I'll likely need help merging so is this something that can be fixed up
> as part of the merge?

This can be fixed up on apply.

Did you check the Sashiko feedback?
