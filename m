Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E937EFE0;
	Mon,  6 Apr 2026 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775484917; cv=none; b=oE+d5Kl7DwZRvDWD02ROokVC3wJXFQqJlVpx4kVYvRni4ak7NhZVCzdpCx2gG+OVWXEsR0lgGcLfGKuVqiirC82x9W+Fx7VKxPAH9aMtsVplUE/hmA+cpxB+mG9mqe5EEdFMTCW1NFiuOhiV2UEIrjckYOt1d5DUDRx1hPovhPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775484917; c=relaxed/simple;
	bh=ukroTlAuuyL7iC83lhceMNrUFCFdBl7/DeXxFiCFBvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=L3+MYwLp2+firVcoKIvnTeUUOTW/UR+jgRdpclXbviDaXrWvDCTUMf0NjqL+WiZMNm1wTscM4yNpzsqLzjCIS5fDly9mc0hD/GnnYB/PqqvIq5x3vo3K5w5X1XbBqq0Z5yd1F0w4cVS7m6DeRYjMup4T4UjrqcT1kL02P57MTOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcYJUk3n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcYJUk3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04AFC2BC9E;
	Mon,  6 Apr 2026 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775484916;
	bh=ukroTlAuuyL7iC83lhceMNrUFCFdBl7/DeXxFiCFBvI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=DcYJUk3nSU0zJLdmKjhLze+nFs+4TQGxzCmJR0zfoC0XIUhfRPtMUpdjqLErPDg5B
	 XM16GxuHGe41pzmcGHCdXmGwGl+PuhdVFVQQl1wzaNJNfmnGBRMmIv7cEYTPv9srUx
	 3WkzpSrnGKniGMdnrWsZw/vhpdaomqo38noB/aMnhRCDicYslfgv8MEgNVPCaNQH++
	 vxSExVALfXdX0hb7sRJ0mPSaue6WyJJIyiwhgdnhuvDsk9pbsUkhBGZ8YObAROwLiD
	 zuxJQoXqztu/Bmzn6PiRdbon9ZoM6LTYIpDBoiLg12MnWFueNgEkI6XJTRbA+Yfm9m
	 L9zhLXzv+gXzw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 16:15:12 +0200
Message-Id: <DHM4VGI9GKGB.25R8KA5F89JA@kernel.org>
Subject: Re: [PATCH v4 1/9] driver core: Don't let a device probe until it's
 ready
Cc: "Doug Anderson" <dianders@chromium.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Alan Stern" <stern@rowland.harvard.edu>, "Saravana
 Kannan" <saravanak@kernel.org>, "Christoph Hellwig" <hch@lst.de>, "Eric
 Dumazet" <edumazet@google.com>, "Johan Hovold" <johan@kernel.org>, "Leon
 Romanovsky" <leon@kernel.org>, "Alexander Lobakin"
 <aleksander.lobakin@intel.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>,
 "Robin Murphy" <robin.murphy@arm.com>, <stable@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <DHLITCTY913U.J59JSQOVL0NH@kernel.org>
 <CAD=FV=Wgw7kU+Xse6dwjE+U06_A_tWcA93UXu6TTf0Erh+Mt8Q@mail.gmail.com>
 <2026040606-brewery-veteran-e013@gregkh>
In-Reply-To: <2026040606-brewery-veteran-e013@gregkh>

On Mon Apr 6, 2026 at 8:39 AM CEST, Greg Kroah-Hartman wrote:
> On Sun, Apr 05, 2026 at 03:39:26PM -0700, Doug Anderson wrote:
>> Thanks! I'm happy to resend a new version if need be, but I'm also
>> happy if you want to make changes when applying.
>
> New version is always best :)

Yeah, a new version sounds good -- thanks Doug!
