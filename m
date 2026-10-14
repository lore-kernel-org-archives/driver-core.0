Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FF31D72E;
	Wed, 14 Oct 2026 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019512; cv=none; b=O8QCR5VQnhMuObnQDgpIicl8T7qv85MPDV/6BC1PcX7oLzwccJ1FuDkuBy9JON1u8C6DjPPhSoJQbnL4thLFJ1tkad9UnUdTyJArH968A4lP0h4b7ixMr2AHEHYjCFOBYlm2xu1iQc77dTPUQLv4MxGk2JT8X/52MUnxm/x1zDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019512; c=relaxed/simple;
	bh=8ZVSWZ5FsR/kjQp5bvgvNPAQkbCN2mu4lnjorNFP8w0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=LFu/3TQmI+sdVqum1ktsbRfaYRaASFFvmP/OKnNsSi9NKVp/dyoGu5mFL7Bj7uZoU9XKGNhT5/+l+STdUOKU1EhjBpvRJFjryLuSsw4wTbT2ZTtQOzhV2mvlEDpuJmy2psHBQk0gWDyplxTUpsEKNGL6XrP4lkE9+7JYgP3RBts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/e0cfkN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/e0cfkN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9261F000C4;
	Wed, 14 Oct 2026 23:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792019511;
	bh=8ZVSWZ5FsR/kjQp5bvgvNPAQkbCN2mu4lnjorNFP8w0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=n/e0cfkNSVxufv5iwKzGadMRbpKTnolNO0u3RwpJOng0koL2Lc5UOu0+6y8wtZh+1
	 0RBS4g4IfUrMueK2Bor/3qW19wGvrOXPSbWW34m4XlqZwVyMiMww0q6iAon/Zmd0dD
	 tiGnj3fCyGCIm+g9b83Sqr5FLNOQEyiB44suL3npx2UJ55SOp+IRRfFm/krS3CvE/0
	 BReknBtIlIm2LOc+9hpYx7F4dV2qXy7Soi0aohpu+q2rnw+XRnnv2z9Z/VKAbqjZKH
	 PSdXWPP9eoqg/EH7aSqRPH9tgYuEcbqkgwA7mSBHLcgPvZv+XCyqCok5Pqa04BGafn
	 ahuLorhF2L4wg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 01:11:47 +0200
Message-Id: <DM4XWCTH7UBK.3HO753UD4MCRY@kernel.org>
Subject: Re: [PATCH v2 0/3] driver core: parent lock fixes
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Alan
 Stern" <stern@rowland.harvard.edu>, "Mario Peter"
 <mario.peter@leica-geosystems.com>, <driver-core@lists.linux.dev>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261014133109.1392265-1-johan@kernel.org>
In-Reply-To: <20261014133109.1392265-1-johan@kernel.org>

On Wed Oct 14, 2026 at 3:31 PM CEST, Johan Hovold wrote:
> Mario Peter reported that USB interfaces may be probed without holding
> the parent USB device lock during asynchronous and deferred probe.
>
> This series addresses both cases, while fixing a long-standing
> use-after-free issue with the parent lock implementation stemming from
> the fact that the driver core does not necessarily hold a reference to
> the parent device when taking its lock.

I've picked those fixes up, as I think it would be good to still land them =
for
v7.4-rc1. (I might send them as a second PR in the middle of the merge wind=
ow
though.)

Please let me know in case you have any concerns.

Thanks,
Danilo
